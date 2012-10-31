<html>
<head>
<TITLE>ITIL Training, ITIL  V3  Foundation Certification Courses for ITIL Exam- ITILStudy</TITLE>
<META http-equiv=Content-type content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script language="JavaScript" type="text/javascript" src="/js/tableH.js"></script>
</head>
<body>
<!--#include virtual="/includes/connection.asp"-->
<%
'Declare The Local Variables'
Dim TestNo,objRs,objRs1, Array, Array1
Dim i, j, k, l, quesno, correctans
Dim kno1,kno2,kno3,kno4,kno5,kno6,kno7
Dim kno8,kno9,kno10,kno11,kno12,kno13,kno14,kno15,kno16,kno17,kno18,kno19,bgcolor


'%>


<%
'
'	Set objRs = connObj.Execute("SELECT TestNo FROM SimITILusertable WHERE TestNo = '"&TestNo&"' AND KNo1 Is Null")
'	
'	If (Not objRs.BOF) AND (Not objRs.EOF) Then
'	
'		OverAllPercentage =correctans/19*100
		
		'Set objRs = connObj.Execute("Update SimITILusertable SET EMail = '"&Session("PayerEmail")&"', KNo1 = "&int(kno1/kno1ques*100)&", OverAll = "&OverAllPercentage&" WHERE TestNo = '"&TestNo&"'")
		

'Sending exam result email to the user

	rqUserName = Session("FirstName") &" "& Session("LastName")

	strBody = "<table width=""80%"" border=""0"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;"">"
	strBody = strBody & "<tr><td width=""45px"">&nbsp;</td></tr>"
	strBody = strBody & "<tr><td><table width=""600"" border=""0"" style=""border:0px solid #CCCCCC"" align=""center"" cellpadding=""4"" cellspacing=""0"" bgcolor=""#FFFFFF"">"
	strBody = strBody & "<tr><td width=""595"" bgcolor=""#FFFFFF""><span><img src=""http://www.ITILstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" /></span>" 
    strBody= strBody &"</td></tr>"
	strBody = strBody & "<tr><td colspan=""2"" width=""560px"">"
	strBody = strBody & "<table border=""0"" cellpadding=""6"" width=""560px"">"
	strBody = strBody & "<tr><td><span style=""font-family: Arial, Helvetica, sans-serif;font-size: 13px;color: #2F95D3;font-weight: bold;line-height: 18px;font-style: normal;padding-top: 5px;padding-bottom: 5px;"" >Dear "&Session("FirstName")&"&nbsp;"&Session("LastName")&",</span></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"" >You have completed the ITIL v3 Foundation Mock Test (TestNo: "&TestNo&")</font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>Here is a summary of your test results:</b> </font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"" color=""#666666"">Total Number of Questions:</font> <font face=""Arial"" size=""2"" color="""">40</font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"" color=""#666666"">Questions used for scoring:</font> <font face=""Arial"" size=""2"" color="""">40</font><br><font face=""Arial"" size=""2"" color=""#666666"">Questions Answered Correctly:</font> <font face=""Arial"" size=""2"" color="""">"&correctans&"</font><br><font face=""Arial"" size=""2"" color=""#666666"">Percentage Questions Answered Correctly:</font> <font face=""Arial"" size=""2"" color="""">"&FormatNumber(correctans/0.7,2)&" % (i.e. "&correctans&" / 70 * 100 )</font><br><br></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>% Time Taken:</b> "&Round((TimeTaken)/60,2)&" Minutes (this is only the question answering time and does not include time spent in breaks or viewing all answers).</font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">If the student scored above 65%, ""We would like to congratulate you on doing well in the Mock Exam and hope that you would do better in the actual exam with ITILstudy."" ELSE,  ""We hope that the mock exam gave you a better understanding of the actual ITIL exam and recommend you to get back to the study guides of the chapters where you struggled in this exam""</span></td></tr>"
	
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">Best Regards,<br>Customer Support<br>www.ITILstudy.com<br>Email: <a href=""mailto:adminsupport@ITILstudy.com"" target=""_blank"">adminsupport@ITILstudy.com</a></font></td></tr>"
	strBody = strBody & "</table></td></tr></table><tr><td width=""45px"">&nbsp;</td></tr></table>"

response.Write(strBody)
	Dim objCDOMail

	'Holds the CDONTS NewMail Object
	'Create the e-mail server object
	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")

	'Who the e-mail is from
	objCDOMail.From = "adminsupport@ITILstudy.com"

	'Who the e-mail is sent to
	objCDOMail.To = Session("PayerEmail")

	'Who the CC are sent to
	objCDOMail.Cc = "adminsupport@ITILstudy.com"

	'Set the subject of the e-mail
	objCDOMail.Subject = Session("FirstName") &" "& Session("LastName")&" : Exam Result ITILstudy Test Simulator "

	'Set the e-mail body format (0=HTML 1=Text)
	objCDOMail.BodyFormat = 0

	'Set the mail format (0=MIME 1=Text)
	objCDOMail.MailFormat = 0

	'Set the main body of the e-mail
	objCDOMail.Body = strBody

	'Importance of the e-mail (0=Low, 1=Normal, 2=High)
	objCDOMail.Importance = 2

	'Send the e-mail
	objCDOMail.Send

	'Close the server object
	Set objCDOMail = Nothing
	
	
		'rqUserName = Session("FirstName") &" "& Session("LastName")

	strBody1 = "<table width=""80%"" border=""0"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;"">"
	strBody1 = strBody1 & "<tr><td width=""45px"">&nbsp;</td></tr>"
	strBody1 = strBody1 & "<tr><td><table width=""600"" border=""0"" style=""border:0px solid #CCCCCC"" align=""center"" cellpadding=""4"" cellspacing=""0"" bgcolor=""#FFFFFF"">"
	strBody1 = strBody1 & "<tr><td width=""595"" bgcolor=""#FFFFFF""><span><img src=""http://www.ITILstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" /></span>" 
    strBody1= strBody1 &"</td></tr>"
	strBody1 = strBody1 & "<tr><td colspan=""2"" width=""560px"">"
	strBody1 = strBody1 & "<table border=""0"" cellpadding=""6"" width=""560px"">"
	strBody1 = strBody1 & "<tr><td><span style=""font-family: Arial, Helvetica, sans-serif;font-size: 13px;color: #2F95D3;font-weight: bold;line-height: 18px;font-style: normal;padding-top: 5px;padding-bottom: 5px;"" >Dear "&Session("FirstName")&"&nbsp;"&Session("LastName")&",</span></td></tr>"
	strBody1 = strBody1 & "<tr><td><font face=""Arial"" size=""2"" >Thank you for choosing ITILstudy to assist you to prepare for your ITIL exam.</font></td></tr>"
	strBody1 = strBody1 & "<tr><td><font face=""Arial"" size=""2"">Having experienced the course quality and content, we would be glad to know your comments and suggestions on the same. Please find below a feedback form through which you could help us understand your experience. Please feel free to rate us on the parameters mentioned below: - </font></td></tr>"
	
	

	strBody1 = strBody1 & "<tr><td><font face=""Arial"" size=""2""><form method=""post"" action=""http://192.168.0.105:82/ITIL/insertFeedback.asp""><input type=""hidden"" name=""Name"" value="&name&"><input type=""hidden"" name=""email"" value="&payer_email&">"
	
		strBody1 = strBody1 & "<table width=""100%"" border=""1"" style=""border:1px solid #CCCCCC"" cellspacing=""0"" cellpadding=""3"">"
	strBody1 = strBody1 & "<tr><td>Participant Name: </td><td ><input type = ""text"" value="&Session("FirstName")&"&nbsp;"&Session("LastName")&" /></td></tr><tr><td>Instructor:</td><td>ITILstudy Online CBT Training Course</td></tr><tr><td colspan=""2"">Course Dates </td></tr><tr><td>Start Date :</td><td><input type = ""text"" value="&Session("DateEntered")&" /></td></tr><tr><td>End Date :</td><td><input type = ""text"" value="&date()&" /></td></tr></tr><tr><td colspan=""2"">Location</td></tr><tr><td>city :</td><td><input type=""text"" name=""city"" id=""city"" size=""20"" /></td></tr><tr><td>Country :</td><td><input type=""text"" name=""country"" id=""country"" size=""20"" /></td></tr><tr><td colspan=""2"">Rate the following</td></tr><tr><td>Study Guides :</td><td><select name=""studyguides""> <option value=""--Select--"">--Select--</option> <option value=""1"">1</option><option value=""2"">2</option><option value=""3"">3</option><option value=""4"">4</option><option value=""5"">5</option><option value=""6"">6</option><option value=""7"">7</option<option value=""8"">8</option><option value=""9"">9</option><option value=""10"">10</option></select><br><br> (Scale 1 to 10; 10 = Best, 1 = Worst)</td></tr><tr><td >Study Methodology:</td><td><select name=""studyMethodology""><option value=""--Select--"">--Select--</option><option value=""1"">1</option><option value=""2"">2</option><option value=""3"">3</option><option value=""4"">4</option><option value=""5"">5</option><option value=""6"">6</option><option value=""7"">7</option><option value=""8"">8</option><option value=""9"">9</option> <option value=""10"">10</option></select></td></tr><tr><td >Web Interface:</td><td><select name=""webInterface""><option value=""--Select--"">--Select--</option><option value=""1"">1</option><option value=""2"">2</option><option value=""3"">3</option><option value=""4"">4</option><option value=""5"">5</option> <option value=""6"">6</option><option value=""7"">7</option><option value=""8"">8</option><option value=""9"">9</option><option value=""10"">10</option></select></td></tr><tr><td >Chapter Tests</td><td><select name=""chapterTests""><option value=""--Select--"">--Select--</option><option value=""1"">1</option><option value=""2"">2</option><option value=""3"">3</option><option value=""4"">4</option><option value=""5"">5</option><option value=""6"">6</option><option value=""7"">7</option><option value=""8"">8</option><option value=""9"">9</option><option value=""10"">10</option></select></td></tr><tr><td >Mock Test:</td><td><select name=""MockTest""><option value=""--Select--"">--Select--</option><option value=""1"">1</option><option value=""2"">2</option><option value=""3"">3</option><option value=""4"">4</option><option value=""5"">5</option><option value=""6"">6</option><option value=""7"">7</option><option value=""8"">8</option><option value=""9"">9</option><option value=""10"">10</option></select></td></tr><tr><td>What did you like about the Course:</td><td><textarea name=""course"" rows=""5"" cols=""20""></textarea></td></tr><tr><td>Improvement Opportunity:</td><td><textarea name=""Improvement"" rows=""5"" cols=""20""></textarea></td></tr><tr><td>Any other comments:</td><td><textarea name=""comments"" rows=""5"" cols=""20""></textarea></td></tr><tr><td colspan=""2"" align=""center"" ><input type=""Submit"" name=""type"" value=""Submit"" /> </td></tr></table></form></td></tr>"
	
	strBody1 = strBody1 & "<tr><td><font face=""Arial"" size=""2"">We appreciate your time spent on writing to us.</span></td></tr>"

	strBody1 = strBody1 & "<tr><td><font face=""Arial"" size=""2"">Best Regards,<br>Customer Support<br>www.ITILstudy.com<br>A brand of Edusys Services Pvt. Limited<br>Email: <a href=""mailto:adminsupport@ITILstudy.com"" target=""_blank"">adminsupport@ITILstudy.com</a></font></td></tr>"
	strBody1 = strBody1 & "</table></td></tr></table><tr><td width=""45px"">&nbsp;</td></tr></table>"


response.Write(strBody1)
	
	'Dim objCDOMail

	'Holds the CDONTS NewMail Object
	'Create the e-mail server object
	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")

	'Who the e-mail is from
	objCDOMail.From = "adminsupport@ITILstudy.com"

	'Who the e-mail is sent to
	objCDOMail.To = Session("PayerEmail")

	'Who the CC are sent to
	objCDOMail.Cc = "adminsupport@ITILstudy.com"

	'Set the subject of the e-mail
	objCDOMail.Subject = "ITILstudy: Feedback requested on the ITIL online course "

	'Set the e-mail body format (0=HTML 1=Text)
	objCDOMail.BodyFormat = 0

	'Set the mail format (0=MIME 1=Text)
	objCDOMail.MailFormat = 0

	'Set the main body of the e-mail
	objCDOMail.Body = strBody1

	'Importance of the e-mail (0=Low, 1=Normal, 2=High)
	objCDOMail.Importance = 2

	'Send the e-mail
	objCDOMail.Send

	'Close the server object
	Set objCDOMail = Nothing
	
	
	

'End If

'Set objRs = Nothing
'connObj.Close
'Set connObj = Nothing
%>

</font>

<script type="text/javascript" src="/js/refer_validation.js"></script>
</body>
</html>