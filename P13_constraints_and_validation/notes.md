# 📘 PostgreSQL Constraints

Constraints are rules that PostgreSQL applies to table columns to ensure the data stored in the database is **valid, accurate, and consistent**.

Without constraints, users can insert invalid or duplicate data, which may lead to incorrect results and data inconsistency.

For example:

- A student's age should not be negative.
- Two users should not have the same email address.
- A product's price should always be greater than zero.

Constraints help solve these problems automatically.

---

# 📚 Table of Contents

- NOT NULL
- DEFAULT
- UNIQUE
- Multi-Column UNIQUE
- CHECK
- CHECK on Multiple Columns
- Best Practices

---

# 1️⃣ NOT NULL Constraint

## What is NOT NULL?

By default, PostgreSQL allows a column to store `NULL`, which means **no value**.

If a column should always contain a value, we use the **NOT NULL** constraint.

This ensures that every new row must provide a value for that column. If no value is provided, PostgreSQL throws an error.

---

## Syntax

```sql
column_name data_type NOT NULL
```

---

## Example

```sql
CREATE TABLE users (

    id SERIAL PRIMARY KEY,

    name VARCHAR(50) NOT NULL,

    age INTEGER
);
```

---

## Valid Insert

```sql
INSERT INTO users(name, age)
VALUES ('Rahul', 22);
```

Output

| id  | name  | age |
| --- | ----- | --- |
| 1   | Rahul | 22  |

---

## Invalid Insert

```sql
INSERT INTO users(age)
VALUES (22);
```

Output

```
ERROR:
null value in column "name"
violates not-null constraint
```

---

## Important Points

- Prevents `NULL` values.
- Does **not** prevent empty strings (`''`).
- Commonly used for names, emails, passwords, etc.

---

# 2️⃣ DEFAULT Constraint

## What is DEFAULT?

The **DEFAULT** constraint automatically inserts a predefined value when no value is supplied during insertion.

Instead of storing `NULL`, PostgreSQL inserts the default value.

This reduces repetitive work and keeps data consistent.

---

## Syntax

```sql
column_name data_type DEFAULT value
```

---

## Example

```sql
CREATE TABLE users (

    id SERIAL PRIMARY KEY,

    is_admin BOOLEAN DEFAULT FALSE
);
```

---

## Insert

```sql
INSERT INTO users
DEFAULT VALUES;
```

Output

| id  | is_admin |
| --- | -------- |
| 1   | false    |

---

## Another Example

```sql
CREATE TABLE products (

    name VARCHAR(50),

    price INTEGER DEFAULT 0
);
```

If price isn't provided,

```
Price = 0
```

is inserted automatically.

---

## Important Points

- Saves time during insertion.
- Prevents unnecessary NULL values.
- Can be used with numbers, text, dates, timestamps, and boolean values.

---

# 3️⃣ UNIQUE Constraint

## What is UNIQUE?

The **UNIQUE** constraint ensures that duplicate values cannot be stored in a column.

Every value in that column must be different.

This is commonly used for fields like email, username, phone number, etc.

---

## Syntax

```sql
column_name data_type UNIQUE
```

---

## Example

```sql
CREATE TABLE users (

    id SERIAL PRIMARY KEY,

    email VARCHAR(100) UNIQUE
);
```

---

## Valid Data

```
abc@gmail.com

xyz@gmail.com
```

---

## Invalid Data

```
abc@gmail.com

abc@gmail.com
```

Output

```
ERROR:
duplicate key value violates unique constraint
```

---

## Common Use Cases

- Email
- Username
- Phone Number
- Aadhaar Number

---

# 4️⃣ Multi-Column UNIQUE

## What is Multi-Column UNIQUE?

Sometimes one column can contain duplicate values, but the **combination of multiple columns** must be unique.

In such cases, PostgreSQL allows us to create a UNIQUE constraint on multiple columns.

---

## Example

```sql
CREATE TABLE students (

    first_name VARCHAR(50),

    last_name VARCHAR(50),

    UNIQUE(first_name, last_name)
);
```

Here,

- `Rahul Sharma` can exist only once.
- `Rahul Verma` is allowed.
- `Amit Sharma` is allowed.

---

## Allowed

| First Name | Last Name |
| ---------- | --------- |
| Rahul      | Sharma    |
| Rahul      | Verma     |
| Amit       | Sharma    |

---

## Not Allowed

| First Name | Last Name |
| ---------- | --------- |
| Rahul      | Sharma    |
| Rahul      | Sharma    |

---

## Important Points

- Individual columns can repeat.
- Only the combination must be unique.

```
Rahul + Sharma ❌ Duplicate

Rahul + Verma ✅ Allowed
```

---

```

This style is much more readable than dense notes while still explaining the concepts clearly. It's ideal for a GitHub repository and interview revision. Continue the remaining sections (`CHECK`, `PRIMARY KEY`, `FOREIGN KEY`, etc.) in the same pattern for consistency.
```
