<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerwhyusbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="PageTitle">Contact Us/Feedback</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
			<div style="margin-top:-12px; width:97%;">
              <div>
<script language="Javascript">
var pop='';
function openwin(nm,width,height) {
   var name=nm;
   if (pop && !pop.closed) {
      pop.close();
   }
   pop=eval("window.open('"+name+"','NewWIN','chrome[4],toolbar=no,left=5,top=5,width="+width+",height="+height+",directories=no,menubar=no,SCROLLBARS=yes,left=2,right=2')");
   if (!pop.opener) popUpWin.opener = self;
}
function reset(fname) {
   fname.reset();
}
function submit() {
   document.form2.submit();
}
</script>

    <br>
    
	 
 


<% 
Dim EmailID, Feedback, Name, Mail1,Mail2,Mail3,Message
Dim MyBody
Dim MyCDONTSMail
Name=Request.Form("Name")
Feedback=Request.Form("FeedBack")
EmailID=Request.Form("EmailID")
Mail1=Request.Form("Mail1")
Mail2=Request.Form("Mail2")
Mail3=Request.Form("Mail3")
Message=Request.Form("Message")
Name=Replace(Name, "'", "")
EmailID=Replace(EmailID, "'", "")
Mail1=Replace(Mail1, "'", "")
Mail2=Replace(Mail2, "'", "")
Mail3=Replace(Mail3, "'", "")
Message=Replace(Message, "'", "")
Feedback=Replace(Feedback, "'", "")

Dim remoteaddr, remotehost, todayDate
remoteremoteaddr=Request.ServerVariables("REMOTE_ADDR")
remotehost=Request.ServerVariables("REMOTE_HOST")

 'formatting date
  todayDate = (YEAR(now()) & "-" & (Month(now())) & "-" & (DAY(now())))

'Message=Request.Form("Message")

 
ConnObj.Execute "INSERT INTO Feedback(custname, emailid, feedback, addeddate) VALUES ('"&Name&"','"&EmailID&"','"&Feedback&"','"&todayDate&"')"%>

 <span class="Header">Dear <%=Name%>,</span> Thank you very much for your feedback.<BR><BR>

We will respond to this very soon.<BR><BR>
<%Set ConnObj=Nothing%>

<%Dim objCDOMail
'Holds the CDONTS NewMail Object
'Create the e-mail server object
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'Who the e-mail is from
objCDOMail.From = ""&EmailID&""
'Who the e-mail is sent to
objCDOMail.To = "marketing@ITILstudy.com"
'Who the blind copies are sent to
objCDOMail.Bcc = "edusys1@yahoo.com"
'Set the subject of the e-mail
objCDOMail.Subject = "Feedback to ITILstudy.com ( "&Name&" )"
'Set the e-mail body format (0=HTML 1=Text)
objCDOMail.BodyFormat = 0
'Set the mail format (0=MIME 1=Text)
objCDOMail.MailFormat = 0
'Set the main body of the e-mail
objCDOMail.Body = "Feedback from "&Name&" <BR><BR>"&Feedback&""
'Importance of the e-mail (0=Low, 1=Normal, 2=High)
objCDOMail.Importance = 2
'Send the e-mail
'objCDOMail.Send
'Close the server object
Set objCDOMail = Nothing
%>


<%
'Holds the CDONTS NewMail Object
'Create the e-mail server object
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'Who the e-mail is from
objCDOMail.From = "marketing@ITILstudy.com"
'Who the e-mail is sent to
objCDOMail.To = ""&EMailID&""
'Who the blind copies are sent to
objCDOMail.Bcc = "edusys1@yahoo.com"
'Set the subject of the e-mail
objCDOMail.Subject = "Thank you for your feedback to ITILstudy.com ( "&Name&" )"
'Set the e-mail body format (0=HTML 1=Text)
objCDOMail.BodyFormat = 0
'Set the mail format (0=MIME 1=Text)
objCDOMail.MailFormat = 0
'Set the main body of the e-mail
objCDOMail.Body = "Dear "&Name&",<BR><BR>Thank you very much for your feedback to ITILstudy.com : We will be answering back to your queries very soon. <BR><BR>We hope you are enjoying your experience with ITILstudy.com; for queries, please email us at marketing@ITILstudy.com. <BR><BR>Best Regards,<BR>www.ITILstudy.com<BR>A brand of Edusys Services Pvt. Limited<BR>Email: marketing@ITILstudy.com<BR><BR>Feedback from "&Name&" :<BR>"&Feedback&""
'Importance of the e-mail (0=Low, 1=Normal, 2=High)
objCDOMail.Importance = 2
'Send the e-mail
'objCDOMail.Send
'Close the server object
Set objCDOMail = Nothing
%>





 

 
     </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
