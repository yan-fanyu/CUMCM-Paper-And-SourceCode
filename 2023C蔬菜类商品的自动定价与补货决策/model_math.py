from define import *



def model_each(sheet_name, date, price):
    date = pd.to_datetime(date, format='%Y-%m-%d')
    week = date.day_name()
    y_value = np.array([[date]])
    # 将x_value转换为一个2D数组
    x_value = np.array([[price]])

    def b(y):
        os.chdir(xlsx_path)
        df_index = pd.read_excel(csv5_name, sheet_name='销量系数', header=0)
        df_index.set_index('星期', inplace=True)

        return df_index.loc[week, sheet_name]


    def c(x):
        os.chdir(r'C:\iCloudDrive\项目\高教杯\模型\GPR\v2')
        # 加载高斯回归模型
        model_file = f'model_GPR_{sheet_name}_v2.pkl'
        a_model = joblib.load(model_file)

        return a_model.predict(x)


    def d(y):
        os.chdir(xlsx_path)
        df_index = pd.read_excel(csv5_name, sheet_name='批发价格系数', header=0)
        df_index.set_index('星期', inplace=True)

        return df_index.loc[week, sheet_name]


    def e(x):
        os.chdir(xlsx_path)
        df_index = pd.read_excel(csv1_name, header=0)
        df_index.set_index('分类名称', inplace=True)
        df_index = df_index['平均损耗率']

        loss = df_index[sheet_name].iloc[0]

        return c(x)/(1-loss)


    def F(x, y):
        # 计算F(x, y)
        result = x * b(y) * c(x) - d(y) * e(x)
        result = float(result)

        return result

    return F(x_value, y_value)


def train_model():
    date = datetime(2023, 7, 1)
    print(date)

    # 创建包含每个column_name和其对应价格范围的字典
    # price_ranges = {
    #     '水生根茎类': [9.5, 10, 10.5, 11, 11.5],
    #     '花叶类': [5, 5.5, 6, 6.5, 7],
    #     '花菜类': [8.5, 9, 9.5, 10, 10.5],
    #     '茄类': [7.5, 8, 8.5, 9, 9.5],
    #     '辣椒类': [9, 9.5, 10, 10.5, 11],
    #     '食用菌': [11, 11.5, 12, 12.5, 13]
    # }

    # price_ranges = {
    #     '水生根茎类': [11.5, 12, 12.5, 13, 13.5],
    #     '花叶类': [7, 7.5, 8, 8.5, 9],
    #     '花菜类': [10.5, 11, 11.5, 12, 12.5],
    #     '茄类': [5.5, 6, 6.5, 7, 7.5],
    #     '辣椒类': [11, 11.5, 12, 12.5, 13],
    #     '食用菌': [12]
    # }

    price_ranges = {
        '水生根茎类': [13],
        '花叶类': [8.5],
        '花菜类': [12],
        '茄类': [7.5],
        '辣椒类': [32.5],
        '食用菌': [12]
    }

    # 初始化最优的price和profit_whole
    best_price = {}
    max_profit_whole = -float('inf')

    # 循环遍历所有可能的价格组合
    for price_combination in itertools.product(*price_ranges.values()):
        # 创建一个字典，将column_name和对应的price组合起来
        price_dict = dict(zip(price_ranges.keys(), price_combination))

        # 初始化总利润
        profit_whole = 0

        # 循环遍历每个column_name
        for column_name in price_ranges.keys():
            profit_each = model_each(column_name, date, price_dict[column_name])
            profit_whole += profit_each

        # 检查是否找到了更好的价格组合
        if profit_whole > max_profit_whole:
            max_profit_whole = round(profit_whole, 3)
            best_price = price_dict.copy()

    def get_replenish(x):
        x = np.array([[x]])
        os.chdir(xlsx_path)
        df_index = pd.read_excel(csv1_name, header=0)
        df_index.set_index('分类名称', inplace=True)
        df_index = df_index['平均损耗率']
        loss = df_index[column_name].iloc[0]
        os.chdir(r'C:\iCloudDrive\项目\高教杯\模型\GPR\v2')
        # 加载高斯回归模型
        model_file = f'model_GPR_{column_name}_v2.pkl'
        a_model = joblib.load(model_file)

        return a_model.predict(x)/(1-loss)

    # 初始化结果字典
    replenishment_dict = {}

    # 循环遍历每个column_name
    for column_name, price in best_price.items():
        # 调用c(x)方法计算补货量
        replenish = get_replenish(price)

        # 将补货量存储在结果字典中
        replenishment_dict[column_name] = round(float(replenish), 3)

    # 输出最佳价格组合和对应的总利润
    print("最佳价格组合：", best_price)
    print("补货量组合：", replenishment_dict)
    print("最大总利润：", max_profit_whole)

