<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 'Written By : Priyanka'
 'Last UpaDated: 24/11/2010'
 'Description :'
 'Purpose : Insert/Edit/Update Course Details In DataBase'
 'This Page Comes From course.asp Page'
%>
<% 
   If Session("UserId")  = "" Then
     Response.Redirect("../login.asp")
   Else
%>
<!--#include virtual="/india/connection-PROJ.asp"-->
<%
'------------------------------------------------------'
'Insert New Course'
'------------------------------------------------------'

 'Declare The Variables'
 
 Dim rqEnrollUserId,rqType,rqEmail,rqCourseId
 Dim strQuery,Email,strEdit,CourseId
 Dim FirstName, LastName, Employeer, PhoneNo
 Dim rqFirstName, rqLastName, rqEmployeer, rqPhoneNo, rqAmount, Amount
 
 'Replace method
Function StrQuoteReplace(strValue)
StrQuoteReplace = Replace(strValue, "'", "''")
End Function 
 
 'Retrive The New Course Details From course.asp Page'

 rqEnrollUserId    =   Request.QueryString("enrollUserId")
 rqType            =   Request.QueryString("type")
 rqCourseId        =   Request.QueryString("courseId")

 
 
  Set Rs  = Server.CreateObject("ADODB.Recordset")
 

  
  'Retriving email id based on the id
  strQuery = "Select firstname, lastname, nameofemployeer, email, phoneno, amount from PROJITIL_enrolledusers  WHERE id = '"&rqEnrollUserId&"'"
  
  'Response.Write(strQuery)
  Rs.Open strQuery,Conn
 
  FirstName = Rs("firstname")
  LastName = Rs("lastname")
  Employeer = Rs("nameofemployeer")
  Email = Rs("email")
  PhoneNo = Rs("phoneno")
  Amount = Rs("amount")
  
  Rs.close()
  
  

  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Change classroom enrolled user details</title>
<link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
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
	   
 	    if (validate_required(changeEmail,"Please Enter  EmailId")==false)
 		     {changeEmail.focus();return false}

	   //Check To See If The  EmailId Correct Or Not   
	   
        if (echeck(changeEmail)==false)
 	         {changeEmail.focus();return false}

	   //Check To See If The  EmailId Field Is Balnk    
	   
 	    if (validate_required(amount,"Please Enter  Amount")==false)
 		     {amount.focus();return false}


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
          </span> ITILstudy Back Office</font></div></td>
    </tr>
    <tr>
      <td width="100px" valign="top" rowspan="20"><!--#include file="leftMenu.html"-->
      </td>
    </tr>
    <tr>
    <td>
    <form name="ChangeEmail" action="PROJITILupdateUserDet.asp?type=submit&enrollUserId=<% = rqEnrollUserId %>&courseId=<% = rqCourseId %>" method="post" onSubmit="return validate_form(this)">
<table border="0" cellpadding="4" cellspacing="4" width="50%" align="center">
<input type="hidden" name="enrollUserId" value="<% = rqEnrollUserId %>">
<input type="hidden" name="courseId" value="<% = rqCourseId %>">
<tr>
    <td width="30%"><b>First Name:</b></td>
    <td><input type="text" id="firstName" name="firstName" value="<% = FirstName %>" /></td>
  </tr>
  <tr>
    <td width="30%"><b>Last Name:</b></td>
    <td><input type="text" id="lastName" name="lastName" value="<% = LastName %>" /></td>
  </tr>
  <tr>
    <td width="30%"><b>Name of Employeer:</b></td>
    <td><input type="text" id="employeer" name="employeer" value="<% = Employeer %>"  /></td>
  </tr>
 <tr>
    <td width="30%"><b>Phone No.:</b></td>
    <td><input type="text" id="phoneNo" name="phoneNo" value="<% = PhoneNo %>" /></td>
  </tr>
  <tr>
    <td width="30%"><b>EmailId:</b></td>
    <td><input type="text" id="changeEmail" name="changeEmail" value="<% = Email %>" /></td>
  </tr>
  <tr>
    <td width="30%"><b>Amount:</b></td>
    <td><input type="text" id="amount" name="amount" value="<% = Amount %>" /></td>
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


 rqEmail           =   Request.Form("changeEmail")
 CourseId        =   Request.Form("courseId")
 rqFirstName       =   Request.Form("firstName")
 rqLastName       =   Request.Form("lastName")
 rqEmployeer      =   Request.Form("employeer")
 rqPhoneNo      =   Request.Form("phoneNo")
 rqAmount      =   Request.Form("amount")
 
 strEdit = "UPDATE PROJITIL_enrolledusers SET"
 strEdit = strEdit & " firstname = '" & StrQuoteReplace(rqFirstName )& "',"
 strEdit = strEdit & " lastname = '" & StrQuoteReplace(rqLastName)& "',"
 strEdit = strEdit & " nameofemployeer = '" & rqEmployeer & "',"
 strEdit = strEdit & " phoneno = '" & rqPhoneNo & "',"
 strEdit = strEdit & " email = '" & rqEmail & "',"
 strEdit = strEdit & " amount = '" & rqAmount & "'" 
 strEdit = strEdit & " WHERE id = '" & rqEnrollUserId &"'"
 
 Rs.Open strEdit,Conn
 response.Write(strEdit)
 Session("message") = "You have successfully updated user details"
 Response.Redirect("ITIL-courses.asp?courseId="&CourseId)

End If


Conn.Close
End If
%>