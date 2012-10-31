<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<body>
<% If not  Session("UserId") = "" Then %>
<!--#include virtual="/india/connection.asp"-->
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
rqCompany=request.form("company")
rqDateOfPassing=request.form("dateofpassing")
rqFeedback=request.form("feedback")

'Inserting'
If rqType="submit" then

'Formatting Date'
Dop = (YEAR(rqDateOfPassing) & "-" & (Month(rqDateOfPassing)) & "-" & (DAY(rqDateOfPassing)))

'Teatarea '
Feedback = Replace(rqFeedback,"'","''")
Company = Replace(rqCompany,"'","''")

strAdd="INSERT into classroom_feedback(fname,company,dateofpassing,feedback,country) values "
 strAdd=strAdd &"('" &rqName& "',"
 strAdd=strAdd &"'" &Company& "',"
 strAdd=strAdd &"'" &Dop& "',"
 strAdd=strAdd &"'" &Feedback& "',"
 strAdd=strAdd &"'" &Session("country")& "')"
 
 
'response.Write(strAdd)
Conn.execute strAdd
response.Redirect("classroom_feedback.asp")

'Editing'
ElseIf rqType="update" then

'Formatting Date'
Dop = (YEAR(rqDateOfPassing) & "-" & (Month(rqDateOfPassing)) & "-" & (DAY(rqDateOfPassing)))

'Teatarea '
Feedback = Replace(rqFeedback,"'","''")
Company = Replace(rqCompany,"'","''")

strEdit="UPDATE classroom_feedback SET"
strEdit=strEdit& " fname= '" &rqName& " ',"
strEdit=strEdit& " company= '" &Company& " ',"
strEdit=strEdit& " dateofpassing= '" &Dop& " ',"
strEdit=strEdit& " feedback= '" &Feedback& " '"

strEdit=strEdit& " WHERE id= '" &rqEditId& "' And country = '"&Session("country")&"'"
'response.Write(strEdit)
Conn.execute strEdit
response.Redirect("classroom_feedback.asp")



'Deleting Recoed'
ElseIf rqAction="deleteFeedback" then
strDel="DELETE from classroom_feedback where id= '"& rqDelId & "' And country = '"&Session("country")&"'"

'response.Write(strDel)
Conn.execute strDel
response.Redirect("classroom_feedback.asp")

End IF

%>
</body>
</html>
<% 

 Else
 Response.Redirect("../login.asp")
 End If
 
%>