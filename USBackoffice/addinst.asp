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
'Written By : Savita'
'Last UpDated : 29/09/2011'
'Description :'
'This page is adding us instructors to the database page'
'This page is comes from usinstructor.asp page'
'======================================================='

'Declare The Variables'
Dim strAddCallDet
Dim rqFirstName, rqLastName, rqEmailId1
Dim rqPwd, rqEmailId2, rqEmailId3
Dim rqPhoneNo1, rqPhoneNo2, rqFaxNo
Dim rqCity1, rqCity2, rqCity3, rqCity4, rqCity5
Dim rqCity6, rqCity7, rqCity8, rqCity9, rqCity10
Dim rqAddress1, rqAddress2,rqCompName,rqCompAdd
Dim rqType, strEditInst, rqInstId, rqTypeOfUser, rqCountry
Dim rqAction, rqDelInstID, strBody, objCDOMail
Dim rqDesignation

rqFirstName = Request.Form("firstname") 
rqLastName  = Request.Form("lastname")
rqEmailId1  = Request.Form("emailid1")
rqPwd 		= Request.Form("pwd")
rqEmailId2  = Request.Form("emailid2")
rqEmailId3  = Request.Form("emailid3")
rqPhoneNo1  = Request.Form("phoneno1")
rqPhoneNo2  = Request.Form("phoneno2")
rqFaxNo 	= Request.Form("faxno")
rqCity1 	= Request.Form("city1")
rqCity2 	= Request.Form("city2")
rqCity3 	= Request.Form("city3")
rqCity4 	= Request.Form("city4")
rqCity5 	= Request.Form("city5")
rqCity6 	= Request.Form("city6")
rqCity7 	= Request.Form("city7")
rqCity8 	= Request.Form("city8")
rqCity9 	= Request.Form("city9")
rqCity10 	= Request.Form("city10")
rqAddress1  = Request.Form("address1")
rqAddress2  = Request.Form("address2")
rqType      = Request.Form("type")
rqInstId    = Request.Form("instId")
rqTypeOfUser= Request.Form("typeofuser")
rqCountry   = Request.Form("country")
rqCompName  = Request.Form("compName")
rqCompAdd   = Request.Form("compAdd")
rqAction    = Request.QueryString("action") 
rqDelInstID = Request.QueryString("delInstId")
rqDesignation = Request.Form("designation")


If rqType = "Add Instructor" Then

	ConnObj.Execute "INSERT INTO ITIl_instructor (firstname, lastname, emailid1, pwd, emailid2, emailid3, phoneno1, phoneno2, faxno, city1, city2, city3, address1, address2, city4, city5, typeofuser, country, comp_name, comp_addr, city6, city7, city8, city9, city10, designation) VALUES ('"& rqFirstName &"','"& rqLastName &"','"& rqEmailId1 &"','"& rqPwd &"','"& rqEmailId2 &"','"& rqEmailId3 &"','"& rqPhoneNo1 &"','"& rqPhoneNo2 &"','"& rqFaxNo &"','"& rqCity1 &"','"& rqCity2 &"','"& rqCity3 &"','"& rqAddress1 &"','"& rqAddress2 &"','"& rqCity4 &"','"& rqCity5 &"','"& rqTypeOfUser &"', '"& rqCountry &"', '"& rqCompName &"', '"& rqCompAdd &"', '"& rqCity6 &"', '"& rqCity7 &"', '"& rqCity8 &"', '"& rqCity9 &"', '"& rqCity10 &"', '"& rqDesignation &"')"
	
	Response.Write("You have successfully added the instructor details")
	
	Response.Write("<br>")
	
	Response.Write("If you want add one more instructor please <a href='instructors.asp'>click here</a>")

ElseIf rqType = "Edit Instructor" Then

	ConnObj.Execute "UPDATE ITIL_instructor SET firstname = '"& rqFirstName &"', lastname = '"& rqLastName &"', emailid1 = '"& rqEmailId1 &"', emailid2 = '"& rqEmailId2 &"', emailid3 = '"& rqEmailId3 &"', phoneno1 = '"& rqPhoneNo1 &"', phoneno2 = '"& rqPhoneNo2 &"', faxno = '"& rqFaxNo &"', city1 = '"& rqCity1 &"', city2 = '"& rqCity2 &"', city3 = '"& rqCity3 &"', address1 = '"& rqAddress1 &"', address2 = '"& rqAddress2 &"', city4 = '"& rqCity4 &"', city5 = '"& rqCity5 &"', typeofuser = '"& rqTypeOfUser &"', country = '"& rqCountry &"',  comp_name = '"& rqCompName &"', comp_addr = '"& rqCompAdd &"', city6 = '"& rqCity6 &"', city7 = '"& rqCity7 &"', city8 = '"& rqCity8 &"', city9 = '"& rqCity9 &"', city10 = '"& rqCity10 &"', designation = '"& rqDesignation &"'  WHERE instid = '"& rqInstId &"'"
	
	Response.Write("You have successfully edited the instructor details")
	
	Response.Write("<br>")
	
	Response.Write("See all the instructors <a href='instructors.asp?action=list'>click here</a>")

ElseIf rqType = "Reset Password" Then
	
	ConnObj.Execute("UPDATE ITIL_instructor SET pwd = '"& rqPwd &"' WHERE instid = '"& rqInstId &"'")
	
	strBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.ITILstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "&rqFirstName&" "&rqLastName&",<br><br>Greetings from ITILstudy.com!<br><br>In response to your request for resetting your password, we have reset your password. The details are as follows:<br><br>Email Id: "&rqEmailId1&"<br>Password: "&rqPwd&"<br><br>You can access <a href=""http://www.ITILstudy.com/USBackoffice/login.asp"" target=""_blank"">http://www.ITILstudy.com/USBackoffice/login.asp</a> with the above cited password. We advise you to change your password immediately after first access for security reasons. <BR><BR>Best Regards, <BR>Custmer Support<br>www.ITILstudy.com<BR>Email: adminsupport@ITILstudy.com</font></td></tr></table></td></tr></table></td></tr></table>"
	
	'Response.write(strBody)
	
	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
	objCDOMail.From = "adminsupport@itilstudy.com"
	objCDOMail.To =  rqEmailId1 
	objCDOMail.Bcc = "marketing@itilstudy.com,pmstudysales@gmail.com"
	objCDOMail.Importance = 2
	objCDOMail.Subject = "Resetting of password"
	objCDOMail.BodyFormat = 0
	objCDOMail.MailFormat = 0
	objCDOMail.Body =  strBody
	objCDOMail.Send
	Set objCDOMail = Nothing

	Response.Write("You have successfully reset the instructor password")
	
	Response.Write("<br>")
	
	Response.Write("See all the instructors <a href='instructors.asp?action=list'>click here</a>")
	
End If 

	'Deleting the instructor'
	If rqAction = "delete" Then
	
	ConnObj.Execute("DELETE FROM ITIL_instructor WHERE instid = '"& rqDelInstID &"'")
	
	Response.Write("You have successfully deleted the instructor")
	
	Response.Write("<br>")
	
	Response.Write("See all the instructors <a href='instructors.asp?action=list'>click here</a>")

End If


%>
<!--#include virtual="/includes/connectionClose.asp"-->
<% End If %>