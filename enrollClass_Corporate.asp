<!--#include virtual="/metatags/dates_location_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/innerbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<!-- Body Starts -->
    <%
	 'Declare Local Variables'
	 Dim Rs, rqUsInstEmailId, SelectedCourseID
	 Dim Currency_Format_Front, Currency_Format_Back
	 Dim strQuery, arrAllCourses, numRows, firstRow, lastRow
	 Dim strCountryDetails
	 Dim Cancellation1, Cancellation2, Cancellation3, Reschedule1, Reschedule2, Reschedule3
	 Dim OnlinePhNo,ClassPhNo1, ClassPhNo2, Address, Payments, CurrencyFormat, PaymentsAfterEnroll
	 Dim PayOption1, PayOption2
	 
	 'Creating recordobjects'
	 Set Rs  = Server.CreateObject("ADODB.Recordset")

	 'Retrive Us instructor email id from usbackoffice'
	 rqUsInstEmailId = Request.Form("usInstEmailId")
	 rqCourseType = Request.Form("TypeCourse")
	 
	 'This CourseID Retriving From dates_location.asp Page'
	 'based on this id, we are displaying the selected course in the dropdown'

	 SelectedCourseID = Request.Form("SelCourseID")

	'Currency Format Display Functions'
	 Currency_Format_Front = CurrencyFormat_Front(Session("CountryOrigin"))

	 Currency_Format_Back = CurrencyFormat_Back(Session("CountryOrigin"))

	 'This page is coming from dates_location page then if condition will work '
	 'Otherwise else part will work (if you open this page directly or some clicks on the links)'
	 If SelectedCourseID <> "" Then
		 strQuery = "SELECT * FROM itil_course WHERE country = (SELECT country FROM itil_course WHERE courseid = '"&SelectedCourseID&"') And courseType = 'Corporate' AND startdate BETWEEN '"&Now() - 1&"' AND DATEADD(day,180,'"&Now()&"') AND status <> 'Cancelled' order by startdate,city desc"
		 Else
		 strQuery = "SELECT * FROM itil_course WHERE country = '" & Session("CountryOrigin") & "' AND startdate BETWEEN '"&Now() - 1&"' AND DATEADD(day,180,'"&Now()&"') And courseType = 'Corporate' AND  status <> 'Cancelled' order by startdate,city desc"
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
	strCountryDetails = "SELECT * FROM itil_countrydetails WHERE country = '" & Session("CountryOrigin") & "' AND id = (SELECT MAX(id) FROM itil_countrydetails WHERE country = '"& Session("CountryOrigin") &"')"

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
<div>
<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
 <tr>
  <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
   <table width="100%" border="0" cellspacing="0" cellpadding="8">
    <tr>
       <td width="2%">&nbsp;</td>
      <td width="25%" >&nbsp;</td>
	  <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; ITIL Courses &raquo; Enrollclass</td>
    </tr>
    <tr>
    <!--#include virtual="/includes/innerLeftMenu.asp"-->
    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
	<h1 class="PageTitle">ITILstudy Foundation <% = rqCourseType %> Program
        <% If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Australia") Then %>
        with Moneyback Guarantee
        <% End If %>
		</h1>
    <div style="margin-top:-12px;">
    <!-- Content Start From Here-->
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
							  
						//Address feilds
						
						if (validate_required(street,"Please Enter Your Street")==false)
							  {street.focus();return false}
							  
						if (validate_required(city,"Please Enter Your City/Town")==false)
							  {city.focus();return false}
							  
						if (validate_required(state1,"Please Enter Your state/county")==false)
							  {state1.focus();return false}
							  
				
						if (validate_required(postalCode,"Please enter postal Code ")==false)
							  {postalCode.focus();return false}


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
      <form action="/enrollsuccess_Corporate.asp" method="post" onsubmit="return validate_form(this)">
        <tr>
          <td><div style="margin-left:-0;"><span class="Required">
              <% = Session("message") %>
              </span>
              <table border="0" cellpadding="5" cellspacing="0" width="100%">
                <tr>
                  <td ><span class="general-bodyBold">First Name:</span><span class="Required">*</span></td>
                  <td><input type="text" name="firstname" id="firstname" value="<% = Session("FirstName1") %>"></td>
               
                  <td><span class="general-bodyBold">Last Name:</span><span class="Required">*</span></td>
                  <td><input type="text" name="lastname" id="lastname" value="<% = Session("LastName1") %>" ></td>
                </tr>
                <tr>
                  <td colspan="4" ><span class="Note">*This name will appear on all the certificates</span></td>
                </tr>
                <tr>
				<td ><span class="general-bodyBold">Name of Employer/Business:</span></td>
                <td><input type="text" name="employer" id="employer" value="<% = Session("employer") %>" ></td>
                 <td><span class="general-bodyBold">EMail:</span><span class="Required">*</span></td>
                 <td><input type="text" name="email" id="email"  value="<% = Session("Email1") %>" ></td>
                                </tr>
                <tr>
                      <td><span class="general-bodyBold">Phone Number:</span><span class="Required">*</span></td>
                      <td><input type="text" name="phoneno" id="phoneno" value="<% = Session("PhoneNumber1") %>" ></td>
                     
                      </tr>
                      <tr>
                      <td colspan="4" ><span class="Note">*(Format: CountryCode-Area-Number)e.g.
                    <% If Session("CountryOrigin") = "India" Then %>
                    080-35465456/9886012345
                    <% Else %>
                    1-954-762-7536
                    <% End If %>
                    </span></td>
                    </tr>
					 <tr>
					
                 
                </tr>
				
                    <tr>
                      <td><span class="general-bodyBold">Street:</span><span class="Required">*</span></td>
                      <td><input type="text" name="street" id="street" value="<% = Session("street1") %>" ></td>
                      </tr>
                       <tr>
                      <td><span class="general-bodyBold">City/Town:</span><span class="Required">*</span></td>
                      <td><input type="text" name="city" id="city"  value="<% = Session("city") %>"  ></td>
                      <td><span class="general-bodyBold"> <% If Session("CountryOrigin")="United Kingdom"  Then%>County<%Else%>State<%End If%>:</span><span class="Required">*</span></td>
                      <td><input type="text" name="state1" id="state1"  value="<% = Session("state1") %>" ></td>
                      </tr>
                       <tr>
                      <td><span class="general-bodyBold">PostalCode:</span><span class="Required">*</span></td>                  
                      <td><input type="text" name="postalCode" id="postalCode" value="<% = Session("postalCode") %>"></td>
                      </tr>
					   <tr>
				<td colspan="4" ><span class="Note">*The above address and contact number provided would be used to register your exam and certificates would be dispatched to the address provided.</span></td></tr>
                <tr>
                  <td><span class="general-bodyBold">Special requirement:</span></td>
                  <td colspan="3"><!--<textarea type="text" name="speReq" id="speReq" size="40" height="500" value="<%' = Session("speReq") %>"></textarea>-->
                    <textarea id="speReq" style="color: rgb(161, 161, 161);width:190px;height:55px;"  class="TeXtField" name="speReq"  onfocus='myObj = document.getElementById("speReq");if(this.value=="Please enter any needs relating to disability, dietary requirements etc.") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("speReq");if(myObj.value == "") myObj.value="Please enter any needs relating to disability, dietary requirements etc.";myObj.style.color = "#a1a1a1";if(myObj.value!="Please enter any needs relating to disability, dietary requirements etc.") myObj.style.color="#000000";' size="30" type="text" />Please enter any needs relating to disability, dietary requirements etc.</textarea>
                    <a href="/specialReq.asp" style="vertical-align:top;" target="_blank">Know More</a></td>
                </tr>
                <tr>
                  <td><span class="general-bodyBold">Course Enrolling in:</span><span class="Required">*</span></td>
                  <td colspan="3"><select name="courseId" id="class" style="width:480px;"  class="TeXtFielddropdown">
                      <% If IsArray(arrAllCourses) Then
						   For rowCounter = firstRow to lastRow
						   

						   
						   If(CDate(arrAllCourses(2,rowCounter))-(Date())>=0) Then

   						   'Adding a If condition for dont display the Corporate classes in the enroll class page'
						   If (IsNull(arrAllCourses(27,rowCounter)) OR arrAllCourses(27,rowCounter) <> "Corporate") Then

						   If (arrAllCourses(25,rowCounter) <> "Full" ) Then
						%>
                      <% If Session("SelectedCourseID") <> "" Then %>
                      <option value="<% = arrAllCourses(0,rowCounter) %>" <% If CInt(Session("SelectedCourseID")) = CInt(arrAllCourses(0,rowCounter)) Then %> selected="selected" <% End If %>></option>
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
                  <td colspan="4"><span class="Note">*All prices on this page are inclusive of taxes</span></td>
                </tr>
                <tr>
                  <td><span class="general-bodyBold">Terms and Conditions:</span> </td>
                  <td colspan="3"><div align="right" style="margin-right:95px;"><a href="/termsAndConditions.asp" target="_blank">Printable Version</a></div>
                    <iframe src="termsAndConditions.asp" frameborder="0" style="border:1px solid #999999;" width="80%"></iframe>
                    <br />
                    <p>By clicking on 'I accept' below you are agreeing to the Terms and Conditions.</p></td>
                </tr>
                <tr>
                <input type="hidden" name="CourseType" value="<% = rqCourseType %>" />
                  <input type="hidden" name="step1" value="I accept. <% = rqCourseType %> Training Enrollment">
                  <input type="hidden" name="usInstEmailId" value="<% = rqUsInstEmailId %>" />
                  <td colspan="4"><br />
                    <div align="center">
                      <input type="submit" value="I accept. <% = rqCourseType %> Training Enrollment" class="ButtonGeneral" style="width:250px;" />
                    </div></td>
                </tr>
              </table>
            </div>
          </td>
         </tr>
      </form>
      <tr>
        <td>&nbsp;</td>
      </tr>
<% If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Australia") Then %>
      <!-- Google Code for Enroll Form Page Conversion Page -->
      <!-- Google Code for ITILStudy EnrollClass Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "2";
var google_conversion_color = "ffffff";
var google_conversion_label = "30YuCLPPiAIQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?label=30YuCLPPiAIQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>

 <% ElseIf (Session("CountryOrigin") = "India") Then %>
  
  <!-- Google Code for ITILStudy India - Enroll Class Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1017900619;
var google_conversion_language = "en";
var google_conversion_format = "1";
var google_conversion_color = "ffffff";
var google_conversion_label = "HkRhCJWvqAIQy9yv5QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1017900619/?label=HkRhCJWvqAIQy9yv5QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
<% End If %>
			
    </table>
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
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
