import os
import matplotlib.pyplot as plt
import matplotlib as mpl
import numpy as np
import seaborn as sns

# #多epoch可视化分析
# path = './'
# dataname = os.listdir(path)
# filesname = [path + x for x in dataname if x[-4:] == '.txt']
# print(filesname)
# dir_loss = {}
# dir_ste = {}
# dir_std = {}
# dir_other = {}
# for file in filesname:
#     with open(file, 'r') as f:
#         text = f.read().splitlines()
#         loss = [float(x[x.find('Loss:') + 5:-11]) for x in text if x.find('Loss:') != -1]
#         ste = [float(x[x.find('AUPRC_STE:') + 10:x.find(',AUPRC_STD:')]) for x in text if x.find('AUPRC_STE:') != -1]
#         std = [float(x[x.find('AUPRC_STD:') + 10:x.find(',AUPRC_other:')]) for x in text if x.find('AUPRC_STD:') != -1]
#         other = [float(x[x.find('AUPRC_other:') + 12:-1]) for x in text if x.find('AUPRC_other:') != -1]
#     dir_loss[file] = loss
#     dir_ste[file] = ste
#     dir_std[file] = std
#     dir_other[file] = other
# # plt.figure(figsize=(20, 10), dpi=100)
# # plt.plot(np.arange(len(dir_loss[filesname[0]][0:-1:2])), dir_loss[filesname[0]][0:-1:2])
# # plt.show()
# x = np.arange(len(dir_loss[filesname[2]][0:202]))
# y1 = dir_loss[filesname[2]][0:202]
# y2 = dir_loss[filesname[3]][0:202]
# color1 = "#038355"  # 孔雀绿
# color2 = "#ffc34e"  # 向日黄
# font = {'family': 'Times New Roman',
#         'size': 12}
# plt.rc('font', **font)
# sns.set_style("whitegrid")  # 设置背景样式
# sns.lineplot(x=x, y=y1, color=color1, linewidth=2.0, markeredgecolor="white",
#              markeredgewidth=1.5, label='no filtering')
# sns.lineplot(x=x, y=y2, color=color2, linewidth=2.0, markeredgecolor="white",
#              markeredgewidth=1.5, label='After filtering')
# plt.title("Whether filtering is performed", fontweight='bold', fontsize=14)
# plt.xlabel("Batch", fontsize=12)
# plt.ylabel("Loss", fontsize=12)
# # 添加图例
# plt.legend(loc='upper left', frameon=True, fontsize=10)
#
# # 设置刻度字体和范围
# plt.xticks(fontsize=10)
# plt.yticks(fontsize=10)
# plt.xlim(0, len(x)*11/10)
# plt.ylim(0, max(max(y1), max(y2))*11/10)
#
# # 设置坐标轴样式
# for spine in plt.gca().spines.values():
#     spine.set_edgecolor("#CCCCCC")
#     spine.set_linewidth(1.5)
#
# # plt.savefig('lineplot.png', dpi=300, bbox_inches='tight')
# # 显示图像
# plt.show()

# 末AUPRC验证集验证
mpl.rcParams["font.sans-serif"] = ["SimHei"]
# 指定字体为SimHei，用于显示中文，如果Ariel,中文会乱码
mpl.rcParams["axes.unicode_minus"] = False
# 用来正常显示负号

x = np.arange(3)  # 产生1~3的序列
# auprc_loss
y = [0.9626, 0.7137, 0.3810]
y1 = [0.9644, 0.6895, 0.3796]
# 有无过采样后的auprc
y = [0.7838, 0.7786, 0.4860]
y1 = [0.6975, 0.8420, 0.4831]
# fl loss与交叉熵
y = [0.7838, 0.7786, 0.4860]
y1 = [0.4152, 0.4410, 0.9838]
#AUPRC
y=[0.8168, 0.8054, 0.4130]
# 数据
tick_label = ["STE", "STD", "Others"]
# 定义柱子的标签
bar_width = 0.35
# 定义柱宽
plt.bar(x, y, bar_width, color="#ffc34e", align="center", label="AUPRC")
# plt.bar(x + bar_width, y1, bar_width, color="blue", align="center", label="Cross entropy loss")
for i in x:
    plt.text(x[i] - bar_width / 4, y[i] + 0.001, y[i])
    # plt.text(x[i] + bar_width / 2, y1[i] + 0.001, y1[i])

# 绘制纵向柱状图,hatch定义柱图的斜纹填充，省略该参数表示默认不填充。

plt.xticks(x, tick_label)

plt.xlabel("心电ST段类别")
plt.ylabel("AUPRC")
plt.legend()
plt.show()
