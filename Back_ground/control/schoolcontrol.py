#!/usr/bin/python
#coding:utf-8
from tool import SQLTool ,config
from Back_ground.model import school


limitpage=15


localconfig=config.Config()
def schoolshow(schoolname='',schoolid='',province='',city='',starttime='',page='0'):
    validresult=False
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

    DBhelp=SQLTool.DBmanager()
    DBhelp.connectdb()
    table=localconfig.schooltable
    result,content,count,col=DBhelp.searchtableinfo_byparams([table], ['schoolName','schoolId','province','city'], request_params, values_params)

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
        result,content,count,col=DBhelp.searchtableinfo_byparams([table], ['schoolName','schoolId','province','city'], request_params, values_params,limit,order='schoolId desc')
    
        DBhelp.closedb()
        schools=[]
        if count>0:
            validresult=True
            for temp in result :
                aschool=school.School(schoolname=temp['schoolName'],schoolid=temp['schoolId'],province=temp['province'],city=temp['city'])

#                 ajob=school.Job(username=temp[0],jobid=temp[1],jobname=temp[2],priority=temp[3],jobstatus=temp[4],starttime=temp[5],jobaddress=temp[6],jobport=temp[7],result=temp[8],endtime=temp[9],createtime=temp[10],forcesearch=temp[11])
                schools.append(aschool)
        return schools,count,pagecount
    return [],0,pagecount
##count为返回结果行数，col为返回结果列数,count,pagecount都为int型
def loadschool(request,username=''):
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
def schooladd(school):
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

def schoolupdate(schoolname='',schoolid='',province='',city='',starttime=''):


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

    
    
    