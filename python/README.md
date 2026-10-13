# Python Data Preparation

This folder contains the standalone Pandas cleaning script. Run from the repository root after installing `requirements.txt`:

```bash
python python/data_cleaning.py
```

Input: `data/Ecommerce_Unclean_Project.xlsx`. Output: `data/Clean_Ecommerce.csv`.

The project estimates profit at 20% of net amount; this is an assumed margin, not verified accounting profit. See `docs/data-quality-notes.md`.