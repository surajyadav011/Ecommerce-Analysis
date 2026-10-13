# Power BI Dashboard

The repository includes a vector preview at `dashboard-preview.svg`, recreated from the supplied screenshot for documentation. It is not a Power BI export and should not be treated as a data source.

The original `.pbix` file is not currently committed in this public repository. The local project handoff ZIP includes the supplied report. To add the file to a local clone:

```text
dashboard/dashboard.pbix
```

Then commit it from Git with an appropriate message. Open the report using Power BI Desktop and validate data-source prompts, measures, filters, and refresh behavior before using the figures for decisions.

## Visible dashboard elements

- KPI cards for Total Sales, Total Profit, Total Orders, and Average Order Value
- Sales by month and product
- Sales by category and profit by category
- Order status and payment mode breakdowns
- Geographic visual
- Month, City, and Payment Mode filters

**Metric caveat:** The provided Python notebook estimates profit as 20% of net amount; verify the definition behind the Power BI Total Profit KPI before describing it as actual profit.
