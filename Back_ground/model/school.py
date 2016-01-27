#!/usr/bin/python
#coding:utf-8
import uuid
from tool import webtool
class School(object):
    def __init__(self,schoolname='',schoolid='',province='',city='',starttime=''):
        '''
        Constructor
        '''

        self.schoolname=schoolname

        self.province=province
        self.starttime=starttime
        self.city=city



        if schoolid!='':
            self.schoolid=schoolid
        else:
            self.schoolid=uuid.uuid1()

    def setSchoolname(self,schoolname):
        self.schoolname=schoolname
    def setSchoolid(self,schoolid):
        self.schoolid=schoolid
        
    def setProvince(self,province):
        self.province=province
    def setCity(self,city):
        self.city=city
    def setStarttime(self,starttime):
        self.starttime=starttime
    def getSchoolname(self):
        return self.schoolname
    def getSchoolid(self):
        return self.schoolid
    def getProvince(self):
        return self.province
    def getCity(self):
        return self.city
    def getStarttime(self):
        return self.starttime
   