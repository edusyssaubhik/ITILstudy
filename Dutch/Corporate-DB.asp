<!--#include virtual="/includes/headermetaDutch.asp"-->
<!--#include virtual="/includes/innercoursebanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="PageTitle">Corporate</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu-Dutch.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px;">
              <table width="100%" cellpadding="0" cellspacing="0">
<%Dim EmailID, Contact, Name,Query
Dim MyBody
Dim MyCDONTSMail
Name=Request.Form("Name")
EmailID=Request.Form("EmailID")
Contact=Request.Form("Contact")
Query=Request.Form("Query")

Name=Replace(Name, "'", "")
EmailID=Replace(EmailID, "'", "")
Query=Replace(Query, "'", "")
Contact=Replace(Contact, "'", "")

Dim remoteaddr, remotehost
remoteaddr=Request.ServerVariables("REMOTE_ADDR")
remotehost=Request.ServerVariables("REMOTE_HOST")


ConnObj.Execute "INSERT INTO CorporateDb(Name, EmailID, ContactNo, Query, date, remoteaddr, remotehost) VALUES ('"&Name&"','"&EmailID&"','"&Contact&"','"&Query&"','"&Now()&"','"&remoteaddr&"','"&remotehost&"')"%>

Dear <%=Name%>, <br /><br />Thank you very much for your query.<BR>
<BR>
We will respond back to your corporate query soon.<BR>
<BR>
<%
				
body = "<table width=""100%"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td width=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""595"" bgcolor=""#FFFFFF""><span><img src=""http://www.ITILstudy.com/images/banners/Email-header.jpg"" alt=""ITILstudy"" width=""600"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td><p align=""left""><font face=""Arial, Helvetica, sans-serif"" size=""2"">Hi,<BR><BR>Greetings from ITILstudy!<br><br>Name: "&Name&"<br><br>Email: "&EmailID&"<BR><BR>Contact No: "&Contact&"<br><br>Query: "&Query&"<BR><BR>Regards, <br><br>Corporate Team<BR>www.ITILstudy.com <BR>Email: marketing@itilstudy.com </font></td></tr></table><tr><td width=""45px"">&nbsp;</td></tr></table>"
		
Dim objCDOMail
'Holds the CDONTS NewMail Object
'Create the e-mail server object
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'Who the e-mail is from
objCDOMail.From = "marketing@itilstudy.com"
'Who the e-mail is sent to
objCDOMail.To = "marketing@itilstudy.com"
'Who the blind copies are sent to
'objCDOMail.Bcc = "edusys1@gmail.com"
'Set the subject of the e-mail
objCDOMail.Subject = "Corporate Query to ITILstudy.com "&EmailID&" - ( "&Name&" )"
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
Set objCDOMail = Nothing
%>
<%
mailbody="<table width=""100%"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td width=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""595"" bgcolor=""#FFFFFF""><span><img src=""http://www.ITILstudy.com/images/banners/Email-header.jpg"" alt=""ITILstudy"" width=""600"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td><p align=""left""><font face=""Arial, Helvetica, sans-serif"" size=""2"">Dear "&name&",<BR><BR>Greetings from ITILstudy!<br><br>Thank you for your interest in ITILstudy Corporate training.<br><br>We acknowledge the receipt of your query. Our Corporate Team will get in touch with you shortly.<br><br>In the meanwhile, if you have further queries, please email us at marketing@itilstudy.com.<BR><BR>Thanks & Regards, <br><br>Corporate Team<BR>www.ITILstudy.com <BR>Email: marketing@itilstudy.com</font></td></tr></table><tr><td width=""45px"">&nbsp;</td></tr></table>"
'Response.Write(mailbody)
'Holds the CDONTS NewMail Object
'Create the e-mail server object
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'Who the e-mail is from
objCDOMail.From = "marketing@itilstudy.com"
'Who the e-mail is sent to
objCDOMail.To = ""&EMailID&""
'Who the blind copies are sent to
objCDOMail.Bcc = "marketing@itilstudy.com"
'Set the subject of the e-mail
objCDOMail.Subject = "Corporate Query"
'Set the e-mail body format (0=HTML 1=Text)
objCDOMail.BodyFormat = 0
'Set the mail format (0=MIME 1=Text)
objCDOMail.MailFormat = 0
'Set the main body of the e-mail
objCDOMail.Body = mailbody
'Importance of the e-mail (0=Low, 1=Normal, 2=High)
objCDOMail.Importance = 2
'Send the e-mail
objCDOMail.Send
'Close the server object
Set objCDOMail = Nothing


%>
                <!--#include virtual="/includes/connectionClose.asp"-->
              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer-Dutch.html"-->
