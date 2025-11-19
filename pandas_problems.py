#1741. Find Total Time Spent by Each Employee

import pandas as pd

def total_time(employees: pd.DataFrame) -> pd.DataFrame:


    odp = (
        employees
        .assign(total_time=lambda df: df["out_time"] - df["in_time"])
        .groupby(["event_day", "emp_id"], as_index=False)
        .agg(total_time=("total_time", "sum"))
        .rename(columns={"event_day": "day"})
    )

    return odp

#1757. Recyclable and Low Fat Products

import pandas as pd

def find_products(products: pd.DataFrame) -> pd.DataFrame:
    p = products

    odp = p[(p["low_fats"] == "Y") & (p["recyclable"] == "Y")]
    return odp[["product_id"]]


#1795. Rearrange Products Table

import pandas as pd

def rearrange_products_table(products: pd.DataFrame) -> pd.DataFrame:
    p = products

    p2 = p.melt(id_vars = "product_id", var_name = "store", value_name = "price")

    return p2.dropna()

    #w sql trzeba użyć union