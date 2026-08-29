export function enhanceResponse(res) {


    /*
     * ---------------------------
     * res.status()
     * ---------------------------
     */

    res.status = function (code) {

        res.statusCode = code;

        return res;

    };


    /*
     * ---------------------------
     * res.json()
     * ---------------------------
     */

    res.json = function (data) {

        res.setHeader(
            "Content-Type",
            "application/json"
        );


        res.end(
            JSON.stringify(data)
        );

    };


    /*
     * ---------------------------
     * res.send()
     * ---------------------------
     */

    res.send = function (data) {

        if (typeof data === "object") {

            res.setHeader(
                "Content-Type",
                "application/json"
            );

            res.end(
                JSON.stringify(data)
            );

            return;

        }


        res.setHeader(
            "Content-Type",
            "text/plain"
        );


        res.end(
            String(data)
        );

    };


    return res;

}