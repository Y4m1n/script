#! /usr/local/bin/python3
import pandas as pd
###TODO: 自动下载番茄表单数据
# 载入问卷数据为DataFrame
file_name="/Users/y4m1n/Downloads/一(2)班学生信息.xlsx"
df = pd.read_excel(file_name,usecols="C,D,F,H,J,L,K")
# 替换户籍代码
df=df.replace('深户',1)
df=df.replace('非深户',3)
# 删除旧的id
df=df.drop_duplicates('学生编号', keep='first')
# 按学号排序
df=df.sort_values(by='学生编号')
# 插入年级和班级
grade='01'
class_id='2'
df.insert(4,'年级',grade)
df.insert(5,'班级',class_id)
# 检查有没有没填的
num_of_students=55
ids=list(range(1,num_of_students+1))
# 删除无效学号
ids.remove(4)
total=len(ids)
for id in df['学生编号']:
    ids.remove(id)
if len(ids)==0:
    # 都填了导出excel文件
    up_file='/Users/y4m1n/Downloads/一(2)班学生信息上交.xlsx'
    df.to_excel(up_file,header=False,index=False)
    print('收齐啦！')
    # 保存学生完整信息文件
    df = pd.read_excel(file_name).drop(['序号','提交时间'],axis=1).drop_duplicates('学生编号', keep='first').sort_values(by='学生编号')
    df.to_excel(file_name,index=False)
else:
    # 提示没填者学号
    print(df.head())
    print('已填{}份，没填问卷学号：{}'.format((total-len(ids)),ids))
    # 删除问卷数据
    import os
    if os.path.exists(file_name):
      os.remove(file_name)
