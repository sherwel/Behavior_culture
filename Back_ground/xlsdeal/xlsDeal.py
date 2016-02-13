#!/usr/bin/python
#coding:utf-8
'''
Created on 2016年2月12日

@author: sherwel
'''
from xls_opertate import school_operate
class Xlsdeal():


    version=0
    def __init__(self):
        pass
    @staticmethod
    def insertschool(path=''):
        result=school_operate.loadschool(path)
        print result
        return result
