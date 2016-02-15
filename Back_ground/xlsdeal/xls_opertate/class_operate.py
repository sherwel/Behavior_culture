#!/usr/bin/python
#coding:utf-8
'''
Created on 2016年2月12日

@author: root
'''
import xlstool


import os,sys
parentdir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
tempdir=parentdir+'/../../'
dirpath=tempdir.replace('\\','/')
sys.path.insert(0,dirpath)
from tool import SQLTool,config
import uuid
def loadclass(path):
    
    data=xlstool.getdata(path, u'班级')
    classdata=[]
    classnamedata=[]
    for i in data:
        temp=list(i)
        classid=uuid.uuid1()
        print classid
#         temp.append('classid')
        classdata.append((temp[0],temp[1],temp[2],classid))
        classnamedata.append((temp[3],classid))

          
    sqlhelp=SQLTool.getObject()
    sqlhelp.connectdb()
    result=sqlhelp.inserttableinfo_byparams(config.Config.classtable, ['schoolId','gradeId','cid','classId'], classdata)
    if result:
        result=sqlhelp.inserttableinfo_byparams(config.Config.classnametable, ['className','classId'], classnamedata)
 
    return result


if __name__ == '__main__':
    loadclass('/root/github/Behavior_culture/Back_ground/xlsdeal/xls_opertate/class.xls')
    
