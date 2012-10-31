<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
    
    <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
    
    <table width="100%" border="0" cellspacing="0" cellpadding="8">
      <tr>
        <td width="2%" class="Header">&nbsp;</td>
        <td width="25%" class="PageTitle">&nbsp;</td>
        <td width="73%" class="PageTitle">PMstudy Classroom Training</td>
      </tr>
      <tr>
      
      <!--#include virtual="/includes/innerLeftMenu.asp"-->
      <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
      
      <div style="margin-top:-12px;">
        <!-- Content Start From Here-->
        <%
					 'Declare Local Variables'

					 Dim Step1,Step2,todaysDate
					 Dim strQuery,strQuery1,strQuery2,strQuery3,strQuery5
					 Dim Rs1,Rs2,Rs3
					 Dim PayBefore,DateInterval,Total
					 Dim rqFirstName,rqLastName,rqEmail,rqOccupation,rqPhoneNumber,strBook
					 Dim rqNameOfEmployeer,rqAmount,rqDateOfEnrollment,rqPayBefore,rqCourseDetails
					 Dim rqPriceWithTax,rqPriceWithOutTax,rqBookPrice,rqBook
					 Dim str,str1,str2,str3,i,Course,Course1,course2,startDate,endDate,splitStartDate,splitEndDate
					 Dim dprice,dbprice,Tax
					 Dim objCDOMail
					 Dim strBody,Subject,rqCourseId
					 Dim Date11,TodayDate
					 Dim str4,str5,sstartDate,eendDate,sstartYear,eendYear
					 Dim arrAllCourses,firstRow,lastRow,numRows,rowCounter
					 Dim startingDate,endingDate
					 Dim courseId,Price,coursePrice,str6
					 Dim ApplicableDays
					 Dim country
					 Dim CourseDate,CourseDetails,rqCourseDetailsAndId
					 Dim strCountryDetails,SelectedCourseID
					 Dim rqUsInstEmailId 
					 Dim HotelName, HotelPhNo, HotelURL, HotelAddress
					 
				 	 'Creating recordobjects'
					 Set Rs  = Server.CreateObject("ADODB.Recordset")
					 Set Rs1 = Server.CreateObject("ADODB.Recordset")
					 Set Rs2 = Server.CreateObject("ADODB.Recordset")
					 Set Rs3 = Server.CreateObject("ADODB.Recordset")
					 Set objRs = Server.CreateObject("ADODB.Recordset")
					 
					 'Retrive Us instructor email id from usbackoffice'
					 rqUsInstEmailId = Request.Form("usInstEmailId")					 
					 
					 'This CourseID Retriving From dates_location.asp Page'
					 'Because of In the Dropdown Showing Selected Course'
					 
					 SelectedCourseID = Request.Form("SelCourseID")
					 
					'Dispaly The Today Date'

					  todaysDate = now()

					'Currency Format Display Functions'

					 Currency_Format_Front = CurrencyFormat_Front(Session("CountryOrigin"))

					 Currency_Format_Back = CurrencyFormat_Back(Session("CountryOrigin"))

					'Increment 5 Days and Display That'

					  PayBefore = DateAdd("d", +4,CDate(todaysDate))

					  Step1 = Request.Form("step1")

					 'Retrive The Enrolluser Details Through Form'

					 rqCourseId         =   Request.Form("courseid")
					 rqFirstName 		= 	Request.Form("firstname")
					 rqLastName 		= 	Request.Form("lastname")
					 rqEmail 			= 	Request.Form("email")
					 rqNameOfEmployeer  =   Replace(Request.Form("employer"),"'","''")
					 rqPhoneNumber 		=   Request.Form("phoneno")
					 rqCourseDetails 	=   Request.Form("class")
					 rqPriceWithTax 	=   Request.Form("pricewithtax")
					 rqPriceWithOutTax  =   Request.Form("pricewithouttax")
					 'rqBookPrice 		=   Request.Form("bookprice")

					'Put Into Session Displaying Purpose'

					 Session("FirstName")        =  rqFirstName
					 Session("LastName")         =  rqLastName
					 Session("Email")            =  rqEmail
					 Session("NameOfEmployeer")  =  rqNameOfEmployeer
					 Session("PhoneNumber")      =  rqPhoneNumber
					 Session("Course")           =  rqCourseDetails
					 
					 'This page is coming from dates_location page then if condition will work '
					 'Otherwise else part will work (if you open this page directly or some clicks on the links)'
					 If SelectedCourseID <> "" Then
					 strQuery = "SELECT * FROM ps_course WHERE country = (SELECT country FROM ps_course WHERE courseid = '"&SelectedCourseID&"') AND status <> 'Cancelled' order by startdate,city desc"
					 Else
					 strQuery = "SELECT * FROM ps_course WHERE country = '" & Session("CountryOrigin") & "' AND status <> 'Cancelled' order by startdate,city desc"
					 End If
					 
					 Rs.Open strQuery,ConnObj

					  If Not Rs.EOF Then
					
						arrAllCourses = Rs.getrows
						Session("arrAllCourses") = arrAllCourses
						numRows = Ubound(arrAllCourses,2)
						firstRow = 0
						lastRow = numRows
					  
					  End If
					 
					 Rs.Close
					
					'Retrive the country details from ps_countrydetails for displaying the details'
					strCountryDetails = "SELECT * FROM ps_countrydetails WHERE country = '" & Session("CountryOrigin") & "' AND id = (SELECT MAX(id) FROM ps_countrydetails WHERE country = '"& Session("CountryOrigin") &"')"
					
					Rs.Open strCountryDetails,ConnObj

					Do Until Rs.EOF 
						
						Cancellation1 = Rs("cancellation1")
						Cancellation2 = Rs("cancellation2")
						Cancellation3 = Rs("cancellation3")
						Reschedule1   = Rs("reschedule1")
						Reschedule2   = Rs("reschedule2")
						Reschedule3   = Rs("reschedule3")
						OnlinePhNo    = Rs("onlinecourse_phno")
						ClassPhNo1    = Rs("classroomcourse_phno1")
						ClassPhNo2    = Rs("classroomcourse_phno2")
						Address       = Rs("address")
						Payments  = Rs("payments")
						CurrencyFormat   = Rs("currencyformat")
						PaymentsAfterEnroll = Rs("paymentsafterenroll")
						PayOption1 = Rs("PayOpt1")
						PayOption2 = Rs("PayOpt2")
					
					Rs.Movenext
					Loop

					If Step1 <> "" Then

					'Retrive The CourseId From Second Step'

					rqCourseId = Request.Form("courseId")

					'SQL Query For Retrieve The Prices Displaying in The Step Two'

					 strQuery2 = "SELECT * FROM ps_course Where courseid = '" & rqCourseId & "'"

					 Rs2.Open strQuery2,ConnObj

					 Do until Rs2.EOF
						
						City      = Rs2("city")
						StartDate = Rs2("startdate")
						EndDate   = Rs2("enddate")
						ApplicableDays = Rs2("applicabledays")
						Country = Rs2("country")
						HotelName = Rs2("hotelname")
						HotelPhNo = Rs2("hotelphonenumber")
						HotelURL = Rs2("hotelurl")
						HotelAddress = Rs2("hoteladdress")

						If (CDate(StartDate)-(Date()+ApplicableDays+1) >= 0) Then
							Total = Rs2("afterEBdiscountwithtax")
							TotalCCAvenue = Int(Rs2("afterEBdiscountwithtax"))
						Else
							Total = Rs2("pricewithtax") 
							TotalCCAvenue = Int(Rs2("pricewithtax"))
						End If
					    
						Tax = Rs2("tax")

					 Rs2.movenext
					 Loop
					 
					 'For display the course details formatting the course like Raleigh : Saturday, April 17, 2010 to Tuesday, April 20, 2010 for $ 1,800.00'
					 CourseDetails = City & " : " & FormatDateTime(StartDate,1) & " to " & FormatDateTime(EndDate,1) & " for " & Currency_Format_Front & " " & FormatNumber(Total) & " " & Currency_Format_Back

					 CourseDate = StartDate & " to " & EndDate
					  
					 EnrolledCourse = City & " : " & FormatDateTime(StartDate,1) & " to " & FormatDateTime(EndDate,1)
				 					
					'If You Fill The Registration Form In Step2 That User Details Insert Here'

					'SQL Query For Inserting The Values Into DataBase'

					 strQuery1 = "INSERT INTO ps_enrolledusers (firstname,lastname,email,nameofemployeer,phoneno,coursedetails,coursedate,amount,dateofenrollment,paybefore,status,pmbok,courseid,statusnumber,pmbokprice,discountpercentage,country)"
					 strQuery1 = strQuery1 & " Values "
					 strQuery1 = strQuery1 & "('" & rqFirstName & "',"
					 strQuery1 = strQuery1 & "'" & rqLastName & "',"
					 strQuery1 = strQuery1 & "'" & rqEmail & "',"
					 strQuery1 = strQuery1 & "'" & rqNameOfEmployeer & "',"
					 strQuery1 = strQuery1 & "'" & rqPhoneNumber & "',"
					 strQuery1 = strQuery1 & "'" & CourseDetails & "',"
					 strQuery1 = strQuery1 & "'" & CourseDate & "',"
					 strQuery1 = strQuery1 & "'" & Total & "',"
					 strQuery1 = strQuery1 & "'" & now() & "',"
					 strQuery1 = strQuery1 & "'" & PayBefore & "',"
					 strQuery1 = strQuery1 & "'Active',"
					 strQuery1 = strQuery1 & "'No',"
					 strQuery1 = strQuery1 & "'" & rqCourseId & "',"
					 strQuery1 = strQuery1 & "'1',"
					 strQuery1 = strQuery1 & "'0',"
					 strQuery1 = strQuery1 & "'0',"
					 strQuery1 = strQuery1 & "'" & Country & "')"

					 Rs1.Open strQuery1,ConnObj

					 strQuery3 = "SELECT max(id) as EnrollId FROM ps_enrolledusers"

					 Rs3.Open strQuery3,ConnObj

					 do until Rs3.Eof
					   Session("EnrollId") = Rs3("EnrollId")
					 Rs3.Movenext
					 Loop
					 
					 EnrollId = Session("EnrollId")

					 'Send proforma invoice email'

					  strBody = "<table width=""100%"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td>&nbsp;</td></tr><tr><td><table width=""600px"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""595px"" bgcolor=""#FFFFFF""><span><img src=""http://www.pmstudy.com/images/banners/email_header.jpg"" alt=""PMstudy"" width=""600px"" height=""103"" /></span></td></tr>"
					  strBody = strBody & "<tr><td align=""center"" colspan=""2"" width=""560px""><table border=""0"" align=""center"" width=""560px""><tr><td align=""center""><br><br><font face=""Arial"" size=""3"" color=""#0359b4""><b>COURSE ENROLLMENT DETAILS (INVOICE)<br>100% Moneyback Guarantee PMstudy.com Classroom Program</b></font></td></tr>"
					  strBody = strBody & "<tr><td align=""right"" colspan=""2""><font face=""Arial"" size=""2""><b>" & FormatDateTime(todaysDate,1) & "</b></font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Enroll ID : " & Session("EnrollId") & "</font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name : " & rqFirstName & "&nbsp; " & rqLastName & "</font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Email : " & rqEmail & " </font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Phone Number : " & rqPhoneNumber & "</font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name of Employer/Business : " & rqNameOfEmployeer & "</font></td></tr>"
					  strBody = strBody & "<tr><td align=""left"" colspan=""2""><br><font face=""Arial"" size=""2"">Details of your course and Payment:</font><br><table border=""1"" cellspacing=""0"" align=""center"" width=""560px"">"
					  strBody = strBody & "<tr><td width=""60%""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Details</font></b></td><td width=""15%"" align=""center""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Payment</font></b></td></tr>"
					  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>PMP Classroom Training(4 days, 40 Contact Hours) " & CourseDetails & "</b>"
					  If Tax <> 0 Then
					  strBody = strBody &"<br>(This includes " & Tax & "% service tax)"
					  End If
					  strBody = strBody &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
					  strBody = strBody & Currency_Format_Front & " " & FormatNumber(Total) & " " & Currency_Format_Back
					  strBody = strBody &"</b></td></tr>"
					  strBody = strBody & "<tr><td colspan=""2"">&nbsp;</td></tr>"
					  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
					  strBody = strBody & Currency_Format_Front & " " & FormatNumber(Total) & " " & Currency_Format_Back
					  strBody = strBody & "</b></font></td></tr></table><br></td></tr>"
					  'Here i am showing in the email hotel details for us and canada classes only'
					  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then
					  If Not IsNull(HotelAddress) And HotelAddress <> "" Then
					  strBody = strBody & "<tr><td align=""left"" colspan=""2""><table border=""0"" width=""100%""><tr><td width=""170px"" valign=""top""><font face=""Arial"" size=""2""><b>Venue Details:</b></font></td><td width=""830px"">"& HotelName &"<br>" & HotelAddress &" "& City &"<br>"
					  If HotelPhNo <> "" Then
					  strBody = strBody & "Ph: "& HotelPhNo &"<br>"
					  End If
					  strBody = strBody & "<a href="& HotelURL &" target=""_blank"">"& HotelURL &"</a><br /><br></td></tr></table></td></tr>"
					  End If
					  End If
					  strBody = strBody & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><b>Please Note:</b></font><br>"
					  strBody = strBody & "<font face=""Arial"" size=""2"">Full payment of the enrollment fee <b>(" & Currency_Format_Front & " " & FormatNumber(Total) & " " & Currency_Format_Back & "</b>) "
					  strBody = strBody & "should be done through </font></td></tr><tr><td align=""left"">"
					  If PayOption1 <> "" Then
					  If Session("CountryOrigin") <> "US" And Session("CountryOrigin") <> "Canada" Then
					  strBody = strBody & "<ul><li><font face=""Arial"" size=""2""><b>PayPal </b></font>"
					  Else
					  strBody = strBody & "<ul><li><font face=""Arial"" size=""2""><b>Google Checkout </b></font>"
					  End If
					  strBody = strBody & "&nbsp;&nbsp;<a href=""http://www.pmstudy.com/payment.asp?enrollUserID="& Session("EnrollId") &"&Country="& Session("CountryOrigin") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><b>Buy Now</b></font></a><br><br></li>"
					  End If
					  If PayOption2 <> "" Then
					  strBody = strBody & "<li><font face=""Arial"" size=""2""><b>CCAvenue </b></font>"
					  strBody = strBody & "&nbsp;&nbsp;<a href=""http://www.pmstudy.com/payment.asp?enrollUserID="& Session("EnrollId") &"&Country="& Session("CountryOrigin") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><b>Buy Now</b></font></a></li>"
					  End If
					  strBody = strBody & "<font face=""Arial"" size=""2"">" & PaymentsAfterEnroll & "</font>"					  
					  strBody = strBody & "</td></tr>"
					  strBody = strBody & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><br><i>We have reserved a place for you in this course. However, the payment should be received by us "
					  If(CDate(StartDate)-(Date()-1)>5) Then
					  strBody = strBody & "within 5 days from today i.e. before " & FormatDateTime(DateAdd("d", +4,CDate(todaysDate)),1) & "</i>"
					  End If
					  If(CDate(StartDate)-(Date())=4) Then
					  strBody = strBody & "within 4 days from today i.e. before " & FormatDateTime(DateAdd("d", +3,CDate(todaysDate)),1) & "</i>"
					  End If
					  If(CDate(StartDate)-(Date())=3) Then
					  strBody = strBody & "within 3 days from today i.e. before " & FormatDateTime(DateAdd("d", +2,CDate(todaysDate)),1) & "</i>"
					  End If
					  If(CDate(StartDate)-(Date())=2) Then
					  strBody = strBody & "within 2 days from today i.e. before " & FormatDateTime(DateAdd("d", +1,CDate(todaysDate)),1) & "</i>"
					  End If
					  If(CDate(StartDate)-(Date())=1) Then
					  strBody = strBody & "today i.e. before 5 PM " & FormatDateTime(todaysDate,1) & "</i>"
					  End If
					  If(CDate(StartDate)-(Date())=0) Then
					  strBody = strBody & "today i.e. before 9 PM " & FormatDateTime(todaysDate,1) & "</i>"
					  End If
					  strBody = strBody & " - <i>otherwise, your registration for this program will be cancelled.</i> </font></td></tr>"
					  strBody = strBody & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><br>Please Note:You will be allowed access to the free 100% Online Preparatory Course for <a href=""http://www.pmstudy.com"" target=""_blank"">PMstudy.com</a> Classroom Course only after we receive your payment : this is a simple online course which can be completed with a few hours of study and will provide you with the PDUs required to apply for PMP Exam. This course is a pre-requisite for pmstudy.com Classroom Course.<br><br>PMstudy offers 100% Moneyback Guarantee on its classroom programs. Details: <a href=""http://www.pmstudy.com/PMP-Classes/moneyBack.asp"" target=""_blank"">http://www.pmstudy.com/PMP-Classes/moneyBack.asp</a>; Also, please refer to PMstudy classroom training terms and conditions: <a href=""http://www.pmstudy.com/termsAndConditions.asp"" target=""_blank"">http://www.pmstudy.com/termsAndConditions.asp</a>.</font></td></tr>"  
					  strBody = strBody & "<tr><td align=""center"" colspan=""3""><br><font face=""Arial"" color = ""green"" size=""3"">We look forward to having you as a student with PMstudy.com Classroom Training!!!</font></td></tr>"
	 				  strBody = strBody & "<tr><td align=""left""><br><font face=""Arial"" size=2>Best Regards,</font></td></tr>"
	 				  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=2>Customer Support</font></td></tr>"
	 				  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=2><a href=""http://www.PMstudy.com"" target=""_blank"">www.PMstudy.com</a></font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=2>(PMI Approved Global Registered Education Provider)</font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=2>Email id : marketing@PMstudy.com</font></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr></table></td></tr><tr><td height=""45%"">&nbsp;</td></tr></table>"
					 
   				     Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
					 objCDOMail.From = "marketing@pmstudy.com"
					 objCDOMail.To =  "<" & rqEmail & ">"
					 If Session("CountryOrigin") = "India" Then
					 objCDOMail.cc = "salesindia@pmstudy.com"
					 Else
					 objCDOMail.cc = "marketing@pmstudy.com, adminsupport@pmstudy.com"
					 End If
					 objCDOMail.Bcc = "t_satpathy@yahoo.com"
					 If(Session("CountryOrigin") = "US" or Session("CountryOrigin") = "Canada" ) Then
					 objCDOMail.Bcc = "t_satpathy@yahoo.com"
					 Else
					 End If
					 objCDOMail.Importance = 2
					 objCDOMail.Subject = "Enrollment in PMstudy.com Classroom Coaching for PMP Certification Exam"
					 objCDOMail.BodyFormat = 0
					 objCDOMail.MailFormat = 0
					 objCDOMail.Body =  strBody
					 objCDOMail.Send
					 Set objCDOMail = Nothing
					
					'Stop sending faculty mails - Bharath 15th Feb 2010'
					'If Country = US or Canada we are sending faculty mail based on city'
					'If(Session("CountryOrigin") = "US" or Session("CountryOrigin") = "Canada" ) Then
					
					  'mail = 1
					  
					  'Here rqUsInstEmailId coming from USBackoffice'
					  'From USBackoffice US Instructor can enroll class for student'
					  'If rqUsInstEmailId = "" then it is normal enrollment'
					  'If rqUsInstEmailId = "" Then	
					  	
						'Retrive email ids based on city and send emails to faculty'			
						'strAllcoatedCity = "SELECT emailid1, emailid2, emailid3, firstname, lastname FROM ps_us_instructors WHERE city1 = '"& City &"' OR city2 = '"& City &"' OR city3 = '"& City &"' OR city4 = '"& City &"' OR city5 = '"& City &"'"
						
					  'Else
					  	
						'If US Instructor done the enrollment from USBackoffice retrive his email ids and send a mail to him/her'
					  	'strAllcoatedCity = "SELECT emailid1, emailid2, emailid3, firstname, lastname FROM ps_us_instructors WHERE emailid1 = '"& rqUsInstEmailId &"'"

					  'End If
						
						'objRs.Open strAllcoatedCity,ConnObj
						
						'Do Until objRs.EOF
						
							'EmailId1 = objRs("emailid1")
							'EmailId2 = objRs("emailid2")
							'EmailId3 = objRs("emailid3")
							'FirstName = objRs("firstname")
							'LastName = objRs("lastname")
							
							'strBody1 = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.pmstudy.com/images/banners/email_header.jpg"" alt=""PMstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""540px""><table border=""0"" width=""520px"" align=""center""><tr height=""30px""><td><font face=""Arial"" size=2>Hi "&FirstName&" "&LastName&",<BR><BR>We got the following enrollment from student for follow up. <BR><BR>Name: "&rqFirstName&" "&rqLastName&"<BR><BR>City:  "&City&"<BR><BR>Phone Number: "&rqPhoneNumber&"<BR><BR>Email Id: "&rqEmail&"<BR><BR>Name of employer:"&rqNameOfEmployeer&"<BR><BR>Time: "&Now()&"<BR><BR>Enrolled Course: "&EnrolledCourse&"<BR><BR>Please do the needful.<BR><BR>Best Regards, <BR>Custmer Support<br>www.PMstudy.com<BR>(PMI Approved Registered Education Provider)<BR>Email: marketing@pmstudy.com</font></td></tr></table></td></tr></table></td></tr></table>"
							
							'Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
							'objCDOMail.From = "marketing@pmstudy.com"
							'objCDOMail.To =  "<" & EmailId1 & ">,<" & EmailId2 & ">,<" & EmailId3 & ">" 
							'If mail = 1 Then 
							'objCDOMail.cc = "marketing@pmstudy.com, adminsupport@pmstudy.com"
							'objCDOMail.Bcc = "t_satpathy@yahoo.com"
							'End If
							'objCDOMail.Importance = 2
							'objCDOMail.Subject = "PMstudy Receptionist call received (follow up required)."
							'objCDOMail.BodyFormat = 0
							'objCDOMail.MailFormat = 0
							'objCDOMail.Body =  strBody1
							'objCDOMail.Send
							'Set objCDOMail = Nothing
							
							'mail = 2
	
						'objRs.Movenext
						'Loop
						'objRs.Close
						
					  'End If
					
					End If
					%>
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
						var iChars = "!#$%^&*@()+=-[]\\\';,{}|\":<>?./";

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
						var iChars = "!#$%^&*@()+=[]\\\';{}|\":<>?";

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

						if (validate_required(firstname,"Please Enter Your First Name")==false)
							  {firstname.focus();return false}

						// Check The If You Given Any Special Characters In First Name Field

						if (validate_special(firstname,"Your First Name Has Special Characters. \n Please remove them and try again")==false)
									  {firstname.focus();return false}

						// Check The Your First Name Have Numerals in Frist Name Field

						if (validate_noNumber(firstname,"Your First Name Has Numerals")==false)
								  {firstname.focus();return false}

						// Check The Last Name Field Empty Or Not

						if (validate_required(lastname,"Please Enter Your Last Name")==false)
							  {lastname.focus();return false}

						// Check The If You Given Any Special Characters In Last Name Field

						if (validate_special(lastname,"Your Last Name Has Special Characters. \n Please remove them and try again")==false)
									  {lastname.focus();return false}

						// Check The Your Last Name Field Have Numerals

						if (validate_noNumber(lastname,"Your Last Name Has Numerals")==false)
								  {lastname.focus();return false}

						// Check The EMail Field Empty Or not

						if (validate_required(email,"Please Enter Your EmailId")==false)
							  {email.focus();return false}

						// Check The Eamil Validation

						if (echeck(email)==false)
							  {email.focus();return false}

						// Check The Employer/Business Field Empty Or Not

						//if (validate_required(employer,"Please Enter Your Name of Employeer/Business")==false)
							  //{employer.focus();return false}

						// Check The Phone number Field Empty Or Not

						if (validate_required(phoneno,"Please enter phone number")==false)
							  {phoneno.focus();return false}

						// Check The Phone Number Have Special Characters

						if (validate_specialcharacters(phoneno,"Your phone number Has Special Characters. \n Please remove them and try again")==false)
									  {phoneno.focus();return false}

						// Check The Phone Number Field Have numerals

						if (validate_number(phoneno,"Your phone number is not a numeral")==false)
							  {phoneno.focus();return false}
							  
						// Check The Course Field Empty Or Not

						if (validate_required(courseId,"Please select course")==false)
							  {courseId.focus();return false}							  

						}
					}


					-->
					</script>
        <script language="javascript">
					<!--
					function openit() {
					newWindow = window.open('emailus.asp', 'myWindow', 'toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=0,minimizable=0,resizable=0,width=500,height=315');
					}
					// -->
					</script>
       
          <table width="97%" border="0" cellpadding="0" cellspacing="0" class="general-body">
            <% If Step1 = ""  Then %>
            <form action="/enrollClass.asp" method="post" onsubmit="return validate_form(this)">
              <tr>
                <td><div style="margin-left:-0;">
				<table border="0" cellpadding="3" cellspacing="0" width="100%">
                    <tr>
                      <td width="28%"><span class="general-bodyBold">First Name :</span><span class="Required">*</span></td>
                      <td><input type="text" name="firstname" id="firstname" class="TeXtField"></td>
                    </tr>
                    <tr>
                      <td><span class="general-bodyBold">Last Name :</span><span class="Required">*</span></td>
                      <td><input type="text" name="lastname" id="lastname" class="TeXtField"></td>
                    </tr>
                    <tr>
                      <td colspan="2" ><span class="Note">*This name will appear in Contact Hour/PDUs Certificates</span></td>
                    </tr>
                    <tr>
                      <td><span class="general-bodyBold">EMail :</span><span class="Required">*</span></td>
                      <td><input type="text" name="email" id="email" size="40" class="TeXtField"></td>
                    </tr>
                    <tr>
                      <td valign="middle"><span class="general-bodyBold">Name of Employer/Business :</span></td>
                      <td valign="middle"><br /><input type="text" name="employer" id="employer" size="40" class="TeXtField"></td>
                    </tr>
                    <tr>
                      <td><span class="general-bodyBold">Phone Number :</span><span class="Required">*</span></td>
                      <td><input type="text" maxlength="50" name="phoneno" id="phoneno" size="40" class="TeXtField"></td>
                    </tr>
                    <tr>
                      <td colspan="2" ><span class="Note">*(Format: CountryCode-Area-Number)e.g.<% If Session("CountryOrigin") = "India" Then %>080-35465456/9886012345<% Else %>1-954-762-7536<% End If %></span></td>
                    </tr>
                    <tr>
                      <td><span class="general-bodyBold">Course Enrolling in :</span><span class="Required">*</span></td>
                      <td><select name="courseId" id="class" style="width:480px;"  class="TeXtFielddropdown">
                          <% If IsArray(arrAllCourses) Then
						   For rowCounter = firstRow to lastRow
						   If(CDate(arrAllCourses(2,rowCounter))-(Date())>=0) Then
						   If (arrAllCourses(25,rowCounter) <> "Full" ) Then
						%>
                          <option value="<% = arrAllCourses(0,rowCounter) %>" <% If CInt(SelectedCourseID) = CInt(arrAllCourses(0,rowCounter)) Then %> selected="selected" <% End If %>>
                          <% = arrAllCourses(1,rowCounter) %>
                          :
                          <% = FormatDateTime(arrAllCourses(2,rowCounter),1) %>
                          to
                          <% = FormatDateTime(arrAllCourses(3,rowCounter),1) %>
                          for
                          <% If (CDate(arrAllCourses(2,rowCounter))-(Date()+arrAllCourses(15,rowCounter)+1) >= 0) Then %>
                          <% = Currency_Format_Front %>
                          <% = FormatNumber(arrAllCourses(18,rowCounter)) %>
                          <% = Currency_Format_Back %>
                          <% Else %>
                          <% = Currency_Format_Front %>
                          <% = FormatNumber(arrAllCourses(12,rowCounter)) %>
                          <% = Currency_Format_Back %>
                          <% End If %>
                          </option>
                          <%
						   End If
						   End If
						   Next
						   End If %>
                        </select>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2"><span class="Note">*All prices on this page are inclusive of taxes</span></td>
                    </tr>
                    <tr>
                      <td><span class="general-bodyBold">Terms and Conditions :</span> </td>
                      <td><div align="right" style="margin-right:95px;"><a href="/termsAndConditions.asp" target="_blank">Printable Version</a></div>
						<iframe src="termsAndConditions.asp" frameborder="0" style="border:1px solid #999999;" width="80%"></iframe>                 <br />
                        <p>By clicking on 'I accept' below you are agreeing to the Terms and Conditions.</p>
                      </td>
                    </tr>
                    <tr>
                      <input type="hidden" name="step1" value="I accept. Classroom Training Enrollment">
					  <input type="hidden" name="usInstEmailId" value="<% = rqUsInstEmailId %>" />
                      <td colspan="2"><br />
                      <div align="center">
                        <input type="submit" value="I accept. Classroom Training Enrollment" class="ButtonGeneral" style="width:250px;" />
                      </div>
                      </td>
                    </tr>
                  </table>
				  </div>
            </form>
            </td>
            
            </tr>
            
            <tr>
              <td>&nbsp;</td>
            </tr>
			<!-- Google Code for Enroll Form Page Conversion Page -->
			<script type="text/javascript">
			<!--
			var google_conversion_id = 1065235366;
			var google_conversion_language = "en";
			var google_conversion_format = "2";
			var google_conversion_color = "ffffff";
			var google_conversion_label = "NTi8CK61lwEQpuf4-wM";
			var google_conversion_value = 0;
			//-->
			</script>
			<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
			</script>
			<noscript>
			<div style="display:inline;">
			<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1065235366/?label=NTi8CK61lwEQpuf4-wM&amp;guid=ON&amp;script=0"/>
			</div>
			</noscript>

            <% ElseIf(Step1 ="I accept. Classroom Training Enrollment") Then %>
            <tr>
              <td colspan="2" align="center" class="general-body">
			  <br />
               <div align="center"><span class="Header">COURSE ENROLLMENT DETAILS (INVOICE)<br />
                100% Moneyback Guarantee PMstudy.com Classroom Program</span><br /><br /></div></td>
            </tr>
            <tr>
              <td align="right" colspan="2"><div align="right"><span class="general-bodyBold">
                <% = FormatDateTime(todaysDate,1) %>
                </span></div></td>
            </tr>
            <tr>
              <td class="general-body"><span class="general-bodyBold">Enroll ID : </span>
                <% = Session("EnrollId") %></td>
            </tr>
            <tr>
              <td class="general-body"><span class="general-bodyBold">Name : </span>
                <% = Session("FirstName") %>
                &nbsp;
                <% =  Session("LastName") %></td>
            </tr>
            <tr>
              <td class="general-body"><span class="general-bodyBold">Email : </span>
                <% = Session("Email") %></td>
            </tr>
            <tr>
              <td class="general-body"><span class="general-bodyBold">Phone Number : </span>
                <% = Session("PhoneNumber") %></td>
            </tr>
            <tr>
              <td class="general-body"><span class="general-bodyBold">Name Of Employer/Business : </span>
                <% = Session("NameOfEmployeer") %></td>
            </tr>
            <tr>
              <td colspan="2" class="general-body"><br>
                <span class="Header">Details of your course and Payment : </span><br><br />
                <table border="0" width="95%" cellspacing="0" class="TableGeneral">
                  <tr>
                    <td align="center" class="TableRowOdd" width="85%"><span class="HeaderLarge">Details</span></td>
                    <td align="center" class="TableRowOdd"><span class="HeaderLarge">Payment</span></td>
                  </tr>
                  <tr>
                    <td class="TableRowEven"><span class="TableCopyName">PMP Classroom Training(4 days, 40 Contact Hours)
                      <% = CourseDetails %>
                      </span><br><span class="TableCopyDetails">
                      <% If Session("CountryOrigin") = "India" Then %>
                      (This includes
                      <% =  Tax %>
                      % service tax)</span>
                      <% End If %>
                    </td>
                    <td align="center" class="TableRowEven"><span class="TableCopyName">
                      <% = Currency_Format_Front %>
                      <% = FormatNumber(Total) %>
                      <% = Currency_Format_Back %>
                      </span></td>
                  </tr>
                  
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
			<% 	'Here i am showing hotel details for particular class'
				'Only for US and Canada Courses'
				If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then
				If Not IsNull(HotelAddress) And HotelAddress <> "" Then %>
			<tr>
				<td colspan="2"><table border="0" width="100%"><tr><td width="130px"><strong>Venue Details:</strong></td><td width="870px">	
					<% = HotelName %><br /><% = HotelAddress %><br /><% = City %><br />
					<% If HotelPhNo <> "" Then %>    
          			Ph: <% = HotelPhNo %>.<br />
		        	<% End If %>
					<a href="<% = HotelURL %>" target="_blank"><% = HotelURL %></a><br /><br>
				</td>
				</tr>
			</table>
		</td>
			</tr>
			<% End If 
			   End If %>
            <tr>
              <td colspan="2" class="general-body"><strong>Please Note : </strong><br>
                Full payment of the enrollment fee <strong>(
                <% = Currency_Format_Front %>
                <% =  FormatNumber(Total) %>
                <% = Currency_Format_Back %>
                )</strong> should be done through <br />
                <br />
            <% If Session("CountryOrigin") = "India" Then %>
                <% = Payments %>
            </tr>
            <% ElseIf Session("CountryOrigin") = "UAE" Then %>
            <tr>
            <td class="btext">
            <div style="margin-left:50px;">
            <table border="0" width="100%" cellpadding="1">
              <tr>
                <td width="100px"><B>1. PayPal </B></td><td width="900px">
                <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                  <input type="hidden" name="cmd" value="_xclick">
                  <input type="hidden" name="business" value="adminsupport@pmstudy.com">
                  <input type="hidden" name="item_name" value="Classroom Seminar - UAE">
                  <input type="hidden" name="item_number" value="5007">
                  <input type="hidden" name="amount" value="<% = Total %>">
                  <input type="hidden" name="cancel_return" value="http://www.pmstudy.com">
                  <input type="hidden" name="return" value="http://www.pmstudy.com/customerdetails.asp">
                  <input type="hidden" name="rm" value="2">
                  <input type="hidden" name="currency_code" value="USD">
                  <input type="image" src="/images/back/buybutton.gif" alt="BuyNow" /></form></td>
              </tr>
              <%
				 Dim ccvar2

				 If(Application("ccvar2")>10000) Then
						
				 Else
								
					Application("ccvar2")=int(now())*10000
								
				 End If 
			 %>
              <tr>
              <td width="100px"><B>2. CCAvenue</B></td><td width="900px">
              <form method="post" action="https://world.ccavenue.com/servlet/ccw.CCAvenueController">
                <input type="hidden" name=Merchant_Id value="t_satpat1848">
                <input type="hidden" name=Amount value="<% = TotalCCAvenue %>">
                <input type="hidden" name=Currency value="USD">
                <input type="hidden" name=Order_Id value="<% = Session("EnrollId") %>">
                <input type="hidden" name=TxnType value="A">
                <input type="hidden" name=actionID value="TXN">
                <input type="hidden" name="billing_cust_name" value="">
                <input type="hidden" name="billing_cust_address" value="">
                <input type="hidden" name="billing_cust_country" value="">
                <input type="hidden" name="billing_cust_state" value="">
                <input type="hidden" name="billing_cust_city" value="">
                <input type="hidden" name="billing_cust_zip" value="">
                <input type="hidden" name="billing_cust_tel_Ctry" value="">
                <input type="hidden" name="billing_cust_tel_Area" value="">
                <input type="hidden" name="billing_cust_tel_No" value="">
                <input type="hidden" name="billing_cust_email" value="">
                <input type="hidden" name="delivery_cust_name" value="">
                <input type="hidden" name="delivery_cust_address" value="">
                <input type="hidden" name="delivery_cust_city" value="">
                <input type="hidden" name="delivery_cust_state" value="">
                <input type="hidden" name="delivery_cust_zip" value="">
                <input type="hidden" name="delivery_cust_country" value="">
                <input type="hidden" name="delivery_cust_tel_Ctry" value="">
                <input type="hidden" name="delivery_cust_tel_Area" value="">
                <input type="hidden" name="delivery_cust_tel_No" value="">
                <input type="hidden" name="delivery_cust_notes" value="">
                <input type="image" src="/images/back/buybutton.gif" alt="BuyNow" /></form></td>
                </tr>
              </td>
              </tr>
              <tr>
                <td colspan="2"><b>3. Wire Transfer favoring "EDUSYS SERVICES PVT LIMITED"</b> , to the following details:<br /><div style="margin-left:55px;"><br /><b>Bank Name :</b> ICICI<br /><b>Account Number :</b> 040105000128<br /><b>Swift Code :</b> ICICINBBCTS<br /></div></td>
        	   </tr>
            </table></div>
            </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <% ElseIf Session("CountryOrigin") = "Singapore" Then %>
            <tr>
            <td class="btext">
            <table border="0">
              <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>1. PayPal </B></td>
                <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                  <input type="hidden" name="cmd" value="_xclick">
                  <input type="hidden" name="business" value="adminsupport@pmstudy.com">
                  <input type="hidden" name="item_name" value="Classroom Seminar - Singapore">
                  <input type="hidden" name="item_number" value="5007">
                  <input type="hidden" name="amount" value="<% = Total %>">
                  <input type="hidden" name="cancel_return" value="http://www.pmstudy.com">
                  <input type="hidden" name="return" value="http://www.pmstudy.com/customerdetails.asp">
                  <input type="hidden" name="rm" value="2">
                  <input type="hidden" name="currency_code" value="USD">
                  <td><input type="image" src="/images/back/buybutton.gif" alt="BuyNow" /></td>
                </form>
              </tr>
              <%
				 If(Application("ccvar2")>10000) Then
								
				 Else
								
					Application("ccvar2")=int(now())*10000
								
				 End If 
			  %>
            <tr>
              <td class="btext">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>2. CCAvenue &nbsp;</B></td>
              <form method="post" action="https://world.ccavenue.com/servlet/ccw.CCAvenueController">
                <input type="hidden" name=Merchant_Id value="t_satpat1848">
                <input type="hidden" name=Amount value="<% = TotalCCAvenue %>">
                <input type="hidden" name=Currency value="USD">
                <input type="hidden" name=Order_Id value="<% = Session("EnrollId") %>">
                <input type="hidden" name=TxnType value="A">

                <input type="hidden" name=actionID value="TXN">
                <input type="hidden" name="billing_cust_name" value="">
                <input type="hidden" name="billing_cust_address" value="">
                <input type="hidden" name="billing_cust_country" value="">
                <input type="hidden" name="billing_cust_state" value="">
                <input type="hidden" name="billing_cust_city" value="">
                <input type="hidden" name="billing_cust_zip" value="">
                <input type="hidden" name="billing_cust_tel_Ctry" value="">
                <input type="hidden" name="billing_cust_tel_Area" value="">
                <input type="hidden" name="billing_cust_tel_No" value="">
                <input type="hidden" name="billing_cust_email" value="">
                <input type="hidden" name="delivery_cust_name" value="">
                <input type="hidden" name="delivery_cust_address" value="">
                <input type="hidden" name="delivery_cust_city" value="">
                <input type="hidden" name="delivery_cust_state" value="">
                <input type="hidden" name="delivery_cust_zip" value="">
                <input type="hidden" name="delivery_cust_country" value="">
                <input type="hidden" name="delivery_cust_tel_Ctry" value="">
                <input type="hidden" name="delivery_cust_tel_Area" value="">
                <input type="hidden" name="delivery_cust_tel_No" value="">
                <input type="hidden" name="delivery_cust_notes" value="">
                <td><input type="image" src="/images/back/buybutton.gif" alt="BuyNow" /></td>
                </tr>
              </form>
              </td>
             </tr>
            </table>
           </td>
          </tr>
            <% ElseIf Session("CountryOrigin") = "Hong Kong" Then %>
            <tr>
            <td class="btext">
            <table border="0">
              <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>1. PayPal </B></td>

                <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                  <input type="hidden" name="cmd" value="_xclick">
                  <input type="hidden" name="business" value="adminsupport@pmstudy.com">
                  <input type="hidden" name="item_name" value="Classroom Seminar - Hong Kong">
                  <input type="hidden" name="item_number" value="5007">
                  <input type="hidden" name="amount" value="<% = Total %>">
                  <input type="hidden" name="cancel_return" value="http://www.pmstudy.com">
                  <input type="hidden" name="return" value="http://www.pmstudy.com/customerdetails.asp">
                  <input type="hidden" name="rm" value="2">
                  <input type="hidden" name="currency_code" value="USD">
                  <td><input type="image" src="/images/back/buybutton.gif" alt="BuyNow" /></td>
                </form>
              </tr>
              <%
				 If(Application("ccvar2")>10000) Then
								
				 Else
								
					Application("ccvar2")=int(now())*10000
								
				 End If 
			  %>
            <tr>
              <td class="btext">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>2. CCAvenue &nbsp;</B></td>
              <form method="post" action="https://world.ccavenue.com/servlet/ccw.CCAvenueController">
                <input type="hidden" name=Merchant_Id value="t_satpat1848">
                <input type="hidden" name=Amount value="<% = TotalCCAvenue %>">
                <input type="hidden" name=Currency value="USD">
                <input type="hidden" name=Order_Id value="<% = Session("EnrollId") %>">
                <input type="hidden" name=TxnType value="A">
                <input type="hidden" name=actionID value="TXN">
                <input type="hidden" name="billing_cust_name" value="">
                <input type="hidden" name="billing_cust_address" value="">
                <input type="hidden" name="billing_cust_country" value="">
                <input type="hidden" name="billing_cust_state" value="">
                <input type="hidden" name="billing_cust_city" value="">
                <input type="hidden" name="billing_cust_zip" value="">
                <input type="hidden" name="billing_cust_tel_Ctry" value="">
                <input type="hidden" name="billing_cust_tel_Area" value="">
                <input type="hidden" name="billing_cust_tel_No" value="">
                <input type="hidden" name="billing_cust_email" value="">
                <input type="hidden" name="delivery_cust_name" value="">
                <input type="hidden" name="delivery_cust_address" value="">
                <input type="hidden" name="delivery_cust_city" value="">
                <input type="hidden" name="delivery_cust_state" value="">
                <input type="hidden" name="delivery_cust_zip" value="">
                <input type="hidden" name="delivery_cust_country" value="">
                <input type="hidden" name="delivery_cust_tel_Ctry" value="">
                <input type="hidden" name="delivery_cust_tel_Area" value="">
                <input type="hidden" name="delivery_cust_tel_No" value="">
                <input type="hidden" name="delivery_cust_notes" value="">
                <td><input type="image" src="/images/back/buybutton.gif" alt="BuyNow" /></td>
                </tr>
              </form>
              </td>
             </tr>
            </table>
           </td>
          </tr>
          <% ElseIf Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then %>
          <% If (CDate(StartDate)-(Date()+ApplicableDays+1) >= 0) Then %>
            <tr>
              <td class="btext"><table border="0" width="100%">
                  <tr>
                    <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>1. Google Checkout </B></td>
                    <td>
                    <form action="https://checkout.google.com/api/checkout/v2/checkoutForm/Merchant/749730688196705" id="BB_BuyButtonForm" method="post" name="BB_BuyButtonForm">
                        <input name="item_name_1" type="hidden" value="PMstudy PMP Prep EBD"/>
                        <input name="item_description_1" type="hidden" value="PMstudy PMP-Prep Classroom Training"/>
                        <input name="item_quantity_1" type="hidden" value="1"/>
                        <input name="item_price_1" type="hidden" value="1800.0"/>
                        <input name="item_currency_1" type="hidden" value="USD"/>
                        <input name="_charset_" type="hidden" value="utf-8"/>
                        <input alt="" src="https://checkout.google.com/buttons/buy.gif?merchant_id=749730688196705&amp;w=117&amp;h=48&amp;style=white&amp;variant=text&amp;loc=en_US" type="image" align="middle"/>
                    </form></td>
                  </tr>
                </table></td>
            </tr>
            <tr>
              <td class="btext"><table border="0" width="100%">
                  <tr>
                    <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>2. Bank Transfer :</B></td>
                    <td><b>Bank Name: </b>Bank of America, Frederick, MD, USA<br /><b>Type of Account:</b> Current<br /><b>Account Name:</b> VMedu Inc<br><b>Account Number: </b>4460 0519 5493<br><b>Routing Number:</b> 052001633</b><br /><br /></td>
                    <td></td>
                   </tr>
                 </table>
               </td>
            </tr>
            <% Else %>
            <tr>
              <td class="btext"><table border="0" width="100%">
                  <tr>
                    <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>1. Google Checkout </B></td>
                    <td>
                    <form action="https://checkout.google.com/api/checkout/v2/checkoutForm/Merchant/749730688196705" id="BB_BuyButtonForm" method="post" name="BB_BuyButtonForm">
                        <input name="item_name_1" type="hidden" value="PMstudy PMP Prep"/>
                        <input name="item_description_1" type="hidden" value="PMstudy PMP-Prep Classroom Training"/>
                        <input name="item_quantity_1" type="hidden" value="1"/>
                        <input name="item_price_1" type="hidden" value="1900.0"/>
                        <input name="item_currency_1" type="hidden" value="USD"/>
                        <input name="_charset_" type="hidden" value="utf-8"/>
                        <input alt="" src="https://checkout.google.com/buttons/buy.gif?merchant_id=749730688196705&amp;w=117&amp;h=48&amp;style=white&amp;variant=text&amp;loc=en_US" type="image" align="middle"/>
                    </form></td>
                  </tr>
                </table></td>
            </tr>
            <tr>
              <td class="btext"><table border="0" width="100%">
                  <tr>
                    <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>2. Bank Transfer :</B></td>
                    <td><b>Bank Name: </b>Bank of America, Frederick, MD, USA<br /><b>Type of Account:</b> Current<br /><b>Account Name:</b> VMedu Inc<br><b>Account Number: </b>4460 0519 5493<br><b>Routing Number:</b> 052001633</b><br /><br /></td>
                   </tr>
                 </table>
               </td>
            </tr>            
            <% End If %>
            <% End If %>
            <tr>
              <td colspan="2" class="general-body">
                <span>We have reserved a place for you in this course. However, the payment should be received by us
                <% If(CDate(StartDate)-(Date()-1)>5) Then%>
                within 5 days from today i.e. before
                <% =  FormatDateTime(DateAdd("d", +4,CDate(todaysDate)),1) %>
                </span>
                <% End If %>
                <% If(CDate(StartDate)-(Date())=4) Then%>
                within 4 days from today i.e. before
                <% =  FormatDateTime(DateAdd("d", +3,CDate(todaysDate)),1) %>
                </span>
                <% End If %>
                <% If(CDate(StartDate)-(Date())=3) Then%>
                within 3 days from today i.e. before
                <% = FormatDateTime(DateAdd("d", +2,CDate(todaysDate)),1) %>
                </span>
                <% End If %>
                <% If(CDate(StartDate)-(Date())=2) Then%>
                within 2 days from today i.e. before
                <% = FormatDateTime(DateAdd("d", +1,CDate(todaysDate)),1) %>
                </span>
                <% End If %>
                <% If(CDate(StartDate)-(Date())=1) Then%>
                today i.e. before 5 PM                 <% = FormatDateTime(todaysDate,1) %>
                </span>
                <% End If %>
                <% If(CDate(StartDate)-(Date())=0) Then%>
                today i.e. before 9 AM
                <% = FormatDateTime(todaysDate,1) %>
                </span>
                <% End If %>
                - otherwise, your registration for this program will be cancelled. </td>
            </tr>
            <tr>
              <td colspan="2" class="general-body">
               <p> A copy of the invoice has also been emailed to you. Please check your email address
                i.e.
                <% = Session("Email") %>
                (Note that the email might have gone to your bulk/junk email folder). For queries
                or clarifications, please email us at marketing@pmstudy.com.<p> </td>
            </tr>
            <tr>
              <td colspan="2" class="general-body">
                <p><span class="general-bodyBold">Please Note : </span>You will be allowed access to the free 100% Online Preparatory Course for <a href="/PMP-Classes/moneyBack.asp">PMstudy.com</a> Classroom Course only after we receive your payment : this is a simple online course which can be completed with a few hours of study and will provide you with the PDUs required to apply for PMP Exam. This course is a pre-requisite for pmstudy.com Classroom Course.</p>
				<p>PMstudy offers 100% Moneyback Guarantee on its classroom programs.<span class="general-bodyBold">Details:</span> <a href="/PMP-Classes/moneyBack.asp">http://www.pmstudy.com/PMP-Classes/moneyBack.asp</a>; Also, please refer to the free 100% MoneyBack Guarantee Terms and Conditions: <a href="/termsAndConditions.asp">http://www.pmstudy.com/termsAndConditions.asp</a></p>  </td>
            </tr>
            <tr>
              <td align="center" colspan="3">
                <font face="Arial" color = "green" size="2.5"><b>We look forward to having you as a student with PMstudy.com Classroom Training!!!</b></font> </td>
            </tr>
            <tr>
              <td><br /><br /><span class="general-bodyBold">Best Regards,<br />Customer Support<br /><a href="http://www.PMstudy.com">www.PMstudy.com</a><br />(PMI Approved Global Registered Education Provider)<br />Email:<a href="javascript:openit();">marketing@PMstudy.com</a></span></td>
            </tr>
			<!-- Google Code for Enrollment Submission - CR Conversion Page -->
			<script type="text/javascript">
			<!--
			var google_conversion_id = 1065235366;
			var google_conversion_language = "en";
			var google_conversion_format = "2";
			var google_conversion_color = "ffffff";
			var google_conversion_label = "yo6vCIi2lwEQpuf4-wM";
			var google_conversion_value = 0;
			//-->
			</script>
			<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
			</script>
			<noscript>
			<div style="display:inline;">
			<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1065235366/?label=yo6vCIi2lwEQpuf4-wM&amp;guid=ON&amp;script=0"/>
			</div>
			</noscript>			          
            <% End If %>
          </table>
          </td>

          </tr>
          
        </table>
        <!-- Content End From Here-->
		<!--#include virtual="/includes/connectionClose.asp"-->
      </div>
      </td>
      
      </tr>
      
    </table>
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
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?label=-vhlCLeGqQEQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->