import pandas as pd

def department_highest_salary(employee: pd.DataFrame, department: pd.DataFrame) -> pd.DataFrame:
    df = pd.merge(employee,department,left_on='departmentId',right_on='id',how='left',suffixes=('_emp', '_dpt'))
    df['drn'] = df.groupby('departmentId')['salary'].rank(method = 'dense' , ascending=False)
    return df[df['drn'] == 1][['name_dpt','name_emp','salary']].rename(columns = {'name_dpt':'Department','name_emp':'Employee','salary':'Salary'})