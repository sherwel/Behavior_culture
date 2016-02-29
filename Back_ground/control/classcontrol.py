#!/usr/bin/python
#coding:utf-8
from tool import SQLTool ,config
from Back_ground.model import takeclass,Class


limitpage=15


localconfig=config.Config()
def haveclassshow(schoolid='',classid='',teacherid='',page='0'):
    validresult=False
    request_params=[]
    values_params=[]
    if schoolid!='':
        request_params.append('schoolId')
        values_params.append(SQLTool.formatstring(schoolid))
    if classid!='':
        request_params.append('t_classes.classId')
        values_params.append(SQLTool.formatstring(classid))
    if teacherid!='':
        request_params.append('teacherId')
        values_params.append(SQLTool.formatstring(teacherid))

    request_params.append('t_teach.teacherId')
    values_params.append('t_teachers.teacherId')

    DBhelp=SQLTool.DBmanager()
    DBhelp.connectdb()
    table=localconfig.teachertable
    result,content,count,col=DBhelp.searchtableinfo_byparams([table,localconfig.teachtable], ['t_teachers.teacherId','masterId','time','schoolId','teacherName','classId'], request_params, values_params)

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
        result,content,count,col=DBhelp.searchtableinfo_byparams([table,localconfig.teachtable], ['t_teachers.teacherId','masterId','time','schoolId','teacherName','classId'], request_params, values_params,limit,order='time desc')

        DBhelp.closedb()
        classes=[]
        if count>0:
            validresult=True
            for temp in result :
                aclass=takeclass.Takeclass(teacherid=temp['teacherId'],schoolid=temp['schoolId'],masterid=temp['masterId'],time=temp['time'],teachername=temp['teacherName'],classid=temp['classId'])


                classes.append(aclass)
        return classes,count,pagecount
    return [],0,pagecount
def classshow(schoolname='',schoolid='',gradeid='',classid='',classname='',page='0'):
    validresult=False
    request_params=[]
    values_params=[]
    if schoolname!='':
        request_params.append('schoolName')
        values_params.append(SQLTool.formatstring(schoolname))
    if gradeid!='':
        request_params.append('t_classes.gradeId')
        values_params.append(SQLTool.formatstring(gradeid))
    if classid!='':
        request_params.append('t_classes.classId')
        values_params.append(SQLTool.formatstring(classid))
    if classname!='':
        request_params.append('t_class_name.className')
        values_params.append(SQLTool.formatstring(classname))
    if schoolid!='':
        request_params.append('t_classes.schoolId')
        values_params.append(SQLTool.formatstring(schoolid))
    request_params.append('t_school.schoolId')
    values_params.append('t_classes.schoolId')
    request_params.append('t_classes.classId')
    values_params.append('t_class_name.classId')

    DBhelp=SQLTool.DBmanager()
    DBhelp.connectdb()
    table=localconfig.schooltable
    result,content,count,col=DBhelp.searchtableinfo_byparams([table,localconfig.classtable,localconfig.classnametable], ['schoolName','t_classes.schoolId','t_classes.gradeId','cId','t_class_name.className','t_classes.classId'], request_params, values_params)

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
        result,content,count,col=DBhelp.searchtableinfo_byparams([table,localconfig.classtable,localconfig.classnametable], ['schoolName','t_classes.schoolId','t_classes.gradeId','cId','t_class_name.className','t_classes.classId'], request_params, values_params,limit,order='schoolId desc')

        DBhelp.closedb()
        classes=[]
        if count>0:
            validresult=True
            for temp in result :
                aclass=Class.Class(schoolname=temp['schoolName'],schoolid=temp['schoolId'],gradeid=temp['gradeId'],cid=temp['cId'],classname=temp['className'],classid=temp['classId'])


                classes.append(aclass)
        return classes,count,pagecount
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

    
    
    