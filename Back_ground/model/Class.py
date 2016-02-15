#!/usr/bin/python
#coding:utf-8

from tool import webtool
import uuid
class Class(object):
    def __init__(self,schoolname='',schoolid='',gradeid='',cid='',classname='',classid=''):
        '''
        Constructor
        '''
        self.schoolname=schoolname
        self.schoolid=schoolid
        self.gradeid=gradeid
        self.cid=cid
        self.classname=classname
        if classid!='':
            self.classid=classid
        else:
            self.classid=uuid.uuid1()


    def getSchoolame(self):
        return self.schoolname
    def getSchoolid(self):
        return self.schoolid
    def getGradeid(self):
        return self.gradeid
    def getCid(self):
        return self.cid
    def getClassname(self):
        return self.classname
    def getClassid(self):
        return self.classid

   
   
   