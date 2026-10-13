# E-Commerce Analysis

An end-to-end analytics project exploring e-commerce order data through **Jupyter Notebook, Python, Pandas, NumPy, MySQL, and Power BI**. It brings together data preparation, feature engineering, SQL aggregations, and an interactive dashboard in one portfolio project.

> **Reproducibility note:** The repository currently contains a small sample CSV, not the full source workbook or full cleaned dataset. The notebook expects `data/Ecommerce_Unclean_Project.xlsx`. Add a licensed, privacy-reviewed source workbook before running the complete workflow from a fresh clone.

## Dashboard Preview

![Original E-Commerce Sales Analysis dashboard screenshot](dashboard/dashboard.png)

The image above is the original dashboard screenshot supplied for this project and stored unchanged in `dashboard/dashboard.png`. The editable Power BI report is available at `dashboard/ecommerce_sales_dashboard.pbix`.

The supplied dashboard displays KPI cards for total sales, total profit, total orders, and average order value, alongside monthly sales, payment-mode and order-status breakdowns, product/category comparisons, profit by category, a location visual, and slicers for month, city, and payment mode. These are descriptions of the supplied report, not independently audited business results.

## Project Objectives

- Prepare order data by handling duplicates, missing values, data types, and basic quality checks.
- Engineer sales metrics and calendar attributes for analysis.
- Use MySQL to aggregate sales by product, city, month, and payment mode.
- Present sales and order patterns in a Power BI dashboard.
- Document metric assumptions and data limitations so results are interpreted responsibly.

## Technology Stack

| Tool | Role in the project |
|---|---|
| Jupyter Notebook | Step-by-step exploration and data preparation |
| Python, Pandas, NumPy | Cleaning, type conversion, and feature engineering |
| MySQL | Aggregation and business-analysis queries |
| Power BI | KPI cards, charts, slicers, and dashboard reporting |

## Repository Structure

```text
E-Commerce-Analysis/
├── dashboard/
│   ├── dashboard.png
│   ├── ecommerce_sales_dashboard.pbix
│   └── README.md
├── data/
│   ├── sample_ecommerce.csv
│   └── README.md
├── docs/
│   └── data-quality-notes.md
├── python/
│   ├── project_end.ipynb
│   ├── data_cleaning.py
│   ├── pandas_query.png
│   └── README.md
├── sql/
│   ├── ecommerce_sales_analysis.sql
│   ├── mysql_queries.png
│   └── README.md
├── requirements.txt
├── .gitignore
├── LICENSE
└── README.md
```

## Getting Started

### 1. Requirements

Install Python and Jupyter, and have MySQL Workbench and Power BI Desktop available for the database and dashboard steps.

### 2. Clone and install dependencies

```bash
git clone https://github.com/surajyadav011/PowerBI-Ecommerce-Analysis.git
cd PowerBI-Ecommerce-Analysis
python -m pip install -r requirements.txt
```

### 3. Add the source workbook

Place the approved, privacy-reviewed source workbook at:

```text
data/Ecommerce_Unclean_Project.xlsx
```

That full workbook is **not currently tracked in this repository**. The committed `data/sample_ecommerce.csv` is only a small example and is not a replacement for the notebook's expected workbook.

### 4. Run the Python workflow

Open `python/project_end.ipynb` in Jupyter Notebook or JupyterLab and run the cells in order. The notebook exports `Clean_Ecommerce.csv` into the data folder alongside the source workbook.

The standalone script can also be run from the repository root:

```bash
python python/data_cleaning.py
```

Both workflows expect the full workbook. Review `docs/data-quality-notes.md` for assumptions and caveats.

### 5. Run the SQL analysis

Open `sql/ecommerce_sales_analysis.sql` in MySQL Workbench after configuring the `ecommerce` database and loading the cleaned records into the `orders` table. Review the database name and table setup before executing queries.

### 6. Open the dashboard

Open `dashboard/ecommerce_sales_dashboard.pbix` in Power BI Desktop. If prompted, update the data source and refresh the report. Validate the measures against the cleaned dataset and SQL results before relying on the displayed figures.

## Key Metric Definitions

| Metric | Definition used in the project |
|---|---|
| `Sales` | `Qty × Unit_Price` (gross line amount before discount) |
| `Net_Amount` | `Sales − (Sales × Discount / 100)` |
| `Profit` | `Net_Amount × 0.20` — an assumed-margin estimate |
| `Month`, `Year`, `Weekday` | Calendar attributes derived from `Order_Date` |

**Important:** The notebook does not calculate actual accounting profit from cost of goods, shipping, returns, or operating expenses. The 20% margin is an assumption inherited from the project logic. Treat the result as estimated profit, not verified profit.

## Data Quality and Limitations

- Email filtering checks for the presence of `@`; it is not full email validation.
- Missing discounts are filled with zero in the notebook workflow.
- Missing delivery dates may be filled using the order date, which can hide unknown delivery outcomes.
- The SQL monthly aggregation groups by month name only; if multiple years are present, same-named months can be combined.
- The full workbook and full cleaned CSV are not currently committed. Review the source-data license and remove or pseudonymize personal information before any public upload.

See [Data Quality Notes](docs/data-quality-notes.md) for additional details.

## About Me

I'm **Suraj**, a B.Tech AIML student interested in data analytics, business intelligence, and using data to answer practical business questions. This project demonstrates my practice with notebook-based data preparation, SQL analysis, and dashboard reporting.

**Technologies:** #Jupyter #Pandas #MySQL #Python #PowerBI #DataAnalytics

GitHub: [@surajyadav011](https://github.com/surajyadav011)
