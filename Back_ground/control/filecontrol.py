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


 

def handle_uploaded_file(f):

    folderload= os.path.join(os.path.dirname(__file__), '../../upload/')
    import datetime
    filename=webtool.getlocaltime('%Y-%m-%d_%X')+str(datetime.datetime.now().microsecond)+'_'+f.name
    absolutepath=(folderload+filename).replace('\\','/')
    try:
        
        with open(absolutepath, 'wb+') as destination:
            for chunk in f.chunks():
                destination.write(chunk)
        
    except Exception,e:
        print str(e)+'   file error'
def getxlsoperate(path):
    
    pass
#     dic={"table":self.config.porttable,"select_params":['ip','port','timesearch','state'],"insert_values":insertdata,"extra":extra}
#     
#     ans=getattr(xlsDeal.XLSdeal, func,'default')(**Dic)
    
    
    
    