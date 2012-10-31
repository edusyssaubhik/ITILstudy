<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
	If Session("USBUserId") = "" Then 
		Response.Redirect("login.asp")
	Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
'Written By : Bharath'
'Last UpDated : 18/08/2009'
'Description :'
'This page is adding logistics to the database page'
'This page is comes from logistics.asp page'
'======================================================='

'Declare The Variables'
Dim rqType
Dim rqWorkbook, rqProcessChart, rqCertFolder
Dim rqBlankProcessSheet, rqPmpChapTest
Dim rqPmpFinalTest, rqPmpCert
Dim rqCapmChapTest, rqCapmFinalTest, rqCapmCert
Dim rqPens, rqYellow, rqGreen, rqPink, rqPencil
Dim rqPenHolder, rqCalculator, rqBckPack, rqCap, rqSressBall
Dim rqPostIt, rqVisCards, rqTriFold, rqOnePageFlyer
Dim objRs, rqShipping_ID, strGifts,rqguidelinePMP
Dim rqday3Test,rqday4Eval,rqfeedbackForm


Set objRs = Server.CreateObject("ADODB.Recordset")

'Retriving the values through form'

rqType = Request.Form("type")

'Faculty add/edit the study material from logistics.asp page that will come here'
If rqType = "Add/Edit Study Material" Then

	rqWorkbook  =  Request.Form("workbook")
	rqProcessChart  =  Request.Form("processChart")
	rqCertFolder  =  Request.Form("certfolder")
	rqBlankProcessSheet  =  Request.Form("blankProcessSheet")
	rqPmpChapTest  =  Request.Form("pmpChapTest")
	rqPmpFinalTest  =  Request.Form("pmpFinalTest")
	rqPmpCert  =  Request.Form("pmpCert")
	rqCapmChapTest  =  Request.Form("capmChapTest")
	rqCapmFinalTest  =  Request.Form("capmFinalTest")
	rqCapmCert  =  Request.Form("capmCert")
	rqday3Test  =  Request.Form("day3Test")
	rqday4Eval  =  Request.Form("day4Eval")
	rqguidelinePMP  =  Request.Form("guidelinePMP")
	rqfeedbackForm  =  Request.Form("feedbackForm")
	

    connObj.Execute "INSERT INTO ps_studymaterial (workbook, processchart, certfolder, blankprocesssheet, pmp_chaptertest, pmp_finaltest, pmp_certificate, capm_chaptertest, capm_finaltest, capm_certificate, added_by, added_date, day3_test, day4_eval, guidelinePMP, feedbackForm) VALUES ('"& rqWorkbook &"','"& rqProcessChart &"','"& rqCertFolder &"','"& rqBlankProcessSheet &"','"& rqPmpChapTest &"','"& rqPmpFinalTest &"','"& rqPmpCert &"','"& rqCapmChapTest &"','"& rqCapmFinalTest &"','"& rqCapmCert &"','"& Session("USBUserId") &"','"& Now() &"', '"& rqday3Test &"','"& rqday4Eval &"','"& rqguidelinePMP &"','"& rqfeedbackForm &"')"
	
	body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.pmstudy.com/images/banners/email_header.jpg"" alt=""PMstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Hi,<br><br>"&Session("FirstName")&" "&Session("LastName")&" has updated Study Material on "&Now()&".<BR><BR><table width=""60%"" border=""1"" cellspacing=""0"" cellpadding=""5""><tr><td><font face=""Arial"" size=2><b>Study material</b></font></td><td><font face=""Arial"" size=2><b>Quantity</b></font></td></tr><tr><td><font face=""Arial"" size=2>Workbook</font></td><td><font face=""Arial"" size=2>"& rqWorkbook &"</font></td></tr><tr><td><font face=""Arial"" size=2>Process Chart </font></td><td><font face=""Arial"" size=2>"& rqProcessChart &"</font></td></tr><tr><td><font face=""Arial"" size=2>Certificate Folder</font></td><td><font face=""Arial"" size=2>"& rqCertFolder &"</font></td></tr><tr><td><font face=""Arial"" size=2>Blank Process Sheet</font></td><td><font face=""Arial"" size=2>"& rqBlankProcessSheet &"</font></td></tr><tr><td><font face=""Arial"" size=2>PMP Chapter Test</font></td><td><font face=""Arial"" size=2>"& rqPmpChapTest &"</font></td></tr><tr><td><font face=""Arial"" size=2>PMP Final Test</font></td><td><font face=""Arial"" size=2>"& rqPmpFinalTest &"</font></td></tr><tr><td><font face=""Arial"" size=2>PMP Certificate</font> </td><td><font face=""Arial"" size=2>"& rqPmpCert &"</font></td></tr><tr><td><font face=""Arial"" size=2>CAPM Chapter Test</font></td><td><font face=""Arial"" size=2>"& rqCapmChapTest &"</font></td></tr><tr><td><font face=""Arial"" size=2>CAPM Final Test</font> </td><td><font face=""Arial"" size=2>"& rqCapmFinalTest &"</font></td></tr><tr><td><font face=""Arial"" size=2>CAPM Certificate</font></td><td><font face=""Arial"" size=2>"& rqCapmCert &"</font></td></tr><tr><td><font face=""Arial"" size=2>Day 3 Testbook </font></td><td><font face=""Arial"" size=2>"& rqday3Test &"</font></td></tr><tr><td><font face=""Arial"" size=2>Day 4 Evaluation Test</font></td><td><font face=""Arial"" size=2>"& rqday4Eval &"</font></td></tr><tr><td><font face=""Arial"" size=2>Guidelines for PMP exam </font></td><td><font face=""Arial"" size=2>"& rqguidelinePMP &"</font></td></tr><tr><td><font face=""Arial"" size=2>Feedback forms</font></td><td><font face=""Arial"" size=2>"& rqfeedbackForm &"</font></td></tr></table><br><br>Best Regards,<br>Customer Support <BR>www.PMstudy.com</font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"

'Response.Write(body)
strName = Session("FirstName")&" "&Session("LastName")

'Holds the CDONTS NewMail Object
'Create the e-mail server object
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'Who the e-mail is from
objCDOMail.From = "vmedulogistics@gmail.com"
'Who the e-mail is sent to
objCDOMail.To = "vmedulogistics@gmail.com"
'Set the subject of the e-mail
objCDOMail.Subject = strName & " has updated Study Material on " & Now()
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

	Response.Redirect("logistics.asp")

'Faculty add/edit the gifts from logistics.asp page that will come here'
ElseIf rqType = "Add/Edit Gifts" Then

	rqPens  =  Request.Form("pens")
	rqYellow  =  Request.Form("yellow")
	rqGreen  =  Request.Form("green")
	rqPink  =  Request.Form("pink")
	rqPencil  =  Request.Form("pencil")
	rqPenHolder  =  Request.Form("penHolder")
	rqCalculator  =  Request.Form("calculator")
	rqBckPack  =  Request.Form("backpack")
	rqCap  =  Request.Form("cap")
	rqSressBall  =  Request.Form("sressball")
	rqPostIt    =  Request.Form("postit")

	
	ConnObj.Execute "INSERT INTO ps_gifts (pen, highlighter_yellow, highlighter_green, highlighter_pink, pencil, pen_holder, calculator, backpack, cap, stressball, added_by, added_date, postit_notes) VALUES ('"& rqPens &"','"& rqYellow &"','"& rqGreen &"','"& rqPink &"','"& rqPencil &"','"& rqPenHolder &"','"& rqCalculator &"','"& rqBckPack &"','"& rqCap &"','"& rqSressBall &"','"&Session("USBUserId") &"','"& Now() &"','"& rqPostIt &"')"

body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.pmstudy.com/images/banners/email_header.jpg"" alt=""PMstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Hi,<br><br>"&Session("FirstName")&" "&Session("LastName")&" has updated Gifts on "&Now()&".<BR><BR><table width=""60%"" border=""1"" cellspacing=""0"" cellpadding=""5""><tr><td><font face=""Arial"" size=2><b>Gifts</b></font></td><td><font face=""Arial"" size=2><b>Quantity</b></font></td></tr><tr><td><font face=""Arial"" size=2>4 in 1 Pens</font></td><td><font face=""Arial"" size=2>"& rqPens &"</font></td></tr><tr><td><font face=""Arial"" size=2>Highlighter Neon Yellow </font></td><td><font face=""Arial"" size=2>"& rqYellow &"</font></td></tr><tr><td><font face=""Arial"" size=2>Highlighter Neon Green</font></td><td><font face=""Arial"" size=2>"& rqGreen &"</font></td></tr><tr><td><font face=""Arial"" size=2>Highlighter Neon Pink</font></td><td><font face=""Arial"" size=2>"& rqPink &"</font></td></tr><tr><td><font face=""Arial"" size=2>Pencil - Z- Grip</font></td><td><font face=""Arial"" size=2>"& rqPencil &"</font></td></tr><tr><td><font face=""Arial"" size=2>Quick point Pen Holder</font></td><td><font face=""Arial"" size=2>"& rqPenHolder &"</font></td></tr><tr><td><font face=""Arial"" size=2>Robot Series Calculator</font> </td><td><font face=""Arial"" size=2>"& rqCalculator &"</font></td></tr><tr><td><font face=""Arial"" size=2>Backpack Travel</font></td><td><font face=""Arial"" size=2>"& rqBckPack &"</font></td></tr><tr><td><font face=""Arial"" size=2>Cap</font> </td><td><font face=""Arial"" size=2>"& rqCap &"</font></td></tr><tr><td><font face=""Arial"" size=2>Stress Ball </font></td><td><font face=""Arial"" size=2>"& rqSressBall &"</font></td></tr><tr><td><font face=""Arial"" size=2>Post It Notes </font> </td><td><font face=""Arial"" size=2>"& rqPostIt &"</font></td></tr></table><br><br>Best Regards,<br>Customer Support <BR>www.PMstudy.com</font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"
strName = Session("FirstName")&" "&Session("LastName")

'Holds the CDONTS NewMail Object
'Create the e-mail server object
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'Who the e-mail is from
objCDOMail.From = "vmedulogistics@gmail.com"
'Who the e-mail is sent to
objCDOMail.To = "vmedulogistics@gmail.com"
'Set the subject of the e-mail
objCDOMail.Subject = strName & " has updated Gifts on " & Now()
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

	Response.Redirect("logistics.asp")

'Faculty add/edit the Miscellaneous from logistics.asp page that will come here'
ElseIf rqType = "Add/Edit Miscellaneous" Then

	rqVisCards = Request.Form("visCards")
	rqTriFold = Request.Form("triFold")
	rqOnePageFlyer = Request.Form("onePageFlyer")

	
	ConnObj.Execute "INSERT INTO ps_miscellaneous (visiting_cards, trifold, onepage_flyer, added_by, added_date) VALUES ('"& rqVisCards &"','"& rqTriFold &"','"& rqOnePageFlyer &"','"&Session("USBUserId") &"','"& Now() &"')"

body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.pmstudy.com/images/banners/email_header.jpg"" alt=""PMstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Hi,<br><br>"&Session("FirstName")&" "&Session("LastName")&" has updated Miscellaneous on "&Now()&".<BR><BR><table width=""60%"" border=""1"" cellspacing=""0"" cellpadding=""5""><tr><td><font face=""Arial"" size=2><b>Study material</b></font></td><td><font face=""Arial"" size=2><b>Quantity</b></font></td></tr><tr><td><font face=""Arial"" size=2>Visiting Cards</font></td><td><font face=""Arial"" size=2>"& rqVisCards &"</font></td></tr><tr><td><font face=""Arial"" size=2>Trifold Brochure </font></td><td><font face=""Arial"" size=2>"& rqTriFold &"</font></td></tr><tr><td><font face=""Arial"" size=2>Onepage Flyer</font></td><td><font face=""Arial"" size=2>"& rqOnePageFlyer &"</font></td></tr></table><br><br>Best Regards,<br>Customer Support <BR>www.PMstudy.com</font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"
strName = Session("FirstName")&" "&Session("LastName")

    
'Holds the CDONTS NewMail Object
'Create the e-mail server object
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'Who the e-mail is from
objCDOMail.From = "vmedulogistics@gmail.com"
'Who the e-mail is sent to
objCDOMail.To = "vmedulogistics@gmail.com"
'Set the subject of the e-mail
objCDOMail.Subject = strName & " has updated Miscellaneous on " & Now()
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

	Response.Redirect("logistics.asp")

'Faculty confirm the gifts received through courier'
ElseIf rqType = "Confirm/Update" Then

rqShipping_ID = Request.Form("shipping_id") 

ConnObj.Execute("UPDATE faculty_shipping_gifts SET Gifts_Status = '1' WHERE shipping_id = '"& rqShipping_ID &"'")

strGifts = "SELECT top 1 *  FROM ps_gifts WHERE added_by = '"& Session("USBUserId") &"' ORDER BY id desc"

objRs.Open strGifts, ConnObj

Do Until objRs.EOF

Pens = objRs("pen")
HighNeon_Yellow = objRs("highlighter_yellow")
HighNeon_Green  = objRs("highlighter_green")
Pencil = objRs("pencil")
PenHolder = objRs("pen_holder")
Calculator = objRs("calculator")
BckPack = objRs("backpack")
Cap = objRs("cap")
SressBall = objRs("stressball")
PostIt = objRs("postit_notes")


objRs.Movenext
Loop
objRs.Close

'Updating the gifts'
rqPens  =  Request.Form("pens") + Int(Pens)
rqYellow  =  Request.Form("high_yellow") + Int(HighNeon_Yellow)
rqGreen  =  Request.Form("high_green") + Int(HighNeon_Green)
rqPencil  =  Request.Form("pencil") + Int(Pencil)
rqPenHolder  =  Request.Form("penholder") + Int(PenHolder)
rqCalculator  =  Request.Form("calculator") + Int(Calculator)
rqBckPack  =  Request.Form("backpack") + Int(BckPack)
rqCap  =  Request.Form("cap") + Int(Cap)
rqSressBall  =  Request.Form("stressball") + Int(SressBall)
rqPostIt    =  Request.Form("postit") + Int(PostIt)

'Updating the gifts (previous gifts + shipment gifts)'
'ConnObj.Execute "INSERT INTO ps_gifts (pen, highlighter_yellow, highlighter_green, pencil, pen_holder, calculator, backpack, cap, stressball, added_by, added_date, postit_notes) VALUES ('"& rqPens &"','"& rqYellow &"','"& rqGreen &"','"& rqPencil &"','"& rqPenHolder &"','"& rqCalculator &"','"& rqBckPack &"','"& rqCap &"','"& rqSressBall &"','"&Session("USBUserId") &"','"& Now() &"','"& rqPostIt &"')"

body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.pmstudy.com/images/banners/email_header.jpg"" alt=""PMstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "&Session("FirstName")&"&nbsp;"&Session("LastName")&",<br><br>Thanks for confirming the receipt.<br><br>Below table gives overview of gifts you have<BR><BR><table width=""60%"" border=""1"" cellspacing=""0"" cellpadding=""5""><tr><td><font face=""Arial"" size=2><b>Gifts</b></font></td><td><font face=""Arial"" size=2><b>Previous Gifts</b></font></td><td><font face=""Arial"" size=2><b>Received Gifts</b></font></td><td><font face=""Arial"" size=2><b>Total Gifts</b></font></td></tr><tr><td><font face=""Arial"" size=2>4 in 1 Pens</font></td><td><font face=""Arial"" size=2>"& Pens &"</font></td><td><font face=""Arial"" size=2>"& Request.Form("pens") &"</font></td><td><font face=""Arial"" size=2>"& rqPens &"</font></td></tr><tr><td><font face=""Arial"" size=2>Highlighter Neon Yellow</font></td><td><font face=""Arial"" size=2>"& HighNeon_Yellow &"</font></td><td><font face=""Arial"" size=2>"& Request.Form("high_yellow") &"</font></td><td><font face=""Arial"" size=2>"& rqYellow &"</font></td></tr><tr><td><font face=""Arial"" size=2>Highlighter Neon Green</font></td><td><font face=""Arial"" size=2>"& HighNeon_Green &"</font></td><td><font face=""Arial"" size=2>"& Request.Form("high_green") &"</font></td><td><font face=""Arial"" size=2>"& rqGreen &"</font></td></tr><tr><td><font face=""Arial"" size=2>Pencil - Z- Grip</font></td><td><font face=""Arial"" size=2>"& Pencil &"</font></td><td><font face=""Arial"" size=2>"& Request.Form("pencil") &"</font></td><td><font face=""Arial"" size=2>"& rqPencil &"</font></td></tr><tr><td><font face=""Arial"" size=2>Quick point Pen Holder</font></td><td><font face=""Arial"" size=2>"& PenHolder &"</font></td><td><font face=""Arial"" size=2>"& Request.Form("penholder") &"</font></td><td><font face=""Arial"" size=2>"& rqPenHolder &"</font></td></tr><tr><td><font face=""Arial"" size=2>Robot Series Calculator</font></td><td><font face=""Arial"" size=2>"& Calculator &"</font></td><td><font face=""Arial"" size=2>"& Request.Form("calculator") &"</font></td><td><font face=""Arial"" size=2>"& rqCalculator &"</font></td></tr><tr><td><font face=""Arial"" size=2>Backpack Travel</font> </td><td><font face=""Arial"" size=2>"& BckPack &"</font></td><td><font face=""Arial"" size=2>"& Request.Form("backpack") &"</font></td><td><font face=""Arial"" size=2>"& rqBckPack &"</font></td></tr><tr><td><font face=""Arial"" size=2>Cap</font></td><td><font face=""Arial"" size=2>"& Cap &"</font></td><td><font face=""Arial"" size=2>"& Request.Form("cap") &"</font></td><td><font face=""Arial"" size=2>"& rqCap &"</font></td></tr><tr><td><font face=""Arial"" size=2>Stress Ball</font> </td><td><font face=""Arial"" size=2>"& SressBall &"</font></td><td><font face=""Arial"" size=2>"& Request.Form("stressball") &"</font></td><td><font face=""Arial"" size=2>"& rqSressBall &"</font></td></tr><tr><td><font face=""Arial"" size=2>Post It Notes</font></td><td><font face=""Arial"" size=2>"& PostIt &"</font></td><td><font face=""Arial"" size=2>"& Request.Form("postit") &"</font></td><td><font face=""Arial"" size=2>"& rqPostIt &"</font></td></tr></table><br>Please enter manually in the backoffice system, if any change is needed in the above table.<br><br>Best Regards,<br>Customer Support <BR>www.PMstudy.com</font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"

strName = Session("FirstName")&" "&Session("LastName")

'Dim objCDOMail     
'Holds the CDONTS NewMail Object
'Create the e-mail server object
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'Who the e-mail is from
objCDOMail.From = "vmedulogistics@gmail.com"
'Who the e-mail is sent to
objCDOMail.To = Session("USBUserId")
'Who the blind copies are sent to
objCDOMail.Bcc = "instructorspmstudy@gmail.com" 
'Set the subject of the e-mail
objCDOMail.Subject = strName & " Gifts received"
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

Response.Redirect("logistics.asp?action=recGifts")

End If 

%>
<!--#include virtual="/includes/connectionClose.asp"-->
<% End If %>