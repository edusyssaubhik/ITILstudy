<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<!--#include virtual="/includes/connection.asp"-->
<% 
If Session("USBUserId") = "" Then 
	Response.Redirect("/USBackoffice/login.asp")
Else
%>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 13/07/2010'

'======================================================='

'Declare The Variables'
Dim strAddCallDet
Dim rqFirstName, rqLastName, rqEmailId1
Dim rqPwd, rqEmailId2
Dim rqPhoneNo1, rqPhoneNo2
Dim rqAddress, rqAddress2,rqCompName,rqCompAdd
Dim rqType, strEditInst, rqInstId, rqTypeOfUser, rqCountry
Dim rqAction, rqDelInstID, strBody, objCDOMail

rqFirstName = Request.Form("firstname") 
rqLastName  = Request.Form("lastname")
rqEmailId1  = Request.Form("emailid1")
rqPwd 		= Request.Form("pwd")
rqEmailId2  = Request.Form("emailid2")

rqPhoneNo1  = Request.Form("phoneno1")
rqPhoneNo2  = Request.Form("phoneno2")

rqAddress  = trim(Request.Form("instAdd"))
rqType      = Request.Form("type")
rqInstId    = Request.Form("instId")
rqTypeOfUser= Request.Form("typeofuser")
rqCountry   = Request.Form("country")
rqCompName  = Request.Form("compName")
rqCompAdd   = trim(Request.Form("compAdd"))
rqAction    = Request.QueryString("action") 
rqDelInstID = Request.QueryString("delInstId")



If rqType = "Add Instructor" Then

	ConnObj.Execute "INSERT INTO sixsigma_us_instructor (firstname, lastname, inst_emailid1, inst_emailid2, pas, phone_no1, phone_no2,  country, company_name, company_add, inst_address, typeofuser) VALUES ('"& rqFirstName &"','"& rqLastName &"','"& rqEmailId1 &"','"& rqEmailId2 &"','"& rqPwd &"','"& rqPhoneNo1 &"','"& rqPhoneNo2 &"', '"& rqCountry &"', '"& rqCompName &"', '"& rqCompAdd &"', '"& rqAddress &"','"& rqTypeOfUser &"')"
	
	Response.Write("You have successfully added the instructor details")
	
	Response.Write("<br>")
	
	Response.Write("If you want add one more instructor please <a href='/USBackoffice/6sigma_us_inst.asp'>click here</a>")

ElseIf rqType = "Edit Instructor" Then

	ConnObj.Execute "UPDATE sixsigma_us_instructor SET firstname = '"& rqFirstName &"', lastname = '"& rqLastName &"', inst_emailid1 = '"& rqEmailId1 &"', inst_emailid2 = '"& rqEmailId2 &"', phone_no1 = '"& rqPhoneNo1 &"', phone_no2 = '"& rqPhoneNo2 &"' , country = '"& rqCountry &"', company_name = '"& rqCompName &"', company_add = '"& rqCompAdd &"', inst_address = '"& rqAddress &"',typeofuser = '"& rqTypeOfUser &"'  WHERE id = '"& rqInstId &"'"
	
	Response.Write("You have successfully edited the instructor details")
	
	Response.Write("<br>")
	
	Response.Write("See all the instructors <a href='/USBackoffice/6sigma_us_inst.asp?action=list'>click here</a>")

ElseIf rqType = "Reset Password" Then
	
	ConnObj.Execute("UPDATE sixsigma_us_instructor SET pas = '"& rqPwd &"' WHERE id = '"& rqInstId &"'")
	'response.Write("UPDATE sixsigma_us_instructor SET pas = '"& rqPwd &"' WHERE id = '"& rqInstId &"'")
	strBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.pmstudy.com/images/banners/email_header.jpg"" alt=""PMstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "&rqFirstName&" "&rqLastName&",<br><br>Greetings from PMstudy.com!<br><br>In response to your request for resetting your password, we have reset your password. The details are as follows:<br><br>Email Id: "&rqEmailId1&"<br>Password: "&rqPwd&"<br><br>You can access <a href=""http://www.PMstudy.com/USBackoffice/login.asp"" target=""_blank"">http://www.PMstudy.com/USBackoffice/login.asp</a> with the above cited password. We advise you to change your password immediately after first access for security reasons. <BR><BR>Best Regards, <BR>Custmer Support<br>www.PMstudy.com<BR>(PMI Approved Registered Education Provider)<BR>Email: adminsupport@pmstudy.com</font></td></tr></table></td></tr></table></td></tr></table>"
	
	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
	objCDOMail.From = "adminsupport@pmstudy.com"
	objCDOMail.To =  rqEmailId1 
	objCDOMail.Bcc = "marketing@pmstudy.com"
	objCDOMail.Importance = 2
	objCDOMail.Subject = "Resetting of password"
	objCDOMail.BodyFormat = 0
	objCDOMail.MailFormat = 0
	objCDOMail.Body =  strBody
	objCDOMail.Send
	Set objCDOMail = Nothing

	Response.Write("You have successfully reset the instructor password")
	
	Response.Write("<br>")
	
	Response.Write("See all the instructors <a href='/USBackoffice/6sigma_us_inst.asp?action=list'>click here</a>")
	
End If 

	'Deleting the instructor'
	If rqAction = "delete" Then
	
	ConnObj.Execute("DELETE FROM sixsigma_us_instructor WHERE id = '"& rqDelInstID &"'")
	
	Response.Write("You have successfully deleted the instructor")
	
	Response.Write("<br>")
	
	Response.Write("See all the instructors <a href='/USBackoffice/6sigma_us_inst.asp?action=list'>click here</a>")

End If


%>
<!--#include virtual="/includes/connectionClose.asp"-->
<% End If %>
