<!--#include virtual="/metatags/dates_location_metatag.html"-->
<!--#include virtual="/includes/headermeta_withoutDD.asp"-->
<!--#include virtual="/includes/innerbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<!--#include virtual="/includes/libfuncs.asp"-->
<%
'If course id is nothing then redirect to enrollclass_Corporate.asp page'
rqCourseId =  Request.Form("courseid")
If rqCourseId = "" Then
    Response.Redirect("/enrollclass_Corporate.asp")
End If
%>
<!-- Body Starts -->
<%
'Declare Local Variables'
Dim rqCourseId, rqFirstName, rqLastName, rqEmail, rqNameOfEmployeer
Dim rqPhoneNumber, rqCourseDetails, rqPriceWithTax, rqPriceWithOutTax
Dim objRs, todaysDate, PayBefore, Currency_Format_Front, Currency_Format_Back
Dim strCourseDet, City, StartDate, EndDate, ApplicableDays, Country
Dim HotelName, HotelPhNo, HotelURL, HotelAddress, TotalWithoutTax, Total, Tax
Dim VAT_Cal1, VAT_Cal2, VAT, strBody,rqStreet,rqCity,rqState,rqPostalCode
Dim strCity, stateCode, CourseDetails, CourseDate, EnrolledCourse, strInsertEnrollDet,rqclasstype

'Replace method
Function StrQuoteReplace(strValue)
StrQuoteReplace = Replace(strValue, "'", "''")
End Function


'Creating recordobjects'
Set objRs = Server.CreateObject("ADODB.Recordset")

'Dispaly The Today Date'
todaysDate = now()

'Increment 5 Days and Displaying purpose'
PayBefore = DateAdd("d", +4,CDate(todaysDate))

'Retrive The Enrolluser Details from enrollclass_Corporate.asp page'
rqCourseId         =  Request.Form("courseid")
rqFirstName 	   =  Request.Form("firstname")
rqLastName 		   =  Request.Form("lastname")
rqEmail 		   =  Request.Form("email")
rqNameOfEmployeer  =  Replace(Request.Form("employer"),"'","''")
rqPhoneNumber 	   =  Request.Form("phoneno")
rqStreet           =   Replace(Request.Form("street"),"'","''")
rqCity             =   Replace(Request.Form("city"),"'","''")
rqState 		   =   Replace(Request.Form("state1"),"'","''")
rqPostalCode 	   =   Request.Form("postalCode")
rqCourseDetails    =  Request.Form("class")
rqPriceWithTax 	   =  Request.Form("pricewithtax")
rqPriceWithOutTax  =  Request.Form("pricewithouttax")
rqCourseType = Request.Form("CourseType")
rqclasstype = Request.Form("classtype")

'Put Into Session Displaying Purpose'
Session("FirstName")        =  rqFirstName
Session("LastName")         =  rqLastName
Session("Email")            =  rqEmail
Session("NameOfEmployeer")  =  rqNameOfEmployeer
Session("PhoneNumber")      =  rqPhoneNumber
Session("Course")           =  rqCourseDetails

'Retriving country based on course id if session is expired'
'If rqCourseId <> "" Then

 strCountry = "SELECT country FROM ITIL_course WHERE courseid = '"& rqCourseId &"'"

 objRs.Open strCountry, ConnObj

 Do Until objRs.EOF
   Session("CountryOrigin") = Trim(objRs("Country"))
 objRs.Movenext
 Loop		
 objRs.Close	

'Else

'Session("CountryOrigin") = Session("CountryOrigin")

'End If

'Currency Format Display Functions'
Currency_Format_Front = CurrencyFormat_Front(Session("CountryOrigin"))

Currency_Format_Back = CurrencyFormat_Back(Session("CountryOrigin"))

'SQL Query For Retrieve The Prices Displaying purpose'
strCourseDet = "SELECT * FROM ITIL_course Where courseid = '" & rqCourseId & "'"

objRs.Open strCourseDet,ConnObj

Do until objRs.EOF

	City           =  objRs("city")
	StartDate      =  objRs("startdate")
	EndDate        =  objRs("enddate")
	ApplicableDays =  objRs("applicabledays")
	Country 	   =  objRs("country")
	HotelName      =  objRs("hotelname")
	HotelPhNo      =  objRs("hotelphonenumber")
	HotelURL       =  objRs("hotelurl")
	HotelAddress   =  objRs("hoteladdress")
	
	If (CDate(StartDate)-(Date()+ApplicableDays+1) >= 0) Then
		TotalWithoutTax = objRs("afterEBdiscountwithouttax")
		Total = objRs("afterEBdiscountwithtax")
		TotalCCAvenue = Int(objRs("afterEBdiscountwithtax"))
	Else
		TotalWithoutTax = objRs("pricewithouttax")
		Total = objRs("pricewithtax")
		TotalCCAvenue = Int(objRs("pricewithtax"))
	End If
	
	Tax = objRs("tax")
	
	'for displaying the prices in UK'
	'Actual amount and VAT'
	'If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Germany") Then
	If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Australia") Then
	
		VAT_Cal1 = ((CInt(TotalWithoutTax) * Cdbl(Tax)) / 100)
		
		VAT_Cal2 = Cdbl(VAT_Cal1)
		
		If VAT_Cal2 = Fix(VAT_Cal2) Then
		VAT = VAT_Cal2
		Else
		VAT = Fix(VAT_Cal2) + 1
		End If
		
	End If

objRs.movenext
Loop
objRs.Close

'New Code Texas'
strCity = "SELECT state_code FROM ITIL_city WHERE city = '"& City &"'"

objRs.Open strCity, ConnObj

Do Until objRs.EOF

	stateCode = objRs("state_code")

objRs.Movenext
Loop
objRs.Close



'If someone enroll from texas state, they should provide company details. We are doing here server side validation'
'If company name not provided we are redirecting to enrollClass page and showing error message'
If stateCode = "TX" And rqNameOfEmployeer = "" Then

	 Session("FirstName1")        =  rqFirstName
	 Session("LastName1")         =  rqLastName
	 Session("Email1")            =  rqEmail
	 Session("PhoneNumber1")      =  rqPhoneNumber
	 Session("Course1")           =  rqCourseDetails
	 Session("SelectedCourseID") = rqCourseId
	 Session("message") = "All participants attending our programs in Texas should be sponsored by their employer, and should provide the employer details while enrolling for the PMstudy course.<br><br>"

	Response.Redirect("enrollclass_Corporate.asp")

End If

'For display the course details formatting the course like Raleigh : Saturday, April 17, 2010 to Tuesday, April 20, 2010 for $ 1,800.00'
If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "India") Then

	CourseDetails = City & " : " & FormatDateTime(StartDate,1) & " to " & FormatDateTime(EndDate,1) & " for " & Currency_Format_Front & " " & FormatNumber(TotalWithoutTax) & " " & Currency_Format_Back
	
Else
	
	CourseDetails = City & " : " & FormatDateTime(StartDate,1) & " to " & FormatDateTime(EndDate,1) & " for " & Currency_Format_Front & " " & FormatNumber(Total) & " " & Currency_Format_Back

End If

CourseDate = StartDate & " to " & EndDate

EnrolledCourse = City & " : " & FormatDateTime(StartDate,1) & " to " & FormatDateTime(EndDate,1)

'SQL Query For Inserting The Values Into DataBase'
strInsertEnrollDet = "INSERT INTO ITIL_enrolledusers (firstname,lastname,email,nameofemployeer,phoneno,coursedetails,coursedate,amount,dateofenrollment,paybefore,status,pmbok,courseid,statusnumber,pmbokprice,discountpercentage, speReq, address, courseType,"
'If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Germany") Then 
If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Australia") Then 
strInsertEnrollDet = strInsertEnrollDet & "VAT,"
End If
strInsertEnrollDet = strInsertEnrollDet & "enrolledFor, country)"
strInsertEnrollDet = strInsertEnrollDet & " Values "
strInsertEnrollDet = strInsertEnrollDet & "('" & StrQuoteReplace(rqFirstName) & "',"
strInsertEnrollDet = strInsertEnrollDet & "'" & StrQuoteReplace(rqLastName) & "',"
strInsertEnrollDet = strInsertEnrollDet & "'" & rqEmail & "',"
strInsertEnrollDet = strInsertEnrollDet & "'" & StrQuoteReplace(rqNameOfEmployeer) & "',"
strInsertEnrollDet = strInsertEnrollDet & "'" & rqPhoneNumber & "',"
strInsertEnrollDet = strInsertEnrollDet & "'" & CourseDetails & "',"
strInsertEnrollDet = strInsertEnrollDet & "'" & CourseDate & "',"
If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Australia") Then
strInsertEnrollDet = strInsertEnrollDet & "'" & TotalWithoutTax & "',"
Else
strInsertEnrollDet = strInsertEnrollDet & "'" & Total & "',"		 
End If
strInsertEnrollDet = strInsertEnrollDet & "'" & now() & "',"
strInsertEnrollDet = strInsertEnrollDet & "'" & PayBefore & "',"
strInsertEnrollDet = strInsertEnrollDet & "'Active',"
strInsertEnrollDet = strInsertEnrollDet & "'No',"
strInsertEnrollDet = strInsertEnrollDet & "'" & rqCourseId & "',"
strInsertEnrollDet = strInsertEnrollDet & "'1',"
strInsertEnrollDet = strInsertEnrollDet & "'0',"
strInsertEnrollDet = strInsertEnrollDet & "'0',"
strInsertEnrollDet = strInsertEnrollDet & "'" & rqSpeReq & "'," 
strInsertEnrollDet = strInsertEnrollDet & "'" & rqStreet & "," & rqCity & "." & rqState & "." & rqPostalCode & "',"
strInsertEnrollDet = strInsertEnrollDet & "'Foundation',"
'If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Germany") Then 
If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Australia") Then
strInsertEnrollDet = strInsertEnrollDet & "'" & VAT & "',"
End If

strInsertEnrollDet = strInsertEnrollDet & "'" & rqCourseType & "',"
strInsertEnrollDet = strInsertEnrollDet & "'" & Country & "')"

ConnObj.Execute strInsertEnrollDet

strEnollID = "SELECT max(id) as EnrollId FROM ITIL_enrolledusers"

objRs.Open strEnollID,ConnObj

do until objRs.Eof

	Session("EnrollId") = objRs("EnrollId")

objRs.Movenext
Loop
objRs.Close

EnrollId = Session("EnrollId")

'Sending proforma invoice email'
		  strBody = "<table width=""100%"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td>&nbsp;</td></tr><tr><td><table width=""600px"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""595px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITIlstudy"" width=""600px"" height=""103"" /></span></td></tr>"
		  strBody = strBody & "<tr><td align=""center"" colspan=""2"" width=""560px""><table border=""0"" align=""center"" width=""560px""><tr><td align=""center""><br><br><font face=""Arial"" size=""3"" color=""#0359b4""><b>COURSE ENROLLMENT DETAILS (INVOICE)"
		  If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "United Kingdom"  OR Session("CountryOrigin") = "Australia" ) Then
		  strBody = strBody & "<br>ITILstudy Foundation "&rqCourseType&" Program"
		  ElseIf (Session("CountryOrigin") = "India"  ) Then
		  strBody = strBody & "<br>ITILstudy Foundation "&rqCourseType&" Program "
		  End If
		  strBody = strBody & "</b></font></td></tr>"
		  strBody = strBody & "<tr><td align=""right"" colspan=""2""><font face=""Arial"" size=""2""><b>" & FormatDateTime(todaysDate,1) & "</b></font></td></tr>"
		  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Enroll ID : " & Session("EnrollId") & "</font></td></tr>"
		  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name : " & rqFirstName & "&nbsp; " & rqLastName & "</font></td></tr>"
		  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Email : " & rqEmail & " </font></td></tr>"
		  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Phone Number : " & rqPhoneNumber & "</font></td></tr>"
		  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name of Employer/Business : " & rqNameOfEmployeer & "</font></td></tr>"
		  strBody = strBody & "<tr><td align=""left"" colspan=""2""><br><font face=""Arial"" size=""2"">Details of your course and Payment :</font><br><table border=""1"" cellspacing=""0"" align=""center"" width=""560px"">"
		  strBody = strBody & "<tr><td width=""60%""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Details</font></b></td><td width=""15%"" align=""center""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Payment</font></b></td></tr>"
		  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>ITIL<sup>&reg;</sup>  Foundation "&rqCourseType&" training"
		'  If Session("CountryOrigin") = "India" Then
'		  strBody = strBody & "2"
'		  Else
'		  strBody = strBody & "4"
'		  End If
		  strBody = strBody & " <br>  " & CourseDetails & "</b>"
		  
		 If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "India"  OR Session("CountryOrigin") = "Australia") Then
		  
		  strBody = strBody &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		  strBody = strBody & Currency_Format_Front & " " & FormatNumber(TotalWithoutTax) & " " & Currency_Format_Back
		  strBody = strBody &"</b></td></tr>"
		  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>"
		  If Session("CountryOrigin") = "India" Then
		  strBody = strBody & Tax & "% service tax"
		  ElseIf Session("CountryOrigin") = "United Kingdom" Then
		  strBody = strBody & "VAT: @ 20%"
		  ElseIf Session("CountryOrigin") = "Australia" Then 
		  strBody = strBody & " GST: @ 10%"
		  End If
		  strBody = strBody & "</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		  strBody = strBody & Currency_Format_Front & " " & FormatNumber(VAT) & " " & Currency_Format_Back & "</b></font></td></tr>"		  
		  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		  strBody = strBody & Currency_Format_Front & " " & FormatNumber(Total) & " " & Currency_Format_Back & "</b></font></td></tr>"
		  Else
		  strBody = strBody &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		  strBody = strBody & Currency_Format_Front & " " & FormatNumber(Total) & " " & Currency_Format_Back
		  strBody = strBody &"</b></td></tr>"
		  strBody = strBody & "<tr><td colspan=""2"">&nbsp;</td></tr>"		  
		  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		  strBody = strBody & Currency_Format_Front & " " & FormatNumber(Total) & " " & Currency_Format_Back & "</b></font></td></tr>"
		  End If
		   strBody = strBody & "</table><br></td></tr>"
		  
		    'Here i am showing in the email hotel details for us and canada classes only'
		 If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Australia") Then
		  If Not IsNull(HotelAddress) And HotelAddress <> "" AND rqCourseType <> "Live" Then
		  strBody = strBody & "<tr><td align=""left"" colspan=""2""><table border=""0"" width=""100%""><tr><td width=""170px"" valign=""top""><font face=""Arial"" size=""2""><b>Venue Details:</b></font></td><td width=""830px"">"& HotelName &"<br> " & HotelAddress &" "& City &"<br>"
		  If HotelPhNo <> "" Then
		  strBody = strBody & "Ph: "& HotelPhNo &"<br>"
		  End If
		  strBody = strBody & "<a href="& HotelURL &" target=""_blank"">"& HotelURL &"</a><br /><br></td></tr></table></td></tr>"
		  End If
		  End If

	  	  strBody = strBody & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><b>Please Note:</b></font><br><br>"		
		  strBody = strBody & "<font face=""Arial"" size=""2"">Full payment of the enrollment fee <b>(" & Currency_Format_Front & " " & FormatNumber(Total) & " " & Currency_Format_Back & "</b>) "
		  strBody = strBody & "should be done through </font></td></tr><tr><td align=""left"">"
		  
		   If Session("CountryOrigin") = "United Kingdom"  Then
					  
		   strBody = strBody & "<ul><li><font face=""Arial"" size=""2""><b>Google Checkout </b></font>"
					  
		   strBody = strBody & "&nbsp;&nbsp;<a href=""http://www.ITILstudy.com/payment.asp?enrollUserID="& Session("EnrollId") &"&Country="& Session("CountryOrigin") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><b>Buy Now</b></font></a></li>"
					   
			strBody = strBody & "<li><font face=""Arial"" size=""2""><b>PayPal:</b></font>"
			strBody = strBody & "&nbsp;&nbsp;<a href=""http://www.ITILstudy.com/payment.asp?enrollUserID="& Session("EnrollId") &"&Country="& Session("CountryOrigin") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><b>Buy Now</b></font></a></li></ul>"
			End If
		
		  If Session("CountryOrigin") = "India" Then
					  
		  strBody = strBody & "<ul><li><b> <span>Cheque</span> or <span > Demand Draft</span> </b>favouring <span> ""EDUSYS SERVICES PVT LIMITED""</span><br /><br /><span>This should be couriered to the following address:</span><br /><br /><span>Edusys Services Pvt Limited</span>,<br>#27,2<sup>nd</sup> Floor,</br>Santosh Towers,<br />J.P. Nagar 4<sup>th</sup> Phase,<br>4<sup>th</sup> Main,100 Ft. Ring Road<br>Bangalore 560078<br />India<br /><br />Ph:+91 80 4155 75 47/48/49<br><br /></li><li><span><b>Bank Transfer:</b></span><span >Payee Name:  </span>EDUSYS SERVICES PVT LIMITED <br /><span>Bank Name :  </span>ICICI Bank Limited<br /><span>Account Number :  </span>ICICI Bank A/c No : 0401 0500 0128<br /><span>Branch Name :  </span>ICICI Bank, J.P. Nagar Branch, Bangalore</li><br/><li><b>Payment through Credit card or Debit card:</b> <a href=""http://www.mycatstudy.com/itilstudy_makepayment.asp"" target=""_blank"">	<font face=""Arial"" size=""3"" color=""#0359b4""><b>Buy Now</b></font></a></li></ul>"
					  
		  strBody = strBody & "<span>Alternate Payment Mechanism: </span>If you have problems in making payments through Cheque or Demand Draft, please email us at <a href=""mailto:marketing@ITILstudy.com"" target=""_blank"">marketing@ITILstudy.com</a>; we will suggest alternate payment options to you."
		  
		  ElseIf (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") Then
		  		  
		  strBody = strBody & "<ul><li><font face=""Arial"" size=""2""><b>Google Checkout: </b></font>&nbsp;&nbsp;<a href=""http://www.itilstudy.com/payment.asp?enrollUserID="& Session("EnrollId") &"&Country="& Session("CountryOrigin") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><input type=""image"" src=""http://www.itilstudy.com/images/back/buybutton.gif"" alt=""BuyNow"" /></font></a></li>"
		 
		  strBody = strBody & "<li><font face=""Arial"" size=""2""><b>PayPal: </b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""http://www.itilstudy.com/payment.asp?enrollUserID="& Session("EnrollId") &"&Country="& Session("CountryOrigin") &"""><font face=""Arial"" size=""2"" color=""#0359b4""><input type=""image"" src=""http://www.itilstudy.com/images/back/buybutton.gif"" alt=""BuyNow"" /></font></a></li>"
		  
		    strBody = strBody & "<li><font face=""Arial"" size=""2""><b>Bank Transfer: </b></font><br><b>Bank Name: </b>Bank of America, Frederick, MD, USA<br /><b>Type of Account:</b> Current<br /><b>Account Name:</b> VMedu Inc<br><b>Account Number: </b>4460 0519 5480<br><b>Routing Number:</b> 052001633 (paper & electronic) / 026009593 (wires)<br /></li></ul>"
		  
		  ElseIf (Session("CountryOrigin") = "Singapore") Then
		  		  
		   strBody = strBody & "<ul><li><font face=""Arial"" size=""2""><b>Paypal </b></font>&nbsp;&nbsp;<a href=""http://www.itilstudy.com/payment.asp?enrollUserID="& Session("EnrollId") &"&Country="& Session("CountryOrigin") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><input type=""image"" src=""http://www.itilstudy.com/images/back/buybutton.gif"" alt=""BuyNow"" /></font></a><br></li></ul>"
		  
		  
		  ElseIf (Session("CountryOrigin") = "UAE") Then
		  		  
		   strBody = strBody & "<ul><li><font face=""Arial"" size=""2""><b>Paypal </b></font>&nbsp;&nbsp;<a href=""http://www.itilstudy.com/payment.asp?enrollUserID="& Session("EnrollId") &"&Country="& Session("CountryOrigin") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><input type=""image"" src=""http://www.itilstudy.com/images/back/buybutton.gif"" alt=""BuyNow"" /></font></a><br></li>"
	  
		  strBody = strBody & "<li><form method=""post"" action=""http://www.pmstudy.com/itil_ccavenue.asp""><input type=""hidden"" name=""item_name"" value=""ITILstudy Classroom Training - "& Session("CountryOrigin") &" ""><input type=""hidden"" name=""item_number"" value=""5007""> <input type=""hidden"" name=""ITIL_country"" value="" "& Session("CountryOrigin") &"""><input type=""hidden"" name=""Merchant_Id"" value="&Merchant_Id&"><input type=""hidden"" name=""Amount"" value="& TotalCCAvenue &"><input type=""hidden"" name=""currency_type"" value=""USD""><font face=""Arial"" size=""2""><b>CCAvenue </b></font>&nbsp;&nbsp;<font face=""Arial"" size=""3"" color=""#0359b4""><input type=""image"" src=""http://www.itilstudy.com/images/back/buybutton.gif"" alt=""BuyNow"" /></font></a></form></li></ul>"	
		  		
  		  
		    'Paymeny gateways for Australia'
		  ElseIf (Session("CountryOrigin") = "Australia") Then
		  strBody = strBody & "<ul><li><font face=""Arial"" size=""2""><b>Paypal </b></font>&nbsp;&nbsp;<a href=""http://www.itilstudy.com/payment.asp?enrollUserID="& Session("EnrollId") &"&Country="& Session("CountryOrigin") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><b>Buy Now</b></font></a><br><br></li>"
		  
		  strBody = strBody & "<li><font face=""Arial"" size=""2""><b>Bank Transfer: </b></font><br> <b>Bank Name:</b> ANZ Bank (Australia and New Zealand Banking Group Limited)<br /><b>Account Name:</b> EDUSYS SERVICES PTY LTD<br><b>Account Number: </b>376446238<br><b>BSB (Bank State Branch):</b> 012055<br /></li></ul>"
		  
		 
		  End If
		  strBody = strBody & "<font face=""Arial"" size=""2"">" & PaymentsAfterEnroll
		  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then 
		  strBody = strBody & "<tr><td>For alternate payment options, please <a href=""http://www.itilstudy.com/payforclass.asp"" target=""_blank"">click here</a></font>"
		  End If
		  
		  strBody = strBody & "</td></tr>"
		  
					 
		  'If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Germany") Then
		  If (Session("CountryOrigin") = "United Kingdom") Then
		  strBody = strBody & "<tr><td align=""left"" colspan=""2""><span style=""color:red""><sup>*</sup></span> : VAT registration number - GB 117 6616 13<br>This is a Proforma Invoice. Not eligible for VAT claims. </td></tr>"
		   ElseIf Session("CountryOrigin") = "Australia" Then
		   strBody = strBody & "<tr><td align=""left"" colspan=""2""><span style=""color:red""><sup>*</sup></span> : GST Registration Number: ABN 55 152 303 038<br>This is a Proforma Invoice. Not eligible for GST claims. </td></tr>"
		   ElseIf (Session("CountryOrigin") = "India") Then
		  strBody = strBody & "<tr><td align=""left"" colspan=""2""><br><span style=""color:red""><sup>*</sup></span> : Service tax registration number - AABCE3423BST001<br>This is a Proforma Invoice. Not eligible for TAX claims. </td></tr>"
		  
		  End If 
		  
		  strBody = strBody & "</font></td></tr>"
		  strBody = strBody & "<tr><td align=""center"" colspan=""3""><br><font face=""Arial"" color = ""green"" size=""3"">We look forward to having you as a student with ITILstudy.com "&rqCourseType&" Training!!!</font></td></tr>"
		  strBody = strBody & "<tr><td align=""left""><br><font face=""Arial"" size=2>Best Regards,</font></td></tr>"
		  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=2><br>Customer Support</font></td></tr>"
		  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=2><a href=""http://www.ITILstudy.com"" target=""_blank"">www.ITILstudy.com</a></font></td></tr>"
		  'strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=2>(PMI Approved Global Registered Education Provider)</font></td></tr>"
		  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=2>Email: marketing@ITILstudy.com</font><br><br><hr></hr><div align=""center""><font size=""1px"">"
		  If Session("CountryOrigin") = "India" Then
		  strBody = strBody & "EDUsys Services Private Limited<br>Santosh Towers,4th Main,100 Ft. Ring Road, J.P. Nagar 4th Phase,<br>Bangalore - 560078, India"
		  End If
		 strBody = strBody & "<br/></font></div></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr></table></td></tr><tr><td height=""45%"">&nbsp;</td></tr></table>"


'Response.Write(strBody)

 		 Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
		 objCDOMail.From = "marketing@ITILstudy.com"
		 objCDOMail.To =  "marketing@ITILstudy.com"
		 'objCDOMail.From = "edusyssavita@gmail.com"
		' objCDOMail.To =  "edusyssavita@gmail.com"
		 objCDOMail.cc = "itilstudysales@gmail.com"
		 'If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India") Then
		 'objCDOMail.Bcc = "satpathyt@gmail.com,pmstudysales@gmail.com,itilstudysales@gmail.com, edusysgaurav@gmail.com, edusysayan@gmail.com"
		' objCDOMail.Bcc = "edusyssavita@gmail.com"
		' Else
		' objCDOMail.Bcc = "satpathyt@gmail.com"
		 'End If
		 objCDOMail.Importance = 2
		 objCDOMail.Subject = "Enrollment in " & City & " ITILstudy "&rqCourseType&" Coaching"
		 objCDOMail.BodyFormat = 0
		 objCDOMail.MailFormat = 0
		 objCDOMail.Body =  strBody
		 objCDOMail.Send
		 Set objCDOMail = Nothing

%>
<div>
<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
  <table width="100%" border="0" cellspacing="0" cellpadding="8">
    <tr>
      <td width="2%" class="Header">&nbsp;</td>
      <td width="25%" class="PageTitle">&nbsp;</td>
      <td width="73%" class="PageTitle">ITILstudy Foundation <% = rqCourseType %> Program
        </td>
    </tr>
    <tr>
    <!--#include virtual="/includes/innerLeftMenu.asp"-->
    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
    <div style="margin-top:-12px;">
    <!-- Content Start From Here-->
    <table width="97%" border="0" cellpadding="0" cellspacing="0" class="general-body">
      <tr>
        <td colspan="2" align="center" class="general-body"><br />
          <div align="center"><span class="Header">COURSE ENROLLMENT DETAILS <% If (Session("CountryOrigin") <> "United Kingdom") Then %>(INVOICE)<% End If %>
            <% If (Session("CountryOrigin") <> "India") Then %>
            <br />
            ITILstudy <% = rqCourseType %> Program </span>
            <% Else %>
            <br />
            ITILstudy <% = rqCourseType %> Program</span>
            <% End If %>
            <br />
            <br />
          </div></td>
      </tr>
      <tr>
        <td align="right" colspan="2"><div align="right"><span class="general-bodyBold">
            <% = FormatDateTime(todaysDate,1) %>
            </span></div></td>
      </tr>
      <tr>
        <td class="general-body"><span class="general-bodyBold">Enroll ID: </span>
          <% = Session("EnrollId") %></td>
      </tr>
      <tr>
        <td class="general-body"><span class="general-bodyBold">Name: </span>
          <% = Session("FirstName") %>
          &nbsp;
          <% =  Session("LastName") %></td>
      </tr>
      <tr>
        <td class="general-body"><span class="general-bodyBold">Email: </span>
          <% = Session("Email") %></td>
      </tr>
      <tr>
        <td class="general-body"><span class="general-bodyBold">Phone Number: </span>
          <% = Session("PhoneNumber") %></td>
      </tr>
      <tr>
        <td class="general-body"><span class="general-bodyBold">Name Of Employer/Business: </span>
          <% = Session("NameOfEmployeer") %></td>
      </tr>
      <tr>
        <td colspan="2" class="general-body"><br>
          <span class="Header">Details of your course and Payment: </span><br>
          <br />
          <table border="0" width="95%" cellspacing="0" class="TableGeneral">
            <tr>
              <td align="center" class="TableRowOdd" width="85%"><span class="HeaderLarge">Details</span></td>
              <td align="center" class="TableRowOdd"><span class="HeaderLarge">Payment</span></td>
            </tr>
            <tr>
              <td class="TableRowEven"><span class="TableCopyName">ITIL<sup>&reg;</sup> Foundation <% = rqCourseType %> training <br />
                <% = CourseDetails %>
                </span><br>
              </td>
              <% 'If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Germany") Then %>
              <% If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Australia") Then %>
              <td align="center" class="TableRowEven"><span class="TableCopyName">
                <% = Currency_Format_Front %>
                <% = FormatNumber(TotalWithoutTax) %>
                <% = Currency_Format_Back %>
                </span></td></tr>
              <tr>
              <td class="TableRowEven"><span class="TableCopyName"><% If (Session("CountryOrigin") = "United Kingdom") Then %>VAT: @ 20%<% ElseIf (Session("CountryOrigin") = "India") Then %><% =  Tax %>% service tax <% ElseIf Session("CountryOrigin") = "Australia"  Then %>GST: @ 10%<% End If %></span></td><td align="center" class="TableRowEven"><span class="TableCopyName">
                <% = Currency_Format_Front %>
                <% = FormatNumber(VAT) %>
                <% = Currency_Format_Back %>
                </span></td>  </tr>                           
              <% Else %>
              <td align="center" class="TableRowEven"><span class="TableCopyName">
                <% = Currency_Format_Front %>
                <% = FormatNumber(Total) %>
                <% = Currency_Format_Back %>
                </span></td></tr>
              <% End If %>
            
            <tr>
              <td align="right" class="Tablefooter"><span class="TableCopyName">Total</span></td>
              <td align="center" class="Tablefooter"><span class="TableCopyName">
                <% = Currency_Format_Front %>
                <% = FormatNumber(Total) %>
                <% = Currency_Format_Back %>
                </span></td>
            </tr>
          </table>
          <br>
        </td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      <% 	
	  
		'Generating unique order id'
		orderid = "ITILCS"&Session("CountryOrigin")

		Order_ID = orderid &""& Session("EnrollID")		
			  
	   'Here i am showing hotel details for particular class'
				'Only for US and Canada Courses'
				 If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Australia") Then
				If Not IsNull(HotelAddress) And HotelAddress <> "" AND rqCourseType <> "Live"  Then %>
      <tr>
        <td colspan="2"><table border="0" width="100%">
            <tr>
              <td width="130px"><strong>Venue Details:</strong></td>
              <td width="870px"><% = HotelName %>
                <br />
                <% = HotelAddress %>
                <br />
                <% = City %>
                <br />
                <% If HotelPhNo <> "" Then %>
                Ph:
                <% = HotelPhNo %>
                .<br />
                <% End If %>
                <a href="<% = HotelURL %>" target="_blank">
                <% = HotelURL %>
                </a><br />
                <br>
              </td>
            </tr>
          </table></td>
      </tr>
      <% End If
		 End If %>
      <tr>
        <td colspan="2" class="general-body"><strong>Please Note: </strong><br>
	 Full payment of the enrollment fee <strong>(
          <% = Currency_Format_Front %>
          <% =  FormatNumber(Total) %>
          <% = Currency_Format_Back %>
          )</strong> should be done through: <br />
         
          <% If Session("CountryOrigin") = "India" Then %>
          <ul>
            <li><b>Cheque or Demand Draft</b> favoring "EDUSYS SERVICES PVT LIMITED"<br />
              This should be couriered to the following address:<br />
              Edusys Services Pvt Limited,<br />
              #27, 2nd Floor, Santosh Towers,<br />
              4th Main,100 Ft. Ring Road,<br />
              J.P. Nagar 4th Phase,<br />
              Bangalore - 560078<br />
              India</li>
            <li><b>Bank Transfer:</b> Payee Name: EDUSYS SERVICES PVT LIMITED <br />
              Bank Name : ICICI Bank Limited<br />
              Account Number : ICICI Bank A/c No : 0401 0500 0128<br />
              Branch Name : ICICI Bank, J.P. Nagar Branch, Bangalore</li>
			 
			  <li><font face="Arial" size="2"><b>Payment through Credit card or Debit card:</b></font>&nbsp;&nbsp;<a href="http://www.mycatstudy.com/itilstudy_makepayment.asp?enrollUserID=<% = Session("EnrollId")%>&Country=<% = Session("CountryOrigin") %>"><font face="Arial" size="3" color="#0359b4"><b>Buy Now</b></font></a><br /></li>
          
		    <li>Alternate Payment Mechanism: If you have problems in making payments through Cheque or Demand Draft, please email us at <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com</a>; we will suggest alternate payment options to you.</li>
          </ul>
      </tr>
      <% ElseIf (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") Then %>
      <tr>
        <td class="btext"><table border="0" width="100%">
            <tr>
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>1. Google Checkout </B></td>
              <td><form action="https://checkout.google.com/api/checkout/v2/checkoutForm/Merchant/749730688196705" id="BB_BuyButtonForm" method="post" name="BB_BuyButtonForm">
                  <input name="item_name_1" type="hidden" value="ITILstudy <% = rqCourseType %> Training"/>
                  <input name="item_description_1" type="hidden" value="ITILstudy <% = rqCourseType %> Training"/>
                  <input name="item_quantity_1" type="hidden" value="1"/>
                  <input name="item_price_1" type="hidden" value="<% = Total %>"/>
                  <input name="item_currency_1" type="hidden" value="USD"/>
                  <input name="_charset_" type="hidden" value="utf-8"/>
                  <input alt="" src="https://checkout.google.com/buttons/buy.gif?merchant_id=749730688196705&amp;w=117&amp;h=48&amp;style=white&amp;variant=text&amp;loc=en_US" type="image" align="middle"/>
                </form></td>
            </tr>
            <tr>
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>2. Paypal </B></td>
              <td><form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                  <input type="hidden" name="cmd" value="_xclick">
                  <input type="hidden" name="business" value="vmeduinc1@gmail.com">
                  <input type="hidden" name="item_name" value="ITILstudy <% = rqCourseType %> Course  - <% = Session("CountryOrigin") %>">
                  <input type="hidden" name="currency_code" value="USD">
                  <input type="hidden" name="amount" value="<% = Total %>">
                  <input name="item_name" type="hidden" value="<% = CourseDetails %>"/>
                  <input type="image" src="/images/back/buybutton.gif" alt="BuyNow" />
                </form></td>
            </tr>
         
      <tr>
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>3. Bank Transfer :</B></td>
              <td><b>Bank Name: </b>Bank of America, Frederick, MD, USA<br />
                <b>Type of Account:</b> Current<br />
                <b>Account Name:</b> VMedu Inc<br>
                <b>Account Number: </b>4460 0519 5480<br>
                <b>Routing Number:</b> 052001633 (paper & electronic) / 026009593 (wires) <br /></td>
             
            </tr>
          </table></td>
      </tr>
      <% ElseIf Session("CountryOrigin") = "UAE" Then %>
      <tr>
        <td class="btext"><table border="0">
            <%
				 If(Application("ccvar2")>10000) Then

				 Else

					Application("ccvar2")=int(now())*10000

				 End If
			  %>
            <tr>
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>1. Paypal </B></td>
              <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                <input type="hidden" name="cmd" value="_xclick">
                <input type="hidden" name="business" value="adminsupport@projstudy.com">
                <input type="hidden" name="item_name" value="ITILstudy <% = rqCourseType %> Training - <% = Session("CountryOrigin") %>">
                <input type="hidden" name="item_number" value="5007">
                <input type="hidden" name="amount" value="<% = Total %>">
                <input type="hidden" name="cancel_return" value="http://www.itilstudy.com">
                <input type="hidden" name="return" value="http://www.itilstudy.com/payment-success.asp">
                <input type="hidden" name="rm" value="2">
                <input type="hidden" name="currency_code" value="USD">
                <td><input type="image" src="/images/back/buybutton.gif" alt="BuyNow" /></td>
              </form>
            </tr>
            <tr>
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>2. CCAvenue</B></td>
              <%
		  Merchant_Id	   = "t_satpat1848" 
		  Order_Id       = Order_ID	
		  Amount  = TotalCCAvenue
		  currency_type  = "USD"		
		  Redirect_Url   = "http://www.itilstudy.com/payment-success.asp"
		  WorkingKey	 = "dpgnrv2li2jvxivqk1qjg3tbm89unbxk"
		  Checksum	   = getChecksum(Merchant_Id, Order_Id, Amount, WorkingKey, currency_type, Redirect_Url)
		  
		  %>
              <td width="900px"><form method="post" action="http://www.pmstudy.com/itil_ccavenue.asp">
                  <input type="hidden" name="Merchant_Id" value="<%=Merchant_Id%>">
                  <input type="hidden" name="item_name" value="ITILstudy <% = rqCourseType %> Training - <% = Session("CountryOrigin") %>">
                  <input type="hidden" name="item_number" value="5007">
                  <input type="hidden" name="Amount" value="<% = Amount %>">
                  <input type="hidden" name="ITIL_country" value="<% = Session("CountryOrigin") %>">
                  <input type="hidden" name="TotalCCAvenue" value="<% = TotalCCAvenue %>">
				  <input type="hidden" name="Order_Id" value="<%=Order_Id%>">
                  <input type="hidden" name="Currency" value="<% = currency_type %>">
                  <input type="hidden" name="TxnType" value="A">
                  <input type="hidden" name="actionID" value="txn">
                  <input type="hidden" name="Redirect_Url" value="<%=Redirect_Url%>">
                  <input type="hidden" name="Checksum" value="<%=Checksum%>">
                  <input type="image" src="/images/back/buybutton.gif" alt="BuyNow" />
                </form></td>
            </tr>
          </table></td>
      </tr>
	   <% ElseIf Session("CountryOrigin") = "Singapore" Then %>
      <tr>
        <td class="btext"><table border="0">
            <%
				 If(Application("ccvar2")>10000) Then

				 Else

					Application("ccvar2")=int(now())*10000

				 End If
			  %>
            <tr>
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>1. Paypal </B></td>
              <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                <input type="hidden" name="cmd" value="_xclick">
                <input type="hidden" name="business" value="adminsupport@projstudy.com">
                <input type="hidden" name="item_name" value="ITILstudy <% = rqCourseType %> Training - <% = Session("CountryOrigin") %>">
                <input type="hidden" name="item_number" value="5007">
                <input type="hidden" name="amount" value="<% = Total %>">
                <input type="hidden" name="cancel_return" value="http://www.itilstudy.com">
                <input type="hidden" name="return" value="http://www.itilstudy.com/payment-success.asp">
                <input type="hidden" name="rm" value="2">
                <input type="hidden" name="currency_code" value="SGD">
                <td><input type="image" src="/images/back/buybutton.gif" alt="BuyNow" /></td>
              </form>
            </tr>
            
          </table></td>
      </tr>
	  <% ElseIf Session("CountryOrigin") = "United Kingdom" Then  %>
	  <tr>
        <td class="btext"><table border="0" width="100%">
            <tr>
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>1. Google Checkout </B></td>
				<td><form action="https://checkout.google.com/api/checkout/v2/checkoutForm/Merchant/924725040306386" id="BB_BuyButtonForm" method="post" name="BB_BuyButtonForm" target="_top">
                        <input name="item_name_1" type="hidden" value="ITILstudy <% = rqCourseType %> Training "/>
                        <input name="item_description_1" type="hidden" value="ITILstudy <% = rqCourseType %> Training "/>
                        <input name="item_quantity_1" type="hidden" value="1"/>
                        <input name="item_price_1" type="hidden" value="<% = Total %>"/>
                        <input name="item_currency_1" type="hidden" value="GBP"/>
                        <input name="_charset_" type="hidden" value="utf-8"/>
                        <input alt="" src="https://checkout.google.com/buttons/buy.gif?merchant_id=749730688196705&amp;w=117&amp;h=48&amp;style=white&amp;variant=text&amp;loc=en_US" type="image" align="middle"/>
                    </form>		</td>
            </tr>
            <tr>
			
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>2. Paypal </B></td>
              <td><form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                      <input type="hidden" name="cmd" value="_cart"> 
                      <input type="hidden" name="upload" value="1"> 
                      <input type="hidden" name="business" value="edusysservices@gmail.com">    
                      <input type="hidden" name="item_name_1" value="ITILstudy <% = rqCourseType %> Training - <% = Session("CountryOrigin") %>">
                      <input type="hidden" name="currency_code" value="GBP">  
    					<input name="item_name" type="hidden" value="<% = CourseDetails %>"/>
						 <input type="hidden" name="amount_1" value="<% = Total %> "/> 
						  <input type="hidden" name="cancel_return" value="http://www.ITILstudy.com">
                  <input type="hidden" name="return" value="http://www.ITILstudy.com/payment-success.asp">
						<input type="image" src="/images/back/buybutton.gif" alt="BuyNow" />
                </form>
				
				</td>
            </tr>
		
          </table></td>
      </tr>
                       

           <% ElseIf (Session("CountryOrigin") = "Australia") Then%>
      <tr>
        <td class="btext"><table border="0" width="100%">
            <tr>
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>1. Paypal </B></td>
              <td>
			  <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
					<input type="hidden" name="cmd" value="_xclick">
					<input type="hidden" name="business" value="edusysaus@gmail.com">
					<input type="hidden" name="item_name" value="ITILstudy <% = rqCourseType %> Training  - <% = Session("CountryOrigin") %>">
					<input type="hidden" name="amount" value="<% = Total %> "/> 
					<input type="hidden" name="cancel_return" value="http://www.ITILstudy.com">
					<input type="hidden" name="return"  value="http://www.ITILstudy.com/payment-success.asp">
					<input type="hidden" name="currency_code"  value="AUD">  
					<input type="image" src="/images/back/buybutton.gif" alt="BuyNow" />
					</form>
				<!--	<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                      <input type="hidden" name="cmd" value="_cart"> 
                      <input type="hidden" name="upload" value="1"> 
                      <input type="hidden" name="business" value="edusysservices@gmail.com">    
                      <input type="hidden" name="item_name_1" value="ITILstudy <% = rqCourseType %> Training  - <%' = Session("CountryOrigin") %>">
                      <input type="hidden" name="currency_code" value="AUD">  
    				  <input name="item_name" type="hidden" value="<%' = CourseDetails %>"/>
					  <input type="hidden" name="amount_1" value="<%' = Total %> "/> 
					  <input type="hidden" name="cancel_return" value="http://www.ITILstudy.com">
                      <input type="hidden" name="return" value="http://www.ITILstudy.com/payment-success.asp">
					  <input type="image" src="/images/back/buybutton.gif" alt="BuyNow" />
                   </form>-->
			  
			  <br /></td>
            </tr>
			 <tr>
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>2. Bank Transfer :</B></td>
              <td><b>Bank Name:</b> ANZ Bank (Australia and New Zealand Banking Group Limited)<br />
               <b>Account Name:</b> EDUSYS SERVICES PTY LTD<br>
               <b>Account Number: </b>376446238<br>
               <b>BSB (Bank State Branch):</b> 012055<br /><br /></td>
             </td>
            </tr>
          </table></td>
      </tr>
      <% End If %>
      <tr>
        <td colspan="2" class="general-body"><% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then %>
          <br />
          For alternate payment options, please <a href="/payforclass.asp" target="_blank">click here</a>. <br />
          <br />
          <% End If 
			If (Session("CountryOrigin") = "India") Then %>
		<span style=""color:red""><sup>*</sup></span> : Service tax registration number - AABCE3423BST001<br>This is a Proforma Invoice. Not eligible for TAX claims. <br /><br />
		  
		  <%End If%> 
         
        
        </td>
      </tr>
      <tr>
        <td colspan="3"><div align="center"> <font face="Arial" color = "green" size="2.5"><br />
            <b>We look forward to having you as a student with ITILstudy.com <% = rqCourseType %> Training!!!</b></font></div></td>
      </tr>
      <tr>
        <td><br />
          <br />
          Best Regards,<br />
          <br />
          Customer Support<br />
          <a href="http://www.itilstudy.com">www.ITILstudy.com</a><br />
          Email: marketing@ITILstudy.com</span></td>
      </tr>
      <%
					 'Clear the session variables'
					' Session("FirstName1")    =  ""
'					 Session("LastName1")     =  ""
'					 Session("Email1")        =  ""
'					 Session("PhoneNumber1")  =  ""
'					 Session("Course1")       =  ""
'					 Session("SelectedCourseID") = ""
'					 Session("message") = ""
	  %>
    <!-- Google Code for Enrollment Submission - CR Conversion Page -->
<% If (Session("CountryOrigin") = "United Kingdom" ) Then %>
	 <!-- Google Code for ITILStudy UK Enroll Success Page Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "2";
var google_conversion_color = "ffffff";
var google_conversion_label = "JxzaCLPooQIQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?label=JxzaCLPooQIQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


 <% ElseIf (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" ) Then %>
	 <!-- Google Code for ITIL USA Enroll Success Page Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "2";
var google_conversion_color = "ffffff";
var google_conversion_label = "xKlDCKvpoQIQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?label=xKlDCKvpoQIQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>

<% ElseIf (Session("CountryOrigin") = "UAE") Then %>
	 
<!-- Google Code for ITILstudy UAE Enroll Success Page Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "2";
var google_conversion_color = "ffffff";
var google_conversion_label = "tXL8CKPqoQIQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?label=tXL8CKPqoQIQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


 <% ElseIf (Session("CountryOrigin") = "Singapore") Then %>
	 <!-- Google Code for ITILstudy Singapore Enroll Success Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "2";
var google_conversion_color = "ffffff";
var google_conversion_label = "vG4iCJvroQIQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?label=vG4iCJvroQIQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>

<% ElseIf (Session("CountryOrigin") = "Australia") Then %>
<!-- Google Code for ITILstudy Australia Enroll Success PAge Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "2";
var google_conversion_color = "ffffff";
var google_conversion_label = "xBE-CJPsoQIQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?label=xBE-CJPsoQIQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


<% ElseIf (Session("CountryOrigin") = "India") Then %>
    <!-- Google Code for ITILstudy India Enroll Success Page Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1017900619;
var google_conversion_language = "en";
var google_conversion_format = "2";
var google_conversion_color = "ffffff";
var google_conversion_label = "hDYrCOW3wAIQy9yv5QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1017900619/?label=hDYrCOW3wAIQy9yv5QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>

<% End If %>
    </div>
    </td>
   </tr>
  </table>
  <!-- Content End From Here-->
  <!--#include virtual="/includes/connectionClose.asp"-->
  </td>
  </tr>
</table>
</div>
<!-- Google Code for EnrollClass Conversion Page -->
<script type="text/javascript">
<!--
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "2";
var google_conversion_color = "ffffff";
var google_conversion_label = "-vhlCLeGqQEQx8Kz6QM";
var google_conversion_value = 0;
//-->
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;"> <img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?label=-vhlCLeGqQEQx8Kz6QM&amp;guid=ON&amp;script=0"/> </div>
</noscript>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
