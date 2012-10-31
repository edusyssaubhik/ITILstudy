<html>
<head>
<TITLE>ITILstudy.com</TITLE>
</head>
<body>
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
'Written By : Savita'
'Last UpDated : 13/04/2011'
'Description : To send the report for particular dates
'======================================================='

Dim objRs,strQuery5

Set objRs = Server.CreateObject("ADODB.Recordset")
Set Rs = Server.CreateObject("ADODB.Recordset")

rqAction = Request.Form("action")
rqfromDate=Request.Form("fromDate")
rqtoDate=Request.Form("toDate")
EmailID=Request.Form("EmailID")


body=Request.Form("body")
subject=Request.Form("subject")


If rqAction = "Preview Payment Details"  Then

strQuery = "SELECT ID, Website, OrderNo, PayProcess_name, Name, EmailID, ContactNo, datePayment_dec, TypeofCourse, city, Country, Amount, Status, FailureReason FROM paymentDecline WHERE datePayment_dec BETWEEN '" & rqfromDate & "' AND '" & rqtoDate & "' AND (Status = '1' OR Status = '2') ORDER BY ID desc"

'Response.write(strQuery)

objRs.Open strQuery, ConnObj


			subject = "Payment decline report from: "&rqfromDate&" to "&rqtoDate&" "

			body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""45%"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td align=""center"" width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.ITILstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span><hr></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top"">"
			

			body= body & "Hi, <BR><BR>Please find below the payment decline report from date <B>"&rqfromDate&"</B> to <B>"&rqtoDate&"</B> :<br><br><table width=""1000px"" border=""1""   cellspacing=""0""><tr><td width =""20px"">Sr No.</td><td width =""50px"">Website</td><td width =""100px"" >Payment Detail</td><td width =""200px"">Customer Details</td><td width =""50px"">Payment Decline Date</td><td width =""50px"">Course</td><td width =""50px"">Country</td><td width =""50px"">Amount [USD]</td><td width =""50px"">Order Status</td><td width =""500px""> Action </td><td width =""150px"">Failure reason</td></tr>"
		
			SrNo = 1
			
			Do Until objRs.EOF
			
			ID = objRs("ID")
			Website = objRs("Website")
	  		OrderNo = objRs("OrderNo")
	   		PayProcess_name = objRs("PayProcess_name")
	 		Name = objRs("Name")
			userEmailID = objRs("EmailID")
	 		ContactNo = objRs("ContactNo")
	 		datePayment_dec = objRs("datePayment_dec")
	  		TypeofCourse = objRs("TypeofCourse")
	 		city = objRs("city")
	  		Country = objRs("Country")
	 		Amount = objRs("Amount")
	  		Status = objRs("Status")
	 		FailureReason = objRs("FailureReason")
			
	 
	  		If ContactNo <> "" Then 
        	strContactNo = ContactNo
        	Else 
			strContactNo = "&nbsp;"
	  		End If 
			
			If OrderNo <> "" Then 
        	strOrderNo = OrderNo
        	Else 
			strOrderNo = "&nbsp;"
	  		End If 
			
			If Website <> "" Then 
        	strWebsite = Website
        	Else 
			strWebsite = "&nbsp;"
	  		End If 
	 
	  		If Status = 1 Then 
        	strStatus = "Payment Declined"
        	ElseIf Status = 2 Then 
        	strStatus = "Payment In Process"
        	ElseIf Status = 3 Then
        	strStatus = "Payment Received"
        	ElseIf Status = 4 Then 
        	strStatus = "Not Interested"
         	End If 
			
			 
			body= body & "<tr><td>"&SrNo&" </td><td >"&strWebsite&"</td><td >Order No: "&strOrderNo&" <br>Mode of Payment: "&PayProcess_name&"</td><td >Name: "&Name&"<br>EmailId: "&userEmailID&"<br>ContactNo: "&strContactNo&" <br> City: "&city&"</td><td >"&datePayment_dec&"</td><td >"&TypeofCourse&"</td><td >"&Country&"</td><td >"&Amount&"</td><td >"&strStatus&"</td>"
			
			'rqID = Request.Querystring("ID")
			
			strQuery1 = "SELECT comment FROM payment_comment WHERE ID = '" & ID &"'"
			
			'Response.Write(strQuery1)

			Rs.Open strQuery1,ConnObj
			
			body= body & "<td>"
			
			CSrNo = 1
			
			If (Not Rs.BOF) And (Not Rs.EOF) Then
			Do Until Rs.EOF
			
			'ID = Rs("ID")
			comment = Rs("comment")

			body= body & CSrNo &". " & comment & "<br>"

			CSrNo = CSrNo + 1
			
			Rs.Movenext
			Loop
			
			Else
			body= body & "&nbsp;"
			End If
			
			Rs.close
			CSrNo = 0
			
			body= body & "</td><td >"&FailureReason&"</td></tr>"
			
			SrNo = SrNo + 1 
			objRs.Movenext
			Loop
			'objRs.Close
			
			body= body & "</table><br><br>Best Regards, <br>Backoffice Team<br>"
		
			body = body & "</font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"

%>
<B>Preview and send email</B><BR><BR>
<form name="one" action="PaySendMail.asp" method="post">
  Email Subject:
  <input type="text" size="125" name="subject" value="<%=subject%>">
  <input type="hidden" size="50" name="EmailID" value="<%=EmailID%>">
  <BR>
  <BR>
  Email Body:<BR>
  <textarea name="body" rows="30" cols="100"><%=body%></textarea>
  <BR>
  <BR>
  <input type="Submit" Name="action" Value="Send">
  <BR>
  <input type="Submit" Name="action" Value="PreviewAgain">
</form>
<BR>
<BR>
Email as it would look when it is sent<BR>
<BR>
Email subject:<BR>
<%=subject%><BR>
<BR>
Email Body:<BR>
<%=body%>
<%

ElseIf rqAction = "Send" Then

Dim objCDOMail
'Holds the CDONTS NewMail Object
'Create the e-mail server object
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'Who the e-mail is from
objCDOMail.From = "adminsupport@itilstudy.com"
'Who the e-mail is sent to
objCDOMail.To = ""&EmailID&""
'Who the blind copies are sent to
objCDOMail.Bcc = "itilstudysales@gmail.com"
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
'Close the server object'
Set objCDOMail = Nothing

Response.Write "Your Email - "&subject&" - has been sent"


ElseIf rqAction="PreviewAgain" Then

%>
<form name="one" action="PaySendMail.asp" method="post">
  View and Send Email / Preview Again:<BR>
  <BR>
  Email Subject<BR>
  :
  <input type="text" size="150" name="subject" value="<% = subject %>">
  <input type="hidden" size="50" name="EmailID" value="<%=EmailID%>">

  <BR>
  <BR>
  Email Body:<BR>
  <textarea name="body" rows="30" cols="100"><% = body %>
</textarea>
  <BR>
  <BR>
  <input type="Submit" Name="action" Value="Send">
  <BR>
  <input type="Submit" Name="action" Value="PreviewAgain">
</form>
<BR>
<BR>
Email as it would look when it is sent<BR>
<BR>
Email Subject:<BR>
<%=subject%>

<BR>
<BR>
Email Body:<BR>
<%=body%>
<%End If
'End If


%>
</body>
</html>
