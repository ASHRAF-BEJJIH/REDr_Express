import { parse } from "url";


export function enhanceRequest(req) {

    /*
     * ---------------------------
     * QUERY
     * ---------------------------
     */

    const parsedUrl = parse(
        req.url,
        true
    );

    req.query = parsedUrl.query;


    /*
     * ---------------------------
     * BODY
     * ---------------------------
     */

    req.body = undefined;


    /*
     * ---------------------------
     * PARAMS
     * ---------------------------
     */

    req.params = {};


    /*
     * ---------------------------
     * Read JSON body
     * ---------------------------
     */

    req.parseBody = function () {

        return new Promise(
            (resolve, reject) => {

                let data = "";


                req.on("data", chunk => {

                    data += chunk.toString();

                });


                req.on("end", () => {

                    if (!data) {

                        req.body = {};

                        resolve({});

                        return;
                    }


                    try {

                        req.body = JSON.parse(data);

                        resolve(req.body);

                    } catch (error) {

                        reject(error);

                    }

                });


                req.on("error", error => {

                    reject(error);

                });

            }
        );

    };

}