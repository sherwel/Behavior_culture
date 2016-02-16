#!/usr/bin/python
#coding:utf-8

from tool import webtool
import uuid
class Student(object):
    def __init__(self,studentid='',name='',sex='',birthday='',address='',familyPhone='',mail='',family='',admissionTime='',nation='',placeOfOrigin='',team='',classid=''):
        '''
        Constructor
        '''
        self.name=name
        self.sex=sex
        self.birthday=birthday
        self.address=address
        self.familyPhone=familyPhone
        self.mail=mail
        self.family=family
        self.admissionTime=admissionTime
        self.nation=nation
        self.placeOfOrigin=placeOfOrigin
        self.team=team
        self.classid=classid
        if studentid!='':
            self.studentid=studentid
        else:
            self.studentid=uuid.uuid1()



    def getStudentid(self):
        return self.studentid

    def getClassid(self):
        return self.classid

   
   
   