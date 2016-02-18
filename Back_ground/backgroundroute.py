#!/usr/bin/python
#coding:utf-8
'''
Created on 2016年1月27日

@author: sherwel
'''



from django.http import HttpResponse,HttpResponseRedirect,HttpResponseNotFound
import datetime
from django.shortcuts import render_to_response
from django.template.context import RequestContext
from control import usercontrol,schoolcontrol,filecontrol,classcontrol,studentcontrol,teachercontrol,evaluationcontrol
from django.views import generic
from tool import webtool
from model.user import User
import httplib
import json
from form import upload_file_form
from django.core.cache import cache
import os

def upload(request):
    response_data = {}  
    response_data['result'] = '0' 
    operation= request.POST.get('operation','')
    if request.method == 'POST' and operation!='':
        form = upload_file_form.UploadFileForm(request.POST, request.FILES)
        if form.is_valid():
            islogin = request.COOKIES.get('islogin',False)

            if islogin:
                result=filecontrol.handle_uploaded_file(request.FILES['file'],operation)
                if result:
                    response_data['result'] = '1' 
                
                return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  
    else:
        form = upload_file_form.UploadFileForm()
    return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  
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
def classmanage(request):
    islogin = request.COOKIES.get('islogin',False)
    username = request.COOKIES.get('username','')
    if islogin:
        return render_to_response('backgroundview/class_manage.html',{'username':username,'form':upload_file_form.UploadFileForm()})
    return render_to_response('backgroundview/login.html', {'data':''})

def takeclass(request):
    islogin = request.COOKIES.get('islogin',False)
    username = request.COOKIES.get('username','')
    if islogin:
        return render_to_response('backgroundview/have_class.html',{'username':username,'form':upload_file_form.UploadFileForm()})
    return render_to_response('backgroundview/login.html', {'data':''})
def studentmanage(request):
    islogin = request.COOKIES.get('islogin',False)
    username = request.COOKIES.get('username','')
    if islogin:
        return render_to_response('backgroundview/student_manage.html',{'username':username,'form':upload_file_form.UploadFileForm()})
    return render_to_response('backgroundview/login.html', {'data':''})
def teachermanage(request):
    islogin = request.COOKIES.get('islogin',False)
    username = request.COOKIES.get('username','')
    if islogin:
        return render_to_response('backgroundview/teacher_manage.html',{'username':username,'form':upload_file_form.UploadFileForm()})
    return render_to_response('backgroundview/login.html', {'data':''})

def schoolmanage(request):
    islogin = request.COOKIES.get('islogin',False)
    username = request.COOKIES.get('username','')
    if islogin:
        return render_to_response('backgroundview/school_manage.html',{'username':username,'form':upload_file_form.UploadFileForm()})
    return render_to_response('backgroundview/login.html', {'data':''})

def studentevaluation(request):
    islogin = request.COOKIES.get('islogin',False)
    username = request.COOKIES.get('username','')
    if islogin:
        return render_to_response('backgroundview/student_evaluation.html',{'username':username,'form':upload_file_form.UploadFileForm()})
    return render_to_response('backgroundview/login.html', {'data':''})
def teacherevaluation(request):
    islogin = request.COOKIES.get('islogin',False)
    username = request.COOKIES.get('username','')
    if islogin:
        return render_to_response('backgroundview/teacher_evaluation.html',{'username':username,'form':upload_file_form.UploadFileForm()})
    return render_to_response('backgroundview/login.html', {'data':''})
def familyevaluation(request):
    islogin = request.COOKIES.get('islogin',False)
    username = request.COOKIES.get('username','')
    if islogin:
        return render_to_response('backgroundview/family_evaluation.html',{'username':username,'form':upload_file_form.UploadFileForm()})
    return render_to_response('backgroundview/login.html', {'data':''})
def schoolshow(request):

    islogin = request.COOKIES.get('islogin',False)
    schoolname=request.POST.get('schoolname','')
    schoolid=request.POST.get('schoolid','')
    province=request.POST.get('province','')
    city=request.POST.get('city','')
    starttime=request.POST.get('starttime','')
    page=request.POST.get('page','0')
    response_data = {}  
    response_data['result'] = '0' 
    response_data['page']=page
    if islogin:
        response_data['result'] = '1' 
        schools,count,pagecount=schoolcontrol.schoolshow(schoolname=schoolname,page=page,schoolid=schoolid,province=province,city=city)
        response_data['length']=count
        response_data['school']=schools
        response_data['pagecount']=pagecount
        return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  
    else:
        
        return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  
def classshow(request):

    islogin = request.COOKIES.get('islogin',False)
    schoolname=request.POST.get('schoolname','')
    classid=request.POST.get('classid','')
    gradeid=request.POST.get('gradeid','')
    schoolid=request.POST.get('schoolid','')
    classname=request.POST.get('classname','')
    page=request.POST.get('page','0')
    response_data = {}  
    response_data['result'] = '0' 
    response_data['page']=page
    if islogin:
        response_data['result'] = '1' 
        classes,count,pagecount=classcontrol.classshow(schoolname=schoolname,page=page,classid=classid,gradeid=gradeid,schoolid=schoolid,classname=classname)
        response_data['length']=count
        response_data['Classes']=classes
        response_data['pagecount']=pagecount
        return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  
    else:
        
        return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  

def haveclassshow(request):

    islogin = request.COOKIES.get('islogin',False)
    classid=request.POST.get('classid','')
    schoolid=request.POST.get('schoolid','')
    teacherid=request.POST.get('teacherid','')
    page=request.POST.get('page','0')
    response_data = {}  
    response_data['result'] = '0' 
    response_data['page']=page
    if islogin:
        response_data['result'] = '1' 
        classes,count,pagecount=classcontrol.haveclassshow(page=page,classid=classid,schoolid=schoolid,teacherid=teacherid)
        response_data['length']=count
        response_data['Classes']=classes
        response_data['pagecount']=pagecount
        return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  
    else:
        
        return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  


def studentshow(request):

    islogin = request.COOKIES.get('islogin',False)
    studentid=request.POST.get('studentid','')
    classid=request.POST.get('classid','')

    page=request.POST.get('page','0')
    response_data = {}  
    response_data['result'] = '0' 
    response_data['page']=page
    if islogin:
        response_data['result'] = '1' 
        students,count,pagecount=studentcontrol.studentshow(studentid=studentid,page=page,classid=classid)
        response_data['length']=count
        response_data['students']=students
        response_data['pagecount']=pagecount
        return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  
    else:
        
        return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  
def teachershow(request):

    islogin = request.COOKIES.get('islogin',False)
    teacherid=request.POST.get('teacherid','')
    schoolid=request.POST.get('schoolid','')

    page=request.POST.get('page','0')
    response_data = {}  
    response_data['result'] = '0' 
    response_data['page']=page
    if islogin:
        response_data['result'] = '1' 
        teachers,count,pagecount=teachercontrol.teachershow(teacherid=teacherid,page=page,schoolid=schoolid)
        response_data['length']=count
        response_data['teachers']=teachers
        response_data['pagecount']=pagecount
        return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  
    else:
        
        return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  
def studentevaluationshow(request):

    islogin = request.COOKIES.get('islogin',False)
    studentid=request.POST.get('studentid','')
    evaluationobject=request.POST.get('evaluationobject','')
    time=request.POST.get('time','')
    type=request.POST.get('type','')
    week=request.POST.get('week','')

    page=request.POST.get('page','0')
    response_data = {}  
    response_data['result'] = '0' 
    response_data['page']=page
    if islogin:
        response_data['result'] = '1' 
        evaluations,count,pagecount=evaluationcontrol.studentshow(studentid=studentid, evaluationobject=evaluationobject, type=type, time=time, week=week, page=page)
        response_data['length']=count
        response_data['evaluations']=evaluations
        response_data['pagecount']=pagecount
        return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  
    else:
        
        return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  


def teacherevaluationshow(request):

    islogin = request.COOKIES.get('islogin',False)
    id=request.POST.get('id','')
    evaluationobject=request.POST.get('evaluationobject','')
    time=request.POST.get('time','')
    type=request.POST.get('type','')
    week=request.POST.get('week','')

    page=request.POST.get('page','0')
    response_data = {}  
    response_data['result'] = '0' 
    response_data['page']=page
    if islogin:
        response_data['result'] = '1' 
        evaluations,count,pagecount=evaluationcontrol.teachershow(id=id, evaluationobject=evaluationobject, type=type, time=time, week=week, page=page)
        response_data['length']=count
        response_data['evaluations']=evaluations
        response_data['pagecount']=pagecount
        return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  
    else:
        
        return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  

def familyevaluationshow(request):

    islogin = request.COOKIES.get('islogin',False)
    id=request.POST.get('id','')
    evaluationobject=request.POST.get('evaluationobject','')
    time=request.POST.get('time','')
    type=request.POST.get('type','')
    week=request.POST.get('week','')

    page=request.POST.get('page','0')
    response_data = {}  
    response_data['result'] = '0' 
    response_data['page']=page
    if islogin:
        response_data['result'] = '1' 
        evaluations,count,pagecount=evaluationcontrol.familyshow(id=id, evaluationobject=evaluationobject, type=type, time=time, week=week, page=page)
        response_data['length']=count
        response_data['evaluations']=evaluations
        response_data['pagecount']=pagecount
        return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  
    else:
        
        return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  

# def getschool(request):   
#     if request.method=='POST':
#         islogin = request.COOKIES.get('islogin',False)
#         schoolid= request.POST.get('schoolid','')
#         page= request.POST.get('page','0')
#         schoolname= request.POST.get('schoolname','')
#         province= request.POST.get('province','')
#         city= request.POST.get('city','')
# 
#         response_data = {}  
#         response_data['result'] = '0' 
# 
#         schools,count,pagecount=schoolcontrol.schoolshow(schoolid=schoolid)
# #             print 'this is administor'
#         if count>0 and schoolid!='':
#             ip=schools[0].getJobaddress()   
#             port=schools[0].getPort()
#             statuss=schools[0].getStatus()
#             isip=webtool.isip(ip)
#             if isip:
#                 
#                 ips,counts,pagecounts=schoolcontrol.schoolshow(ip=ip)
#             else:
#                 ips,counts,pagecounts=schoolcontrol.schoolshow(hostname=ip)
#                 if counts>0:
#                     ip=ips[0].getIP()
#                 else:
#                     ip='未知'
#             response_data['result'] = '1' 
#             response_data['ipstate'] = '0' 
#             response_data['ip']=ip
#             response_data['jobstate']=statuss
# #             print 'it has this task'
#             if counts>0:
# #                 print 'it has this ip'
#                 response_data['ipstate'] = '1' 
#                 response_data['length']=counts
#                 response_data['ips']=ips[0]
#                 response_data['pagecount']=pagecounts
#                 portinfo=portcontrol.divided(port,'port')
#                 ports,portcount,portpagecount=portcontrol.portshow(ip=ip,page=page,extra=portinfo)
#                 response_data['ports']=ports
#                 response_data['portslength']=portcount
#                 response_data['portspagecount']=portpagecount
#                 response_data['portspage']=page
#                 return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  
#             else:
#                 return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  
# 
#         else:
#             return HttpResponse(json.dumps(response_data,skipkeys=True,default=webtool.object2dict), content_type="application/json")  

  
    