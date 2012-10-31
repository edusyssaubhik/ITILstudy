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
'Last UpDated : 18/08/2009'
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
Dim Fac1, Fac2, Fac3 
Dim FirstName, LastName
Dim strBody, objCDOMail
Dim strValue, rqComment, rqCounty

Set objRs = Server.CreateObject("ADODB.Recordset")

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function


rqCallFor     =  Request.Form("callfor")
rqCallerName  =  Request.Form("callername")
rqPhoneNo     =  Request.Form("phoneno")
rqCounty       =  Trim(Request.Form("county"))
rqCity        =  Request.Form("city")
rqEmailId     =  Request.Form("emailid")
rqQuestion    =  Request.Form("question") 
rqComment     =  Request.Form("comment")

ConnObj.Execute "INSERT INTO ps_callsreceived_new (callfor, callername, phoneno, emailid, callerstate, city, question, call_status1, addeddate, addedby, country, website) VALUES ('"& rqCallFor &"','"& rqCallerName &"','"& rqPhoneNo &"','"& rqEmailId &"','"& rqCounty &"','"& rqCity &"','"& StrQuoteReplace(rqQuestion) &"','1','"& Now() &"','"& Session("USBUserId") &"', 'United Kingdom', 'PMstudy')"

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