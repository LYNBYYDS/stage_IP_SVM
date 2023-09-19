#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul  4 14:51:47 2023

@author: ly
"""

import pandas as pd
from sklearn import svm
from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

df = pd.read_excel("train.xlsx", "Sheet 1")
df.drop(df.columns[0], axis=1, inplace=True)

a = df.loc[:,"Vol"]
b = df.loc[:,"Range"]
c = df.loc[:,"Area"]
d = df.loc[:,"Mean"]
e = df.loc[:,"Var"]
f = df.loc[:,"Skew"]
g = df.loc[:,"Kur"]
h = df.loc[:,"SNR"]

X = list(zip(a, b, c, d, e, f, g, h))
y = df['C']

df.head()

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.20, random_state=42)

#model_SVC = svm.SVC()
#model_SVC.fit(x_train, y_train)

C_2d_range = [1e-2, 1, 1e2]
gamma_2d_range = [1e-1, 1, 1e10]
#classifiers = []
#for C in C_2d_range:
#    for gamma in gamma_2d_range:
#        rbf_svc = svm.SVC(kernel='rbf', C=C, gamma=gamma)
#        rbf_svc.fit(X_train, y_train)
#        classifiers.append((C, gamma, rbf_svc))
#        y_pred = rbf_svc.predict(X_test)
#        accuracy = accuracy_score(y_test, y_pred)
#        print('准确率：', accuracy)


for cc in C_2d_range:
    for gg in gamma_2d_range:
        rbf_svc = svm.SVC(kernel='rbf', gamma=gg, C=cc)
        rbf_svc.fit(X_train, y_train)
        y_pred = rbf_svc.predict(X_test)
        accuracy = accuracy_score(y_test, y_pred)
        print('Accuracy: ', accuracy)
        print(y_pred)


# get support vectors
rbf_svc.support_vectors_
# get indices of support vectors
rbf_svc.support_
# get number of support vectors for each class
rbf_svc.n_support_

# print(rbf_svc.n_support_)
# print(rbf_svc.dual_coef_*1024)
# print(rbf_svc.support_vectors_)
# print(rbf_svc.intercept_*1024)

# print(len(X_train))

# Python result 

# SV
fp = open('result_SV.txt', 'w')
i = 0
j = 0
fp.write('double SV[568];\n')
for x in rbf_svc.support_vectors_:
    for y in x:
        fp.write('SV['+str(i)+']='+str(y)+';\n') 
        i+=1
fp.close()

# alphaY 
fp = open('result_alphaY.txt', 'w')
i = 0
for x in rbf_svc.dual_coef_:
    fp.write('double result_alphaY[71];\n')
    for y in x:
        fp.write('result_alphaY['+str(i)+']='+str(y)+';\n')
        i+=1
fp.close()

# Test Data
fp = open('test_data_out.txt', 'w')
i = 0
fp.write('double X_test[144];\n')
for x in X_test:
    for y in x:
        fp.write('X_test['+str(i)+']='+str(y)+';\n')
        i+=1
fp.close()

#print(y_test)
