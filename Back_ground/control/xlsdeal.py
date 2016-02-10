#!/usr/bin/python
#coding:utf-8
'''
Created on 2016年2月10日

@author: root
'''
import xlrd
if __name__ == '__main__':
    data = xlrd.open_workbook('demo.xls') 
    print data.sheet_names()
    table = data.sheet_by_name(u'学校')
    nrows = table.nrows #获取行数

    ncols = table.ncols #获取列数
    for rownum in range(table.nrows):
        data=table.row_values(rownum)
        for colnum in range(table.ncols):
            print data[colnum]