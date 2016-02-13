#!/usr/bin/python
#coding:utf-8
'''
Created on 2016年2月10日

@author: root
'''
from django import forms

class UploadFileForm(forms.Form):
    
    file = forms.FileField()
