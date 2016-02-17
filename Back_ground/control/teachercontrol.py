#!/usr/bin/python
#coding:utf-8
from tool import SQLTool ,config
from Back_ground.model import teacher


limitpage=15


localconfig=config.Config()
def teachershow(schoolid='',teacherid='',name='',phone='',offer='',job='',schoolname='',page='0'):
    validresult=False
    request_params=[]
    values_params=[]
    if schoolid!='':
        request_params.append('t_teachers.schoolId')
        values_params.append(SQLTool.formatstring(schoolid))
    if teacherid!='':
        request_params.append('teacherId')
        values_params.append(SQLTool.formatstring(teacherid))
    if name!='':
        request_params.append('teacherName')
        values_params.append(SQLTool.formatstring(name))
    if phone!='':
        request_params.append('teacherPhone')
        values_params.append(SQLTool.formatstring(phone))
    if offer!='':
        request_params.append('offer')
        values_params.append(SQLTool.formatstring(offer))
    if job!='':
        request_params.append('jobTitle')
        values_params.append(SQLTool.formatstring(job))
    if schoolname!='':
        request_params.append('schoolName')
        values_params.append(SQLTool.formatstring(schoolname))
   
    request_params.append('t_school.schoolId')
    values_params.append('t_teachers.schoolId')


    DBhelp=SQLTool.DBmanager()
    DBhelp.connectdb()
    table=localconfig.teachertable
    result,content,count,col=DBhelp.searchtableinfo_byparams([table,localconfig.schooltable], ['t_teachers.schoolId','teacherId','teacherName','teacherPhone','offer','jobTitle','schoolName'], request_params, values_params)

    if count == 0:
        pagecount = 0;
    elif count %limitpage> 0:
#         pagecount = math.ceil(count / limitpage)
        pagecount=int((count+limitpage-1)/limitpage) 


    else:
        pagecount = count / limitpage

#     print pagecount
    if pagecount>0:
    
        limit='    limit  '+str(int(page)*limitpage)+','+str(limitpage)
        result,content,count,col=DBhelp.searchtableinfo_byparams([table,localconfig.schooltable], ['t_teachers.schoolId','teacherId','teacherName','teacherPhone','offer','jobTitle','schoolName'], request_params, values_params,limit,order=' teacherId desc')

        DBhelp.closedb()
        teachers=[]
        if count>0:
            validresult=True
            for temp in result :
                ateacher=teacher.Teacher(schoolid=temp['schoolId'],teacherid=temp['teacherId'],name=temp['teacherName'],phone=temp['teacherPhone'],offer=temp['offer'],job=temp['jobTitle'],schoolname=temp['schoolName'])


                teachers.append(ateacher)
        return teachers,count,pagecount
    return [],0,pagecount
##count为返回结果行数，col为返回结果列数,count,pagecount都为int型
def loadclass(request,username=''):
    schoolname=request.POST.get('schoolname','')
    schoolid=request.POST.get('schoolid','')
    province=request.POST.get('province','')
    city=request.POST.get('city','')
    starttime=request.POST.get('starttime','')
    tempschool=None
    if schoolid=='' or schoolname=='':
        return tempschool,False
    tempschool=school.School(schoolname=schoolname,schoolid=schoolid,province=province,city=city)
    
    return tempschool,True
def classadd(school):
    schoolname=school.getSchoolname()
    schoolid=school.getSchoolid()
    province=school.getProvince()
    city=school.getCity()
    starttime=school.getStarttime()



    request_params=[]
    values_params=[]
    if schoolname!='':
        request_params.append('schoolName')
        values_params.append(SQLTool.formatstring(schoolname))
    if schoolid!='':
        request_params.append('schoolId')
        values_params.append(SQLTool.formatstring(schoolid))
    if province!='':
        request_params.append('province')
        values_params.append(SQLTool.formatstring(province))
    if city!='':
        request_params.append('city')
        values_params.append(SQLTool.formatstring(city))
    if starttime!='':
        request_params.append('starttime')
        values_params.append(SQLTool.formatstring(starttime))      
    table=localconfig.schooltable
    DBhelp=SQLTool.DBmanager()
    DBhelp.connectdb()

    tempresult=DBhelp.inserttableinfo_byparams(table=table, select_params=request_params,insert_values= [tuple(values_params)])

    DBhelp.closedb()

    return tempresult

def classupdate(schoolname='',schoolid='',province='',city='',starttime=''):


    request_params=[]
    values_params=[]
    wset_params=[]
    wand_params=[]
    if schoolname!='':
        request_params.append('schoolName')
        values_params.append(SQLTool.formatstring(schoolname))
    if schoolid!='':
        request_params.append('schoolId')
        values_params.append(SQLTool.formatstring(schoolid))
    if province!='':
        request_params.append('province')
        values_params.append(SQLTool.formatstring(province))
    if city!='':
        request_params.append('city')
        values_params.append(SQLTool.formatstring(city))
    if starttime!='':
        request_params.append('starttime')
        values_params.append(SQLTool.formatstring(starttime))
    table=localconfig.schooltable
    DBhelp=SQLTool.DBmanager()
    DBhelp.connectdb()

    tempresult=DBhelp.updatetableinfo_byparams([table],request_params,values_params,wset_params,wand_params)
    DBhelp.closedb()

    return tempresult

    
    
    