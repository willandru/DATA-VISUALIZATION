import pandas as pd

# Replace 'your_dataset.csv' with the actual name of your CSV file
df = pd.read_csv('Motor_Vehicle_Collisions_Crashes.csv')

# Print the number of rows and columns
print(f'Number of rows: {df.shape[0]}')
print(f'Number of columns: {df.shape[1]}')
