# Data Quality and Metric Notes

## Cleaning steps in the supplied notebook

- Removes duplicate rows.
- Replaces `N/A`, `NULL`, and whitespace-only values with missing values.
- Strips surrounding whitespace from text fields.
- Standardizes customer names, cities, and states to title case.
- Keeps rows where the email value contains `@`; this is only a lightweight filter, not full email validation.
- Parses order and delivery dates with invalid values coerced to missing.
- Converts `Qty`, `Unit_Price`, and `Discount` to numeric values.
- Filters out rows where quantity is not positive.
- Fills missing discount with zero and missing phone with `Unknown`.
- Fills a missing delivery date from the order date.

## Metric definitions

- `Sales = Qty * Unit_Price`
- `Net_Amount = Sales - (Sales * Discount / 100)`
- `Profit = Net_Amount * 0.20`
- `Month`, `Year`, and `Weekday` are derived from `Order_Date`.

**Profit limitation:** Profit is assumed to be a flat 20% of net amount. The notebook does not use product cost, COGS, shipping, returns, or operating expenses. Present it as estimated profit under an assumed margin, not audited or actual profit.

**Missing delivery dates:** Filling missing delivery dates with order dates can hide unknown delivery outcomes. For more robust logistics analysis, preserve a flag indicating that the original delivery date was missing.

**Email validation:** A check for `@` does not establish that an email is valid or deliverable.

## Reproducibility

The source workbook `Ecommerce_Unclean_Project.xlsx` was not included in the provided files. The cleaned dataset is not committed by default. Database credentials should be provided through environment variables and must never be hard-coded or committed.