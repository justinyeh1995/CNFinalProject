import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC
from sklearn.metrics import confusion_matrix, classification_report

# Import the dataset
df = pd.read_csv('data/dataset.csv')

# Splitting dataset into features and label
X = df.drop('Class', axis=1)
y = df['Class']

# Splitting the dataset into the training set and the test set
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=0)

# Feature scaling (or standardization)
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)


# Fitting SVM with the training set
classifier = SVC(kernel='linear', random_state=0)
classifier.fit(X_train, y_train)

dt_realtime = pd.read_csv('realtime.csv')
result = classifier.predict(dt_realtime)

with open('.result', 'w') as f:
    f.write(str(result[0]))
