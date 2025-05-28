

# **End to End Churn Analysis with| Power BI + SQL + Machine Learning**

This Power BI end-to-end churn analysis project is designed as a complete enterprise-grade portfolio project that covers ETL in SQL Server, data modeling and visualization in Power BI, and churn prediction using machine learning (Random Forest in Python). Here's the extracted overview based on your provided transcript:

---

**This project is about** developing a full-stack solution for **customer churn analysis** using  **Power BI** ,  **SQL** , and  **machine learning** . It replicates a telecom industry use case using real-world data, with a business goal to  **analyze churn patterns, identify key churn drivers** , and  **predict future churners** .

---

**Objectives of the project include:**

1. **Understand customer behavior** by analyzing churn vs. non-churn profiles.
2. **Build a robust ETL pipeline** using Microsoft SQL Server to prepare clean, production-ready data.
3. **Design a Power BI dashboard** with KPI visuals and slicers that support marketing and retention analysis.
4. **Predict customer churn** using a **Random Forest classifier** trained on historical data and visualized in Power BI.
5. **Create actionable churn personas** for future campaign targeting.

---

**Strategy followed:**

* **ETL Pipeline (SQL Server):**
  Created a database and tables using `SQL Server Management Studio`. Data was loaded from flat files into a staging table, cleaned using SQL (handling NULLs, type casting), and moved into a production table. Views were built for easier data segmentation (churned, joined, stayed).
* **Power BI Modeling & Visualization:**
  Connected Power BI to the SQL Server production table. Transformed data using Power Query (e.g., binning `MonthlyCharges` and `Tenure`, encoding churn as binary).
  Created measures (`Total Customers`, `Churn Rate`, etc.), and visualized churn distribution across demographics, services, geography, and more.
* **Churn Analysis Page:**
  Designed as a summary report with filters (e.g., gender, age group, mont][p][pou=[6z2azhly charges) and visuals (donut charts, stacked bars, tooltips with drilldown on churn reasons). Includes AI insights using Power BI Narratives.
* **Machine Learning with Python (Random Forest):365**
  Used a Random Forest classifier in Jupyter Notebook. Data preprocessing involved label encoding, train-test split, and feature importance analysis. Predictions were exported to CSV and re-integrated into Power BI to build **“Churn Prediction” profiles** for proactive outreach.

---

**Tips & Best Practices discussed:**

* Use **views** in SQL to simplify model logic and separate concerns.
* Apply **data transformation** (e.g., bucketing age/tenure, replacing NULLs) before loading into Power BI.
* Use **reference tables** instead of duplicates in Power BI to optimize refresh times.
  * if duplicated, that duplicate table will hit request to sql server.
* **Explicit DAX measures** are preferred over implicit ones for maintainability.
* Customize visuals using  **slicers** ,  **tooltips** , and **data bars** for better readability.
* Use **AI visuals like Narratives** as a guide, not a replacement, for human-driven insight.
* Always  **save your work incrementally** , especially in Power BI and Jupyter.

---

**Structure of the Project:**

1. **Data Engineering:**
   * SQL Server database setup
   * Raw → Staging → Production tables
   * Null handling and data cleaning
2. **Data Modeling & Visualization in Power BI:**
   * Import data from SQL Server
   * Create calculated columns & DAX measures
   * Build dynamic, filterable dashboards
3. **Predictive Modeling in Python:**
   * Feature encoding, model training (Random Forest)
   * Model evaluation via precision, recall, F1
   * Export predictions to CSV for BI integration
4. **Insight Generation:**
   * Filtered views by demographic and behavioral segments
   * Data-driven churn personas
   * Root-cause analysis using churn reason + category
