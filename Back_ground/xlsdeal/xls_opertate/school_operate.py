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
def loadschool(path):
    
    data=xlstool.getdata(path, u'学校')

    sqlhelp=SQLTool.getObject()
    sqlhelp.connectdb()
    result=sqlhelp.inserttableinfo_byparams(config.Config.schooltable, ['province','city','schoolName','schoolTime'], data)
    return result


if __name__ == '__main__':
    loadschool('/root/github/Behavior_culture/Back_ground/xlsdeal/xls_opertate/demo.xls')
    
