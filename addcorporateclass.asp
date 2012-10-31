<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/connection.asp"-->



<%


'Declare The Variables'
Dim strAddCallDet
Dim rqName,rqPhoneNo
Dim rqEmailId,rqCompany,rqCourse
Dim rqNoDelegates

Set objRs = Server.CreateObject("ADODB.Recordset")

'Replace method
Function StrQuoteReplace(strValue)
StrQuoteReplace = Replace(strValue, "'", "''")
End Function 

 

rqName   =  Request.Form("name")
rqEmailId  =  Request.Form("emailid")
rqCompany  =  Request.Form("company")
rqPhoneNo  =  Trim(Request.Form("phoneno"))
rqCourse   =  Request.Form("course")
rqNoDelegates =  Request.Form("no_delegates")


'strCountry = "SELECT * FROM ITIL_corporateclass"
'
'objRs.Open strCountry, ConnObj
'
'Do Until objRs.EOF
'country = objRs("country")
'objRs.Movenext
'Loop
'objRs.Close

 ConnObj.Execute "INSERT INTO ITIL_corporateclass(name, emailid, company, phoneno, course,no_delegates) VALUES ('"& rqName &"','"& rqEmailId &"','"& rqCompany &"','"& rqPhoneNo  &"','"& rqCourse &"','"& rqNoDelegates  &"')"

  
 
strBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""540px""><table border=""0"" width=""520px"" align=""center""><tr height=""30px""><td><font face=""Arial"" size=2>Hi,<BR><BR>We got the following call from student for follow up. <BR><BR>Name: "&rqName&"<BR><BR>Email-Id: "&rqEmailId&"<BR><BR>Company Name: "&rqCompany&"<BR><BR>Phone Number: "&rqPhoneNo&"<BR><BR>Course: "&rqCourse&"<BR><BR>Number Of Delegates: "&rqNoDelegates&"<BR><BR>Best Regards, <BR>Customer Support<br>www.ITILstudy.com<BR>Email: marketing@itilstudy.com</font></td></tr></table></td></tr></table></td></tr></table>"

'Response.write(strBody)


Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
objCDOMail.From = "marketing@itilstudy.com"
objCDOMail.To =  rqEmailId
'If country = "US" Then
'objCDOMail.To =  "magaline.h@itilstudy.com,scott.h@itilstudy.com,corey.b@itilstudy.com,ruth.k@itilstudy.com,elizabeth.w@itilstudy.com,sandra.s@itilstudy.com  ,marketing@itilstudy.com, daniel.m@itilstudy.com"
'ElseIf country = "Canada" Then
'objCDOMail.To =  "marketing@itilstudy.com,trent.f@itilstudy.com, karen.l@itilstudy.com"
'End If
objCDOMail.cc = "pmstudysales@gmail.com, itilstudysales@gmail.com"
objCDOMail.Bcc = "satpathyt@gmail.com"
objCDOMail.Importance = 2
objCDOMail.Subject = "ITILstudy Corporate Class Offers."
objCDOMail.BodyFormat = 0
objCDOMail.MailFormat = 0
objCDOMail.Body =  strBody
objCDOMail.Send
Set objCDOMail = Nothing


Session("message1")="Your query has been submited. We will get back to you at the earliest."
Response.Redirect("index.asp")


%>

<!--#include virtual="/includes/connectionClose.asp"-->