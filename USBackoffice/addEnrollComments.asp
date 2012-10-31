<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<% 
	If Session("USBUserId") = "" Then 
		Response.Redirect("login.asp")
	Else
%>

<%
'======================================================='
'Written By : Bharath'
'Last UpDated : 14/08/2009'
'Modified By : Bharath'
'Last UpDated : 28/03/2011'
'Description :'
'This page is adding the comments into datebase page'
'======================================================='

'Declare The Variables'
Dim rqComment
Dim rqEnrollId
Dim strRevLevel
Dim objRs
Dim RevLevel
Dim rqAction
Dim strValue,strInsert
Dim rqStatus,rqWebsite
Dim rqType,strWebsite
Dim rqPage
Dim rqRow
Dim rqCity
Dim rqLastName
Dim rqRedirect
Dim rqCourseId,strTable, rqName

'Retrive the callid and comment'
rqEnrollId =  Request.Form("enrollid")
rqComment  =  Request.Form("comment")
rqAction   =  Request.Form("action")
rqType     =  Request.Form("type")
rqStatus   =  Request.Form("status")
rqPage     =  Request.Form("page")
rqRow      =  Request.Form("row")
rqCity     =  Request.Form("city")
rqName     =  Request.Form("name")
rqRedirect =  Request.Form("redirect")
rqCourseId =  Request.Form("courseid")
rqWebsite  = Request.Form("website")

'In Enrolled but not paid  based on the website slected connection will be worked%>
<!--#include virtual="/includes/connection.asp"-->

<%

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function

Set objRs = Server.CreateObject("ADODB.Recordset")


If rqType = "Save" Then

	'Retrive the maximum revision level of comment'
	strRevLevel = "SELECT max(revlevel) as RevLevel FROM ITIL_enroll_comments WHERE enrollid  =  '" & rqEnrollId & "'"
				
					response.Write(strRevLevel)
	
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
	
		ConnObj.Execute "INSERT INTO ITIL_enroll_comments (comment, revlevel, comm_addedby, enrollid, comm_date) VALUES ('" & StrQuoteReplace(rqComment) & "','" & RevLevel & "','" & Session("USBUserId") & "','" & rqEnrollId & "', '"& Now() & "')"

		
	
		'Retdirecting to particular pages'
		
		If rqRedirect = "ScheClasses" Then 
			
			Response.Redirect("viewEnrollDet.asp?courseid="& rqCourseId&"")
			
		Else
			
			If rqCity <> "" Then
				Response.Redirect("marketingB2C.asp?action="&rqAction&"&city="&rqCity&"&page="&rqPage&"&row="&rqRow&"&website="&rqWebsite)
			ElseIf rqName <> "" Then
				Response.Redirect("marketingB2C.asp?action="&rqAction&"&name="&rqName&"&page="&rqPage&"&row="&rqRow&"&website="&rqWebsite)
			ElseIf rqPage <> "" Then
				Response.Redirect("marketingB2C.asp?action="&rqAction&"&page="&rqPage&"&row="&rqRow&"&website="&rqWebsite)
			Else
				Response.Redirect("marketingB2C.asp?action="&rqAction&"&website="&rqWebsite)
			End If

		End If

		
ElseIf rqType = "Submit" Then
	
	strInsert =  "UPDATE ITIL_enrolledusers SET us_status = '" & rqStatus & "', us_status_addedby = '"&Session("USBUserId")&"' WHERE id = '" & rqEnrollId &"'"
	'response.Write(strInsert)
	    connObj.execute strInsert
	    
		If rqCity <> "" Then
			Response.Redirect("marketingB2C.asp?action="&rqAction&"&city="&rqCity&"&page="&rqPage&"&row="&rqRow&"&website="&rqWebsite )
		ElseIf rqLastName <> "" Then
			Response.Redirect("marketingB2C.asp?action="&rqAction&"&lastname="&rqLastName&"&page="&rqPage&"&row="&rqRow&"&website="&rqWebsite)
		ElseIf rqPage <> "" Then
			Response.Redirect("marketingB2C.asp?action="&rqAction&"&page="&rqPage&"&row="&rqRow&"&website="&rqWebsite)
		Else
			Response.Redirect("marketingB2C.asp?action="&rqAction&"&website="&rqWebsite)
		End If
	
	End If
%>
<!--#include virtual="/includes/connectionClose.asp"-->
<% End If %>