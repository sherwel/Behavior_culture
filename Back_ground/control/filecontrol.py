#!/usr/bin/python
#coding:utf-8
'''
Created on 2016年2月10日

@author: root
'''
import os
from tool import webtool
import os,sys
parentdir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
tempdir=parentdir
dirpath=tempdir.replace('\\','/')
print dirpath
sys.path.insert(0,dirpath)
from  xlsdeal import xlsDeal 
import xlrd 


 

def handle_uploaded_file(f,operation):

    folderload= os.path.join(os.path.dirname(__file__), '../../upload/')
    import datetime
    filename=webtool.getlocaltime('%Y-%m-%d_%X')+str(datetime.datetime.now().microsecond)+'_'+f.name
    absolutepath=(folderload+filename).replace('\\','/')
    try:
        
        with open(absolutepath, 'wb+') as destination:
            for chunk in f.chunks():
                destination.write(chunk)
        return getxlsoperate(absolutepath,operation)

    except Exception,e:
        print str(e)+'   file error'
        return False
def getxlsoperate(path,operation):
    print path,operation
    Dic={'path':path}
#     print xlsDeal.Xlsdeal.version
#     ans=xlsDeal.Xlsdeal.insertschool(path=path)
    ans=getattr(xlsDeal.Xlsdeal, operation,'default')(**Dic)

    return ans
    
    
    
    