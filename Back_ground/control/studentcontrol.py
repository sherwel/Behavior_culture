#!/usr/bin/python
#coding:utf-8
from tool import SQLTool ,config
from Back_ground.model import student


limitpage=15


localconfig=config.Config()
def studentshow(studentid='',name='',sex='',birthday='',address='',familyPhone='',mail='',family='',admissionTime='',nation='',placeOfOrigin='',team='',classid='',page='0'):
    validresult=False
    request_params=[]
    values_params=[]
    if studentid!='':
        request_params.append('t_student.studentId')
        values_params.append(SQLTool.formatstring(studentid))
    if name!='':
        request_params.append('name')
        values_params.append(SQLTool.formatstring(name))
    if sex!='':
        request_params.append('sex')
        values_params.append(SQLTool.formatstring(sex))
    if birthday!='':
        request_params.append('birthday')
        values_params.append(SQLTool.formatstring(birthday))
    if address!='':
        request_params.append('address')
        values_params.append(SQLTool.formatstring(address))
    if familyPhone!='':
        request_params.append('familyPhone')
        values_params.append(SQLTool.formatstring(familyPhone))
    if mail!='':
        request_params.append('mail')
        values_params.append(SQLTool.formatstring(mail))
    if family!='':
        request_params.append('family')
        values_params.append(SQLTool.formatstring(family))
    if admissionTime!='':
        request_params.append('admissionTime')
        values_params.append(SQLTool.formatstring(admissionTime))
    if nation!='':
        request_params.append('nation')
        values_params.append(SQLTool.formatstring(nation))
        
    if placeOfOrigin!='':
        request_params.append('placeOfOrigin')
        values_params.append(SQLTool.formatstring(placeOfOrigin))
    if team!='':
        request_params.append('team')
        values_params.append(SQLTool.formatstring(team))
    if classid!='':
        request_params.append('t_students_attend_class.classId')
        values_params.append(SQLTool.formatstring(classid))

    request_params.append('t_students_attend_class.studentId')
    values_params.append('t_student.studentId')


    DBhelp=SQLTool.DBmanager()
    DBhelp.connectdb()
    table=localconfig.studenttable
    result,content,count,col=DBhelp.searchtableinfo_byparams([table,localconfig.student_attend_table], ['t_student.studentId','name','sex','birthday','address','familyPhone','mail','family','admissionTime','nation','placeOfOrigin','team','t_students_attend_class.classId'], request_params, values_params)

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
        result,content,count,col=DBhelp.searchtableinfo_byparams([table,localconfig.student_attend_table], ['t_student.studentId','name','sex','birthday','address','familyPhone','mail','family','admissionTime','nation','placeOfOrigin','team','t_students_attend_class.classId'], request_params, values_params,limit,order=' time desc ,t_student.studentId desc')

        DBhelp.closedb()
        students=[]
        if count>0:
            validresult=True
            for temp in result :
                astudent=student.Student(studentid=temp['studentId'],name=temp['name'],address=temp['address'],familyPhone=temp['familyPhone'],classid=temp['classId'],family=temp['family'])


                students.append(astudent)
        return students,count,pagecount
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

    
    
    