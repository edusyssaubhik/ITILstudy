<%@ Language = "VBScript" %>
<%
 'Written By : Bharath'
 'Created Date: 12/11/2007'
 'Modified By : Bharath'
 'Last UpaDated: 04/02/2012'
 'Description :'
 'Purpose : Sending Payment Received Email'
%>
<%
   If Session("UserId")  = "" Then
     Response.Redirect("../login.asp")
   Else
%>
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/connectionRef.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<%
''Declare The Variables
Dim rqEnrollUserId
Dim rqFirstName
Dim rqLastName
Dim rqType
Dim subject
Dim body
Dim rqTempNo
Dim StrQuery1,strQuery2
Dim FirstName
Dim LastName
Dim EmailId
Dim rqEnrollEmailId
Dim CourseDate,str,startDate,i,sstartDate
Dim Rs1
Dim todaysDate
Dim rqEmail,rqPhoneNumber,rqNameOfEmployeer,rqCourseDetails,dtax,coursePrice
Dim Total,Date2
Dim str1,str2,Price,rqSendEmail,City,rqCity

Set Rs = Server.CreateObject("ADODB.Recordset")
set Rs1 = Server.CreateObject("ADODB.Recordset")
set Rs2 = Server.CreateObject("ADODB.Recordset")
Set Rs3 = Server.CreateObject("ADODB.Recordset")

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "")
End Function


'Retirve The EnrolledUSerId From Courses.asp Page'

rqEnrollUserId  =  Request.Querystring("enrollUserId")

'Currency Format Display Functions'

 Currency_Format_Front = CurrencyFormat_Front(Session("Country"))

 Currency_Format_Back = CurrencyFormat_Back(Session("Country"))
					 
'Sql Query For Retive the Firstname, Lastname and Emailid'

strQuery = "SELECT id,firstname,lastname,email,nameofemployeer,phoneno,coursedate,coursedetails,pmbok,courseid,amount , VAT, VAT_Invoice from ITIL_enrolledusers WHERE id = '" & rqEnrollUserId & "'"
'response.Write(strQuery)
Rs.Open strQuery,ConnObj

Do Until Rs.EOF

 Session("ID") = Rs("id")
 Session("FirstName") = Rs("firstname")
 Session("Lastname")  = Rs("lastname")
 Session("EmailId")   = Trim(Rs("email"))
 Session("NameOfEmployer")   = StrQuoteReplace(Rs("nameofemployeer"))
 Session("PhoneNo")   = Rs("phoneno")
 Session("Coursedetails")   = Rs("coursedetails")
 'Session("EmailId")   = Rs("email")
 Session("CourseDate") = Rs("coursedate")
 Session("PMBOK") = Rs("pmbok")
 Session("courseid") = Rs("courseid")
 Session("DisAmount") = Rs("Amount")
 Session("VATInvoice") = Rs("VAT_Invoice")
 
 

Rs.Movenext
Loop

Rs.Close

'SQL Query For Retrieve The Prices and Put Into Email'
'response.Write("Hiiii")

rqType = Request.QueryString("type")


 subject="Welcome to our Industry leading Referral Program and earn Unlimited Benefits "


%>
<!--#include virtual="/includes/GenRefTag.asp"-->
<%


  Body =  "<table width=""100%"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td>&nbsp;</td></tr><tr><td><table width=""500px"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""595px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""MyITstudy "" width=""600px"" height=""103"" /></span></td></tr><tr><td><table width=""600px"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12""><tr><td><font face=""Arial"" size=""2"">Dear " & Session("FirstName") & " " & Session("Lastname") & ",<br><br>Thank you for choosing MyITstudy- the leading ITIL Exam Prep training provider. <br><br>While you embark on your journey, we invite you to our industry leading referral program. You can now help your friends/colleagues to get the best of exam prep training for the prestigious ITIL certification while both you and your friends/colleagues earn attractive rewards along the way. And the benefits are unlimited - you can refer as many friends/colleagues as you want!<br/><br/><b>Here is how the referral scheme works:</b><br/><br/>If a friend/colleague you refer to MyITstudycompletes the ITIL Exam Prep classroom course with us, within 6 months of receiving this email, you will earn <b>gift voucher, from www.amazon.com</b>, worth <b>$50 and your friend</b> will get a <b>discount of $50</b> on the classroom program fee.<br/><br/>Once your friend/colleague completes the classroom program, you will receive the gift voucher.<br/><br/>All you have to do is click <a href = ""http://www.MyITstudy.com/refer-friends.asp?refEmail="&Session("EmailId")&""" target = ""_blank"">here</a>  to refer your friends/colleagues or share this link with them through email, Twitter, or Facebook or LinkedIn: <b>http://www.MyITstudy.com/referral.asp?tag="&GenTag&"</b><br/><br/><b>Remember</b>: Your friend/colleague should use the above link to enroll to get the referral benefits. For terms and conditions, <a href=""/termsAndConditions.asp"" target=""_blank""> please click here.</a><br/><br/>If you have any questions, feel free to email us at <a href=""mailto:marketing@MyITstudy.com "">marketing@MyITstudy.com </a>.<br/><br/>Best Regards,<br/><br/>Marketing Team<br/>marketing@MyITstudy.com </td></tr></table></td></tr></table></td></tr></table>"


'Response.Write(body)


	   
If rqType = "preview" then
	
'Retrive The EnrollUserId,subject and body from this Page'

   rqEnrollUserId = Request.Form("enrollUserId")
   rqCity = Request.Form("city")
   rqSubject = Request.form("subject")
   body    = Request.form("QueryReply")

End If

'Send Email'

if rqType = "sendmail" Then

   Dim objCDOMail
   Dim rqBody
   Dim rqSubject

'Retrive The enrolluserid from this page'  
 
   rqEnrollUserId = Request.Form("enrolluserid")
   rqBody    =  Request.Form("body")
   rqSubject =  "Welcome to our Industry leading Referral Program and earn Unlimited Benefits "
   rqSendEmail = Request.Form("emailid")



'Response.Write(rqBody&"<br>"&rqSendEmail)

	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
	objCDOMail.From = """Marketing"" marketing@MyITstudy ITIL.com"
 	objCDOMail.To = Session("EmailId")
	
	objCDOMail.Cc = "marketing@MyITstudy.com "
	objCDOMail.Importance = 2
	objCDOMail.Subject = "Welcome to our Industry leading Referral Program and earn Unlimited Benefits "
	objCDOMail.BodyFormat = 0
	objCDOMail.MailFormat = 0
	objCDOMail.Body = rqBody
	objCDOMail.Send
	Set objCDOMail = Nothing
	
		
	   Response.write("Successfully send mail")
	
Else


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Payment Received Mail</title>
<link href="../../css/pagestyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="htMap">
  <table width="700" height="580" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#00B0EC" class="dbborder" >
    <tr>
      <td width="547" valign="top"><table width="100%" cellspacing="0" cellpadding="2">
          <form id="form1" name="form1" method="post" action="Referral_sendmail.asp?type=preview">
            <input type="hidden" name="enrollUserId" value="<%= rqEnrollUserId %>" />
            <tr>
              <td colspan="2" bgcolor="#00B0EC">Send Payment Received Mail </td>
            </tr>
            <tr class="rowEven">
              <td width="28%">To : </td>
              <td width="72%"><% = Session("FirstName") %>
                &nbsp;
                <% = Session("LastName") %>
                <
                <% = Session("EmailId") %>
                ></td>
            </tr>
            <tr class="rowOdd">
              <td>Subject : </td>
              <td><% = subject %></td>
            </tr>
            <tr class="rowEven">
              <td colspan="2"><textarea name="QueryReply" cols="90" rows="25"><%= body %></textarea>
              </td>
           
            <tr class="rowEven">
              <td>&nbsp;</td>
              <td></td>
            </tr>
            <tr class="rowOdd">
              <td colspan="2" align="center"><input name="Submit" type="submit" class="buttonm" value="Preview" /></td>
            </tr>
          </form>
          <form  method="post" action="Referral_sendmail.asp?type=sendmail">
            <input type="hidden" name="body" value='<%= body %>' />
            <input type="hidden" name="enrolluserid" value="<%= rqEnrollUserId %>" />
            <input type="hidden" name="emailid" value="<%= Session("EmailId") %>" />
            <tr class="rowEven">
              <td colspan="2">&nbsp;</td>
            </tr>
            <tr class="rowEven">
              <td colspan="2" bgcolor="#00B0EC">Send Mail </td>
            </tr>
            <tr class="rowEven">
              <td>&nbsp;</td>
              <td></td>
            </tr>
            <tr class="rowOdd">
              <td colspan="2" align="center"><input type="submit" class="buttonm" name="sendmail" value="Send Mail" />
              </td>
            </tr>
          </form>
          <tr class="rowEven">
            <td colspan="2">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <% if rqType = "preview" Then %>
    <tr>
      <td colspan="3"><%Response.write(subject & "<br/><br/>")
				Response.write(body)%> </td>
    </tr>
   
    <% End If %>
  </table>
</div>
</body>
</html>
<%	End If
End If
%>






