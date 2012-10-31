<html>
<head>
<title>ITILstudy - ITIL Foundation Course</title>

</head>
<body>
<%@LANGUAGE="VBScript"%>
<!--#include virtual="/includes/connection.asp"-->
<%

Dim Array,KNo, QuesNo, Ans, ID, pmstudy, payer_email, pass, kno_passed, item_number
Dim date_valid

If request.Form("country") <> "" Then
country = request.Form("country")
Else 
country = Session("CRM_Country")
End If

If Country = "India" Then 
Country = 3
ElseIF Country = "US" Then 
Country = 2
ElseIF Country = "Other" Then
Country = 1
End If

'response.Write(country)

payer_email = Request.Form("payer_email")
first_name  = Request.Form("first_name")
last_name   = Request.Form("last_name")
rqCity      = Trim(Request.Form("City"))
rqCustom	= Request.Form("Custom")
rqStreet	= Request.Form("Street")
rqState		= Request.Form("State")
rqCountry	= Request.Form("Country")
OneMonthCourse = Request.Form("onemonthcourse")

Set objRs = Server.CreateObject("ADODB.Recordset")

strCountry = "SELECT country FROM ITIL_city WHERE city = '"& rqCity &"'"

objRs.Open strCountry, ConnObj

Do Until objRs.EOF
	
	Country = objRs("country")
	
	If Country = "India" Then 
Country = 3
ElseIF Country = "US" Then 
Country = 2
ElseIF Country = "Other" Then
Country = 1
End If

	
objRs.Movenext
Loop
objRs.Close

If OneMonthCourse = "OneMonthCourse" Then

	'Giving free Six Sigma Green Belt (Online Certificate) - 3 Months Course for US and Canada classroom users'
	'Inserting into the 6sigmastudy database'
	
	sigma_item_name    = "Green Belt with Online Certificate"
	sigma_item_number  = 103
	pass = "6sigma"
	GBBB = "GB"
	kno = 0
	sigma_date_entered  =  Date()
	sigma_date_valid    =  Date() + 90
	
	Dim ConnObj1
	
	Set ConnObj1 = Server.CreateObject("ADODB.Connection")
	
	ConnObj1.Open "PROVIDER=SQLOLEDB;DATA SOURCE=db.winwinhosting.com;UID=6sigmastudy;PWD=BhtV7QnCrkOPeJvu;DATABASE=6sigmastudy"
	'ConnObj1.Open "PROVIDER=SQLOLEDB;DATA SOURCE=PRIYANKA-1545;UID=sa;PWD=edusys;DATABASE=6sigmastudy"

	
	
	ConnObj1.Execute "INSERT INTO PaypalDB (paypal_address_id, kno_passed, item_name, item_number, payer_email, first_name, last_name, address_street, custom, address_country, address_city, pass, date_entered, date_valid) VALUES ('"&GBBB&"', '"&kno&"', '"&sigma_item_name&"', '"&sigma_item_number&"', '"&payer_email&"', '"&first_name&"', '"&last_name&"','"&rqStreet&"', '"&rqCustom&"', '"&rqCountry&"', '"&rqCity&"', '"&pass&"', '"&sigma_date_entered&"', '"&sigma_date_valid&"')"
	
subject="Welcome to www.6sigmastudy.com - Six Sigma Green Belt (Online Certificate) - 3 Months Course"

body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px""></td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF"">"
                       
						body= body & "<span><img src=""http://www.ITILstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" /></span>" 
						
						body= body &"</td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "&first_name&" "&last_name&", <BR><BR>Greetings from ITILstudy.com!<BR><BR> We are glad to have you as a delegate in our ITIL Classroom Course.<br><br>As part of our continued effort to create and deliver maximum value to our delegates,we are happy to offer you Completely Free and Complimentary Access to Six Sigma Green Belt online certificate course for three months, offered by our affiliate brand.<a href=""http://www.6sigmastudy.com/"" target=""_blank"">www.6sigmastudy.com</a> (priced at &#163;175.00)<BR><BR>Trusted by 725+ companies across 50+ countries, this course will not only help you understand and apply the concepts of Six Sigma in your workplace but also will offer you 25 PMI PDUs which can be used for continuing education requirements of certified PMPs.<br><br>Use the below details to log into your course at <a href=""http://www.6sigmastudy.com/"" target=""_blank"">6sigmastudy.com</a> <a href=""http://www.6sigmastudy.com/memberlogin.asp"" target=""_blank"">member login</a><br><br>UserId: "&payer_email&"<br>Password: 6sigma<br><br>Please Note:<br><br>You will have access to: Six Sigma Green Belt (Online Certificate) - 3 months course.<br>For more details about this offering, please <a href=""http://www.projstudy.com/ITIL-Training/free-onlinecertification.asp"" target=""_blank"">click here.</a> <br><br>We hope you will enjoy your experience with <a href=""http://www.6sigmastudy.com/"" target=""_blank"">www.6sigmastudy.com</a>. For queries, please email us at adminsupport@6sigmastudy.com : we always look forward to your feedback and suggestions.<BR><BR>Best Regards,<BR>Customer Support<br><a href=""http://www.ITILstudy.com"" target=""_blank"">www.ITILstudy.com</a><BR>(APMG Accredited Training Organization)<BR>Email: marketing@projstudy.com<BR></font></font></td></tr></table></td></tr><tr height=""30px""><td></td></tr></table></td></tr><tr height=""45px""><td></td></tr></table>"

End IF
%>

<BR><BR><B>Preview and Send Email</B>

<form name="one" action="./adminsendemail1.asp" method="post">
<input type="hidden" size="150" name="subject" value="<%=subject%>"><BR><BR>
<input type="hidden" size="50" name="payer_email" value="<%=payer_email%>">
<input type="hidden" size="30" name="first_name" value="<%=first_name%>">
<input type="hidden" size="30" name="last_name" value="<%=last_name%>">
<input type="hidden" size="3000" name="body" value='<%=body%>'>
<input type="hidden" size="3000" name="feedback" value="<%=feedback%>">
<input type="hidden" name="City" value="<%=rqCity%>">
<input type="hidden" name="Country" value="<%=Country%>">

<% If Country = "2" Then %>
<input type="hidden" name="onemonthcourse" value="<% = OneMonthCourse %>" />
<% End If %>
<input type="hidden" name="6sigmaemail" value="6sigmaemail">
<input type="Submit" Name="submitvalue" Value="PreviewAgain"><BR>
</Form>

</body>
</html>