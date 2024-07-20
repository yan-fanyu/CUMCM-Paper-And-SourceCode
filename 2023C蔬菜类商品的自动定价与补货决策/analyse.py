from define import *


def plot1(sheet_name):
    os.chdir(xlsx_path)
    df = pd.read_excel(csv2_name, sheet_name=sheet_name, header=0)

    # 计算互相关系数
    correlation_matrix = df.corr()

    os.chdir(fig_path)
    if sheet_name=='分类名称':
        plt.figure()
        # 创建一个与相关系数矩阵相同大小的零矩阵
        mask = np.triu(np.ones_like(correlation_matrix, dtype=bool))
        # 绘制互相关矩阵的热力图，只显示下三角部分，对角线为1的部分用白色遮挡
        sns.heatmap(correlation_matrix, mask=mask, annot=True, cmap='coolwarm', vmin=-1, vmax=1, center=0, linewidths=0.5)
        # 调整坐标轴文字的纵向排列
        plt.xticks(rotation=90)
        plt.xticks(rotation=0)
        plt.title(f'互相关矩阵_{sheet_name}')

        plt.savefig(f'互相关矩阵_{sheet_name}.png')
        plt.close('all')
    elif sheet_name=='单品名称':
        # 创建一个DataFrame，将相关系数矩阵存储到其中
        df_correlation = pd.DataFrame(correlation_matrix)
        # 指定要保存的文件名（包括路径）
        output_name = f'互相关矩阵_{sheet_name}.xlsx'
        # 使用to_excel方法将DataFrame保存为xlsx文件
        df_correlation.to_excel(output_name, index=True)


def plot3(column_name):
    os.chdir(xlsx_path)

    # 读取销售量和期望利润率的sheets
    df_sale = pd.read_excel(csv3_name, sheet_name='销量', header=0)
    df_sale = df_sale.set_index('销售日期')
    df_sale = df_sale[column_name]
    df_sale = pd.DataFrame(df_sale)

    df_price = pd.read_excel(csv3_name, sheet_name='销售单价', header=0)
    df_price = df_price.set_index('销售日期')
    df_price = df_price[column_name]
    df_price = pd.DataFrame(df_price)

    # 合并df_sale和df_profit基于销售日期，使用how='inner'来保留交集部分
    merged_df = df_price.merge(df_sale, on='销售日期', how='inner')
    # 删除含有缺失值的行（即某一方数据缺失的样本）
    merged_df = merged_df.dropna()

    # with pd.ExcelWriter(csv4_name, engine='openpyxl', mode='a') as writer:
    #     merged_df.to_excel(writer, sheet_name=column_name, index=False)

    # 绘制散点图
    plt.figure()
    plt.scatter(merged_df[f'{column_name}_x'], merged_df[f'{column_name}_y'], s=10, alpha=0.5)

    # 添加标题和轴标签
    plt.title(column_name)
    plt.xlabel('销售单价（元/千克）')
    plt.ylabel('销量（千克）')
    # 显示图形
    os.chdir(fig_path)
    plt.savefig(f'{column_name}.png')



