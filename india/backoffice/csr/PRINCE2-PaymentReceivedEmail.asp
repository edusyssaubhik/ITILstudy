<%@ Language = "VBScript" %>
<%
'======================================================='
'Written By : Bharath'
'Created Date : 17/02/2012'
'Modified By : Bharath'
'Modified Date : 17/02/2012'
'Description :'
'Purpose : Sending Payment Received Email'
'======================================================='
%>
<%
   If Session("UserId")  = "" Then
     Response.Redirect("/India/backoffice/login.asp")
   Else
%>
<!--#include virtual="/India/connection_global.asp"-->
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

set Rs = Server.CreateObject("ADODB.Recordset")
set Rs1 = Server.CreateObject("ADODB.Recordset")
set Rs2 = Server.CreateObject("ADODB.Recordset")
Set Rs3 = Server.CreateObject("ADODB.Recordset")
Set Rs4 = Server.CreateObject("ADODB.Recordset")

'Retirve The EnrolledUSerId From Courses.asp Page'

rqEnrollUserId  =  Request.Querystring("enrollUserId")


'Currency Format Display Functions'

 Currency_Format_Front = CurrencyFormat_Front(Session("Country"))

 Currency_Format_Back = CurrencyFormat_Back(Session("Country"))
					 
'Sql Query For Retive the Firstname, Lastname and Emailid'

strQuery = "SELECT id,firstname,lastname,email,nameofemployeer,phoneno,coursedate,coursedetails,PRINCE2Manual,courseid,amount,VAT,VAT_Invoice,PRINCE2price from prince2_enrolledusers WHERE id = '" & rqEnrollUserId & "'"

Rs.Open strQuery,ConnObj

Do Until Rs.EOF

 Session("ID") = Rs("id")
 Session("FirstName") = Rs("firstname")
 Session("Lastname")  = Rs("lastname")
 Session("EmailId")   = Trim(Rs("email"))
 Session("NameOfEmployer")   = Rs("nameofemployeer")
 Session("PhoneNo")   = Rs("phoneno")
 Session("Coursedetails")   = Rs("coursedetails")
 Session("EmailId")   = Rs("email")
 Session("CourseDate") = Rs("coursedate")
 Session("PMBOK") = Rs("PRINCE2Manual")
 Session("courseid") = Rs("courseid")
 Session("Total") = Rs("amount")
 Session("VAT") = Rs("VAT")
  Session("VATInvoice") = Rs("VAT_Invoice")
  Session("PRINCE2price") = Rs("PRINCE2price")
  
  If (Session("country") = "United Kingdom" OR Session("country") = "Germany" OR Session("country") = "Netherlands" OR Session("country") = "India" OR Session("country") = "Australia") Then
							
	If Not IsNull(Rs("VAT")) Then
	
	VAT = Rs("VAT")
	
	Else
	
	VAT = 0
	
	End If
	
	If Session("PRINCE2price")  <> "" Then
	Session("TotalPrice") = Int(Rs("Amount")) + Int(VAT) + Int(Rs("PRINCE2price"))
	Else
	Session("TotalPrice") = Int(Rs("Amount")) + Int(VAT) 
	End If
	
	Session("DisAmount") = Rs("Amount")
	Session("VAT") = VAT
	
 Else 

	Session("Total") = Rs("Amount")
	
 End If
  
 '  If Session("country") = "United Kingdom" AND Session("VAT") <> ""  Then
' Session("TotalUK") = cint(Session("Total"))+cint(Session("PRINCE2price"))+cint(Session("VAT"))
' ElseIf Session("country") = "India"  Then
' Session("TotalPrice") = Int(Session("Total"))+Int(Session("PRINCE2price"))+Int(Session("VAT"))
' ElseIf Session("country") = "Australia" Then
' Session("TotalPrice") = cint(Session("Total"))
' End If
Rs.Movenext
Loop

Rs.Close

''  
'Sql Query For Retive the Firstname, Lastname and Emailid'
'strQuery = "SELECT payer_email,date_entered,date_valid,ITIL_code from ITIL_blended WHERE payer_email = '" & Session("EmailId") & "'"
'Rs4.Open strQuery,ConnObj
'
'Do Until Rs4.EOF
'
' Session("payer_email") = Rs4("payer_email")
' Session("date_entered")  = Rs4("date_entered")
' Session("date_valid")   = Rs4("date_valid")
' Session("ITIL_code")   = Rs4("ITIL_code")
' 
'Rs4.Movenext
'Loop
'Rs4.Close
  

'SQL Query For Retrieve The Prices and Put Into Email'

 strQuery1 = "SELECT * FROM prince2_course Where courseid = '" & Session("courseid") & "'"
 Rs1.Open strQuery1,ConnObj

 Do until Rs1.EOF
	
	StartDate = Rs1("startdate")
	City      = Rs1("city")
	Tax = Rs1("tax")

 Rs1.movenext
 Loop
 
 Rs1.Close

rqType = Request.QueryString("type")

      If Session("country") <> "United Kingdom" Then 
 subject="Payment Received"
      ElseIf Session("country") = "United Kingdom" Then 
  subject=" VAT INVOICE" 
      End If 

 body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF"">" 
						IF Session("country") = "India" Then
						body= body & "<span><img src=""http://www.PMstudy.com/images/banners/PRINCE2_email_headerIN.jpg"" alt=""PMstudy"" /></span>" 
						ElseIf Session("country")="United Kingdom" Then 
						body= body &"<span><img src=""http://www.PMstudy.com/images/banners/PRINCE2_email_headerUK.jpg"" alt=""PMstudy"" /></span>"
						ElseIf Session("country")="Australia" Then
						body= body &"<span><img src=""http://www.PMstudy.com/images/banners/email_headerAUS.jpg"" alt=""PMstudy"" /></span>"
						Else
						body= body &"<span><img src=""http://www.PMstudy.com/images/banners/PRINCE2_email_headerUK.jpg"" alt=""PMstudy"" /></span>"
						End if
						body= body &"</td></tr>"
						
				If Session("country")<> "United Kingdom" And Session("country")<> "Australia" Then 
				
					  body = body & "<tr><td><table align=""center"" border=""0"" width=""580px""><tr><td align=""center""><font face=""Arial"" size=""3"" color=""#0359b4""><b>Payment Receipt</b></font></td></tr>"
					  
			   ElseIf Session("country") = "United Kingdom" Then 
			   
					body = body & "<tr><td><table align=""center"" border=""0"" width=""580px""><tr><td align=""center""><font face=""Arial"" size=""3"" color=""#0359b4""><b>VAT INVOICE</b></font></td></tr>"
					
			   ElseIf Session("country") = "Australia" Then 
			   
					body = body & "<tr><td><table align=""center"" border=""0"" width=""580px""><tr><td align=""center""><font face=""Arial"" size=""3"" color=""#0359b4""><b>GST INVOICE</b></font></td></tr>"
					
			   End If
			   
  body = body & "<tr><td align=""right"" colspan=""2""><font face=""Arial"" size=""2""><b>" & FormatDateTime(Now(),1) & "</b></font>"
  
  If Session("country") = "United Kingdom" OR Session("country") = "Germany" OR Session("country") = "Netherlands" Then
  
  body = body & "<br><font face=""Arial"" size=""2""><b>Invoice #: PMPPRINCE2" & Session("VATInvoice") &"</b></font>"
  
  End If
  
  body = body & "</td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Enroll ID : " & Session("ID") & "</font></td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name : " & Session("FirstName") & "&nbsp; " & Session("Lastname") & "</font></td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Email : " & Session("EmailId") & " </font></td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Phone Number : " & Session("PhoneNo") & "</font></td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name of Employer/Business : " & Session("NameOfEmployer") & "</font></td></tr>"
  body = body & "<tr><td align=""left""><br><font face=""Arial"" size=""2"">Thank you for enrolling in PMstudy.com classroom training.</font></td></tr>"
  body = body & "<tr><td align=""left"" colspan=""2""><br><font face=""Arial"" size=""2"">Details of your course and Payment:</font><br><table border=""1"" cellspacing=""0"" align=""center"" width=""570px"">"
  
  body = body & "<tr><td width=""60%""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Details</font></b></td><td width=""15%"" align=""center""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Payment</font></b></td></tr>"
  
  body = body & "<tr><td><font face=""Arial"" size=""2""><b>PMstudy Classroom Training<br>" & Session("Coursedetails") & "</b>"
  
'Without VAT'  
If Session("VAT") <> "" AND Session("VAT") <> 0  Then 

	If Session("country") = "United Kingdom" OR Session("country") = "Germany" OR Session("country") = "Netherlands"  Then 
	
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("Total") ) & " " & Currency_Format_Back
		body = body &"</b></td></tr>"
		
		'PRINCE2 manual price display'
		If Session("PMBOK") = "Yes" Then
		body = body &"<tr><td><font face=""Arial"" size=""2""><b>PRINCE2 Manual Price <font color=""red"">*</font> </b>"
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		 body = body & Currency_Format_Front & " " & FormatNumber(Session("PRINCE2price")) & "" & Currency_Format_Back
		body = body &"</b></td></tr>"
		End If
		
		'VAT'
		body = body &"<tr><td><font face=""Arial"" size=""2""><b> VAT: @ 20% <font color=""red"">*</font> </b>"
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("VAT")) & "" & Currency_Format_Back
		body = body &"</b></td></tr>"
		
		'Total price'
		body = body & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("TotalPrice")) & " " & Currency_Format_Back
		body = body & "</b></font></td></tr></table><br></td></tr>"	
	
	'Bharath Code'
	
	ElseIf  Session("country") = "Australia"  Then 
	
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("Total") ) & " " & Currency_Format_Back
		body = body &"</b></td></tr>"
		
		'GST'
		body = body &"<tr><td><font face=""Arial"" size=""2""><b> GST: @ 10% <font color=""red"">*</font> </b>"
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("VAT")) & "" & Currency_Format_Back
		body = body &"</b></td></tr>"
		
		'Total price'
		body = body & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("TotalPrice")) & " " & Currency_Format_Back
		body = body & "</b></font></td></tr></table><br></td></tr>"	
		
	ElseIf  Session("country") = "India"  Then 
	
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("Total") ) & " " & Currency_Format_Back
		body = body &"</b></td></tr>"
		
		'PRINCE2 manual price display'
		If Session("PMBOK") = "Yes" Then
		body = body &"<tr><td><font face=""Arial"" size=""2""><b>PRINCE2 Manual Price <font color=""red"">*</font> </b>"
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		 body = body & Currency_Format_Front & " " & FormatNumber(Session("PRINCE2price")) & "" & Currency_Format_Back
		body = body &"</b></td></tr>"
		End If
	
		'Tax'
		body = body &"<tr><td><font face=""Arial"" size=""2""><b>Tax: @ 10.3%<font color=""red"">*</font> </b>"
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		 body = body & Currency_Format_Front & " " & FormatNumber(Session("VAT")) & "" & Currency_Format_Back
		body = body &"</b></td></tr>"
		
		'Total price'
		body = body & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("TotalPrice")) & " " & Currency_Format_Back
		body = body & "</b></font></td></tr></table><br></td></tr>"	
		
	End If

'Without VAT'
ElseIf Session("VAT") = 0  Or ISNull(Session("VAT")) Or Session("VAT") = "" Then 


	  If Session("country") = "Australia"  Then 
	
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("Total") ) & " " & Currency_Format_Back
		body = body &"</b></td></tr>"
		
		'Total price'
		body = body & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("Total")) & " " & Currency_Format_Back
		body = body & "</b></font></td></tr></table><br></td></tr>"	
	
	
	
	  ElseIf Session("country") = "United Kingdom" OR Session("country") = "Germany" OR Session("country") = "Netherlands" Then
	
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("Total")) & " " & Currency_Format_Back
		body = body &"</b></td></tr>"
		
		'PRINCE2 manual price display'
		If Session("PMBOK") = "Yes" Then
		body = body &"<tr><td><font face=""Arial"" size=""2""><b>PRINCE2 Manual Price <font color=""red"">*</font> </b>"
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		 body = body & Currency_Format_Front & " " & FormatNumber(Session("PRINCE2price")) & "" & Currency_Format_Back
		body = body &"</b></td></tr>"
		End If
		
		'Total price'
		body = body & "<tr><td colspan=""2"">&nbsp;</td></tr>"
		body = body & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("TotalPrice")) & " " & Currency_Format_Back
		body = body & "</b></font></td></tr></table><br></td></tr>"				   				   
	
	ElseIf Session("country") = "India"  Then 
	
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("Total")) & " " & Currency_Format_Back
		body = body &"</b></td></tr>"
		
		'PRINCE2 manual price display'
		If Session("PMBOK") = "Yes" Then
		body = body &"<tr><td><font face=""Arial"" size=""2""><b>PRINCE2 Manual Price <font color=""red"">*</font> </b>"
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		 body = body & Currency_Format_Front & " " & FormatNumber(Session("PRINCE2price")) & "" & Currency_Format_Back
		body = body &"</b></td></tr>"
		End If
		
		'Total price'
		body = body & "<tr><td colspan=""2"">&nbsp;</td></tr>"
		body = body & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("TotalPrice")) & " " & Currency_Format_Back
		body = body & "</b></font></td></tr></table><br></td></tr>"		
	
					   
	End If

End If 

  body = body &"<tr><td><font color=""red"">*</font> VAT Registration Number: GB 117 6616 13<br></td></tr>"

  body = body & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><br>We acknowledge with thanks receipt of your cheque number -------------- dated ----------- towards the course fee for PMstudy classroom training program to be held on <b>"& FormatDateTime(StartDate,1) &"</b></font><br><br></td></tr>"
  
  body = body & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><br>For PMstudy classroom training programs terms and conditions, please visit the link - <a href=""http://www.PMstudy.com/termsAndConditions.asp"" target=""_blank"">http://www.PMstudy.com/termsAndConditions.asp</a>.</font></td></tr>"
  
  body = body & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><br>We look forward to your participation in our PMstudy classroom program.</font></td></tr>"  
  body = body & "<tr><td colspan=""3""><br><font face=""Arial"" size=2><b>Best Regards,</b></td></tr>"
  
  body = body & "<tr><td colspan=""3""><br><font face=""Arial"" size=2>Customer Support</td></tr>"
  
  body = body & "<tr><td colspan=""3""><font face=""Arial"" size=2>PMstudy.com</td></tr>"
  
 
 body = body & " <tr><td colspan=""3""><hr></hr></td></tr><tr><td align=""center""><font size=""1px"">Edusys Services Private Limited<br>29th Floor | One Canada Square | Canary Wharf | London - E14 5DY | United Kingdom<br>Phone: 020-79568922<br>Email: sales@pmstudy.com, Website: www.PMstudy.com<br>PRINCE2<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.<br>The Swirl logoT is a trade mark of the Cabinet Office.</font></td></tr>"
 
  body = body & "</table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr>"
  
  
  	   
If rqType = "preview" then
	
'Retrive The EnrollUserId,subject and body from this Page'

   rqEnrollUserId = Request.Form("enrollUserId")
   rqCity = Request.Form("city")
   subject = Request.form("subject")
   body    = Request.form("QueryReply")

End If

'Send Email'

if rqType = "sendmail" Then

   Dim objCDOMail
   Dim rqBody
   Dim rqSubject

'Retrive The enrolluserid from this page'  
 
   rqEnrollUserId = Request.Form("enrolluserid")
   rqCity = Request.Form("city")
   rqBody    =  Request.Form("body")
   rqSubject =  "Payment Received"
   rqSendEmail = Request.Form("emailid")
   
 

	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")

	objCDOMail.From = "sales@pmstudy.com"

	objCDOMail.To =  rqSendEmail
	
	'If Session("country") is India then cc send to salesindia@pmstudy.com otherwise send to marketing@pmstudy.com'
	
	objCDOMail.Cc = "sales@pmstudy.com"

	
	objCDOMail.Bcc = "t_satpathy@yahoo.com, edusysanusuya@gmail.com, edusysrashmi@gmail.com, edusysrohan@gmail.com, edusysnikhil@gmail.com" 
	
	'Importance of the e-mail (0=Low, 1=Normal, 2=High)
	
	objCDOMail.Importance = 2
	
	objCDOMail.Subject = rqSubject

	objCDOMail.BodyFormat = 0

	objCDOMail.MailFormat = 0

	objCDOMail.Body = rqBody

	objCDOMail.Send

	Set objCDOMail = Nothing
	
'Sql Query For If You Send Email I am entering into database 1 for in courses.asp Page we want display a message "Check received email sent"'

    strQuery2 = "Update prince2_enrolledusers Set checkrecmailsent = '1' where  id = '" & rqEnrollUserId & "'"
	
    Rs2.Open strQuery2,ConnObj
	
    Response.write("Successfully send mail")
    
	
Else


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Payment Received Mail</title>
<link href="./css/pagestyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="htMap">
  <table width="700" height="580" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#00B0EC" class="dbborder" >
    <tr>
      <td width="547" valign="top"><table width="100%" cellspacing="0" cellpadding="2">
          <form id="form1" name="form1" method="post" action="PRINCE2-PaymentReceivedEmail.asp?type=preview">
            <input type="hidden" name="enrollUserId" value="<%= rqEnrollUserId %>" />
            <input type="hidden" name="city" value="<%= City %>" />
            
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
                <%= rqSendEmail %>
                ></td>
            </tr>
            <tr class="rowOdd">
            
              <td>Subject : </td>
              <% If Session("country") <> "United Kingdom" Then %>
               <td> Payment Received </td> 
                <% ElseIf Session("country") = "United Kingdom" Then %>
              <td> VAT INVOICE </td>
              <% End If %>
            </tr>
            <tr class="rowEven">
              <td colspan="2"><textarea name="QueryReply" cols="90" rows="25"><%= body %></textarea>
              </td>
            </tr>
            <tr class="rowEven">
              <td>&nbsp;</td>
              <td></td>
            </tr>
            <tr class="rowOdd">
              <td colspan="2" align="center"><input name="Submit" type="submit" class="buttonc" value="Preview" /></td>
            </tr>
          </form>
          <form  method="post" action="PRINCE2-PaymentReceivedEmail.asp?type=sendmail">
            <input type="hidden" name="body" value='<%= body %>' />
            <input type="hidden" name="enrolluserid" value="<%= rqEnrollUserId %>" />
            <input type="hidden" name="emailid" value="<%= Session("EmailId") %>" />
            <input type="hidden" name="city" value="<%= rqCity %>" />
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
              <td colspan="2" align="center"><input type="submit" class="buttonc" name="sendmail" value="Send Mail" />
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
				Response.write(body)%></td>
    </tr>
    <% End If %>
  </table>
</div>
</body>
</html>
<%	End If
End If
%>
