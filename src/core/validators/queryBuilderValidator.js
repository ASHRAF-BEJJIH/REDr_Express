import { ComparisonOperator } from "../constants/comparisonOperator.js";
import { SortDirection } from "../constants/sortDirection.js";

export function validateSelect(columns) {
    if (!Array.isArray(columns) || columns.length === 0) {
        throw new Error(
            "select() expects a non-empty array."
        );
    }
}

export function validateTable(table) {
    if (!table || typeof table !== "string") {
        throw new Error(
            "from() expects a table name."
        );
    }
}

export function validateConditions(conditions) {
    if (!conditions || typeof conditions !== "object") {
        throw new Error(
            "Conditions must be an object."
        );
    }
}

export function validateLimit(value) {
    if (!Number.isInteger(value) || value < 0) {
        throw new Error(
            "limit() expects a non-negative integer."
        );
    }
}

export function validateOffset(value) {
    if (!Number.isInteger(value) || value < 0) {
        throw new Error(
            "offset() expects a non-negative integer."
        );
    }
}

export function validateOrderBy({ column, direction }) {
    if (!column || typeof column !== "string") {
        throw new Error(
            "orderBy() expects a column name.",
        );
    }

    if (!Object.values(SortDirection).includes(direction)) {
        throw new Error(
            `Invalid sort direction: ${direction}`
        );
    }
}

export function validateOperator(operator) {
    if (!Object.values(ComparisonOperator).includes(operator)) {
        throw new Error(
            `Invalid comparison operator: ${operator}`
        );
    }
}