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
'Last UpDated : 11/09/2009'
'Description :'
'This page is adding the COMPANY into datebase page'
'======================================================='

'Declare The Variables'
Dim strCompany
Dim rqCompany
Dim objRs
Dim rqType
Dim rqContName, rqDesignation, rqPhoneNo1, rqPhoneNo2, rqPhoneNo3
Dim rqFax, rqAdress, rqEmail, rqPersonAdding, rqTypeofMessage, message
Dim rqOldStatus, rqMessage
Dim rqName, rqFollowupdate, rqFollowup

'Creating the record objects
Set objRs = Server.CreateObject("ADODB.Recordset")

rqType = Request.Form("type")


If rqType = "Add Company" Then

'Retriving the values from marketingB2B.asp page
rqCompany = Trim(Request.Form("company"))

strCompany = "SELECT company FROM mar_company WHERE company = '"&rqCompany&"'"

objRs.Open strCompany,ConnObj

	If (Not objRs.BOF) And (Not objRs.EOF) Then
	
			
		Session("statusMes") = rqCompany&" company already exists"
		Response.Redirect("marketingB2b.asp?action=addComp")
		
	Else
		
		ConnObj.Execute("INSERT INTO mar_company (company) VALUES ('"&rqCompany&"')")
		Session("statusMes") = "Added Company to list "& rqCompany
		Response.Redirect("marketingB2b.asp?action=addComp")
	
	End If	

ElseIf rqType = "Add Contact" Then
	
	'Retriving the values from addMarkB2BDet.asp page'
	'In the Add Contact form'
	rqContName      =  Request.Form("contName")
	rqCompany       =  Request.Form("company")
	rqDesignation   =  Request.Form("designation")
	rqPhoneNo1      =  Request.Form("phoneNo1")
	rqPhoneNo2      =  Request.Form("phoneNo2")
	rqPhoneNo3      =  Request.Form("phoneNo3")
	rqFax		    =  Request.Form("fax")
	rqAdress	    =  Request.Form("address")
	rqEmail         =  Request.Form("email")
	rqPersonAdding  =  Session("USBUserId")
	rqTypeofMessage =  "Contact"


	message = rqContName & ", <BR>Company: " & rqCompany & ",<BR>Desig: " & rqDesignation & ",<BR>Phone Number1: " & rqPhoneNo1 & ",<BR>Phone Number2: " & rqPhoneNo2 & ",<BR>Phone Number3: " & rqPhoneNo3 & ",<BR>Email: " & rqEmail & ",<BR>Fax: " & rqFax & ",<BR>Address: " & rqAdress & ",<BR> " 

	ConnObj.Execute "INSERT INTO corpmarketing (CompanyName, TypeOfMessage, Message, PersonAdding, DateofEntry) VALUES('"&rqCompany&"', '"&rqTypeofMessage&"', '"&message&"', '"&rqPersonAdding&"', '"&now()&"')"

	Session("statusMes") = ("Added Contact "&rqContName&" to list : ("&rqCompany&")")
	Response.Redirect("marketingB2B.asp?action=viewAlerts")


ElseIf rqType = "Add / Update Status for company" Then

	rqTypeofMessage =  "Status"
	rqOldStatus	    =  Request.Form("oldStatus")
	rqMessage		=  Request.Form("message")
	rqCompany	    =  Request.Form("company")
	rqPersonAdding  =  Session("USBUserId")
	
	ConnObj.Execute "INSERT INTO corpmarketing (CompanyName, TypeofMessage, Message, PersonAdding, DateofEntry) VALUES('"&rqCompany&"', '"&rqTypeofMessage&"', '"&rqMessage&"', '"&rqPersonAdding&"', '"&now()&"')"
	
	Response.Redirect("marketingB2B.asp?action=viewAlerts")

ElseIf rqType = "Add New Alert for Follow Up" Then

	rqName = Request.Form("name")
	rqCompany = Request.Form("company")
	rqDesignation = Request.Form("designation")
	rqPhoneNo1 = Request.Form("phoneNo1")
	rqFollowupdate = Request.Form("followupdate")
	rqFollowup = Request.Form("followup")
	rqEmail = Request.Form("email")
	rqTypeofMessage = "Alerts"
	rqPersonAdding = Session("USBUserId")
	
	message = rqName & ", <BR>Company: " & rqCompany & ",<BR>Desig: " & rqDesignation & ",<BR>PhoneNo1: " & rqPhoneNo1 & "<BR>Email: " & rqEmail & "<BR>Alerts Instruction: " & rqFollowup & ",<BR> " 

	ConnObj.Execute "INSERT INTO corpmarketing (CompanyName, TypeOfMessage, Message, PersonAdding, DateOpen, DateofEntry) VALUES('"&rqCompany&"', '"&rqTypeofMessage&"', '"&message&"', '"&rqPersonAdding&"', '"&rqFollowupdate&"', '"&now()&"')"


	Response.Redirect("marketingB2B.asp?action=viewAlerts")

End If






End If
%>
