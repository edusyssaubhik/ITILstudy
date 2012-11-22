<!--#include virtual="/includes/URLRedirection.asp"-->
<html>
<head>
<TITLE>ITILstudy.com Economical, Effective</TITLE>
<link rel="shortcut icon" href="/images/buttons/favicon.ico">
<META http-equiv=Content-type content="text/html; charset=ISO-8859-1">
<META 
content="PROJstudy.com offers Online Economical, Effective, Guides on Different Knowledge Areas" 
name=description>
<META 
content="PROJstudy.com offers Online Economical, Effective, Guides on Different Knowledge Areas" 
name=keywords>
<script language="javascript">
function focus() {

	loginform.UserID.focus();

}
</script>
<script type="text/javascript">
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
	var iChars = "0123456789-/,.";

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

   var strModeOfPayment = thisform.ModeOfPayment.value;
   
   with (thisform)
	{

	// Check The First Name Field Empty Or Not

	if (validate_required(first_name,"Please enter first name")==false)
		  {first_name.focus();return false}

	// Check The Last Name Field Empty Or Not

	if (validate_required(last_name,"Please enter last name")==false)
		  {last_name.focus();return false}

	// Check The EMail Field Empty Or not

	if (validate_required(payer_email,"Please enter email id")==false)
		  {payer_email.focus();return false}
		  
		  
		  

	// Check The Eamil Validation

	if (echeck(payer_email)==false)
		  {payer_email.focus();return false}
		  
	// Check The Currency Field Empty Or Not

	if (validate_required(Currency,"Please Select Currency")==false)
		  {Currency.focus();return false}	
		  
	// Check The address_country Field Empty Or Not

	if (validate_required(address_country,"Please enter country")==false)
		  {address_country.focus();return false}	
		  
	  

	// Check The ModeOfPayment Field Empty Or not

   if (validate_required(ModeOfPayment,"Please select payment mode")==false)
		  {ModeOfPayment.focus();return false}

	 // Check The payment_gross Field Empty Or not

   
   if (strModeOfPayment != "Test-Environment") 
   {
   
	   if (validate_required(payment_gross,"Please enter payment gross")==false)
			  {payment_gross.focus();return false}
			  
	   if (validate_number(payment_gross,"payment gross is not numeral")==false)
			  {payment_gross.focus();return false}	
	
	   // Check The Payment Date Field Empty Or not
	
	   if (validate_required(Paymentdate,"Please enter payment date")==false)
			  {Paymentdate.focus();return false}
			  
	  // Check The Tarnsaction Deatils Field Empty Or not
	
	  if (validate_required(TraDetails,"Please enter transaction details")==false)
		  {TraDetails.focus();return false}
		  
	}
	  
}


} 


function validate_form1(thisform)
{

   var strModeOfPayment = thisform.ModeOfPayment.value;
   
   with (thisform)
	{

	// Check The First Name Field Empty Or Not

	if (validate_required(first_name,"Please enter first name")==false)
		  {first_name.focus();return false}

	// Check The Last Name Field Empty Or Not

	if (validate_required(last_name,"Please enter last name")==false)
		  {last_name.focus();return false}

	// Check The EMail Field Empty Or not

	if (validate_required(payer_email,"Please enter email id")==false)
		  {payer_email.focus();return false}
		  
		  
	// Check The Eamil Validation

	if (echeck(payer_email)==false)
		  {payer_email.focus();return false}
		  
	// Check The ModeOfPayment Field Empty Or not
	
	// Check The EMail Field Empty Or not

	if (validate_required(date,"Please enter date")==false)
		  {date.focus();return false}	

   if (validate_required(ModeOfPayment,"Please select payment mode")==false)
		  {ModeOfPayment.focus();return false}

	 // Check The payment_gross Field Empty Or not

   
   if (strModeOfPayment != "Test-Environment" && strModeOfPayment != "Free-Extension") 
   {
	   if (validate_required(NewAmount,"Please enter payment gross")==false)
			  {NewAmount.focus();return false}
			  
	   if (validate_number(NewAmount,"payment gross is not numeral")==false)
			  {NewAmount.focus();return false}	
	
	   // Check The Payment Date Field Empty Or not
	
	   if (validate_required(Paymentdate,"Please enter payment date")==false)
			  {Paymentdate.focus();return false}
			  
	  // Check The Tarnsaction Deatils Field Empty Or not
	
	  if (validate_required(TraDetails,"Please enter transaction details")==false)
		  {TraDetails.focus();return false}
		  
	}
	  
}


} 

function validate_form2(thisform)
{

   with (thisform)
	{

	// Check The First Name Field Empty Or Not

	if (validate_required(first_name,"Please enter first name")==false)
		  {first_name.focus();return false}

	// Check The Last Name Field Empty Or Not

	if (validate_required(last_name,"Please enter last name")==false)
		  {last_name.focus();return false}

	// Check The EMail Field Empty Or not

	if (validate_required(payer_email,"Please enter email id")==false)
		  {payer_email.focus();return false}
		  
		  
	// Check The Eamil Validation

	if (echeck(payer_email)==false)
		  {payer_email.focus();return false}
		  
	// Check The address_country Field Empty Or Not

	if (validate_required(address_country,"Please enter country")==false)
		  {address_country.focus();return false}	
		  
		  
}

}

</script>
<script type="text/javascript">
function update(a){
	if(a.value=='Test-Environment' || a.value=='Free-Extension') {
	document.getElementById('payment_gross').style.display="none";
	document.getElementById('Paymentdate').style.display="none";
	document.getElementById('TraDetails').style.display="none";
	document.getElementById('Paymentdate1').style.display="none";
	document.getElementById('TraDetails1').style.display="none";
	document.getElementById('NewAmount').style.display="none";
	}
	else
	{
	document.getElementById('payment_gross').style.display="table-row";
	document.getElementById('Paymentdate').style.display="table-row";
	document.getElementById('TraDetails').style.display="table-row";
	document.getElementById('Paymentdate1').style.display="table-row";
	document.getElementById('TraDetails1').style.display="table-row";
	document.getElementById('NewAmount').style.display="table-row";
	}
	
}
</script>
</head>
<body onLoad="focus()">
<!--#include virtual="/includes/connection.asp"-->

<%'If(Request.Form("UserID")="PROJstudy" And Request.Form("Password")="6Sig*7$") Then%>
<%

 Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "")
End Function

Session.Timeout=1000
If Request.Form("UserID") <> "" Then
UserID=StrQuoteReplace(Request.Form("UserID"))
Else
UserID=Session("UserID")
End If
Password=StrQuoteReplace(Request.Form("Password"))
 
 
 
'If(UserID="") Then
'Session("UserID")=""
'Else

If(UserID<>"" AND Password<>"") Then

Set rsQues = Server.CreateObject("ADODB.Recordset")
rsQues.ActiveConnection = ConnObj
rsQues.Open "SELECT UserID, Password,Accessgranted from Accesstable WHERE UserID='"&UserID&"' and Password='"&Password&"'"

	If Not rsQues.BOF Then
		Session("UserID")=rsQues("UserID")
		Session("Accessgranted")=rsQues("Accessgranted")
	Set rsQues = Nothing
	Else
		Session("UserID")=""
		Session("Accessgranted")=""
%>
	"Invalid UserID or Password"
	<%End If
End If
If(Session("UserID")<>"") Then

%>
<%Dim 	Conn, Array,KNo, QuesNo, payer_MailID, date, pass%>
<B><a href="./adminquerylist.asp" target=_blank>View List of Queries Answered</a><BR><BR></B>
<form name="one" action="./admintempviewuser.asp" method="post" target="_blank">
<B>View person's details by EmailID:(Online)<BR><BR></B>
Payer Email:<input type="text" size="20" name="payer_email"><BR><BR>
<input type="submit" Value="View person details"><input type="reset"  value="Reset" /><BR><BR>
</form></LI>

<form name="one" action="./admintempviewuser-classroom.asp" method="post" target="_blank">
<B>View person's details by EmailID:(Classroom)<BR><BR></B>
Payer Email:<input type="text" size="20" name="payer_email"><BR><BR>
<input type="submit" Value="View person details"><input type="reset"  value="Reset" /><BR><BR>
</form></LI>

<form name="two" action="./admintempviewuser1.asp" method="post" target="_blank">
<B>View person's details by Last Name:<BR><BR></B>
Last Name:<input type="text" size="20" name="last_name"><BR><BR>
<input type="submit" Value="View person details"><input type="reset"  value="Reset" /><BR><BR>
</form></LI>

<form name="two" action="./admintempviewuser2.asp" method="post" target="_blank">
<B>View person's details by Company Name:<BR><BR></B>
Company Name:  <input type="text" size="20" name="company_name"> OR<input type="text" size="20" name="company_name1"> OR <input type="text" size="20" name="company_name2">  <BR><BR>
<input type="submit" Value="View person details"><input type="reset"  value="Reset" /><BR><BR>
</form></LI>

<!--<HR>
<B>Administer Certificates:</B>
<UL>
<LI><a href="./admincerts.asp" target=_blank>View all Certificates with the action desired status </a></LI><BR><BR>
<LI><a href="./viewsentcerts.asp" target=_blank>View all Sent Certificates (do not use frequently since this puts stress on the database)</a></LI><BR><BR>
<LI><a href="./adminconfirmedusers.asp" target=_blank>View all people enrolled in PROJstudy.com course (do not use frequently since this puts stress on the database)</a></LI><BR><BR>-->

</UL><HR>
<B>View and Send Email (Responding to customer feedback):<BR><BR></B>
<form name="one" action="./adminsendemail1.asp" method="post">

First Name:<input type="text" size="30" name="first_name"><BR><BR>
Last Name:<input type="text" size="30" name="last_name"><BR><BR> <input type="hidden" size="30" name="submitvalue" value="Initialize">
Email ID:<input type="text" size="50" name="payer_email"><BR><BR>
Location:<input type="text" size="50" name="location"><br><br>
From Date:<input type="text" size="50" name="fromDate"><br><br>
To Date:<input type="text" size="50" name="toDate"><br><br>
Feedback from Person:
<BR><textarea name="feedback" cols="100" rows="10"></textarea><BR><BR>
File to be attached(not working):<input type="file" name="attachvalue" size="40"><BR><BR>
Mail to be sent: 
<SELECT NAME="MailID"> 

<Option VALUE="1">General query about PROJstudy classroom training</option>
<Option VALUE="2">Benefits of attending the PROJstudy classroom program</option>
<Option VALUE="3">Eligibility Criteria</option>
<Option VALUE="4">PROJstudy Vs. Other providers</option>
<Option VALUE="5">Enrolment details for PROJstudy PRINCE2 classroom courses</option>
<Option VALUE="6">For queries about bulk enrolments in PROJstudy</option>
<Option VALUE="7">Programme fee - what is included or excluded</option>
<option value="8">Alternate payment options available to the delegate after enrolling</option>
<option value="9">Rescheduling Request</option>
<option value="10">Cancellation Policy – If PROJstudy cancels a class</option>
<option value="11">Cancellation Policy - If a delegate cancels his enrolment</option>
<option value="12">Successful student</option>
<option value="13">Exam Retake Guarantee UK - for failed students </option>
<option value="14">Payment made by 3rd Party / Unknown Payment</option>
<option value="15">Payment Declined</option>
<option value="16">A reply being sent when a person sends a suggestion for PROJstudy</option>


</SELECT><BR><BR>
Country: <SELECT NAME="country"> 
<Option VALUE="1">Other</option>
<Option VALUE="2">US</option>
<Option VALUE="3">India</option>
</SELECT><BR><BR>



<input type="Submit" Value="Preview Email"><input type="reset"  value="Reset" />

</form>
<BR><BR>
<HR>
<B>View and Send Email (ITILstudy Exam Result):<BR><BR></B>
<form name="one" action="./adminexamresult.asp" method="post" target="_blank">

First Name:<input type="text" size="30" name="first_name"><BR><BR>
Last Name:<input type="text" size="30" name="last_name"><BR><BR> <input type="hidden" size="30" name="submitvalue" value="Initialize">
Email ID:<input type="text" size="50" name="payer_email"><BR><BR>
County: <SELECT NAME="country"> 
<Option VALUE="1">Other</option>
<Option VALUE="2">US</option>
<Option VALUE="3">India</option>
</SELECT><BR><BR>

<input type="Submit" Value="Preview Email"><input type="reset"  value="Reset" />

</form>
<BR><BR>


<form name="one" action="./customerdetails_admin.asp" method="post" target="_blank"  onSubmit="return validate_form(this)">
<BR><HR><BR><B>Add New Course:<BR><BR></B>
First Name:<input type="text" size="20" name="first_name"><BR><BR>
Last Name:<input type="text" size="20" name="last_name"><BR><BR>
Payer Email:<input type="text" size="20" name="payer_email"><BR><BR>
Course :     <select name="item_number">
    
     <!-- <option value="101"> 1. ITILstudy Blend Course for 30 days</option>
	  <option value="105"> 2. ITILstudy Blend Course for 60 days</option>-->
	  <option value="106"> 1. ITILstudy Blend Course for 90 days</option>
      <option value="104"> 2. ITILstudy Online Course for 180 days (6 months)</option>
      <option value="109"> 3. ITILstudy Intermediate (CSI) Online Course for 60 days</option>
	  <option value="111"> 4. ITILstudy Intermediate (OSA) Online Course for 60 days</option>
	  <option value="114"> 5. ITILstudy Service Strategy for 90 days</option>
      <option value="115"> 6. ITILstudy Service Transition for 90 days</option>
      <option value="116"> 7. ITILstudy Service Design for 90 days</option>
      <option value="117"> 8. ITILstudy Service Operation for 90 days</option>
      <!-- *****PPO SAO RCV***** -->
      <option value="118"> 9. ITILstudy Intermediate (PPO) Online Course for 90 days</option>  
      <option value="119"> 10. ITILstudy Intermediate (SOA) Online Course for 90 days</option>  
      <option value="120"> 11. ITILstudy Intermediate (RCV) Online Course for 90 days</option>  

      </select><BR><BR>
        Currency: <select name="Currency">
  		<option value="">--Select--</option>
      <option value="AUD"> AUD</option>
      <option value="euro">&#8364; (euro €)</option>
      <option value="GBP">&#163; (GBP)</option> 
      <option value="Rs">Rs</option>
      <option value="SGD">SGD</option>
      <option value="USD">USD</option>
      </select><BR><BR>
Address Street:<input type="text" size="20" name="address_street"><BR><BR>
Address City:<input type="text" size="20" name="address_city"><BR><BR>
Address State:<input type="text" size="20" name="address_state"><BR><BR>
Address Zip:<input type="text" size="20" name="address_zip"><BR><BR>
Address Country:<input type="text" size="20" name="address_country"><BR><BR>
<input type="hidden" name="manualenroll" value=" : Manual Enrollment">
<I>Optional - date entered (mm/dd/yyyy)</I>:<input type="text" size="20" name="date_enter"> (Default value is Today)<BR><BR> 
<I>Optional - date valid (mm/dd/yyyy)</I>:<input type="text" size="20" name="date_val"> (Default value is after 3 months)<BR><BR>
Mode Of Payment :<select name="ModeOfPayment" onChange="update(this)">
           <option value="">---- Select ----</option>
            <option value="Paypal">Paypal</option>
            <option value="CCAvenue-USD">CCAvenue-USD</option>
            <option value="CCAvenue-INR">CCAvenue-INR</option>
            <option value="BankTransfer">Bank Transfer</option>
            <option value="Check">Check</option>
            <option value="Test-Environment">Test-Environment</option>
          </select><br><br>
<span id="payment_gross" style="display:table-row;">
Payment Gross:<input type="text" size="20" name="payment_gross">
</span><br>
<span id="Paymentdate" style="display:table-row;">
Payment Date:<input type="text" size="20"  name="Paymentdate">&nbsp;(mm/dd/yyyy)
</span><br>
<span id="TraDetails" style="display:table-row;" >
Transaction Details:<input type="text" size="20" name="TraDetails">
</span><br><br>
<input type="submit" Value="Add New Course"><input type="reset"  value="Reset" />
</form>



<div>
<%
'if the student has not enrolled for any classroom course n we try to give him access to prep course than this message will be displayed.
Dim strMessage

strMessage = Session("message")
Session("message") = "" %>
<table border="0">
<tr><td><font face="Arial" size="3" color="#CC0000"><% Response.Write("<hr>"&strMessage)%>
</font></td></tr></table>

<form name="one" action="./customerdetails_admin.asp" method="post" target="_blank" onSubmit="return validate_form2(this)">
<BR><HR><BR><B>Add New Prep Course:<BR><BR></B>
First Name:<input type="text" size="20" name="first_name"><BR><BR>
Last Name:<input type="text" size="20" name="last_name"><BR><BR>
Payer Email:<input type="text" size="20" name="payer_email"><BR><BR>
Course : <SELECT NAME="item_number"> 
<Option VALUE="110"> 1. Provide online access to ITILstudy pre-work course</option>
</SELECT><BR><BR>

City: <input type="text" name="address_city" ><br><br>
Address Country:

<select name="address_country">
                  <option value="">--Select--</option>
                   <option value="Australia">Australia</option>
                  <option value="Canada">Canada</option>
				   <option value="India">India</option>
				    <option value="Singapore">Singapore</option>
					 <option value="UAE">UAE</option>
                   <option value="United Kingdom">United Kingdom</option>
				   	 <option value="US">US</option>
                    </select>
					<br><br>
Description:<input type="text" size="20" name="payment_gross" value="Preparation for ITILstudy Prep Classroom Course">
<br>
    <br>
<input type="hidden" name="manualenroll" value=" : Manual Enrollment">

<input type="submit" Value="Add New Course"><input type="reset"  value="Reset" />
</form>

</div>

<HR>
<BR>
<B>View all people who have enrolled in Preparatory Program </B><BR>
<BR>
<form name="one" action="./viewprepcourse.asp" method="post" target="_blank">
  <input type="submit" Value="ViewPrepCourseStudents"><input type="reset"  value="Reset" />
</form>
<BR>
<BR>

<form name="one" action="./admintempaddress.asp" method="post" target="_blank">
<BR><HR><BR><B>Update Address for given EmailID:<BR><BR></B>
Payer Email:<input type="text" size="20" name="payer_email"><BR><BR>
First Name:<input type="text" size="20" name="first_name"><BR><BR>
Last Name:<input type="text" size="20" name="last_name"><BR><BR>
Address Street:<input type="text" size="20" name="address_street"><BR><BR>
Address City:<input type="text" size="20" name="address_city"><BR><BR>
Address State:<input type="text" size="20" name="address_state"><BR><BR>
Address Zip:<input type="text" size="20" name="address_zip"><BR><BR>
Address Country:<input type="text" size="20" name="address_country"><BR><BR>
Phone Number: <input type="text" size="20" name="ebay_address_id"><BR><BR>

Feedback from person:<BR><textarea name="feedback" cols="100" rows="3"></textarea><BR><BR>

<input type="submit" Value="Update Address"><input type="reset"  value="Reset" />
</form><BR>


<form name="one" action="./admintempemailid.asp" method="post" target="_blank">
<BR><HR><BR><B>Update Email ID:<BR><BR></B>
First Name:<input type="text" size="20" name="first_name"><BR><BR>
Last Name:<input type="text" size="20" name="last_name"><BR><BR>
Payer Email:<input type="text" size="20" name="payer_email"><BR><BR>
Feedback from person:<BR><textarea name="feedback" cols="100" rows="3"></textarea><BR><BR>

<input type="submit" Value="Update EmailID"><input type="reset"  value="Reset" />
</form><BR>

<BR><BR>
<form name="one" action="./admintempPh.asp" method="post" target="_blank">
<BR><HR><BR><B>Update Phone No.:<BR><BR></B>
First Name:<input type="text" size="20" name="first_name"><BR><BR>
Last Name:<input type="text" size="20" name="last_name"><BR><BR>
Payer Email:<input type="text" size="20" name="payer_email"><BR><BR>
Phone Number:<input type="text" size="20" name="Ph_no"><BR><BR>
Feedback from person:<BR><textarea name="feedback" cols="100" rows="3"></textarea><BR><BR>

<input type="submit" Value="Update Phone no"><input type="reset"  value="Reset" />
</form><BR>
<BR><BR>


<form name="one" action="./admintempdate.asp" method="post" target="_blank" onSubmit="return validate_form1(this)">
<BR><HR><BR><B>Update Expiry Date for a particular Email ID:<BR><BR></B>
First Name:<input type="text" size="20" name="first_name"><BR><BR>
Last Name:<input type="text" size="20" name="last_name"><BR><BR>
Payer Email:<input type="text" size="20" name="payer_email"><BR><BR>
Feedback from person:<BR><textarea name="feedback" cols="100" rows="3"></textarea><BR><BR>

Date:<input type="text" size="20" name="date"> (format: mm/dd/yyyy )<BR><BR>
Mode Of Payment :<select name="ModeOfPayment" onChange="update(this)">
                  <option value="">---- Select ----</option>
                  <option value="Paypal">Paypal</option>
                  <option value="CCAvenue-USD">CCAvenue-USD</option>
                  <option value="CCAvenue-INR">CCAvenue-INR</option>
                  <option value="BankTransfer">Bank Transfer</option>
                  <option value="Check">Check</option>
                  <option value="Test-Environment">Test-Environment</option>
                  <option value="Free-Extension">Free-Extension</option>          
                  </select><br><br>
<span  id="NewAmount" style="display:table-row;" >
Amount:<input type="text" size="20" name="NewAmount">
</span><br>
<span id="Paymentdate1" style="display:table-row;">
Payment Date:<input type="text" size="20" name="Paymentdate">&nbsp;(mm/dd/yyyy)
</span><br>
<span id="TraDetails1" style="display:table-row;">
Transaction Details:<input type="text" size="20" id="TraDetails1" style="display:table-row;" name="TraDetails">
</span><br>
<input type="submit" Value="Update Expiry Date"><input type="reset"  value="Reset" />
</form>
<BR><BR>
<form name="one" action="./admintempname.asp" method="post" target="_blank">
<BR><HR><BR><B>Update Name for a particular Email ID:<BR><BR></B>
Payer Email:<input type="text" size="20" name="payer_email"><BR><BR>
First Name:<input type="text" size="20" name="first_name"><BR><BR>
Last Name:<input type="text" size="20" name="last_name"><BR><BR>
Feedback from person:<BR><textarea name="feedback" cols="100" rows="3"></textarea><BR><BR>

<input type="submit" Value="Update Name for given EmailID"><input type="reset"  value="Reset" />
</form>
<BR><BR>
<form name="one" action="./admintemppass.asp" method="post" target="_blank">
<BR><HR><BR><B>Update Password for a particular Email ID:<BR><BR></B>
First Name:<input type="text" size="20" name="first_name"><BR><BR>
Last Name:<input type="text" size="20" name="last_name"><BR><BR>
Payer Email:<input type="text" size="20" name="payer_email"><BR><BR>
Feedback from person:<BR><textarea name="feedback" cols="100" rows="3"></textarea><BR><BR>
Password:<input type="text" size="20" name="pass"><BR><BR>

<input type="submit" Value="Update Password for given EmailID"><input type="reset"  value="Reset" />
</form>


<BR><BR>
<form name="one" action="./admintempknopassed.asp" method="post" target="_blank">
<BR><HR><BR><B>Update KNOPassed for a particular Email ID:<BR><BR></B>
Payer Email:<input type="text" size="20" name="payer_email"><BR><BR>
KNO PasseD:<input type="text" size="20" name="kno_passed"><BR><BR>

<input type="submit" Value="Update KNO Passed for given EmailID"><input type="reset"  value="Reset" />
</form>

<BR><BR>
<form name="one" action="./admintempitem-no.asp" method="post" target="_blank">
<BR><HR><BR><B>Update Item_number for given emailID:<BR><BR></B>
Payer Email:<input type="text" size="20" name="payer_email"><BR><BR>
Item_number of course: <input type="text" size="20" name="item_number"><BR><BR>

<input type="submit" Value="Update Item Number for given EmailID"><input type="reset"  value="Reset" />
</form>


<form name="one" action="./admintempitem-name.asp" method="post" target="_blank">
<BR><HR><BR><B>Update Item_name for given emailID:<BR><BR></B>
Payer Email:<input type="text" size="20" name="payer_email"><BR><BR>
Item_name of course: <input type="text" size="20" name="Item_name"><BR><BR>

<input type="submit" Value="Update Item Name for given EmailID"><input type="reset"  value="Reset" />
</form>

<BR><HR><BR>


  <form name="one" action="PDUcertificate.asp" method="post" target="_blank">
    
    <b>Generate PDU Certificate for a particular person:<br>
    <br>
    </b> First Name:
    <input type="text" size="20" name="FirstName">
    <br>
    <br>
    Last Name:
    <input type="text" size="20" name="LastName">
    <br>
    <br>
   
    Date:
    <input type="text" size="20" name="Cert_Date">(format: mm/dd/yyyy )
    <br>
    <br>
    <input type="submit" value="Generate PDU Certificate for a person"><input type="reset"  value="Reset" />
  </form>
  <br>
    <hr>
    <br>

<%Else
Session("UserID")=""
Session("Accessgranted")=""%>
<BR><BR>
<B>Please enter your UserID and Password to log into the admin page</B><BR><BR>
<form name="loginform" action="./adminupdatedb.asp" method="post">
UserID:<input type="text" size="20" name="UserID"><BR><BR>
Password:<input type="password" size="20" name="Password"><BR><BR>

<input type="submit" Value="Please log me in to Admin Page"><input type="reset"  value="Reset" />
</form>

<%

End If%>
<!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>



