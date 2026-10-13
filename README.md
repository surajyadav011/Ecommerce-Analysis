# E-Commerce Sales Performance Analysis

An end-to-end data analytics project combining **Python (Pandas, NumPy), MySQL, and Power BI** to clean e-commerce order data, engineer sales metrics, query business performance, and present findings in an interactive dashboard.

> **Project scope:** The uploaded materials demonstrate a Python data-cleaning workflow, MySQL analysis queries, and a Power BI dashboard. The source workbook used by the notebook was not included, so the complete pipeline has not been rerun end-to-end in this repository.

## Dashboard Preview

![E-Commerce Sales Analysis Dashboard](images/powerbi_dashboard.png)

The dashboard screenshot shows KPI cards for Total Sales, Total Profit, Total Orders, and Average Order Value; monthly sales; sales by payment mode, order status, product, and category; profit by category; location visualization; and Month, City, and Payment Mode slicers.

## Tech Stack

- **Python:** Pandas, NumPy
- **SQL:** MySQL
- **Business Intelligence:** Power BI, DAX
- **Data workflow:** Jupyter Notebook, SQLAlchemy, PyMySQL

## Workflow

1. **Inspect the data** — check shape, column types, summary statistics, missing values, and duplicates.
2. **Clean and standardize** — remove duplicates, normalize string fields, parse dates, coerce numeric columns, and filter invalid quantities.
3. **Engineer metrics** — calculate gross sales, net amount after discount, estimated profit, order month, year, and weekday.
4. **Export and load** — export a cleaned CSV and load the DataFrame into a local MySQL `orders` table.
5. **Query business performance** — calculate overall sales and order counts, product and city rankings, monthly sales, product profit, payment-mode distribution, and cancelled orders.
6. **Visualize** — explore high-level KPIs and sales breakdowns in Power BI.

## Repository Structure

```text
ecommerce-sales-performance/
├── data/
│   └── README.md                       # Dataset placement and privacy notes
├── docs/
│   └── data-quality-notes.md           # Cleaning logic, assumptions, limitations
├── images/
│   ├── powerbi_dashboard.png           # Dashboard screenshot
│   ├── python_data_preparation.png     # Notebook screenshot
│   └── mysql_queries.png               # SQL screenshot
├── notebooks/
│   └── ecommerce_sales_cleaning.ipynb  # Python cleaning and MySQL-loading workflow
├── powerbi/
│   ├── ecommerce_sales_dashboard.pbix  # Power BI Desktop report
│   └── README.md
├── sql/
│   └── ecommerce_sales_analysis.sql    # Business analysis queries
├── .gitignore
├── LICENSE
├── README.md
└── requirements.txt
```

## Dashboard Highlights

- **KPI cards:** Total Sales, Total Profit, Total Orders, Average Order Value
- **Trend analysis:** Sales by month
- **Product and category analysis:** Sales by product and category; profit by category
- **Operational breakdowns:** Order status and payment mode
- **Geographic view:** Map visual
- **Interactive filters:** Month, City, Payment Mode

The figures visible in the screenshot are display values, not independently audited results. Recalculate and validate them against the final cleaned dataset and Power BI model before using them in formal reporting.

## Setup

### 1. Clone the repository

```bash
git clone https://github.com/surajyadav011/PowerBI-Ecommerce-Analysis.git
cd PowerBI-Ecommerce-Analysis
```

### 2. Create a Python environment

Windows:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install -r requirements.txt
```

macOS/Linux:

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
pip install -r requirements.txt
```

### 3. Add the source workbook

Place your licensed, privacy-reviewed input workbook at `data/Ecommerce_Unclean_Project.xlsx`. The notebook currently expects `Ecommerce_Unclean_Project.xlsx` in its working directory; either run the notebook from the directory containing the file or update the path to `../data/Ecommerce_Unclean_Project.xlsx`.

The raw workbook is not included because it was not part of the supplied files. Do not commit real customer names, email addresses, phone numbers, or other personal data to a public repository.

### 4. Configure MySQL

Create the `ecommerce` database in MySQL, then configure the connection using environment variables before running the notebook.

PowerShell example:

```powershell
$env:ECOMMERCE_DB_USER = "root"
$env:ECOMMERCE_DB_PASSWORD = "your-local-password"
$env:ECOMMERCE_DB_HOST = "localhost"
$env:ECOMMERCE_DB_PORT = "3306"
$env:ECOMMERCE_DB_NAME = "ecommerce"
jupyter notebook
```

For macOS/Linux, use `export VARIABLE=value` for the same variables.

### 5. Run the notebook and SQL queries

Open `notebooks/ecommerce_sales_cleaning.ipynb` in Jupyter and execute the cells in order. Once the `orders` table is loaded, run `sql/ecommerce_sales_analysis.sql` in MySQL Workbench or another MySQL client.

### 6. Open the Power BI report

Open `powerbi/ecommerce_sales_dashboard.pbix` in Power BI Desktop. Verify any data-source prompts and refresh the model after the data is available.

## Data Cleaning and Metric Definitions

The provided notebook performs duplicate removal, whitespace cleanup, basic email filtering, date parsing, numeric conversion, positive-quantity filtering, and missing-value handling.

Current feature definitions:

| Feature | Formula |
|---|---|
| `Sales` | `Qty × Unit_Price` |
| `Net_Amount` | `Sales − (Sales × Discount / 100)` |
| `Profit` | `Net_Amount × 0.20` |
| `Month` | Month name derived from `Order_Date` |
| `Year` | Year derived from `Order_Date` |
| `Weekday` | Weekday name derived from `Order_Date` |

**Metric caveat:** The submitted notebook estimates profit as 20% of net amount. It does not derive profit from product costs, shipping, returns, or operating expenses, so treat it as an assumed-margin estimate rather than verified business profit. The SQL monthly query includes year to avoid combining the same named month across multiple years.

More notes are in [data-quality-notes.md](docs/data-quality-notes.md).

## Example Business Questions

- What is total net sales?
- Which products and cities contribute the most sales?
- How does sales performance vary by month and year?
- Which products have the highest estimated profit under the stated margin assumption?
- How are orders distributed across payment modes?
- How many orders are marked as cancelled?

## Limitations and Next Improvements

- The original input workbook was not provided, so the notebook cannot be executed from a clean clone without adding the data file.
- The email check only verifies that a value contains `@`; it is not full email validation.
- Filling missing delivery dates with order dates can hide unknown delivery outcomes; preserve a missing-value flag for robust logistics analysis.
- A flat 20% profit assumption should be replaced with defensible cost or margin data.
- For multi-year data, sort monthly categories by a true date key rather than month-name text.
- Add a data dictionary, automated validation checks, and an auditable KPI reconciliation between Python, SQL, and Power BI.
- Export a sanitized sample dataset or synthetic fixture so the pipeline can be demonstrated without exposing personal data.

## Tutorial Reference

The project was developed with reference to this YouTube tutorial: [E-commerce analysis project](https://youtu.be/0AZV8Uff5Ic).

The repository documents the files supplied for this project; the tutorial is a reference and is not a substitute for validating the code and metrics.

## Author

**Suraj Yadav**  
B.Tech AIML Student | Data Analytics, Business Intelligence, and Data Engineering

- GitHub: [@surajyadav011](https://github.com/surajyadav011)

---

If you use or adapt this project, retain attribution and verify all assumptions against your own dataset.
