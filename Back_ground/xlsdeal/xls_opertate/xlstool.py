#!/usr/bin/python
#coding:utf-8
'''
Created on 2016年2月13日

@author: root
'''
import xlrd
def getdata(path,sheet,col=''):
    dataset=[]
    try:  
        data = xlrd.open_workbook(path) 
        table = data.sheet_by_name(sheet)
#         nrows = table.nrows #获取行数
# 
#         ncols = table.ncols #获取列数
        
        for rownum in range(table.nrows):
            if col=='':
                data=table.row_values(rownum)
                rowdata=tuple(data)
                dataset.append(rowdata)
            else:
                pass
        return dataset
    except Exception,e:  
        print str(e)
        return dataset