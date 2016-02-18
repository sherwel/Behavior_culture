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
    url(r'^classmanage/$', route.classmanage, name='classmanage'),
    url(r'^studentmanage/$', route.studentmanage, name='studentmanage'),
    url(r'^teachermanage/$', route.teachermanage, name='teachermanage'),
    url(r'^studentevaluation/$', route.studentevaluation, name='studentevaluation'),
    url(r'^teacherevaluation/$', route.teacherevaluation, name='teacherevaluation'),
    url(r'^familyevaluation/$', route.familyevaluation, name='familyevaluation'),
    url(r'^haveclass/$',route.takeclass,name='takeclass'),
    url(r'^fileupload/$',route.upload,name='upload'),
#     url(r'^get_upload_progress?.*$', route.get_upload_progress),
#     url(r'^taskdetail/$',route.taskdetail,name='taskdetail'),
#     url(r'^taskdetail/eachtask/$',route.ipmain,name='ipmain'),
    url(r'^schoolshow/$',route.schoolshow,name='schoolshow'),
    url(r'^classshow/$',route.classshow,name='classshow'),
    url(r'^haveclassshow/$',route.haveclassshow,name='haveclassshow'),
    url(r'^studentshow/$',route.studentshow,name='studentshow'),
    url(r'^teachershow/$',route.teachershow,name='teachershow'),
    url(r'^sevaluationshow/$',route.studentevaluationshow,name='studentevaluationshow'),
    url(r'^tevaluationshow/$',route.teacherevaluationshow,name='teacherevaluationshow'),
    url(r'^fevaluationshow/$',route.familyevaluationshow,name='familyevaluationshow'),
    
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