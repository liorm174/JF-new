print("Hello World")

import pickle

data = {
    'name': 'Alice',
    'age': 30,
    'scores': [85, 92, 78]
}

# Save (pickle) to a file
with open('data.pkl', 'wb') as f:
    pickle.dump(data, f)

# Later — load (unpickle) it
with open('data.pkl', 'rb') as f:
    loaded = pickle.load(f)

print(loaded)

print ("Addition of 1 and 2 is", 1 + 2)