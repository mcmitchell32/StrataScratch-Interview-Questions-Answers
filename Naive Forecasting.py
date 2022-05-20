import pandas as pd 

df = uber_request_logs 

df['year_month'] = pd.to_datetime(df['request_date']).dt.to_period('M') 

df = df.groupby(['year_month']).agg({'distance_to_travel': 'sum', 'monetary_cost': 'sum'}).reset_index() 

df['actual'] = df['distance_to_travel'] / df['monetary_cost'] 

df['forecast'] = df['actual'].shift(1) 

RMSE = (df['actual'] - df['forecast'])**2 

RMSE = round(RMSE.mean()**0.5, 2)
