<html>
<head>
<TITLE>ITILstudy.com Economical, Effective</TITLE>
<META http-equiv=Content-type content="text/html; charset=ISO-8859-1">
<META
content="ITILstudy.com offers Online Economical, Effective, Guides on Different Knowledge Areas"
name=description>
<META
content="ITILstudy.com offers Online Economical, Effective, Guides on Different Knowledge Areas"
name=keywords>
</head>
<body>
<!--#include virtual="/includes/connection.asp"-->
<%

Dim Array,KNo, QuesNo, Ans, ID, pmstudy, payer_email, date

Set objRs = Server.CreateObject("ADODB.Recordset")

payer_email=Request.Form("payer_email")
address_street=Request.Form("address_street")
address_city=Request.Form("address_city")
address_state=Request.Form("address_state")
address_country=Request.Form("address_country")
address_zip=Request.Form("address_zip")
ebay_address_id=Request.Form("ebay_address_id")
first_name=Request.Form("first_name")
last_name=Request.Form("last_name")
feedback=Request.Form("feedback")


			strQuery = "SELECT TOP 1 id FROM PaypalDB WHERE payer_email='"&payer_email&"' ORDER BY id DESC"
			objRs.open strQuery,ConnObj
			
			If Not objRs.EOF Then
				payer_id = objRs("id")
			End If
			
			objRs.Close
			
			ConnObj.Execute "UPDATE PaypalDB SET address_street= '"&address_street&"', address_city= '"&address_city&"', address_state= '"&address_state&"', address_country= '"&address_country&"', address_zip= '"&address_zip&"', ebay_address_id= '"&ebay_address_id&"' WHERE id='"&payer_id&"'"
			
 
			'ConnObj.Execute "UPDATE PaypalDB SET address_street= '"&address_street&"' WHERE payer_email='"&payer_email&"'"
			'ConnObj.Execute "UPDATE PaypalDB SET address_city= '"&address_city&"' WHERE payer_email='"&payer_email&"'"
			'ConnObj.Execute "UPDATE PaypalDB SET address_state= '"&address_state&"' WHERE payer_email='"&payer_email&"'"
			'ConnObj.Execute "UPDATE PaypalDB SET address_country= '"&address_country&"' WHERE payer_email='"&payer_email&"'"
			'ConnObj.Execute "UPDATE PaypalDB SET address_zip= '"&address_zip&"' WHERE payer_email='"&payer_email&"'"
			'ConnObj.Execute "UPDATE PaypalDB SET ebay_address_id= '"&ebay_address_id&"' WHERE payer_email='"&payer_email&"'"



			 
			Response.Write "Updated Address for the given question"

subject="Updating Address("&first_name&" "&last_name&")"
body="<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""10px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td  bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/buttons/logo_top.jpg"" width=""285%"" height=""65%"" alt=""ITILstudy""/></span><hr></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "&first_name&" "&last_name&", <BR><BR>Greetings from www.ITILstudy.com.<BR><BR> As per your request, we have updated your Address to:<BR><BR><B> "&address_street&",<BR> "&address_city&",<BR> "&address_state&", "&address_country&" - "&address_zip&"  </B>. <BR><BR>We hope you are enjoying your experience with www.ITILstudy.com: for queries, please email us at adminsupport@itilstudy.com. We always look forward to your feedback and suggestions.<BR><BR>Best Regards,<br /><a href=""http://www.ITILstudy.com"">www.ITILstudy.com</a><br />Email: <a href=""mailto: adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a><br /><br /><B>Feedback from "&first_name&" "&last_name&":</B><BR>"&feedback&"<br /><br /><hr><div align=""center"">><font size=""1px"">ITIL<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.<br>The Swirl logo™ is a trade mark of the Cabinet Office.</font></div>"


%>
<!--#include virtual="/includes/connectionClose.asp"-->

<BR><BR><B>Preview and Send Email</B>

<form name="one" action="./adminsendemail1.asp" method="post">
<input type="hidden" size="150" name="subject" value="<%=subject%>"><BR><BR>
<input type="hidden" size="50" name="payer_email" value="<%=payer_email%>">
<input type="hidden" size="30" name="first_name" value="<%=first_name%>">
<input type="hidden" size="30" name="last_name" value="<%=last_name%>">
<input type="hidden" size="3000" name="body" value='<%=body%>'>
<input type="hidden" size="3000" name="feedback" value="<%=feedback%>">
<input type="Submit" Name="submitvalue" Value="PreviewAgain"><BR>
</Form>

</body>
</html>