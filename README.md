# 🛒 E-commerce Checkout Conversion Analysis

## 📌 Project Overview

This project analyzes user behavior in an e-commerce platform to identify drop-off points in the purchase journey and propose solutions to improve checkout conversion.

The analysis focuses on the user funnel:
**View → Add to Cart → Purchase**

---

## 🎯 Business Problem

A large number of users browse products but do not complete purchases.

This leads to:

* Low checkout conversion rate
* High cart abandonment
* Revenue loss

👉 Goal: Identify where users drop off and understand behavioral patterns to improve conversion.

---

## 📊 Dataset

* Source: RetailRocket E-commerce Dataset (Kaggle)
* File used: `events.csv`
* Type: Event-based clickstream data

### Data Structure

| Column          | Description                                |
| --------------- | ------------------------------------------ |
| event_timestamp | Time of user action (Unix ms)              |
| visitor_id      | Unique user ID                             |
| event_type      | User action (view, addtocart, transaction) |
| item_id         | Product ID                                 |
| transaction_id  | Transaction ID (if purchase occurs)        |

---

## ⚙️ Tools Used

* SQL (MySQL Workbench)
* Tableau (for visualization - optional)

---

## 🧩 Data Preparation

### Data Loading

The dataset was imported into a local MySQL database using:

```sql
LOAD DATA LOCAL INFILE ...
```

This approach simulates a real-world environment where analysts work with structured databases instead of flat files.

---

## 🔍 Data Understanding

### Dataset Overview

* Total records: **[replace with your result]**
* Unique users: **[replace]**
* Unique products: **[replace]**

### Event Types

The dataset includes three key user actions:

* `view`: user views a product
* `addtocart`: user adds product to cart
* `transaction`: user completes purchase

👉 These events form a complete e-commerce funnel.

---

### Behavioral Distribution

Most user actions are **views**, while significantly fewer proceed to cart and purchase.

👉 This indicates a natural drop-off in the funnel and highlights potential friction points in the user journey.

---

## 📈 Funnel Analysis

### SQL Query

```sql
SELECT 
    COUNT(DISTINCT CASE WHEN event_type = 'view' THEN visitor_id END) AS view_users,
    COUNT(DISTINCT CASE WHEN event_type = 'addtocart' THEN visitor_id END) AS cart_users,
    COUNT(DISTINCT CASE WHEN event_type = 'transaction' THEN visitor_id END) AS purchase_users
FROM events;
```

---

### Funnel Result

| Stage       | Users |
| ----------- | ----- |
| View        | X     |
| Add to Cart | X     |
| Purchase    | X     |

---

### Key Insight

* Significant drop-off occurs between **[view → cart / cart → purchase]**
* Indicates potential issues in:

  * Product attractiveness
  * Pricing
  * Checkout experience

---

## 🛑 Abandoned Cart Analysis

### SQL Query

```sql
SELECT COUNT(DISTINCT visitor_id)
FROM events
WHERE event_type = 'addtocart'
AND visitor_id NOT IN (
    SELECT DISTINCT visitor_id
    FROM events
    WHERE event_type = 'transaction'
);
```

---

### Insight

A large number of users add items to cart but do not complete the purchase.

👉 This suggests:

* Checkout friction
* Lack of trust or urgency
* Payment or UX issues

---

## ⏱️ Time-Based Analysis

### SQL Query

```sql
SELECT 
    DATE(FROM_UNIXTIME(event_timestamp / 1000)) AS event_date,
    COUNT(*) AS total_events
FROM events
GROUP BY event_date
ORDER BY event_date;
```

---

### Insight

User activity varies by time, indicating potential peak hours for engagement and conversion optimization.

---

## 💡 Recommendations

Based on the analysis, the following improvements are suggested:

* Improve product page UX to increase add-to-cart rate
* Optimize checkout process (reduce friction)
* Add trust signals (reviews, guarantees)
* Implement retargeting for abandoned carts

---

## 📌 Conclusion

This project demonstrates how event-based user data can be used to:

* Build conversion funnels
* Identify drop-off points
* Generate actionable business insights

👉 The approach reflects real-world data analysis workflows used in e-commerce platforms.

---

## 📁 Project Structure

```
ecommerce-checkout-conversion-analysis/
│
├── README.md
├── sql/
│   ├── data_setup.sql
│   ├── data_understanding.sql
│   ├── funnel_analysis.sql
│
├── images/
│   ├── funnel_result.png
│   ├── event_distribution.png
│
└── dashboard/
    └── tableau_dashboard.png
```
