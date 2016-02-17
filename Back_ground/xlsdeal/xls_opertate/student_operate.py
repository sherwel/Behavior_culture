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
def loadstudent(path):
    
    data=xlstool.getdata(path, u'学生')
    studentdata=[]
    studentattenddata=[]
    logindata=[]
    for i in data:

        temp=list(i)
        studentid=uuid.uuid1()
 
        studentdata.append((studentid,temp[0],temp[1],temp[2],temp[3],temp[4],temp[5],temp[6],temp[7],temp[8],temp[9],temp[10]))
        studentattenddata.append((studentid,temp[11],temp[13]))
        logindata.append((temp[12],'e10adc3949ba59abbe56e057f20f883e',studentid))
 
           
    sqlhelp=SQLTool.getObject()
    sqlhelp.connectdb()
    result=sqlhelp.inserttableinfo_byparams(config.Config.studenttable, ['studentId','name','sex','birthday','address','familyPhone','mail','family','admissionTime','nation','placeOfOrigin','team'], studentdata)
    if result:
        result=sqlhelp.inserttableinfo_byparams(config.Config.student_attend_table, ['studentId','classId','time'], studentattenddata)
        if result:
            result=sqlhelp.inserttableinfo_byparams(config.Config.usertable, ['username','password','userId'], logindata)
   
    return result


if __name__ == '__main__':
    loadstudent('/root/github/Behavior_culture/Back_ground/xlsdeal/xls_opertate/student.xls')
    
