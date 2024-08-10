import numpy as np
import pandas as pd
#import seaborn as sns
import matplotlib.pyplot as plt



csv_path = "Motor_Vehicle_Collisions_Crashes.csv"
df_original = pd.read_csv(csv_path,sep=",")
df_original.info()