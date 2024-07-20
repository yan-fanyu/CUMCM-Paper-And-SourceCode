from define import *


def preprocess1():
    os.chdir(xlsx_path)
    # 使用pandas的read_excel函数读取文件并转换为DataFrame
    df1 = pd.read_excel(xlsx1_name, header=0)

    # 使用apply方法对“单品名称”列进行操作
    df1['单品名称'] = df1['单品名称'].apply(lambda x: ''.join(re.split(r'\([^)]*\)', x)))

    os.chdir(xlsx_path)
    # 使用to_csv方法将DataFrame保存为CSV文件
    df1.to_excel(csv1_name, index=False)

    return df1


def preprocess2():
    os.chdir(xlsx_path)
    # 使用pandas的read_excel函数读取文件并转换为DataFrame
    df2 = pd.read_excel(xlsx2_name, header=0)
    df1 = pd.read_excel(csv1_name, header=0)

    # 使用drop方法删除名为“分类编码”的列
    df2 = df2[['销售日期', '单品编码', '销量(千克)']]
    # 创建单品编码到单品名称的字典映射
    code_to_name = dict(zip(df1['单品编码'], df1['单品名称']))
    # 使用map方法将单品编码映射为单品名称
    df2['单品名称'] = df2['单品编码'].map(code_to_name)
    # 使用map方法将单品编码映射为分类名称
    df2['分类名称'] = df2['单品编码'].map(df1.set_index('单品编码')['分类名称'])
    # 使用to_datetime函数将“销售日期”列内容转换为datetime类型
    df2['销售日期'] = pd.to_datetime(df2['销售日期'], format='%Y-%m-%d')

    # 使用pivot_table函数重构DataFrame
    pivot_df_each = df2.pivot_table(index='销售日期', columns='单品名称', values='销量(千克)', aggfunc='sum', fill_value=0)
    # 重新设置列名为单品名称
    pivot_df_each.columns.name = None
    # 重置索引，将日期作为一列
    pivot_df_each.reset_index(inplace=True)

    # 使用pivot_table函数重构DataFrame
    pivot_df_class = df2.pivot_table(index='销售日期', columns='分类名称', values='销量(千克)', aggfunc='sum', fill_value=0)
    # 重新设置列名为单品名称
    pivot_df_class.columns.name = None
    # 重置索引，将日期作为一列
    pivot_df_class.reset_index(inplace=True)

    # 使用ExcelWriter将两个DataFrame写入到同一个Excel文件的不同sheet中
    with pd.ExcelWriter(csv2_name, engine='openpyxl', mode='a') as writer:
        pivot_df_each.to_excel(writer, sheet_name='单品名称', index=False)
    with pd.ExcelWriter(csv2_name, engine='openpyxl', mode='a') as writer:
        pivot_df_class.to_excel(writer, sheet_name='分类名称', index=False)

    return df2


def preprocess3():
    os.chdir(xlsx_path)
    # 使用pandas的read_excel函数读取文件并转换为DataFrame
    df1 = pd.read_excel(csv1_name, header=0)
    df2 = pd.read_excel(xlsx2_name, header=0)
    df3 = pd.read_excel(xlsx3_name, header=0)

    # 使用drop方法删除名为“分类编码”的列
    df2 = df2[['销售日期', '单品编码', '销量(千克)', '销售单价(元/千克)']]
    # 创建单品编码到单品名称的字典映射
    code_to_name = dict(zip(df1['单品编码'], df1['单品名称']))
    # 使用map方法将单品编码映射为单品名称
    df2['单品名称'] = df2['单品编码'].map(code_to_name)
    df3['单品名称'] = df3['单品编码'].map(code_to_name)
    # 使用map方法将单品编码映射为分类名称
    df2['分类名称'] = df2['单品编码'].map(df1.set_index('单品编码')['分类名称'])
    df3['分类名称'] = df3['单品编码'].map(df1.set_index('单品编码')['分类名称'])
    # 使用to_datetime函数将“销售日期”列内容转换为datetime类型
    df2['销售日期'] = pd.to_datetime(df2['销售日期'], format='%Y-%m-%d')
    df3['销售日期'] = pd.to_datetime(df3['日期'], format='%Y-%m-%d')

    # 使用pivot_table函数重构DataFrame
    pivot_df_sale = df2.pivot_table(index='销售日期', columns='分类名称', values='销量(千克)', aggfunc='sum', fill_value=0)
    # 重新设置列名为单品名称
    pivot_df_sale.columns.name = None
    # 重置索引，将日期作为一列
    pivot_df_sale.reset_index(inplace=True)

    # 使用pivot_table函数重构DataFrame
    pivot_df_price = df2.pivot_table(index='销售日期', columns='分类名称', values='销售单价(元/千克)', aggfunc='mean', fill_value=0)
    # 重新设置列名为单品名称
    pivot_df_price.columns.name = None
    # 重置索引，将日期作为一列
    pivot_df_price.reset_index(inplace=True)

    # 使用pivot_table函数重构DataFrame
    pivot_df_cost = df3.pivot_table(index='销售日期', columns='分类名称', values='批发价格(元/千克)', aggfunc='mean', fill_value=0)
    # 重新设置列名为单品名称
    pivot_df_cost.columns.name = None
    # 重置索引，将日期作为一列
    pivot_df_cost.reset_index(inplace=True)

    # 使用ExcelWriter将两个DataFrame写入到同一个Excel文件的不同sheet中
    with pd.ExcelWriter(csv3_name, engine='openpyxl', mode='a') as writer:
        pivot_df_sale.to_excel(writer, sheet_name='销量', index=False)
    with pd.ExcelWriter(csv3_name, engine='openpyxl', mode='a') as writer:
        pivot_df_price.to_excel(writer, sheet_name='销售单价', index=False)
    with pd.ExcelWriter(csv3_name, engine='openpyxl', mode='a') as writer:
        pivot_df_cost.to_excel(writer, sheet_name='批发价格', index=False)

    return df3
