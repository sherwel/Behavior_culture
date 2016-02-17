#!/usr/bin/python
#coding:utf-8

from tool import webtool
import uuid
class Teacher(object):
    def __init__(self,schoolid='',teacherid='',name='',phone='',offer='',job='',schoolname=''):
        '''
        Constructor
        '''
        self.schoolid=schoolid
        self.phone=phone
        self.offer=offer
        self.job=job
        self.schoolname=schoolname
        self.name=name


        if teacherid!='':
            self.teacherid=teacherid
        else:
            self.teacherid=uuid.uuid1()



    def getTeacherid(self):
        return self.teacherid

    def getSchoolname(self):
        return self.schoolname

   
   
   