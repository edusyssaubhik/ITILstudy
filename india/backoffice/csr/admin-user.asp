<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 'Written By : Bharath'
 'Last UpaDated: 04/10/2007'
 'Description :'
 'Purpose : Add/Edit/Delete Users Page'
%>
<!--#include virtual="/india/connection.asp"-->

<% If not  Session("UserId") = "" Then %>
<%
 'Declare The Variables'
 Dim strQuery
 Dim username
 Dim rqType,rqPage,rqRow
 Dim arrAllQueries,UserId
 Dim firstRow,lastRow,numRows,rowcounter
 Dim rqEdit
 Dim strQuery1,Rs1
 
'Displaying The Messages After Add,Edit and Delete User'

 Dim message
 message = Session("message")
 Session("message") = ""

 Dim message1
 message1 = Session("message1")
 Session("message1") = "" 

'Retrive The Types.It Means Tasks'

 rqType = Request.Querystring("type")

'Retrive The Below Two are Pagination Purpose'

 rqPage = Request.QueryString("page")
 rqRow  = Request.QueryString("row")
 

 Set Rs1 = Server.CreateObject("ADODB.Recordset")

'Sql Query For Retrive The All Users '

 strQuery = "SELECT * FROM Accesstable ORDER BY USERID"

 Rs.Open strQuery,Conn

'Pagination'

  If Not Rs.EOF Then
    arrAllQueries = Rs.getrows
    Session("arrAllQueries") = arrAllQueries
    firstRow = 0
    lastRow = 9
    numRows = Ubound(arrAllQueries,2)
    If lastRow > numRows Then
       lastRow = numRows
    End If
  End If
  
If rqPage = "next" Then

   arrAllQueries = Session("arrAllQueries")
   numRows = Ubound(arrAllQueries,2)

   firstRow = rqRow + 1
   lastRow = firstRow + 9

   If firstRow >= numRows Then
      firstRow = rqRow + 1
      lastRow = firstRow + 9
   End If

   If firstRow < 0 Then
      firstRow = 0
   End If

   If lastRow > numRows Then
      lastRow = numRows
   End If

End If

If rqPage = "previous" Then

   arrAllQueries = Session("arrAllQueries")
   numRows = Ubound(arrAllQueries,2)

   lastRow = rqRow - 1
   firstRow = lastRow - 9

   If firstRow =< 0 Then
      firstRow = 0
      lastRow = firstRow + 9
   End If

   If lastRow > numRows Then
      lastRow = numRows
   End If

End If

'If You Click Edit In This Page That Will Come Here'

rqEdit = Request.Querystring("editUserId")


 strQuery1  = "SELECT * FROM Accesstable WHERE GID = '" & rqEdit & "'"

 Rs1.Open strQuery1,Conn

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Users</title>
<link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
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

 function validate_special(field,alerttxt)
 {
 	var iChars = "!#$%^&*@()+=-[]\\\';,{}|\":<>?";

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
  	var iChars = "0123456789";

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
function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}
}

// Function To Validate passwordfield And Display An Alert Message If The Field Is Empty.

function password_check(passwordfield,passwordalerttxt)
{
	with(passwordfield)
	{
		if(passwordfield.value.length < 6 )
		{alert(passwordalerttxt);return false}
		else {return true}
	}
}

// Function To Validate confirm_password_field And Display An Alert Message If The Field Is Empty.

function confirm_password_check(confirm_password_field,password_check,confirm_password_alerttxt)
{
	with(confirm_password_field,password_check)
	{
		if(confirm_password_field.value != password_check.value)
		{alert(confirm_password_alerttxt);return false}
		else {return true}
	}
}

// Function To Validate The Form And Display An Alert Message If Any Field Is Found Empty.

function validate_form(thisform)
{
    with (thisform)
    {
     
	   //Check To See If The First Name Field Is Balnk     
		
		if (validate_required(firstname,"Please enter the First Name")==false)
			  {firstname.focus();return false}
  
       //Check To See If The First Name Have Special Characters
  
        if (validate_special(firstname," FirstName Has Special Characters. \n Please remove them and try again")==false)
 		      {firstname.focus();return false}

	   //Check To See If The First Name Have Numerals 

        if (validate_noNumber(firstname," FirstName Has Numerals")==false)
 	          {firstname.focus();return false}

	   //Check To See If The Last Name Field Is Balnk     
	   
		if (validate_required(lastname,"Please enter the Last Name")==false)
			  {lastname.focus();return false}

	   //Check To See If The Last Name Have Special Characters
	   
 	    if (validate_special(lastname,"LastName Has Special Characters. \n Please remove them and try again")==false)
 	 		  {lastname.focus();return false}

	   //Check To See If The Last Name Have Numerals
	   
 	    if (validate_noNumber(lastname,"LastName Has Numerals")==false)
 		      {lastname.focus();return false}

	   //Check To See If The User Name Field Is Balnk    
	   
		if (validate_required(userid,"Please enter the User Name")==false)
			  {userid.focus();return false}

	   //Check To See If The Password Field Is Balnk    
	   
		if (validate_required(password,"Please enter the Password")==false)
			  {password.focus();return false}

	   //Check To See If The Password Have Mininmum Six Characters Or Not    
	   
		if (password_check(password,"Password must contain at least six characters!")==false)
			  {password.focus();return false}

	   //Check To See If The Confirm Password Field Is Balnk    
	   
		if (validate_required(confirmpassword,"Please enter the ConfirmPassword")==false)
			  {confirmpassword.focus();return false}

	   //Check To See If The Password And Confirm Password Equal Or Not    
	   
		if (confirm_password_check(confirmpassword,password,"Password and ConfirmPassword does not match")==false)
			  {confirmpassword.focus();return false}

	   //Check To See If The Phone Number1 Field Is Balnk    
	   
 	    if (validate_required(phoneno1,"Please enter Primary phone number")==false)
 		     {phoneno1.focus();return false}

	   //Check To See If The Phone Number1 Have Special Characters    
	   
        if (validate_special(phoneno1,"Your Primary Phone Number Have special characters")==false)
 	 		 {phoneno1.focus();return false}

	   //Check To See If The Phone Number1 Have Numerals    
	   
 	    if (validate_number(phoneno1,"Primary Phone number is not a numeral")==false)
 	         {phoneno1.focus();return false}

	   //Check To See If The Phone Number2 Field Is Balnk    
	   
 	    if (validate_required(phoneno2,"Please enter Secondary phone number")==false)
 		     {phoneno2.focus();return false}

	   //Check To See If The Phone Number2 Have Special Characters    
	   
        if (validate_special(phoneno2,"YOur Secondary Phone Number Have special characters")==false)
 	 		 {phoneno2.focus();return false}

	   //Check To See If The Phone Number2 Have Numerals    
	   
 	    if (validate_number(phoneno2,"Secondary phone number is not a numeral")==false)
 	         {phoneno2.focus();return false}

	   //Check To See If The Official EmailId Field Is Balnk    
	   
 	    if (validate_required(officialemailid,"Please Enter Official EmailId")==false)
 		     {officialemailid.focus();return false}

	   //Check To See If The Official EmailId Correct Or Not   
	   
        if (echeck(officialemailid)==false)
 	         {officialemailid.focus();return false}

	   //Check To See If The Personal EmailId Field Is Balnk    
	   
 	    if (validate_required(personalemailid,"Please Enter Personal EmailId")==false)
 		     {personalemailid.focus();return false}

	   //Check To See If The Personal EmailId Correct Or Not
	   
        if (echeck(personalemailid)==false)
 	         {personalemailid.focus();return false}

	}

	  //Check To See If The TypeOfUser Selected OR Not
	   
      if (thisform.typeofuser.selectedIndex == 0)
	   {
	     alert("Please Select the Type Of User");
	     thisform.typeofuser.focus();
	     return (false);
   }

}

//Function To Validate Edit Form

function validate_form1(thisform)
{
    with (thisform)
	    {
	   
	       //Check To See If The First Name Field Is Balnk 
	   
			if (validate_required(editfirstname,"Please enter the First Name")==false)
				  {editfirstname.focus();return false}

           //Check To See If The First Name Have Special Characters
	   
	        if (validate_special(editfirstname," FirstName Has Special Characters. \n Please remove them and try again")==false)
	 		      {editfirstname.focus();return false}

	       //Check To See If The First Name Have Numerals 
	   
	        if (validate_noNumber(editfirstname," FirstName Has Numerals")==false)
	 	          {editfirstname.focus();return false}

	       //Check To See If The Last Name Field Is Balnk  
	   
			if (validate_required(editlastname,"Please enter the Last Name")==false)
				  {editlastname.focus();return false}

	       //Check To See If The Last Name Have Special Characters
	   
	 	    if (validate_special(editlastname,"LastName Has Special Characters. \n Please remove them and try again")==false)
	 	 		  {editlastname.focus();return false}

	       //Check To See If The Last Name Have Numerals
	   
	 	    if (validate_noNumber(editlastname,"LastName Has Numerals")==false)
	 		      {editlastname.focus();return false}

	       //Check To See If The Password Field Is Balnk  
	   
			if (validate_required(editpassword,"Please enter the Password")==false)
				  {editpassword.focus();return false}

   	       //Check To See If The Password Have Mininmum Six Characters Or Not 
		   
			if (password_check(editpassword,"Password must contain at least six characters!")==false)
				  {editpassword.focus();return false}

	       //Check To See If The Confirm Password Field Is Balnk   
	   
			if (validate_required(editconfirmpassword,"Please enter the ConfirmPassword")==false)
				  {editconfirmpassword.focus();return false}

	       //Check To See If The Password And Confirm Password Equal Or Not  
	   
			if (confirm_password_check(editconfirmpassword,editpassword,"Password and ConfirmPassword does not match")==false)
				  {editconfirmpassword.focus();return false}

          //Check To See If The Phone Number1 Field Is Balnk   
		  
			if (validate_required(editphoneno1,"Please enter Primary phone number")==false)
				 {editphoneno1.focus();return false}

          //Check To See If The Phone Number1 Have Special Characters
		 
			if (validate_special(editphoneno1,"Your Primary Phone Number Have special characters")==false)
				 {editphoneno1.focus();return false}

	      //Check To See If The Phone Number1 Have Numerals 
	   
			if (validate_number(editphoneno1,"Primary Phone number is not a numeral")==false)
				 {editphoneno1.focus();return false}

	      //Check To See If The Phone Number2 Field Is Balnk   
	   
	 	    if (validate_required(editphoneno2,"Please enter Secondary phone number")==false)
	 		     {editphoneno2.focus();return false}

         //Check To See If The Phone Number2 Have Special Characters  
		 
	        if (validate_special(editphoneno2,"Your Secondary Phone Number Have special characters")==false)
	 	 		 {editphoneno2.focus();return false}

	     //Check To See If The Phone Number2 Have Numerals   
		 
	 	    if (validate_number(editphoneno2,"Secondary phone number is not a numeral")==false)
	 	         {editphoneno2.focus();return false}

	    //Check To See If The Official EmailId Field Is Balnk   
		
	 	    if (validate_required(editofficialemailid,"Please Enter Official EmailId")==false)
	 		     {editofficialemailid.focus();return false}

	    //Check To See If The Official EmailId Correct Or Not  
	   
	        if (echeck(editofficialemailid)==false)
	 	         {editofficialemailid.focus();return false}

	    //Check To See If The Personal EmailId Field Is Balnk    
	   
	 	    if (validate_required(editpersonalemailid,"Please Enter Personal EmailId")==false)
	 		     {editpersonalemailid.focus();return false}

	    //Check To See If The Personal EmailId Correct Or Not
	   
	        if (echeck(editpersonalemailid)==false)
	 	         {editpersonalemailid.focus();return false}

	}
}
</script>
</head>
<body><div id="htMap">
<table border="1" width="1000" height="500" cellpadding="2" cellspacing="0" class="dbborder" >
 <tr>
   <td colspan="9" height="35"><div align="center"><strong>WELCOME TO ITILSTUDY BACKOFFICE OPERATIONS</strong></div>
 </tr>
 <tr>
   <td width="100px" valign="top" rowspan="22">
    <!--#include file="leftMenu.html"-->
   </td>
   <td height="25"><a href="admin-user.asp?type=add">Add User</a></td></tr>
   <!-- If You Click Add User In This Page That Will Come Here -->
   <% if rqType = "add"  Then %>
   <tr>
	  <td>
	   <form action="admin-addEditDeleteUser.asp" method="post" onSubmit="return validate_form(this)">
	   <table border="0" align="center" cellpadding="5" cellspacing="5" class="dbborder" >
	    <tr>
	      <td colspan="2" align="center" bgcolor="#A7DBFB"><font size="3"><b>Create New User</b></font></td>
	    </tr>
	      <td>User Name:</td>
	      <td><input type="text" name="userid" size="30">	    </tr>
	    <tr>
	      <td>Password:</td>
	      <td><input type="password" name="password" size="30">	    </tr>
	     <tr>
	      <td>Type Of User:</td>
	      <td>&nbsp;
	        <select name="typeofuser" style="width:185px">
              <option value="">--Select--</option>
              <option value="Admin">Admin</option>
              <option value="User">User</option>
            </select></td>
	     </tr>
		 <tr>
		  <td colspan="2" align="center"><font face="Arial" size="2" color="orangered"><%=message1%></font></td>
		 </tr>
	     <tr>
	       <td colspan="2" align="center">
	       <input type="submit" name="createuser" class="buttonc" value="Create User">	       </td>
	     </tr>
	    </table>
	    </form>
	   </td>
  </tr>
  <% End If %>
  <!-- Add User If Condition Closed Here -->
  <!-- If You Click Edit In This Page That Will Come Here And Display That User Details --> 
  <% If rqType = "Edit"  Then %>
      <tr>
         <td>
	       <form action="admin-addEditDeleteUser.asp" method="post" onSubmit="return validate_form1(this)">
	       <table border="0" align="center" cellpadding="5" cellspacing="5" class="dbborder">
	        <tr>
	         <td colspan="2" align="center" bgcolor="#A7DBFB"><font size="3"><b>Edit User</b></font></td>
	        </tr>
	        <% do until Rs1.EOF %>
	        <input type="hidden" name="userId" value="<% = Rs1("GID") %>">
	        <tr>
	  	    <td>User ID:</td>
	  	    <td><% = Rs1("UserID") %>
	        </tr>

	        <tr>
	  	    <td>Password:</td>
	  	    <td><input type="password" name="editpassword" size="30" value="<% = Rs1("password") %>">
	        </tr>
	        <% Rs1.Movenext
	           Loop %>
	        <tr>
	         <td colspan="2" align="center">
	            <input type="submit" name="saveuser" class="buttonc" value="Save User">
	         </td>
	        </tr>
	       </table>
	       </form>
      </td>
    </tr>
    <% End If %>
	<!-- Edit If Condition Closed Here -->
	<!-- Here Displaying All The Users -->
    <tr height="500">
      <td valign="top">
      <table border="1" align="center" width="500px" cellspacing="0" cellpadding="3" >
       <tr height="25" >
        <td align="center" bgcolor="#A7DBFB"><b>User Name</b></td>
	    <td align="center" bgcolor="#A7DBFB"><b>TypeOfUser</b></td>
        <td align="center" bgcolor="#A7DBFB"><b>Edit</b></td>
        <td align="center" bgcolor="#A7DBFB"><b>Delete</b></td>
      </tr>
       <% If IsArray(arrAllQueries) Then

         FOR rowcounter = firstRow TO lastRow
       %>
     <tr>
     <% UserId = arrAllQueries(0,rowcounter) %>
       <td><% = arrAllQueries(1,rowcounter) %></td>	   
       <td><% = arrAllQueries(3,rowcounter) %></td>	   
       <td align="center"><a href="admin-user.asp?type=Edit&editUserId=<% = UserId %>">Edit</a></td>
       <td align="center"><a href="admin-addEditDeleteUser.asp?deleteUserId=<% = UserId %>">Delete</a></td>
    </tr>
     <%
       Next
      %>
      <tr>
       <td colspan="8">
       <% If Not firstRow = 0 Then %>
          <a href="admin-user.asp?type=editOrDelete&page=previous&row=<% = firstRow %>"> &lt;&lt;Previous</a>
       <% End If %>
       <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
       <% If Not numRows = lastRow Then %>
          <a href="admin-user.asp?type=editOrDelete&page=next&row=<% = lastRow %>"> &gt;&gt;Next</a>
       <% End If %>
       </td>
     </tr>
     <% End If %>
     <tr>
       <td colspan="6" align="center"><font face="Arial" size="2" color="orangered"><%=message%></font></td>
     </tr>
  </table>
  </td>
 </tr>
</table>
</body>
</html>
<%
 Rs.Close
 Rs1.Close
 Conn.Close
 Else
 Response.Redirect("../login.asp")
 End If
%>