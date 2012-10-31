<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'======================================================='
'Written By : Savita'
'Last UpDated : 31/03/2011'
'Description : Enter to and from date to send the report
'======================================================='
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Payment Send Mail</title>

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
	
		if (validate_required(fromDate,"Please enter the date")==false)
			  {fromDate.focus();return false}
			  
		/*if (validate_number(fromDate,"Date should be numerical")==false)
			  {fromDate.focus();return false}*/
				 
	    if (validate_required(toDate,"Please enter the date")==false)
			  {toDate.focus();return false}
			  
		/*if (validate_number(toDate,"Date should be numerical")==false)
			  {toDate.focus();return false}*/
				 
		if (validate_required(EmailID,"Please enter emailid")==false)
 		     {EmailID.focus();return false}
			  
        if (echeck(EmailID)==false)
 	         {EmailID.focus();return false}	
	}		 

}

</script>

</head>
<body>

<form name="one" action="PaySendMail.asp" method="post" onsubmit="return Form_Validator(this)">
  <table border="1" align="center" cellpadding="7" cellspacing="4" width="35%">
  
    <tr>
      <td align="center" colspan="2"><b>Payment Decline Details</b></td>
    </tr>
    <tr>
      <td> From Date:</td>
      <td><input type="text" size="20" name="fromDate"> MM/DD/YYYY</td>
    </tr>
    <tr>
      <td> To Date:</td>
      <td><input type="text" size="20" name="toDate"> MM/DD/YYYY</td>
    </tr>
	 <tr>
      <td> EmailID :</td>
      <td><input type="text" size="30" name="EmailID"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="action" value="Preview Payment Details"></td></tr>
	  <tr><td align="right" colspan="2"><a href="PayDecline.asp?action=noFollowUp">Back </a></td></tr>
   
  </table>
</form>
</body>
</html>
