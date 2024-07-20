from define import *


def class_quarter():
    os.chdir(xlsx_path)

    # 使用pandas的read_excel函数读取文件并转换为DataFrame
    df_sale = pd.read_excel(csv3_name, sheet_name='销量', header=0)
    df_sale['销售日期'] = pd.to_datetime(df_sale['销售日期'], format='%Y-%m-%d')

    # 根据销售日期创建新的季度列
    df_sale['季度'] = df_sale['销售日期'].dt.quarter
    # 删除"销售日期"列
    df_sale.drop(columns=['销售日期'], inplace=True)
    # 使用pivot_table计算每个季度的销量平均值
    pivot_df_sale = df_sale.pivot_table(index='季度', aggfunc='mean')

    # 将结果保存为CSV或Excel文件
    pivot_df_sale.to_excel(csv_quarter, sheet_name='销量')


def class_month():
    os.chdir(xlsx_path)

    # 使用pandas的read_excel函数读取文件并转换为DataFrame
    df_sale = pd.read_excel(csv3_name, sheet_name='销量', header=0)
    df_sale['销售日期'] = pd.to_datetime(df_sale['销售日期'], format='%Y-%m-%d')

    # 根据销售日期创建新的季度列
    df_sale['月份'] = df_sale['销售日期'].dt.month
    # 删除"销售日期"列
    df_sale.drop(columns=['销售日期'], inplace=True)
    # 使用pivot_table计算每个季度的销量平均值
    pivot_df_sale = df_sale.pivot_table(index='月份', aggfunc='mean')

    # 将结果保存为CSV或Excel文件
    pivot_df_sale.to_excel(csv_month, sheet_name='销量')


def class_week():
    os.chdir(xlsx_path)

    # 使用pandas的read_excel函数读取文件并转换为DataFrame
    df_sale = pd.read_excel(csv3_name, sheet_name='销量', header=0)
    df_sale['销售日期'] = pd.to_datetime(df_sale['销售日期'], format='%Y-%m-%d')
    # 使用dt.day_name()函数将日期转换为星期几，并将结果添加为新的列
    df_sale['星期'] = df_sale['销售日期'].dt.day_name()
    # 删除"销售日期"列
    df_sale.drop(columns=['销售日期'], inplace=True)
    df_sale = df_sale[['星期'] + [col for col in df_sale.columns if col != '星期']]
    # 将"星期"列设置为索引列
    df_sale.set_index('星期', inplace=True)
    # 使用pivot_table计算销量平均值
    pivot_df_sale = df_sale.pivot_table(index='星期', aggfunc='mean')
    # 使用ExcelWriter将两个DataFrame写入到同一个Excel文件的不同sheet中
    with pd.ExcelWriter(csv_week, engine='openpyxl', mode='a') as writer:
        pivot_df_sale.to_excel(writer, sheet_name='销量')

    # 使用pandas的read_excel函数读取文件并转换为DataFrame
    df_cost = pd.read_excel(csv3_name, sheet_name='批发价格', header=0)
    df_cost['销售日期'] = pd.to_datetime(df_cost['销售日期'], format='%Y-%m-%d')
    # 使用dt.day_name()函数将日期转换为星期几，并将结果添加为新的列
    df_cost['星期'] = df_cost['销售日期'].dt.day_name()
    # 删除"销售日期"列
    df_cost.drop(columns=['销售日期'], inplace=True)
    df_cost = df_cost[['星期'] + [col for col in df_cost.columns if col != '星期']]
    # 将"星期"列设置为索引列
    df_cost.set_index('星期', inplace=True)
    # 使用pivot_table计算销量平均值
    pivot_df_cost = df_cost.pivot_table(index='星期', aggfunc='mean')
    # 使用ExcelWriter将两个DataFrame写入到同一个Excel文件的不同sheet中
    with pd.ExcelWriter(csv_week, engine='openpyxl', mode='a') as writer:
        pivot_df_cost.to_excel(writer, sheet_name='批发价格')


def class_hour():
    os.chdir(xlsx_path)
    # 使用pandas的read_excel函数读取文件并转换为DataFrame
    df1 = pd.read_excel(csv1_name, header=0)
    df_sale = pd.read_excel(xlsx2_name, header=0)

    df_sale['扫码销售时间'] = pd.to_datetime(df_sale['扫码销售时间'], format='%H:%M:%S', errors='coerce')
    # 创建新的小时列
    df_sale['小时'] = df_sale['扫码销售时间'].dt.hour
    df_sale['分类名称'] = df_sale['单品编码'].map(df1.set_index('单品编码')['分类名称'])
    # 使用groupby方法按分类名称、小时进行分组，并计算每组的销量总和
    grouped_df = df_sale.groupby(['分类名称', '小时'])['销量(千克)'].sum().reset_index()
    # 使用pivot_table计算每种品类每小时的平均销售量
    pivot_df_sale = grouped_df.pivot_table(index='小时', columns='分类名称', values='销量(千克)', aggfunc='mean')
    # 将NaN值填充为0
    pivot_df_sale.fillna(0, inplace=True)

    # 将结果保存为CSV或Excel文件
    pivot_df_sale.to_excel(csv_hour)


def each_quarter():
    os.chdir(xlsx_path)
    df1 = pd.read_excel(csv1_name, header=0)
    # 使用pandas的read_excel函数读取文件并转换为DataFrame
    df_sale = pd.read_excel(xlsx2_name, header=0)

    df_sale['单品净名称'] = df_sale['单品编码'].map(df1.set_index('单品编码')['单品净名称'])
    df_sale['季度'] = pd.to_datetime(df_sale['销售日期'], format='%Y-%m-%d')
    # 使用dt.day_name()函数将日期转换为星期几，并将结果添加为新的列
    df_sale['季度'] = df_sale['销售日期'].dt.quarter
    # 将"星期"列设置为索引列
    df_sale.set_index('季度', inplace=True)
    # 使用pivot_table计算销量平均值
    pivot_df_sale = df_sale.pivot_table(index='季度', columns='单品净名称', values='销量(千克)', aggfunc='mean')
    pivot_df_sale.fillna(0, inplace=True)

    # 使用ExcelWriter将两个DataFrame写入到同一个Excel文件的不同sheet中
    pivot_df_sale.to_excel(csv_each_quarter)


def each_month():
    os.chdir(xlsx_path)
    df1 = pd.read_excel(csv1_name, header=0)
    # 使用pandas的read_excel函数读取文件并转换为DataFrame
    df_sale = pd.read_excel(xlsx2_name, header=0)

    df_sale['单品净名称'] = df_sale['单品编码'].map(df1.set_index('单品编码')['单品净名称'])
    df_sale['月份'] = pd.to_datetime(df_sale['销售日期'], format='%Y-%m-%d')
    # 使用dt.day_name()函数将日期转换为星期几，并将结果添加为新的列
    df_sale['月份'] = df_sale['销售日期'].dt.month
    # 将"星期"列设置为索引列
    df_sale.set_index('月份', inplace=True)
    # 使用pivot_table计算销量平均值
    pivot_df_sale = df_sale.pivot_table(index='月份', columns='单品净名称', values='销量(千克)', aggfunc='mean')
    pivot_df_sale.fillna(0, inplace=True)

    # 使用ExcelWriter将两个DataFrame写入到同一个Excel文件的不同sheet中
    pivot_df_sale.to_excel(csv_each_month)


def each_week():
    os.chdir(xlsx_path)
    df1 = pd.read_excel(csv1_name, header=0)
    # 使用pandas的read_excel函数读取文件并转换为DataFrame
    df_sale = pd.read_excel(xlsx2_name, header=0)

    df_sale['单品净名称'] = df_sale['单品编码'].map(df1.set_index('单品编码')['单品净名称'])
    df_sale['销售日期'] = pd.to_datetime(df_sale['销售日期'], format='%Y-%m-%d')
    # 使用dt.day_name()函数将日期转换为星期几，并将结果添加为新的列
    df_sale['星期'] = df_sale['销售日期'].dt.day_name()
    # 删除"销售日期"列
    df_sale = df_sale[['星期'] + [col for col in df_sale.columns if col != '星期']]
    # 将"星期"列设置为索引列
    df_sale.set_index('星期', inplace=True)
    # 使用pivot_table计算销量平均值
    pivot_df_sale = df_sale.pivot_table(index='星期', columns='单品净名称', values='销量(千克)', aggfunc='mean')
    pivot_df_sale.fillna(0, inplace=True)

    # 使用ExcelWriter将两个DataFrame写入到同一个Excel文件的不同sheet中
    pivot_df_sale.to_excel(csv_each_week)


def each_hour():
    os.chdir(xlsx_path)
    # 使用pandas的read_excel函数读取文件并转换为DataFrame
    df1 = pd.read_excel(csv1_name, header=0)
    df_sale = pd.read_excel(xlsx2_name, header=0)

    df_sale['扫码销售时间'] = pd.to_datetime(df_sale['扫码销售时间'], format='%H:%M:%S', errors='coerce')
    # 创建新的小时列
    df_sale['小时'] = df_sale['扫码销售时间'].dt.hour
    df_sale['单品净名称'] = df_sale['单品编码'].map(df1.set_index('单品编码')['单品净名称'])
    # 使用groupby方法按分类名称、小时进行分组，并计算每组的销量总和
    grouped_df = df_sale.groupby(['单品净名称', '小时'])['销量(千克)'].sum().reset_index()
    # 使用pivot_table计算每种品类每小时的平均销售量
    pivot_df_sale = grouped_df.pivot_table(index='小时', columns='单品净名称', values='销量(千克)', aggfunc='mean')
    # 将NaN值填充为0
    pivot_df_sale.fillna(0, inplace=True)

    # 将结果保存为CSV或Excel文件
    pivot_df_sale.to_excel(csv_each_hour)
