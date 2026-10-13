import pandas as pd
from pathlib import Path

root = Path(__file__).resolve().parents[1]
source = root / 'data' / 'Ecommerce_Unclean_Project.xlsx'
target = root / 'data' / 'Clean_Ecommerce.csv'

if __name__ == '__main__':
    data = pd.read_excel(source)
    data = data.drop_duplicates().copy()
    data = data.replace(['N/A', 'NULL', ' '], pd.NA)
    for col in data.select_dtypes(include='object').columns:
        data[col] = data[col].str.strip()
    for col in ['Order_Date', 'Delivery_Date']:
        if col in data:
            data[col] = pd.to_datetime(data[col], errors='coerce', dayfirst=True)
    for col in ['Qty', 'Unit_Price', 'Discount']:
        if col in data:
            data[col] = pd.to_numeric(data[col], errors='coerce')
    data = data[data['Qty'] > 0].copy()
    data['Discount'] = data['Discount'].fillna(0)
    data['Sales'] = data['Qty'] * data['Unit_Price']
    data['Net_Amount'] = data['Sales'] - data['Sales'] * data['Discount'] / 100
    data['Profit'] = data['Net_Amount'] * 0.20  # Assumed margin, not actual profit
    data['Month'] = data['Order_Date'].dt.month_name()
    data['Year'] = data['Order_Date'].dt.year
    data['Weekday'] = data['Order_Date'].dt.day_name()
    data.to_csv(target, index=False)
    print(f'Cleaned {len(data)} rows into {target}')
