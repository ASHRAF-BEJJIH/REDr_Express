import express from "./mini-express/express.js";


const app = express();


/*
 * ========================================
 * GLOBAL MIDDLEWARE
 * ========================================
 */

app.use(
    (req, res, next) => {

        console.log(
            req.method,
            req.url
        );

        next();

    }
);


/*
 * ========================================
 * AUTH MIDDLEWARE
 * ========================================
 */

app.use(
    (req, res, next) => {

        console.log(
            "Authentication middleware"
        );

        next();

    }
);


/*
 * ========================================
 * GET /
 * ========================================
 */

app.get(
    "/",
    (req, res) => {

        res.json({

            message:
                "Bienvenue dans MiniExpress"

        });

    }
);


/*
 * ========================================
 * GET /users
 * ========================================
 */

app.get(
    "/users",
    (req, res) => {

        res.json({

            users: [

                {
                    id: 1,
                    name: "Mohamed"
                },

                {
                    id: 2,
                    name: "Ahmed"
                }

            ]

        });

    }
);


/*
 * ========================================
 * GET /users/:id
 * ========================================
 */

app.get(
    "/users/:id",
    (req, res) => {

        const id =
            req.params.id;


        res.json({

            message:
                "Utilisateur trouvé",

            id

        });

    }
);


/*
 * ========================================
 * GET /search
 * ========================================
 */

app.get(
    "/search",
    (req, res) => {

        console.log(req.query);


        res.json({

            query:
                req.query

        });

    }
);


/*
 * ========================================
 * POST /users
 * ========================================
 */

app.post(
    "/users",
    (req, res) => {

        console.log(
            "BODY:",
            req.body
        );


        res
            .status(201)
            .json({

                message:
                    "Utilisateur créé",

                data:
                    req.body

            });

    }
);


/*
 * ========================================
 * ROUTER
 * ========================================
 */

const carRouter =
    express.Router();


carRouter.get(
    "/",
    (req, res) => {

        res.json({

            cars: [

                {
                    id: 1,
                    brand: "Toyota"
                },

                {
                    id: 2,
                    brand: "BMW"
                }

            ]

        });

    }
);


carRouter.get(
    "/:id",
    (req, res) => {

        res.json({

            id:
                req.params.id,

            message:
                "Car found"

        });

    }
);


app.use(
    "/cars",
    carRouter
);


/*
 * ========================================
 * ERROR TEST
 * ========================================
 */

app.get(
    "/error",
    (req, res) => {

        throw new Error(
            "Something went wrong"
        );

    }
);


/*
 * ========================================
 * ERROR HANDLER
 * ========================================
 */

app.use(
    (
        error,
        req,
        res,
        next
    ) => {

        console.error(
            "ERROR:",
            error.message
        );


        res
            .status(500)
            .json({

                error:
                    error.message

            });

    }
);


/*
 * ========================================
 * SERVER
 * ========================================
 */

app.listen(
    3000,
    () => {

        console.log(
            "MiniExpress running on http://localhost:3000"
        );

    }
);