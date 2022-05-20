import pandas as pd 

df = los_angeles_restaurant_health_inspections

df = df.groupby('grade')['score'].agg(min_score='min', max_score = 'max').reset_index()

df['rule'] = "Score > " + (df['min_score'] - 1).astype(str) + " And Score < " + df['max_score'].astype(str) + " => Grade = " + df['grade'].astype(str)
