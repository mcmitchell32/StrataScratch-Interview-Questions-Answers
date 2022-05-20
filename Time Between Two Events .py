import pandas as pd 

df = facebook_web_log

df['timestamp'] = pd.to_datetime(df['timestamp'])

page_load = df[df['action'] == 'page_load']

scroll_down = df[df['action'] == 'scroll_down']

df = pd.merge(page_load, scroll_down, how='inner', on='user_id', suffixes=['_load', '_scroll'])

df['time_between_events'] = df['timestamp_scroll'] - df['timestamp_load']

df['time_between_events'] =df['time_between_events'].apply(lambda x: int(x.seconds))

df = df[df['time_between_events'] >= 0]

result = df[df['time_between_events'] == df['time_between_events'].min()]

result = result[['user_id' ,'timestamp_load', 'timestamp_scroll', 'time_between_events']]
