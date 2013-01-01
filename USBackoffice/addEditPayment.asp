<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% 
If Session("USBUserId") = "" Then
	Response.Redirect("login.asp")
Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'Written By : Praveen'
'Created Date: 19/04/2010'
'Last Updated Date: 22/04/2010'
'Description :'
'Purpose : Adding the Payment details into the Database in this page'

'Declare The Variables'
Dim objRs, rqAction, straddpayment, objRs1,strPay,strEdit_Check,rqCompName
Dim  rqFaculty, rqPaymentcat, rqDetails, rqAmount, todayDate,compAdd,rqCompAdd
Dim strfin, rqpay_cat, rqFinid,rqPayStatus,rqCheckNo, details, rqFacName,rqPayMode, body
Dim rqPayId, rqPastPayDate, rqComp_Name
Dim payment_month, Month_Payment,rqPay_Approve,rqType,rqPay_Notapprove
Dim rqTax
 
'Creating Recordsets'
Set objRs = Server.CreateObject("ADODB.recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
 
 
'Retrive the type of action'
rqAction = Request.Form("action")
rqType = Request.Form("Type")
If Request.Form("Currency") <> "" Then
rqCurrency = Request.Form("Currency")
Else
rqCurrency = Request.Form("Currency1") 
End If
'Retrive the Payments from the fin.asp for insertion'
rqFaculty    = Request.Form("faculty")
rqPaymentcat = Request.Form("paymentCategory")
rqDetails    = Request.Form("details")
rqPastPayDate = Request.Form("pastPayDate")
rqComp_Name  = Request.Form("compName")
rqID  = Request.Form("ID")
rqPay_Approve  = Request.Form("Approve")

if rqPaymentcat = "Paymentforopenclass" Then
rqCID   = Request.Form("first")
rqNostudents   = Request.Form("EnrollNo")

ElseIf rqPaymentcat = "Paymentforcorporateclass" Then
 rqCID   = Request.Form("second")
 rqNostudents   = Request.Form("noofEnroll") 
 End If
 rqTax = Request.Form("Tax")


 
'Retrive the values from this page for the edit page'
rqFaculty = Request.Form("faculty")
rqpay_cat = Request.Form("paymentCategory")
rqdetails = Request.Form("details")
rqamount  = Request.Form("amount")
rqFinid   = Request.Form("finid")
rqPayId   = Request.Form("payid")


'Retrive the values from this page for inserting into ps_finance_pay' 
rqFaculty   =  Request.Form("faculty")
rqAmount    =  Request.Form("Amount")
rqPayStatus =  Request.Form("pay_status")
rqPayMode   =  Request.Form("Pay_mode")
rqCheckNo   =  Request.Form("Checkno")
rqFacName   =  Request.Form("facName")
	
If rqAction = "Add Payment" Then
 
	'Converting date format - YYYY-MM-DD'
	todayDate = (YEAR(Date()) & "-" & (Month(date())) & "-" & (DAY(date())))

	'This is to insert apostrophe in the textarea (replacing single code with double code)
	details = Replace(rqdetails,"'","''")
	compAdd = Replace(rqCompAdd,"'","''")
 
	'Inserting the values into the ps_finance table'
	if rqPaymentcat = "Paymentforopenclass" OR rqPaymentcat = "Paymentforcorporateclass" Then
	straddpayment = "INSERT INTO ITIL_finance(faculty,pay_cat,details,amount,added_date,CourseId,attendedstudents"
	Else
	straddpayment = "INSERT INTO ITIL_finance(faculty,pay_cat,details,amount,added_date"
	End If
	'If rqPastPayDate <> "" Then
'	straddpayment = straddpayment & ",status,Approved_by,Approved_date "
'	End If
	straddpayment = straddpayment & ",added_by,Tax,currency,country) VALUES "
	straddpayment = straddpayment & "('" & rqFaculty & "',"
	straddpayment = straddpayment & "'" & rqPaymentcat & "',"
	straddpayment = straddpayment & "'" & Trim(details) & "',"
	straddpayment = straddpayment & "'" & int(rqAmount) & "',"
	If rqPastPayDate = "" Then
	straddpayment = straddpayment & "'" & todayDate & "',"
	Else 
	straddpayment = straddpayment & "'" & rqPastPayDate & "',"
	End If
	If rqPaymentcat = "Paymentforopenclass" OR rqPaymentcat = "Paymentforcorporateclass" Then
	straddpayment = straddpayment & "'" & int(rqCID) & "',"
	straddpayment = straddpayment & "'" & int(rqNostudents) & "',"
	End If
	'If rqPastPayDate <> "" Then 
'	straddpayment = straddpayment & "'1',"
'	straddpayment = straddpayment & "'" & Session("USBUserId") & "',"
'	straddpayment = straddpayment & "'" & rqPastPayDate & "',"
'	End If	
	straddpayment = straddpayment & "'" & Session("USBUserId") & "',"
	straddpayment = straddpayment & "'" & rqTax & "',"
	straddpayment = straddpayment & "'" & rqCurrency & "',"
	straddpayment = straddpayment & "'" & Session("CRM_Country") & "')"	
	Response.Write(straddpayment)
	ConnObj.Execute straddpayment

	'After inserting the values into the database redirect to finance page'
	If rqPastPayDate <> "" Then 
	Response.Redirect("payHis.asp?faculty="&rqFaculty)
	Else
	Response.Redirect("fin.asp?action=paymentDetails&faculty="&rqFaculty)
    End If
'Editing and updating the values into the ps_finance table'
ElseIf rqAction = "Edit" Then

	'Converting date format - YYYY-MM-DD'
	todayDate = (YEAR(Date()) & "-" & (Month(date())) & "-" & (DAY(date())))	 

	'This is to insert apostrophe in the textarea (replacing single code with double code)
	details = replace(rqdetails,"'","''")
 
	strfin = "UPDATE ITIL_finance SET "
	strfin = strfin & "pay_cat= '" & rqpay_cat & "',"
	strfin = strfin & "details= '" & Trim(details) & "',"
	strfin = strfin & "amount = '" & rqamount& "',"	
	strfin = strfin & "Tax = '" & rqTax & "',"	
	strfin = strfin & "last_mod_date= '" & todayDate & "',"
    strfin = strfin & "last_mod_by= '" &  Session("USBUserId") & "',"
	strfin = strfin & "status= '"& 0 &"',"
	strfin = strfin & "currency= '"& rqCurrency &"'"
	strfin = strfin & "  WHERE finid = '" & rqFinid & "'"
		
	ConnObj.Execute strfin

	'After inserting the values into the database redirect to finance page'
	Response.Redirect("fin.asp?action=paymentDetails&faculty="&rqFaculty)

'Inserting Payment details'
ElseIf rqAction = "Submit" Then

	'Converting date format - YYYY-MM-DD'
	'todayDate = (YEAR(Date()) & "-" & (Month(date())) & "-" & (DAY(date())))	
	raPayDate = Request.Form("pay_date")
	
	payment_month = Request.Form("payment_month")
	
	If payment_month <> "" Then
		
		Month_Payment = MonthName((Month(payment_month)),true) & "-" & YEAR(payment_month)

	Else
	
		Month_Payment = MonthName((Month(date())),true) & "-" & YEAR(Date())

	End If 

	strPay = "INSERT INTO ITIL_finance_pay (faculty, pay_status, pay_made_date, pay_made_by, pay_mode, checkno, Totalamount, month_of_pay,currency,country) VALUES "
	strPay = strPay & "('" & rqFaculty & "',"
	strPay = strPay & "'" & rqPayStatus & "',"
	strPay = strPay & "'" & raPayDate & "',"
	strPay = strPay & "'" & Session("USBUserId") & "',"
	strPay = strPay & "'" & rqPayMode & "',"
	strPay = strPay & "'" & rqCheckNo & "',"
	strPay = strPay & "'" & rqAmount & "',"
	strPay = strPay & "'" & Month_Payment & "',"
	strPay = strPay & "'" & rqCurrency & "',"
	strPay = strPay & "'" & Session("CRM_Country") & "')"
	
	ConnObj.Execute strPay
	
	
	
	
	'Email sending to faculty after payment is done'
	If rqPayStatus = 1 Then
	
	body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.ITILstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Hi "&rqFacName&",<BR><BR>We are pleased to inform you that on "&FormatDateTime(raPayDate,1)&" we have remitted a payment for the amount of "&rqCurrency&" "&rqAmount&" through "&rqPayMode&"  ("&rqPayMode&" number: "&rqCheckNo&") "
	If rqComp_Name <> "" Then
	body = body &"to "&rqComp_Name
	End If
	
	If rqPayMode = "Check" Then
	body = body &"<BR><BR>You will be receiving the check soon.<br><br>For details about this payment, please login into ITILstudy Backoffice and look up the 'Finance' module."
	End If
    body = body &"<BR><BR>Please note with this payment, all payments due to "&rqComp_Name&" till December 31, 2012 have been paid."

	body = body &"<br><br>If the total payment for the month "& Month_Payment &" differs with your records, please email marketing@ITILstudy.com and copy t_satpathy@yahoo.com.<br><br>Regards,<br>Finance Team<br>VMEdu Inc</font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"
	
	subject = "Payment for the month of "& Month_Payment
	
	Response.Write(subject)
	Response.Write(body)
	Dim objCDOMail     
	'Holds the CDONTS NewMail Object
	'Create the e-mail server object
	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
	'Who the e-mail is from
	objCDOMail.From = "marketing@ITILstudy.com"
	'Who the e-mail is sent to
	objCDOMail.To = ""&rqFaculty&""
	'objCDOMail.To = "marketing@ITILstudy.com"
	'Who the CC are sent to
	'objCDOMail.Bcc = "t_satpathy@yahoo.com"
	'Who the blind copies are sent to
	objCDOMail.Cc = "marketing@ITILstudy.com, financialsus@gmail.com"
	'Set the subject of the e-mail
	objCDOMail.Subject = ""&subject&""
	'Set the e-mail body format (0=HTML 1=Text)
	objCDOMail.BodyFormat = 0
	'Set the mail format (0=MIME 1=Text)
	objCDOMail.MailFormat = 0
	'Set the main body of the e-mail
	objCDOMail.Body = ""&body&""
	'Importance of the e-mail (0=Low, 1=Normal, 2=High)
	objCDOMail.Importance = 2
	'Send the e-mail
	objCDOMail.Send
	'Close the server object
	Set objCDOMail = Nothing

	End If
	
	'After inserting the values into the database redirect to finance page'
	Response.Redirect("fin.asp?action=paymentDetails&faculty="&rqFaculty)

'Editing and updating the values into the ps_finance_pay table(editing payment details)'
ElseIf rqAction = "Edit Payment Detail" Then
	
	'Retrivng the payment date'
	raPayDate = Request.Form("pay_date")
	
	strEdit_Check = "UPDATE ITIL_finance_pay SET "
	strEdit_Check = strEdit_Check & "pay_status= '" & rqPayStatus & "',"
	strEdit_Check = strEdit_Check & "totalamount= '" & rqAmount & "',"
	strEdit_Check = strEdit_Check & "Pay_mode= '" & rqPayMode & "',"
	strEdit_Check = strEdit_Check & "checkno= '" & rqCheckNo & "',"
	strEdit_Check = strEdit_Check & "pay_made_date= '" & raPayDate & "'"
	strEdit_Check = strEdit_Check & "  WHERE  faculty = '"& rqFaculty &"' And payid = '"& rqPayId &"'"
	
	
	ConnObj.Execute strEdit_Check
	
	body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.ITILstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Hi "&rqFacName&",<BR><BR>We are pleased to inform you that on "&FormatDateTime(raPayDate,1)&" we have remitted a payment for the amount of "
	If Session("CRM_Country") = "United Kingdom" Then
	body = body &"&#163; "
	Else
	body = body &"$ "
	End If
	body = body & rqAmount&" through "&rqPayMode
	If rqPayMode = "Check" Then
	body = body & "(Confirmation No: "
	ElseIf rqPayMode = "Wire Transfer" Then
	body = body & "(Order No: "
	Else
	body = body & "(Online Transaction No: "
	End If
	body = body & rqCheckNo&") "
	If rqComp_Name <> "" Then
	body = body &"to "&rqComp_Name
	End If
	
	If rqPayMode = "Check" Then
	body = body &"<BR><BR>You will be receiving the check soon.<br><br>For details about this payment, please login into ITILstudy GlobalBackoffice and look up the 'Finance' module."
	End If
    body = body &"<BR><BR>Please note with this payment, all payments due to "&rqComp_Name&" till December 31, 2012 have been paid."

	body = body &"<br><br>If the total payment for the month "& Month_Payment &" differs with your records, please email marketing@ITILstudy.com and copy t_satpathy@yahoo.com.<br><br>Regards,<br>Finance Team<br>VMEdu Inc</font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"
	
	subject = "Payment for the month of "& Month_Payment
	
	'Response.Write(body)
   
	'Holds the CDONTS NewMail Object
	'Create the e-mail server object
	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
	'Who the e-mail is from
	objCDOMail.From = "marketing@ITILstudy.com"
	'Who the e-mail is sent to
	objCDOMail.To = ""&rqFaculty&""
	'Who the CC are sent to
	objCDOMail.Bcc = "t_satpathy@yahoo.com"
	'Who the blind copies are sent to
	objCDOMail.Cc = "marketing@ITILstudy.com, financialsus@gmail.com"
	'Set the subject of the e-mail
	objCDOMail.Subject = ""&subject&""
	'Set the e-mail body format (0=HTML 1=Text)
	objCDOMail.BodyFormat = 0
	'Set the mail format (0=MIME 1=Text)
	objCDOMail.MailFormat = 0
	'Set the main body of the e-mail
	objCDOMail.Body = ""&body&""
	'Importance of the e-mail (0=Low, 1=Normal, 2=High)
	objCDOMail.Importance = 2
	'Send the e-mail
	objCDOMail.Send
	'Close the server object
	Set objCDOMail = Nothing
	

   'After inserting the values into the database redirect to finance page'
    Response.Redirect("fin.asp?action=paymentDetails&faculty="&rqFaculty)

End If

'if Admin click on approve or not approve comes here
If rqType = "Submit" Then

strStatus= "UPDATE ITIL_finance  SET "
		strStatus= strStatus& "Status= '" & rqPay_Approve & "',"
		strStatus= strStatus& "Approved_by= '" & Session("USBUserId") & "',"
		strStatus= strStatus& "Approved_Date= '" & Now() & "'"
		
		strStatus= strStatus& " WHERE finid = '"& rqID  &"'"
	
	ConnObj.Execute strStatus
response.Redirect("fin.asp?action=paymentDetails&faculty="&rqFaculty&"")
End If
End If
%>
