<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
<!--#include virtual="/includes/connection.asp"-->
<%

'======================================================='
'Written By : Priyanka'
'Written Date : 13/07/2010'
'Last UpDated : 13/07/2010'
'Description :'
'This page is for 6sigmastates '
'======================================================='

'Declaring variables'
Dim rqType,rqDelId,rqState,rqFaculty1,rqfFac1EmailId,rqFaculty2,rqfFac2EmailId
Dim strDel,strAdd,strEdit

'Retriving values'
rqType=request.Form("type")
rqAction=request.QueryString("action")

'Retriving ID(for delete)'
rqDelId=request.QueryString("id")

'Retriving ID(for Edit)'
rqEditId=request.Form("id")

'Retriving all values'
rqState=Trim(request.form("state"))
rqFaculty1=Trim(request.form("faculty1"))
rqfFac1EmailId=Trim(request.form("fac1EmailId"))
rqFaculty2=Trim(request.form("faculty2"))
rqfFac2EmailId=Trim(request.form("fac2EmailId"))
rqCountry= Trim(request.form("country"))

'Inserting'
If rqType="Submit" then


strAdd="INSERT into sixsigma_us_states(state,faculty1,fac1_emailid,faculty2,fac2_emailid,country) values "
 strAdd=strAdd &"('" &rqState& "',"
 strAdd=strAdd &"'" &rqFaculty1& "',"
 strAdd=strAdd &"'" &rqfFac1EmailId& "',"
 strAdd=strAdd &"'" &rqFaculty2& "',"
 strAdd=strAdd &"'" &rqfFac2EmailId& "',"
 strAdd=strAdd &"'" &rqCountry& "')" 
 
connObj.execute strAdd
response.Redirect("6sigma_states.asp")

'Editing'
ElseIf rqType="Update" then


strEdit="UPDATE sixsigma_us_states SET "
strEdit = strEdit &" state= '" &rqState& "',"
strEdit = strEdit &" faculty1= '" &rqFaculty1& "',"
strEdit = strEdit &" fac1_emailid= '" &rqfFac1EmailId& "',"
strEdit = strEdit &" faculty2= '" &rqFaculty2& "',"
strEdit = strEdit &" country= '" &rqCountry& "',"
strEdit = strEdit &" fac2_emailid= '" &rqfFac2EmailId& "'"
strEdit = strEdit &" WHERE id= '" &rqEditId& "'"


connObj.execute strEdit
response.Redirect("6sigma_states.asp")



'Deleting Recoed'
ElseIf rqAction="deleteStates" then
strDel="DELETE from sixsigma_us_states where id= '"& rqDelId & "' "

'response.Write(strDel)
connObj.execute strDel
response.Redirect("6sigma_states.asp")

End IF

%>
</body>
</html>
