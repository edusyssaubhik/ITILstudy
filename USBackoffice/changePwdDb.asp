<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<% 
If Session("USBUserId") = "" Then 
	Response.Redirect("login.asp")
Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
'Written By : Bharath'
'Last UpDated : 18/08/2009'
'Description :'
'This page is adding calls to the database'
'US BackOffice'
'======================================================='

Dim strQuery
Dim strQuery1
Dim rqInstId
Dim rqCurrentPassword
Dim rqNewPassword
Dim ObjRs, ObjRs1

Set objRs = server.CreateObject("ADODB.Recordset")
Set objRs1 = server.CreateObject("ADODB.Recordset")

 rqInstId             =  Request.Form("instId")
 rqCurrentPassword    =  Request.Form("pwd")
 rqNewPassword        =  Request.Form("newPwd")
 
 strQuery = "SELECT pwd FROM ITIL_instructor WHERE instid = '" & rqInstId & "'"
 
 objRs.Open strQuery,ConnObj
 
 If (Not objRs.BOF) and (Not objRs.EOF) Then

  If rqCurrentPassword <> objRs("pwd") Then

	Session("message") = "Your Password is incorrect"
	Response.Redirect("changePwd.asp")
	
  Else
 
   strQuery1 = "UPDATE ITIL_instructor SET pwd = '" & rqNewPassword & "' WHERE instid = '" & rqInstId & "'"
   objRs1.Open strQuery1,ConnObj
   
   Session("message") = "Successfully Changed Password"
   Response.Redirect("changePwd.asp")
   
   objRs1.Close
   Set objRs1 = Nothing
   
  End If
  
 End If  

objRs.Close
Set objRs = Nothing

ConnObj.Close
Set ConnObj = Nothing
End If
%>