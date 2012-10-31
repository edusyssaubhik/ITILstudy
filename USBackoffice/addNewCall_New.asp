<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
	If Session("USBUserId") = "" Then 
		Response.Redirect("login.asp")
	Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
'Written By : Bharath'
'Last UpDated : 28/04/2011'
'Description :'
'This page is adding calls to the database page'
'This page is comes from calls.asp page'
'======================================================='

'Declare The Variables'
Dim strAddCallDet
Dim rqCallFor, rqCallerName, rqPhoneNo
Dim rqCity, rqState, rqEmailId
Dim rqQuestion
Dim strAllcoatedCity, objRs
Dim strValue, rqComment,rqWebsite

Set objRs = Server.CreateObject("ADODB.Recordset")

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function


rqCallFor     =  Request.Form("callfor")
rqCallerName  =  Request.Form("callername")
rqPhoneNo     =  Request.Form("phoneno")
rqState       =  request.Form("state")
rqCity        =  Request.Form("city")
rqEmailId     =  Request.Form("emailid")
rqQuestion    =  Request.Form("question") 
rqComment     =  Request.Form("comment")

If Request.Form("website") <> "" Then
	rqWebsite     =  Request.Form("website")
Else 
	rqWebsite = "PMstudy"
End If	

ConnObj.Execute "INSERT INTO ps_callsreceived_new (callfor, callername, phoneno, emailid, callerstate, city, question, call_status1, addeddate, addedby, country, website) VALUES ('"& rqCallFor &"','"& rqCallerName &"','"& rqPhoneNo &"','"& rqEmailId &"','"& rqState &"','"& rqCity &"','"& StrQuoteReplace(rqQuestion) &"','1','"& Now() &"','"& Session("USBUserId") &"','"& Session("CRM_Country") &"', '"& rqWebsite &"')"

strBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.pmstudy.com/images/banners/email_header.jpg"" alt=""PMstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""540px""><table border=""0"" width=""520px"" align=""center""><tr height=""30px""><td><font face=""Arial"" size=2>Hi,<BR><BR>We got the following call from student for follow up. <BR><BR>Name: "&rqCallerName&"<BR><BR>State:  "&rqState&"<BR><BR>City:  "&rqCity&"<BR><BR>Phone Number: "&rqPhoneNo&""
If rqEmailId <> "" Then
strBody = strBody & "<BR><BR>EmailId: "&rqEmailId
End If 
strBody = strBody & "<BR><BR>Time: "&Now()&"<BR><BR>Ques: "&rqQuestion&"<BR><BR>Please do the needful.<BR><BR>Best Regards, <BR>Customer Support<br>www.PMstudy.com<BR>(PMI Approved Registered Education Provider)<BR>Email: marketing@pmstudy.com</font></td></tr></table></td></tr></table></td></tr></table>"

response.Write(strBody)


Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
objCDOMail.From = "marketing@pmstudy.com"
If (Session("CRM_Country") = "Australia" OR Session("CRM_Country") = "New Zealand") Then
objCDOMail.To =  "marketing@pmstudy.com, corey.b@pmstudy.com, coreytoddbailey@hotmail.com"
ElseIf (Session("CRM_Country") = "Germany") Then
objCDOMail.To =  "marketing@pmstudy.com, elizabeth.w@pmstudy.com, elwarren@live.com"
Else
objCDOMail.To =  "marketing@pmstudy.com"
End If
objCDOMail.Bcc = "t_satpathy@yahoo.com"
objCDOMail.Importance = 2
objCDOMail.Subject = "PMstudy Receptionist call received (follow up required)."
objCDOMail.BodyFormat = 0
objCDOMail.MailFormat = 0
objCDOMail.Body =  strBody
objCDOMail.Send
Set objCDOMail = Nothing


If rqComment <> "" Then

strCallId = "SELECT MAX(callid) AS CallID FROM ps_callsreceived_new"

objRs.Open strCallId, ConnObj

Do Until objRs.EOF
	CallId = objRs("CallID")
objRs.Movenext
Loop
objRs.Close

ConnObj.Execute "INSERT INTO ps_fac_comments_new (f_comment, f_revlevel, comm_addedby, callid, comm_date) VALUES ('" & StrQuoteReplace(rqComment) & "','1','" & Session("USBUserId") & "','" & CallId & "', '"& Now() & "')"

ConnObj.Execute "UPDATE ps_callsreceived_new SET call_status1 = '2' WHERE callid = '"& CallId &"'"

Response.Redirect("marketingB2C_New.asp?action=followUp")

Else 

Response.Redirect("marketingB2C_New.asp?action=noFollowUp")

End If 

%>
<!--#include virtual="/includes/connectionClose.asp"-->
<% End If %>
