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
            <% If Step1 = "" Then %>
            <form action="/german/registrierenErfolg.asp" method="post" onsubmit="return validate_form(this)">
              <tr>
                <td><div style="margin-left:-0;"><span class="Required"><% = Session("message") %></span> 
				<table border="0" cellpadding="3" cellspacing="0" width="100%">
                    <tr>
                      <td width="28%"><span class="general-bodyBold">Vorname :</span><span class="Required">*</span></td>
                      <td><input type="text" name="firstname" id="firstname" value="<% = Session("FirstName1") %>" class="TeXtField"></td>
                    </tr>
                    <tr>
                      <td><span class="general-bodyBold">Nachname :</span><span class="Required">*</span></td>
                      <td><input type="text" name="lastname" id="lastname" value="<% = Session("LastName1") %>" class="TeXtField"></td>
                    </tr>
                    <tr>
                      <td colspan="2" ><span class="Note">*Dieser Name erscheint in Kontakt Stunde/PDUs Zertifikate</span></td>
                    </tr>
                    <tr>
                      <td><span class="general-bodyBold">EMail :</span><span class="Required">*</span></td>
                      <td><input type="text" name="email" id="email" size="40" value="<% = Session("Email1") %>" class="TeXtField"></td>
                    </tr>
                    <tr>
                      <td valign="middle"><span class="general-bodyBold">Name der  Arbeitgeber/Firmen :</span></td>
                      <td valign="middle"><br /><input type="text" name="employer" id="employer" size="40" class="TeXtField"></td>
                    </tr>
                    <tr>
                      <td><span class="general-bodyBold">Telefonnummer :</span><span class="Required">*</span></td>
                      <td><input type="text" maxlength="50" name="phoneno" id="phoneno" value="<% = Session("PhoneNumber1") %>" size="40" class="TeXtField"></td>
                    </tr>
                    <tr>
                      <td colspan="2" ><span class="Note">*(Format: Landesvorwahl - Vorwahl-Nummer) e.g. 49-954-762-7536</span></td>
                    </tr>
                    <tr>
                      <td><span class="general-bodyBold">Einschreibung in Kurs :</span><span class="Required">*</span></td>
                      <td><select name="courseId" id="class" style="width:480px;"  class="TeXtFielddropdown">
                              <% If IsArray(arrAllCourses) Then
						   For rowCounter = firstRow to lastRow
						   

						   
						   If(CDate(arrAllCourses(2,rowCounter))-(Date())>=0) Then

   						   'Adding a If condition for dont display the Corporate classes in the enroll class page'
						   If (IsNull(arrAllCourses(27,rowCounter)) OR arrAllCourses(27,rowCounter) <> "Corporate") Then

						   If (arrAllCourses(25,rowCounter) <> "Full" ) Then
						%>
						<% If Session("SelectedCourseID") <> "" Then %>
                          <option value="<% = arrAllCourses(0,rowCounter) %>" <% If CInt(Session("SelectedCourseID")) = CInt(arrAllCourses(0,rowCounter)) Then %> selected="selected" <% End If %>>
						<% Else %>
                          <option value="<% = arrAllCourses(0,rowCounter) %>" <% If CInt(SelectedCourseID) = CInt(arrAllCourses(0,rowCounter)) Then %> selected="selected" <% End If %>>
						  <% End If %>
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
						    End If
						   Next
						   End If %>
                        </select>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2"><span class="Note">*Alle Preise auf dieser Seite sind  inklusiv der Steuer</span></td>
                    </tr>
                    <tr>
                      <td><span class="general-bodyBold">Geschäftbedingungen:  </span> </td>
                      <td><div align="right" style="margin-right:95px;"><a href="/german/Geschäftsbedingungen.asp" target="_blank">Druckbare version</a></div>
						<iframe src="/german/Geschäftsbedingungen.asp" frameborder="0" style="border:1px solid #999999;" width="80%"></iframe><br />
                        <p>Durch Klicken auf "Ich akzeptiere" unter Sie, dass die allgemeinen Geschäftsbedingungen zustimmen.</p>
                      </td>
                    </tr>
                    <tr>
                      <input type="hidden" name="step1" value="I accept. Classroom Training Enrollment">
					  <input type="hidden" name="usInstEmailId" value="<% = rqUsInstEmailId %>" />
                      <td colspan="2"><br />
                      <div align="center">
                        <input type="submit" value="Ich akzeptiere Gruppenschulung Registrierung" class="ButtonGeneral" style="width:250px;" />
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
            <% ElseIf(Step1 ="I accept. Classroom Training Enrollment") Then %>
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
			<% 	'Here i am showing hotel details for particular class'
				'Only for US and Canada Courses'

				'If Not IsNull(HotelAddress) And HotelAddress <> "" Then %>
	<!--		<tr>
				<td colspan="2"><table border="0" width="100%"><tr><td width="130px"><strong>Venue Details:</strong></td><td width="870px">	
					<%' = HotelName %><br /><%' = HotelAddress %><br /><% '= City %><br />
					<%' If HotelPhNo <> "" Then %>    
          			Ph: <%' = HotelPhNo %>.<br />
		        	<% 'End If %>
					<a href="<%' = HotelURL %>" target="_blank"><% '= HotelURL %></a><br /><br>
				</td>
				</tr>
			</table>
		</td>
			</tr>-->
			<% 'End If 
			    %>
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

<!-- Google Code for ITILstudy GER German - EF Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "7OErCIvE1QIQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?value=0&amp;label=7OErCIvE1QIQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>



<!-- Google Code for EnrollClass Conversion Page -->

  <!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->