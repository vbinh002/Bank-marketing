#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Nov 21 20:52:38 2018

@author: Binhvu
"""

#Packages
import pandas as pd

# Load data to python
df = pd.read_csv('bank-additional-full.csv',sep=';')

# check for null value
df.isnull().sum()


#Encode the categorical data
for col in df.columns:
    if df[col].dtype==object:
           df[col]=df[col].astype('category')
           df[col]=df[col].cat.codes
df.head()

# Extract to CSV for matlab modelling
df.to_csv('Bank_marketing_full.csv')