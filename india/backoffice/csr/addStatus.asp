<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<%
   If Session("UserId") = "" Then
     Response.Redirect("../login.asp")
   Else
%>
<!--#include virtual="/india/connection.asp"-->
<%

'======================================================='
'Written By : Priyanka'
'Last UpDated : 27/09/2010'
'Description :'
' Add status Page'
'======================================================='

'Declare The Variables'

Dim rqClose, objRs, rqComplaintNo

'Creating Record Object'
Set objRs = Server.CreateObject("ADODB.Recordset")


'Retrivin the values from support.asp page'

rqClose   =  Request.Form("Close")



If rqClose <> "" Then

rqComplaintNo  = Request.Form("complaint_no")

Conn.EXECUTE("UPDATE support_complaint SET closedby = '"&Session("UserId")&"' WHERE complaint_no = '"& rqComplaintNo &"'")

response.Write("UPDATE support_complaint SET closedby = '"&Session("UserId")&"' WHERE complaint_no = '"& rqComplaintNo &"'")

Response.Redirect("admin_ComplaintLog.asp")

End If 

%>
<% End If %>