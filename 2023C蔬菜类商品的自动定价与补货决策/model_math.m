% 设置Python解释器路径（替换为您的Python解释器路径）
pyExec = 'C:\Python\python.exe'; 

% 指定要加载的Python脚本或代码
pyCode = 'load_pkl_model.py'; 

% 运行Python脚本并加载模型
system([pyExec ' ' pyCode]);

% 在MATLAB中访问已加载的Python变量
pyModel = py.load_pkl_model.get_model(); % 假设get_model()是Python脚本中的一个函数

% 将Python变量转换为MATLAB变量
matlabModel = double(py.array.array('d', pyModel));

% 在MATLAB中使用matlabModel进行进一步的分析或计算
