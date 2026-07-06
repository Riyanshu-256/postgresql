# PostgreSQL Subqueries

## What is a Subquery?

A **subquery** (also called a **nested query**) is a SQL query written inside another SQL query.

- The **inner query** executes first.
- Its result is passed to the **outer query**.
- Used to filter, compare, or retrieve data.

---

# Syntax

```sql
SELECT column_name
FROM table_name
WHERE column_name operator (
    SELECT column_name
    FROM table_name
);
```

---

# Execution Order

```
Outer Query
     │
     ▼
Execute Inner Query
     │
     ▼
Return Result
     │
     ▼
Outer Query Uses the Result
```

### Example

```sql
SELECT name
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);
```

### Step 1

```sql
SELECT AVG(price)
FROM products;
```

Result

```
450
```

### Step 2

```sql
SELECT name
FROM products
WHERE price > 450;
```

---

# Types of Subqueries

| Type                  | Returns                | Commonly Used In |
| --------------------- | ---------------------- | ---------------- |
| Scalar Subquery       | Single value           | WHERE, SELECT    |
| Multiple Row Subquery | Multiple rows          | IN, ANY, ALL     |
| Correlated Subquery   | Depends on outer query | WHERE            |
| Subquery in FROM      | Temporary table        | FROM             |

---

# 1. Scalar Subquery

Returns **only one value**.

## Example

```sql
SELECT *
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);
```

### Dry Run

Products

| Name  | Price |
| ----- | ----: |
| Shirt |   600 |
| Shoes |   300 |
| Bag   |   450 |

Inner Query

```sql
SELECT AVG(price)
FROM products;
```

Result

```
450
```

Outer Query

```sql
SELECT *
FROM products
WHERE price > 450;
```

Output

| Name  | Price |
| ----- | ----: |
| Shirt |   600 |

---

# 2. Multiple Row Subquery

Returns **multiple rows**.

Works with:

- `IN`
- `ANY`
- `ALL`

## Example

```sql
SELECT *
FROM phones
WHERE manufacturer IN (
    SELECT manufacturer
    FROM phones
    WHERE price > 800
);
```

### Dry Run

Phones

| Manufacturer | Price |
| ------------ | ----: |
| Apple        |  1000 |
| Samsung      |   700 |
| Apple        |   900 |
| Xiaomi       |   400 |

Inner Query

```sql
SELECT manufacturer
FROM phones
WHERE price > 800;
```

Result

```
Apple
Apple
```

Outer Query

```sql
SELECT *
FROM phones
WHERE manufacturer IN ('Apple');
```

Output

| Manufacturer | Price |
| ------------ | ----: |
| Apple        |  1000 |
| Apple        |   900 |

---

# 3. Subquery in SELECT

Used to create an additional calculated column.

## Example

```sql
SELECT
    name,
    price,
    (SELECT AVG(price) FROM products) AS average_price
FROM products;
```

Output

| Name  | Price | Average Price |
| ----- | ----: | ------------: |
| Shirt |   600 |           450 |
| Shoes |   300 |           450 |
| Bag   |   450 |           450 |

---

# 4. Subquery in FROM

The subquery behaves like a **temporary table**.

## Example

```sql
SELECT MAX(avg_price)
FROM (
    SELECT AVG(price) AS avg_price
    FROM phones
    GROUP BY manufacturer
) AS p;
```

### Dry Run

Phones

| Manufacturer | Price |
| ------------ | ----: |
| Apple        |   900 |
| Apple        |  1000 |
| Samsung      |   500 |
| Samsung      |   700 |

Inner Query

```sql
SELECT AVG(price) AS avg_price
FROM phones
GROUP BY manufacturer;
```

Result

| avg_price |
| --------: |
|       950 |
|       600 |

Outer Query

```sql
SELECT MAX(avg_price)
FROM (
    SELECT AVG(price) AS avg_price
    FROM phones
    GROUP BY manufacturer
) AS p;
```

Output

```
950
```

---

# 5. Correlated Subquery

A correlated subquery **depends on the current row of the outer query**.

- Executes once for every row of the outer query.
- Usually slower than a normal subquery.

## Example

```sql
SELECT p1.name, p1.price
FROM products p1
WHERE p1.price > (
    SELECT AVG(p2.price)
    FROM products p2
    WHERE p2.department = p1.department
);
```

Meaning:

> Show products whose price is greater than the average price of their own department.

---

# Common Operators

## IN

Checks if a value exists in a list.

```sql
SELECT *
FROM products
WHERE department IN (
    SELECT department
    FROM products
    WHERE price > 500
);
```

---

## EXISTS

Returns **TRUE** if the subquery returns at least one row.

```sql
SELECT *
FROM products p
WHERE EXISTS (
    SELECT 1
    FROM phones ph
    WHERE ph.manufacturer = p.name
);
```

---

## ANY

Condition must be true for **at least one** value returned.

```sql
SELECT *
FROM phones
WHERE price > ANY (
    SELECT price
    FROM phones
    WHERE manufacturer = 'Samsung'
);
```

Example

Samsung prices

```
300
500
700
```

Equivalent to

```
price > 300
OR
price > 500
OR
price > 700
```

---

## ALL

Condition must be true for **every** value returned.

```sql
SELECT *
FROM phones
WHERE price > ALL (
    SELECT price
    FROM phones
    WHERE manufacturer = 'Samsung'
);
```

Equivalent to

```
price > 300
AND
price > 500
AND
price > 700
```

---

# Advantages

- Easy to understand.
- Avoids writing multiple queries.
- Useful with aggregate functions (`AVG()`, `MAX()`, `MIN()`, `COUNT()`).
- Can be used as a temporary table.
- Makes filtering dynamic.

---

# Disadvantages

- Correlated subqueries can be slow.
- Nested subqueries reduce readability.
- JOINs are often more efficient.

---

# Quick Revision

| Type         | Returns                | Example                            |
| ------------ | ---------------------- | ---------------------------------- |
| Scalar       | One value              | `price > (SELECT AVG(price))`      |
| Multiple Row | Many rows              | `IN (SELECT manufacturer ...)`     |
| SELECT       | Extra column           | `(SELECT AVG(price)) AS avg_price` |
| FROM         | Temporary table        | `FROM (SELECT ...) AS t`           |
| Correlated   | Depends on outer query | `WHERE dept = p1.department`       |

---

# Interview Definition

> **A subquery is a query written inside another SQL query. The inner query executes first, and its result is used by the outer query to filter, compare, or retrieve data.**
