<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<!--#include virtual="/includes/headermetagerman.asp"-->
<!--#include virtual="/includes/innerwhyusbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->

<%' response.codePage = 65001
'response.charset = "utf-8"
%>
 <!-- Body Starts -->
  <div>
  	<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="235" align="left" valign="top" bgcolor="#FFFFFF">
				<table width="100%" border="0" cellspacing="0" cellpadding="8">

                  <tr>
                    <td width="2%" class="Header">&nbsp;</td>
                    <td width="25%" class="PageTitle">&nbsp;</td>
                    <td width="73%" class="PageTitle">ITILSTUDY KLASSENZIMMERPROGRAMM MIT RÜCKGABEGARANTIE </td>
                  </tr>
                  <tr>
            <!--#include virtual="/includes/innerLeftMenu-German.asp"-->
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
					 strQuery = "SELECT * FROM ITIL_course WHERE country = (SELECT country FROM ITIL_course WHERE courseid = '"&SelectedCourseID&"') AND status <> 'Cancelled' order by startdate,city desc"
					  
					 Else
					 strQuery = "SELECT * FROM ITIL_course WHERE country = '" & Session("CountryOrigin") & "' AND status <> 'Cancelled' order by startdate,city desc"
					 
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
					
					'Retrive the country details from ITIL_countrydetails for displaying the details'
					strCountryDetails = "SELECT * FROM ITIL_countrydetails WHERE country = '" & Session("CountryOrigin") & "' AND id = (SELECT MAX(id) FROM ITIL_countrydetails WHERE country = '"& Session("CountryOrigin") &"')"
					
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

					 strQuery2 = "SELECT * FROM ITIL_course Where courseid = '" & rqCourseId & "'"

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
							TotalWithoutTax = Rs2("afterEBdiscountwithouttax")
							Total = Rs2("afterEBdiscountwithtax")
							TotalCCAvenue = Int(Rs2("afterEBdiscountwithtax"))
						Else
							TotalWithoutTax = Rs2("pricewithouttax")
							Total = Rs2("pricewithtax")
							TotalCCAvenue = Int(Rs2("pricewithtax"))
						End If
			
						Tax = Rs2("tax")
						

					'for displaying the prices in UK'
					'Actual amount and VAT'
					If (Session("CountryOrigin") = "Germany") Then
						
						VAT = ((Int(TotalWithoutTax) * Int(Tax)) / 100)
						
					End If						

					 Rs2.movenext
					 Loop
					 
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
							 Session("message") = "All participants attending our programs in Texas should be sponsored by their employer, and should provide the employer details while enrolling for the ITILstudy course.<br><br>" 
							 
							Response.Redirect("registrierenKlasse.asp")
							
					End If
						
					'Else
					 
						
					 'For display the course details formatting the course like Raleigh : Saturday, April 17, 2010 to Tuesday, April 20, 2010 for $ 1,800.00'
					 CourseDetails = City & " : " & FormatDateTime(StartDate,1) & " to " & FormatDateTime(EndDate,1) & " for " & Currency_Format_Front & " " & FormatNumber(Total) & " " & Currency_Format_Back

					 CourseDate = StartDate & " to " & EndDate
					  
					 EnrolledCourse = City & " : " & FormatDateTime(StartDate,1) & " to " & FormatDateTime(EndDate,1)
				 					
					'If You Fill The Registration Form In Step2 That User Details Insert Here'

					'SQL Query For Inserting The Values Into DataBase'

					 strQuery1 = "INSERT INTO ITIL_enrolledusers (firstname,lastname,email,nameofemployeer,phoneno,coursedetails,coursedate,amount,dateofenrollment,paybefore,status,pmbok,courseid,statusnumber,pmbokprice,discountpercentage,courseType,"
					 If (Session("CountryOrigin") = "Germany") Then 
					 strQuery1 = strQuery1 & "VAT,"
					 End If
					 strQuery1 = strQuery1 & "country)"
					 strQuery1 = strQuery1 & " Values "
					 strQuery1 = strQuery1 & "('" & rqFirstName & "',"
					 strQuery1 = strQuery1 & "'" & rqLastName & "',"
					 strQuery1 = strQuery1 & "'" & rqEmail & "',"
					 strQuery1 = strQuery1 & "'" & rqNameOfEmployeer & "',"
					 strQuery1 = strQuery1 & "'" & rqPhoneNumber & "',"
					 strQuery1 = strQuery1 & "'" & CourseDetails & "',"
					 strQuery1 = strQuery1 & "'" & CourseDate & "',"
					 If (Session("CountryOrigin") = "Germany") Then
					 strQuery1 = strQuery1 & "'" & TotalWithoutTax & "',"
					 Else
					 strQuery1 = strQuery1 & "'" & Total & "',"		 
					 End If
					 strQuery1 = strQuery1 & "'" & now() & "',"
					 strQuery1 = strQuery1 & "'" & PayBefore & "',"
					 strQuery1 = strQuery1 & "'Active',"
					 strQuery1 = strQuery1 & "'No',"
					 strQuery1 = strQuery1 & "'" & rqCourseId & "',"
					 strQuery1 = strQuery1 & "'1',"
					 strQuery1 = strQuery1 & "'0',"
					 strQuery1 = strQuery1 & "'0',"
					 strQuery1 = strQuery1 & "'Foundation',"
					 If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Germany") Then 
					 strQuery1 = strQuery1 & "'" & VAT & "',"
					 End If
					 strQuery1 = strQuery1 & "'" & Country & "')"

					 Rs1.Open strQuery1,ConnObj

					 strQuery3 = "SELECT max(id) as EnrollId FROM ITIL_enrolledusers"

					 Rs3.Open strQuery3,ConnObj

					 do until Rs3.Eof
					   Session("EnrollId") = Rs3("EnrollId")
					 Rs3.Movenext
					 Loop
					 
					 EnrollId = Session("EnrollId")
						
					 'Send proforma invoice email'
'strBody = ("<HTML><HEAD> <META HTTP-EQUIV='Content-Type' CONTENT='text/html; charset=utf-8'>")
 'strBody = strBody & ("<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1' /></HEAD>")

					  strBody = "<table width=""100%"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td>&nbsp;</td></tr><tr><td><table width=""600px"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""595px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span></td></tr>"
					  strBody = strBody & "<tr><td align=""center"" colspan=""2"" width=""560px""><table border=""0"" align=""center"" width=""560px""><tr><td align=""center""><br><br><font face=""Arial"" size=""3"" color=""#0359b4""><b>KURS-REGISTRIERUNGS-DETAILS (RECHNUNG)"
					
					  strBody = strBody & "</b></font></td></tr>"
					  strBody = strBody & "<tr><td align=""right"" colspan=""2""><font face=""Arial"" size=""2""><b>" & FormatDateTime(todaysDate,1) & "</b></font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">ID zu registrieren : " & Session("EnrollId") & "</font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name : " & rqFirstName & "&nbsp; " & rqLastName & "</font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Email : " & rqEmail & " </font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Telefonnummer : " & rqPhoneNumber & "</font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name des Arbeitgebers/Business : " & rqNameOfEmployeer & "</font></td></tr>"
					  strBody = strBody & "<tr><td align=""left"" colspan=""2""><br><font face=""Arial"" size=""2"">Informationen &#252;ber Ihren Kurs und Zahlung:</font><br><table border=""1"" cellspacing=""0"" align=""center"" width=""560px"">"
					  strBody = strBody & "<tr><td width=""60%""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Informationen</font></b></td><td width=""15%"" align=""center""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Zahlung</font></b></td></tr>"
					  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>ITIL Classroom Training " & CourseDetails & "</b>"
					  If Tax <> 0 Then
					  strBody = strBody &"<br>(This includes " & Tax & "% service tax)"
					  End If
					  strBody = strBody &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
					  strBody = strBody & Currency_Format_Front & " " & FormatNumber(TotalWithoutTax) & " " & Currency_Format_Back
					  strBody = strBody &"</b></td></tr>"
					   strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>VAT @ 19%</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		  strBody = strBody & Currency_Format_Front & " " & FormatNumber(VAT) & " " & Currency_Format_Back & "</b></font></td></tr>"
					  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>Gesamt</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
					  strBody = strBody & Currency_Format_Front & " " & FormatNumber(Total) & " " & Currency_Format_Back
					  strBody = strBody & "</b></font></td></tr></table><br></td></tr>"
					  'Here i am showing in the email hotel details for us and canada classes only'
					  'If Not IsNull(HotelAddress) And HotelAddress <> "" Then
'					  strBody = strBody & "<tr><td align=""left"" colspan=""2""><table border=""0"" width=""100%""><tr><td width=""170px"" valign=""top""><font face=""Arial"" size=""2""><b>Venue Details:</b></font></td><td width=""830px"">"& HotelName &"<br>" & HotelAddress &" "& City &"<br>"
'					  If HotelPhNo <> "" Then
'					  strBody = strBody & "Ph: "& HotelPhNo &"<br>"
'					  End If
'					  strBody = strBody & "<a href="& HotelURL &" target=""_blank"">"& HotelURL &"</a><br /><br></td></tr></table></td></tr>"
'					  End If
					  strBody = strBody & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><b>Bitte beachten Sie:</b></font><br>"
					  strBody = strBody & "<font face=""Arial"" size=""2"">Vollst&#228;ndiger Bezahlung der Geb&#252;hr <b>(" & Currency_Format_Front & " " & FormatNumber(Total) & " " & Currency_Format_Back & "</b>) "
					  strBody = strBody & "Vollst&#228;ndiger Bezahlung der Geb&#252;hr </font></td></tr><tr><td align=""left"">"
					  strBody = strBody & "<ul><li><font face=""Arial"" size=""2""><b>PayPal </b></font>"
					  strBody = strBody & "&nbsp;&nbsp;<a href=""http://www.ITILstudy.com/payment.asp?enrollUserID="& Session("EnrollId") &"&Country="& Session("CountryOrigin") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><b>Buy Now</b></font></a><br><br></li>"
					
					  strBody = strBody & "<font face=""Arial"" size=""2"">" & PaymentsAfterEnroll & "</font>"					  
					  strBody = strBody & "</td></tr>"
					  strBody = strBody & "<tr><td align=""left"" colspan=""2""><span style=""color:red""><sup>*</sup></span> : Umsatzsteuer-Identifikationsnummer - DE279098575<br>Dies ist eine Proforma-Rechnung. F&#252;r steuerliche Anspr&#252;che nicht in Betracht.</td></tr>"
					  strBody = strBody & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><br><i>In diesem Kurs haben wir einen Platz f&#252;r Sie reserviert. Allerdings die Zahlung sollte erhalten werden von uns innerhalb von "
					  If(CDate(StartDate)-(Date()-1)>5) Then
					  strBody = strBody & " 5 </i>"
					  End If
					  If(CDate(StartDate)-(Date())=4) Then
					  strBody = strBody & " 4 </i>"
					  End If
					  If(CDate(StartDate)-(Date())=3) Then
					  strBody = strBody & " 3 </i>"
					  End If
					  If(CDate(StartDate)-(Date())=2) Then
					  strBody = strBody & " 2 </i>"
					  End If
					  If(CDate(StartDate)-(Date())=1) Then
					  strBody = strBody & "today i.e. before 5 PM " & FormatDateTime(todaysDate,1) & "</i>"
					  End If
					  If(CDate(StartDate)-(Date())=0) Then
					  strBody = strBody & "today i.e. before 9 PM " & FormatDateTime(todaysDate,1) & "</i>"
					  End If
					  strBody = strBody & " - <i>Tagen ab heute also vor sonst, Ihre Registrierung f&#252;r dieses Programm wird abgebrochen.</i> </font></td></tr>"
					  
					  strBody = strBody & " <tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><br>Eine Kopie der Rechnung hat auch e-Mail an Sie gesendet. Bitte &#252;berpr&#252;fen Sie Ihre e-Mail-Adresse d.h. (Anmerkung, die die e-Mail k&#246;nnte Ihre Bulk/Junk-Mail Ordner gegangen sind). F&#252;r Fragen oder Klarstellungen bitte e-Mail an <a href""marketing@ITILstudy.com"">marketing@ITILstudy.com</a>.</font></td></tr>"  
					  strBody = strBody & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><br>Bitte beachten Sie:  Sie werden bereitgestellt Zugang zu 100 % kostenlose Online Vorbereitungskurs f&#252;r ITILstudy.com Unterricht nat&#252;rlich erst, nachdem wir Ihre Zahlung erhalten: Dies ist eine einfache online-Kurs mit ein paar Stunden der Studie abgeschlossen werden kann und bieten Sie mit 18 PMI PDUs nach Abschluss der Klassenzimmer-Training-Programm genehmigt.<br>Besuchen Sie f&#252;r ITILstudy Classroom Training Allgemeine Gesch&#228;ftsbedingungen bitte http://www.itilstudy.com/German/Gesch&#228;ftsbedingungen.asp</font></td></tr>"  
					  strBody = strBody & "<tr><td align=""center"" colspan=""3""><br><font face=""Arial"" color = ""green"" size=""3"">Wir freuen uns, Sie als Studentin mit ITILstudy.com Schulungen!!!</font></td></tr>"
	 				  strBody = strBody & "<tr><td align=""left""><br><font face=""Arial"" size=2>Alles Gute,</font></td></tr>"
	 				  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=2>Kunden-Support</font></td></tr>"
	 				  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=2><a href=""http://www.ITILstudy.com"" target=""_blank"">www.ITILstudy.com</a></font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=2>Email id : marketing@ITILstudy.com</font></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr></table></td></tr><tr><td height=""45%"">&nbsp;</td></tr></table>"
					  strBody = strBody & ("</HTML>")


'Response.Write(strBody)

   				     Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
					   'objCDOMail.HTMLBodyPart.charset = "UTF-8" 
					 objCDOMail.From = "marketing@ITILstudy.com"
					' objCDOMail.From = "edusyssavita@gmail.com"
					 objCDOMail.To =  "<" & rqEmail & ">"
					
					 objCDOMail.cc = "marketing@ITILstudy.com, adminsupport@ITILstudy.com"
					' objCDOMail.Bcc = "t_satpathy@yahoo.com"
'					 objCDOMail.Importance = 2
					 objCDOMail.Subject = "Enrollment in ITILstudy.com Classroom Coaching for ITIL Certification Exam"
					 objCDOMail.BodyFormat = 0
					 objCDOMail.MailFormat = 0
					 objCDOMail.Body =  strBody
					 objCDOMail.Send
					 Set objCDOMail = Nothing
					
					
					End If
					%>
      
<div>
<table width="97%" border="0" cellpadding="0" cellspacing="0" class="general-body">

          
            <tr>
              <td colspan="2" align="center" class="general-body">
			  <br />
               <div align="center"><span class="Header">ITILSTUDY FOUNDATION KLASSENZIMMER PROGRAMM
              </span><br /></div></td>
            </tr>
            <tr>
              <td align="right" colspan="2"><div align="right"><span class="general-bodyBold">
                <% = FormatDateTime(todaysDate,1) %>
                </span></div></td>
            </tr>
            <tr>
              <td class="general-body"><span class="general-bodyBold">ID zu registrieren : </span>
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
              <td class="general-body"><span class="general-bodyBold">Telefonnummer : </span>
                <% = Session("PhoneNumber") %></td>
            </tr>
            <tr>
              <td class="general-body"><span class="general-bodyBold">Name des Arbeitgebers/Business : </span>
                <% = Session("NameOfEmployeer") %></td>
            </tr>
            <tr>
              <td colspan="2" class="general-body"><br>
                <span class="Header">Informationen über Ihren Kurs und Zahlung: </span><br><br />
                <table border="0" width="95%" cellspacing="0" class="TableGeneral">
                  <tr>
                    <td align="center" class="TableRowOdd" width="85%"><span class="HeaderLarge">Informationen</span></td>
                    <td align="center" class="TableRowOdd"><span class="HeaderLarge">Zahlung</span></td>
                  </tr>
                  <tr>
                    <td class="TableRowEven"><span class="TableCopyName">ITIL Classroom Training
                      <% = CourseDetails %>
                      </span><br><span class="TableCopyDetails">
                    </td>
                      <td align="center" class="TableRowEven"><span class="TableCopyName">
                        <% = Currency_Format_Front %>
                        <% = FormatNumber(TotalWithoutTax) %>
                        <% = Currency_Format_Back %>
                        </span></td></tr>
                      <tr>
                      <td class="TableRowEven"><span class="TableCopyName">VAT @ 19%</span></td><td align="center" class="TableRowEven"><span class="TableCopyName">
                        <% = Currency_Format_Front %>
                        <% = FormatNumber(VAT) %>
                        <% = Currency_Format_Back %>
                        </span></td>  </tr>  
                  
                  <tr>
                    <td align="right" class="Tablefooter"><span class="TableCopyName">Gesamt</span></td>
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
			
            <tr>
              <td colspan="2" class="general-body"><strong>Bitte beachten Sie : </strong><br>
                Vollständiger Bezahlung der Gebühr <strong>(
                <% = Currency_Format_Front %>
                <% =  FormatNumber(Total) %>
                <% = Currency_Format_Back %>
                )</strong> sollte über erfolgen <br />
                <br />
             
      <% 'If (Session("CountryOrigin") = "Germany") Then%>
      <tr>
        <td class="btext"><table border="0" width="100%">
            <tr>
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>PayPal </B></td>
			<td>
            
            
                <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                  <input type="hidden" name="cmd" value="_cart">
                  <input type="hidden" name="upload" value="1">
                  <input type="hidden" name="item_number" value="5007">
                  <input type="hidden" name="business" value="edusysservices@gmail.com">
                  <input type="hidden" name="item_name_1" value="Classroom Course - Germany">
                  <input type="hidden" name="currency_code" value="EUR">
                  <input type="hidden" name="cancel_return" value="http://www.ITILstudy.com">
                  <input type="hidden" name="return" value="http://www.ITILstudy.com/payment-success.asp">
                  <input type="hidden" name="amount_1" value="<% = Total %>">
                  <input type="image" src="/images/back/buybutton.gif" alt="BuyNow" />
                </form>            
            
</td>
            </tr>
          </table></td>          
        </tr>
            
            <%' End If %>
            <tr>
              <td colspan="2" class="general-body">
                <span>In diesem Kurs haben wir einen Platz für Sie reserviert. Allerdings die Zahlung sollte erhalten werden von uns innerhalb von 
                <% If(CDate(StartDate)-(Date()-1)>5) Then%>
                 5 
                 </span>
                <% End If %>
                <% If(CDate(StartDate)-(Date())=4) Then%>
                 4
                </span>
                <% End If %>
                <% If(CDate(StartDate)-(Date())=3) Then%>
                 3 
                </span>
                <% End If %>
                <% If(CDate(StartDate)-(Date())=2) Then%>
                 2
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
                - Tagen ab heute also vor sonst, Ihre Registrierung für dieses Programm wird abgebrochen. </td>
            </tr>
            <tr>
              <td colspan="2" class="general-body">
               <p> Eine Kopie der Rechnung hat auch e-Mail an Sie gesendet. Bitte überprüfen Sie Ihre e-Mail-Adresse d.h. (Anmerkung, die die e-Mail könnte Ihre Bulk/Junk-Mail Ordner gegangen sind). Für Fragen oder Klarstellungen bitte e-Mail an marketing@ITILstudy.com.<p> </td>
            </tr>
            <tr>
              <td colspan="2" class="general-body">
                <p><span class="general-bodyBold">Bitte beachten Sie:  </span>Sie werden bereitgestellt Zugang zu 100 % kostenlose Online Vorbereitungskurs für ITILstudy.com Unterricht natürlich erst, nachdem wir Ihre Zahlung erhalten: Dies ist eine einfache online-Kurs mit ein paar Stunden der Studie abgeschlossen werden kann und bieten Sie mit 18 PMI PDUs nach Abschluss der Klassenzimmer-Training-Programm genehmigt.</p>
				<p>Besuchen Sie für ITILstudy Classroom Training Allgemeine Geschäftsbedingungen bitte http://www.itilstudy.com/German/Geschäftsbedingungen.asp</p>  </td>
            </tr>
            <tr>
              <td align="center" colspan="3">
                <font face="Arial" color = "green" size="2.5"><b>Wir freuen uns, Sie als Studentin mit ITILstudy.com Schulungen!!!</b></font> </td>
            </tr>
            <tr>
              <td><br /><br /><span class="general-bodyBold">Alles Gute,<br />Kunden-Support<br /><a href="http://www.ITILstudy.com">www.ITILstudy.com</a><br />Email:<a href="javascript:openit();">marketing@ITILstudy.com</a></span></td>
            </tr>
			<%
					 'Clear the session variables'
					 Session("FirstName1")    =  ""
					 Session("LastName1")     =  ""
					 Session("Email1")        =  ""
					 Session("PhoneNumber1")  =  ""
					 Session("Course1")       =  ""
					 Session("SelectedCourseID") = ""
					 Session("message") = ""
			%>        
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
<!-- Google Code for ITILstudy GER German - ES Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "kdNhCIPF1QIQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?value=0&amp;label=kdNhCIPF1QIQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


<!--#include virtual="/includes/footer.html"-->