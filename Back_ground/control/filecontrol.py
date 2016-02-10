#!/usr/bin/python
#coding:utf-8
'''
Created on 2016年2月10日

@author: root
'''
import os
def handle_uploaded_file(f):
    folderload= os.path.join(os.path.dirname(__file__), '../../upload/')
    filename='a.txt'
    absolutepath=(folderload+filename).replace('\\','/')
    with open(absolutepath, 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)