<html>
<head>
<TITLE>ITILstudy.com PMP Coaching, Economical, Effective</TITLE>
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

Dim Array,KNo, QuesNo, Ans, payer_email, date, pass
payer_email=Request.Form("payer_email")
pass=Request.Form("pass")
first_name=Request.Form("first_name")
last_name=Request.Form("last_name")
feedback=Request.Form("feedback")

			Set objRs = Server.CreateObject("ADODB.Recordset")
			
			strQuery = "SELECT TOP 1 id FROM PaypalDB WHERE payer_email='"&payer_email&"' ORDER BY id DESC"
			objRs.open strQuery,ConnObj
			
			If Not objRs.EOF Then
				payer_id = objRs("id")
			End If
			
			objRs.Close

ConnObj.Execute "UPDATE PaypalDB SET pass='"&pass&"' WHERE id ='"&payer_id&"'"

Response.Write "Updated password for given person"

subject="Updating Password("&first_name&" "&last_name&")"
body="<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""10px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td  bgcolor=""#FFFFFF""><span><img src=""http://www.ITILstudy.com/images/buttons/logo_top.jpg"" width=""285%"" height=""65%"" alt=""ITILstudy""/></span><hr></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "&first_name&" "&last_name&", <BR><BR>Greetings from www.ITILstudy.com.<BR><BR> We have updated your password to:<B> "&pass&" </B>as you had requested. Please use your UserID and Password to log into ITILstudy.com ( Login URL : www.ITILstudy.com/memberlogin.asp )<BR><BR>We hope you are enjoying your experience with www.ITILstudy.com: for queries, please email us at adminsupport@ITILstudy.com. We always look forward to your feedback and suggestions.<BR><BR>Best Regards,<br /><a href=""http://www.ITILstudy.com"">www.ITILstudy.com</a><br />Email: <a href=""mailto: adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a><br /><br /><B>Feedback from "&first_name&" "&last_name&":</B><BR>"&feedback&"<br /><br /><hr><div align=""center""><font size=""1px"">ITIL<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.<br>The Swirl logo™ is a trade mark of the Cabinet Office.</font></div> "
%>

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
<!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>