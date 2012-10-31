<%@ Language= "VBScript" %>
<% Option Explicit %>
<%
'---------------------------------------------------------------'
'Written By : Bharath'
'Last UpDated : 01/11/2007'
'Description :'
'This Page is Enrolling users page'
'--------------------------------------------------------------'
%>
<!--#include file="connection.asp"-->
<%
 'Declare Local Variables'

 Dim Step1,Step2,todaysDate
 Dim strQuery,strQuery1,strQuery2,strQuery3,strQuery5
 Dim Rs1,Rs2,Rs3,Rs4,Rs5
 Dim Date2,DateInterval,Total
 Dim rqFirstName,rqLastName,rqEmail,rqOccupation,rqPhoneNumber,strBook
 Dim rqNameOfEmployeer,rqAmount,rqDateOfEnrollment,rqPayBefore,rqCourseDetails
 Dim rqPriceWithTax,rqPriceWithOutTax,rqBookPrice,rqBook
 Dim str,str1,str2,str3,i,Course,Course1,course2,startDate,endDate,splitStartDate,splitEndDate
 Dim dprice,dbprice,dtax,Tax
 Dim objCDOMail
 Dim strBody,Subject,rqCourseId
 Dim Date11,TodayDate
 Dim str4,str5,sstartDate,eendDate,sstartYear,eendYear
 Dim arrAllCourses,firstRow,lastRow,numRows,rowCounter
 Dim startingDate,endingDate
 Dim courseId,Price,coursePrice,str6
 Dim ApplicableDays
 Dim country

 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs2 = Server.CreateObject("ADODB.Recordset")
 Set Rs3 = Server.CreateObject("ADODB.Recordset")
 Set Rs4 = Server.CreateObject("ADODB.Recordset")
 Set Rs5 = Server.CreateObject("ADODB.Recordset")

'Dispaly The Today Date'

  todaysDate=now()

'Increment 5 Days and Display That'

  Date2 = DateAdd("d", +5,CDate(todaysDate))

  Step1 = Request.Form("step1")
  Step2 = Request.Form("step2")

 'Retrive The Enrolluser Details Through Form'

 rqCourseId         =   Request.Form("courseid")
 rqFirstName 		= 	Request.Form("firstname")
 rqLastName 		= 	Request.Form("lastname")
 rqEmail 			= 	Request.Form("email")
 rqNameOfEmployeer  =   Replace(Request.Form("employer"),"'","''")
 rqPhoneNumber 		=   Request.Form("phoneno")
 rqCourseDetails 	=   Request.Form("courseindia")
 rqBook 			=   Request.Form("book")
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
 Session("Book")             =  rqBook


 strQuery = "SELECT * FROM ps_course WHERE country = 'India' order by city,startdate desc"

 Rs.Open strQuery,Conn

   If Not Rs.EOF Then
    arrAllCourses = Rs.getrows
    Session("arrAllCourses") = arrAllCourses
    numRows = Ubound(arrAllCourses,2)
    firstRow = 0
    lastRow = numRows
  End If

If Step2 <> "" Then

'Split The Course and Format the Date'

Dim CourseDate,CourseDetails,rqCourseDetailsAndId

rqCourseDetailsAndId = Request.Form("courseindia")

courseDetails = Split(rqCourseDetailsAndId,"&")

For i = 0 to Ubound(courseDetails)
   CourseDate = courseDetails(0)
   CourseId = courseDetails(1)
Next

session("CourseDate") = CourseDate
'Split The Course and Format the Date'

'CourseDate = Request.Form("courseindia")
str1 = split(CourseDate,"for")

for i = 0 to Ubound(str1)
   Course = str1(0)
   Price = str1(1)
next

str2 = split(Course,":")

for i = 0 to Ubound(str2)
   Course1 = str2(1)
next


str3 = split(Course1,"to")

for i = 0 to Ubound(str3)
   startDate = str3(0)
   endDate = str3(1)
next

str4 = split(startDate,",")

for i = 0 to Ubound(str4)
   sstartDate = str4(1)
   sstartYear = str4(2)
next

str5 = split(endDate,",")

for i = 0 to Ubound(str5)
   eendDate = str5(1)
   eendYear = str5(2)
next

str6 = split(Price,".")

for i = 0 to Ubound(str6)
    coursePrice = str6(1)
next

startingDate = (sstartDate & sstartYear)
splitStartDate = FormatDateTime(startingDate,0)

endingDate = (eendDate & eendYear)
splitEndDate = FormatDateTime(endingDate,0)

Course2 = (splitStartDate &" to "& splitEndDate)

'SQL Query For Retrieve The Prices Displaying in The Step Two'

 strQuery2 = "SELECT * FROM ps_course Where startdate = '" & splitStartDate & "' and enddate = '" & splitEndDate & "' and country = 'India' order by startdate"

 Rs2.Open strQuery2,Conn

do until Rs2.EOF

  dbprice = "1800"
  dtax = Rs2("tax")

Rs2.movenext
Loop

'If You Select Yes/No in Step2 Dropdown BookPrice'
'If You Select No In Step2 Only Course Fee Will Dispaly In Step3'
'Else You Select Yes Adding The Book Price to Course Price'

If Session("Book") = "No" Then
 Total = FormatNumber(coursePrice)
Else
 Total  = FormatNumber(Int(coursePrice) + Int(dbprice))
end if

'If You Fill The Registration Form In Step2 That User Details Insert Here'

'SQL Query For Inserting The Values Into DataBase'

 strQuery1 = "INSERT INTO ps_enrolledusers (firstname,lastname,email,nameofemployeer,phoneno,coursedetails,coursedate,amount,dateofenrollment,paybefore,status,pmbok,courseid,statusnumber,pmbokprice,discountpercentage,country)"
 strQuery1 = strQuery1 & " Values "
 strQuery1 = strQuery1 & "('" & rqFirstName & "',"
 strQuery1 = strQuery1 & "'" & rqLastName & "',"
 strQuery1 = strQuery1 & "'" & rqEmail & "',"
 strQuery1 = strQuery1 & "'" & rqNameOfEmployeer & "',"
 strQuery1 = strQuery1 & "'" & rqPhoneNumber & "',"
 strQuery1 = strQuery1 & "'" & CourseDate & "',"
 strQuery1 = strQuery1 & "'" & Course2 & "',"
 strQuery1 = strQuery1 & "'" & Total & "',"
 strQuery1 = strQuery1 & "'" & now() & "',"
 strQuery1 = strQuery1 & "'" & Date2 & "',"
 strQuery1 = strQuery1 & "'Active',"
 strQuery1 = strQuery1 & "'" & rqBook & "',"
 strQuery1 = strQuery1 & "'" & CourseId & "',"
 strQuery1 = strQuery1 & "'1',"
 strQuery1 = strQuery1 & "'" & dbprice & "',"
 strQuery1 = strQuery1 & "'0',"
 strQuery1 = strQuery1 & "'India')"

 Rs1.Open strQuery1,Conn

 strQuery3 = "SELECT max(id) as EnrollId FROM ps_enrolledusers"

 Rs3.Open strQuery3,Conn

 do until Rs3.Eof
   Session("EnrollId") = Rs3("EnrollId")
 Rs3.Movenext
 Loop

 'Send A Email'

  strBody = "<h2></h2>"
  strBody = strBody & "<table border=""0"" align=""center"">"
  strBody = strBody & "<tr><td align=""center"" colspan=""2""><br><br><font face=""Arial"" size=""3"" color=""#0359b4""><b>COURSE ENROLLMENT DETAILS (PROFORMA INVOICE)</b></font></td></tr>"
  strBody = strBody & "<tr><td align=""right"" colspan=""2""><font face=""Arial"" size=""2""><b>" & FormatDateTime(todaysDate,1) & "</b></font></td></tr>"
  strBody = strBody & "<tr><td align=""left"" ><font face=""Arial"" size=""2""> Enroll ID : " & Session("EnrollId") & "</font></td></tr>"
  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2""> Name : " & rqFirstName & "&nbsp; " & rqLastName & "</font></td></tr>"
  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Email :" & rqEmail & " </font></td></tr>"
  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Phone Number :" & rqPhoneNumber & "</font></td></tr>"
  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name Of Employeer/Business : " & rqNameOfEmployeer & "</font></td></tr>"
  strBody = strBody & "<tr><td align=""left""><br><font face=""Arial"" size=""2"">Thank you for enrolling in PMstudy.com/India classroom training.</font></td></tr>"
  strBody = strBody & "<tr><td align=""left"" colspan=""2""><br><font face=""Arial"" size=""2"">Details of your course and Payment:</font><br><table border=""1"" cellspacing=""0"" align=""center"" width=""100%"">"
  strBody = strBody & "<tr><td width=""70%"" align=""center""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Details</font></b></td><td width=""10%"" align=""center""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Payment</font></b></td></tr>"
  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>PMP Classroom Training(4 days, 40 Contact Hours)" & CourseDate & "</b> <br>(This includes " & dtax & "% service tax)</td><td align=""center""><font face=""Arial"" size=""2""><b>Rs." & FormatNumber(coursePrice) & "</b></td></tr>"
  If Session("Book") = "Yes" Then
  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>PMBOK Physical Copy</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>Rs." & FormatNumber(dbprice) & "</b></font></td></tr>"
  End If
  strBody = strBody & "<tr><td colspan=""2"">&nbsp;</td></tr>"
  strBody = strBody & "<tr><td align=""right""><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>Rs." & Total & "</b></font></td></tr></table><br></td></tr>"
  strBody = strBody & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><b>Please Note:</b></font><br>"
  strBody = strBody & "<font face=""Arial"" size=""2"">Full payment of the enrollment fee <b>(Rs." & Total & "</b>) "
  strBody = strBody & "should be done through </font></td></tr><tr><td><br><font face=""Arial"" size=""2"">1. <b>Check</b> or <b>Demand Draft</b> favoring <b>""Edusys Services Pvt Limited"".</b></font></td></tr><tr><td><font face=""Arial"" size=""2"">This should be couriered to the following address:</font></td></tr><br><br>"
  strBody = strBody & "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=""Arial"" size=""2""><b>Edusys Services Pvt Limited,</b></font></td></tr>"
  strBody = strBody & "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=""Arial"" size=""2""># 224, 16th Cross, 23rd Main,</font></td></tr>"
  strBody = strBody & "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=""Arial"" size=""2"">J P Nagar 5th Phase, </font></td></tr>"
  strBody = strBody & "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=""Arial"" size=""2"">(Near Sai Puspanjali Marriage Hall),</font></td></tr>"
  strBody = strBody & "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=""Arial"" size=""2"">Bangalore, India - 560078</font><br></td></tr>"
  strBody = strBody & "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=""Arial"" size=""2"">Ph:+91-80-41721315 / +91-80-41721347</font></td></tr>"
  strBody = strBody & "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=""Arial"" size=""2"">Cell:+91-97406 00727</font><br><br></td></tr>"
  strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">2. <b>Bank Transfer :</b></font></td></tr>"
  strBody = strBody & "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=""Arial"" size=""2""><b>Payee Name : EDUSYS SERVICES PVT. LTD.</td></tr>"
  strBody = strBody & "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=""Arial"" size=""2""><b>Bank Name : ICICI Bank Limited</td></tr>"
  strBody = strBody & "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=""Arial"" size=""2""><b>Account Number : ICICI Bank A/c No : 0401 0500 0128</td></tr>"
  strBody = strBody & "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=""Arial"" size=""2""><b>Branch Name : ICICI Bank, J.P. Nagar Branch, Bangalore</td></tr>"      
  strBody = strBody & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><br><b>We have reserved a seat for you in this course. However, the payment should be received by us within 5 days from today i.e. before" & FormatDateTime(Date2,1) & "</b> - otherwise, your registration for this program will be cancelled. </font></td></tr>"
  strBody = strBody & "<tr><td align=""center"" colspan=""3""><br><font face=""Arial"" color = ""green"" size=""3""><b>We look forward to having you as a student with PMstudy.com/India!!!</b></font></td></tr></table>"

 Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
 objCDOMail.From = "marketing@pmstudy.com"
 objCDOMail.To =  "<" & rqEmail & ">"
 objCDOMail.cc = "edusysindia@gmail.com"
 objCDOMail.Bcc = "t_satpathy@yahoo.com"
 objCDOMail.Importance = 2
 objCDOMail.Subject = "Enrollment in PMstudy.com/India Classroom Coaching for PMP Certification Exam"
 objCDOMail.BodyFormat = 0
 objCDOMail.MailFormat = 0
 objCDOMail.Body =  strBody
 objCDOMail.Send
 Set objCDOMail = Nothing

End If
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/pmstudy.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>.: PM Study :.</title>
<!-- InstanceEndEditable -->
<link href="css/pmstyle.css" rel="stylesheet" type="text/css" />
<!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
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

	if (validate_required(employer,"Please Enter Your Name of Employeer/Business")==false)
		  {employer.focus();return false}

    // Check The Phone number Field Empty Or Not

	if (validate_required(phoneno,"Please enter phone number")==false)
		  {phoneno.focus();return false}

    // Check The Phone Number Have Special Characters

    if (validate_specialcharacters(phoneno,"Your phone number Has Special Characters. \n Please remove them and try again")==false)
	 		      {phoneno.focus();return false}

    // Check The Phone Number Field Have numerals

	if (validate_number(phoneno,"Your phone number is not a numeral")==false)
	      {phoneno.focus();return false}

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

</head>

<body>
<table width="1001px" border="0" align="center" cellpadding="0" cellspacing="0" class="tborder">
  <tr>
  <td>
<table width="1001px" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="200" align="left" valign="top" background="images/header_img.jpg">
	<table width="1001px" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <td width="120px"></td>
    <td>

		  <div id="underlinemenu">
  <ul>
  <li><a href="http://www.pmstudy.com/abc.asp" title="Home" target="_blank">Home</a></li>
  <li><a href="index.html" title="India Home">India Home</a></li>
  <li><a href="why_pmstudy.html" title="Why PMstudy">Why PMstudy</a></li>
  <li><a href="course_content.html" title="Course Content">Course Content</a></li>
  <li><a href="dates_location.asp" title="Classes - Dates and Location">Classes - Dates and Location</a></li>
  <li><a href="partnership.html" title="Corporate Partnership">Corporate Partnership</a></li>
  <li><a href="enrollindia.asp" title="Enroll Now">Enroll Now</a></li>
  </ul>
      </div>

	  </td>
</tr>
</table>
	  </td>
  </tr>
</table>

<!-- InstanceBeginEditable name="pmstudy_content" -->
<table width="94%" border="0" align="center" cellpadding="0" cellspacing="0" class="home_panel_4" >
  <tr>
    <td><img src="images/space.gif" width="1" height="13" /></td>
  </tr>
  <% If Step1 = "" AND Step2 = "" Then %>
  <tr>
    <td class="header">Enrollment in PMstudy.com/India is a three step process</td>
  </tr>
  <tr>
    <td class="header">&nbsp;</td>
  </tr>
  <tr>
    <td class="btext"><ul type="square">
      <li>Step 1: Provide Enrollment Information (3 minutes) </li>
      <li>Step 2: Make Payment For Course Within 5 Days Of Step 1 </li>
      <li>Step 3: PMstudy.com/India Confirms Your Participation In The Course After Receipt Of Payment  </li>
          </ul></td>
  </tr>

  <tr>
    <td class="btext">
		<table>
			<tr>
				<td><a href="dates_location.asp"><img src="images/dates_location.gif" width="194" height="36" border="0" /></a></td>
				<form action="enrollindia.asp" method="post">
  			    <td align="center"><input type="hidden" name="step1" value="Go to PMstudy.com/India Enrollment Step1 (Providing Enrollment Information)">
	       						   <input type="image" src="images/India_step1.png" value="Go to PMstudy.com/India Enrollment Step1 (Providing Enrollment Information)"/></td>
				</form>
  		   </tr>
		  </table>
	</td>
  </tr>		
   
  </tr>
  <tr>
    <td class="btext">&nbsp;</td>
  </tr>
  <tr>
    <td class="btext"><strong class="header">Terms and Conditions (Please read before starting enrollment process):</strong> </td>
  </tr>
  <tr>
    <td class="btext">&nbsp;</td>
  </tr>
  <tr>
    <td class="btext">
	<ol type="1">
	<li><strong>Payment towards enrollment :</strong>Full payment of the enrollment fee is due at the time of registration.Payment can be done through<br /><br />
	 <ul type="square"><li> <strong>Check</strong> or <strong>Demand Draft</strong> favoring <strong>"Edusys Services Pvt Limited."</strong><br />This should be couriered to the following address:<br /><br />
		
          <strong>&nbsp;&nbsp;&nbsp;&nbsp;Edusys Services Pvt Limited</strong>,<br>
         &nbsp;&nbsp;&nbsp;&nbsp;# 224, 16th Cross, 23rd Main,<br>
         &nbsp;&nbsp;&nbsp;&nbsp;J P Nagar 5th Phase,<br>
         &nbsp;&nbsp;&nbsp;&nbsp;(Near Sai Puspanjali Marriage Hall),<br>
         &nbsp;&nbsp;&nbsp;&nbsp;Bangalore, India - 560078<br><br>

         &nbsp;&nbsp;&nbsp;&nbsp;Ph:+91-80-41721315 / +91-80-41721347<br>
         &nbsp;&nbsp;&nbsp;&nbsp;Cell:+91-97406 00727</li>
	  <li><strong>Bank Transfer :</strong><br /><br />
	    <strong>&nbsp;&nbsp;&nbsp;&nbsp;Payee Name : EDUSYS SERVICES PVT. LTD.<br />
		&nbsp;&nbsp;&nbsp;&nbsp;Bank Name : ICICI Bank Limited<br />
		&nbsp;&nbsp;&nbsp;&nbsp;Account Number : ICICI Bank A/c No : 0401 0500 0128<br />
		&nbsp;&nbsp;&nbsp;&nbsp;Branch Name : ICICI Bank, J.P. Nagar Branch, Bangalore</strong></li>
	    </ul>
<li><strong>Alternate Payment Mechanism :</strong> If you have problems in making payments through Check or Demand Draft, please email us at <a href="javascript:openit();">edusysindia@gmail.com</a> , we will suggest alternate payment options to you.</li>

<li><strong>Buying physical copy of PMBOK for the course :</strong> You should purchase a physical copy of PMBOK Third Edition, and bring it along with you to the course(this book can be bought from PMI or a bookstore like Amazon.com). If you are not able to buy a physical copy of PMBOK Third Edition, then you should purchase it from PMstudy.com/India by paying additional Rs. 1,800 during initial enrollment. In that case, PMBOK will be purchased by PMstudy.com/India and will be provided to you by our instructor during the class. Please note that all other study material (including guides) will be provided by PMstudy.com/India during the course.</li>

<li><strong>Bulk/Corporate Discounts :</strong> Additional 5% Bulk/Corporate Discounts are available if more than 5 people join PMstudy.com/India course at one time. For details, please email us at <a href="javascript:openit();">edusysindia@gmail.com</a></li>


<li><strong>Cancellation Policy of course by PMstudy.com/India :</strong> We may cancel any particular class because of insufficient enrollment, instructor illness or force-majeure events(like floods, earthquakes, political instability, etc.). We will make all reasonable efforts to reschedule a cancelled class and you may transfer the amount paid by you to a future class. However, you have the option to ask us for a full refund of your payment in case of course cancellation done by PMstudy.com/India.
<ul type="square"><br>
<li>Cancellation 12 days before the course commencement date : Cancellation fee of Rs. 2,500 will be charged.</li>

<li>Cancellation 5 days - 12 days before the course commencement date : Cancellation fee of Rs. 7,500 will be charged.</li>

<li>Cancellation within 5 days of the course commencement date : No money is refundable.</li>
</ul>
Please note that we charge a cancellation fee to compensate us for fixed expenses including hotel bookings, instructor fees, etc. All refunds will be processed and payments made to students within 14 days of receipt for a course cancellation request</li>

<li><strong>Course Rescheduling :</strong> A student may opt to reschedule a course after initial enrollment. Then, a rescheduling fee is charged (provided there is availability in the future course)as mentioned below:
<ul type="square"><br>
<li>Rescheduling 12 days before the cour	se commencement date : Additional rescheduling fee of Rs. 1,500 will be charged.</li>

<li>Rescheduling 5 days - 12 days before the course commencement date : Additional rescheduling fee of Rs. 5,000 will be charged.</li>

<li>Rescheduling within 5 days of the course commencement date : Additional rescheduling fee of Rs. 7,500 will be charged.</li>
</ul>
Please note that the additional rescheduling charges should be paid to Edusys Services within 7 days of receipt for a course rescheduling request. </li>

<li><strong>Test Pass Guarantee :</strong> PMstudy.com/India has 98% test pass rate for students who take the PMP exam within 1 month of the classroom coaching (provided they score more than 75% in the four full length simulated practice tests in PMstudy.com). If you take the classroom course, and fail in the PMP Certification Exam in your first attempt, PMstudy.com will provide you additional two months free access to PMstudy.com online course(value $ 199.99) . Please note that there are no other warranties, expressed or implied, that you will pass the PMP Exam.</li>

<li><strong>Proprietory use of PMstudy.com study material :</strong> We will provide you study guides and other material, which are proprietary property of PMstudy.com. Therefore, no part of any course materials may be reproduced, stored in a retrieval system, or transmitted in any form or by any means, electronic, mechanical, photocopying, recording or otherwise, or translated into any language, without our prior written consent. Any such activity constitutes a violation of copyright laws and the PMI code of ethics and will be reported to PMI.</li>

<li><strong>Non-Solicitation Policy :</strong> If you enroll in a PMstudy.com course and pass the PMP/CAPM Exam, your name will be added to the success list of PMP/CAPM students using PMstudy.com. However, PMstudy.com will not distribute your personal information to any third party marketing database or disclose the personal details to anyone EXCEPT on a case to case basis after proper verification of the person requesting for the information or incase of legal requirements. Your personal information could be used by us to inform you regarding other courses being provided by PMstudy.com.</li>
</ol>	</td>
  </tr>
 <form action="enrollindia.asp" method="post">
  <tr>
    <td align="center"><br />
           <input type="hidden" name="step1" value="Go to PMstudy.com/India Enrollment Step1 (Providing Enrollment Information)">
	       <input type="image" src="images/India_step1.png" value="Go to PMstudy.com/India Enrollment Step1 (Providing Enrollment Information)"/></td>
  </tr>
  </form>
  <tr>
    <td class="btext">&nbsp;</td>
  </tr>
 <% Elseif (Step1 = "Go to PMstudy.com/India Enrollment Step1 (Providing Enrollment Information)" ) Then %>
    <form action="./enrollindia.asp" method="post" onsubmit="return validate_form(this)">
  <tr>
   <td>
    <table border="0" cellpadding="4" cellpadding="5">
     <tr>
      <td><img src="images/space.gif" width="1" height="13" /></td>
     </tr>
     <tr valign="bottom">
      <td align="left" bgcolor="#fafafa" valign="middle" class="btext">First Name :<font size="2" color="#ff0000">*</font></td>
      <td align="left" bgcolor="#fafafa" valign="middle"><input type="text" name="firstname" id="firstname"></td>
     </tr>
     <tr valign="top">
      <td align="left" bgcolor="#fafafa" valign="middle" class="btext">Last Name :<font size= "2" color="#ff0000">*</font></td>
      <td align="left" bgcolor="#fafafa" valign="middle"><input type="text" name="lastname" id="lastname"></td>
	 </tr>
	 <tr>
	 <td colspan="2" class="btext"><font color="#ff0000" size="2">*This name will appear in Contact Hour/PDUs Certificates</font></td>
	 </tr>
     <tr valign="top">
      <td align="left" bgcolor="#fafafa" valign="middle" class="btext">EMail :<font color="#ff0000" size="2">*</font></td>
      <td align="left" bgcolor="#fafafa" valign="middle"><input type="text" name="email" id="email" size="40"></td>
     </tr>
     <tr valign="top">
      <td align="left" bgcolor="#fafafa" valign="middle" class="btext">Name of Employer/Business :<font color="#ff0000" size="2">*</font></td>
      <td align="left" bgcolor="#fafafa" valign="middle"><input type="text" name="employer" id="employer" size="40">
     </tr>
     <tr valign="top">
      <td align="left" bgcolor="#fafafa" valign="middle" class="btext">Phone Number :<font color="#ff0000" size="2">*</font></td>
      <td align="left" bgcolor="#fafafa" valign="middle"><input type="text" maxlength="50" name="phoneno" id="phoneno" size="40"></td>
     </tr>
	 <tr>
	  <td colspan="2" class="btext"><font color="#ff0000" size="2">*(Format: CountryCode-Area-Number)e.g.080-35465456/9886012345</font></td>
	 </tr>
     <tr valign="top">
      <td align="left" bgcolor="#fafafa" valign="middle" class="btext">Course Enrolling in :<font color="#ff0000" size="2">*</font></td>
      <td align="left" bgcolor="#fafafa" valign="middle">
     <select name="courseindia" id="courseindia" style="width:580px">
    <% If IsArray(arrAllCourses) Then
	   For rowCounter = firstRow to lastRow
       if(CDate(arrAllCourses(2,rowCounter))-(Date()-1)>=0) then
	%>
       <option value="<% = arrAllCourses(1,rowCounter) %> : <% = FormatDateTime(arrAllCourses(2,rowCounter),1) %> to <% = FormatDateTime(arrAllCourses(3,rowCounter),1) %> for Rs.<% If (CDate(arrAllCourses(2,rowCounter))-(Date()+arrAllCourses(15,rowCounter)+1) >= 0) Then %><% = FormatNumber(arrAllCourses(18,rowCounter)) %><% Else %><% = FormatNumber(arrAllCourses(12,rowCounter)) %><% End If %>&<% = arrAllCourses(0,rowCounter) %>"><% = arrAllCourses(1,rowCounter) %> : <% = FormatDateTime(arrAllCourses(2,rowCounter),1) %> to <% = FormatDateTime(arrAllCourses(3,rowCounter),1) %> for Rs.<% If (CDate(arrAllCourses(2,rowCounter))-(Date()+arrAllCourses(15,rowCounter)+1) >= 0) Then %><% = FormatNumber(arrAllCourses(18,rowCounter)) %><% Else %><% = FormatNumber(arrAllCourses(12,rowCounter)) %><% End If %></option>
     <%
	   End If
	   Next
	   End If %>
     </select>
      </td>
     </tr>
     <tr>
      <td align="left" bgcolor="#fafafa" valign="middle" class="btext">Include PMBOK Third Edition :<br>(Rs. 1,800)<font color="#ff0000" size="2">*</font><br></td>
      <td align="left" bgcolor="#fafafa" valign="middle">
          <select name="book">
             <option>No</option>
             <option>Yes</option>
          </select>
      </td>
     </tr>
     <tr>
      <input type="hidden" name="step2" value="Go to PMstudy.com/India Enrollment Step2 (Information about payment to be made)">
      <td colspan="2" align="center"><br><!--<input type="submit" name="step2" value="Go to PMstudy.com/India Enrollment Step2 (Information about payment to be made)">-->
       <input type="image" src="images/India_step2.gif">
      </td>
     </tr>
 </table>
   </form>
  </td>
 </tr>
 <tr>
  <td>&nbsp;</td>
 </tr>
   <% Elseif(Step2 ="Go to PMstudy.com/India Enrollment Step2 (Information about payment to be made)") Then %>
    <tr>
     <td align="center" colspan="2" class="btext"><br><br><font face="Arial" size="3" color="#0359b4"><strong>COURSE ENROLLMENT DETAILS (PROFORMA INVOICE)</strong></font></td>
    </tr>
    <tr>
     <td align="right" colspan="2" class="btext"><strong><% = FormatDateTime(todaysDate,1) %></strong></td>
    </tr>
    <tr>
     <td class="btext">Enroll ID : <% = Session("EnrollId") %></td>
    </tr>
    <tr>
     <td class="btext">Name : <% = Session("FirstName") %>&nbsp; <% =  Session("LastName") %></td>
    </tr>
   <tr>
     <td class="btext">Email : <% = Session("Email") %></td>
    </tr>
    <tr>
     <td class="btext">Phone Number : <% = Session("PhoneNumber") %></td>
    </tr>
    <tr>
     <td class="btext">Name Of Employer/Business : <% = Session("NameOfEmployeer") %></td>
    </tr>
    <tr>
     <td class="btext"><br>Thank you for enrolling in PMstudy.com/India classroom training.</td>
    </tr>
    <tr>
     <td colspan="2" class="btext"><br>Details of your course and Payment:<br>
      <table border="1" align="left" width="727" cellspacing="0" bordercolor="#d1d1d1">
       <tr class="header"  style="font-weight:600;">
        <td align="center"><b><font face="Verdana" size="3">Details</font></b></td>
        <td align="center"><b><font face="Verdana" size="3">Payment</font></b></td>
       </tr>
       <tr>
        <td class="btext"><strong>PMP Classroom Training(4 days, 40 Contact Hours) <% = Session("CourseDate") %></strong><br>(This includes <% =  dtax %>% service tax)</td>
        <td align="center" class="btext"><strong>Rs. <% = FormatNumber(coursePrice) %></strong></td>
       </tr>
       <% If Session("Book") = "Yes" Then %>
       <tr>
         <td class="btext"><strong>PMBOK Physical Copy</strong></td>
         <td align="center" class="btext"><strong>Rs. <% = FormatNumber(dbprice) %></strong></td>
       </tr>
       <% End If %>
       <tr>
        <td colspan="2">&nbsp;</td>
       </tr>
       <tr>
        <td align="right" class="btext"><strong>Total</strong></td>
        <td align="center" class="btext"><strong>Rs.<% = Total %></strong></td>
       </tr>
      </table>
     <br>
    </td>
   </tr>
   <tr>
     <td colspan="2">&nbsp;</td>
   </tr>
   <tr>
     <td colspan="2" class="btext"><strong>Please Note:</strong><br>
     Full payment of the enrollment fee <strong>(Rs. <% =  Total %>)</strong> should be done through <br /><br />
	 1. <strong>Check</strong> or <strong>Demand Draft</strong> favoring "<strong>Edusys Services Pvt Limited</strong>".<br /><br />
	 This should be couriered to the following address:<br><br>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Edusys Services Pvt Limited,</strong><br>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# 224, 16th Cross, 23rd Main,<br>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;J P Nagar 5th Phase, <br>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Near Sai Puspanjali Marriage Hall),<br>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bangalore, India - 560078<br><br>

     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ph:+91-80-41721315 / +91-80-41721347<br>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cell:+91-97406 00727<br><br>
    </td>
   </tr>
   <tr>
    <td class="btext">
	 2. Bank Transfer :<br /><br />
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Payee Name : EDUSYS SERVICES PVT. LTD.</strong><br />
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Bank Name : ICICI Bank Limited</strong><br />
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Account Number : ICICI Bank A/c No : 0401 0500 0128</strong><br />
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Branch Name : ICICI Bank, J.P. Nagar Branch, Bangalore</strong>	</td>
   </tr>
   <tr>
    <td colspan="2" class="btext"><br /><strong>We have reserved a seat for you in this course. However, the payment should be received by us within 5 days from today i.e. before
     <% = FormatDateTime(Date2,1) %></strong> - otherwise, your registration for this program will be cancelled.
    </td>
   </tr>
   <tr>
     <td colspan="2" class="btext"><br>A copy of the invoice has also been emailed to you. Please check your email address
            i.e. <% = Session("Email") %> (Note that the email might have gone to your bulk/junk email folder). For queries
            or clarifications, please email us at edusysindia@gmail.com
    </td>
   </tr>
   <tr>
    <td align="center" colspan="3"><br><font face="Arial" color = "green" size="3"><b>We look forward to having you as a student with PMstudy.com/India!!!</b></font>
    </td>
   </tr>
  <% end if %>
</table>
<!-- InstanceEndEditable -->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#e7f2f7" class="commentfooter">
    <tr>
      <td width="87%" height="22"> &nbsp; &copy; PMstudy.com - All Rights Reserved.</td>
      <td width="13%"><a href="contactus.html">Contact Us</a> | <a href="feedback.asp">Feedback</a></td>
    </tr>
</table>
</td>
</tr>
</table>
</body>
<!-- InstanceEnd --></html>
