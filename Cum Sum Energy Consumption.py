import pandas as pd 

concat = pd.concat([fb_eu_energy, fb_na_energy, fb_asia_energy])	
	
concat['date'] = pd.to_datetime(concat['date']).dt.strftime('%Y-%m-%d')

running_total = concat.groupby('date')['consumption'].sum().to_frame('running_total').reset_index()

running_total['total_consumption'] = running_total['running_total'].cumsum()

running_total['pct_total_consumption'] = round((running_total['total_consumption'] / running_total['running_total'].sum()) * 100)

running_total.drop('running_total', axis=1, inplace=True)

running_total
