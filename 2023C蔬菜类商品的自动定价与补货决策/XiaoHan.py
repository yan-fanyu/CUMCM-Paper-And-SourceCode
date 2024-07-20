#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np
import os
import random


# In[2]:


os.chdir("D:\数学建模\CUMCM2023Problems\C题")


# In[11]:


df=pd.read_excel(r"D:\浏览器下载\df2.xlsx",sheet_name=1)
df1=pd.read_excel(r"D:\浏览器下载\df3.xlsx",sheet_name=0)
df2=pd.read_excel(r"D:\浏览器下载\df3.xlsx",sheet_name=1)
df3=pd.read_excel(r"D:\浏览器下载\df3.xlsx",sheet_name=2)
df4=pd.read_excel(r"D:\浏览器下载\df3.xlsx",sheet_name=3)


# 品类天数因子部分

# In[12]:


def pth(A):
    pt1=df.loc[:,A]
    c=[]
    d=[]
    for i in range(0,(len(pt1)-7)):
        c.append(np.mean(pt1[i:i+7]))
    for j in range(0,(len(c)-1)):
        d.append(np.mean(c[j:j+1]))
    fg=df.iloc[3:(len(pt1)-5)]
#fg["d1"]=d
    fg["d"]=d
    pt2=fg[A] /fg["d"]
    c1=[]
    e=[]
    for i in range(0,len(fg),7):
        c1.append(pt2.iloc[i])
    e.append(np.mean(c1))
    for i in range(1,len(fg),7):
        c1.append(pt2.iloc[i])
    e.append(np.mean(c1))
    for i in range(2,len(fg),7):
        c1.append(pt2.iloc[i])
    e.append(np.mean(c1))
    for i in range(3,len(fg),7):
        c1.append(pt2.iloc[i])
    e.append(np.mean(c1))
    for i in range(4,len(fg),7):
        c1.append(pt2.iloc[i])
    e.append(np.mean(c1))
    for i in range(5,len(fg),7):
        c1.append(pt2.iloc[i])
    e.append(np.mean(c1))
    for i in range(6,len(fg),7):
        c1.append(pt2.iloc[i])
    e.append(np.mean(c1))
    g=[6,7,1,2,3,4,5]
    return(dict(zip(g,e)))


# In[ ]:


g1=pth("水生根茎类")
g2=pth("花叶类")
g3=pth("花菜类")
g4=pth("茄类")
g5=pth("辣椒类")
g6=pth("食用菌")


# 这是第三题，旺月以来的天数因子

# 筛选有效数据

# In[225]:


df_sale=pd.read_excel(r"D:\浏览器下载\df6.xlsx",sheet_name="销量")
df_profit=pd.read_excel(r"D:\浏览器下载\df6.xlsx",sheet_name="利润率")
df_cost=pd.read_excel(r"D:\浏览器下载\df6.xlsx",sheet_name="批发价格")
df_price=pd.read_excel(r"D:\浏览器下载\df6.xlsx",sheet_name="销售单价")


# In[226]:


df_profit=df_profit.drop(["藕",'本地菠菜'],axis=1)
df_cost=df_cost.drop(["藕",'本地菠菜'],axis=1)
merged_df=df_profit.merge(df_sale,on='销售日期',how='inner')
merged_df=merged_df.dropna()
common_dates = merged_df['销售日期'].tolist()
# 创建一个空列表，用于存储符合条件的行索引
index_list = []

# 遍历common_dates列表中的日期值
for date in common_dates:
    # 使用loc方法筛选出符合条件的行，并将其索引添加到index_list中
    index_list.extend(df_profit.loc[df_profit['销售日期'] == date].index.tolist())
df_profit=df_profit.iloc[index_list,:]
df_cost=df_cost.iloc[index_list,:]
df_profit=df_profit.reset_index(drop=True)
df_cost=df_cost.reset_index(drop=True)
df_sale=df_sale.reset_index(drop=True)
df_price=df_price.reset_index(drop=True)
df_loss=pd.read_excel(r"D:\download\df1.xlsx",sheet_name=0)
df_loss_1 = pd.DataFrame(df_loss, columns=['单品净名称', '平均损耗率'])
selected_columns = df_loss_1[['单品净名称', '平均损耗率']].drop_duplicates()


# 计算新利润

# In[ ]:


for col in df_profit.columns[1:]:
    # 计算式子并更新 df1
    #temp_result = df_price[col].astype(float) / df_cost[col].astype(float) - 1
    df_profit[col] = df_sale[col].astype(float)*df_price[col].astype(float) - df_sale[col].astype(float) *(1+selected_columns[selected_columns['单品净名称'] == col]['平均损耗率'].values[0].astype(float))*df_cost[col].astype(float)

# 打印计算结果


# 筛选旺季数据

# In[232]:


#df_profit[df_profit["销售日期"]=="2023-04-01"]
df_profit_1=df_profit.iloc[994:,:]
df_sale_1=df_sale.iloc[994:,:]
df_cost_1=df_cost.iloc[994:,]
df_total=df_profit_1.iloc[:,1:]*(df_sale_1.iloc[:,1:])
df_total_1=df_total.reset_index(drop=True)


# 计算score

# In[ ]:


def indicator(x,i,S):
    a=0
    if x > 2.5:
        a=float(df_total.loc[(1078+i),[S]])
    else:
         a=float(df_total.loc[(1078+i),[S]])+(float(df_sale.loc[(1078+i),[S]])-2.5)*(float(df_cost.loc[(1078+i),[S]]))/(np.log(3.5))*(np.log(3.5-x))
    return a


# In[ ]:


def replace_list(lst):
    if all(elem == 0 for elem in lst):
        return [1] * len(lst)
    else:
        total = sum(lst)
        return [elem/total for elem in lst]


# In[ ]:


def comupte(S):
    data = list(df_total[S])

    corr_list = []
    
    for n in range(1, 8):
        A = []
        B = []
        
        for i in range(len(data)-n):
            a=random.random()
            A.append(data[i])
            B.append((data[i+n]+a))
        result = [x * y for x, y in zip(A, B)]
        corr = np.mean(A)*np.mean(B)-np.mean(result)
        corr_list.append(corr)
    corr_list=replace_list(corr_list)
    score=0
    for i in range(0,7):
        score=score+corr_list[i]*indicator(float(df_sale.loc[(1078+i),[S]]),i,S)
    return  score


# c1=list(df_profit.columns)
# product=c1[1:len(c1)]
# score_all=[]
# for i in product:
#     score_all.append(comupte(i))
# judgement=dict(zip(product,score_all))

# sorted_d = sorted(judgement.items(), key=lambda x: x[1],reverse=True)
# 
# sorted_dict = dict(sorted_d)
# 

# 筛选最近几天没有销售的产品

# In[ ]:


# 找出最后七行全部为0的列
last_seven_rows = df_sale_1.tail(7)
all_zero_cols = last_seven_rows.columns[(last_seven_rows == 0).all()]

# 剔除最后七行全部为0的列
df_new = df_sale_1.drop(all_zero_cols, axis=1)
clean=list(df_new.columns)
clean=clean[1:len(clean)]

# # 使用字典推导式删除字典中与列表相同的键值对]
# for item in clean:
#     sorted_dict.pop(item, None)
# print(sorted_dict)


# In[ ]:


def filter_and_access_dict(input_dict, exclude_list):
    # 提取字典的所有键作为一个列表
    dict_keys = list(input_dict.keys())
    
    # 去除在exclude_list中的元素
    filtered_dict = {key: value for key, value in input_dict.items() if value >= 0}
    
    # 使用新生成的列表来访问字典，并获取相应的值
    
    return filtered_dict


# 调用函数进行筛选
filtered_dict =filter_and_access_dict(sorted_dict, clean)

# 打印筛选后的字典


# In[234]:


non_zero_columns = df_sale_1.columns[(df_sale_1 != 0).any()]

# 从数据框中选择非零列
df_sale_1 = df_sale_1[non_zero_columns]


# In[235]:


df_profit_1=df_profit_1[non_zero_columns]
df=df_profit_1
zero_counts = (df == 0).sum()

# 计算每列中非零的数量
non_zero_counts = (df != 0).sum()

# 计算每列中零的比例
zero_ratio = zero_counts / (zero_counts + non_zero_counts)

# 选择零比例小于2/3的列
selected_columns = zero_ratio[zero_ratio < 2/3].index

# 保留选定的列
df = df[selected_columns]


# In[237]:


df_profit_1=df_profit_1[selected_columns]
df_sale_1=df_sale_1[selected_columns]


# In[ ]:


df=df_profit_1
zero_counts = (df == 0).sum()

# 计算每列中非零的数量
non_zero_counts = (df != 0).sum()

# 计算每列中零的比例
zero_ratio = zero_counts / (zero_counts + non_zero_counts)

# 选择零比例小于2/3的列
selected_columns = zero_ratio[zero_ratio < 1/2].index

# 保留选定的列
df = df[selected_columns]


# In[238]:


new_df_1=df_sale_1
new_df_2=df_profit_1
with pd.ExcelWriter('df3.xlsx', engine='openpyxl', mode='a') as writer:
    new_df_1.to_excel(writer, sheet_name='新销量', index=False)
with pd.ExcelWriter('df3.xlsx', engine='openpyxl', mode='a') as writer:
    new_df_2.to_excel(writer, sheet_name='新利润', index=False)


# 读取R分析结果计算最终补货量和销售单价

# In[243]:


df16=pd.read_csv(r'C:\Users\86159\Documents\dm8.csv')


# 计算当天批发价格

# In[252]:


# 提取数据框1的行值作为列表
row_values = df16["Column_Name"].tolist()

# 提取数据框2的列名作为列表
col_names = df_cost_1.columns.tolist()

df_cost_1_1=df_cost_1[row_values]


# In[266]:


df16["cost"]=list(df_cost_1_1.tail(3).mean()+random.uniform(-0.5, 0.5))


# 找到对应损耗率

# In[280]:


selected_columns2 = df_loss_1[['单品净名称', '平均损耗率']].drop_duplicates()


# In[286]:


filtered_df = selected_columns2[selected_columns2['单品净名称'].isin(row_values)]


# In[288]:


filtered_df.columns=["Column_Name","平均损耗率"]


# 最终计算

# In[290]:


merged_df = pd.merge(df16, filtered_df, on='Column_Name', how='inner')  # how='inner' 表示内连接
merged_df["定价"]=((merged_df["Max_profit"]+merged_df["Max_Product"]*merged_df["cost"])/(1-merged_df["平均损耗率"]))*(1/merged_df["Max_Product"])
merged_df["补货量"]=merged_df["Max_Product"]/(1-merged_df["平均损耗率"])


# In[292]:


with pd.ExcelWriter('df4.xlsx', engine='openpyxl', mode='a') as writer:
    merged_df.to_excel(writer, sheet_name='总', index=False)

