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
Dim PICode,PINameFirst,PINameLast,PICompany,PITelephone,PIPlace,PIDate,PIPrice,PIAmount,PIPercentage,PIPMBOK,PIPMBOKValue,body
Dim Rs1,Rs2,rqType,arrAllNames,courseDate,str,i,startDate,endDate,sstartDate,eendDate,subject,startingHour,rqCourseId
Dim startingMinute,startingSession,endingHour,endingMinute,endingSession,hotelName,hotelAddress,hotelURL,hotelPhoneNo,rqEmailId,strQuery1,priceAfterDiscount,priceWithTax,total,rqTax,courseDetails1,courseDetails2,courseDetails,newCourseDetails,todaysDate,rqStartDate,objCDOMail
Dim Currency_Format_Front, VAT
Dim Currency_Format_Back
Dim strCountryDetails
Dim PaymentsAfterEnroll
Dim PayOption1
Dim PayOption2,Rs

rqType = Request.QueryString("type")
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Set Rs = Server.CreateObject("ADODB.Recordset")
	
'Dispaly The Today Date'

  todaysDate=now()
  
'Currency Format Display Functions'

 Currency_Format_Front = CurrencyFormat_Front(Session("Country"))

 Currency_Format_Back = CurrencyFormat_Back(Session("Country"))
 
 'Retrive Values'  
  	
	PICode 				= Request.Form("PICode")
	PINameFirst 		= Request.Form("PINameFirst")
	PINameLast 			= Request.Form("PINameLast")
	PICompany 			= Request.Form("PICompany")
	PITelephone 		= Request.Form("PITelephone")
	PICourse 			=  Request.Form("PICourse")
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
	
	
	  Session("FirstName") = PINameFirst
   Session("LastName")  = PINameLast
   Session("EmailId")  = rqEmailId
	
 IF PIAmount = PIPrice Then
	courseDetails = session("coursedetails")
	
 Else
		courseDetails = session("coursedetails")


End If

If PIPMBOK = "Yes" Then

If Session("country") = "United Kingdom" Then
VAT = round(((priceAfterDiscount + 55) * rqTax)/100)
ElseIf Session("country") = "India" Then
VAT = round(((priceAfterDiscount + 5000) * rqTax)/100)
End If

Else

If Session("country") = "United Kingdom" OR  Session("country") = "India" OR  Session("country") = "Australia" Then 
VAT = round((CInt(priceAfterDiscount) * Cdbl(rqTax))/100)

End If

End If
   
    newCourseDetails =  courseDetails
	
	'response.Write(newCourseDetails)

	strCountryDetails = "SELECT * FROM prince2_countrydetails WHERE country = '" & Session("Country") & "' AND id = (SELECT MAX(id) FROM prince2_countrydetails WHERE country = '"& Session("Country") &"')"
					
	Rs.Open strCountryDetails,ConnObj

	Do Until Rs.EOF 
		
		PaymentsAfterEnroll = Rs("paymentsafterenroll")
		PayOption1 = Rs("PayOpt1")
		PayOption2 = Rs("PayOpt2")
	
	Rs.Movenext
	Loop
    
	Rs.Close
	

	strQuery1 = "Update prince2_enrolledusers Set" 
	If (Session("Country") = "United Kingdom" OR Session("Country") = "India" OR  Session("country") = "Australia") Then
 	strQuery1 = strQuery1 & " amount = '"& priceAfterDiscount &"', VAT = '"& VAT &"'"
	Else
 	strQuery1 = strQuery1 & " amount = '"& priceWithTax &"'"
	End If
	strQuery1 = strQuery1 &",PRINCE2Manual = '"& PIPMBOK &"' , coursedetails = '"& newCourseDetails &"',discountpercentage = '"&  PIPercentage &"',PRINCE2price = '"& PIPMBOKValue &"'    where id = '" & PICode & "'"
	

'response.Write(strQuery1)

 Rs1.Open strQuery1,ConnObj
	
 subject="PROFORMA INVOICE"

body = "<table width=""100%"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr height=""45px""><td>&nbsp;</td></tr><tr><td><table width=""600px"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""595px"" bgcolor=""#FFFFFF"">" 
						IF Session("country") = "India" Then
						body= body & "<span><img src=""http://www.PMstudy.com/images/banners/PRINCE2_email_headerIN.jpg"" alt=""PMstudy"" /></span>" 
						ElseIf Session("country")="United Kingdom" Then 
						body= body &"<span><img src=""http://www.PMstudy.com/images/banners/PRINCE2_email_headerUK.jpg"" alt=""PMstudy"" /></span>"
						ElseIf Session("country")="Australia" Then
						body= body &"<span><img src=""http://www.PMstudy.com/images/banners/email_headerAUS.jpg"" alt=""PMstudy"" /></span>"
						Else
						body= body &"<span><img src=""http://www.PMstudy.com/images/banners/PRINCE2_email_header.jpg"" alt=""PMstudy"" /></span>"
						End if
						body= body &"</td></tr>"
	  body = body & "<tr><td align=""center"" colspan=""2"" width=""560px""><table border=""0"" align=""center"" width=""560px""><tr><td align=""center""><br><br><font face=""Arial"" size=""3"" color=""#0359b4""><b>PROFORMA INVOICE</b></font></td></tr>"
	  body = body & "<tr><td align=""right"" colspan=""2""><font face=""Arial"" size=""2""><b>" & FormatDateTime(todaysDate,1) & "</b></font></td></tr>"
	  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Enroll ID : " & PICode & "</font></td></tr>"
	  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name : " &  Session("FirstName") & "&nbsp; " & Session("LastName") & "</font></td></tr>"
	  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Email : " & Session("EmailId") & " </font></td></tr>"
	  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Phone Number : " & PITelephone & "</font></td></tr>"
	  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name Of Employeer/Business : " & PICompany & "</font></td></tr>"
	  body = body & "<tr><td align=""left""><br><font face=""Arial"" size=""2"">Thank you for enrolling in PMstudy.com classroom training.</font></td></tr>"
	  body = body & "<tr><td align=""left"" colspan=""2""><br><font face=""Arial"" size=""2"">Details of your course and Payment:</font><br><table border=""1"" cellspacing=""0"" align=""center"" width=""560px"">"
	  body = body & "<tr><td width=""60%""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Details</font></b></td><td width=""15%"" align=""center""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Payment</font></b></td></tr>"
	  body = body & "<tr><td><font face=""Arial"" size=""2""><b>PMstudy PRINCE2 Classroom Training <br>" & newCourseDetails & "</b>"

If  rqTax <> ""  And  Session("country") = "United Kingdom" OR Session("country") = "India" OR Session("country") = "Australia" Then 
body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
body = body &  Currency_Format_Front & " " & FormatNumber(priceAfterDiscount) & " " & Currency_Format_Back
body = body &"</b></td></tr>"
If PIPMBOK = "Yes" Then
body = body &"<tr><td><font face=""Arial"" size=""2""><b>PRINCE2 Manual Price <font color=""red"">*</font> </b>"
body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
 body = body & Currency_Format_Front & "" & FormatNumber(PIPMBOKValue) & "" & Currency_Format_Back
body = body &"</b></td></tr>"
End If
If Session("country") = "United Kingdom" And rqTax <> "" Then 
body = body &"<tr><td><font face=""Arial"" size=""2""><b> VAT: @ 20% <font color=""red"">*</font> </b>"
ElseIf Session("country") = "Australia" And rqTax <> "" Then 
body = body &"<tr><td><font face=""Arial"" size=""2""><b> GST: @ 10% <font color=""red"">*</font> </b>"
ElseIf Session("country") = "India" And rqTax <> "" Then 
body = body &"<tr><td><font face=""Arial"" size=""2""><b>Tax: @ 10.3%<font color=""red"">*</font> </b>"
End IF
body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
 body = body & Currency_Format_Front & " " & VAT & ".00" & Currency_Format_Back
body = body &"</b></td></tr>"
body = body & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
body = body & Currency_Format_Front & "" & FormatNumber(total) & " " & Currency_Format_Back
body = body & "</b></font></td></tr></table><br></td></tr>"					   
   ElseIf Session("country") = "United Kingdom" OR Session("country") = "Australia" Then 
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(total) & " " & Currency_Format_Back
		body = body &"</b></td></tr>"
		body = body & "<tr><td colspan=""2"">&nbsp;</td></tr>"
		body = body & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("Total")) & " " & Currency_Format_Back
		body = body & "</b></font></td></tr></table><br></td></tr>"					   
	ElseIf Session("country") <> "United Kingdom" AND Session("country") <> "Australia" Then 
	 If PIPMBOK = "Yes" Then
	  body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
	  body = body & Currency_Format_Front & " " & FormatNumber(PIAmount) & " " & Currency_Format_Back
	  body = body &"</b></td></tr>"
	  Else
	  body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
	  body = body & Currency_Format_Front & " " & FormatNumber(total) & " " & Currency_Format_Back
	  body = body &"</b></td></tr>"
	  End If
	  If PIPMBOK = "Yes" Then
		body = body &"<tr><td><font face=""Arial"" size=""2""><b>PRINCE2 Manual Price <font color=""red"">*</font> </b>"
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		 body = body & Currency_Format_Front & " " & FormatNumber(PIPMBOKValue) & "" & Currency_Format_Back
		body = body &"</b></td></tr>"
		End If
	  body = body & "<tr><td colspan=""2"">&nbsp;</td></tr>"
	  body = body & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
	  body = body & Currency_Format_Front & " " & FormatNumber(total) & " " & Currency_Format_Back
	  body = body & "</b></font></td></tr></table><br></td></tr>"
	   End If
	  body = body & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><b>Please Note:</b></font><br>"
	  body = body & "<font face=""Arial"" size=""2"">Full payment of the enrollment fee <b>(" & Currency_Format_Front & " " & FormatNumber(total) & " " & Currency_Format_Back & "</b>) "
	  
	  body = body & "should be done through </font></td></tr><tr><td>"
	
     If Session("Country") = "United Kingdom" Then
	 body = body & "<li><font face=""Arial"" size=""2""><b>Google Checkout </b></font>"
	body = body & "&nbsp;&nbsp;<a href=""http://www.PMstudy.com/PRINCE2-Payment.asp?enrollUserID="& PICode &"&Country="& Session("Country") &""" target= ""_blank""><font face=""Arial"" size=""3"" color=""#0359b4""><b>Buy Now</b></font></a></li>"
	
	ElseIf Session("Country") = "Australia"  Then
	body = body & "<li><font face=""Arial"" size=""4""><b>Paypal</b></font>&nbsp;&nbsp;&nbsp;&nbsp;<a href=""http://www.PMstudy.com/PRINCE2-Payment.asp?enrollUserID="& PICode &"&Country="& Session("Country") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><b>Buy Now</b></font></a></li>"
	ElseIf Session("Country") = "India" Then
	body = body & "<ul type=""disc""><li> <span>Cheque</span> or <span > Demand Draft</span> favouring <span> ""Edusys Services Private Limited.""</span><br /><br /><span>This should be couriered to the following address:</span><br /><br /><span>Edusys Services Private Limited</span>,<br>#27,2<sup>nd</sup> Floor</br>Santosh Towers,<br />J.P. Nagar 4<sup>th</sup> Phase,<br>4<sup>th</sup> Main,100 Ft. Ring Road<br>Bangalore 560078<br />India<br /><br />Ph:+91 80 4155 75 47/48/49<br><br /></li><li><span>Bank Transfer: </span><span >Payee Name:  </span>EDUSYS SERVICES PVT. LTD.<br /><span>Bank Name :  </span>ICICI Bank Limited<br /><span>Account Number :  </span>ICICI Bank A/c No : 0401 0500 0128<br /><span>IFSC Code:</span> ICIC0000401<br><span>Branch Name :  </span>ICICI Bank, J.P. Nagar Branch, Bangalore<br /><br /></li>"
	
	 body = body & "<li><span>Alternate Payment Mechanism: </span>If you have problems in making payments through Cheque or Demand Draft, please email us at marketing@pmstudy.com; we will suggest alternate payment options to you.</li></ul></td></tr>"
	  End If
	   If Session("country") = "India" Then
					 body = body & "<tr><td align=""left"" colspan=""2""><font color=""red"">*</font> : <font face=""Arial"" size=""2"">Service tax registration number in the invoice (AABCE3423BST001)<br>This is a Proforma Invoice. Not eligible for TAX claims.<br></td></tr>"
					 End If
	  body = body & "</td></tr>"
	  body = body & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><br><b>We have reserved a seat for you in this course. However, the payment should be received by us "
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
	  body = body & " - otherwise, your registration for this program will be cancelled. </font></td></tr>"
	  body = body & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><br>Please Note:You will be allowed access to the free 100% Online Preparatory Course for <a href=""http://www.PMstudy.com"" target=""_blank"">PMstudy.com</a> Classroom Course only after we receive your payment : this is a simple online course which can be completed with a few hours of study. This course is a pre-requisite for PMstudy.com Classroom Course."
	   If Session("Country") = "United Kingdom" OR Session("Country") = "Australia" Then 
      body = body & "<b> Details:</b><a href=""http://www.PMstudy.com/PRINCE2-Training/examRetakeGuarantee.asp"" target=""_blank"">Please refer to the free Exam Retake Guarantee Terms and Conditions.</font></td></tr>"  
	  
	  End If
	 body = body & "<tr><td colspan=""3""><br><font face=""Arial"" size=2><b>Best Regards,</b></font></td></tr>"
	 body = body & "<tr><td colspan=""3""><font face=""Arial"" size=2><b>Customer Support,</b></font></td></tr>"
	 body = body & "<tr><td colspan=""3""><font face=""Arial"" size=2><b>PMstudy.com.</b></font><br /><br/><hr><div align=""center""><font size=""1px"">"
	 If Session("country") = "India" Then
	body = body & "EDUsys Services Private Limited,<br>Santosh Towers,4th Main,100 Ft. Ring Road, J.P. Nagar 4th Phase,Bangalore - 560078, India<br>"
     End If
 body = body & "PRINCE2<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.<br />The Swirl logoT is a trade mark of the Cabinet Office.</font></div><br /></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"
	 'response.Write(body)
	   
If rqType = "preview" then
	
'Retrive The EnrollUserId,subject and body from this Page'

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
   rqBody    =  Request.Form("body")
   rqSubject =  Request.form("subject")
   body    = Request.form("QueryReply")
   

  'response.Write(rqBody)
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")

	objCDOMail.From = "marketing@pmstudy.com"  
    objCDOMail.To =  rqEmailId  
	objCDOMail.cc = "marketing@pmstudy.com"
	objCDOMail.BCC = "t_satpathy@yahoo.com"
	objCDOMail.Importance = 2
	objCDOMail.Subject = "Revised Proforma Invoice"
	objCDOMail.BodyFormat = 0
	objCDOMail.MailFormat = 0
	objCDOMail.Body = rqBody
	objCDOMail.Send
	Set objCDOMail = Nothing

    response.Write("New Proforma Invoice Mail Has been Sent . . . ." )
    
	
Else


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PROFORMA INVOICE</title>
<link href="/India/css/pagestyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="htMap">
  <table width="700" height="580" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#00B0EC" class="dbborder" >
   <tr>
   <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% =Session("country") %></span> PMstudy Back Office</font></div>
 </tr>
 <tr>
  <td width="100px" valign="top" rowspan="22">
    <!--#include file="leftMenu.html"-->
  </td>
 </tr>
 <tr>
      <td width="547" valign="top"><table width="100%" cellspacing="0" cellpadding="2">
          <form id="form1" name="form1" method="post" action="PRINCE2-NewProformaInvoiceMail.asp?type=preview">
            <input type="hidden" name="enrollUserId" value="<%= PICode %>" />
            <input type="hidden" size="30" name="first_name" value="<%=Session("FirstName")%>">
           <input type="hidden" size="30" name="last_name" value="<%=Session("LastName") %>">
           <input type="hidden" size="50" name="emailId" value="<%= Session("EmailId")%>">
            <tr>
              <td colspan="2" bgcolor="#00B0EC">Send Proforma Invoice </td>
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
          <form  method="post" action="PRINCE2-NewProformaInvoiceMail.asp?type=sendmail">
            <input type="hidden" name="body" value='<%= body %>' />
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
