#!/usr/bin/python
#coding:utf-8
'''
Created on 2016年2月12日

@author: sherwel
'''
from xls_opertate import school_operate
class Xlsdeal(object):



    def __init__(self, params):
        pass
    @staticmethod
    def insertschool(self,path):
        result=school_operate.loadschool(path)
        print result
