<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Bharath'
'Created Date : 17/02/2012'
'Modified By : Bharath'
'Modified Date : 17/02/2012'
'Description :'
'Purpose : Insert/Edit/Update Course Details In DataBase'
'This Page Comes From PRINCE2-BCourse.asp Page'
'======================================================='
%>
<% 
  If Session("UserId") = "" Then
     Response.Redirect("/India/backOffice/login.asp")
   Else
%>
<!--#include virtual="/India/connection_global.asp"-->
<%
'------------------------------------------------------'
'Insert New Course'
'------------------------------------------------------'

 'Declare The Variables'
 
 Dim rqEnrollUserId,rqType,rqEmail,rqCourseId
 Dim strQuery,Email,strEdit,CourseId, Rs
 Dim FirstName, LastName, Employeer, PhoneNo
 Dim rqFirstName, rqLastName, rqEmployeer, rqPhoneNo 
 Dim Street ,City , State1,PostalCode,Country
 Dim rqStreet ,rqCity , rqState1, rqPostalCode ,rqCountry 
 
 'Retrive The New Course Details From PRINCE2-BCourse.asp Page'

 rqEnrollUserId    =   Request.QueryString("enrolluserid")
 rqType            =   Request.QueryString("type")
 rqCourseId        =   Request.QueryString("courseid")
 rqEmail           =   Request.Form("changeEmail")
 CourseId        =   Request.Form("courseId")
 rqFirstName       =   Request.Form("firstName")
 rqLastName       =   Request.Form("lastName")
 rqEmployeer      =   Request.Form("employeer")
 rqPhoneNo      =   Request.Form("phoneNo")
 rqStreet     =   Replace(Request.Form("changeStreet"),"'","''")
 rqCity      =    Replace(Request.Form("changeCity"),"'","''")
 rqState1      =   Replace(Request.Form("changeState"),"'","''")
 rqPostalCode      =   Request.Form("changePostalCode")
 rqCountry      =   Request.Form("changeCountry")
 
 
  Set Rs  = Server.CreateObject("ADODB.Recordset")
 

  
  'Retriving email id based on the id
  strQuery = "Select firstname, lastname, nameofemployeer, email, phoneno,street,city,state1,postalCode,country from prince2_enrolledusers  WHERE id = '"&rqEnrollUserId&"'"
  
  'Response.Write(strQuery)
  Rs.Open strQuery,ConnObj
 
  FirstName = Rs("firstname")
  LastName = Rs("lastname")
  Employeer = Rs("nameofemployeer")
  Email = Rs("email")
  PhoneNo = Rs("phoneno")
  Street = Rs("street")
  City = Rs("city")
  State1 = Rs("state1")
  PostalCode = Rs("postalCode")
  Country = Rs("country")
  
  Rs.close()
  
  

  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Change EmailID</title>
<link href="/India/css/pagestyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="calendar/zapatec.js"></script>
<script type="text/javascript" src="calendar/calendar.js"></script>
<script type="text/javascript" src="calendar/calendar-en.js"></script>
<link href="calendar/template.css" rel="stylesheet" type="text/css">
<link href="calendar/system.css" rel="stylesheet" type="text/css">
<script language ="javascript">

// Function To Validate Fields And Display An Alert Message If Any Field Is Empty.

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

 
// Function To Validate The Form And Display An Alert Message If Any Field Is Found Empty.

function validate_form(thisform)
{
    with (thisform)
    {
     
	 
       //Check To See If The  First Name Field Is Balnk    
	   
 	    if (validate_required(firstName,"Please Enter  First Name")==false)
 		     {firstName.focus();return false}	
			 
	     //Check To See If The  First Name Field Is Balnk    
	   
 	    if (validate_required(lastName,"Please Enter Last Name")==false)
 		     {lastName.focus();return false}	
			 
		    //Check To See If The Name of Emlpoyeer Field Is Balnk    
	   
 	    if (validate_required(employeer,"Please Enter Name of Emlpoyeer")==false)
 		     {employeer.focus();return false}	
			   
		 //Check To See If The  Phone Number Field Is Balnk    
	   
 	    if (validate_required(phoneNo,"Please Enter Phone Number")==false)
 		     {phoneNo.focus();return false}		   
		
	   //Check To See If The  EmailId Field Is Balnk    
	   
 	    if (validate_required(changeEmail,"Please Enter EmailId")==false)
 		     {changeEmail.focus();return false}
			 
	   //Check To See If The  EmailId Correct Or Not   
	   
        if (echeck(changeEmail)==false)
 	         {changeEmail.focus();return false}

			 
	  //Check To See If The  EmailId Field Is Balnk    
	   
 	    if (validate_required(changeStreet,"Please Enter Street")==false)
 		     {changeStreet.focus();return false}
			 
	  //Check To See If The  EmailId Field Is Balnk    
	   
 	    if (validate_required(changeCity,"Please Enter City")==false)
 		     {changeCity.focus();return false}
			 
	 //Check To See If The  EmailId Field Is Balnk    
	   
 	    if (validate_required(changeState,"Please Enter State")==false)
 		     {changeState.focus();return false}
			 
	//Check To See If The  EmailId Field Is Balnk    
	   
 	    if (validate_required(changePostalCode,"Please Enter PostalCode")==false)
 		     {changePostalCode.focus();return false}


	}


}
</script>
</head>
<body>
<div id="htMap">
  <table border="1" width="1470px" cellspacing="0">
    <tr>
      <td colspan="3" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300">
          <% = Session("country") %>
          </span> PMstudy Back Office</font></div></td>
    </tr>
    <tr>
      <td width="100px" valign="top" rowspan="20"><!--#include file="leftMenu.html"-->
      </td>
    </tr>
    <tr>
    <td>
    <form name="ChangeEmail" action="PRINCE2-UpdateUserDet.asp?type=submit&enrollUserId=<% = rqEnrollUserId %>&courseId=<% = rqCourseId %>" method="post" onSubmit="return validate_form(this)">
<table border="0" cellpadding="4" cellspacing="4" width="50%" align="center">
<input type="hidden" name="enrollUserId" value="<% = rqEnrollUserId %>">
<input type="hidden" name="courseId" value="<% = rqCourseId %>">
<tr>
    <td width="30%"><b>First Name:</b></td>
    <td><input type="text" id="firstName" name="firstName" value="<% = FirstName %>" ></input></td>
  </tr>
  <tr>
    <td width="30%"><b>Last Name:</b></td>
    <td><input type="text" id="lastName" name="lastName" value="<% = LastName %>" ></input></td>
  </tr>
  <tr>
    <td width="30%"><b>Name of Employeer:</b></td>
    <td><input type="text" id="employeer" name="employeer" value="<% = Employeer %>" ></input></td>
  </tr>
 <tr>
    <td width="30%"><b>Phone No.:</b></td>
    <td><input type="text" id="phoneNo" name="phoneNo" value="<% = PhoneNo %>" ></input></td>
  </tr>
  <tr>
    <td width="30%"><b>EmailId:</b></td>
    <td><input type="text" id="changeEmail" name="changeEmail" value="<% = Email %>" ></input></td>
  </tr>
   <tr>
    <td width="30%"><b>Street:</b></td>
    <td><input type="text" id="changeStreet" name="changeStreet" value="<% = Street %>" size="50%" ></input></td>
  </tr>
   <tr>
    <td width="30%"><b>City:</b></td>
    <td><input type="text" id="changeCity" name="changeCity" value="<% = City %>"  size="50%"></input></td>
  </tr>
   <tr>
    <td width="30%"><b>State:</b></td>
    <td><input type="text" id="changeState" name="changeState" value="<% = State1 %>" size="50%" ></input></td>
  </tr>
   <tr>
    <td width="30%"><b>PostalCode:</b></td>
    <td><input type="text" id="changePostalCode" name="changePostalCode" value="<% = PostalCode %>" ></input></td>
  </tr>
  
  <tr>
  <td></td>
  <td><input type="submit" value="Update" id="submit" name="submit" /></td>
  </tr>
</table>
</form>
</td>
</tr>
</table>
</div>
</body>
<%


If rqType = "submit" Then

 strEdit = "UPDATE prince2_enrolledusers SET"
 strEdit = strEdit & " firstname = '" & rqFirstName  & "',"
 strEdit = strEdit & " lastname = '" & rqLastName  & "',"
 strEdit = strEdit & " nameofemployeer = '" & rqEmployeer  & "',"
 strEdit = strEdit & " phoneno = '" & rqPhoneNo  & "',"
 strEdit = strEdit & " email = '" & rqEmail  & "',"
 strEdit = strEdit & " street = '" & rqStreet  & "',"
 strEdit = strEdit & " city = '" & rqCity  & "',"
 strEdit = strEdit & " state1 = '" & rqState1  & "',"
 strEdit = strEdit & " postalCode = '" & rqPostalCode  & "'"
 strEdit = strEdit & " WHERE id = '" & rqEnrollUserId &"'"
 
 Rs.Open strEdit,ConnObj
response.Write(strEdit)
 Session("message") = "You Have Successfully Updated the details"
Response.Redirect("PRINCE2-BCourses.asp?courseId="&CourseId)

End If


ConnObj.Close
End If
%>