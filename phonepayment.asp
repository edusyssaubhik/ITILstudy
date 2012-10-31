<!--#include virtual="/metatags/index_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/inneraboutusbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="PageTitle">Payment Overphone</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px;">
              <table width="100%" cellpadding="0" cellspacing="0">
                <%

Dim rqName,rqEmailID,rqEnrollID,rqContactNo,rqInfo

rqName = Request.Form("Name")
rqEmailID = Request.Form("EmailID")
rqEnrollID = Request.Form("EnrollID")
rqContactNo = Request.Form("Cno")
rqInfo = Request.Form("Info")

%>
                Dear <%=rqName%>, <br /><br />Thank you for your interest in ITILstudy<BR>
                <BR>
                We will contact you within 12 business hours for the payment processing.<BR>
                <BR>
                <%				body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td width=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width="""" bgcolor=""#FFFFFF""><span><img src=""http://www.ITILstudy.com/images/banners/Email-header.jpg"" alt=""ITILstudy"" width=""560px"" height=""100px"" /></span></td></tr><tr><td align=""center"" colspan=""2"" width=""560px""><table border=""0"" align=""center"" width=""500px""><tr><td><p><font face=""Arial, Helvetica, sans-serif"" size=""2"">Dear "&rqName&",<br/><br/>Greetings from ITILstudy!<br><br>Thank you for your interest in ITILstudy .<br><br>We will contact you within 12 business hours for processing the payment. The service is available from 8:00 am to 8:00 pm EST (Monday to Friday).<br><br>Following is the information provided by you:<table width=""70%"" border=""1px"" cellspacing =""0"" cellpadding=""0"" ><tr height=""30px""><td>Name</td><td>"&rqName&"</td></tr><tr height=""30px""><td>Email ID</td><td>"&rqEmailID&"</td></tr>"

If rqEnrollID <> "" Then
body = body & "<tr height=""30px""><td>Enroll ID</td><td>"&rqEnrollID&"</td></tr>"
End If

body = body & "<tr height=""30px""><td>Contact No</td><td>"&rqContactNo&"</td></tr>"

If rqInfo <> "" Then
body = body & "<tr height=""30px""><td>Additional Information</td><td>"&rqInfo&"</td></tr>"
End If

body = body & "</table><br>In case you have any further query, please email us at marketing@itilstudy.com. <br><br>Best Regards,<br><br>Customer Support<br><a href=""http://www.itilstudy.com/"" target=""_blank"">www.ITILstudy.com</a></td></tr></table></td></tr></table>"
	
	
	'Response.Write(body)
	
	'Sending email'
	
 
'	Holds the CDONTS NewMail Object
	'Create the e-mail server object
	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'	'Who the e-mail is from
	objCDOMail.From = "marketing@itilstudy.com"
'	'Who the e-mail is sent to
	objCDOMail.To = rqEmailID
'	'Who the blind copies are sent to
	objCDOMail.Bcc = "marketing@itilstudy.com"
'	'Set the subject of the e-mail
	objCDOMail.Subject = "Acknowledgement: Request for payment processing"
'	'Set the e-mail body format (0=HTML 1=Text)
	objCDOMail.BodyFormat = 0
'	'Set the mail format (0=MIME 1=Text)
	objCDOMail.MailFormat = 0
'	'Set the main body of the e-mail
	objCDOMail.Body = body
'	'Importance of the e-mail (0=Low, 1=Normal, 2=High)
	objCDOMail.Importance = 2
'	'Send the e-mail
	objCDOMail.Send
'	'Close the server object
	Set objCDOMail = Nothing



'Response.Write "Your Email - "&subject&" - has been sent"
'UserID=Session("UserID")
'feedback=Request.Form("first_name")&": "&Request.Form("Feedback")
'ConnObj.Execute "Insert into queriesans(UserID, TimeofQuery, Feedback) values('"&UserID&"','"&Timeofquery&"','"&feedback&"')"
'
'ConnObj.Close
'Set ConnObj=Nothing
%>
                <!--#include virtual="/includes/connectionClose.asp"-->
              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
