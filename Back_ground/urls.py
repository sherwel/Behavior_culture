#!/usr/bin/python
#coding:utf-8
from django.conf.urls import url

from . import backgroundroute as route

urlpatterns = [
    url(r'^$', route.indexpage, name='hello'),
    url(r'^login/$', route.login, name='login'),
    url(r'^logout/$', route.logout, name='logout'),
    url(r'^mainpage/$', route.indexpage, name='mainpage'),
    url(r'^schoolmanage/$', route.schoolmanage, name='schoolmanage'),
#     url(r'^taskdetail/$',route.taskdetail,name='taskdetail'),
#     url(r'^taskdetail/eachtask/$',route.ipmain,name='ipmain'),
    url(r'^schoolshow/$',route.schoolshow,name='schoolshow'),
#     url(r'^jobadd/$',route.jobadd,name='jobadd'),
#     url(r'^jobstart/$',route.startjob,name='startjob'),
#     url(r'^jobpause/$',route.pausejob,name='pausejob'),
#     url(r'^jobdestroy/$',route.destroyjob,name='destroyjob'),  
#     url(r'^chartshow/$',route.chartshow,name='chartshow'),      
#     url(r'^chartdata/$',route.chartdata,name='chartdata'),
#     url(r'^getwork/$',route.getwork,name='getwork'),      
#     url(r'^uploadipinfo/$',route.upload_ip_info,name='uploadipinfo'),
#     url(r'^uploadportinfo/$',route.upload_port_info,name='uploadportinfo'),
    
]