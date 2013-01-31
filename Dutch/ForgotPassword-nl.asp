<!--#include virtual="/includes/headermetaDutch.asp"-->
<!--#include virtual="/includes/innerloginbanner.html"-->
<!--<div>
<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td height="235" align="left" valign="top" bgcolor="#FFFFFF">
<table width="95%" border="0" cellspacing="0" cellpadding="8">
  <tr>
    <td width="2%" class="Header"></td>
    <td width="25%" class="PageTitle"></td>
    <td width="73%" class="PageTitle">Forgot Password</td>
  </tr>
  <tr>-->
   
    <br />
<%
DIM strEmail
Dim objCDOMail
strEmail = Request.Form("UserID")
'response.write("started")
IF strEmail <> "" THEN
%>
<!--#INCLUDE file="includes/connection.asp"-->
<%
'response.write("enter")
Dim mySQL, objRS
Dim strPassword

Set objRS = Server.CreateObject("ADODB.Recordset")

mySQL = "SELECT first_name, last_name, payer_email, pass FROM PaypalDB WHERE payer_email = '" & strEmail & "'"
'response.Write(mySQL)

objRS.Open mySQL, ConnObj

%>


    <% IF objRS.EOF THEN  %>
   <%
   'code by chandan it will come here if there is no data in paypaldb table for the email id
   Set objRS1 = Server.CreateObject("ADODB.Recordset")

      mySQL = "SELECT first_name, last_name, email, password FROM Customer_Accounts WHERE email = '" & strEmail & "' And account_type_id=1"
       'response.Write(mySQL)

     objRS1.Open mySQL, ConnObj
if objRS1.eof=false then'record exists in db.

strFirstName = objRs1("first_name")

strLastName = objRs1("last_name")

strUserId = objRs1("email")

strPassword = objRS1("password")




body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/buttons/Email-Header.jpg"" alt=""ITILstudy.com"" /></span><br><hr></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "& strFirstName &" " & strLastName &"<br><br>Your password is "& strPassword &".<br><br>Best Regards,<br><a href=""http://www.ITILstudy.com"" target=""_blank"">www.ITILstudy.com</a><BR>Email: adminsupport@ITIlstudy.com</font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"


'Response.Write(body)

 
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
Set objCDOMail = Nothing
   %>
    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px;">
      <%Response.Write "Uw wachtwoord is verstuurd naar uw e-mailadres" %>
    </td>
    <% else %>
      <% 
		'Response.Write "That email address was not found in our database. Please click back on your browser and enter the email address you registered with."
		%>
		<td width="73%" background="/images/back/left_line.jpg" class="general-body" rowspan="4"><div style="margin-top:-12px;">
                <!-- Content Start From Here-->
				<span class="Error">Het e-mailadres wordt niet geregistreerd bij ons zo, voer e-mailadres dat u heeft geregistreerd bij</span>
                <br>
                <p>Voer uw e-mailadres in om het wachtwoordherstelproces te starten.</p>
				 <form onsubmit="return validate_form(this)" style="margin-left:35px;" method="post" action="ForgotPassword.asp">
				<b>E-mailadres</b><input type="text" style="margin-left:10px;" name="UserID">
				<input type="submit" value="submit" name="submit">             
                  

                 </form>
                    
                    
                    <table width="50%" cellspacing="0" cellpadding="3" border="0" class="general-body">  
                  
                  <tbody><tr>
                    <td></td>
                  </tr>
                 
                </tbody></table>
                <br>
                <div>
                  <p class="general-body"> Neem voor een verdere verduidelijking of meer informatie contact op met  <a href="/dutch/contactus-nl.asp"> ITILstudy.com</a> </p>
                </div>
                <!-- Content End From Here-->
                
              </div>
			  </td>
			  <% END IF 'end of if for customer_account table

			  %>
   
    <%
	
ELSE

strFirstName = objRs("first_name")

strLastName = objRs("last_name")

strUserId = objRs("payer_email")

strPassword = objRS("pass")




body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/buttons/Email-Header.jpg"" alt=""ITILstudy.com"" /></span><br><hr></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "& strFirstName &" " & strLastName &"<br><br>Your password is "& strPassword &".<br><br>Best Regards,<br><a href=""http://www.ITILstudy.com"" target=""_blank"">www.ITILstudy.com</a><BR>Email: adminsupport@ITIlstudy.com</font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"


'Response.Write(body)

'Dim objCDOMail     
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
      <%Response.Write "Uw wachtwoord is verstuurd naar uw e-mailadres" %>
    </td>
    <% END IF %>
	<%

ELSE

'Response.Write "Please click Back on your browser and enter the email address you registered with."

'response.Redirect("/ForgotPassword.asp")
%>
			  <td width="73%" background="/images/back/left_line.jpg" class="general-body" rowspan="4"><div style="margin-top:-12px;">
                <!-- Content Start From Here-->
                <br>
                <p>Voer uw e-mailadres in om het wachtwoordherstelproces te starten.</p>
				 <form onsubmit="return validate_form(this)" style="margin-left:35px;" method="post" action="ForgotPassword.asp">
				<b>E-mailadres</b><input type="text" style="margin-left:10px;" name="UserID">
				<input type="submit" value="submit" name="submit">           
                  

                 </form>
                    
                    
                    
                  <table width="50%" cellspacing="0" cellpadding="3" border="0" class="general-body">    
                  <tbody><tr>
                    <td></td>
                  </tr>
                 
                </tbody></table>
                <br>
                <div>
                  <p class="general-body"> Neem voor een verdere verduidelijking of meer informatie contact op met <a href="/dutch/contactus-nl.asp"> ITILstudy.com</a> </p>
                </div>
                <!-- Content End From Here-->
                
              </div>
			  </td>
<%
END IF
%>
	
  </tr>
  </td>
  
  </tr>
  
</table>
</div>

<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->