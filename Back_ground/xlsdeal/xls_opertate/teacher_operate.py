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
def loadteacher(path):
    
    data=xlstool.getdata(path, u'教师')
    teachdata=[]
    attenddata=[]
    logindata=[]
    for i in data:
        temp=list(i)
        teacherid=uuid.uuid1()
        teachdata.append((temp[0],teacherid,temp[1],temp[2],temp[3],temp[4],'123456'))
        logindata.append((temp[5],'e10adc3949ba59abbe56e057f20f883e',teacherid))

          
    sqlhelp=SQLTool.getObject()
    sqlhelp.connectdb()
    result=sqlhelp.inserttableinfo_byparams(config.Config.teachertable, ['schoolId','teacherId','teacherName','teacherPhone','offer','jobTitle','password'], teachdata)
    if result:

        result=sqlhelp.inserttableinfo_byparams(config.Config.usertable, ['username','password','userId'], logindata)
  
    return result


if __name__ == '__main__':
    loadteacher('/root/github/Behavior_culture/Back_ground/xlsdeal/xls_opertate/student.xls')
    
