<html>
<head>
<TITLE>ITILstudy</TITLE>

</head>
<body>
<!--#include virtual="/includes/connection.asp"-->
<%

'Declare The Variables'
Dim Conn, Array,KNo, QuesNo, Ans, ID, ITILstudy, payer_email, MailID, subject, body

'Retrive the selected  name'

If Request.QueryString("scheduledate") <> "" Then
	rqdate = Request.QueryString("scheduledate")
Else
	rqdate = Request.Form("scheduledate")
End IF

If Request.QueryString("distance") <> "" Then
	rqDistance = Request.QueryString("distance")
Else
	rqDistance = Request.Form("distance")	
End If

If Request.Form("instemailid1") <> "" Then
rqemailid =Request.Form("instemailid1")
ElseIf Request.Form("instemailid2") <> "" Then
rqemailid =Request.Form("instemailid2")
End If

If Request.QueryString("instemailid1") <> "" Then
rqemailid =Request.QueryString("instemailid1")
ElseIf Request.QueryString("instemailid2") <> "" Then
rqemailid =Request.QueryString("instemailid2")
End If

'Create the recordobjects'
Set objRsInst = Server.CreateObject("ADODB.Recordset")

strInstructors = "SELECT firstname, lastname, designation, emailid1, comp_name, emailid2 FROM ITIL_instructor WHERE (emailid1 = '"&rqemailid&"' OR emailid2 = '"&rqemailid&"') AND (country = '"&Session("CRM_Country") &"')"
objRsInst.Open strInstructors, ConnObj

Do Until objRsInst.EOF

firstname = objRsInst("firstname")
lastname = objRsInst("lastname")
rqcomp_name = objRsInst("comp_name")
designation = objRsInst("designation")

objRsInst.Movenext
 Loop
objRsInst.Close 
ConnObj.Close

subject="Accepted: Service agreement for the "&rqdate

body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.ITILstudy.com/images/banners/email-header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2><div align=""center""><b>DUTIES, TERM, AND COMPENSATION</b></div><br><br>DUTIES:	The Company hereby engages the Service Provider to teach the training program class specified below.  The Service Provider shall render its best service, information, knowledge, judgment to the Company with respect to conducting classes, resolving students’ queries, etc.<BR><BR>LOCATION: "&rqdate&" <BR><BR>SUPPLEMENTAL REPRESENTATION & WARRANTY:  In order to assist Company in ensuring that no intellectual property or other rights of another organization in the same line of business will be used in this engagement, Service Provider and the individual signing below represent and warrant that they have not worked for a competitor of Company teaching project management classes at any time since they signed the original Service Provider Agreement.<BR><BR>COMPENSATION:  In consideration of the services rendered pursuant to this Agreement, Company shall pay Service Provider a fee as indicated in the table below.<BR><BR>"

'Giving the conditons for Distance selected'
If (rqDistance = "1-60 miles" OR rqDistance = "1-60-miles") Then

body = body & "<table width=""70%"" border=""1"" cellpadding=""2"" cellspacing=""0""><tr><td><font face=""Arial"" size=2><b>Number of students</b></font></td><td><font face=""Arial"" size=2><b>Faculty Fee</b></font></td></tr><tr><td><font face=""Arial"" size=2>2</font></td><td><font face=""Arial"" size=2>$ 1,500</font></td></tr><tr><td><font face=""Arial"" size=2>3-6</font></td><td><font face=""Arial"" size=2>$2,500 </font></td></tr><tr><td><font face=""Arial"" size=2>7-12</font></td><td><font face=""Arial"" size=2>$ 3,000</font></td></tr><tr><td><font face=""Arial"" size=2>13 – 18 </font></td><td><font face=""Arial"" size=2>$ 3,400 </font></td></tr><tr><td><font face=""Arial"" size=2>More than18 </font></td><td><font face=""Arial"" size=2>$ 3,700</font> </td></tr></table>"

ElseIf (rqDistance = "61-200 miles" OR rqDistance = "61-200-miles-(2-students)" OR rqDistance = "61-200-miles")Then

body = body & "<table width=""70%"" border=""1"" cellpadding=""2"" cellspacing=""0""><tr><td><font face=""Arial"" size=2><b>Number of students</b></font></td><td><font face=""Arial"" size=2><b>Faculty Fee</b></font></td></tr><tr><td><font face=""Arial"" size=2>2</font></td><td><font face=""Arial"" size=2> $ 1,800</font></td></tr><tr><td><font face=""Arial"" size=2>3-6</font></td><td><font face=""Arial"" size=2>$2,900 </font></td></tr><tr><td><font face=""Arial"" size=2>7-12</font></td><td><font face=""Arial"" size=2>$ 3,400</font></td></tr><tr><td><font face=""Arial"" size=2>13 – 18 </font></td><td><font face=""Arial"" size=2>$ 3,800 </font></td></tr><tr><td><font face=""Arial"" size=2>More than18 </font></td><td><font face=""Arial"" size=2>$ 4,100 </font></td></tr></table>"

'ElseIf (rqDistance = "61-200 miles" OR rqDistance = "61-200-miles") Then

'body = body & "<table width=""70%"" border=""1"" cellpadding=""2"" cellspacing=""0""><tr><td><font face=""Arial"" size=2><b>Number of students</b></font></td><td><font face=""Arial"" size=2><b>Faculty Fee</b></font></td></tr><tr><td><font face=""Arial"" size=2>3-6</font></td><td><font face=""Arial"" size=2>$ 3,500 </font></td></tr><tr><td><font face=""Arial"" size=2>7-12</font></td><td><font face=""Arial"" size=2>$ 4,100 </font></td></tr><tr><td><font face=""Arial"" size=2>13 – 18 </font></td><td><font face=""Arial"" size=2>$ 4,600 </font></td></tr><tr><td><font face=""Arial"" size=2>More than18 </font></td><td><font face=""Arial"" size=2>$ 5,000 </font></td></tr></table>"

'ElseIf (rqDistance = "More than 200 miles" OR rqDistance = "More-than-200-miles") Then

'body = body & "<table width=""70%"" border=""1"" cellpadding=""2"" cellspacing=""0""><tr><td><font face=""Arial"" size=2><b>Number of students</b></font></td><td><font face=""Arial"" size=2><b>Faculty Fee</b></font></td></tr><tr><td><font face=""Arial"" size=2>3-6</font></td><td><font face=""Arial"" size=2>$ 4,000  </font></td></tr><tr><td><font face=""Arial"" size=2>7-12</font></td><td><font face=""Arial"" size=2> $ 4,600  </font></td></tr><tr><td><font face=""Arial"" size=2>13 – 18 </font></td><td><font face=""Arial"" size=2>$ 5,100  <font></td></tr><tr><td><font face=""Arial"" size=2>More than18 </font></td><td><font face=""Arial"" size=2>$ 5,500  </font></td></tr></table>"

ElseIf (rqDistance = "More than 200 miles" OR rqDistance = "More-than-200-miles-(2-students)" OR rqDistance = "More-than-200-miles") Then

body = body & "<table width=""70%"" border=""1"" cellpadding=""2"" cellspacing=""0""><tr><td><font face=""Arial"" size=2><b>Number of students</b></font></td><td><font face=""Arial"" size=2><b>Faculty Fee</b></font></td></tr><tr><td><font face=""Arial"" size=2>2</font></td><td><font face=""Arial"" size=2>$ 2,000</font></td></tr><tr><td><font face=""Arial"" size=2>3-6</font></td><td><font face=""Arial"" size=2>$ 3,200 </font></td></tr><tr><td><font face=""Arial"" size=2>7-12</font></td><td><font face=""Arial"" size=2>$ 3,800</font></td></tr><tr><td><font face=""Arial"" size=2>13 – 18 </font></td><td><font face=""Arial"" size=2>$ 4,200</font></td></tr><tr><td><font face=""Arial"" size=2>More than18 </font></td><td><font face=""Arial"" size=2>$ 4,500</font> </td></tr></table>"

End If

body = body & "<BR><BR>Company will also pay marketing bonus to the Service Providers who were responsible for marketing the course at the rate of $ 75 per student in an open class and $ 100 for each corporate class student.  Company shall pay Service Provider no later than the 5th day of the calendar month after the training has concluded.  Service Provider agrees that the above represents the total compensation that Service Provider will receive under this Agreement, unless this Agreement modified in a writing that expressly states that it is a mutually agreed upon modification of this Agreement.<BR><BR>SO AGREED:<BR><BR>Service Provider: "&rqcomp_name&" <BR><BR>The undersigned individual joins in all representations, warranties, covenants and other terms and conditions made by Service Provider in the Agreement, agrees to perform the services provided for in this Attachment A in accordance with the terms hereof, and will look solely to Service Provider for any and all compensation hereunder.<BR><BR>"

body = body & "<table border=""0"" align =""center""><tr><td><font face=""Arial"" size=3>I Agree</font></td></tr></table><br><table border=""0"" width=""100%""><tr><td><div align=""left""><font face=""Arial"" size=2>"&firstname&" "&lastname&"<br>"&designation&"</font></div></td><td valign=""top""><div align=""right""><font face=""Arial"" size=2>Date: "& FormatDateTime(date(),1)&"</font></div></td></tr></table>"

body = body & "</font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"

Response.Write(body)

Dim objCDOMail     
'Holds the CDONTS NewMail Object
'Create the e-mail server object
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'Who the e-mail is from
objCDOMail.From = rqemailid
'Who the e-mail is sent to
objCDOMail.To = "marketing@ITILstudy.com"
'Who the blind copies are sent to
objCDOMail.Cc = rqemailid
'Who the blind copies are sent to
'objCDOMail.Bcc = "t_satpathy@yahoo.com" 
'objCDOMail.Bcc = "edusysbharath@gmail.com" 
'Set the subject of the e-mail
objCDOMail.Subject = subject
'Set the e-mail body format (0=HTML 1=Text)
objCDOMail.BodyFormat = 0
'Set the mail format (0=MIME 1=Text)
objCDOMail.MailFormat = 0
'Set the main body of the e-mail
objCDOMail.Body = body
'Importance of the e-mail (0=Low, 1=Normal, 2=High)
objCDOMail.Importance = 2
'Send the e-mail
objCDOMail.Send
'Close the server object'
Set objCDOMail = Nothing

Response.Write "Thank you for your confirmation"
%>
</body>
</html>
