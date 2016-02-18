#!/usr/bin/python
#coding:utf-8

from tool import webtool
import uuid
class Takeclass(object):
    def __init__(self,teacherid='',schoolid='',masterid='',time='',teachername='',classid=''):
        '''
        Constructor
        '''
        self.teacherid=teacherid
        self.schoolid=schoolid
        self.masterid=masterid
        self.time=time
        self.teachername=teachername
        if classid!='':
            self.classid=classid
        else:
            self.classid=uuid.uuid1()



   
   
   