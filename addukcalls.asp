<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/connection_global.asp"-->
<%
'======================================================='
'Written By : Priyanka'
'Created Date : 08/11/2011'
'Last UpDated : 08/11/2011'
'Description :'
'This page is adding ITILstudy calls to the database page'
'This page is comes from calls.asp page'
'======================================================='

'Declare The Variables'
Dim strAddCallDet
Dim rqCallFor, rqCallerName, rqPhoneNo 
Dim rqCity, rqCounty, rqEmailId
Dim rqQuestion
Dim strAllcoatedCity, objRs
Dim Fac1, Fac2, Fac3 
Dim FirstName, LastName
Dim strBody, objCDOMail
Dim strValue, strCountry, country

Set objRs = Server.CreateObject("ADODB.Recordset")

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function


rqCallFor     =  Request.Form("callfor")
rqCallerName  =  Request.Form("callername")
rqPhoneNo     =  Request.Form("phoneno")
rqCounty       =  Trim(Request.Form("county"))
rqCity        =  Request.Form("city")
rqEmailId     =  Request.Form("emailid")
rqQuestion    =  Request.Form("question") 
strComment    =  Request.Form("comment")
rqCountry     =  Request.Form("country")


'strCountry = "SELECT country FROM ps_us_states WHERE states = '"& rqState &"'"

strCountry = "SELECT country FROM itil_states WHERE states = '"& rqState &"'"

objRs.Open strCountry, ConnObj

Do Until objRs.EOF
	country = objRs("country")
objRs.Movenext
Loop
objRs.Close

ConnObj.Execute "INSERT INTO ITIL_callsreceived_new (callfor, callername, phoneno, emailid, callerstate, city, question, call_status1, addeddate, country, website) VALUES ('"& rqCallFor &"','"& StrQuoteReplace(rqCallerName) &"','"& rqPhoneNo &"','"& rqEmailId &"','"& rqState &"','"& rqCity &"','"& StrQuoteReplace(rqQuestion) &"','1','"& Now() &"','United Kingdom', 'ITILstudy')"


If rqCallFor = "Classroom" Then 


strBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""540px""><table border=""0"" width=""520px"" align=""center""><tr height=""30px""><td><font face=""Arial"" size=2>Hi,<BR><BR>We got the following call from student for follow up. <BR><BR>Name: "&rqCallerName&"<BR><BR>County:  "&rqCounty&"<BR><BR>City:  "&rqCity&"<BR><BR>Phone Number: "&rqPhoneNo&""
If rqEmailId <> "" Then
strBody = strBody & "<BR><BR>EmailId: "&rqEmailId
End If 
strBody = strBody & "<BR><BR>Time: "&Now()&"<BR><BR>Ques: "&rqQuestion&"<BR><BR>Please do the needful.<BR><BR>Best Regards, <BR>Customer Support<br>www.ITILstudy.com<BR>Email: marketing@itilstudy.com</font></td></tr></table></td></tr></table></td></tr></table>"

response.Write(strBody)


Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
objCDOMail.From = "marketing@itilstudy.com"
objCDOMail.To =  "marketing@itilstudy.com"
objCDOMail.cc = "edusyssantosh@gmail.com, pmstudysales@gmail.com, edusyskishan@gmail.com"
objCDOMail.Bcc = "satpathyt@gmail.com, itilstudyleadershipteam@googlegroups.com"
objCDOMail.Importance = 2
objCDOMail.Subject = "ITILstudy Receptionist call received (follow up required)."
objCDOMail.BodyFormat = 0
objCDOMail.MailFormat = 0
objCDOMail.Body =  strBody
objCDOMail.Send
Set objCDOMail = Nothing

ElseIf rqCallFor = "Online" Then

strBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""540px""><table border=""0"" width=""520px"" align=""center""><tr height=""30px""><td><font face=""Arial"" size=2>Hi,<BR><BR>We got the following call from student for follow up. <BR><BR>Name: "&rqCallerName&"<br><br>County: "&rqCounty&" " 
If rqCity <> "" Then
strBody = strBody & "<BR><BR>City:  "&rqCity
End If
strBody = strBody & "<BR><BR>Phone Number: "&rqPhoneNo
If rqEmailId <> "" Then
strBody = strBody & "<BR><BR>EmailId: "&rqEmailId
End If 
strBody = strBody & "<BR><BR>Time: "&Now()&"<BR><BR>Ques: "&rqQuestion&"<BR><BR>Please do the needful.<BR><BR>Best Regards, <BR>Customer Support<br>www.ITILstudy.com<BR>Email: marketing@itilstudy.com</font></td></tr></table></td></tr></table></td></tr></table>"

response.Write(strBody)

Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
objCDOMail.From = "marketing@itilstudy.com"
objCDOMail.To =  "marketing@itilstudy.com"
objCDOMail.cc = "edusyssantosh@gmail.com, pmstudysales@gmail.com, edusyskishan@gmail.com"
objCDOMail.Bcc = "satpathyt@gmail.com, itilstudyleadershipteam@googlegroups.com"
objCDOMail.Importance = 2
objCDOMail.Subject = "ITILstudy Receptionist call received (follow up required)."
objCDOMail.BodyFormat = 0
objCDOMail.MailFormat = 0
objCDOMail.Body =  strBody
objCDOMail.Send
Set objCDOMail = Nothing

End If


Response.Write("You have successfully added the caller details")



%>
If you want add one more caller detials please <a href="/ukcalls.asp">click here</a>
<!--#include virtual="/includes/connectionCloseGlobal.asp"-->

<!--#include virtual="/includes/connectionClose.asp"-->