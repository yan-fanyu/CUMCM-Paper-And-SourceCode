import tensorflow as tf
from tensorflow import keras
from sklearn.model_selection import train_test_split
import pandas as pd
import matplotlib.pyplot as plt
import os
from scipy import stats
import seaborn as sns
import numpy as np
import re
import warnings
import matplotlib as mpl
from sklearn.gaussian_process import GaussianProcessRegressor
from sklearn.gaussian_process.kernels import RBF, WhiteKernel, ConstantKernel as C
import joblib
from sklearn.tree import DecisionTreeRegressor
from sklearn.metrics import mean_squared_error
from joblib import dump
import scipy.io as sio
import pickle
from datetime import datetime, timedelta
import itertools
import tqdm


xlsx_path = r'C:\iCloudDrive\项目\高教杯\数据'

xlsx1_name = '附件1.xlsx'
csv1_name  = 'df1.xlsx'
xlsx2_name = '附件2.xlsx'
csv2_name  = 'df2.xlsx'
xlsx3_name = '附件3.xlsx'
csv3_name  = 'df3.xlsx'
csv4_name  = 'df4.xlsx'

class_each_quarter = '品类_quarter.xlsx'
class_each_month   = '品类_month.xlsx'
class_each_week    = '品类_week.xlsx'
class_each_hour    = '品类_hour.xlsx'
csv_each_quarter   = '单品_quarter.xlsx'
csv_each_month     = '单品_month.xlsx'
csv_each_week      = '单品_week.xlsx'
csv_each_hour      = '单品_hour.xlsx'

fig_path   = r'C:\iCloudDrive\项目\高教杯\图片'
model_path = r'C:\iCloudDrive\项目\高教杯\模型'


warnings.filterwarnings('ignore')
mpl.rcParams['font.family'] = 'SimHei'