#!/usr/bin/python
#coding:utf-8
'''
Created on 2016年2月12日

@author: sherwel
'''
from xls_opertate import class_operate,school_operate,student_operate,teacher_operate
class Xlsdeal():


    version=0
    def __init__(self):
        pass
    @staticmethod
    def insertschool(path=''):
        result=school_operate.loadschool(path)
        print result
        return result
    @staticmethod
    def insertclass(path=''):
        result=class_operate.loadclass(path)
        print result
        return result
    @staticmethod
    def insertstudent(path=''):
        result=student_operate.loadstudent(path)
        print result
        return result
    @staticmethod
    def insertteacher(path=''):
        result=teacher_operate.loadteacher(path)
        print result
        return result
    @staticmethod
    def inserthaveclass(path=''):
        result=class_operate.loadclasstake(path)
        print result
        return result    
    