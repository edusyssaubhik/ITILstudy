<!--#include virtual="/metatags/aboutITIL_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/try-our-quality-banner.asp"-->
<!--#include virtual="/metatags/courseBenefits_metatag.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!-- Body Starts -->


<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" >&nbsp;</td>
            <td width="25%" >&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; ITILstudy Communications  </td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
            
              <%
'Declare Local Variables'
 
 Dim rqEmail

'Retrive The TableName and ID Using QueryString
'Fname = request.Form("Name")
Fname = request.Form("FirstName")
rqEmail = request.QueryString("email")
'rqEmail = Request.QueryString("emailid")
 
Set objRs2 = Server.CreateObject("ADODB.Recordset")

'Updating status to '2' if that particular candidate unsubscribes 
strQuery = "UPDATE Newsletter_emailids SET status = '2' WHERE emailid='"& rqEmail &"'"

'Response.Write(strQuery)
		objRs2.Open strQuery, ConnObj
  
'Print The Message' 
 'Response.Write("You have successfully unsubscribed from our database")


                'Email Template'
		body = "<table width=""100%"" bordrer=""0"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy.com"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "& Fname &",<br><br> You have been unsubscribed from ITILstudy ""ITILstudy Communications"" Newsletter. <br/><br/>If you wish to subscribe again, please <a href=""/freeresources/Newsletter.asp"" target=""_blank"">Click here</a>.<br/><br/>If you have questions regarding this email, please contact us at marketing@ITILstudy.com and we'll be glad to assist you.<br/><br/>Thanks for your interest in <a href=""http://www.ITILstudy.com"" target=""_blank"">ITILstudy.com</a>! <br><br>Best Regards,<br>ITILstudy Team.<BR></font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></table>"
		
		'Response.Write(body)
		
		
		Dim objCDOMail     
		'Holds the CDONTS NewMail Object
		'Create the e-mail server object
		Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
		'Who the e-mail is from
		objCDOMail.From = "marketing@ITILstudy.com"
		'Who the e-mail is sent to
		objCDOMail.To = rqEmail
		'Who the e-mail is sent to
		objCDOMail.Bcc = "marketing@ITILstudy.com"		
		'Set the subject of the e-mail
		objCDOMail.Subject = "You have been unsubscribed from ITILstudy ""ITILstudy Communications"" Newsletter."
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
              <table border="0" cellpadding="3" cellspacing="0">
                <tr>
                  <td><b>You have been unsubscribed from ITILstudy "ITILstudy Communications" Newsletter.</b> <br /></td>
                </tr>
                <tr>
                  <td>If you wish to subscribe again, please <a href="/freeresources/Newsletter.asp" target="_blank">Click here</a>.</td>
                </tr>
               
                <tr>
                  <td>If you have questions regarding this ITILstudy, please contact us at <u>marketing@ITILstudy.com</u>  and we'll be glad to assist you.</td>
                </tr>
                <br/>
                <tr>
                  <td>Thanks for your interest in ITILstudy.com!</td>
                </tr>
              </table></td>
          
          </tr>
        </table></td>
    </tr>
  </table>
  <!-- end #mainContent -->
</div>
<!--#includes virtual="/includes/footer.html"-->
