<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<body>
<% 
	If Session("USBUserId") = "" Then 
		Response.Redirect("login.asp")
	Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%

'======================================================='
'Written By : savita'
'Written Date : 13/05/2010'
'Last UpDated : 13/05/2010'
'Description :'
'This page is for Feedback '
'======================================================='

'Declaring variables'
Dim rqType,rqDelId,rqName,rqCompany,rqDateOfPassing,rqFeedback
Dim strDel,strAdd,strEdit,Dop 

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function

'Retriving values'
rqType=request.Form("type")
rqAction=request.QueryString("action")

'Retriving ID(for delete)'
rqDelId=request.QueryString("id")

'Retriving ID(for Edit)'
rqEditId=request.Form("id")

'Retriving all values'
rqName=request.form("name")
rqCountry=request.form("country")
rqDateOfPassing=request.form("dateofpassing")
rqFeedback=request.form("feedback")

'Inserting'
If rqType="submit" then

'Formatting Date'
Dop = (YEAR(rqDateOfPassing) & "-" & (Month(rqDateOfPassing)) & "-" & (DAY(rqDateOfPassing)))

'Teatarea '
Feedback = Replace(rqFeedback,"'","''")

strAdd="INSERT into FacExam_feedback(fname,country,dateofpassing,feedback) values "
 strAdd=strAdd &"('" &rqName& "',"
 strAdd=strAdd &"'" &rqCountry& "',"
 strAdd=strAdd &"'" &Dop& "',"
 strAdd=strAdd &"'" &StrQuoteReplace(rqFeedback)& "')"
 
 
'response.Write(strAdd)
ConnObj.execute strAdd
response.Redirect("ExamExp.asp")

'Editing'
ElseIf rqType="update" then

'Formatting Date'
Dop = (YEAR(rqDateOfPassing) & "-" & (Month(rqDateOfPassing)) & "-" & (DAY(rqDateOfPassing)))

'Teatarea '
Feedback = Replace(rqFeedback,"'","''")

strEdit="UPDATE FacExam_feedback SET"
strEdit=strEdit& " fname= '" &rqName& " ',"
strEdit=strEdit& " country= '" &rqCountry& " ',"
strEdit=strEdit& " dateofpassing= '" &Dop& " ',"
strEdit=strEdit& " feedback= '" &StrQuoteReplace(rqFeedback)& " '"

strEdit=strEdit& " WHERE id= '" &rqEditId& "'"
'response.Write(strEdit)
ConnObj.execute strEdit
response.Redirect("ExamExp.asp")



'Deleting Recoed'
ElseIf rqAction="deleteFeedback" then
strDel="DELETE from FacExam_feedback where id= '"& rqDelId & "' "

'response.Write(strDel)
ConnObj.execute strDel
response.Redirect("ExamExp.asp")

End IF

%>
</body>
</html>
<% 

 End If
 
%>