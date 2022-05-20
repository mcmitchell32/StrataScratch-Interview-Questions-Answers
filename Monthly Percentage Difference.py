import pandas as pd 

df = sf_transactions

df['year_month'] = pd.to_datetime(df['created_at']).dt.to_period('M')

df = df.groupby(['year_month'])['value'].sum().to_frame('total_revenue).reset_inde().sort_values('year_month', ascending=True)

df['previous_revenue'] = df['total_revenue'].shift(1)

df['pct_change'] = round(((df['total_revenue'] - df['[previous_revenue']) / df['previous_revenue']) * 100, 2)

result = df[['year_month', 'pct_change']].fillna('')
