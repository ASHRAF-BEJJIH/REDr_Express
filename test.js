import { ComparisonOperator } from "./src/core/constants/comparisonOperator.js";
import { SortDirection } from "./src/core/constants/sortDirection.js";
import { QueryBuilder } from "./src/core/QueryBuilder.js";
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
const { sql, params } = new QueryBuilder().select(["*"]).
    from("cars")
    .where({})
    // .where({
    //     status: "available",
    //     age: {
    //         operator: ComparisonOperator.GT,
    //         value: 12
    //     }
    // }).orWhere({
    //     price: 120
    // }).andWhereGroup(
    //     group => group.where({
    //         brand: "BMW"
    //     }).orWhere({
    //         brand: "Mercedes"
    //     })
    // ).orderBy({
    //     price : SortDirection.ASC,
    //     age : SortDirection.DESC
    // })
    .build()
const query = "select * from users where status = ? AND age > 12 OR price = ? ";
console.log(` sql : ${sql},\n params : ${params}`)
// console.log(`${null}`)


