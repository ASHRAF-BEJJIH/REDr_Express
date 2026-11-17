import { ComparisonOperator } from "./src/core/queryBuilder/constants/comparisonOperator.js";
import { SortDirection } from "./src/core/queryBuilder/constants/sortDirection.js";
import { database, userRepository } from "./src/core/container.js";
import { QueryBuilder } from "./src/core/queryBuilder/builders/queryBuilder.js";
// function divide(a, b) {
//     if (b === 0) {
//         throw new Error("Division par zéro impossible");
//     }

//     return a / b;
// }



// try {
//     divide(10, 9);
//     console.log("hello world")
// } catch (error) {
//     console.log("Une erreur est survenue "+error.message);
// } 
// console.log(LogicalOperator.AND)
// const { sql, params } = new QueryBuilder().select(["*"]).
//     from("cars")
//     // .where({})
//     .where({
//         status: "available",
//         age: {
//             operator: ComparisonOperator.GT,
//             value: 12
//         }
//     }).orWhere({
//         price: 120
//     }).andWhereGroup(
//         group => group.where({
//             brand: "BMW"
//         }).orWhere({
//             brand: "Mercedes"
//         })
//     ).orderBy({
//         price : SortDirection.ASC,
//         age : SortDirection.DESC
//     })
//     .build()
// const query = "select * from users where status = ? AND age > 12 OR price = ? ";
// console.log(` sql : ${sql},\n params : ${params}`)
// // console.log(`${null}`)

// const obj = {
//     status: "available",
//     age: {
//         operator: ">",
//         value: 12
//     },
//     price: {
//         operator: "=",
//         value: 120
//     },
//     model: {
//         operator: "IN",
//         value: ["BMW", "Mercedes"]
//     },
//     brand: {
//         operator: "LIKE",
//         value: "%B%"
//     }
// }

// Object.entries(obj).forEach(([key, value]) => {
//     let operator = "=";
//     let val = value;
//     if (typeof value === "object" && value.operator && value.value !== undefined) {
//         operator = value.operator;
//         val = value.value;
//     }
//     console.log(`${key}: ${operator} ${val}`);
// })
const func = async () => {
    try {
        const users = await userRepository.findAll({
            where:
                /**@param  {QueryBuilder} builder*/
                builder => builder.where({ account_status: "PENDING" }).orWhere({ failed_login_attempts: { operator: ComparisonOperator.GT, value: 10 } })
                    .andWhereGroup(group => group.where({ role: "CLIENT" }).orWhere({ role: "AGENCY_MANAGER" }))
        })
        
        console.log(users)
    } catch (err) {
        console.log(err)
    } finally {
        database.closePool()
    }
}
// console.log(Object.entries({}))
func()