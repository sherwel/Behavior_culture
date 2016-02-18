#!/usr/bin/python
#coding:utf-8
from tool import SQLTool ,config
from Back_ground.model import evaluation


limitpage=15


localconfig=config.Config()
def studentshow(studentid='',evaluationobject='',evaluationscore='',type='',time='',week='',page='0'):
    validresult=False
    request_params=[]
    values_params=[]
    if studentid!='':
        request_params.append('studentId')
        values_params.append(SQLTool.formatstring(studentid))
    if evaluationobject!='':
        request_params.append('evaluationObject')
        values_params.append(SQLTool.formatstring(evaluationobject))
    if evaluationscore!='':
        request_params.append('evaluationScore')
        values_params.append(SQLTool.formatstring(evaluationscore))
    if type!='':
        request_params.append('t_student_evaluation.type')
        values_params.append(SQLTool.formatstring(type))
    if time!='':
        request_params.append('time')
        values_params.append(SQLTool.formatstring(time))
    if week!='':
        request_params.append('week')
        values_params.append(SQLTool.formatstring(week))
   

    request_params.append('contentEvaluationId')
    values_params.append('contentId')


    DBhelp=SQLTool.DBmanager()
    DBhelp.connectdb()
    table=localconfig.sevaluation_table
    extra=' and yn=0 union select studentId,evaluationObject,evaluationScore,t_student_evaluation.type,time,week,content from t_content_evaluation,t_student_evaluation,t_evaluation_template where contentEvaluationId=contentId and contentId=t_evaluation_template.templateId and yn=1'
    result,content,count,col=DBhelp.searchtableinfo_byparams([table,localconfig.cevaluation_table], ['studentId','evaluationObject','evaluationScore','t_student_evaluation.type','time','week','contentEvaluation'], request_params, values_params,extra=extra)

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
        result,content,count,col=DBhelp.searchtableinfo_byparams([table,localconfig.cevaluation_table], ['studentId','evaluationObject','evaluationScore','t_student_evaluation.type','time','week','contentEvaluation'], request_params, values_params,limit,extra=extra,order=' time desc')

        DBhelp.closedb()
        evaluations=[]
        if count>0:
            validresult=True
            for temp in result :
                aevaluation=evaluation.Evaluation(id=temp['studentId'],evaluationobject=temp['evaluationObject'],evaluationscore=temp['evaluationScore'],type=temp['type'],time=temp['time'],week=temp['week'],content=temp['contentEvaluation'])


                evaluations.append(aevaluation)
        return evaluations,count,pagecount
    return [],0,pagecount
##count为返回结果行数，col为返回结果列数,count,pagecount都为int型
def teachershow(id='',evaluationobject='',evaluationscore='',type='',time='',week='',page='0'):
    validresult=False
    request_params=[]
    values_params=[]
    if id!='':
        request_params.append('studentId')
        values_params.append(SQLTool.formatstring(id))
    if evaluationobject!='':
        request_params.append('teacherId')
        values_params.append(SQLTool.formatstring(evaluationobject))
    if evaluationscore!='':
        request_params.append('evaluationScore')
        values_params.append(SQLTool.formatstring(evaluationscore))
    if type!='':
        request_params.append('t_student_evaluation.type')
        values_params.append(SQLTool.formatstring(type))
    if time!='':
        request_params.append('time')
        values_params.append(SQLTool.formatstring(time))
    if week!='':
        request_params.append('week')
        values_params.append(SQLTool.formatstring(week))
   

    request_params.append('contentEvaluationId')
    values_params.append('contentId')


    DBhelp=SQLTool.DBmanager()
    DBhelp.connectdb()
    table=localconfig.tevaluation_table
    extra=' and yn=0 union select studentId,teacherId,evaluationScore,t_teacher_evaluation.type,time,week,content from t_content_evaluation,t_teacher_evaluation,t_evaluation_template where contentEvaluationId=contentId and contentId=t_evaluation_template.templateId and yn=1'
    result,content,count,col=DBhelp.searchtableinfo_byparams([table,localconfig.cevaluation_table], ['studentId','teacherId','evaluationScore','t_teacher_evaluation.type','time','week','contentEvaluation'], request_params, values_params,extra=extra)

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
        result,content,count,col=DBhelp.searchtableinfo_byparams([table,localconfig.cevaluation_table], ['studentId','teacherId','evaluationScore','t_teacher_evaluation.type','time','week','contentEvaluation'], request_params, values_params,limit,extra=extra,order=' time desc')

        DBhelp.closedb()
        evaluations=[]
        if count>0:
            validresult=True
            for temp in result :
                aevaluation=evaluation.Evaluation(id=temp['studentId'],evaluationobject=temp['teacherId'],evaluationscore=temp['evaluationScore'],type=temp['type'],time=temp['time'],week=temp['week'],content=temp['contentEvaluation'])


                evaluations.append(aevaluation)
        return evaluations,count,pagecount
    return [],0,pagecount
def familyshow(id='',evaluationobject='',evaluationscore='',type='',time='',week='',page='0'):
    validresult=False
    request_params=[]
    values_params=[]
    if id!='':
        request_params.append('studentId')
        values_params.append(SQLTool.formatstring(id))
    if evaluationobject!='':
        request_params.append('teacherId')
        values_params.append(SQLTool.formatstring(evaluationobject))
    if evaluationscore!='':
        request_params.append('evaluationScore')
        values_params.append(SQLTool.formatstring(evaluationscore))
    if type!='':
        request_params.append('t_student_evaluation.type')
        values_params.append(SQLTool.formatstring(type))
    if time!='':
        request_params.append('time')
        values_params.append(SQLTool.formatstring(time))
    if week!='':
        request_params.append('week')
        values_params.append(SQLTool.formatstring(week))
   

    request_params.append('contentEvaluationId')
    values_params.append('contentId')


    DBhelp=SQLTool.DBmanager()
    DBhelp.connectdb()
    table=localconfig.fevaluation_table
    extra=' and yn=0 union select studentId,parentid,evaluationScore,t_family_evaluation.type,time,week,content from t_content_evaluation,t_family_evaluation,t_evaluation_template where contentEvaluationId=contentId and contentId=t_evaluation_template.templateId and yn=1'
    result,content,count,col=DBhelp.searchtableinfo_byparams([table,localconfig.cevaluation_table], ['studentId','parentid','evaluationScore','t_family_evaluation.type','time','week','contentEvaluation'], request_params, values_params,extra=extra)

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
        result,content,count,col=DBhelp.searchtableinfo_byparams([table,localconfig.cevaluation_table], ['studentId','parentid','evaluationScore','t_family_evaluation.type','time','week','contentEvaluation'], request_params, values_params,limit,extra=extra,order=' time desc')

        DBhelp.closedb()
        evaluations=[]
        if count>0:
            validresult=True
            for temp in result :
                aevaluation=evaluation.Evaluation(id=temp['studentId'],evaluationobject=temp['parentid'],evaluationscore=temp['evaluationScore'],type=temp['type'],time=temp['time'],week=temp['week'],content=temp['contentEvaluation'])


                evaluations.append(aevaluation)
        return evaluations,count,pagecount
    return [],0,pagecount