# 📘 PostgreSQL Data Types Notes

---

# 🔢 1. Numeric Data Types

Numeric data types are used to store numbers.

## 1. SERIAL

Used for **ID columns** that increase automatically.

### Features

- Auto-increment value
- Mostly used with Primary Key
- No need to insert ID manually

### Example

```sql
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);
```

Insert Data

```sql
INSERT INTO students(name)
VALUES ('Rahul');
```

Output

| id  | name  |
| --- | ----- |
| 1   | Rahul |

Next insert

```sql
INSERT INTO students(name)
VALUES ('Priya');
```

Output

| id  | name  |
| --- | ----- |
| 2   | Priya |

---

## 2. INTEGER

Stores **whole numbers only**.

### Use Cases

- Age
- Marks
- Quantity
- Population

### Example

```sql
CREATE TABLE products (
    quantity INTEGER
);
```

Valid Values

```
10
25
100
-15
```

Invalid

```
10.5
99.99
```

---

## 3. NUMERIC

Stores **exact decimal values**.

Use when every decimal digit is important.

### Use Cases

- Bank Balance
- Gold Weight
- Tax
- Scientific Calculations

### Example

```sql
CREATE TABLE accounts (
    balance NUMERIC
);
```

Values

```
25000.75
100.50
0.01
```

Example

```sql
SELECT 100.10::NUMERIC + 200.20::NUMERIC;
```

Output

```
300.30
```

✔ No rounding errors.

---

## 4. DOUBLE PRECISION

Stores **approximate decimal values**.

Very fast but small rounding errors may occur.

### Use Cases

- Temperature
- Distance
- Water Level
- Air Pressure

### Example

```sql
CREATE TABLE weather (
    temperature DOUBLE PRECISION
);
```

Values

```
25.678
101.234
99.876
```

---

## 📌 Numeric Type Quick Rules

| Situation           | Data Type        |
| ------------------- | ---------------- |
| Auto ID             | SERIAL           |
| Whole Number        | INTEGER          |
| Exact Decimal       | NUMERIC          |
| Approximate Decimal | DOUBLE PRECISION |

---

# 📅 2. DATE

Stores **only the date**.

Internal format

```
YYYY-MM-DD
```

### Example

```sql
SELECT '1980-11-20'::DATE;
```

Output

```
1980-11-20
```

PostgreSQL accepts many formats.

| Input             | Stored As  |
| ----------------- | ---------- |
| 1980-11-20        | 1980-11-20 |
| Nov-20-1980       | 1980-11-20 |
| 20-Nov-1980       | 1980-11-20 |
| November 20, 1980 | 1980-11-20 |

Example

```sql
SELECT 'November 20, 1980'::DATE;
```

Output

```
1980-11-20
```

### Use Cases

- Birthday
- Joining Date
- Exam Date

---

# ⏰ 3. TIME

Stores **only time**.

- No Date
- No Time Zone

### Example

```sql
SELECT '05:23 PM'::TIME;
```

Output

```
17:23:00
```

Examples

| Input    | Stored   |
| -------- | -------- |
| 01:23 AM | 01:23:00 |
| 05:23 PM | 17:23:00 |
| 20:34    | 20:34:00 |

### Use Cases

- School Timing
- Shop Opening Time
- Office Timing

---

# 🌍 4. TIME WITH TIME ZONE (TIMETZ)

Stores

- Time
- Time Zone

### Example

```sql
SELECT '01:23 AM EST'::TIMETZ;
```

Output

```
01:23:00-05
```

Another Example

```sql
SELECT '05:23 PM UTC'::TIMETZ;
```

Output

```
17:23:00+00
```

Examples

| Input        | Stored      |
| ------------ | ----------- |
| 01:23 AM EST | 01:23:00-05 |
| 05:23 PM PST | 17:23:00-08 |
| 05:23 PM UTC | 17:23:00+00 |

### Use Cases

- International Meetings
- Global Applications

---

# 📆 5. TIMESTAMP

Stores

- Date
- Time

No Time Zone.

### Example

```sql
SELECT '2026-07-09 10:30:00'::TIMESTAMP;
```

Output

```
2026-07-09 10:30:00
```

### Use Cases

- Login Time
- Order Time
- Attendance

---

# 🌎 6. TIMESTAMP WITH TIME ZONE (TIMESTAMPTZ)

Stores

- Date
- Time
- Time Zone

### Example

```sql
SELECT 'Nov-20-1980 05:23 PM PST'::TIMESTAMPTZ;
```

Output

```
1980-11-20 17:23:00-08
```

Another Example

```sql
SELECT 'Nov-20-1980 01:23 AM EST'::TIMESTAMPTZ;
```

Output

```
1980-11-20 01:23:00-05
```

### Use Cases

- Google Calendar
- Flight Booking
- International Events

---

# ⌛ 7. INTERVAL

Stores **duration (time difference)**.

### Example

```sql
SELECT '1 day'::INTERVAL;
```

Output

```
1 day
```

Another Example

```sql
SELECT '1 D 1 M 1 S'::INTERVAL;
```

Output

```
1 day 1 minute 1 second
```

More Examples

```sql
SELECT '3 days'::INTERVAL;
```

Output

```
3 days
```

```sql
SELECT '2 hours 30 minutes'::INTERVAL;
```

Output

```
02:30:00
```

### Use Cases

- Delivery Time
- Subscription Duration
- Event Duration

---

# 📝 Complete Summary

| Data Type          | Stores                  | Example                   | Best Used For      |
| ------------------ | ----------------------- | ------------------------- | ------------------ |
| `SERIAL`           | Auto-increment ID       | 1, 2, 3                   | Primary Key        |
| `INTEGER`          | Whole Numbers           | 25                        | Age, Quantity      |
| `NUMERIC`          | Exact Decimal           | 25000.75                  | Money, Gold        |
| `DOUBLE PRECISION` | Approximate Decimal     | 98.567                    | Temperature        |
| `DATE`             | Date Only               | 2026-07-09                | Birthday           |
| `TIME`             | Time Only               | 10:30:00                  | Office Timing      |
| `TIMETZ`           | Time + Time Zone        | 10:30:00+05:30            | Global Time        |
| `TIMESTAMP`        | Date + Time             | 2026-07-09 10:30:00       | Login Time         |
| `TIMESTAMPTZ`      | Date + Time + Time Zone | 2026-07-09 10:30:00+05:30 | International Apps |
| `INTERVAL`         | Duration                | 2 days 5 hours            | Time Difference    |

---

# 🎯 Easy Memory Trick

```
SERIAL
│
└── Auto ID

INTEGER
│
└── Whole Numbers

NUMERIC
│
└── Exact Decimal (Money)

DOUBLE PRECISION
│
└── Approximate Decimal (Measurements)

DATE
│
└── Date Only

TIME
│
└── Time Only

TIMETZ
│
└── Time + Time Zone

TIMESTAMP
│
└── Date + Time

TIMESTAMPTZ
│
└── Date + Time + Time Zone

INTERVAL
│
└── Duration / Time Difference
```

---

# ⭐ Interview Rule (Fast Revision)

| If...                                 | Use...             |
| ------------------------------------- | ------------------ |
| Need an ID                            | `SERIAL`           |
| Need a whole number                   | `INTEGER`          |
| Need accurate decimal (Money)         | `NUMERIC`          |
| Need decimal where tiny error is okay | `DOUBLE PRECISION` |
| Need only date                        | `DATE`             |
| Need only time                        | `TIME`             |
| Need time with timezone               | `TIMETZ`           |
| Need date and time                    | `TIMESTAMP`        |
| Need date, time and timezone          | `TIMESTAMPTZ`      |
| Need duration between two times       | `INTERVAL`         |
