import pandas as pd

def consecutive_numbers(logs: pd.DataFrame) -> pd.DataFrame:
    logs['prev_num'] = logs['num'].shift(1)
    logs['next_num'] = logs['num'].shift(-1)
    logs['is_consecutive'] = (logs['num'] == logs['prev_num']) & (logs['num'] == logs['next_num'])
    result = logs[logs['is_consecutive'] == True][['num']].drop_duplicates().rename(columns = {'num' : 'ConsecutiveNums'})
    return result