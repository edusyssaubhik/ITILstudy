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
'This page is adding calls to the database page'
'This page is comes from calls.asp page'
'======================================================='

'Declare The Variables'
Dim strAddCallDet
Dim rqCallFor, rqCallerName, rqPhoneNo
Dim rqCity, rqOtherCity, rqEmailId
Dim rqQuestion, rqOtherField1, rqOtherField2
Dim strAllcoatedCity, objRs
Dim EmailId1, EmailId2, EmailId3, FirstName, LastName
Dim strBody, objCDOMail
Dim strValue, CallId, rqComment
Dim strCallId, rqCountry, rqState

Set objRs = Server.CreateObject("ADODB.Recordset")

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function 


rqCallFor     =  Request.Form("callfor")
rqCallerName  =  Request.Form("callername")
rqPhoneNo     =  Request.Form("phoneno")
rqCity        =  Request.Form("city")
rqOtherCity   =  Request.Form("othercity")
rqEmailId     =  Request.Form("emailid")
rqQuestion    =  Request.Form("question") 
rqOtherField1 =  Request.Form("otherfield1")
rqOtherField2 =  Request.Form("otherfield2")
rqComment     =  Request.Form("comment")
rqCountry     =  request.Form("country")
rqState       =  request.Form("state")


ConnObj.Execute "INSERT INTO ITIL_callsreceived_new (callfor, callername, phoneno, emailid, callerstate, city, question, call_status1, addeddate, addedby,country, website) VALUES ('"& rqCallFor &"','"& StrQuoteReplace(rqCallerName) &"','"& rqPhoneNo &"','"& rqEmailId &"', '"& rqState &"','"& rqCity &"','"& StrQuoteReplace(rqQuestion) &"','1','"& Now() &"','"& Session("USBUserId") &"','"& Session("CRM_Country") &"', 'ITILstudy')"


If rqComment <> "" Then

strCallId = "SELECT MAX(callid) AS CallID FROM ITIL_callsreceived_new"

objRs.Open strCallId, ConnObj

Do Until objRs.EOF
	CallId = objRs("CallID")
objRs.Movenext
Loop
objRs.Close

ConnObj.Execute "INSERT INTO fac_comments_new (f_comment, f_revlevel, comm_addedby, callid, comm_date) VALUES ('" & StrQuoteReplace(rqComment) & "','1','" & Session("USBUserId") & "','" & CallId & "', '"& Now() & "')"

ConnObj.Execute "UPDATE ITIL_callsreceived_new SET call_status1 = '2' WHERE callid = '"& CallId &"'"



Response.Redirect("marketingB2C.asp?action=followUp")

Else 

Response.Redirect("marketingB2C.asp?action=noFollowUp")

End If 

%>
<!--#include virtual="/includes/connectionClose.asp"-->
<% End If %>