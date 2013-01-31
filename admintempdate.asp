<html>
<head>
<TITLE>ITILstudy.com </TITLE>
<META http-equiv=Content-type content="text/html; charset=ISO-8859-1">
<META
content="ITILstudy.com offers Online Economical, Effective,Guides on Different Knowledge Areas"
name=description>
<META
content="ITILstudy.com offers Online Economical, Effective,Guides on Different Knowledge Areas"
name=keywords>
</head>
<body>
<!--#include virtual="/includes/connection.asp"-->
<%

Dim Array,KNo, QuesNo, Ans, ID, projstudy, payer_email, date

Dim objRs,Rs,rqAmount
Dim rqModeOfPayment,rqPaymentdate,rqTraDetails

Set objRs = Server.CreateObject("ADODB.Recordset")
Set Rs = Server.CreateObject("ADODB.Recordset")

date=Request.Form("date")
payer_email=Request.Form("payer_email")
first_name=Request.Form("first_name")
last_name=Request.Form("last_name")
feedback=Request.Form("feedback")
rqAmount = Request.Form("NewAmount")
rqModeOfPayment = Request.Form("ModeOfPayment")
rqPaymentdate = Request.Form("Paymentdate")
rqTraDetails = Request.Form("TraDetails")	

If Trim(payer_email) = "" Then
    Response.redirect "adminupdatedb.asp"
End If
'updateExpiryDate = (YEAR(date) & "/" & (Month(date)) & "/" & (DAY(date)))

ConnObj.Execute "UPDATE PaypalDB SET date_valid = '"&date&"' WHERE payer_email='"&payer_email&"'"
Rs.Open "SELECT ID from PaypalDB  WHERE payer_email='"&payer_email&"' ORDER BY ID DESC",ConnObj
    
rqEnrollID = Rs("ID")
	
If rqModeOfPayment <> "" AND rqModeOfPayment<> "Test-Environment" AND rqModeOfPayment<> "Free-Extension"  Then
						
ConnObj.Execute "INSERT INTO Online_transaction (EnrollID,Payment_Gateway,Payment_Date,Txn_Details,Amount) VALUES('"&rqEnrollID&"','"&rqModeOfPayment&"','"&rqPaymentdate&"','"&rqTraDetails&"','"&rqAmount&"')"

End If

strCity = "SELECT coursedetails FROM ITIL_enrolledusers WHERE email='"&payer_email&"' ORDER BY ID DESC"

objRs.Open strCity, ConnObj

Do Until objRs.EOF

	City1 = Split(objRs("coursedetails"),":")
	
	City = City1(0)

objRs.Movenext
Loop

ConnObj.Close
set ConnObj = Nothing

Response.Write "Updated Expiry Date for the given EmailID"

'response.Write(date)

'updateExpiryDate = (YEAR(date) & "/" & (Month(date)) & "/" & (DAY(date)))

'date=DateAdd("d", -1, date)

subject="Updating Expiry Date("&first_name&" "&last_name&")"
body="<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/buttons/logo_top.jpg"" alt=""ITILstudy"" width=""600px"" height=""65"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "&first_name&" "&last_name&", <BR><BR>Greetings from www.ITILstudy.com!<BR><BR> We have changed the Expiry date of your course to:<B> "&date&" </B>as you had requested. Please use your UserID and Password to log into ITILstudy.com (Login URL : www.ITILstudy.com/memberlogin.asp)<BR><BR>We hope you are enjoying your experience with www.ITILstudy.com: for queries, please email us at adminsupport@ITILstudy.com. We always look forward to your feedback and suggestions.<BR><BR>Best Regards,<BR>www.ITILstudy.com<BR>Email: adminsupport@itilstudy.com</font><BR><BR><B>Feedback from "&first_name&" "&last_name&":</B><BR>"&feedback&"<BR></font></font></td></tr></table><hr><div align=""center""><font size=""1px"">ITIL<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.<br>The Swirl logo™ is a trade mark of the Cabinet Office.</font></div></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"


%>
<BR>
<B>Preview and send email</B><BR>
<form name="one" action="./adminsendemail1.asp" method="post">
  <input type="hidden" size="150" name="subject" value="<%=subject%>">
  <BR>
  <BR>
  <input type="hidden" size="50" name="payer_email" value="<%=payer_email%>">
  <input type="hidden" size="30" name="first_name" value="<%=first_name%>">
  <input type="hidden" size="30" name="last_name" value="<%=last_name%>">
  <input type="hidden" size="3000" name="body" value='<%=body%>'>
  <input type="hidden" size="3000" name="feedback" value="<%=feedback%>">
 <!-- <input type="hidden" name="City" value="<%'=Trim(City)%>">-->
  <input type="Submit" Name="submitvalue" Value="PreviewAgain">
  <BR>
</Form>
</body>
</html>
