<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<% 
	If Session("USBUserId") = "" Then 
		Response.Redirect("login.asp")
	Else
%>
<!--#include file="includes/connection.asp"-->
<%
'======================================================='
'Written By : Bharath'
'Last UpDated : 14/08/2009'
'Description :'
'This page is adding the enroll users comments into datebase page'
'======================================================='

'Declare The Variables'
Dim rqComment
Dim rqEnrollId
Dim strRevLevel
Dim objRs
Dim RevLevel

'Retrive the callid and comment'
rqEnrollId = Request.Form("enrollId")
rqComment = Request.Form("comment")

Set objRs = Server.CreateObject("ADODB.Recordset")

'Retrive the maximum revision level of comment'

strRevLevel = "SELECT max(f_enroll_revlevel) as RevLevel FROM ps_fac_enrollcomments where enrollid =  '" & rqEnrollId & "'"

objRs.Open strRevLevel,ConnObj

If (Not objRs.BOF) And (Not objRs.EOF) Then 
		
	RevLevel = objRs("RevLevel")
	
	If IsNull(RevLevel) Then
		RevLevel = 1
	Else
		RevLevel = objRs("RevLevel") + 1
	End If

End If

objRs.Close

'Insert the comment '

ConnObj.Execute "INSERT INTO ps_fac_enrollcomments (f_enroll_comment, f_enroll_revlevel, comm_addedby, enrollid, comm_date, typeofuser) VALUES ('" & rqComment & "','" & RevLevel & "','" & Session("USBUserId") & "','" & rqEnrollId & "', '"& Now() & "', '" & Session("USBTypeOfUser") & "')"



Response.Redirect("enroll_comments.asp?action=viewEnrollComments&enrollId="&rqEnrollId)



End If
%>
<!--#include file="includes/connClose.asp"-->