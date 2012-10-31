<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 14/07/2010'
'Description :'
'This page is adding 6sigma calls to the database page'
'This page is comes from 6sigmacalls.asp page'
'======================================================='

'Declare The Variables'
Dim strAddCallDet
Dim rqCallFor, rqCallerName, rqPhoneNo
Dim rqState, rqOtherCity, rqEmailId, rqCity
Dim rqQuestion, rqOtherField1, rqOtherField2
Dim strAllcoatedCity, objRs
Dim EmailId1, EmailId2, todayDate
Dim FirstName, LastName, Faculty1
Dim strBody, objCDOMail
Dim strValue

Set objRs = Server.CreateObject("ADODB.Recordset")

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function



rqCallerName  =  Request.Form("callername")
rqPhoneNo     =  Request.Form("phoneno")
rqState       =  Request.Form("state")
rqEmailId     =  Request.Form("emailid")
rqQuestion    =  Request.Form("question") 
rqOtherField1 =  Request.Form("otherfield1")
rqOtherField2 =  Request.Form("otherfield2")

todayDate = ((year(now()))&"-" &(month(now()))&"-" &(day(now())))

ConnObj.Execute "INSERT INTO sixsigma_callsreceived (callername, phoneno, calls_state, emailid, question, other1, other2, addeddate,status,addedby) VALUES ('"& rqCallerName &"','"& rqPhoneNo &"','"& rqState &"','"& rqEmailId &"','"& StrQuoteReplace(rqQuestion) &"','"& rqOtherField1 &"','"& rqOtherField2 &"','"& todayDate &"','1','"& Session("USBUserId") &"')"

If rqComment <> "" Then

strCallId = "SELECT MAX(callid) AS CallID FROM ps_callsreceived"

objRs.Open strCallId, ConnObj

Do Until objRs.EOF
	CallId = objRs("CallID")
objRs.Movenext
Loop
objRs.Close

ConnObj.Execute "INSERT INTO sixsigma_fac_comments (f_comment, f_revlevel, comm_addedby, callid, comm_date) VALUES ('" & StrQuoteReplace(rqComment) & "','1','" & Session("USBUserId") & "','" & CallId & "', '"& Now() & "')"

ConnObj.Execute "UPDATE sixsigma_callsreceived SET Status = '2' WHERE callid = '"& CallId &"'"

Response.Redirect("6sigmaMarketingB2C.asp?action=followUp")

Else 

Response.Redirect("6sigmaMarketingB2C.asp?action=noFollowUp")

End If 

%>
<!--#include virtual="/includes/connectionClose.asp"-->