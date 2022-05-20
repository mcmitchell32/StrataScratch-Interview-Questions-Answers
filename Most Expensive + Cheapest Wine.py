import pandas as pd 

winemag_p1.head()

w1 = pd.DataFrame(winemag_p1, columns = ['region_1', 'variety', 'price'])

w2 = w1 = pd.DataFrame(winemag_p1, columns = ['region_2', 'variety', 'price'])

df = pd.concat([w1, w2]).rename(columns={'region_2': 'region'})

df = df.drop_duplicates().dropna()

df['expensive_rank'] = df.groupby('region')['price'].rank(method='dense', ascending=False)

df['cheapest_rank'] = df.groupby('region')['price'].rank(method='dense', ascending=True)

expensive_df = df[df['expensive_rank'] == 1]
[['region','variety']]

cheapest_df == df[df['cheapest_rank'] == 1][['region', 'variety']]

result = pd.merge(expensive_df, cheapest_df, on='region').sort_values('region')
