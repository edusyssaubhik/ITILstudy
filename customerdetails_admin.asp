<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerindustryrecognizedbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/libfuncs.asp"-->

  <script type="text/javascript">
					<!--
					//Validating The Email

					function echeck(str) {

							var str1 = str.value
							var at="@"
							var dot="."
							var lat=str1.indexOf(at)
							var lstr=str1.length
							var ldot=str1.indexOf(dot)
							if (str1.indexOf(at)==-1){
							   alert("Invalid E-mail ID")
							   return false
							}

							if (str1.indexOf(at)==-1 || str1.indexOf(at)==0 || str1.indexOf(at)==lstr){
							   alert("Invalid E-mail ID")
							   return false
							}

							if (str1.indexOf(dot)==-1 || str1.indexOf(dot)==0 || str1.indexOf(dot)==lstr){
								alert("Invalid E-mail ID")
								return false
							}

							if (str1.indexOf(at,(lat+1))!=-1){
								alert("Invalid E-mail ID")
								return false
							}

							if (str1.substring(lat-1,lat)==dot || str1.substring(lat+1,lat+2)==dot){
								alert("Invalid E-mail ID")
								return false
							}

							if (str1.indexOf(dot,(lat+2))==-1){
								alert("Invalid E-mail ID")
								return false
							}

							if (str1.indexOf(" ")!=-1){
								alert("Invalid E-mail ID")
								return false
							}
							
							  if (str1.indexOf(",")!=-1){
            					alert("Invalid E-mail ID")
            					return false
       							 }      

							return true
						}

					function validate_required(field,alerttxt)
					{
						with (field)

						{
							if (field.value=="")
							  {alert(alerttxt);return false}
							else {return true}
						}
					}

					function validate_special(field,alerttxt)
					{
						var iChars = "!#$%^&*@()+=-[]\\\;,{}|\":<>?./";

						with (field)
						{
							for (var i = 0; i < value.length; i++) {
								if (iChars.indexOf(value.charAt(i)) != -1) {
								alert (alerttxt);
								return false;
								}
							}
						}
					}

					function validate_specialcharacters(field,alerttxt)
					{
						var iChars = "!#$%^&*@()+=[]\\\;{}|\":<>?";

						with (field)
						{
							for (var i = 0; i < value.length; i++) {
								if (iChars.indexOf(value.charAt(i)) != -1) {
								alert (alerttxt);
								return false;
								}
							}
						}
					}


					function validate_number(field,alerttxt)
					{
						var iChars = "0123456789-/,";

						with (field)
						{
							for (var i = 0; i < value.length; i++) {
								if (!(iChars.indexOf(value.charAt(i)) != -1)) {
								alert (alerttxt);
								return false;
								}
							}
						}
					}

					function validate_noNumber(field,alerttxt)
					{
						var iChars = "0123456789";

						with (field)
						{
							for (var i = 0; i < value.length; i++) {
								if ((iChars.indexOf(value.charAt(i)) != -1)) {
								alert (alerttxt);
								return false;
								}
							}
						}
					}



					function validate_form(thisform)
					{
						with (thisform)
						{

						// Check The First Name Field Empty Or Not

						if (validate_required(first_name,"Please Enter Your First Name")==false)
							  {first_name.focus();return false}

						// Check The If You Given Any Special Characters In First Name Field

						if (validate_special(first_name,"Your First Name Has Special Characters. \n Please remove them and try again")==false)
									  {first_name.focus();return false}

						// Check The Your First Name Have Numerals in Frist Name Field

						if (validate_noNumber(first_name,"Your First Name Has Numerals")==false)
								  {first_name.focus();return false}

						// Check The Last Name Field Empty Or Not

						if (validate_required(last_name,"Please Enter Your Last Name")==false)
							  {last_name.focus();return false}

						
						// Check The Your lastname Field Have Numerals

						if (validate_noNumber(last_name,"Your Last Name Has Numerals")==false)
								  {last_name.focus();return false}
								  
						// Check The EMail Field Empty Or not

						if (validate_required(payer_email,"Please Enter Your EmailId")==false)
							  {payer_email.focus();return false}
							  

						// Check The Eamil Validation

						if (echeck(payer_email)==false)
							  {payer_email.focus();return false}
								  
						// Check The Name of Employer/Business Field Empty Or Not

						if (validate_required(custom,"Please Enter Name of Employer/Business")==false)
							 {custom.focus();return false}
							 
													  
						// Check The Phone number Field Empty Or Not

						if (validate_required(ebay_address_id,"Please enter phone number")==false)
							  {ebay_address_id.focus();return false}

						// Check The Phone Number Have Special Characters

						if (validate_specialcharacters(ebay_address_id,"Your phone number Has Special Characters. \n Please remove them and try again")==false)
									  {ebay_address_id.focus();return false}

						// Check The Phone Number Field Have numerals

						if (validate_number(ebay_address_id,"Your phone number is not a numeral")==false)
							  {ebay_address_id.focus();return false}
					
					
					 // Check The Country Name Field Empty Or Not

						if (validate_required(country,"Please Enter country Name")==false)
							  {country.focus();return false}

						// Check The If You Given Any Special Characters In Country Name Field

						if (validate_special(country,"Country Name Has Special Characters. \n Please remove them and try again")==false)
									  {country.focus();return false}

						// Check The Your Country Name Have Numerals in Country Name Field

						if (validate_noNumber(country,"Country Name Has Numerals")==false)
								  {country.focus();return false}
								  
					   // Check The state Name Field Empty Or Not

						if (validate_required(state,"Please Enter State Name")==false)
							  {state.focus();return false}

						// Check The If You Given Any Special Characters In state Name Field

						if (validate_special(state,"State Name Has Special Characters. \n Please remove them and try again")==false)
									  {state.focus();return false}

						// Check The Your state Name Have Numerals in Frist Name Field

						if (validate_noNumber(state,"State Name Has Numerals")==false)
								  {state.focus();return false}
								  
								  
					    // Check The City Name Field Empty Or Not

						if (validate_required(city,"Please Enter City Name")==false)
							  {city.focus();return false}

						// Check The If You Given Any Special Characters In City Name Field

						if (validate_special(city,"City Name Has Special Characters. \n Please remove them and try again")==false)
									  {city.focus();return false}

						// Check The Your City Name Have Numerals in Frist Name Field

						if (validate_noNumber(city,"City Name Has Numerals")==false)
								  {city.focus();return false}
								  
					
					
					 }
					 
					
					
					 						
					    if (thisform.address_country.value == "")
						  {
							 alert("Please Select Country");
							 thisform.address_country.focus();
							 return (false);
	
						}
					}



					-->
					</script>
<!-- Body Starts -->


<div>
<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td height="235" align="left" valign="top" bgcolor="#FFFFFF">
<table width="100%" border="0" cellspacing="0" cellpadding="8">
<tr>
  <td width="2%" class="Header">&nbsp;</td>
  <td width="25%" class="PageTitle">&nbsp;</td>
  <td width="73%" class="PageTitle">Customer Enrollment</td>
</tr>
<tr>
<!--#include virtual="/includes/innerLeftMenu.asp"-->
<td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
<div style="margin-top:-10px; width:95%;">
  <!-- Content Start From Here-->
 
 <div><%
						'Declare The Local Variables'
						Dim SIPAddress1
						
						Set Rs4 = Server.CreateObject("ADODB.Recordset")

						SIPAddress1 = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
						
						
							WorkingKey	=  "dpgnrv2li2jvxivqk1qjg3tbm89unbxk"  'Put in the 32 bit working key in the quotes provided here'
							MerchantId	=  Trim(Request.Form("Merchant_Id"))   'Your Merchant ID
							OrderId		=  Trim(Request.Form("Order_Id"))	   'Your Unique Order ID	
							Amount   =  Trim(Request.Form("Amount"))	
							Auth_Status	=  Trim(Request.Form("Auth_Status"))   'Order Status
							Checksum	=  Trim(Request.Form("checkSumAll"))   'Checksum Value
							currency_type =	Trim(Request.Form("Currency"))	   'Transaction Currency
							Merchant_Param	= Request.Form("Merchant_Param")   'Your Additional Merchant Parameter
							Redirect_Url =	"http://www.ITILstudy.com/customerdetails_admin.asp"	'Your Return URL where your customer will be redirected after authorisation from 	CCAvenue
							
						
							isChecksumOk =		verifyCheckSumAll(MerchantId, OrderId , Amount, WorkingKey, currency_type, Auth_Status, Checksum)						

							If ((isChecksumOk = "true") and (Auth_Status = "Y")) Then
									Auth_Status = "Y"
							
							ElseIf ((isChecksumOk = "true") and (Auth_Status = "N")) Then
									Auth_Status = "N"
							
							ElseIf ((isChecksumOk = "true") and (Auth_Status = "B")) Then
									Auth_Status = "N"
							
							Else
									Auth_Status = "N"
							
							End If 

						

						If SIPAddress1="" Then SIPAddress1 = Request.ServerVariables("REMOTE_ADDR")

							If(Request.Form("item_number") = "" And Session("ItemName") = "" And Auth_Status = "N") Then
						%>
						</div>
  <div class="general-body"><br /><br />Your payment was not successful. If you are finding difficulty in paying through <a href="/ITIL-Online-Courses.asp">Paypal.com</a>, please make the payment through our alternate payment processor, Google Checkout: <a href="/ITIL-Online-Courses.asp">Please click here to pay using </a> Google Checkout. Please note that payment from all countries can be made through Google Checkout.

    <% Else%>
    <%
						'Declare The Local Variables'
						Dim item_name, item_number, receiver_email, payment_status, mc_currency, payer_email,first_name, last_name, SPHRPHR
						Dim payment_date, address_street, address_zip, custom, address_country, address_city, address_state, payment_fee
						Dim payment_gross, mc_gross, paypal_address_id, payer_id, address_status,payer_status, mc_fee, business
						Dim quantity, verify_sign, address_name, payment_type, txn_id, payer_business_name, address_owner, receiver_id
						Dim ebay_address_id, txn_type, tax, notify_version, password
						Dim date_entered, date_valid, pass
						Dim objHttp, str, itemNumber,date_Val
						Dim course_desc, course_proc, DateValid
						Dim objHtp1, strQuery2,rollNo,R,strQuery
						Dim rqModeOfPayment,rqPaymentdate,rqTraDetails
						
						'Replace method
						Function StrQuoteReplace(strValue)
						StrQuoteReplace = Replace(strValue, "'", "''")
						End Function
						
						Set objRs = Server.CreateObject("ADODB.Recordset")
						
						'Checking the email id existing or not and if its exists checking the couse validity'
						'Checking code start from here'
						If Request.Form("manualenroll") <> "" Then
						
						strEmailID = "SELECT top 1 payer_email, first_name, last_name, item_name, date_valid, paypal_address_id FROM PaypalDb WHERE payer_email = '"&Request.Form("payer_email")&"' ORDER BY id desc"

						objRs.Open strEmailID,ConnObj
						
						Do Until objRs.EOF 
						
							dateValid = objRs("date_valid")
							firstName = objRs("first_name")
							lastName  = objRs("last_name")
							Course    = objRs("paypal_address_id")
							itemName  = objRs("item_name")
						    pEmail    = objRs("payer_email")
							
						objRs.Movenext
						Loop
						objRs.Close
						
						If(CDate(dateValid)-(Date())>=0) then
						
						%>
                        <br>Name: <% = firstName %>&nbsp;<% = lastName %><br />
                        Email ID: <% = pEmail %><br /><br />
                        User already enrolled for "<% = Course %> &nbsp; <% = itemName %>" which is valid till "<% = FormatDateTime(dateValid,1) %>"<br /><br />
                        So, please use another email address to enroll.<br /><br />
                        <%
							Response.End()
						End If
								
						End If
						'Checking code end here'
						
						
						'This if conction works first time come to this page'
						If Request.Form("item_number") <> "" Then
						
							item_number = Request.Form("item_number")
							item_name   = Request.Form("item_name")
							first_name = Request.Form("first_name")
							last_name  = Request.Form("last_name")
							payer_email= Request.Form("payer_email")
							date_Val = Request.Form("date_val")
							rqModeOfPayment = Request.Form("ModeOfPayment")
							rqPaymentdate = Request.Form("Paymentdate")
							rqTraDetails = Request.Form("TraDetails")							
						
						'This else if  works if already exists the same email id'
						'Retriving the values from verifycustomerdetails.asp page and do the session("FirstName) is empty'
						ElseIf Session("ItemName") <> "" Then
						
							item_number = Session("ItemNumber")
							item_name   = Session("ItemName")
							first_name = Session("First_Name")
							last_name = Session("Last_Name")
							date_Val = Request.Form("date_val")
							custom = Session("Custom") 
							phoneNo = Session("PhoneNo") 
							Session("First_Name") = ""
							
						End If
						
						
						If (item_name = "Free Simulated Test") OR (item_name = "Understand ITIL Exam") Then

							APMG = Request.Form("APMG")
							
						ElseIf Request.Form("Merchant_Param") <> "" Then
						
							WorkingKey	=  "dpgnrv2li2jvxivqk1qjg3tbm89unbxk"  'Put in the 32 bit working key in the quotes provided here'
							MerchantId	=  Trim(Request.Form("Merchant_Id"))   'Your Merchant ID
							OrderId		=  Trim(Request.Form("Order_Id"))	   'Your Unique Order ID	
							Amount   =  Trim(Request.Form("Amount"))	
							Auth_Status	=  Trim(Request.Form("Auth_Status"))   'Order Status
							Checksum	=  Trim(Request.Form("checkSumAll"))   'Checksum Value
							currency_type =	Trim(Request.Form("Currency"))	   'Transaction Currency
							Merchant_Param	= Request.Form("Merchant_Param")   'Your Additional Merchant Parameter
							Redirect_Url =	"http://www.ITILstudy.com/customerdetails_admin.asp"	'Your Return URL where your customer will be redirected after authorisation from 	CCAvenue
							
						
							isChecksumOk =		verifyCheckSumAll(MerchantId, OrderId , Amount, WorkingKey, currency_type, Auth_Status, Checksum)						
	
							'Assign Posted Variables To Local Variables'
							pass = "ITIL"
							item_number     =  Trim(Request.Form("Merchant_Param"))
							payer_email     =  Request.Form("billing_cust_email")
							first_name      =  Request.Form("billing_cust_name")
							last_name       =  Request.Form("billing_last_name")
							address_street  =  Request.Form("address_street")
							address_zip     =  Request.Form("billing_cust_zip")
							custom          =  Request.Form("custom")
							address_country =  Request.Form("billing_cust_country")
							address_city    =  Request.Form("billing_cust_city")
							address_state   =  Request.Form("billing_cust_state")
							payment_fee     =  Request.Form("payment_fee")
							payment_gross   =  Trim(Request.Form("Amount"))	
							mc_gross        =  Request.Form("mc_gross")
							date_entered    =  Date()
							kno = 0
							txn_id          =  Trim(Request.Form("Order_Id"))
							mc_currency     =  Trim(Request.Form("Currency"))
							

						Else

						'Read Post From PayPal System And Add 'cmd'
						str = Request.Form & "&cmd=_notify-validate"

						'Post Back To PayPal System To Validate'
						set objHttp = Server.CreateObject("Msxml2.ServerXMLHTTP")

						' set objHttp = Server.CreateObject("Msxml2.ServerXMLHTTP.4.0")
						' set objHttp = Server.CreateObject("Microsoft.XMLHTTP")

						objHttp.open "POST", "https://www.paypal.com/cgi-bin/webscr", false
						objHttp.setRequestHeader "Content-type", "application/x-www-form-urlencoded"
						objHttp.Send str

						
						 'Generating default/random password for logged in users'
							  Dim pChar, pCount
							   
							 ' Here you can add other characters such as lowercase or special.
							   pChar = "ABCDEFGHIJKLMNPQRSTUVWXYZ@#$&0123456789"
							   
							   pCount = Len(pChar) 
							   
							   Dim psw
							   psw = "ITIL"
							   
							   Randomize
							   For i = 1 To 6 ' password length
								  psw = psw & Mid( pChar, 1 + Int(Rnd * pCount), 1 )
								  pass=psw
							   Next
							   
					    'Assign Posted Variables To Local Variables'
						item_number     =  Request.Form("item_number")
						receiver_email  =  Request.Form("receiver_email")
						payment_status  =  Request.Form("payment_status")
						mc_currency     =  Request.Form("mc_currency")
						payer_email     =  Request.Form("payer_email")
						first_name      =  Request.Form("first_name")
						last_name       =  Request.Form("last_name")
						payment_date    =  Request.Form("payment_date")
						address_street  =  Request.Form("address_street")
						address_zip     =  Request.Form("address_zip")
						custom          =  Request.Form("custom")
						address_country =  Request.Form("address_country")
						address_city    =  Request.Form("address_city")
						address_state   =  Request.Form("address_state")
						payment_fee     =  Request.Form("payment_fee")
						payment_gross   =  Request.Form("payment_gross")
						mc_gross        =  Request.Form("mc_gross")
						payer_id        =  Request.Form("payer_id")
						address_status  =  Request.Form("address_status")
						payer_status    =  Request.Form("payer_status")
						mc_fee          =  Request.Form("mc_fee")
						business        =  Request.Form("business")
						quantity        =  Request.Form("quantity")
						verify_sign     =  Request.Form("verify_sign")
						address_name    =  Request.Form("address_name")
						payment_type    =  Request.Form("payment_type")
						txn_id          =  Request.Form("txn_id")
						payer_business_name = Request.Form("payer_business_name")
						address_owner   =  Request.Form("address_owner")
						receiver_id     =  Request.Form("receiver_id")
						ebay_address_id =  Request.Form("ebay_address_id")
						txn_type        =  Request.Form("txn_type")
						tax             =  Request.Form("tax")
						notify_version  =  Request.Form("notify_version")
						SPHRexamver      =  Request.Form("SPHRexamver")
						course_desc     =  Request.Form("course_desc")
						date_Val        = Request.Form("date_val")
						txn_id          =  Trim(Request.Form("Order_Id"))
						mc_currency     =  Trim(Request.Form("Currency"))
						'item_number = Session("item_number")    

						date_entered    =  Date()
						
						If item_number = 110 Then
						kno = 6
						Else
						kno = 0
						End If
						
							If request.form("Currency") <> "" Then
								mc_currency     =  Request.Form("Currency")
							Else
							    mc_currency     =  Request.Form("mc_currency")
							End If
						
						'Response.Write(item_number)

										Select Case item_number

																					
											Case 110
												APMG = "Pre-Work course"
												'retrieving the valid date for prep course from enrolleduser table
												Set objRs = Server.CreateObject("ADODB.Recordset")
			
												strQuery = "SELECT top 1 coursedate ,email FROM itil_enrolledusers WHERE email='"&payer_email&"' ORDER BY id DESC"
												'Response.Write(strQuery)
												objRs.open strQuery,ConnObj
												
												If Not objRs.EOF Then
													email = objRs("email")
													Session("coursedate") = objRs("coursedate")
													coursedate = Session("coursedate") 
													'Response.Write("Test" &coursedate)
													rqVdate = Split(coursedate, "to")
													'rqcoursedate = Split(coursedate, "to")
													'Response.write(rqVdate(1))
													
													'Response.Write("AAAAAAA")
													
												Else
													Session("message")	= "NOTE: "& payer_email &" is not enrolled for any classroom course.<br>Only Students who have enrolled and made payment towards ITILstudy.com classroom program get access to Prep Course."
													Response.Redirect("/adminupdatedb.asp")
													'Response.Write(" ")
												End If
												
												objRs.Close
												
												date_valid = CDate(rqVdate(1)) + 40
												 course_desc = "ITILstudy ITIL Foundation Pre-Prep Course "
												 course_proc = ""
												If item_name = "" Then
													item_name = "ITILstudy ITIL Foundation Pre-Prep Course" 
												'Else
												End If
												
											
											 Case 101
												APMG = "ITILstudy Blend Course"
												date_valid = Date() + 30
												 course_desc = "ITILstudy Blend Course - 1 Months Course"
												 course_proc = ""
												If item_name = "" Then
													item_name = "ITILstudy Blend Course - 1 Months Course" 
												'Else
												End If	


											 Case 102
												APMG = "ITILstudy Online Course"
												date_valid = Date() + 30
												 course_desc = "ITILstudy Online Course - 1 Months Course"
												 course_proc = ""
												If item_name = "" Then
													item_name = "ITILstudy Online Course - 1 Months Course" 
												'Else
												End If	
												 
											Case 103
												APMG = "ITILstudy Online Course"
												date_valid = Date() + 60
												 course_desc = "ITILstudy Online Course - 2 Months Course"
												 course_proc = ""
												If item_name = "" Then
													item_name = "ITILstudy Online Course - 2 Months Course" 
												'Else
												End If		
											
											 Case 104
												APMG = "ITILstudy Online Course"
												date_valid = Date() + 180
												 course_desc = "ITILstudy Online Course "
												 course_proc = ""
												If item_name = "" Then
													item_name = "ITILstudy Online Course " 
												'Else
												End If														
												
											Case 105
												APMG = "ITILstudy Blend Course"
												date_valid = Date() + 60
												 course_desc = "ITILstudy Blend Course - 2 Months Course"
												 course_proc = ""
												If item_name = "" Then
													item_name = "ITILstudy Blend Course - 2 Months Course" 
												'Else
												End If		
												
											Case 106
												APMG = "ITILstudy Blend Course"
												date_valid = Date() + 90
												 course_desc = "ITILstudy Blend Course - 3 Months Course"
												 course_proc = ""
												If item_name = "" Then
													item_name = "ITILstudy Blend Course - 3 Months Course" 
												'Else
												End If		
												
										   Case 109
												APMG = "ITILstudy CSI"
												date_valid = Date() + 60
												 course_desc = "ITILstudy Intermediate (CSI) Online Course - 2 Months Course"
												 course_proc = ""
												If item_name = "" Then
													item_name = "ITILstudy Intermediate (CSI) Online Course - 2 Months Course" 
												'Else
												End If			
												
											Case 111
												APMG = "ITILstudy OSA"
												date_valid = Date() + 60
												 course_desc = "ITILstudy Intermediate (OSA) Online Course - 2 Months Course"
												 course_proc = ""
												If item_name = "" Then
													item_name = "ITILstudy Intermediate (OSA) Online Course - 2 Months Course" 
												'Else
												End If																									
												
											Case 112
												APMG = "Free Simulated Test"
												date_valid = Date() + 2
												 course_desc = "Free Simulated Test"
												 course_proc = ""
												If item_name = "" Then
													item_name = "Free Simulated Test"
												'Else
												End If	
												
											Case 113
												APMG = "ITILstudy Online Course"
												date_valid = Date() + 30
												 course_desc = "ITILstudy Online Course - 1 Months Course"
												 course_proc = ""
												If item_name = "" Then
													item_name = "ITILstudy Online Course - 1 Months Course" 
												'Else
												End If	
												
											Case 114
												APMG = "ITILstudy Service Strategy"
												date_valid = Date() + 90
												 course_desc = "ITILstudy Service Strategy Online Course - 3 Months Course"
												 course_proc = ""
												If item_name = "" Then
													item_name = "ITILstudy Service Strategy Online Course - 3 Months Course" 
												'Else
												End If	
												
												
											Case 115
												APMG = "ITILstudy Service Transition"
												date_valid = Date() + 90
												 course_desc = "ITILstudy Service Transition Online Course - 3 Months Course"
												 course_proc = ""
												If item_name = "" Then
													item_name = "ITILstudy Service Transition Online Course - 3 Months Course" 
												'Else
												End If	
												
											Case 116
												APMG = "ITILstudy Service Design"
												date_valid = Date() + 90
												 course_desc = "ITILstudy Service Design Online Course - 3 Months Course"
												 course_proc = ""
												If item_name = "" Then
													item_name = "ITILstudy Service Design Online Course - 3 Months Course" 
												'Else
												End If	
												
												Case 117
												APMG = "ITILstudy Service Operation"
												date_valid = Date() + 90
												 course_desc = "ITILstudy Service Operation - 3 Months Course"
												 course_proc = ""
												If item_name = "" Then
													item_name = "ITILstudy Service Operation - 3 Months Course" 
												'Else
												End If	
										'********** PPO SOA RCV ***********'
										   Case 118
												APMG = "ITILstudy PPO"
												date_valid = Date() + 90
												 course_desc = "ITILstudy Intermediate (PPO) Online Course - 3 Months Course"
												 course_proc = ""
												If item_name = "" Then
													item_name = "ITILstudy Intermediate (PPO) Online Course - 3 Months Course" 
												'Else
												End If
											Case 119
												APMG = "ITILstudy SOA"
												date_valid = Date() + 90
												 course_desc = "ITILstudy Intermediate (SOA) Online Course - 3 Months Course"
												 course_proc = ""
												If item_name = "" Then
													item_name = "ITILstudy Intermediate (SOA) Online Course - 3 Months Course" 
												'Else
												End If
											Case 120
												APMG = "ITILstudy RCV"
												date_valid = Date() + 90
												 course_desc = "ITILstudy Intermediate (RCV) Online Course - 3 Months Course"
												 course_proc = ""
												If item_name = "" Then
													item_name = "ITILstudy Intermediate (RCV) Online Course - 3 Months Course" 
												'Else
												End If
												
											Case 121
												APMG = "ITILstudy MALC"
												date_valid = Date() + 90
												 course_desc = "ITILstudy Intermediate (MALC) Online Course - 3 Months Course"
												 course_proc = ""
												If item_name = "" Then
													item_name = "ITILstudy Intermediate (MALC) Online Course - 3 Months Course" 
												'Else
												End If
												
										End Select
										%>
										
                        
					<%			
					'This is to retrive the max rollno from database and incrementing the rollno'	
	
									
		           set objRs = server.CreateObject("ADODB.recordset")		
															
                    strQuery2= "select max(rollno) as rollno from PaypalDB"
					
					objRs.open strQuery2, ConnObj
					
					do until objRs.EOF
	
						rollNo = objRs("rollno")

	                    R = CInt(rollNo) + 1

                    objRs.movenext
					loop
					objRs.close
					
					
						strQuery2 = "http://geoip1.maxmind.com/b?l=4tAUhyTgUD6d" & _
							"&i=" & SIPAddress1
						set objHtp1 = Server.CreateObject("Msxml2.ServerXMLHTTP")
						objHtp1.open "GET", strQuery2, false
						objHtp1.send
						SIPAddress1 = SIPAddress1 + ";" + objHtp1.ResponseText
						
						If item_number <> "" Then
						
						ConnObj.Execute "INSERT INTO PaypalDB (paypal_address_id, kno_passed,item_name,item_number,receiver_email,payment_status,mc_currency,payer_email,first_name,last_name,payment_date,address_street,address_zip,custom,address_country,address_city,address_state,payment_fee,payment_gross,mc_gross,payer_id,address_status,payer_status,mc_fee,business,quantity,verify_sign,address_name,payment_type,txn_id,payer_business_name,address_owner,receiver_id,ebay_address_id,txn_type,tax,notify_version, pass, date_entered, date_valid,rollno) VALUES('"&APMG&"','"&kno&"','"&item_name&"','"&item_number&"','"&receiver_email&"','"&payment_status&"','"&mc_currency&"','"&payer_email&"','"&StrQuoteReplace(first_name)&"','"&StrQuoteReplace(last_name)&"','"&payment_date&"','"&address_street&"','"&address_zip&"','"&custom&"','"&address_country&"','"&address_city&"','"&address_state&"','"&payment_fee&"','"&payment_gross&"','"&mc_gross&"','"&payer_id&"','"&address_status&"','"&payer_status&"','"&mc_fee&"','"&business&"','"&quantity&"','"&verify_sign&"','"&address_name&"','"&payment_type&"','"&txn_id&"','"&payer_business_name&"','"&SIPAddress1&"','"&receiver_id&"','"&ebay_address_id&"','"&txn_type&"','"&tax&"','"&notify_version&"','"&pass&"','"&date_entered&"','"&date_valid&"','"&R&"')"
						
						'Query for Selecting Recently Updated ID From Paypaldb Table'
						Rs4.Open "SELECT IDENT_CURRENT('PaypalDB') As EnrollID",ConnObj
    
                        rqEnrollID = Rs4("EnrollID")
						
						If (rqModeOfPayment <> "" AND rqModeOfPayment <> "Test-Environment") Then
						
						ConnObj.Execute "INSERT INTO Online_transaction (EnrollID,Payment_Gateway,Payment_Date,Txn_Details,Amount) VALUES('"&rqEnrollID&"','"&rqModeOfPayment&"','"&rqPaymentdate&"','"&rqTraDetails&"','"&payment_gross&"')"
						
						'Response.Write("INSERT INTO Online_transaction (EnrollID,Payment_Gateway,Payment_Date,Txn_Details,Amount) VALUES('"&rqEnrollID&"','"&rqModeOfPayment&"','"&rqPaymentdate&"','"&rqTraDetails&"','"&payment_gross&"')")
						
						End If
						
						'If we are giving access for our employees that enrollment should not come under paid enrollments'
						'So, we are updating paymennt_gross with "Internal"'
						If (rqModeOfPayment = "Test-Environment") Then
						
							ConnObj.Execute "UPDATE Paypaldb SET payment_gross = 'Internal' WHERE ID = '"& rqEnrollID &"'"
						
						End If
												
						End If
						
						Set objHtp1 = Nothing

						If Request.Form("manualenroll") <> "" Then

							UserID = Session("UserID")
							feedback = payer_email&": Manual Enrollment"
							
							'response.Write(first_name)
							

							ConnObj.Execute "Insert into queriesans(UserID, TimeofQuery, Feedback) values('"&UserID&"','"&now()&"','"&feedback&"')"
							
						

						'Else
						End If


						Set objHttp1 = Nothing

						End If
						%>
    <!-- Header Start -->
    <% If Session("State") <> "" Then %>
    <div><a href="./logoff.asp">Sign Out</a>
      <% = Session("FirstName") %>
      &nbsp;
      <% = Session("LastName") %>
    </div>
    <%
						'Else
						End If
%>
  </div>
<div style="margin-left:-4px;">
<table width="95%" border="0" cellspacing="0" cellpadding="4" class="general-body">
            <form method="POST" action="/verifycustomerdetails_admin.asp" name="form2" onSubmit="return validate_form(this)">
              <tr>
                <td><span class="general-bodyBold">Confirm Your Name</span><span class="Required">*</span> <b>:</b> 
                  </td>
                <td>				
                  <input type="text" name="first_name" value="<%=first_name%>" class="TeXtField">&nbsp;&nbsp;
                  <input type="text" name="last_name" value="<%=last_name%>" class="TeXtField">
                  <input type="hidden" name="date_Val" value="<%=date_val%>" class="TeXtField">
				  <input type="hidden" name="coursedate" value="<%=coursedate%>" class="TeXtField">
				  <input type="hidden" name="email" value="<%=email%>" class="TeXtField">
                  </td>
              </tr>
              <tr>
                <td colspan="2">
                  <span class="Header">Provide Email ID<% %> and password will allow you access to different services in ITILstudy.com.</span> </td>
              </tr>
              <% If(payer_email<>"") then%>
              <tr valign="top">
                <td class="general-bodyBold" >Email<span class="Required">*</span>: </td>
                <td height="14" class="general-bodyBold"><%=payer_email%></td>
              </tr>
              <input type="hidden" name="payer_email" value="<%=payer_email%>" size="250">
              <input type="hidden" name="pass" value="<%=pass%>" size="250">
              <%else%>
              <tr>
                <td class="general-bodyBold">Email(User ID)<span class="Required">*</span>: </td>
                <td>
				<input type="text" name="payer_email" value="<%=payer_email%>" size="50" class="TeXtField">
                 <input type="hidden" name="pass" value="<%=pass%>" size="250">
                </td>
                <br>
                <br>
              </tr>
              <%end if%>
          
              <tr>
                <td class="general-bodyBold">Name of Employer/Business<span class="Required">*</span>: </td>
                <td ><input type="text" name="custom" size="50" class="TeXtField"></td>
              </tr>
             
              <tr>
                <td class="general-bodyBold">Phone Number<span class="Required">*</span>: </td>
                <td>
				<input type="text" name="ebay_address_id" size="50" class="TeXtField"></td>
              </tr>
			  
			    <%  If item_number = "0051" OR  item_number = "112" OR item_name = "Understand ITIL Exam"  Then %>
				<tr>
              <td><b>Country<span class="Required">*</span>:</b></td>
              <td><input type="text" name="country"  /></td>
            </tr>
              <tr>
              <td><b>State<span class="Required">*</span>:</b></td>
              <td><input type="text" name="state"  /></td>
            </tr>
            <tr>
              <td><b>City<span class="Required">*</span>:</b></td>
              <td><input type="text" name="city" />
              </td>
            </tr>
              <% End  If%>
              <%' If item_number = "104" Then %>
          <!--    <tr >
                <td class="general-bodyBold">Country<span class="Required">*</span>: </td>
                <td>
				  <select name="address_country" id="address_country" >
     <option value="" >--Select--</option>
      <option value="US">US</option>
      <option value="India">India</option>
    </select></td>-->
              <% 'End  If%>
              <tr>
			  	<td colspan="2"><span class="Note" style="font-size:10px;">(Format: CountryCode-Area-Number) e.g. 001-612-31205138</span></td>
			  </tr>
              <tr>
                 <td class="general-bodyBold">Special requirements(if any): </td>
              </tr>
              <tr>
                 <td class="general-bodyBold">Dietary: </td>
                 <td><input type="text" name="dietary" size="50" maxlength="500" class="TeXtField"></td>
              </tr>
              <tr>
                 <td class="general-bodyBold">Mobility: </td>
                 <td><input type="text" name="mobility" size="50" maxlength="200" class="TeXtField"></td>
              </tr>	
              <tr>
                 <td class="general-bodyBold">Reading, Writing: </td>
                 <td><input type="text" name="reaORwrit" size="50" maxlength="200" class="TeXtField"></td>
              </tr>	
               <tr>
                 <td class="general-bodyBold">Hearing: </td>
                 <td><input type="text" name="audio" size="50" maxlength="500" class="TeXtField"></td>
              </tr>			  		  		  
               <tr>
                 <td class="general-bodyBold">Other: </td>
                 <td><textarea name="other" size="100" height="100"></textarea></td>
                <!-- <td><input type="text" name="other" size="100" class="TeXtField"></td>-->
              </tr>

              <input type="hidden" name="verify_sign" value="<%=verify_sign%>" size="250">
              <input type="hidden" name="item_name" value="<%=item_name%>" size="250">
              <input type="hidden" name="item_number" value="<%=item_number%>" size="250">
              <input type="hidden" name="course_desc" value="<%=course_desc%>">
              <input type="hidden" name="course_proc" value="<%=course_proc%>">
              <input type="hidden" name="APMG" value="<%=APMG%>">
              <tr>
                
                <td colspan="2">
				<div align="center"><input type="submit" value="Submit" class="ButtonGeneral" style="width:60px;"></div>
				</td>
              </tr>
            </form>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
            <tr>
              <td colspan="2" class="general-body">
                <span class="general-bodyBold">Please Note: </span>If you do not reset your UserID,
                <ul>
                  <li><span class="general-bodyBold">Default UserID/Email:</span> This is your Paypal Email ID.</li>
                 
                </ul>
            </tr>
          </table>
		  </div>
          <!-- Content End From Here-->
          <!--#include virtual="/includes/connectionClose.asp"-->
          <% End If%>
      </div>
      
      </td>
      
      </tr>
      
    </table>
    </td>
    
    </tr>
    
  </table>
</div>


<% If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") Then %>
<!-- Google Code for ITILstudy USA Online - EF Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "9m8dCNu61QIQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?value=0&amp;label=9m8dCNu61QIQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


<% ElseIf Session("CountryOrigin") = "Australia" Then %>

<!-- Google Code for ITILstudy AUS Online - EF (P.M.5) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1001931809;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "eVerCK__yRIQoYjh3QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1001931809/?value=0&amp;label=eVerCK__yRIQoYjh3QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


<% ElseIf Session("CountryOrigin") = "India" Then %>
<!-- Google Code for ITILstudy IND - Online EF (P.M.6) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1000044564;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "34mjCITS1QMQlPDt3AM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1000044564/?value=0&amp;label=34mjCITS1QMQlPDt3AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


 <% ElseIf Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" Then %>
<!-- Google Code for ITILstudy UAE, Singapore - Online EF (P.M.6) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1000044564;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "Dkd4CPzS1QMQlPDt3AM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1000044564/?value=0&amp;label=Dkd4CPzS1QMQlPDt3AM&amp;guid=ON&amp;script=0"/>
</div>


<%  ElseIf Session("CountryOrigin") = "Germany" Then  %>
<!-- Google Code for ITILstudy Germany - Eng- Online EF (P.M.2) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "2yLuCOORlgMQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?value=0&amp;label=2yLuCOORlgMQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


<% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
<!-- Google Code for ITILstudy - Online EF for UK (P.M.3) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1017900619;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "aBmRCJ2HlAMQy9yv5QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1017900619/?value=0&amp;label=aBmRCJ2HlAMQy9yv5QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


<!-- Google Code for ITILstudy UK - Online EF (P.M.6) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1000044564;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "C8gMCOzU1QMQlPDt3AM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1000044564/?value=0&amp;label=C8gMCOzU1QMQlPDt3AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>





<% Else %>
<!-- Google Code for TILstudy Online - EF Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "EeZ2CIOE3wIQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?value=0&amp;label=EeZ2CIOE3wIQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>

<% End If %>


<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->


