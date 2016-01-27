#!/usr/bin/python
#coding:utf-8
'''
Created on 2016年1月27日

@author: root
'''



from django.http import HttpResponse,HttpResponseRedirect,HttpResponseNotFound
import datetime
from django.shortcuts import render_to_response
from django.template.context import RequestContext
from control import usercontrol,schoolcontrol
from django.views import generic
from tool import webtool
from model.user import User
from tool import  connectpool
import httplib
import json
def hello(request):
    return HttpResponse("Hello world")
def logout(request):
    response= render_to_response('backgroundview/login.html', {'data':''})
    webtool.delCookies(response)
    return response
def login(request):
    if request.method=='GET':
        return render_to_response('backgroundview/login.html', {'data':''})
    else:
        username=request.POST.get('username','')
        password=request.POST.get('password','')

        result,username,role,power= usercontrol.validuser(username,password)
        if result:
            response = render_to_response('backgroundview/mainpage.html', {'data':'用户名和密码成功','username':username})  
            loginuser=User(result,username,password,role,power)
#将username写入浏览器cookie,失效时间为3600

            webtool.setCookies(response,loginuser,3600)

            return response
        else:
            return render_to_response('backgroundview/login.html', {'data':'用户名或密码错误'})  
def indexpage(request):
    islogin = request.COOKIES.get('islogin',False)
    username = request.COOKIES.get('username','')
    if islogin:
        return render_to_response('backgroundview/mainpage.html',{'username':username})
    return render_to_response('backgroundview/login.html', {'data':''})
def schoolmanage(request):
    islogin = request.COOKIES.get('islogin',False)
    username = request.COOKIES.get('username','')
    if islogin:
        return render_to_response('backgroundview/school_manage.html',{'username':username})
    return render_to_response('backgroundview/login.html', {'data':''})
def getschool(request):   
    if request.method=='POST':
        islogin = request.COOKIES.get('islogin',False)
        schoolid= request.POST.get('schoolid','')
        page= request.POST.get('page','0')
        schoolname= request.POST.get('schoolname','')
        province= request.POST.get('province','')
        city= request.POST.get('city','')
        username = request.COOKIES.get('username','') 
        role = request.COOKIES.get('role','1')
        response_data = {}  
        response_data['result'] = '0' 
        if role=='admin':
            jobs,count,pagecount=schoolcontrol.jobshow(username=username,taskid=jobid)
#             print 'this is user'
        else:
            jobs,count,pagecount=schoolcontrol.jobshow(taskid=jobid)
#             print 'this is administor'
        if count>0 and jobid!='':
            ip=jobs[0].getJobaddress()   
            port=jobs[0].getPort()
            statuss=jobs[0].getStatus()
            isip=webtool.isip(ip)
            if isip:
                
                ips,counts,pagecounts=ipcontrol.ipshow(ip=ip)
            else:
                ips,counts,pagecounts=ipcontrol.ipshow(hostname=ip)
                if counts>0:
                    ip=ips[0].getIP()
                else:
                    ip='未知'
            response_data['result'] = '1' 
            response_data['ipstate'] = '0' 
            response_data['ip']=ip
            response_data['jobstate']=statuss
#             print 'it has this task'
            if counts>0:
#                 print 'it has this ip'
                response_data['ipstate'] = '1' 
                response_data['length']=counts
                response_data['ips']=ips[0]
                response_data['pagecount']=pagecounts
                portinfo=portcontrol.divided(port,'port')
                ports,portcount,portpagecount=portcontrol.portshow(ip=ip,page=page,extra=portinfo)
                response_data['ports']=ports
                response_data['portslength']=portcount
                response_data['portspagecount']=portpagecount
                response_data['portspage']=page
                return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  
            else:
                return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  

        else:
            return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  

  
    