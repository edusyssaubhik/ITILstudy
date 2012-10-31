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
'Written By : savita'
'Last UpDated : 22/02/2011'
'======================================================='

'Declare The Variables'
Dim objRs
Dim rqName, rqEmailID, rqcity
Dim rqCountry, rqInvoiceDate
Dim rqdatePayment_dec, rqFailureReason
Dim rqAmount, rqPayProcess_name,rqComments,rqdatePayment_rec
Dim rqType, rqId,rqTypeofCourse, rqContactNo ,rqOrderNo
Dim rqAction, rqStatus, strBody, strPayment,rqCurrency_type,rqWebsite

rqTypeofCourse= Request.Form("TypeofCourse") 
rqName = Request.Form("Name") 
rqEmailID  = Request.Form("EmailID")
rqcity 		= Request.Form("city")
rqCountry  = Request.Form("Country")
rqType      = Request.Form("type")
rqInvoiceDate    = Request.Form("InvoiceDate")
rqdatePayment_dec= Request.Form("datePayment_dec")
rqFailureReason   = Request.Form("FailureReason")
rqAmount  = Request.Form("Amount")
rqPayProcess_name  = Request.Form("PayProcess_name")
rqAction    = Request.QueryString("action") 
rqStatus = Request.Form("Status")
rqContactNo = Request.Form("ContactNo")
rqCurrency_type = request.Form("Currency_type")
'rqWebsite = request.Form("Website")
rqOrderNo = request.Form("OrderNo")

Set objRs = Server.CreateObject("ADODB.Recordset")

If rqType = "Add New Query" Then
	'If rqAction = "newQuery" Then

	strPayment =  "Insert into paymentDecline (TypeofCourse,Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,Status, ContactNo, Currency_type, OrderNo) VALUES ('"&rqTypeofCourse&"', '"& rqName &"','"& rqEmailID &"','"& rqcity &"','"& rqCountry &"','"& rqInvoiceDate &"','"& rqdatePayment_dec &"','"& rqFailureReason &"', '"& rqAmount &"', '"& Session("UserID") &"', '"& now() &"', '"& rqPayProcess_name &"','1', '"&rqContactNo&"', '"&rqCurrency_type&"', '"&rqOrderNo&"')"
	
	
	'Response.Write(strPayment)
	objRs.Open strPayment,Conn
	'Response.Write(strPayment)
	Response.Redirect("PayDecline.asp?action=noFollowUp")	
	
End If

%>
<% End If %>
