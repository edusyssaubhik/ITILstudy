<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
'Written By : Praveen'
'Created Date : 18/08/2011'
'Last UpDated : 19/08/2011'
'Description :'
'This page is adding ITILstudy calls to the database page'
'This page is comes from calls.asp page'
'======================================================='

'Declare The Variables'
Dim strAddCallDet
Dim rqCallFor, rqCallerName, rqPhoneNo
Dim rqCity, rqState, rqEmailId
Dim rqQuestion
Dim strAllcoatedCity, objRs
Dim Fac1, Fac2, Fac3 
Dim FirstName, LastName
Dim strBody, objCDOMail
Dim strValue, strCountry, country

Set objRs = Server.CreateObject("ADODB.Recordset")

'Replace method
Function StrQuoteReplace(strValue)
StrQuoteReplace = Replace(strValue, "'", "''")
End Function 

 

rqCallerName  =  Request.Form("Name")
rqPhoneNo     =  Request.Form("TNO")
rqPosition       =  Trim(Request.Form("position"))
rqTime    =  Request.Form("Time")
rqInfo   =  Request.Form("Info") 



ConnObj.Execute "INSERT INTO itil_callback (Name, PhoneNo, location, Convenient_Time, enteredDate) VALUES ('"& rqCallerName &"','"& rqPhoneNo &"','"& rqPosition &"','"& rqTime &"','"& Now() &"')"

strEmailBody = "Liebe "&rqCallerName&",<BR><BR>Vielen Dank f&uuml;r Ihre Anfrage an ITILstudy.<BR><BR>Wir werden zur&uuml;ck zur Beantwortung Ihrer Anfrage in K&uuml;rze.<BR><BR>F&uuml;r weitere Fragen, mailen Sie uns bitte an marketing@itilstudy.com."



strBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""540px""><table border=""0"" width=""520px"" align=""center""><tr height=""30px""><td><font face=""Arial"" size=2>Hi,<br><br>We got the following call from student for Call Back Request.<br><br><b>Name:</b> "&rqCallerName&"<br><br><b>Phone Number:</b> "& rqPhoneNo &"<br><br><b>Location:</b> "&rqPosition  &"<br><br><b>Convenient time to receive a call back:</b> "& rqTime &"<br><br><b>Query:</b> "& rqInfo &"<br><br>Please do the needful.<br><br>Best Regards,<br><br>Customer Support,<br><a href=""http://www.ITILstudy.com"" target=""_blank"">www.ITILstudy.com</a><br>Email: <a href=""http://adminsupport@ITILstudy.com"" target=""_blank"">adminsupport@ITILstudy.com</a></font></td></tr></table></td></tr></table></td></tr></table>"

Response.write(strBody)


Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
objCDOMail.From = "marketing@itilstudy.com"
objCDOMail.To =  "marketing@itilstudy.com"
''objCDOMail.To =  "magaline.h@itilstudy.com,scott.h@itilstudy.com,corey.b@itilstudy.com,ruth.k@itilstudy.com,elizabeth.w@itilstudy.com,marketing@itilstudy.com"
objCDOMail.cc = "itilstudysales@gmail.com"
''objCDOMail.Bcc = "satpathyt@gmail.com"
objCDOMail.Importance = 2
objCDOMail.Subject = "ITILstudy Call Back request received (follow up required)"
objCDOMail.BodyFormat = 0
objCDOMail.MailFormat = 0
objCDOMail.Body =  strBody
objCDOMail.Send
Set objCDOMail = Nothing


Session("message") = strEmailBody

Response.Redirect("/german/einenRückrufanfordern.asp")



%>
<!--#include virtual="/includes/connectionClose.asp"-->
