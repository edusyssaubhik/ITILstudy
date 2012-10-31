<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
'Written By : Savita'
'Created Date : 12th Nov 2011
'Last UpDated : 12th Nov 2011'
'Description :'
'This page is adding free test to the database'
'Globalbackoffice'
'======================================================='


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Calls</title>
<style type="text/css">
body {
	background: white;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #646464;
	text-align: left;
}
</style>
<script language="javascript">
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

/*Phone number validation*/
function validate_number(field,alerttxt)
  {
  	var iChars = "0123456789-()";

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

  if (theform.phoneno.value == "")
  {
     alert("Please enter the phone number.");
     theform.phoneno.focus();
     return (false);
  }
  
   if (theform.country.value == "")
  {
     alert("Please select Country.");
     theform.country.focus();
     return (false);
  }
  if (theform.emailid.value == "")
  {
     alert("Please enter the email id.");
     theform.emailid.focus();
     return (false);
  }

  if (theform.question.value == "")
  {
     alert("Please enter the question.");
     theform.question.focus();
     return (false);
  }

  with (theform)
  {
 	    if(echeck(emailid)==false)
					 {emailid.focus();return false}
  
  }

}

function clicked()
{
	alert('Only email support is provided to online students. So, please email adminsupport@PMstudy.com for queries relating to online courses.');
}
</script>
</head>
<body>
<div>
  <table border="1" cellpadding="5" cellspacing="0" align="center" width="45%">
    <tr>
      <td align="center">Add Call Details</td>
    </tr>
    <tr>
      <td><form name="addcalls" action="addManual_Calls.asp" method="post" onsubmit="return Form_Validator(this)">
          <table border="0" cellpadding="5" cellspacing="0" width="100%">
            <tr>
              <td><b>Name :</b></td>
              <td><input type="text" name="callername" /></td>
            </tr>
            <tr>
              <td><b>Phone Number :</b></td>
              <td><input type="text" name="phoneno" /></td>
            </tr>
            <tr>
              <td><b>EmailId :</b></td>
              <td><input type="text" name="emailid" /></td>
            </tr>
			 <tr>
              <td><b>Date Entered :</b></td>
              <td><input type="text" name="dateEntered" />(MM/DD/YYYY)</td>
            </tr>
			 <tr>
              <td><b>Date Valid :</b></td>
              <td><input type="text" name="dateValid" />(MM/DD/YYYY)</td>
            </tr>
            <tr>
              <td><b>Country:</b></td>
              <td><select name="country">
                  <option value="">--Select--</option>
                  <option value="Canada">Canada</option>
                  <option value="India">India</option>
                  <option value="Singapore">Singapore</option>
                  <option value="UAE">UAE</option>
                  <option value="United Kingdom">United Kingdom</option>
                  <option value="US">US</option>
                </select>
              </td>
            </tr>
            <tr>
              <td><b>State / County:</b></td>
              <td><input type="text" name="state"  /></td>
            </tr>
            <tr>
              <td><b>City :</b></td>
              <td><input type="text" name="city" />
              </td>
            </tr>
            <tr>
              <td valign="top"><b>Additional Info:</b></td>
              <td><textarea name="enroll" rows="7" cols="30"></textarea></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><input type="submit" name="Submit" value="Submit" />
                &nbsp;
                <input type="reset" name="reset" value="Reset" /></td>
            </tr>
          </table>
        </form></td>
    </tr>
  </table>
</div>
<!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>
