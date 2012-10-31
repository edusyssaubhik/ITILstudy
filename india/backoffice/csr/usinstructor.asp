<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 'Written By : Bharath'
 'Last UpaDated: 11/10/2007'
 'Description :'
 'Purpose : Add/Edit/Delete Course Details And EnrolledUser Details'
%>
<% If Session("UserId") <> "" Then %>
<!--#include virtual="/india/connection.asp"-->
<%
'======================================================='
'Written By : Bharath'
'Last UpDated : 18/08/2009'
'Description :'
'This page is adding calls to the database'
'US BackOffice'
'======================================================='

'Declare the local variables'
Dim strCity, objRs, objRs1
Dim arrAllCities, cityNumRows
Dim cityFirstRow, cityLastRow
Dim cityRowCounter
Dim rqAction
Dim strListOfInst, strInst
Dim rqInstId

'Creatting the record set'
Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")

'Retrive the action'
rqAction = Request.QueryString("action")
rqInstId = Request.QueryString("instId")

If rqAction = "list" Then

	strListOfInst = "SELECT * FROM ITIL_instructor"
	
	objRs.Open strListOfInst,ConnObj

ElseIf rqAction = "edit" Then 

	strInst = "SELECT * FROM ITIL_instructor WHERE instid = '"& rqInstId &"'"
	
	objRs.Open strInst,ConnObj
	
ElseIf rqAction = "resetpwd" Then

	strInst = "SELECT firstname, lastname, pwd, emailid1 FROM ITIL_instructor WHERE instid = '"& rqInstId &"'"
	
	objRs.Open strInst,ConnObj

End If 

	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title>Add Instructor</title>
 <link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">

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

 	    //if (validate_required(emailid2,"Please enter emailid2")==false)
 		 //    {emailid2.focus();return false}

       // if (echeck(emailid2)==false)
 	    //     {emailid2.focus();return false}
			 
 	    if (validate_required(phoneno1,"Please enter phone number1")==false)
 		     {phoneno1.focus();return false}

 	    if (validate_number(phoneno1,"Phone number1 is not a numeral")==false)
 	         {phoneno1.focus();return false}

 	   // if (validate_number(phoneno2,"Phone number2 is not a numeral")==false)
 	   //      {phoneno2.focus();return false}

		if (validate_required(country,"Please select country")==false)
 		     {country.focus();return false} 
			 
 	    if (validate_required(address1,"Please enter address1")==false)
 		     {address1.focus();return false} 	

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
<script type="text/javascript" src="combo.js"></script>
<script type="text/javascript" src="calendar/zapatec.js"></script><!-- Custom includes --><!-- import the calendar script -->
<script type="text/javascript" src="calendar/calendar.js"></script><!-- import the language module -->
<script type="text/javascript" src="calendar/calendar-en.js"></script><!-- other languages might be available in the lang directory; please check-->
<link href="calendar/template.css" rel="stylesheet" type="text/css">
<link href="calendar/system.css" rel="stylesheet" type="text/css">
</head>
<body><div id="htMap">
<table border="1" class="dbborder" height="550" width="1000px" cellspacing="0">
 <tr>
   <td colspan="3" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% =Session("country") %></span> ITILstudy Back Office</font></div>
 </tr>
 <tr>
  <td width="100px" valign="top" rowspan="22">
    <!--#include file="leftMenu.html"-->
  </td>
 </tr>
 <% 
 'If Session("typeofuser") <> "CSR" Then Only See The Add Instructor on the top'
 If Session("typeofuser") <> "CSR" Then 
 %>
 <tr>
  <td height="25"><a href="instructor.asp?type=add">Add Instructor</a></td>
 </tr>
 <% End If %>

<% If rqAction = "list" Then %>
<tr>
<td>
 <table border="1" cellpadding="5" cellspacing="0" width="100%">
  <tr>
   <td><b>First Name</b></td>
   <td><b>Last Name</b></td>
   <td><b>EmailId1</b></td>
   <td><b>EmailId2</b></td>
   <td><b>EmailId3</b></td>
   <td><b>Designation</b></td>
   <td><b>Phone Number1</b></td>
   <td><b>Phone Number2</b></td>
   <td><b>Fax Number</b></td>
   <td><b>Adderess1</b></td>
   <td><b>Adderess2</b></td>
   <td><b>Type Of User</b></td>
   <td><b>Country</b></td>
   <td><b>Company Name</b></td>
   <td><b>Company Address</b></td>
   <td><b>Edit</b></td>
   <td><b>Reset Password</b></td>
   <% If Session("USBUserId") = "edusysbharath@gmail.com" Then %>
   <td><b>Delete</b></td>
   <% End If %>
  </tr>
  <% Do Until objRs.EOF %>
  <tr>
   <td><% = objRs("firstname") %></td>
   <td><% = objRs("lastname") %></td>
   <td><% = objRs("emailid1") %></td>
   <td><% = objRs("emailid2") %></td>
   <td><% = objRs("emailid3") %></td>
   <td><% = objRs("designation") %></td>
   <td><% = objRs("phoneno1") %></td>
   <td><% = objRs("phoneno2") %></td>
   <td><% = objRs("faxno") %></td>
   <td><% = objRs("address1") %></td>
   <td><% = objRs("address2") %></td>
   <td><% = objRs("typeofuser") %></td>
   <td><% = objRs("country") %></td>
   <td><% = objRs("comp_name") %></td>
   <td><% = objRs("comp_addr") %></td>
   <td><a href="usinstructor.asp?action=edit&instId=<% = objRs("instid") %>">Edit</a></td>
   <td><a href="usinstructor.asp?action=resetpwd&instId=<% = objRs("instid") %>">Reset Password</a></td>
   <% If Session("USBUserId") = "edusysbharath@gmail.com" Then %>   
   <td><a href="addusinst.asp?action=delete&delInstId=<% = objRs("instid") %>">Delete</a></td>
   <% End If %>
  </tr>  
  <% objRs.Movenext
     Loop
	 objRs.Close %>
 </table>
</td></tr>

<% ElseIf rqAction = "edit"  Then %>
<tr>
<td>
<table border="1" cellpadding="5" cellspacing="0" align="center" width="60%">
 <tr>
  <td align="center" colspan="2">Edit Instructor</td>
 </tr>
 <tr>
  <td>
  <form name="addinstructor" action="addusinst.asp" method="post" onsubmit="return Form_Validator(this)">
   <% Do Until objRs.EOF %>
   <input type="hidden" name="instId" value="<% = objRs("instid") %>" />
   <table border="0" cellpadding="5" cellspacing="0" width="100%">
	<tr>
	 <td><b>First Name :</b></td>
	 <td><input type="text" name="firstname" value="<% = objRs("firstname") %>" /></td>
	 <td><b>Last Name :</b></td>
	 <td><input type="text" name="lastname" value="<% = objRs("lastname") %>" /></td>
	</tr>	
	<tr>
	 <td><b>EmailId1 :</b></td>
	 <td><input type="text" name="emailid1" value="<% = objRs("emailid1") %>" /></td>
     <td colspan="2">&nbsp;</td>
	</tr>	
	<tr>
	 <td><b>EmailId2 :</b></td>
	 <td><input type="text" name="emailid2" value="<% = objRs("emailid2") %>" /></td>
	 <td><b>EmailId3 :</b></td>
	 <td><input type="text" name="emailid3" value="<% = objRs("emailid3") %>" /></td>
	</tr>		
	<tr>
	 <td><b>Phone Number1 :</b></td>
	 <td><input type="text" name="phoneno1" value="<% = objRs("phoneno1") %>" /></td>
	 <td><b>Phone Number2 :</b></td>
	 <td><input type="text" name="phoneno2" value="<% = objRs("phoneno2") %>" /></td>	 
	</tr>	
	<tr>
	 <td><b>Fax Number :</b></td>
	 <td><input type="text" name="faxno" value="<% = objRs("faxno") %>" /></td>
	 <td><b>Designation:</b></td>
	 <td><input type="text" name="designation" value="<% = objRs("designation") %>" /></td>	 
	</tr>			
	<tr>
	 <td><b>Country:</b></td>
     <td>
	   <select name="country">
	   	<option value="">--Select--</option>
		<option <% If objRs("country") = "US" Then %> selected="selected" <% End If %> value="US">US</option>
		<option <% If objRs("country") = "Canada" Then %> selected="selected" <% End If %> value="Canada">Canada</option>
		<option  <% If objRs("country") = "United Kingdom" Then %> selected="selected" <% End If %> value="United Kingdom">United Kingdom</option>
        <option  <% If objRs("country") = "UAE" Then %> selected="selected" <% End If %> value="UAE">UAE</option>
        <option  <% If objRs("country") = "Singapore" Then %> selected="selected" <% End If %> value="Singapore">Singapore</option>
        <option  <% If objRs("country") = "India" Then %> selected="selected" <% End If %> value="India">India</option>
        <option  <% If objRs("country") = "Germany" Then %> selected="selected" <% End If %> value="Germany">Germany</option>
		<option  <% If objRs("country") = "Global" Then %> selected="selected" <% End If %> value="Global">Global</option>			
	   </select>
	 </td>
     <td><b>Company Name:</b></td>
     <td><input type="text" name="compName" value="<%= objRs("comp_name") %>"/></td>
	</tr>    
	<tr>
	 <td valign="top"><b>Adderess1 :</b></td>
	 <td colspan="1"><textarea name="address1" rows="7" cols="24"><% = objRs("address1") %></textarea></td>
     <td valign="top"><b>Company Address:</b></td>
     <td colspan="3"><textarea name="compAdd" rows="7" cols="22" ><%= objRs("comp_addr") %> </textarea></td>
	</tr>
	<tr>
	 <td valign="top"><b>Adderess2 :</b></td>
	 <td colspan="3"><textarea name="address2" rows="7" cols="24"><% = objRs("address2") %></textarea></td>
	</tr>	
	<tr>
	 <td><b>Type Of User :</b></td>
	 <td>
	 	<select name="typeofuser">
			<option <% If objRs("typeofuser") = "Faculty" Then %> selected="selected" <% End If %> value="Faculty">Faculty</option>
			<option <% If objRs("typeofuser") = "Admin" Then %> selected="selected" <% End If %> value="Admin">Admin</option>
			<option <% If objRs("typeofuser") = "AEXP" Then %> selected="selected" <% End If %> value="AEXP">AEXP</option>
		</select>
	 </td>
	</tr>	
	<tr>
	 <td>&nbsp;</td>
	 <td colspan="3"><input type="submit" name="type" value="Edit Instructor" />&nbsp;<input type="reset" name="reset" value="Reset" /></td>
	</tr>	
	<tr>
	 <td colspan="4"><a href="usinstructor.asp?action=list" target="_blank">List of US Instructors</a></td>
	</tr>	
   </table>
   </form>
  </td>
 </tr>
<% objRs.Movenext
 Loop
 objRs.Close %>
 </table> 
</td></tr>
<% ElseIf rqAction = "resetpwd" Then %>
<tr><td>
<div style="border:dotted; width:20%"><br />
<form action="addusinst.asp" method="post" onsubmit="return Form_Validator1(this)">
<input type="hidden" name="instId" value="<% = rqInstId %>" />
<table border="0" cellpadding="5" cellspacing="0" align="center" width="60%">
 <tr>
  <td align="center" colspan="2" bgcolor="#EBEBEB"><b>Reset Password</b></td>
 </tr>
 <% Do Until objRs.Eof %>
 <input type="hidden" name="emailid1" value="<% = objRs("emailid1") %>" />
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
</td></tr>
<% Else %>
<tr><td>
<table border="1" cellpadding="5" cellspacing="0" align="center" width="60%">
 <tr>
  <td align="center" colspan="2">Add Instructor</td>
 </tr>
 <tr>
  <td>
  <form name="addinstructor" action="addusinst.asp" method="post" onsubmit="return Form_Validator(this)">
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
	 <td><b>EmailId3 :</b></td>
	 <td><input type="text" name="emailid3" /></td>
	</tr>		
	<tr>
	 <td><b>Phone Number1 :</b></td>
	 <td><input type="text" name="phoneno1" /></td>
	 <td><b>Phone Number2 :</b></td>
	 <td><input type="text" name="phoneno2" /></td>	 
	</tr>	
	<tr>
	 <td><b>Fax Number :</b></td>
	 <td><input type="text" name="faxno" /></td>
 	 <td><b>Designation:</b></td>
	 <td><input type="text" name="designation" /></td>	 
	</tr> 			
	<tr>
	 <td><b>Country:</b></td>
     <td>
	   <select name="country">
	   	<option value="">--Select--</option>
		<option value="US">US</option>
		<option value="Canada">Canada</option>
        <option  value="UAE">UAE</option>
        <option  value="Singapore">Singapore</option>
		<option value="United Kingdom">United Kingdom</option>
        <option  value="India">India</option>
        <option  value="Germany">Germany</option>
		<option value="Global">Global</option>		
	   </select>
	 </td>
     <td><b>Company Name:</b></td>
     <td><input type="text" name="compName"/></td>
	</tr> 	 
	<tr>
	 <td valign="top"><b>Adderess1 :</b></td>
	 <td colspan="1"><textarea name="address1" rows="7" cols="24"></textarea></td>
     <td valign="top"><b>Company Address:</b></td>
     <td colspan="3"><textarea name="compAdd" rows="7" cols="22"></textarea></td>
	</tr>
	<tr>
	 <td valign="top"><b>Adderess2 :</b></td>
	 <td colspan="3"><textarea name="address2" rows="7" cols="24"></textarea></td>
	</tr>	
	<tr>
	 <td><b>Type Of User :</b></td>
	 <td>
	 	<select name="typeofuser">
			<option value="Faculty">Faculty</option>
			<option value="Admin">Admin</option>
			<option value="AEXP">AEXP</option>
		</select>
	 </td>
	</tr>	
	<tr>
	 <td>&nbsp;</td>
	 <td colspan="3"><input type="submit" name="type" value="Add Instructor" />&nbsp;<input type="reset" name="reset" value="Reset" /></td>
	</tr>	
	<tr>
	 <td colspan="4"><a href="usinstructor.asp?action=list" target="_blank">List of US Instructors</a></td>
	</tr>	
   </table>
   </form>
  </td>
 </tr>
</table>
</td></tr>
</div>
<% End If %>
<!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>
<% End If %>
