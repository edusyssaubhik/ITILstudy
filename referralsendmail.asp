<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerbanner.html"-->
<!--#include virtual="/includes/connectionRef.asp"-->


<!-- Body Starts -->
<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="PageTitle">Referral</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px;">
              <table width="100%" cellpadding="0" cellspacing="0">
                <%
				
				'Here If Refrral reffreng through the form it will send the mails here ' 
				Dim strBody
				Dim rqemail_(100),rqname_(100)
				Dim rqRefName, rqEnrollId, rqEmailID, rqTag
				
				
				If Request.form("RefName") <> "" Then
				rqRefName = Request.form("RefName")
				Else
				rqRefName = Request.form("YourName")
				End If
				
				If Request.form("yourEmail") <> ""  Then
				
				rqEmailId = Request.form("yourEmail") 
				
				
				%>
                
                <!--#include virtual="/includes/GenRefTag.asp"-->

<%
	
	Link =  "http://www.ITILstudy.com/referral.asp?tag="&GenTag
	
	Else

				rqRefName = Request.form("RefName")
				rqEnrollId = Request.Form("EnrollId")
				rqEmailId = Request.Form("EmailID")
				GenTag = Request.Form("Tag")
				
				Link =  "http://www.ITILstudy.com/referral.asp?tag="&GenTag
		
		
	End If			
				For i = 1 to 3 
				
					rqname_(i) = Request.form("name_"&i)	
					rqemail_(i) = Request.form("email_"&i)	
				
					If rqemail_(i) <> ""  Then
					
						strBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td><table width=""600px"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12""><tr><td><font face=""Arial"" size=2>Hello, <br><br>Your friend "&rqRefName&", has chosen ITILstudy, the leading ITIL Exam Prep training provider for preparing for the prestigious ITIL certification, and has referred you for the same. <br><br>Here's your opportunity to get rewarded while you sign up for the classroom training.  <br><br><b>Here is how the referral scheme works:</b><br><br>Once you enroll for our program, you will get <b>a discount of $50</b> on our ITIL classroom program fee and your friend will earn gift vouchers worth <b>$50</b>, from www.amazon.com.<br><br>The benefits don’t stop here. By completing a course with us you automatically become part of the VMEdu family and can refer as many friends/colleagues as you want to ITILstudy ITIL Exam Prep classroom training and share the benefits with your friends/colleagues who take our course.<br><br>For more details about our course, click <a href=""http://www.ITILstudy.com/"" target=""_blank"">here</a>.&nbsp;&nbsp;&nbsp;<br><br><b>How to join the referral program?</b><br><br>It's simple – just use this link to enroll with us: <a href="&Link&" target=""_blank"">ITILstudy</a> and attend any of our US/ Canada ITIL exam prep classroom program within 6 months of receiving this email.<br><br>"
				strBody = strBody &"<b>Remember: </b> Please use the above link to enroll to get the referral benefits. For terms and conditions, please click <a href=""http://www.ITILstudy.com/termsAndConditions.asp"" target=""_blank"">here</a><br><br>If you have any questions, feel free to email us at <a href=""mailto:marketing@ITILstudy.com."">marketing@ITILstudy.com</a>.<br><br>We look forward to having you as our student.<br><br>Best Regards,<br><br>Marketing Team<br><a href=""http://www.ITILstudy.com"" target=""_blank"">www.ITILstudy.com</a></font></td></tr></table></td></tr></table></td></tr></table>"
					
			'Response.Write(strBody)
			
						Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
						objCDOMail.From =  """ITILstudy"" <marketing@ITILstudy.com>"
						objCDOMail.To =  "<" & rqemail_(i) & ">"
						objCDOMail.cc = "marketing@ITILstudy.com, adminsupport@ITILstudy.com"
						objCDOMail.Importance = 2
						objCDOMail.Subject = "About ITILstudy's referral program"
						objCDOMail.BodyFormat = 0
						objCDOMail.MailFormat = 0
						objCDOMail.Body =  strBody
						objCDOMail.Send
						Set objCDOMail = Nothing	





ConnObjRef.Execute "INSERT Into Ref_Enrollments (RefID, ReferredEmail,EnrollStatus,Website,CourseType,ReferredDate) VALUES ('"& RqRefId &"','"& rqemail_(i) &"','0','ITILstudy','Class','"& Now() &"')"

					
					
					End If
				
				Next
				%>
                
                Emails has been sent successfully.
                
              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
