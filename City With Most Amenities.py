import pandas as pd 

df = airbnb_search_details

df['total_amenities'] = df['amenities'].apply(lambda x: len(x.strip(',')))

result = df.groupby('city')['total_amenities'].sum().reset_index()

result = result.sort_values('total_amenities', ascending=False).reset_index()

result = result['city'][0]
