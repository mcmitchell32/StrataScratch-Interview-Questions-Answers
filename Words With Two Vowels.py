import pandas as pd 

def two_vowels(word): 
    vowels = [i for i in word if i in {'a', 'e', 'i', 'o', 'u'}]
    return len(vowels) == 2 

w1 = google_word_lists['words1'].apply(lambda x: x.split(',')).explode()

w2 = google_word_lists['words2'].apply(lambda x: x.split(',')).explode()

w1 = pd.DataFrame(w1)

w2 = pd.DataFrame(w2)

df = pd.concat([w1, w2], ignore_index=True).rename(columns={0: 'word'}).drop_duplicates()

result = df['word'].apply(lambda x: x if two_vowels(x) == 1 else np.nan)

result = result.dropna()
