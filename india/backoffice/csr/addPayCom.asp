<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
	If Session("UserId") = "" Then
     Response.Redirect("../login.asp")
	 
	 Else

%>
<!--#include virtual="/india/connection.asp"-->
<%
'======================================================='
'Written By : savita'
'Last UpDated : 06/04/2011'
'Description :'
'This page is adding the comments into datebase page'
'======================================================='

'Declare The Variables'
Dim rqComment,rqEnrollUserId
Dim rqCallId
Dim objRs
Dim rqAction
Dim rqType
Dim strValue
Dim rqStatus
Dim rqPage
Dim rqRow
Dim rqCity,rqSaveComment

'Retrive the callid and comment'
rqID  =  Request.Form("ID")
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

'Insert the comment '

 strQuery = "Insert Into payment_comment (comment,comm_addedby,comm_addeddate,ID) values"
 strQuery = strQuery & "('" & StrQuoteReplace(rqComment) & "',"
 strQuery = strQuery & "'" & Session("UserID") & "',"
 strQuery = strQuery & "'" & now() & "',"
 strQuery = strQuery & "'" & rqID & "')"

'response.Write(strQuery)
  Conn.Execute strQuery
  Response.Redirect("PayDecline.asp?action="&rqAction&"&ID="&rqID&"")	

ElseIf rqType = "In Process" Then

'Insert the comment '

 strQuery = "Insert Into payment_comment (comment,comm_addedby,comm_addeddate,ID) values"
 strQuery = strQuery & "('" & StrQuoteReplace(rqComment) & "',"
 strQuery = strQuery & "'" & Session("UserID") & "',"
 strQuery = strQuery & "'" & now() & "',"
 strQuery = strQuery & "'" & rqID & "')"

'response.Write(strQuery)
  Conn.Execute strQuery
  
  Conn.Execute "UPDATE paymentDecline SET Status = '2' WHERE ID = '" & rqID &"'"

	If rqAction = "noFollowUp" Then
		Response.Redirect("PayDecline.asp?action=followUp&ID="&rqID&"")
	ElseIf rqAction = "followUp" Then
	    If rqCity <> "" Then
			Response.Redirect("PayDecline.asp?action=followUp&city="&rqCity&"&page="&rqPage&"&row="&rqRow)
		ElseIf rqPage <> "" Then
			Response.Redirect("PayDecline.asp?action=followUp&page="&rqPage&"&row="&rqRow)
		Else
			Response.Redirect("PayDecline.asp?action=followUp&ID="&rqID&"")
		End If		
	ElseIf rqAction = "closed" Then
		Response.Redirect("PayDecline.asp?action=closed&ID="&rqID&"")	
	End If 
	
	
ElseIf rqType = "Not Interested" Then

'Insert the comment '

 strQuery = "Insert Into payment_comment (comment,comm_addedby,comm_addeddate,ID) values"
 strQuery = strQuery & "('" & StrQuoteReplace(rqComment) & "',"
 strQuery = strQuery & "'" & Session("UserID") & "',"
 strQuery = strQuery & "'" & now() & "',"
 strQuery = strQuery & "'" & rqID & "')"

'response.Write(strQuery)
  Conn.Execute strQuery
  
  Conn.Execute "UPDATE paymentDecline SET Status = '4' WHERE ID = '" & rqID &"'"

  Response.Redirect("PayDecline.asp?action=notInterested&ID="&rqID&"")


ElseIf rqType = "Received" Then

'Insert the comment '

 strQuery = "Insert Into payment_comment (comment,comm_addedby,comm_addeddate,ID) values"
 strQuery = strQuery & "('" & StrQuoteReplace(rqComment) & "',"
 strQuery = strQuery & "'" & Session("UserID") & "',"
 strQuery = strQuery & "'" & now() & "',"
 strQuery = strQuery & "'" & rqID & "')"

'response.Write(strQuery)
  Conn.Execute strQuery
  
  Conn.Execute "UPDATE paymentDecline SET Status = '3', datePayment_rec ='"& now() &"' WHERE ID = '" & rqID &"'"

  Response.Redirect("PayDecline.asp?action=closed&ID="&rqID&"")
	
	
ElseIf rqType = "Dummy" Then

 strQuery = "Insert Into payment_comment (comment,comm_addedby,comm_addeddate,ID) values"
 strQuery = strQuery & "('Dummy Status updated ',"
 strQuery = strQuery & "'" & Session("UserID") & "',"
 strQuery = strQuery & "'" & now() & "',"
 strQuery = strQuery & "'" & rqID & "')"

'response.Write(strQuery)
  
  Conn.Execute strQuery
  
  Conn.Execute "UPDATE paymentDecline SET Status = '5' WHERE ID = '" & rqID &"'"

  Response.Redirect("PayDecline.asp?action=PayDummy&ID="&rqID&"")	
	
	
ElseIf rqType = "Save Comment" Then

 rqSaveComment  =  Request.Form("notes")
 rqEnrollUserId = Request.Form("enrollUserId")
 rqType    =  Request.Form("type")


 strQuery = "Insert Into itil_enrolledusercomments (comment,enteredby,createddate,revlevel,enrolluserid)"
 strQuery = strQuery & " Values "
 strQuery = strQuery & "('" & StrQuoteReplace(rqSaveComment) & "',"
 strQuery = strQuery & "'" & Session("UserId") & "',"
 strQuery = strQuery & "'" & Now() & "',"
 strQuery = strQuery & "'" & rqRevLevel & "',"
 strQuery = strQuery & "'" & rqEnrollUserId & "')"

  Conn.Execute strQuery

  Response.Redirect("PayDecline.asp?action=PORec&ID="&rqEnrollUserId&"")


End If
%>
<% End If %>
