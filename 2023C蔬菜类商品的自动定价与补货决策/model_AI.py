from define import *


def pre_data(sheet_name):
    # 设置随机种子以确保结果可复现
    tf.random.set_seed(42)

    # 读取数据
    os.chdir(xlsx_path)
    df = pd.read_excel(csv4_name, sheet_name=sheet_name, header=0)
    x = df[f'{sheet_name}_x'].values.reshape(-1, 1)
    y = df[f'{sheet_name}_y'].values.reshape(-1, 1)

    # 划分数据集为训练集和测试集
    x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2)

    return x_train, x_test, y_train, y_test


def plot_model(x_test, y_test, y_pred, model_type):
    # 绘制性能曲线（实际值 vs. 预测值）
    plt.figure()
    plt.scatter(x_test, y_test, color='blue', s=10, label='实际值')
    plt.scatter(x_test, y_pred, color='red', s=10, label='预测值')
    plt.xlabel('售价（元/千克）')
    plt.ylabel('销量（千克）')
    # 计算均方误差
    mse = mean_squared_error(y_test, y_pred)
    # 均方根误差（RMSE）
    rmse = np.sqrt(mse)
    rmse = round(rmse, 3)
    plt.title(f'{model_type}性能曲线 RMSE = {rmse}')


def pkl2mat(sheet_name):
    os.chdir(r'C:\iCloudDrive\项目\高教杯\模型\GPR\v2')
    # 请替换为实际的文件名
    pkl_file = f'model_GPR_{sheet_name}_v2.pkl'

    # 使用pickle加载高斯模型
    with open(pkl_file, 'rb') as file:
        a_model = pickle.load(file)

    # 将高斯回归模型保存为MAT文件
    sio.savemat(f'model_GPR_{sheet_name}_v2.mat', {'a_model': a_model})


def train_NN(sheet_name):
    x_train, x_test, y_train, y_test = pre_data(sheet_name)

    # 构建神经网络模型
    model = keras.Sequential([
        keras.layers.Dense(64, activation='relu', input_shape=(1,)),
        keras.layers.Dense(32, activation='relu'),
        # 输出层，没有激活函数，用于回归问题
        keras.layers.Dense(1)
    ])

    # 编译模型
    model.compile(optimizer='adam', loss='mean_squared_error', metrics=['mean_squared_error'])
    # 训练模型
    model.fit(x_train, y_train, epochs=200, batch_size=32, validation_data=(x_test, y_test))

    y_pred = model.predict(x_test)

    plot_model(x_test, y_test, y_pred, 'NN')

    # 保存模型到文件
    os.chdir(model_path)
    plt.savefig(f'model_NN_{sheet_name}_v1.png')
    plt.close('all')
    model.save(f'model_NN_{sheet_name}_v1.h5')


def train_GPR(sheet_name):
    x_train, x_test, y_train, y_test = pre_data(sheet_name)

    # 构建高斯过程回归模型
    kernel = C(1.0, (1e-3, 1e3)) * RBF(1.0, (1e-2, 1e2)) + WhiteKernel(1e-3)
    model = GaussianProcessRegressor(kernel=kernel, n_restarts_optimizer=10)

    # 拟合模型
    model.fit(x_train, y_train)

    # 预测测试集数据
    y_pred, _ = model.predict(x_test, return_std=True)

    plot_model(x_test, y_test, y_pred, 'GPR')

    # 保存模型到文件
    os.chdir(model_path)
    plt.savefig(f'model_GPR_{sheet_name}_v2.png')
    plt.close('all')
    # 保存模型到文件
    joblib.dump(model, f'model_GPR_{sheet_name}_v2.pkl')


def train_DTR(sheet_name):
    x_train, x_test, y_train, y_test = pre_data(sheet_name)

    # 构建决策树回归模型
    model = DecisionTreeRegressor(max_depth=5)

    # 拟合模型
    model.fit(x_train, y_train)

    # 预测测试集数据
    y_pred = model.predict(x_test)

    plot_model(x_test, y_test, y_pred, 'DTR')

    # 保存模型到文件
    os.chdir(model_path)
    plt.savefig(f'model_DTR_{sheet_name}_v2.png')
    plt.close('all')
    dump(model, f'model_DTR_{sheet_name}_v2.joblib')
