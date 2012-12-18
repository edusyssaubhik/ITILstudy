<!--#include virtual="/metatags/aboutITIL_metatag.html"-->
<!--#include virtual="/includes/headermetaDutch.asp"-->
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
            <td width="73%" class="breadcrumb">Home &raquo; ITILstudy Communicatie  </td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu-Dutch.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
			 <%
				'Declaring variable
				   Dim strQuery,strAdd
				   Dim objRs
				   
				   Set objRs = Server.CreateObject("ADODB.Recordset")
				   
				'retriving values
					Fname = request.Form("FirstName")
					Lname = request.Form("lastName")
					phoneNo = request.Form("PhoneNo")
					Email = request.Form("Emailid")
					
				'If Uname field is empty enter som value
				  If Fname = "" then
				    Fname="Subscriber"
				  End If
					
				'Retriving emailid and comparing
				strQuery="select emailid, status from Newsletter_emailids where emailid='"& Email & "'"
				'response.Write(strQuery)
				
				objRs.Open strQuery, ConnObj
				
				Do Until objRs.Eof
				
					existingEmail = objRs("emailid")
					estatus  = objRs("status")
					
				objRs.Movenext
				Loop
				objRs.Close
				
				'Checking that whether the person is already enrolled'
				If Email = existingEmail then
					
				   If estatus = 2 Then
				   
				   ConnObj.Execute("UPDATE Newsletter_emailids SET status = '1' WHERE emailid='"& Email & "'")
				   
				    'Email Template'
body = "<table width=""100%"" bordrer=""0"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy.com"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "& Fname &",<br><br> Thank you for subscribing ""ITILstudy Communications"" Newsletter again. <br/><br/>You have enrolled using the email "& Email &". You will start getting an email from <a href=""http://www.itilstudy.com"" target=""_blank"">ITILstudy.com</a> every month. <br/><br/>If you have questions regarding this email, please contact us at marketing@itilstudy.com and we'll be glad to assist you.<br/><br/>If you prefer not to receive these emails you can <a href=""http://www.ITILstudy.com/freeresources/unsubscribe.asp?email="&Email&""" target=""_blank"">unsubscribe here</a>.<br/><br/>Thanks for your interest in <a href=""http://www.ITILstudy.com"" target=""_blank"">ITILstudy.com</a>.<br><br>Best Regards,<br>ITILstudy Team.<BR></font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></table>"
					
					'Response.Write(body)
					
  
					'Holds the CDONTS NewMail Object
					'Create the e-mail server object
					Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
					'Who the e-mail is from
					objCDOMail.From = "marketing@itilstudy.com"
					'Who the e-mail is sent to
					objCDOMail.To = Email
					'Who the e-mail is sent to
					objCDOMail.Bcc = "marketing@itilstudy.com"		
					'Set the subject of the e-mail
					objCDOMail.Subject = "Thanks for subscribing for ITILstudy Communications Newsletter"
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


				   Response.Write("Je hebt je geabonneerd")
				   
				   Else
				   
				   Response.Write(existingEmail &", is reeds geregistreerd voor de ITILstudy Communicatie nieuwsbrief.")
				   
				   End If
				   
				else 
               'Inserting values
			   strAdd="Insert into Newsletter_emailids(firstname,lastname,phoneNo,emailid,enrolleddate,status) values "
			   strAdd = strAdd &"('"& Fname &"',"
			    strAdd = strAdd &"'"& Lname &"',"
				strAdd = strAdd &"'"& phoneNo &"',"
			   strAdd = strAdd &"'"& Email &"',"
			   strAdd = strAdd &"'"& now() &"',"
			   strAdd = strAdd &"'1')"
			   
			   ConnObj.execute strAdd 
			   %>
				<%
                'Email Template'
					body = "<table width=""100%"" bordrer=""0"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy.com"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "& Fname &",<br><br> Thank you for subscribing  ""ITILstudy Communications"" Newsletter. <br/><br/>You have enrolled using the email "& Email &". You will start getting an email from <a href=""http://www.itilstudy.com"" target=""_blank"">ITILstudy.com</a> every month. <br/><br/>If you have questions regarding this email, please contact us at marketing@itilstudy.com and we'll be glad to assist you.<br/><br/>If you prefer not to receive these emails you can <a href=""http://www.ITILstudy.com/freeresources/unsubscribe.asp?email="&Email&""" target=""_blank"">unsubscribe here</a>.<br/><br/>Thanks for your interest in <a href=""http://www.ITILstudy.com"" target=""_blank"">ITILstudy.com</a>.<br><br>Best Regards,<br>ITILstudy Team.<BR></font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></table>"
		
		'Response.Write(body)
		
					'Holds the CDONTS NewMail Object
					'Create the e-mail server object
					
					Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
					'Who the e-mail is from
					objCDOMail.From = "marketing@itilstudy.com"
					'Who the e-mail is sent to
					objCDOMail.To = Email
					'Who the e-mail is sent to
					objCDOMail.Bcc = "marketing@itilstudy.com"		
					'Set the subject of the e-mail
					objCDOMail.Subject = "Thanks for subscribing for ITILstudy Communications Newsletter"
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
                <td> <b>Hartelijk dank voor uw inschrijving voor de "ITILstudy Communicatie" nieuwsbrief. </b></td>
                </tr>
                
                <tr>
                <td>U heeft zich ingeschreven met het volgende e-mailadres: <%= Email  %>. U zult elke maand een e-mail van ons ontvangen </td>
                </tr>
                             
                <tr>
                <td>We vragen u contact op te nemen met <u>marketing@itilstudy.com</u> indien u geen e-mail ontvangt. We helpen u graag.  <br/><br/></td>
                </tr>
               
                <tr>
                <td>Hartelijk dank voor uw interesse in ITILstudy.com!</td>
                </tr>
                </table>
					
				
                <%End If%>
                

             <!-- Content End From Here-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer-Dutch.html"-->
