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
'Last UpDated : 14/08/2009'
'Description :'
'This page is adding the comments into datebase page'
'======================================================='

'Declare The Variables'
Dim rqComment
Dim rqCallId
Dim strRevLevel
Dim objRs
Dim RevLevel
Dim rqAction
Dim rqType
Dim strValue
Dim rqStatus
Dim rqPage
Dim rqRow
Dim rqCity

'Retrive the callid and comment'
rqCallId  =  Request.Form("callId")
rqComment =  Request.Form("comment")
rqAction  =  Request.Form("action")
rqType    =  Request.Form("type")
rqStatus  =  Request.Form("status")
rqPage    =  Request.Form("page")
rqRow     =  Request.Form("row")
rqCity    =  Request.Form("city")


Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function

Set objRs = Server.CreateObject("ADODB.Recordset")

If rqType = "Save" Then

	'Retrive the maximum revision level of comment'
	
	strRevLevel = "SELECT max(f_revlevel) as RevLevel FROM ps_fac_comments WHERE callid =  '" & rqCallId & "'"
	
	objRs.Open strRevLevel,ConnObj
	
		If (Not objRs.BOF) And (Not objRs.EOF) Then 
				
			RevLevel = objRs("RevLevel")
			
			If IsNull(RevLevel) Then
				RevLevel = 1
				ConnObj.Execute "UPDATE ps_callsreceived SET Status = '2' WHERE callid = '"& rqCallId &"'"
			Else
				RevLevel = objRs("RevLevel") + 1
			End If
		
		End If
	
	objRs.Close

'Insert the comment '

ConnObj.Execute "INSERT INTO ps_fac_comments (f_comment, f_revlevel, comm_addedby, callid, comm_date) VALUES ('" & StrQuoteReplace(rqComment) & "','" & RevLevel & "','" & Session("USBUserId") & "','" & rqCallId & "', '"& Now() & "')"

	If rqAction = "noFollowUp" Then
		Response.Redirect("marketingB2C.asp?action=followUp&city="&rqCity)
	ElseIf rqAction = "followUp" Then
	    If rqCity <> "" Then
			Response.Redirect("marketingB2C.asp?action=followUp&city="&rqCity&"&page="&rqPage&"&row="&rqRow)
		ElseIf rqPage <> "" Then
			Response.Redirect("marketingB2C.asp?action=followUp&page="&rqPage&"&row="&rqRow)
		Else
			Response.Redirect("marketingB2C.asp?action=followUp")
		End If		
	ElseIf rqAction = "closed" Then
		Response.Redirect("marketingB2C.asp?action=closed")	
	End If 

ElseIf rqType = "Close" Then


	ConnObj.Execute "INSERT INTO ps_fac_comments (f_comment, f_revlevel, comm_addedby, callid, comm_date) VALUES ('" & StrQuoteReplace(rqComment) & "','" & RevLevel & "','" & Session("USBUserId") & "','" & rqCallId & "', '"& Now() & "')"
	
	ConnObj.Execute "UPDATE ps_callsreceived SET Status = '3' WHERE callid = '"& rqCallId &"'"
	
	Response.Redirect("marketingB2C.asp?action=closed")

ElseIf rqType = "Submit" Then	
	
	ConnObj.Execute "UPDATE ps_callsreceived SET call_status = '" & rqStatus & "' WHERE callid = '" & rqCallId &"'"
	
	If rqCity <> "" Then
		Response.Redirect("marketingB2C.asp?action="&rqAction&"&city="&rqCity&"&page="&rqPage&"&row="&rqRow)	
	ElseIf rqPage <> "" Then
		Response.Redirect("marketingB2C.asp?action="&rqAction&"&page="&rqPage&"&row="&rqRow)	
	Else
		Response.Redirect("marketingB2C.asp?action="&rqAction)
	End If
	

End If
End If
%>
<!--#include virtual="/includes/connectionClose.asp"-->