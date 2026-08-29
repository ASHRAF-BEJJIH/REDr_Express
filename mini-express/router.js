export class Router {


    constructor() {

        this.stack = [];

    }


    /*
     * ========================================
     * USE
     * ========================================
     */

    use(path, handler) {

        /*
         * app.use(handler)
         */

        if (typeof path === "function") {

            handler = path;
            path = "/";

        }


        this.stack.push({

            type: "middleware",

            path,

            handler

        });


        return this;

    }


    /*
     * ========================================
     * GET
     * ========================================
     */

    get(path, handler) {

        this.stack.push({

            type: "route",

            method: "GET",

            path,

            handler

        });


        return this;

    }


    /*
     * ========================================
     * POST
     * ========================================
     */

    post(path, handler) {

        this.stack.push({

            type: "route",

            method: "POST",

            path,

            handler

        });


        return this;

    }


    /*
     * ========================================
     * PUT
     * ========================================
     */

    put(path, handler) {

        this.stack.push({

            type: "route",

            method: "PUT",

            path,

            handler

        });


        return this;

    }


    /*
     * ========================================
     * DELETE
     * ========================================
     */

    delete(path, handler) {

        this.stack.push({

            type: "route",

            method: "DELETE",

            path,

            handler

        });


        return this;

    }


    /*
     * ========================================
     * MOUNT ROUTER
     * ========================================
     */

    mount(prefix, router) {

        for (const layer of router.stack) {

            let newPath = prefix;


            if (layer.path !== "/") {

                newPath += layer.path;

            }


            this.stack.push({

                ...layer,

                path: newPath

            });

        }

    }


    /*
     * ========================================
     * HANDLE REQUEST
     * ========================================
     */

    async handle(req, res) {

        let index = 0;


        /*
         * URL sans query
         */

        const pathname =
            req.url.split("?")[0];


        /*
         * Fonction next()
         */

        const next = async (error) => {


            /*
             * Toutes les couches ont été parcourues
             */

            if (index >= this.stack.length) {


                /*
                 * Une erreur existe
                 */

                if (error) {

                    res.status(500).json({

                        error:
                            "Internal Server Error",

                        message:
                            error.message

                    });

                    return;

                }


                /*
                 * Aucune route trouvée
                 */

                if (!res.writableEnded) {

                    res.status(404).json({

                        error: "Not Found"

                    });

                }

                return;

            }


            /*
             * Récupérer la couche suivante
             */

            const layer =
                this.stack[index];


            index++;


            /*
             * ====================================
             * ERROR HANDLER
             * ====================================
             */

            if (error) {

                /*
                 * Un error middleware possède
                 * 4 paramètres
                 */

                if (
                    layer.type === "middleware" &&
                    layer.handler.length === 4
                ) {

                    await layer.handler(
                        error,
                        req,
                        res,
                        next
                    );

                    return;

                }


                /*
                 * Ce middleware ne gère pas
                 * les erreurs.
                 */

                await next(error);

                return;

            }


            /*
             * ====================================
             * MIDDLEWARE
             * ====================================
             */

            if (layer.type === "middleware") {


                /*
                 * Vérifier le préfixe
                 */

                if (
                    !pathname.startsWith(
                        layer.path
                    )
                ) {

                    await next();

                    return;

                }


                try {

                    await layer.handler(
                        req,
                        res,
                        next
                    );

                } catch (err) {

                    await next(err);

                }


                return;

            }


            /*
             * ====================================
             * ROUTE
             * ====================================
             */

            if (layer.type === "route") {


                /*
                 * Méthode HTTP
                 */

                if (
                    layer.method !== req.method
                ) {

                    await next();

                    return;

                }


                /*
                 * Matcher le chemin
                 */

                const match =
                    matchPath(
                        layer.path,
                        pathname
                    );


                /*
                 * Route différente
                 */

                if (!match) {

                    await next();

                    return;

                }


                /*
                 * Ajouter les paramètres
                 */

                req.params =
                    match.params;


                /*
                 * Parser le body
                 */

                if (
                    req.method === "POST" ||
                    req.method === "PUT"
                ) {

                    try {

                        await req.parseBody();

                    } catch (err) {

                        await next(err);

                        return;

                    }

                }


                /*
                 * Exécuter le controller
                 */

                try {

                    await layer.handler(
                        req,
                        res,
                        next
                    );

                } catch (err) {

                    await next(err);

                }


                return;

            }


            await next();

        };


        /*
         * Commencer la chaîne
         */

        await next();

    }

}


/*
 * ========================================
 * PATH MATCHER
 * ========================================
 */

function matchPath(
    routePath,
    requestPath
) {

    /*
     * /
     */

    if (routePath === requestPath) {

        return {

            params: {}

        };

    }


    /*
     * Séparer les segments
     */

    const routeParts =
        routePath
            .split("/")
            .filter(Boolean);


    const requestParts =
        requestPath
            .split("/")
            .filter(Boolean);


    /*
     * Nombre de segments différent
     */

    if (
        routeParts.length !==
        requestParts.length
    ) {

        return null;

    }


    const params = {};


    for (
        let i = 0;
        i < routeParts.length;
        i++
    ) {

        const routePart =
            routeParts[i];


        const requestPart =
            requestParts[i];


        /*
         * :id
         */

        if (
            routePart.startsWith(":")
        ) {

            const paramName =
                routePart.substring(1);


            params[paramName] =
                requestPart;

            continue;

        }


        /*
         * Segment différent
         */

        if (
            routePart !== requestPart
        ) {

            return null;

        }

    }


    return {

        params

    };

}