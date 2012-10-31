<%@ Language = "VBScript" %>
<% 'OPTION EXPLICIT %>
<%
 'Written By : Bharath'
 'Created Dated: 01/11/2007'
 'Modified By : Priyanka'
 'Last UpaDated: 18/02/2011'
 'Description :'
 'Purpose : Sending Course Details Email'
%>
<%
   If Session("UserId")  = "" Then
     Response.Redirect("../login.asp")
   Else
%>
<!--#include virtual="/india/connection-PROJ.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<%
''Declare The Variables
Dim PICode,PINameFirst,PINameLast,PICompany,PITelephone,PIPlace,PIDate,PIPrice,PIAmount,PIPercentage,PIPMBOK,PIPMBOKValue,body
Dim Rs1,Rs2,rqType,arrAllNames,courseDate,str,i,startDate,endDate,sstartDate,eendDate,subject,startingHour,rqCourseId
Dim startingMinute,startingSession,endingHour,endingMinute,endingSession,hotelName,hotelAddress,hotelURL,hotelPhoneNo,rqEmailId,strQuery1,priceAfterDiscount,priceWithTax,total,rqTax,courseDetails1,courseDetails2,courseDetails,newCourseDetails,todaysDate,rqStartDate,objCDOMail
Dim Currency_Format_Front
Dim Currency_Format_Back
Dim strCountryDetails
Dim PaymentsAfterEnroll
Dim PayOption1
Dim PayOption2

rqType = Request.QueryString("type")

Set Rs1 = Server.CreateObject("ADODB.Recordset")
	
'Dispaly The Today Date'

  todaysDate=now()
  
'Currency Format Display Functions'

 Currency_Format_Front = CurrencyFormat_Front(Session("Country"))

 Currency_Format_Back = CurrencyFormat_Back(Session("Country"))
 
 'Retrive Values'  
  	
	PICode 				= Request.Form("PICode")
	PINameFirst 		= Replace(Request.Form("PINameFirst"), "'", "")
	PINameLast 			= Replace(Request.Form("PINameLast"), "'", "")
	PICompany 			= Request.Form("PICompany")
	PITelephone 		= Request.Form("PITelephone")
	PIPlace 			= Request.Form("PIPlace")
	PIDate 				= Request.Form("PIDate")
	PIPrice 			= Request.Form("PIPrice")
	PIAmount 			= Request.Form("PIAmount")
	PIPercentage 		= Request.Form("PIPercentage")
	PIPMBOK 			= Request.Form("PIPMBOK")
	PIPMBOKValue 		= Request.Form("PIPMBOKValue")
	priceAfterDiscount 	= Request.Form("priceAfterDiscount")
	priceWithTax   		= Request.Form("priceWithTax")
	total   		    = Request.Form("total")
	rqTax				= Request.Form("tax")
	rqEmailId  			= Request.Form("emailId")
    rqCourseId 			= Request.Form("courseId") 
	rqStartDate         = Request.Form("startDate")	
	
	'Response.Write("Test"rqStartDate)
	
	  
	Session("FirstName") = PINameFirst
   Session("LastName")  = PINameLast
   Session("EmailId")  = rqEmailId
 
	courseDetails = Split(session("coursedetails"),"for")
	
	For i = 0 to Ubound(courseDetails)
   		courseDetails1 = courseDetails(0)
   		courseDetails2 = courseDetails(1)
	Next
	

If (Session("Country") = "United Kingdom" OR Session("Country") = "India" OR Session("Country") = "Australia" ) Then
		
		VAT_Cal1 = ((CInt(priceAfterDiscount) * Cdbl(rqTax)) / 100)
		
		VAT_Cal2 = Cdbl(VAT_Cal1)
		
		If VAT_Cal2 = Fix(VAT_Cal2) Then
		VAT = VAT_Cal2
		Else
		VAT = Fix(VAT_Cal2) + 1
		End If		
		
		total = (priceAfterDiscount + VAT)			
		
	End If
			
	 'For display the course details formatting the course like Raleigh : Saturday, April 17, 2010 to Tuesday, April 20, 2010 for $ 1,800.00'
	 If (Session("Country") = "United Kingdom" OR Session("Country") = "India" OR Session("Country") = "Australia" ) Then
 
	 	newCourseDetails =  Coursedetails1 & " for " & Currency_Format_Front & " " & priceAfterDiscount & " " & Currency_Format_Back
	 
	 Else
	 
		 newCourseDetails =  Coursedetails1 & " for " & Currency_Format_Front & " " & priceWithTax & " " & Currency_Format_Back

	 End If
	
	 
	
	
	strCountryDetails = "SELECT * FROM proj_countrydetails WHERE country = '" & Session("Country") & "' AND id = (SELECT MAX(id) FROM proj_countrydetails WHERE country = '"& Session("Country") &"')"
					
	Rs.Open strCountryDetails,conn

	Do Until Rs.EOF 
		
		PaymentsAfterEnroll = Rs("paymentsafterenroll")
		PayOption1 = Rs("PayOpt1")
		PayOption2 = Rs("PayOpt2")
	
	Rs.Movenext
	Loop
    
	Rs.Close
	
	strQuery1 = "Update PROJITIL_enrolledusers Set "
	If (Session("Country") = "United Kingdom" OR Session("Country") = "India" OR Session("Country") = "Australia" ) Then
 	strQuery1 = strQuery1 & " amount = '"& priceAfterDiscount &"', VAT = '"& VAT &"'"
	Else
 	strQuery1 = strQuery1 & " amount = '"& priceWithTax &"'"
	End If
	
	strQuery1 = strQuery1 &",pmbok = '"& PIPMBOK &"' , coursedetails = '"& newCourseDetails &"',discountpercentage = '"&  PIPercentage &"',pmbokprice = '"& PIPMBOKValue &"'   where id = '" & PICode & "'"

 	Rs1.Open strQuery1,Conn

 
	 	
 subject="PROFORMA INVOICE"

	  body = "<table width=""100%"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr height=""45px""><td> </td></tr><tr><td><table width=""600px"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""595px"" bgcolor=""#FFFFFF""><span><img src=""http://www.PROJstudy.com/images/banners/email_headerUK.jpg"" alt=""PROJstudy"" width=""600px"" height=""103"" /></span></td></tr>"
	  body = body & "<tr><td align=""center"" colspan=""2"" width=""560px""><table border=""0"" align=""center"" width=""560px""><tr><td align=""center""><br><br><font face=""Arial"" size=""3"" color=""#0359b4""><b>PROFORMA INVOICE</b></font></td></tr>"
	  body = body & "<tr><td align=""right"" colspan=""2""><font face=""Arial"" size=""2""><b>" & FormatDateTime(todaysDate,1) & "</b></font></td></tr>"
	  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Enroll ID: " & PICode & "</font></td></tr>"
	  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name: " &  Session("FirstName") & " " & Session("LastName") & "</font></td></tr>"
	  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Email: " & Session("EmailId") & " </font></td></tr>"
	  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Phone Number: " & PITelephone & "</font></td></tr>"
	  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name Of Employer/Business: " & PICompany & "</font></td></tr>"
	  body = body & "<tr><td align=""left""><br><font face=""Arial"" size=""2"">Thank you for enrolling in PROJstudy.com ITIL classroom training.</font></td></tr>"
	  body = body & "<tr><td align=""left"" colspan=""2""><br><font face=""Arial"" size=""2"">Details of your course and Payment:</font><br><table border=""1"" cellspacing=""0"" align=""center"" width=""560px"">"
	  body = body & "<tr><td width=""60%""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Details</font></b></td><td width=""15%"" align=""center""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Payment</font></b></td></tr>"
	  body = body & "<tr><td><font face=""Arial"" size=""2""><b>PROJstudy ITIL Classroom Training"
	'  If Session("country") = "India" Then
'	  body = body & "2"
'	  Else
'	  body = body & "4"	  
'	  End If
	  body = body & " <br> " & newCourseDetails & "</b>"
	  
	  If Session("Country") = "India" Then
	  body = body &"<br>(This includes " & rqTax & "% service tax)"
	  End If
	  
	  	  'If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Germany") Then
	  If (Session("Country") = "United Kingdom" OR Session("Country") = "India" OR Session("Country") = "Australia" ) Then
	  
	  body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
	  body = body & Currency_Format_Front & " " & FormatNumber(priceAfterDiscount) & " " & Currency_Format_Back
	  body = body &"</b></td></tr>"
	  If (Session("Country") = "United Kingdom" ) Then
	  body = body & "<tr><td><font face=""Arial"" size=""2""><b>VAT @ " & rqTax & "%</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
	  ElseIf (Session("Country") = "Australia" ) Then
	  body = body & "<tr><td><font face=""Arial"" size=""2""><b>GST @ " & rqTax & "%</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
	  ElseIf (Session("Country") = "India") Then
	  body = body & "<tr><td><font face=""Arial"" size=""2""><b>" & rqTax & "% tax</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"	  
	  End If
	  body = body & Currency_Format_Front & " " & FormatNumber(VAT) & " " & Currency_Format_Back & "</b></font></td></tr>"		  
	  body = body & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
	  body = body & Currency_Format_Front & " " & FormatNumber(total) & " " & Currency_Format_Back & "</b></font></td></tr>"
	  Else
	  body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
	  body = body & Currency_Format_Front & " " & FormatNumber(total) & " " & Currency_Format_Back
	  body = body &"</b></td></tr>"
	  body = body & "<tr><td colspan=""2"">&nbsp;</td></tr>"		  
	  body = body & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
	  body = body & Currency_Format_Front & " " & FormatNumber(total) & " " & Currency_Format_Back & "</b></font></td></tr>"
	  End If
	  body = body & "</table><br></td></tr>"
	  body = body & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><b>Please Note:</b></font><br><br>"
	  body = body & "<font face=""Arial"" size=""2"">Full payment of the enrollment fee <b>(" & Currency_Format_Front & " " & FormatNumber(total) & " " & Currency_Format_Back & "</b>)"
	 
	 
	  body = body & " should be done through <br><br></td></tr><tr><td>"
	  
	  If Session("country") = "United Kingdom"  Then
	  body = body & "<ul type=""disc""><li><font face=""Arial"" size=""2""><b>Google Checkout: </b></font>"
	  body = body & "<a href=""http://www.PROJstudy.com/ITIL/payment.asp?enrollUserID="& PICode &"&Country="& Session("country") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><b>Buy Now</b></font></a></li><br>"
	  body = body & "<li><font face=""Arial"" size=""2""><b>PayPal: </b></font>"
	  body = body & "<a href=""http://www.PROJstudy.com/ITIL/payment.asp?enrollUserID="& PICode &"&Country="& Session("country") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><b>Buy Now</b></font></a></li></ul>"
	  End If
	  If Session("country") = "India" Then
	 
	  body = body & "<ul><li> <span>Cheque</span> or <span > Demand Draft</span> favouring <span> ""EDUSYS SERVICES PVT LIMITED""</span><br /><br /><span>This should be couriered to the following address:</span><br /><br /><span>Edusys Services Pvt Limited</span>,<br>#27,2<sup>nd</sup> Floor,</br>Santosh Towers,<br />J.P. Nagar 4<sup>th</sup> Phase,<br>4<sup>th</sup> Main,100 Ft. Ring Road<br>Bangalore 560078<br />India<br /><br />Ph:+91 80 4155 75 47/48/49<br><br /></li><li><span>Bank Transfer: </span><span >Payee Name:  </span>EDUSYS SERVICES PVT LIMITED <br /><span>Bank Name :  </span>ICICI Bank Limited<br /><span>Account Number :  </span>ICICI Bank A/c No : 0401 0500 0128<br /><span>Branch Name :  </span>ICICI Bank, J.P. Nagar Branch, Bangalore</li></ul>"
					  
		  body = body & "<span><br>Alternate Payment Mechanism: </span>If you have problems in making payments through Cheque or Demand Draft, please email us at <a href=""mailto:marketing@ITILstudy.com"" target=""_blank"">marketing@ITILstudy.com</a>; we will suggest alternate payment options to you."
		  
	 ElseIf (Session("country") = "US" OR Session("country") = "Canada") Then
		  		  
	 body = body & "<ul><li><font face=""Arial"" size=""2""><b>Google Checkout: </b></font><a href=""http://www.itilstudy.com/payment.asp?enrollUserID="& PICode &"&Country="& Session("country") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><input type=""image"" src=""http://www.itilstudy.com/images/back/buybutton.gif"" alt=""BuyNow"" /></font></a></li>"
		 
	 body = body & "<li><font face=""Arial"" size=""2""><b>PayPal: </b></font><a href=""http://www.itilstudy.com/payment.asp?enrollUserID="& PICode &"&Country="& Session("country") &"""><font face=""Arial"" size=""2"" color=""#0359b4""><input type=""image"" src=""http://www.itilstudy.com/images/back/buybutton.gif"" alt=""BuyNow"" /></font></a></li></ul>"
		  
		 		  
    ElseIf (Session("country") = "UAE" OR Session("country") = "Singapore") Then
    
    body = body & "<ul><li><font face=""Arial"" size=""2""><b>Paypal </b></font><a href=""http://www.itilstudy.com/payment.asp?enrollUserID="& PICode &"&Country="& Session("country") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><input type=""image"" src=""http://www.itilstudy.com/images/back/buybutton.gif"" alt=""BuyNow"" /></font></a><br></li>"
 
 ' body = body & "<li><font face=""Arial"" size=""2""><b>CCAvenue </b></font>&nbsp;&nbsp;<a href=""http://localhost/itil_ccavenue.asp""><font face=""Arial"" size=""3"" color=""#0359b4""><b>Buy Now</b></font></a></li></ul>"
  
    body = body & "<li><form method=""post"" action=""http://www.pmstudy.com/itil_ccavenue.asp""><input type=""hidden"" name=""item_name"" value=""ITILstudy Classroom Training - "& Session("country") &" ""><input type=""hidden"" name=""item_number"" value=""5007""><input type=""hidden"" name=""Amount"" value="& Amount &"> <input type=""hidden"" name=""Merchant_Id"" value="&Merchant_Id&"><input type=""hidden"" name=""TotalCCAvenue"" value="& TotalCCAvenue &"><font face=""Arial"" size=""2""><b>CCAvenue </b></font><font face=""Arial"" size=""3"" color=""#0359b4""><input type=""image"" src=""http://www.itilstudy.com/images/back/buybutton.gif"" alt=""BuyNow"" /></font></a></form></li></ul>"		

  ElseIf (Session("country") = "Australia") Then
		  body = body & "<ul><li><font face=""Arial"" size=""2""><b>Paypal: </b></font>&nbsp;&nbsp;<a href=""http://www.itilstudy.com/payment.asp?enrollUserID="& PICode&"&Country="& Session("country") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><b>Buy Now</b></font></a><br><br></li>"
		  
		  body = body & "<li><font face=""Arial"" size=""2""><b>Bank Transfer: </b></font><br> <b>Bank Name:</b> ANZ Bank (Australia and New Zealand Banking Group Limited)<br /><b>Account Name:</b> EDUSYS SERVICES PTY LTD<br><b>Account Number: </b>376446238<br><b>BSB (Bank State Branch):</b> 012055<br /></li></ul>"
		  
		  End If
	
		  
    body = body & "<font face=""Arial"" size=""2"">" & PaymentsAfterEnroll
 If Session("country") = "US" OR Session("country") = "Canada" Then 
   body = body & "<tr><td><font face=""Arial"" size=""2"">For alternate payment options, please <a href=""http://www.itilstudy.com/payforclass.asp"" target=""_blank"">click here</a></font>"
   End If
    body = body & "</td></tr>"
	
	
 If (Session("country") = "India") Then 
   body = body & "<tr><td align=""left"" colspan=""2"" align=""center""><br><span style=""color: red;""><sup>*</sup></span> : Service tax registration number - AABCE3423BST001<br>This is a Proforma Invoice. Not eligible for TAX claims."
  body = body & "</font></td></tr>"
   ElseIf (Session("country") = "United Kingdom") Then 
   body = body &  "<tr><td align=""left"" colspan=""2"" align=""center""><span style=""color:red""><sup>*</sup></span> : VAT registration number - GB 117 6616 13<br>This is a Proforma Invoice. Not eligible for VAT claims. </td></tr>"
  body = body & "</font></td></tr>"
   ElseIf (Session("country") = "Australia") Then 
   body = body & "<tr><td align=""left"" colspan=""2"" align=""center""><span style=""color:red""><sup>*</sup></span> : GST Registration Number: ABN 55 152 303 038<br>This is a Proforma Invoice. Not eligible for GST claims. </td></tr>"
  End If
	body = body & "<tr><td align=""left"" colspan=""2""><br><font face=""Arial"" size=""2""><i>We have reserved a place for you in this course. However, the payment should be received by us "
	
		   If(CDate(rqStartDate)-(Date()-1)>5) Then
	  body = body & "within 5 days from today i.e. before " & FormatDateTime(DateAdd("d", +4,CDate(todaysDate)),1) & "</b>"
	  End If
	  If(CDate(rqStartDate)-(Date())=4) Then
	  body = body & "within 4 days from today i.e. before " & FormatDateTime(DateAdd("d", +3,CDate(todaysDate)),1) & "</b>"
	  End If
	  If(CDate(rqStartDate)-(Date())=3) Then
	  body = body & "within 3 days from today i.e. before " & FormatDateTime(DateAdd("d", +2,CDate(todaysDate)),1) & "</b>"
	  End If
	  If(CDate(rqStartDate)-(Date())=2) Then
	  body = body & "within 2 days from today i.e. before " & FormatDateTime(DateAdd("d", +1,CDate(todaysDate)),1) & "</b>"
	  End If
	  If(CDate(rqStartDate)-(Date())=1) Then
	  body = body & "today i.e. before 5 PM " & FormatDateTime(todaysDate,1) & "</b>"
	  End If
	  If(CDate(rqStartDate)-(Date())=0) Then
	  body = body & "today i.e. before 9 PM " & FormatDateTime(todaysDate,1) & "</b>"
	  End If
		  
	  body = body & " - <i>otherwise, your registration for this program will be cancelled.</i> <br></font></td></tr>"
	  body = body & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2"">"
	  If (Session("country") = "India") Then 
	  body = body & "For ITILstudy classroom training terms and conditions, please visit <a href=""http://www.projstudy.com/termsAndConditions.asp"" target=""_blank"">www.PROJstudy.com/termsAndConditions.asp</a>."
	 Else
	 
	  body = body & "PROJstudy ITIL offers Exam Retake Gaurantee on its classroom programs. For details, visit <a href=""http://projstudy.com/ITIL/ITIL-Training/examRetake.asp"" target=""_blank"">http://PROJstudy.com/ITIL/ITIL-Training/examRetake.asp</a>. Also, please refer to PROJstudy ITIL classroom training terms and conditions: <a href=""http://www.projstudy.com/termsAndConditions.asp"" target=""_blank"">www.PROJstudy.com/termsAndConditions.asp</a>."
	  End If
	  body = body & "</font></td></tr>"
	  body = body & "<tr><td align=""center"" colspan=""3""><br><font face=""Arial"" color = ""green"" size=""3"">We look forward to having you as a student with PROJstudy.com  ITIL Classroom Training!!!</font></td></tr>"
	  body = body & "<tr><td align=""left""><br><font face=""Arial"" size=2>Best Regards,</font></td></tr>"
	  body = body & "<tr><td align=""left""><font face=""Arial"" size=2><br>Customer Support</font></td></tr>"
	  body = body & "<tr><td align=""left""><font face=""Arial"" size=2><a href=""http://www.PROJstudy.com"" target=""_blank"">www.PROJstudy.com</a></font></td></tr>"
	  'body = body & "<tr><td align=""left""><font face=""Arial"" size=2>(PMI Approved Global Registered Education Provider)</font></td></tr>"
	  body = body & "<tr><td align=""left""><font face=""Arial"" size=2>Email: itilinfo@projstudy.com</font></td></tr></table></td></tr><tr height=""30px""><td align=""center""><font face=""Arial"" size=2 style=""color:#808080"">"
 If (Session("country") = "India" ) Then
   body = body & "<br><hr><div align=""center""><font size=""1px"">Edusys Services Pvt Limited<br>Santhosh Towers, 4th Main,100 Ft. Ring Road, J.P. Nagar 4th Phase,<br>Bangalore - 560078, India<br></font></div>"
  Else 
  body = body & "&nbsp;"
  End If
  body = body & "</font></td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"

	  
		' Response.Write(body)
					 
	  

If rqType = "preview" then
	
'Retrive The EnrollUserId,subject and body from this Page'
Dim firstName,lastName, emailId

   PICode = Request.Form("PICode")
   subject = Request.form("subject")
   body    = Request.form("QueryReply")
   Session("FirstName") = request.form("first_name")
   Session("LastName")  = request.form("last_name")
   Session("EmailId")  = request.form("emailId")
   
End If

'Send Email'

if rqType = "sendmail" Then

  
   Dim rqBody
   Dim rqSubject

'Retrive The enrolluserid from this page'  
 
   PICode = Request.Form("PICode")
   rqSubject =  Request.form("subject")
   body    = Request.form("QueryReply")
   
 

	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")

	objCDOMail.From = "itilinfo@projstudy.com"  
    objCDOMail.To =  rqEmailId  
	objCDOMail.cc = "itilinfo@projstudy.com"
	objCDOMail.BCC = "t_satpathy@yahoo.com"
	objCDOMail.Importance = 2
	objCDOMail.Subject = "Revised Proforma Invoice"
	objCDOMail.BodyFormat = 0

	objCDOMail.MailFormat = 0
	objCDOMail.Body = body
	objCDOMail.Send
	Set objCDOMail = Nothing
	
	Response.Redirect("ITIL-courses.asp?CourseId="&rqCourseId)
    Session("message") = "New Proforma Invoice Mail Has been Sent" 
	
Else

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
 <title>PROFORMA INVOICE</title>
 <link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
 
</head>
<body><div id="htMap">
  <table border="1" width="700" height="580"cellspacing="0" class="dbborder" >
    <tr>
      <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300">
          <% =Session("country") %>
          </span> ITILstudy Back Office</font></div>
    </tr>
    <tr>
      <td width="100px" valign="top" rowspan="22"><!--#include file="leftMenu.html"-->
      </td>
    </tr>
    <tr>
    
    <td width="547" valign="top"><table width="100%" cellspacing="0" cellpadding="2">
        <form id="form1" name="form1" method="post" action="PROJITILnewProformaInvoiceMail.asp?type=preview">
          <input type="hidden" name="enrollUserId" value="<%= PICode %>" />
          <input type="hidden" name="courseId" value="<% = rqCourseId %>" />
          <input type="hidden" size="30" name="first_name" value="<%=Session("FirstName")%>">
          <input type="hidden" size="30" name="last_name" value="<%=Session("LastName") %>">
          <input type="hidden" size="50" name="emailId" value="<%= Session("EmailId")%>">
          <tr>
            <td colspan="2" bgcolor="#00B0EC">Send Proforma Invoice </td>
          </tr>
          <tr class="rowEven">
            <td width="28%">To: </td>
            <td width="72%"><% = Session("FirstName") %>
              &nbsp;
              <% = Session("LastName") %>
              <
              <% = Session("EmailId") %>
              ></td>
          </tr>
          <tr class="rowOdd">
            <td>Subject: </td>
            <td> PR0FORMA INVOICE </td>
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
        <form  method="post" action="PROJITILnewProformaInvoiceMail.asp?type=sendmail">
          <input type="hidden" name="QueryReply" value='<%= body %>' />
          <input type="hidden" name="courseId" value="<% = rqCourseId %>" />
          <input type="hidden" name="enrolluserid" value="<%= PICode %>" />
          <input type="hidden" name="emailid" value="<%= rqEmailId %>" />
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
        </tr>
        
        <% if rqType = "preview" Then %>
        <tr>
          <td colspan="3"><%Response.write(subject & "<br/><br/>")
				Response.write(body)%></td>
        </tr>
        <% End If %>
      </table></td>
  </table>
</div>
</body>
</html>
<% End If
 End If
 ' End If	
  %>
