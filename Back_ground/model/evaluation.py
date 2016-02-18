#!/usr/bin/python
#coding:utf-8
import uuid
from tool import webtool
class Evaluation(object):
    def __init__(self,id='',evaluationobject='',evaluationscore='',type='',time='',week='',content=''):
        '''
        Constructor
        '''

        self.id=id

        self.evaluationobject=evaluationobject
        self.evaluationscore=evaluationscore
        self.type=type
        self.time=time
        self.week=week
        self.content=content



    def getId(self):
        return self.id
    def getEvaluationobject(self):
        return self.evaluationobject
    def getEvaluationscore(self):
        return self.evaluationscore
    def getType(self):
        return self.type
    def getTime(self):
        return self.time
   