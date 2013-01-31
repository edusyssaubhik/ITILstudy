<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
If Session("USBUserId") = "" Then
	Response.Redirect("login.asp")
Else
'========================================================='
'Written By : Bharath'
'Written Date :17-09-2011'
'Description :'
'Here we are displaying email id and phone number based on call id'
'========================================================='
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'Declare The Variables'
Dim strQuery
Dim rqID 
Dim objRs

Set objRs = Server.CreateObject("ADODB.Recordset")

'Retrive The CourseID Using QueryString From fin.asp Page'
rqCallID = Request.QueryString("CallId")
'response.Write(rqCallID)

strQuery = "SELECT callername, phoneno, emailid FROM ITIL_callsreceived_new WHERE callid ='"& rqCallID &"'"

objRs.Open strQuery, ConnObj

Do Until objRs.EOF

sIPAddress = Request.ServerVariables("HTTP_X_FORWARDED_FOR")

If sIPAddress="" Then sIPAddress = Request.ServerVariables("REMOTE_ADDR")

strQuery11 = "http://geoip1.maxmind.com/b?l=4tAUhyTgUD6d" & _
	"&i=" & sipaddress
set objHtp = Server.CreateObject("Msxml2.ServerXMLHTTP")
objHtp.open "GET", strQuery11, false
objHtp.send
sipAddress = sipAddress + ";" + objHtp.ResponseText

AccessUser = Session("FirstName") &" "&Session("LastName")

ConnObj.Execute ("INSERT INTO trackCallDet VALUES ('"&rqCallID&"', '"&AccessUser&"', '"&sipAddress&"', '"&Now()&"')")

strBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""45%"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td align=""center"" width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.pmstudy.com/images/banners/email_header.jpg"" alt=""PMstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Hi,<br><br>This is Receptionist call details: <BR><BR>Name: "&objRs("callername")&"<br><br>Email ID: "&objRs("emailid") &"<br><br>Phone Number: "&objRs("phoneno")&"<br><br>User: "&AccessUser&"<br><br>Time: "&Now()&"<br><br>IP Address: "&sipAddress&"<BR><BR>Best Regards, <br>PMstudy<br><a href =""http://www.PMstudy.com"">www.PMstudy.com</a></font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"

Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
objCDOMail.From = "pmstudytracking@gmail.com"
objCDOMail.To =  "pmstudytracking@gmail.com"
objCDOMail.Importance = 2
objCDOMail.Subject = "Tracking Receptionist calls details"
objCDOMail.BodyFormat = 0
objCDOMail.MailFormat = 0
objCDOMail.Body =  strBody
objCDOMail.Send
Set objCDOMail = Nothing


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Caller Details</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body class="popupbody">
<div style="margin-top:30px; margin-left:30px;">
  <table border="0" width="100%" class="btext" align="left">
    <tr>
      <td><table border="0"  cellpadding="2" cellspacing="0" class="table2">
		  <tr align="Left">
          	<td>Name: <% = objRs("callername")  %></td>
          </tr>
         <tr align="Left">
          	<td>Email ID: <% = objRs("emailid") %></td>
          </tr>
		  <tr align="Left">
          	<td>Phone Number: <% = objRs("phoneno") %></td>
          </tr>
        </table></td>
    </tr>
     <% objRs.Movenext
     Loop
	 objRs.Close
	 Set objRs = Nothing
	 ConnObj.Close
	 Set ConnObj = Nothing  %>
    </table>
</div>
</body>
</html>
<% End If %>