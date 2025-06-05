import pandas as pd

def second_highest_salary(employee: pd.DataFrame) -> pd.DataFrame:
    employee['rank'] = employee['salary'].rank(method = 'dense', ascending=False)
    df = employee[employee['rank'] == 2]
    if df.empty:
        return pd.DataFrame({'SecondHighestSalary': [None]})
    else:    
        return df[['salary']].rename(columns = {'salary': 'SecondHighestSalary'})