<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<!--#include virtual="/includes/connection.asp"-->
<% 
If Session("USBUserId") = "" Then 
	Response.Redirect("/USBackoffice/login.asp")
Else
%>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 13/07/2010'
'======================================================='

'Declare the local variables'
Dim strCity, objRs, objRs1
Dim arrAllCities, cityNumRows
Dim cityFirstRow, cityLastRow
Dim cityRowCounter
Dim rqAction
Dim strListOfInst, strInst
Dim rqInstId

'Creating the record set'
Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")

'Retrive the action'
rqAction = Request.QueryString("action")
rqInstId = Request.QueryString("instId")

If rqAction = "list" Then

	strListOfInst = "SELECT * FROM sixsigma_us_instructor"
	
	objRs.Open strListOfInst,ConnObj

ElseIf rqAction = "edit" Then 

	strInst = "SELECT * FROM sixsigma_us_instructor WHERE id = '"& rqInstId &"'"
	
	objRs.Open strInst,ConnObj
	
ElseIf rqAction = "resetpwd" Then

	strInst = "SELECT firstname, lastname, pas, inst_emailid1 FROM sixsigma_us_instructor WHERE id = '"& rqInstId &"'"
	
	objRs.Open strInst,ConnObj

End If 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>6sigma US Instructors</title>
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
  
		if (validate_required(firstname,"Please enter the first name")==false)
			  {firstname.focus();return false}
			  
		if (validate_required(lastname,"Please enter the last name")==false)
			  {lastname.focus();return false}
			  
 	    if (validate_required(emailid1,"Please enter emailid1")==false)
 		     {emailid1.focus();return false}

        if (echeck(emailid1)==false)
 	         {emailid1.focus();return false}			  
			  			    
 	    if (validate_required(pwd,"Please enter password")==false)
 		     {pwd.focus();return false}  

			 
 	    if (validate_required(phoneno1,"Please enter phone number1")==false)
 		     {phoneno1.focus();return false}

 	    if (validate_number(phoneno1,"Phone number1 is not a numeral")==false)
 	         {phoneno1.focus();return false}
			 
		if (validate_required(country,"Please select country")==false)
 		     {country.focus();return false} 

 	    if (validate_required(typeofuser,"Please select Type Of User")==false)
 		     {typeofuser.focus();return false} 			 
	}		 

}

function Form_Validator1(theform)
{

	with (theform)
    {
	 	    if (validate_required(pwd,"Please enter password")==false)
 		     {pwd.focus();return false} 
	}
}
</script>
</head>
<body>
<% If rqAction = "list" Then %>
<div>
 <table border="1" cellpadding="5" cellspacing="0" width="100%">
  <tr>
   <td><b>First Name</b></td>
   <td><b>Last Name</b></td>
   <td><b>EmailId1</b></td>
   <td><b>EmailId2</b></td>
   <td><b>Password</b></td>
  <td><b>Phone Number1</b></td>
   <td><b>Phone Number2</b></td>
   <td><b>Country</b></td>
   <td><b>Company Name</b></td>
   <td><b>Company Address</b></td>
    <td><b>Type Of User</b></td>
    <td><b>Address</b></td>
   <td><b>Edit</b></td>
   <td><b>Reset Password</td>
   <% If Session("USBUserId") = "bharath@bhea.co.in" Then %>
   <td><b>Delete</b></td>
   <% End If %>
  </tr>
  <% Do Until objRs.EOF %>
  <tr>
   <td><% = objRs("firstname") %></td>
   <td><% = objRs("lastname") %></td>
   <td><% = objRs("inst_emailid1") %></td>
   <td><% = objRs("inst_emailid2") %></td>
   <td><% = objRs("pas") %></td>
   <td><% = objRs("phone_no1") %></td>
   <td><% = objRs("phone_no2") %></td>
   <td><% = objRs("country") %></td>
   <td><% = objRs("company_name") %></td>
   <td><% = objRs("company_add") %></td>
    <td><% = objRs("typeofuser") %></td>
     <td><% = objRs("inst_address") %></td>
   <td><a href="6sigma_us_inst.asp?action=edit&instId=<% = objRs("id") %>">Edit</a></td>
   <td><a href="6sigma_us_inst.asp?action=resetpwd&instId=<% = objRs("id") %>">Reset Password</a></td>
   <% If Session("USBUserId") = "bharath@bhea.co.in" Then %>   
   <td><a href="addEditDel6sigmaUsInst.asp?action=delete&delInstId=<% = objRs("id") %>">Delete</a></td>
   <% End If %>
  </tr>  
  <% objRs.Movenext
     Loop
	 objRs.Close %>
 </table>
</div>
<% ElseIf rqAction = "edit"  Then %>
<div>
<table border="1" cellpadding="5" cellspacing="0" align="center" width="60%">
 <tr>
  <td align="center" colspan="2">Edit Instructor</td>
 </tr>
 <tr>
  <td>
  <form name="6sigma_us_inst" action="addEditDel6sigmaUsInst.asp" method="post" onsubmit="return Form_Validator(this)">
   <% Do Until objRs.EOF %>
   <input type="hidden" name="instId" value="<% = objRs("id") %>" />
   <table border="0" cellpadding="5" cellspacing="0" width="100%">
	<tr>
	 <td><b>First Name :</b></td>
	 <td><input type="text" name="firstname" value="<% = objRs("firstname") %>" /></td>
	 <td><b>Last Name :</b></td>
	 <td><input type="text" name="lastname" value="<% = objRs("lastname") %>" /></td>
	</tr>	
	<tr>
	 <td><b>EmailId1 :</b></td>
	 <td><input type="text" name="emailid1" value="<% = objRs("inst_emailid1") %>" /></td>
     
      <td><b>Password:</b></td>
	 <td><input type="Password" name="pwd" value="<% = objRs("pas") %>" /></td>
	</tr>	
	<tr>
	 <td><b>EmailId2 :</b></td>
	 <td><input type="text" name="emailid2" value="<% = objRs("inst_emailid2") %>" /></td>
	
	</tr>		
	<tr>
	 <td><b>Phone Number1 :</b></td>
	 <td><input type="text" name="phoneno1" value="<% = objRs("phone_no1") %>" /></td>
	 <td><b>Phone Number2 :</b></td>
	 <td><input type="text" name="phoneno2" value="<% = objRs("phone_no2") %>" /></td>	 
	</tr>	
				
	<tr>
	 <td><b>Country:</b></td>
     <td>
	   <select name="country">
	   	<option value="">--Select--</option>
		<option <% If objRs("country") = "US" Then %> selected="selected" <% End If %> value="US">US</option>
		<option <% If objRs("country") = "Canada" Then %> selected="selected" <% End If %> value="Canada">Canada</option>
	   </select>
	 </td>
     <td><b>Company Name:</b></td>
     <td><input type="text" name="compName" value="<%= objRs("company_name") %>"/></td>
	</tr>    
	<tr>
     <td valign="top"><b>Company Address:</b></td>
     <td colspan="1"><textarea name="compAdd" rows="7" cols="22" ><%= objRs("company_add") %> </textarea></td>
      <td valign="top"><b>Address:</b></td>
     <td colspan="3"><textarea name="instAdd" rows="7" cols="22" ><%= objRs("inst_address") %> </textarea></td>
	</tr>
		
	<tr>
	 <td><b>Type Of User :</b></td>
	 <td>
	 	<select name="typeofuser">
			<option <% If objRs("typeofuser") = "Faculty" Then %> selected="selected" <% End If %> value="Faculty">Faculty</option>
			<option <% If objRs("typeofuser") = "Admin" Then %> selected="selected" <% End If %> value="Admin">Admin</option>
		</select>
	 </td>
	</tr>	

	<tr>
	 <td>&nbsp;</td>
	 <td colspan="3"><input type="submit" name="type" value="Edit Instructor" />&nbsp;<input type="reset" name="reset" value="Reset" /></td>
	</tr>	
	<tr>
	 <td colspan="4"><a href="6sigma_us_inst.asp?action=list" target="_blank">List of US Instructors</a></td>
	</tr>	
   </table>
   </form>
  </td>
 </tr>
<% objRs.Movenext
 Loop
 objRs.Close %>
 </table> 
</div>
<% ElseIf rqAction = "resetpwd" Then %>
<div style="border:dotted; width:20%"><br />
<form action="addEditDel6sigmaUsInst.asp" method="post" onsubmit="return Form_Validator1(this)">
<input type="hidden" name="instId" value="<% = rqInstId %>" />
<table border="0" cellpadding="5" cellspacing="0" align="center" width="60%">
 <tr>
  <td align="center" colspan="2" bgcolor="#EBEBEB"><b>Reset Password</b></td>
 </tr>
 <% Do Until objRs.Eof %>
 <input type="hidden" name="emailid1" value="<% = objRs("inst_emailid1") %>" />
 <input type="hidden" name="firstname" value="<% = objRs("firstname") %>" />
 <input type="hidden" name="lastname" value="<% = objRs("lastname") %>" />
 <tr>
  <td><b>Name:</b> </td><td><% = objRs("firstname") %>&nbsp;<% = objRs("lastname") %></td>
 </tr>
 <% objRs.Movenext
 	Loop 
	objRs.Close %> 
 <tr>
 	<td><b>Password:</b> </td><td><input type="password" name="pwd"  /></td>
 </tr>
 <tr>
 	<td>&nbsp;</td><td><input type="submit" name="type" value="Reset Password" /></td>
 </tr>
</table>
</form>
</div>
<% Else %>
<div>
<table border="1" cellpadding="5" cellspacing="0" align="center" width="60%">
 <tr>
  <td align="center" colspan="2">Add 6sigma Instructor</td>
 </tr>
 <tr>
  <td>
  <form name="addEditDel6sigmaUsInst" action="addEditDel6sigmaUsInst.asp" method="post" onsubmit="return Form_Validator(this)">
   <table border="0" cellpadding="5" cellspacing="0" width="100%">
	<tr>
	 <td><b>First Name :</b></td>
	 <td><input type="text" name="firstname" /></td>
	 <td><b>Last Name :</b></td>
	 <td><input type="text" name="lastname" /></td>
	</tr>	
	<tr>
	 <td><b>EmailId1 :</b></td>
	 <td><input type="text" name="emailid1" /></td>
	 <td><b>Password :</b></td>
	 <td><input type="password" name="pwd" /></td>
	</tr>	
	<tr>
	 <td><b>EmailId2 :</b></td>
	 <td><input type="text" name="emailid2" /></td>

	</tr>		
	<tr>
	 <td><b>Phone Number1 :</b></td>
	 <td><input type="text" name="phoneno1" /></td>
	 <td><b>Phone Number2 :</b></td>
	 <td><input type="text" name="phoneno2" /></td>	 
	</tr>	
	<tr>
	 <td><b>Country:</b></td>
     <td>
	   <select name="country">
	   	<option value="">--Select--</option>
		<option value="US">US</option>
		<option value="Canada">Canada</option>
	   </select>
	 </td>
     <td><b>Company Name:</b></td>
     <td><input type="text" name="compName"/></td>
	</tr> 	 
	<tr>
	 
     <td valign="top"><b>Company Address:</b></td>
     <td colspan="1"><textarea name="compAdd" rows="7" cols="22"></textarea></td>
     
	 <td valign="top"><b>Adderess:</b></td>
	 <td colspan="3"><textarea name="inst_address" rows="7" cols="24"></textarea></td>
	</tr>
	
	 <td><b>Type Of User :</b></td>
	 <td>
	 	<select name="typeofuser">
			<option value="Faculty">Faculty</option>
			<option value="Admin">Admin</option>
		</select>
	 </td>
	
	</tr>	
	<tr><td></td></tr>
	<tr>
	 <td>&nbsp;</td>
	 <td colspan="3"><input type="submit" name="type" value="Add Instructor" />&nbsp;<input type="reset" name="reset" value="Reset" /></td>
	</tr>	
	<tr>
	 <td colspan="4"><a href="6sigma_us_inst.asp?action=list" target="_blank">List of 6sigma US Instructors</a></td>
	</tr>	
   </table>
   </form>
  </td>
 </tr>
</table>
</div>
<% End If %>
<!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>
<% End If %>
