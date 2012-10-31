<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
'Written By : savita'
'Created Date : 18/08/2011'
'Last Updated : 19/08/2011'
'Description :'
'This page is ITILstudy adding calls to the database'
'US BackOffice'
'======================================================='

'Declare the local variables'
Dim strUSState, objRs, objRs1

'Creatting the record set'
Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ITILstudy Receptionist Calls</title>
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


  if (theform.callername.value == "")
  {
     alert("Please enter the name.");
     theform.callername.focus();
     return (false);
  } 
 

  if (theform.phoneno.value == "")
  {
     alert("Please enter the phone number.");
     theform.phoneno.focus();
     return (false);
  }
   if (theform.state.value == "")
	{
	   alert("Please select State.");
	   theform.state.focus();
	   return (false);
	}

  with (theform)
  {
 	    if (validate_number(phoneno,"Phone number1 is not a numeral")==false)
 	         {phoneno.focus();return false}
  
  }
  
   if (theform.emailid.value == "")
  {
     alert("Please enter the email id.");
     theform.emailid.focus();
     return (false);
  }
 
  with (theform)
  {
 	    if(echeck(emailid)==false)
					 {emailid.focus();return false}
  
  }

  
  if (theform.question.value == "")
  {
     alert("Please enter the question.");
     theform.question.focus();
     return (false);
  }
  
  
  
}
</script>
</head>
<body>
<div>
<table border="1" cellpadding="5" cellspacing="0" align="center" width="45%">
 <tr>
  <td align="left"><img src="/images/buttons/logo_ITIL.png" /></td>
 </tr>
 <tr>
  <td>
  <form name="addcalls" action="addCalls.asp" method="post" onsubmit="return Form_Validator(this)">
   <table border="0" cellpadding="5" cellspacing="0" width="100%">
    <tr>
	 <td width="20%"><b>For :</b></td>
	 <td width="60%">
	  <input type="radio" name="callfor" value="Classroom" checked="checked" />Classroom&nbsp;
	  <input type="radio" name="callfor" value="Online" />Online
	 </td>
	</tr>
	<tr>
	 <td><b>Name :</b></td>
	 <td><input type="text" name="callername" /></td>
	</tr>
	<tr>
	 <td><b>Phone Number :</b></td>
	 <td><input type="text" name="phoneno" /></td>
	</tr>	
    
<tr>
	 <td><b>State:</b></td>
	 <td>  <select name="state">
	   <option value="">--Select--</option>
	   <optgroup label="US">
	  <%
	  'Retrive the states'
		'strUSState = "SELECT states, statecode FROM ps_us_states WHERE country = 'US' ORDER BY states"
		strUSState = "SELECT states, statecode FROM itil_states WHERE country = 'US' ORDER BY states"

		objRs.Open strUSState,ConnObj
	   
	    Do Until objRs.EOF %>
	   <option value="<% = objRs("states") %>"><% = objRs("states") %>, <% = objRs("statecode") %></option>
	   <% objRs.Movenext
	      Loop
		  objRs.Close %>
	   </optgroup>
	   <optgroup label="Canada">
	  <%
	  'Retrive the states'
		strUSState = "SELECT states, statecode FROM itil_states WHERE country = 'Canada' ORDER BY states"

		objRs.Open strUSState,ConnObj
	   
	    Do Until objRs.EOF %>
	   <option value="<% = objRs("states") %>"><% = objRs("states") %>, <% = objRs("statecode") %></option>
	   <% objRs.Movenext
	      Loop
		  objRs.Close %>
	   </optgroup>	   
	  
	  </select></td>
	</tr>		
    
	<tr>
	 <td><b>City :</b></td>
	 <td>
	
      <input type="text" name="city" />
	 </td>
	</tr>	
	
	<tr>
	 <td><b>EmailId :</b></td>
	 <td><input type="text" name="emailid" /></td>
	</tr>	
	<tr>
	 <td valign="top"><b>Question Asked :</b></td>
	 <td><textarea name="question" rows="7" cols="30"></textarea></td>
	</tr>
	
	<tr>
	 <td>&nbsp;</td>
	 <td><input type="submit" name="Submit" value="Submit" />&nbsp;<input type="reset" name="reset" value="Reset" /></td>
	</tr>		
   </table>
   </form>
  </td>
 </tr>
</table>
</div>
<!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>
