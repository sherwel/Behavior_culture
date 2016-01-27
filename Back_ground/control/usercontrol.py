#!/usr/bin/python
#coding:utf-8
from tool import SQLTool ,config,webtool

localconfig=config.Config()
def validuser(username,password):
    validresult=False
    password=webtool.md5(password)
    DBhelp=SQLTool.DBmanager()
    DBhelp.connectdb()
    result,content,count,col=DBhelp.searchtableinfo_byparams([localconfig.usertable], ['userName','password','userid'], ['userName','password'], [SQLTool.formatstring(username),SQLTool.formatstring(password)])
    DBhelp.closedb()
    role=''
    userpower=''
    if col>0:
        
        validresult=True
#         role=result[0]['role']
#         userpower=result[0]['userpower']
        role='admin'
        userpower='admin'
    return validresult,username,role,userpower
    