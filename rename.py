# coding:utf-8
import os
folder=raw_input('输入作业文件夹名:')
path='/Users/y4m1n/Downloads/简心作业/'+folder
for file in os.listdir(path):
    if file.find('.')>0:
        postfix = file.split('.')[-1]
        print 'postfix:'+postfix
        file_name=file.split('.')[0]
        id= file_name.split('-')[-2]
        if len(id)>2:
            id=id[-2:]
            print 'id changed to:'+ id
        name=file_name.split('-')[-1]
        new_name=id+'-'+name+'.'+postfix
        print 'new_name:'+new_name
        file_path = os.path.join(path, file)
        new_file_path = os.path.join(path, new_name)
        os.rename(file_path, new_file_path)
