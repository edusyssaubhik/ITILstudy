<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<% 
	If Session("USBUserId") = "" Then 
		Response.Redirect("login.asp")
	Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'Written By : Bharath'
'Created Date: 16/11/2009'
'Last Updated Date: 16/11/2009'
'Description :'
'Purpose : Adding the Queries And Answers into the Database in this page'

'Declare The Variables'
Dim rqDepartment, rqQueryTopic, rqQueryDetails, rqQueryType, rqImportance
Dim rqEmailId, rqQueryStatus, rqCreatedBy
Dim rqAddNewQuery, rqReply
Dim rqTicketNo, rqAnswer, rqRepliedBy, rqUser
Dim  strAnswer, objRs
Dim rqClose, objCDOMail, Subject

'Creating Record Object'
Set objRs = Server.CreateObject("ADODB.Recordset")

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function

'Retrivin the values from support.asp page'
rqAddNewQuery = Request.Form("addNewQuery")
rqReply = Request.Form("reply")
rqClose        =  Request.Form("Close")


rqDepartment   =  Request.Form("department")
rqQueryTopic   =  Request.Form("query_topic")
rqQueryDetails =  Request.Form("query")
rqQueryType    =  Request.Form("query_type")
rqImportance   =  Request.Form("importance")
rqEmailId      =  Session("USBUserId")
rqQueryStatus  =  1
rqCreatedBy    =  Session("USBUserId")

'If user added new query in the support page that data will come here and adding into questions(query) table'
If rqAddNewQuery <> "" Then

If rqQueryType = "No" Then

	ConnObj.Execute("INSERT INTO ITIL_support_query (query_topic, query_details, emailid, department, query_type, importance, query_status, created_by, created_on) VALUES ('"& StrQuoteReplace(rqQueryTopic) &"','"& StrQuoteReplace(rqQueryDetails) &"','"& rqEmailId &"','"& rqDepartment &"','"& rqQueryType &"','"& rqImportance &"','"& rqQueryStatus &"','"& rqCreatedBy &"','"& Now() &"')")
	
	Subject = rqQueryTopic
	
	'Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'	objCDOMail.From = rqEmailId
'	objCDOMail.To =  "instructors@pmstudy.com, marketing@pmstudy.com"
'	objCDOMail.Importance = 2
'	objCDOMail.Subject = Subject
'	objCDOMail.BodyFormat = 0
'	objCDOMail.MailFormat = 0
'	objCDOMail.Body =  rqQueryDetails & "<br><br><br><br>From support system"
'	objCDOMail.Send
'	Set objCDOMail = Nothing

ElseIf rqQueryType = "Yes" Then 

	Subject = rqQueryTopic
	
	'Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'	objCDOMail.From = rqEmailId
'	objCDOMail.To =  "t_satpathy@pmstudy.com"
'	objCDOMail.Importance = 2
'	objCDOMail.Subject = Subject
'	objCDOMail.BodyFormat = 0
'	objCDOMail.MailFormat = 0
'	objCDOMail.Body =  rqQueryDetails & "<br><br><br><br>From support system"
'	objCDOMail.Send
'	Set objCDOMail = Nothing

End If	

Response.Redirect("support.asp")

End If

'If support give the reply the query in the support page that will come here and adding into answer table'
If rqReply <> "" Then

rqTicketNo  = Request.Form("queryNo")
rqAnswer    = StrQuoteReplace(Request.Form("answer"))
rqRepliedBy = Session("USBUserId")
rqUser      = Request.Form("user")
rqEmailId   = Request.Form("emailid")
rqQueryTopic = Request.Form("queryTopic")

strAnswer = "SELECT id FROM ITIL_support_answer WHERE query_no = '"& rqTicketNo &"'"

objRs.Open strAnswer, ConnObj

If (objRs.BOF) And (objRs.EOF) Then

ConnObj.EXECUTE("UPDATE ITIL_support_query SET query_status = '2' WHERE query_no = '"& rqTicketNo &"'")

End If

ConnObj.Execute("INSERT INTO ITIL_support_answer (answer, replied_on, replied_by, query_no, added_by) VALUES ('"& rqAnswer &"','"& Now() &"','"& rqRepliedBy &"','"& rqTicketNo &"','"& rqUser &"')")

If rqUser = "STAFF" Then

Subject = "Re: "& rqQueryTopic

'Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'objCDOMail.From = "no-reply@pmstudy.com"
'objCDOMail.To =  rqEmailId
'objCDOMail.Bcc =  "instructors@pmstudy.com"
'objCDOMail.Importance = 2
'objCDOMail.Subject = Subject
'objCDOMail.BodyFormat = 0
'objCDOMail.MailFormat = 0
'objCDOMail.Body =  rqAnswer
'objCDOMail.Send
'Set objCDOMail = Nothing

End If

Response.Redirect("support.asp?action=viewTicket&queryNo="&rqTicketNo)

End If

If rqClose <> "" Then

rqTicketNo  = Request.Form("queryNo")

ConnObj.EXECUTE("UPDATE ITIL_support_query SET query_status = '3' WHERE query_no = '"& rqTicketNo &"'")

Response.Redirect("support.asp")

End If 

%>
<% End If %>