<html>
<head>
<TITLE>ITILstudy.com </TITLE>

</head>
<body>
<!--#include virtual="/includes/connection.asp"-->
<%

Dim Conn, Array, KNo, QuesNo, Ans, payer_email, MailID, subject, body, first_name, last_name, feedback

payer_email=Request.Form("payer_email")
pass="pyramids"
first_name=Request.Form("first_name")
last_name=Request.Form("last_name")
payer_email=Request.Form("payer_email")
MailID=Request.Form("MailID")
feedback=Request.Form("feedback")
body=Request.Form("body")
subject=Request.Form("subject")
submitvalue=Request.Form("submitvalue")
attachvalue=Request.Form("attachvalue")
companyref=Request.Form("companyref")
company=Request.Form("company")
country = request.Form("country")

%><%=attachvalue%>
<%
If(Submitvalue="Initialize") Then

			
				body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""10px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td  bgcolor=""#FFFFFF"">" 
						Select Case country
						Case 1
						body= body & "<span><img src=""http://www.ITILstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" /></span>" 
						Case 2
						body= body &"<span><img src=""http://www.ITILstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" /></span>"
						Case 3
						body= body &"<span><img src=""http://www.ITILstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" /></span>"
						End select
						body= body &"</td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "&first_name&" "&last_name&",<BR><BR>Congratulations from <a href=""http://www.ITILstudy.com/"" target=""_blank"">ITILstudy.com!</a><BR><BR>"
				
				regards = "<br /><br />Best Regards,<br />Customer Support<br><a href=""http://www.ITILstudy.com"" target=""_blank"">www.ITILstudy.com</a><br />Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a><br /><br/><hr><div align=""center"">><font size=""1px"">ITIL<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.<br>The Swirl logo™ is a trade mark of the Cabinet Office.</font></div><br />"
				
				If payer_email <> "" Then
				ques = "<b>Feedback from "&first_name&" "&last_name&":</b><BR><BR>"&feedback
				End If
				
			
					rqUserName = first_name &" "& last_name
						subject="ITILstudy ITIL Exam Result"
	                    body=body & "We are pleased to inform that you have passed the Foundation and Practitioner exam conducted on 13th March and 15th March, 2011 respectively.<br><br>Your ITIL<sup>&reg;</sup> Practitioner certificate is under process and you would be informed as soon as it is shipped to you.<br><br>As per our records, your mailing address is : --------<br><br>Kindly confirm your mailing address and contact number so that we could ship you the certificates.<br><br>We hope you enjoyed your experience with ITILstudy.com. If you liked our course structure and methodology, you can refer your friends for ITILstudy ITIL classroom courses.<br><brClick on the button to ""Refer Friend"".<br><br><form name=""referFriend"" action=""http://www.ITILstudy.com/insertReferFrnd.asp""  method=""post""><input type=""hidden"" name=""refEmailID"" value="&payer_email&"><input type=""hidden"" name=""refName"" value="&rqUserName&">Friend`s Email:  <input type=""text"" name=""frndEmailID1"">&nbsp; &nbsp; Name(optional):  <input type=""text"" name=""frndName1""><br /><br>  Friend`s Email:  <input type=""text"" name=""frndEmailID2"">  &nbsp; &nbsp; Name(optional):  <input type=""text"" name=""frndName2"">  <br /><br>  Friend`s Email:  <input type=""text"" name=""frndEmailID3""> &nbsp; &nbsp;  Name(optional):  <input type=""text"" name=""frndName3""><br /><br /><div align=""center""><input type=""submit"" value=""Refer Friend"" /></div></form><br><br>If you have any queries contact us at adminsupport@itilstudy.com or +91 80 41557547."&regards

 
				
				body = body & "</font></td></tr></table></td></tr></table></td></tr><tr><td width=""45px"">&nbsp;</td></tr></table>"
				
				
				
				%>

<form name="one" action="./adminexamresult.asp" method="post">
<B>View and Send Email / Preview Again:<BR><BR></B>
Email Subject<BR>:<input type="text" size="150" name="subject" value="<%=subject%>"><BR><BR>

<input type="hidden" size="50" name="payer_email" value="<%=payer_email%>">
<input type="hidden" size="30" name="first_name" value="<%=first_name%>">
<input type="hidden" size="30" name="last_name" value="<%=last_name%>">
<input type="hidden" size="100" name="attachvalue" value="<%=attachvalue%>">
<input type="hidden" size="50" name="country" value="<%=country%>">
Email Body:<BR><textarea name="body" rows="30" cols="100"><%=body%></textarea><BR><BR>
<input type="Submit" Name="submitvalue" Value="SendNow"><BR>


<input type="Submit" Name="submitvalue" Value="PreviewAgain"></form><BR><BR>

Email as it would look when it is sent<BR><BR>
<B>Subject:</b><BR>
<%=subject%><BR><BR>
<B>Body:</B><BR>
<%=body%>

<%
Else If(Submitvalue="SendNow") Then
Dim objCDOMail
'Holds the CDONTS NewMail Object
'Create the e-mail server object
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'Who the e-mail is from
objCDOMail.From = "adminsupport@itilstudy.com"
'Who the e-mail is sent to
objCDOMail.To = ""&payer_email&""
'Who the blind copies are sent to
objCDOMail.Bcc = "adminsupport@itilstudy.com"
'Set the subject of the e-mail
objCDOMail.Subject = ""&subject&""
'Set the e-mail body format (0=HTML 1=Text)
objCDOMail.BodyFormat = 0
'Set the mail format (0=MIME 1=Text)
objCDOMail.MailFormat = 0
'Set the main body of the e-mail
objCDOMail.Body = ""&body&""
'Attach docs
%><%'=attachvalue%><%
'objCDOMail.AttachFile("C:\temp\6sigmacertificate_Ramachandran_Sriram.ppt")
'Importance of the e-mail (0=Low, 1=Normal, 2=High)
objCDOMail.Importance = 2
'Send the e-mail
objCDOMail.Send
'Close the server object
Set objCDOMail = Nothing
Response.Write "Your Email - "&subject&" - has been sent"
' response.Write(body)
UserID=Session("UserID")

  
Else If(Submitvalue="PreviewAgain") Then
%>
<form name="one" action="./adminexamresult.asp" method="post">
<B>View and Send Email / Review Again:<BR><BR></B>
Email Subject<BR>:<input type="text" size="150" name="subject" value="<%=subject%>"><BR><BR>
<input type="hidden" size="50" name="payer_email" value="<%=payer_email%>">
<input type="hidden" size="30" name="first_name" value="<%=first_name%>">
<input type="hidden" size="30" name="last_name" value="<%=last_name%>">
<input type="hidden" size="100" name="attachvalue" value="<%=attachvalue%>">
<input type="hidden" size="50" name="country" value="<%=country%>">
Email Body:<BR><textarea name="body" rows="30" cols="100"><%=body%></textarea><BR><BR>

<input type="Submit" Name="submitvalue" Value="SendNow"><BR>


<input type="Submit" Name="submitvalue" Value="PreviewAgain"></form><BR><BR>

Email as it would look when it is sent<BR><BR>
<B>Subject:</b><BR>
<%=subject%><BR><BR>
<B>Body:</B><BR>
<%=body%>
	<%End If
End If
End If

%>

<!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>