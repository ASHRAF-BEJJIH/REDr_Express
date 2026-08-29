import http from "http";

export function express() {

    const routes = [];

    const app = {};

    app.get = function(path, handler) {

        routes.push({
            method: "GET",
            path,
            handler
        });

    };

    app.post = function(path, handler) {

        routes.push({
            method: "POST",
            path,
            handler
        });

    };

    app.listen = function(port, callback) {

        const server = http.createServer((req, res) => {

            const route = routes.find(route => {

                return (
                    route.method === req.method &&
                    route.path === req.url
                );

            });

            if (!route) {

                res.statusCode = 404;

                res.end("Not Found");

                return;
            }

            route.handler(req, res);

        });

        server.listen(port, callback);
    };

    return app;
}