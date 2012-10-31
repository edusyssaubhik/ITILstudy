<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerloginbanner.html"-->
<%
DIM strEmail
strEmail = Request.Form("UserID")

IF strEmail <> "" THEN
%>
<!--#INCLUDE file="includes/connection.asp"-->
<%
Dim mySQL, objRS
Dim strPassword

Set objRS = Server.CreateObject("ADODB.Recordset")

mySQL = "SELECT first_name, last_name, payer_email, pass FROM PaypalDB WHERE payer_email = '" & strEmail & "'"
'response.Write(mySQL)

objRS.Open mySQL, ConnObj

%>

<div>
<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td height="235" align="left" valign="top" bgcolor="#FFFFFF">
<table width="100%" border="0" cellspacing="0" cellpadding="8">
  <tr>
    <td width="2%" class="Header"></td>
    <td width="25%" class="PageTitle"></td>
    <td width="73%" class="PageTitle">Forgot Password</td>
  </tr>
  <tr>
    <!--#include virtual="/includes/innerLeftMenu.asp"-->
    <br />
    <% IF objRS.EOF THEN  %>
    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px;">
      <% 
		Response.Write "That email address was not found in our database. Please click back on your browser and enter the email address you registered with."%>
    </td>
    <%
	
ELSE

strFirstName = objRs("first_name")

strLastName = objRs("last_name")

strUserId = objRs("payer_email")

strPassword = objRS("pass")




body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/buttons/Email-Header.jpg"" alt=""ITILstudy.com"" /></span><br><hr></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "& strFirstName &" " & strLastName &"<br><br>Your password is "& strPassword &".<br><br>Best Regards,<br><a href=""http://www.ITILstudy.com"" target=""_blank"">www.ITILstudy.com</a><BR>Email: adminsupport@ITIlstudy.com</font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"


'Response.Write(body)

Dim objCDOMail     
'Holds the CDONTS NewMail Object
'Create the e-mail server object
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'Who the e-mail is from
objCDOMail.From = "adminsupport@ITILstudy.com"
'Who the e-mail is sent to
objCDOMail.To = strUserId
'Set the subject of the e-mail
objCDOMail.Subject = "Forgot Passsword"
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
'Close the server object
Set objCDOMail = Nothing %>
    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px;">
      <%Response.Write "Your password has been sent to your email address." %>
    </td>
    <% END IF %>
  </tr>
  </td>
  
  </tr>
  
</table>
</div>
<%

ELSE

Response.Write "Please click Back on your browser and enter the email address you registered with."

response.Redirect("/ForgotPassword.asp")

END IF
%>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->