# coding:utf-8
import os
folder=raw_input('输入作业文件夹名:')
path='/Users/y4m1n/Downloads/'+folder
last_name=['方','孔','杨','胡','牛','王','陈','张','宋','董','付',
           '李','王','方','卫','孙','崔','文','钟','吴','唐','俞',
           '曾','刘','连','于','潘','黄','罗','苏','马','程','郑','蔡']
# 遍历目录内文件
for file in os.listdir(path):
    # 找有后缀的
    if file.find('.')>0:
        postfix = file.split('.')[-1]
        file_name = file.strip().split('.')[0]
        for name_part in file_name.split('-'):
            # 找学号
            if name_part.isdigit():
                id = name_part
                # 学号没写两位的则只保留两位
                if len(id) > 2:
                    id = id[-2:]
            # 找姓名
            elif name_part[0] in last_name:
                name = name_part
            else:
                print 'Wrong file name: '+file
            # 新名字
            new_name=id+'-'+name+'.'+postfix
            file_path = os.path.join(path, file)
            new_file_path = os.path.join(path, new_name)
            # 改名
            os.rename(file_path, new_file_path)
