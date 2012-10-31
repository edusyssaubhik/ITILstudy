<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<% 
If Session("USBUserId") = "" Then 
	Response.Redirect("login.asp")
Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 12/07/2010'
'Description :'
'This page is adding calls to the database'
'US BackOffice'
'======================================================='

'Declare the local variables'
Dim strUSCity, strCanadaCity, objRs, objRs1

'Creatting the record set'
Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")

'Retrive the state in the US'
strUSCity = "SELECT state FROM sixsigma_us_states WHERE country = 'US' ORDER BY state"

objRs.Open strUSCity,ConnObj

'Retrive the state in the Canada'
strCanadaCity = "SELECT state FROM sixsigma_us_states WHERE country = 'Canada' ORDER BY state"

objRs1.Open strCanadaCity,ConnObj

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>New Call</title>
<script language="javascript">

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

  with (theform)
  {
 	    if (validate_number(phoneno,"Phone number1 is not a numeral")==false)
 	         {phoneno.focus();return false}
  
  }
  
  if (theform.state.value == "")
  {
     alert("Please select state.");
     theform.state.focus();
     return (false);
  }

  if (theform.question.value == "")
  {
     alert("Please enter the question.");
     theform.question.focus();
     return (false);
  }
  
}
</script>
<!-- CSS -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<!--[if IE 6]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie6.css" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie7.css" /><![endif]-->
<!-- JavaScripts-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jNice.js"></script>
</head>
<body>
<div id="wrapper">
  <!--#include file="includes/topMenu.asp"-->
  <!-- // #end mainNav -->
  <div id="containerHolder">
    <div id="container">
      <div id="sidebar">
        <!--#include file="includes/leftMenu.asp"-->
        <!-- // .sideNav -->
      </div>
      <!-- // #sidebar -->
      <!-- h2 stays for breadcrumbs -->
      <h2><a href="home.asp">Home</a> &raquo; <a href="marketingB2C.asp?action=noFollowUp" class="active">Marketing B2C</a> &raquo; New Call</h2>
      <div id="main">
        <p>
        <h3>Add New Call</h3>
        </p>
        <fieldset>

<table border="1" cellpadding="5" cellspacing="0" align="center" width="45%" >
 <tr>
  <td>
  <form name="6sigmacalls" action="add6sigmaNewCall.asp" method="post" onsubmit="return Form_Validator(this)">
   <table border="0" cellpadding="5" cellspacing="0" width="100%" class="table2">
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
	 <td>
	  <select name="state">
	   <option value="">--Select--</option>
	 
	   <optgroup label="US">
	   <% Do Until objRs.EOF %>
	   <option value="<% = objRs("state") %>"><% = objRs("state") %></option>
	   <% objRs.Movenext
	      Loop
		  objRs.Close %>
		</optgroup>
	   <optgroup label="Canada">
	   <% Do Until objRs1.EOF %>
	   <option value="<% = objRs1("state") %>"><% = objRs1("state") %></option>
	   <% objRs1.Movenext
	      Loop
		  objRs1.Close %>		
		</optgroup>
	  </select>
	 </td>
	</tr>	
	
	 <td><b>EmailId :</b></td>
	 <td><input type="text" name="emailid" /></td>
	</tr>	
	<tr>
	 <td valign="top"><b>Question Asked :</b></td>
	 <td><textarea name="question" rows="7" cols="30"></textarea></td>
	</tr>
	<tr>
	 <td valign="top"><b>Comment :</b></td>
	 <td><textarea name="comment" rows="7" cols="30"></textarea></td>
	</tr>		
	<tr>
	 <td><b>Other Field1 :</b></td>
	 <td><input type="text" name="otherfield1" /></td>
	</tr>	
	<tr>
	 <td><b>Other Field2 :</b></td>
	 <td><input type="text" name="otherfield2" /></td>
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
        </fieldset>
      </div>
      <!-- // #main -->
      <div class="clear"></div>
    </div>
    <!-- // #container -->
  </div>
  <!-- // #containerHolder -->
  <p id="footer">&nbsp;</p>
</div>
<!-- // #wrapper -->
</body>
</html>
<!--#include virtual="/includes/connectionClose.asp"-->
<% End If %>
