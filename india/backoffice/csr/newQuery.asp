<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
If Session("UserId") = "" Then
     Response.Redirect("../login.asp")
	 
	 Else
%>
<%
'======================================================='
'Written By : savita'
'Last UpDated : 05/04/2011'
'Description :'
'This page is to add the detail about payment decline'
'======================================================='
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Add new query</title>
<script type="text/javascript" src="/india/backoffice/csr/calendar/zapatec.js"></script>
<script type="text/javascript" src="/india/backoffice/csr/calendar/calendar.js"></script>
<script type="text/javascript" src="/india/backoffice/csr/calendar/calendar-en.js"></script>
<link href="/india/backoffice/csr/calendar/template.css" rel="stylesheet" type="text/css">
<link href="/india/backoffice/csr/calendar/system.css" rel="stylesheet" type="text/css">
<script language="javascript">
//Email Validation

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

function validate_number(field,alerttxt)
  {
  	var iChars = "0123456789-";

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
  
function Form_Validator(theform)
{

	with (theform)
    {
  
  
  		if (validate_required(Website,"Please select the website")==false)
			  {Website.focus();return false}
			  
		
		if (validate_required(OrderNo,"Please enter the Order No")==false)
			  {OrderNo.focus();return false}
			  
			  			  
		if (validate_required(Name,"Please enter the your name")==false)
			  {Name.focus();return false}
			  
 	    if (validate_required(EmailID,"Please enter emailid")==false)
 		     {EmailID.focus();return false}
			  
        if (echeck(EmailID)==false)
 	         {EmailID.focus();return false}		
			 
	    if (validate_required(ContactNo,"Please enter the your Contact Number")==false)
			  {ContactNo.focus();return false}	
			  
	   if (validate_number(ContactNo,"your Contact Number should be numerical")==false)
			  {ContactNo.focus();return false}	   
		
		if (validate_required(city,"Please enter the City")==false)
			  {city.focus();return false}	  			    
 	  
		if (validate_required(country,"Please select country")==false)
 		     {country.focus();return false} 
			  
		if (validate_required(datePayment_dec,"Please enter the payment decline date")==false)
			  {datePayment_dec.focus();return false}
			  
		if (validate_required(FailureReason,"Please give reason for failure")==false)
			  {FailureReason.focus();return false}	
				  			  		 
	
		if (validate_required(Amount,"Please enter the amount")==false)
			  {Amount.focus();return false}			  			  		 

		/*if (validate_number(Amount,"Amount is not numerical")==false)
			  {Amount.focus();return false}	*/		
			  
	    if (validate_required(Currency_type,"Please select the currency type")==false)
			  {Currency_type.focus();return false}		  		 

 	    if (validate_required(PayProcess_name,"Please select Payment Process name")==false)
 		     {PayProcess_name.focus();return false} 			 
	}		 

}

</script>
</head>
<body>
<div>
  <table border="1" cellpadding="5" cellspacing="0" align="center" width="45%">
    <tr>
      <td align="center"><b>Payment decline</b></td>
    </tr>
    <tr>
      <td><form name="newQuery" action="addNewQuery.asp" method="post" onsubmit="return Form_Validator(this)">
          <table border="0" cellpadding="5" cellspacing="0" width="100%">
            <tr>
              <td width="30%"></td>
              <td width="60%" align="right"><a href="PayDecline.asp?action=noFollowUp">Back </a></td>
            </tr>
            <tr>
              <td>Type of course :</td>
              <td><input type="radio" name="TypeofCourse" value="Classroom" checked="checked" />
                Classroom&nbsp;
                <input type="radio" name="TypeofCourse" value="Online" />
                Online </td>
            </tr>
            <!--<tr>
              <td>Website :</td>
              <td><select name="Website">
                  <option value="">--select--</option>
                  <option value="PMstudy">PMstudy</option>
                  <option value="6sigmastudy">6sigmastudy</option>
                  <option value="PROJstudy">PROJstudy</option>
                  <option value="RMstudy">RMstudy</option>
                  <option value="NGstudy">NGstudy</option>
                  <option value="HRDstudy">HRDstudy</option>
                  <option value="HRCIstudy">HRCIstudy</option>
                  <option value="PROGstudy">PROGstudy</option>
                </select>
              </td>
            </tr>-->
            <tr>
              <td> Order No. :</td>
              <td><input type="text" name="OrderNo" />
              </td>
            </tr>
            <tr>
              <td>Name : </td>
              <td><input type="text" name="Name" />
              </td>
            </tr>
            <tr>
              <td>EmailID :</td>
              <td><input type="text" name="EmailID" /></td>
            </tr>
            <tr>
              <td>Contact No : </td>
              <td><input type="text" name="ContactNo" /></td>
            </tr>
            <tr>
              <td>City :</td>
              <td><input type="text" name="city" /></td>
            </tr>
            <tr>
              <td>Country:</td>
              <td><input type="text" name="country" />
              </td>
            </tr>
            <td>Invoice Date:</td>
              <td><input autocomplete="off" name="InvoiceDate" readonly id="checkIn1_date" type="text" size="10" >
                <input value=" Cal " id="button8a" class="buttonc" type="reset"  ></td>
            </tr>
            <tr>
              <td>Date of Payment Decline:</td>
              <td><input autocomplete="off" name="datePayment_dec" readonly id="checkIn2_date" type="text" size="10" >
                <input value=" Cal " id="button8b" class="buttonc" type="reset"  ></td>
            </tr>
            <tr>
              <td>Failure Reason:</td>
              <td><textarea name="FailureReason" rows="7" cols="24">
          </textarea>
              </td>
            </tr>
            <tr>
              <td>Amount:</td>
              <td><select name="Currency_type">
                  <option value="">--select--</option>
                  <option value="&pound;">&pound;</option>
                  <option value="&euro;">&euro;</option>
                  <option value="&#36;">&#36;</option>
                  <option value="Rs">Rs</option>
                </select>
                <input type="text" name="Amount" >
              </td>
            </tr>
            <tr>
              <td>Payment Process:</td>
              <td><select name="PayProcess_name">
                  <option value="Google Checkout (US)">Google checkout(US)</option>
                  <option value="Google Checkout (UK)">Google checkout(UK)</option>
                  <option value="CCAvenue">CCAvenue</option>
                  <option value="Paypal(US)">Paypal(US)</option>
                  <option value="Paypal(UK)">Paypal(UK)</option>
                  <option value="Paypal(India)">Paypal(India)</option>
                  <option value="Bank of America">Bank of America</option>
                  <option value="Check payment">Check payment</option>
                </select>
              </td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td colspan="3"><input type="submit" name="type" value="Add New Query" />
                &nbsp;</td>
            </tr>
          </table>
        </form></td>
    </tr>
  </table>
  <script type="text/javascript">
   			<!--  to hide script contents from old browsers
   			var startDate;
   			var endDate;

   			function filterDates1(cal) {
   				startDate = new Date(cal.date)
   				startDate.setHours(0,0,0,0)	
   			}
			function filterDates2(cal) {
   				var date = cal.date;
   				endDate = new Date(cal.date)
   				endDate.setHours(0,0,0,0)	// used for compares without TIME
   			}

			
   			// end hiding contents from old browsers  -->
   		</script>
  <script type="text/javascript">

   			var cal = new Zapatec.Calendar.setup({

   	         inputField     :    "checkIn1_date",   // id of the input field
   	         button         :    "button8a",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         onUpdate       :    filterDates1

   			});
			Zapatec.Calendar.setup({
   	         inputField     :    "checkIn2_date",
   	         button         :    "button8b",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         onUpdate       :    filterDates2
   	      });
		  
		  


   		</script>
</div>
</body>
</html>
<% End If %>