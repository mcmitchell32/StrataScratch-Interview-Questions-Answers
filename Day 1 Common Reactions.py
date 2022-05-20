import pandas as pd 

df = df[df['date_day'] == 1]

df = df.groupby('reaction').size().to_frame('n_reactions').reset_index().sort_values('n_reactions', ascending=False)

result = df[df['n_reactions'] == df['n_reactions'].max()]
