
<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include virtual="/india/connection.asp"-->
<body>
<%

'======================================================='
'Written By : Priyanka'
'Written Date : 13/05/2010'
'Last UpDated : 13/05/2010'
'Description :'
'This page is for Feedback '
'======================================================='

'Declaring variables'
Dim rqType,rqDelId,rqName,rqCompany,rqDateOfPassing,rqFeedback
Dim strDel,strAdd,strEdit,Dop 

'Retriving values'
rqType=request.Form("type")
rqAction=request.QueryString("action")

'Retriving ID(for delete)'
rqDelId=request.QueryString("id")

'Retriving ID(for Edit)'
rqEditId=request.Form("id")

'Retriving all values'
rqName=request.form("name")
rqFeedback=request.form("feedback")

'Inserting'
If rqType="Submit" then

'Formatting Date'
Dop = (YEAR(now()) & "-" & (Month(now())) & "-" & (DAY(now())))

'Teatarea '
Feedback = Replace(rqFeedback,"'","''")

strAdd="INSERT into online_feedback(fname,feedback,dateofadding) values "
 strAdd=strAdd &"('" &rqName& "',"

 strAdd=strAdd &"'" &Feedback& "',"
 strAdd=strAdd &"'" &Dop& "')"
 
 
'response.Write(strAdd)
Conn.execute strAdd
response.Redirect("online_feedback.asp")

'Editing'
ElseIf rqType="Update" then

'Formatting Date'
Dop = (YEAR(now()) & "-" & (Month(now())) & "-" & (DAY(now())))

'Teatarea '
Feedback = Replace(rqFeedback,"'","''")

strEdit="UPDATE online_feedback SET"
strEdit=strEdit& " fname= '" &rqName& " ',"

strEdit=strEdit& " feedback= '" &Feedback& " '"

strEdit=strEdit& " WHERE id= '" &rqEditId& "'"
'response.Write(strEdit)
Conn.execute strEdit
response.Redirect("online_feedback.asp")



'Deleting Recoed'
ElseIf rqAction="deleteFeedback" then
strDel="DELETE from online_feedback where id= '"& rqDelId & "' "

'response.Write(strDel)
Conn.execute strDel
response.Redirect("online_feedback.asp")

End IF

%>
</body>
</html>
