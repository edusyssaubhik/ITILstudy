<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
'Written By : savita'
'Created Date : 12th Nov 2011'
'Last UpDated : 12th Nov 2011'
'Description :'
'This page is adding PROJstudy calls to the database page'
'This page is comes from nanual_calls.asp page'
'======================================================='

'Declare The Variables'
Dim strAddCallDet
Dim rqCallFor, rqCallerName, rqPhoneNo
Dim rqCity, rqState, rqEmailId
Dim rqEnroll
Dim strAllcoatedCity, objRs
Dim Fac1, Fac2, Fac3 
Dim FirstName, LastName
Dim strBody, objCDOMail
Dim strValue, strCountry

Set objRs = Server.CreateObject("ADODB.Recordset")

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function


rqCallFor     =  Request.Form("callfor")
rqCallerName  =  Request.Form("callername")
rqPhoneNo     =  Request.Form("phoneno")
rqState       =  Trim(Request.Form("state"))
rqCity        =  Request.Form("city")
rqState      =  Request.Form("state")
rqEmailId     =  Request.Form("emailid")
rqEnroll    =  Request.Form("enroll") 
strComment    =  Request.Form("comment")
rqCountry     =  Request.Form("country")
rqdateEntered     =  Request.Form("dateEntered")
rqdateValid     =  Request.Form("dateValid")

rqEnroll = "The student enrolled for 15 Free questions. <br>"&rqEnroll&" <br> Date Entered - "&rqdateEntered&" <br>Date Valid - "&rqdateEntered&"" 

ConnObj.Execute "INSERT INTO ITIL_callsreceived_new (callfor, callername, phoneno, emailid, callerstate, city, question, call_status1, addeddate, country, website) VALUES ('Free Enrolment','"& rqCallerName &"','"& rqPhoneNo &"','"& StrQuoteReplace(rqEmailId) &"','"& rqState &"','"& rqCity &"','"& StrQuoteReplace(rqEnroll) &"','1','"& Now() &"','"&rqCountry &"', 'ITILstudy')"

strBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""540px""><table border=""0"" width=""520px"" align=""center""><tr height=""30px""><td><font face=""Arial"" size=2>Hi,<BR><BR>We got the following student enrolled for ""ITIL Free Online Test"". Kindly follow up. <BR><BR>Name: "& rqCallerName &"<BR><BR>country:  "&rqCountry&"<BR><BR>State:  "&rqState&"<BR><BR>City:  "&rqCity&"<BR><BR>Phone Number: "&rqPhoneNo&""
If rqEmailId <> "" Then
strBody = strBody & "<BR><BR>EmailId: "&rqEmailId
End If 
strBody = strBody & "<BR><BR>Time: "&Now()&"<BR><BR> Additional Info: "&rqEnroll&"<BR><BR>Please do the needful.<BR><BR>Best Regards, <BR>Customer Support<br>www.ITILstudy.com<BR>Email: marketing@itilstudy.com</font></td></tr></table></td></tr></table></td></tr></table>"

response.Write(strBody)


Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
objCDOMail.From = "marketing@itilstudy.com"
objCDOMail.To =  "marketing@itilstudy.com"
objCDOMail.Bcc = "satpathyt@gmail.com, itilstudyleadershipteam@googlegroups.com"
objCDOMail.Importance = 2
objCDOMail.Subject = "ITILstudy online student (follow up required)"
objCDOMail.BodyFormat = 0
objCDOMail.MailFormat = 0
objCDOMail.Body =  strBody
objCDOMail.Send
Set objCDOMail = Nothing




Response.Write("You have successfully added the caller details")



%>
<br />If you want add one more caller detials please <a href="/manual_calls.asp">click here</a>
<!--#include virtual="/includes/connectionClose.asp"-->