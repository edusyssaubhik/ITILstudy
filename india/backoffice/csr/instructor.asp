<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 '======================================================='
'Written By : Priyanka'
'Last UpDated : 23/09/2010'
'Description :'
' Display instructors'
'======================================================='
%>
<% If Session("UserId") <> "" Then %>
<!--#include virtual="/india/connection.asp"-->
<%
 'Declare The Variables'

 Dim message
 Dim strQuery
 Dim rqType,rqPage,rqRow
 Dim arrAllQueries,instructorId
 Dim firstRow,lastRow,numRows,rowcounter
 Dim Rs1,Rs2,Rs3,i,maxRevLevel,Rs4
 Dim msg
 Dim cityFirstRow,cityLastRow,cityNumRows,cityRowCounter,arrAllCities
 Dim rqEdit
 Dim strQuery1
 Dim strQuery2
 Dim strQuery3
 Dim strQuery4,maxInstructorId,j
 Dim strQuery5,Rs5
 Dim strQuery6,Rs6,rqInstructorViewId
 Dim strQuery7,Rs7,nextPage,lastpage
 Dim lpm1,pagination,counter,rqTerm	
 Dim allNumRows,cnt,iPageCurrent,page,prev,ps
 
 
 Set Rs  = Server.CreateObject("ADODB.Recordset")
 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs2 = Server.CreateObject("ADODB.Recordset")
 Set Rs3 = Server.CreateObject("ADODB.Recordset")
 Set Rs4 = Server.CreateObject("ADODB.Recordset")
 Set Rs5 = Server.CreateObject("ADODB.Recordset")
 Set Rs6 = Server.CreateObject("ADODB.Recordset")
 Set Rs7 = Server.CreateObject("ADODB.Recordset")

'Pring Messages In instructor.asp Page'

 message = Session("message")
 Session("message") = ""

 msg = Session("msg")
 Session("msg") = ""

'======================================================='
'Retrive The Types in This Page'
'Types Are Add Instructor,Edit Instructor'
'Retrive The page and row Using For Pagination'
'======================================================='

 rqType = Request.Querystring("type")
 rqPage = Request.QueryString("page")
 rqRow = Request.QueryString("row")

'Retrive The all Instructors For Displaying'

 strQuery = "SELECT * FROM ITIL_instructor WHERE country = '"& Session("country") &"' "

 Rs.Open strQuery,Conn

  If Not Rs.EOF Then
    arrAllQueries = Rs.getrows
    Session("arrAllQueries") = arrAllQueries
    firstRow = 0
    lastRow = 9
    numRows = Ubound(arrAllQueries,2)
    If lastRow > numRows Then
       lastRow = numRows
    End If
allNumRows = numRows
		
		cnt = 1
		
	  End If

'Pagination code'

If cnt = 1 Then

 If Request.QueryString("page") = "" Then
	
	iPageCurrent = 1
	
	'arrAllRecords = Session("arrAllRecords")	
	numRows = Ubound(arrAllQueries,2)
	
	 firstRow = 0 
	 
	 If numRows > 9 Then
	    lastRow = 9  
	 Else
	 	lastRow = numRows
	 End If 
  Else
	
	arrAllQueries = Session("arrAllQueries")	
	numRows = Ubound(arrAllQueries,2)
	
	iPageCurrent = Request.QueryString("page") 
    firstRow = ((10 * iPageCurrent)-10) 
     lastRow = firstRow + 9 

    If lastRow > numRows Then
    lastRow = numRows
   End If

    If firstRow < 0 Then
       firstRow = 0
    End If

 End if
 
End If


'If User Click The Edit of Particular Instructor Retive that instructorid'
'And Display the Instructor Details'

rqEdit = Request.Querystring("editInstructorId")

 strQuery1  = "SELECT * FROM ITIL_instructor WHERE instid = '" & rqEdit & "'"

 Rs1.Open strQuery1,Conn

'Retrive The Distinct Cities from location table'
'Put into Array'
'And Display in Dropdown'

 strQuery2 = "SELECT distinct city FROM ITIL_city WHERE country = '"& Session("country") &"'"

 Rs2.Open strQuery2,Conn

 If Not Rs2.EOF Then
    arrAllCities = Rs2.getrows
    cityNumRows = Ubound(arrAllCities,2)
    cityFirstRow = 0
    cityLastRow  = cityNumRows
 End If

'Retrive The Maximum Revision Level from ITIL_instructorcomments table'
'Because Whenever User Enter New Comment, Revision Level increament one and Add to the database'
'For Displaying all The Comments'

  strQuery3 = "SELECT max(revlevel) FROM ITIL_instructorcomments WHERE instid =  '" & rqEdit & "'"

  Rs3.Open strQuery3,Conn

  do until Rs3.EOF
   For each i in Rs3.Fields
     maxRevLevel = i.value
     session("maxRevLevel") = maxRevLevel
    Next
  Rs3.Movenext
  Loop

 'Maximum Revision Level is Null Then Max Revision Level one'
 'If Maximum Revision Level Is Something Then Increment One'

    if Not IsNull(maxRevLevel) then
 	  maxRevLevel = maxRevLevel + 1
 	  Session("maxRevLevel") = maxRevLevel
 	else
 	  maxRevLevel = 1
 	  Session("maxRevLevel") = maxRevLevel
  	end if

'Retriving The Maximum instructorid from instructor table'

  strQuery4 = "SELECT max(instid) FROM ITIL_instructor"

  Rs4.Open strQuery4,Conn

  do until Rs4.EOF
   For each j in Rs4.Fields
     maxInstructorId = j.value
   Next
  Rs4.Movenext
  Loop

	if Not IsNull(maxInstructorId) then
	  maxInstructorId = maxInstructorId + 1
	  Session("maxInstructorId") = maxInstructorId
	else
	  maxInstructorId = 1
	  Session("maxInstructorId") = maxInstructorId
  	end if

 

'Display the Instructor Comments in edit instructor page'

 strQuery5 = "SELECT * FROM ITIL_instructorcomments where instid =  '" & rqEdit & "'"

 Rs5.Open strQuery5,Conn

'Sql Query For Retriving The instructor details	'
'Because CSR Only view the Instructor and add comments'

 rqInstructorViewId = Request.Querystring("viewinstructorid")

 strQuery6 = "SELECT * FROM ITIL_instructor where instid =  '" & rqInstructorViewId & "'"

 Rs6.Open strQuery6,Conn

'Sql Query for Retrivng the instructor comments'

 strQuery7 = "SELECT * FROM ITIL_instructorcomments where instid =  '" & rqInstructorViewId & "'"

 Rs7.Open strQuery7,Conn

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title>Add Instructor</title>
<link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">

 <script type="text/javascript">

//Check Email Validation

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



 function validate_form(thisform)
 {
     with (thisform)
     {

    //Check If The First Name field is Empty
	
 	if (validate_required(firstname,"Please Enter  FirstName")==false)
 		  {firstname.focus();return false}

   //Check If The First Name Have Any Speacial Characters
   
    if (validate_special(firstname," FirstName Has Special Characters. \n Please remove them and try again")==false)
 		      {firstname.focus();return false}

   //Check If The First Name Have Any Numbers
   
    if (validate_noNumber(firstname," FirstName Has Numerals")==false)
 	      {firstname.focus();return false}

    //Check If The Last Name field is Empty 
	
 	if (validate_required(lastname,"Please Enter LastName")==false)
 	      {lastname.focus();return false}

   //Check If The Last Name Have Any Speacial Characters
   
 	if (validate_special(lastname,"LastName Has Special Characters. \n Please remove them and try again")==false)
 	 		      {lastname.focus();return false}

   //Check If The Last Name Have Any Numbers
   
 	if (validate_noNumber(lastname,"LastName Has Numerals")==false)
 		      {lastname.focus();return false}

    //Check If The Email1 field is Empty 
	
 	if (validate_required(email1,"Please Enter Primary EmailId")==false)
 		  {email1.focus();return false}

    //Check If The Email1 Correct or Not 
	
    if (echeck(email1)==false)
 	      {email1.focus();return false}

    //Check If The Email2 field is Empty 
	
 	if (validate_required(email2,"Please Enter Secondary EmailId")==false)
 		  {email2.focus();return false}

    //Check If The Email2 Correct or Not 
	
    if (echeck(email2)==false)
 	      {email2.focus();return false}

    //Check If The PhoneNumber1 field is Empty 

 	if (validate_required(phoneno1,"Please enter Primary phone number")==false)
 		  {phoneno1.focus();return false}

   //Check If the Phone Number1 Have Any Speacial Characters
   
     if (validate_special(phoneno1,"Please remove the Speacial Characters in Phone Number1")==false)
 	 		      {phoneno1.focus();return false}

   //Check If The Phone Number1 Have Numerals
   
 	if (validate_number(phoneno1,"Primary Phone number is not a numeral")==false)
 	      {phoneno1.focus();return false}

 //Check If The company Name field is Empty 
	
 	if (validate_required(compName,"Please Enter Company Name")==false)
 	      {compName.focus();return false}
    
//Check If The company Name field is Empty 
	
 	if (validate_required(compAdd,"Please Enter Company Address")==false)
 	      {compAdd.focus();return false}
		  
		  //Check If The company Name field is Empty 
	
 	if (validate_required(address,"Please Enter address")==false)
 	      {address.focus();return false}
		  
		  
		  //Check If The company Name field is Empty 
	
 	if (validate_required(country,"Please Enter Country")==false)
 	      {country.focus();return false}

}

}

// This Function is AddComment Script

function doClick(objRad)
	{
		if (objRad.value=="AddComment")

			{
			document.getElementById("textbox").style.display='none'; //hide other options
			document.getElementById("textbox").style.display='block'; //show textbox
			}
	}


//This Function used for Edit Instructor

 function validate_form1(theform)
 {
   with (theform)
   {

   //Check If The First Name is Empty

 	if (validate_required(editfirstname,"Please Enter  FirstName")==false)
 		  {editfirstname.focus();return false}

   //Check If The First Name Have Any Speacial Characters

    if (validate_special(editfirstname," FirstName Has Special Characters. \n Please remove them and try again")==false)
 		      {editfirstname.focus();return false}

   //Check If The First Have Any Numerals

    if (validate_noNumber(editfirstname," FirstName Has Numerals")==false)
 	      {editfirstname.focus();return false}

   //Check If The Last Name is Empty
   
 	if (validate_required(editlastname,"Please Enter LastName")==false)
 	      {editlastname.focus();return false}


   //Check If The Last Name have Any Speacial characters
   
 	if (validate_special(editlastname,"LastName Has Special Characters. \n Please remove them and try again")==false)
 	 		      {editlastname.focus();return false}

   //Check If The Last Name Have Any Numerals
 	if (validate_noNumber(editlastname,"LastName Has Numerals")==false)
 		      {editlastname.focus();return false}

   //Check If The Email1 Field is Empty
   
 	if (validate_required(editemail1,"Please Enter Primary EmailId")==false)
 		  {editemail1.focus();return false}

   //Check If The Email1 Correct Or Not
   
    if (echeck(editemail1)==false)
 	      {editemail1.focus();return false}

   //Check If The Email2 Field Is Empty
   
 	if (validate_required(editemail2,"Please Enter Secondary EmailId")==false)
 		  {editemail2.focus();return false}

   //Check If The Email2 Correct Or Not
   
    if (echeck(editemail2)==false)
 	      {editemail2.focus();return false}

   //Check If The Phone Number1 Field is Empty
   
 	if (validate_required(editphoneno1,"Please enter Primary phone number")==false)
 		  {editphoneno1.focus();return false}

    //Check If The Phone Number1 Have Any Numerals
	
     if (validate_special(editphoneno1,"Please remove the Speacial Characters in Phone Number1")==false)
 	 		      {editphoneno1.focus();return false}

   //Check If The Phone Number Have Any Numerals
   
 	if (validate_number(editphoneno1,"Primary Phone number is not a numeral")==false)
 	      {editphoneno1.focus();return false}
		  
	
	//Check If The Company Name is Empty
   
 	if (validate_required(editCompName,"Please Enter Company Name")==false)
 	      {editCompName.focus();return false}
  
  //Check If The Company Address is Empty
   
 	if (validate_required(editCompAdd,"Please Enter Company Address")==false)
 	      {editCompAdd.focus();return false}
		  
		  
	//Check If The Address is Empty
   
 	if (validate_required(editAdd,"Please Enter Address")==false)
 	      {editAdd.focus();return false}
		  
		  
   //Check If The Country is Empty
   
 	if (validate_required(editCountry,"Please Enter Country")==false)
 	      {editCountry.focus();return false}

  }

  
 }
 
 function DeleteAlert(link,site,ltext) {
  if(confirm("Are you sure you want to delete?")) 
  {
  	return true;
  } 
return false;
}

</script>

<script type="text/javascript" src="calendar/zapatec.js"></script><!-- Custom includes --><!-- import the calendar script -->
<script type="text/javascript" src="calendar/calendar.js"></script><!-- import the language module -->
<script type="text/javascript" src="calendar/calendar-en.js"></script><!-- other languages might be available in the lang directory; please check-->
<link href="calendar/template.css" rel="stylesheet" type="text/css">
<link href="calendar/system.css" rel="stylesheet" type="text/css">
</head>
<body><div id="htMap">
<table border="1"  width="1200px" cellspacing="0" height="550" class="dbborder">
 <tr>
   <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% =Session("country") %></span> ITILstudy Back Office</font></div>
 </tr>
<tr>
   <td width="100px" valign="top" rowspan="22">
    <!--#include file="leftMenu.html"-->
  </td>
 <td>
 <% 
 'If Session("typeofuser") <> "CSR" Then Only See The Add Instructor on the top'
 If Session("typeofuser") <> "CSR" Then 
 %>
 <tr>
  <td height="25"><a href="instructor.asp?type=add">Add Instructor</a></td>
 </tr>
 <% End If %>
 <!-- If You Click Add Instructor That Will Comes Here -->
     <% if rqType = "add"  Then %>
	  <tr>
	   <td height="300">
	   <form name="Instructor" action="addEditDeleteInstructor.asp" method="post" onsubmit="return validate_form(this)">
     	<table border="0" bordercolor="#dadada" cellspacing="5" align="center">
	     <tr>
		   <td align="center" colspan="4" class="h3">Add Instructor</td>
	     </tr>
	     	<input type="hidden" name="instructorId" value="maxInstructorId">
	     	<tr>
    			<td>First Name:</td>
				<td><input type="text" name="firstname"></td>

						 <td>Last Name:</td>
					 	 <td><input type="text" name="lastname"></td>
					</tr>
					<tr>
					 <td>Email1:</td>
					 <td><input type="text" name="email1"></td>

					 <td>Email2:</td>
					 <td><input type="text" name="email2"></td>
					</tr>
					<tr>
					 <td>Password:</td>
					 <td><input type="password" name="pwd"></td>
					</tr>
					<tr>
					 <td>Phone Number1:</td>
					 <td><input type="text" name="phoneno1" maxlength="25"></td>
					</tr>
					<tr>
					 <td  valign="top">Company Name:</td>
					 <td  valign="top"><input type="text" name="compName"></td>
                    
					 <td  valign="top">Company Address:</td>
					 <td>
                     <textarea name="compAdd" cols="15" rows="5" ></textarea>
                     </td>
					</tr>
                    <tr>
			       <tr>
					 <td  valign="top">Address:</td>
					 <td  valign="top"><textarea name="address" cols="15" rows="5" ></textarea></td>
                    
					 <td  valign="top">Country:</td>
					 <td  valign="top">
                     <input type="text" name="country">
                     </td>
					</tr>
                    <tr>
				     <tr>
				       <td colspan="3">

					   <table>
					   	<tr>
					   		<td>
					   			<input type="button" name="rad" class="buttonc" value="AddComment" onclick="doClick(this)">
					   		</td>
					   		<td>
					   			<div id="textbox" style="display:none">
					   				Comment:<br><textarea name="comment" rows="3" cols="40"></textarea>
					   			</div>
					   		</td>
					   		</tr>
					   		</table>


				        <table border="0" id="addcomment" style="display:none">

   					     <tr>
   					      <td>Comment:</td>
   					      <td><textarea name="comment" rows="3" cols="40"></textarea></td>
   					     </tr>

					    </table>
					    </div>
					   </td>
					  </tr>
					  <tr>
				      <td colspan="4" align="center"><input type="submit" name="addinstructor" value="Add Instructor" class="buttonc"></td>
					 </tr>
					 <tr>
					  <td colspan="2" align="center"><font face="Arial" size="2" color="orangered"><%=message%></font></td>
					 </tr>
				</table>
	 	   </form>
	  </td>
     </tr>
     <% End If %>
  <!-- Add Instructor If condtion closed here-->	 
  <!-- If You Click Edit In Instructor Page That Will Come Here -->
     <% If rqType = "Edit"  Then %>
	 <tr>
	  <td>
<form name="Instructor" action="addEditDeleteInstructor.asp" method="post" onsubmit="return validate_form1(this)">
<table border="0" align="center" cellspacing="5">

<tr>
<td align="center" colspan="4" class="h3">Edit Instructor</td>
</tr>


			<% do until Rs1.EOF %>
			<input type="hidden" name="editinstructorid" value="<% = Rs1("instid") %>">
			<tr>

				<td>First Name:</td>
				<td ><input type="text" name="editfirstname" value="<% = Rs1("firstname") %>"></td>

				 <td>Last Name:</td>
				 <td><input type="text" name="editlastname" value="<% = Rs1("lastname") %>"></td>
			</tr>
			<tr>
			 <td>Email1:</td>
			 <td><input type="text" name="editemail1" value="<% = Rs1("emailid1") %>"></td>

			 <td>Email2:</td>
			 <td class=""><input type="text" name="editemail2" value="<% = Rs1("emailid2") %>"></td>
			</tr>
			<tr>
			 <td>Password:</td>
			 <td><input type="password" name="pwd" value="<% = Rs1("pwd") %>"></td>
			</tr>
			<tr>
			 <td>PhoneNumber1:</td>
			 <td><input type="text" name="editphoneno1" value="<% = Rs1("phoneno1") %>"></td>

			 
			</tr>
			<tr>
			 <td>Company Name:</td>
			 <td><input type="text" name="editCompName" value="<% = Rs1("comp_name") %>">
			 </td>
			 <td>Company Address:</td>
			 <td><input type="text" name="editCompAdd" value="<% = Rs1("comp_addr") %>"></td>
			</tr>
				   <tr>
					<td class="zpCalSubheader">Address:</td>
					<td>
						<input type="text" name="editAdd" value="<% = Rs1("address1") %>">
					</td>

					<td class="zpCalSubheader">Country</td>
					<td>
						<input type="text" name="editCountry" value="<% = Rs1("country") %>">
					</td>
				   </tr>

			
			<% Rs1.Movenext
			   loop %>
			 <tr>
			   <td colspan="4">

			   					   <table>

			   					   	<tr>
			   					   		<td>
			   					   			<input type="button" name="rad" class="buttond" value="AddComment" onclick="doClick(this)">
			   					   		</td>
			   					   		<td>
			   					   			<div id="textbox" style="display:none">
			   					   				Comment:<br><textarea name="comment" rows="3" cols="40"></textarea>
			   					   			</div>
			   					   		</td>
			   					   		</tr>
			   					   		</table>



		    </tr>
			<tr>
			 <td colspan="4" align="center"><input type="submit" name="editinstructor" value="Edit Instructor" class="buttonc"></td>
			</tr>
			<tr>
			 <td colspan="4" align="center"><font face="Arial" size="2" color="orangered"><%=message%></font></td>
			</tr>
		</table>
   </form>
	 	  </td>
	     </tr>
	     <tr>
	      <td>
	        <table border="1" width="870px" cellspacing="0" cellpadding="2">
	        <tr height="25">
	       <td bgcolor="#A7DBFB" align="center">Comment</td>
	       <td bgcolor="#A7DBFB" align="center">EnteredBy</td>
	       <td bgcolor="#A7DBFB" align="center">EnteredDate</td>
	     </tr>
	     <% do until Rs5.EOF %>
	      <tr>
	       <td><% = Rs5("comment") %></td>
	       <td><% = Rs5("enteredby") %></td>
	       <td><% = Rs5("createddate") %></td>
	      </tr>
	      <% Rs5.Movenext
	         Loop %>
	     </table>
	    </td>
	    </tr>
<% End If %>
<!-- Edit Instructor If condition closed here -->
<!-- If you click View in Instructor page that will come here, it is only viewable -->
 <% If rqType = "View"  Then %>
 <tr>
  <td>
  <table border="0"  cellspacing="5" cellpadding="5" align="center" width="60%">
   <tr>
    <td  colspan="4" align="center" class="h3">View Instructor</td>
   </tr>
     <% do until Rs6.EOF %>
     <tr>
       <td class=""><b>First Name:</b></td>
       <td><% = Rs6("firstname") %></td>
       <td class=""><b>Last Name:</b></td>
 	   <td><% = Rs6("lastname") %></td>
  	 </tr>
 	 <tr>
 	   <td><b>Email1:</b></td>
 	   <td><% = Rs6("emailid1") %></td>
 	   <td><b>Email2:</b></td>
 	   <td><% = Rs6("emailid2") %></td>
 	 </tr>
 	 <tr>
 	   <td><b>PhoneNumber1:</b></td>
 	   <td><% = Rs6("phoneno1") %></td>
       
 	 </tr>
 	 <tr>
          <td><b>Company Name:</b></td>
          <td><% = Rs6("comp_name") %>
          </td>
          <td><b>Company Address:</b></td>
          <td><% = Rs6("comp_addr") %></td>
        </tr>
        <tr>
          <td><b>Address:</b></td>
          <td><% = Rs6("address1") %></td>
          <td><b>Country:</b></td>
          <td><% = Rs6("country") %></td>
        </tr>
	 <!-- You Can Add Comment Of That Particular Instructor -->
 	 <form action="addEditDeleteInstructor.asp" method="post">
 	 <input type="hidden" name="instructorId" value="<% = Rs6("instid") %>">
 	 <tr>
       <td><b>Comment:</b></td>
   	   <td colspan="3" >&nbsp;&nbsp;&nbsp;<textarea name="comment" rows="5" cols="40"></textarea></td>
	 </tr>
	 <tr>
	   <td colspan="2" align="right"><input type="submit" name="addcommnet" value="Add Comment" class="buttonc"></td>
	 </tr>
	 </form>
 	</table>
     <% Rs6.Movenext
 	    loop %>
   </td>
  </tr>
  <!-- This is Displaying all the comments of that particular Instructor-->
  <tr><td>Comments</td></tr>
  <tr>
  <td valign="top" height="90%">
    <table border="1" width="100%" cellspacing="0"  cellpadding="2">
      <tr height="25">
        <td bgcolor="#A7DBFB" align="center">Comment</td>
        <td bgcolor="#A7DBFB" align="center">EnteredBy</td>
        <td bgcolor="#A7DBFB" align="center">EnteredDate</td>
      </tr>
      <% do until Rs7.EOF %>
      <tr>
        <td><% = Rs7("comment") %></td>
        <td><% = Rs7("enteredby") %></td>
        <td><% = Rs7("createddate") %></td>
      </tr>
      <% Rs7.Movenext
         Loop %>
     </table>
   </td>
 </tr>
 <% End If %>
 <!-- View Instructor If Condition Closed Here -->
 <!-- All The Instructors Displaying Here -->
    <tr>
     <td valign="top" height="550">
      <table border="1" align="center" width="800" cellspacing="0" cellpadding="4">
       <tr height="25">
        <td bgcolor="#A7DBFB" align="center"><b>First Name</b></td>
        <td bgcolor="#A7DBFB" align="center"><b>Last Name</b></td>
        <td bgcolor="#A7DBFB" align="center"><b>Email ID1</b></td>
          <td bgcolor="#A7DBFB" align="center"><b>Email ID2</b></td>
          <td bgcolor="#A7DBFB" align="center"><b>Phone No.</b></td>
          <td bgcolor="#A7DBFB" align="center"><b>Company Name</b></td>
          <td bgcolor="#A7DBFB" align="center"><b>Company Address</b></td>
          <td bgcolor="#A7DBFB" align="center"><b>Address</b></td>
          <td bgcolor="#A7DBFB" align="center"><b>Country</b></td>
        <% if Session("typeofuser") = "Admin" or   Session("typeofuser") = "seniorCSR" Then %>
        <td bgcolor="#A7DBFB" align="center"><b>Edit</b></td>
        <td bgcolor="#A7DBFB" align="center"><b>Delete</b></td>
        <% End If %>
        <td bgcolor="#A7DBFB" align="center"><b>View/Add Comment</b></td>
       </tr>
       <% If IsArray(arrAllQueries) Then

         FOR rowcounter = firstRow TO lastRow
       %>
      <tr id="htMap">
      <% instructorId = arrAllQueries(0,rowcounter) %>
       <td><% = arrAllQueries(1,rowcounter) %></td>
       <td><% = arrAllQueries(2,rowcounter) %></td>
      <td><% = arrAllQueries(3,rowcounter) %></td>
          <td><% = arrAllQueries(5,rowcounter) %></td>
          <td><% = arrAllQueries(7,rowcounter) %></td>
          <td><% = arrAllQueries(20,rowcounter) %></td>
          <td><% = arrAllQueries(21,rowcounter) %></td>
          <td><% = arrAllQueries(13,rowcounter) %></td>
          <td><% = arrAllQueries(19,rowcounter) %></td>
       <% if Session("typeofuser") = "Admin" or   Session("typeofuser") = "seniorCSR" Then %>
       <td align="center"><a href="instructor.asp?type=Edit&editInstructorId=<% = instructorId %>">Edit</a></td>
       <td align="center"><a href="addEditDeleteInstructor.asp?deleteinstructorId=<% = instructorId %>" onclick="return DeleteAlert(this.href);">Delete</a></td>
       <% End If %>
       <td align="center"><a href="instructor.asp?type=View&viewinstructorid=<% = instructorId %>">View/Add Comment</a></td>
      </tr>
	  <% Next %>
            <tr id="htMap">
              <td colspan="12"><!--#include file="pagination.asp"-->
               <% 
			    ps = getPaginationString(page, (numRows + 1), 10, 2, "instructor.asp?type=editOrDelete")
				  Response.Write(ps)
	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
              </td>
            </tr>
      
     <% End If %>
     <tr>
       <td colspan="12" align="center"><font face="Arial" size="2" color="orangered"><%=msg%></font></td>
     </tr>
   </table>
  </td>
 </tr>
</table>
<!-- Calender Script-->
<script type="text/javascript">
   			<!--  to hide script contents from old browsers
   			var startDate;
   			var endDate;

   			function resetDates() {
   				startDate = endDate = null;
   			}

   			function filterDates1(cal) {
   				startDate = new Date(cal.date)
   				startDate.setHours(0,0,0,0)	// used for compares without TIME
   				/* If they haven't chosen an
   				end date before we'll set it to the same date as the start date This
   				way if the user scrolls in the start date 5 months forward, they don't
   				need to do it again for the end date.
   				*/

   				if (endDate == null) {
   					Zapatec.Calendar.setup({
   						inputField     :    "checkOut_date",
   						button         :    "button8b",  // What will trigger the popup of the calendar
   						ifFormat       :    "%b %d, %Y",
   						date           :     cal.date,
   						showsTime      :     false,          //no time
   						dateStatusFunc		:    disallowDateBefore, //the function to call
   						onUpdate       :    filterDates2
   					});
   				}
   			}

   			function filterDates2(cal) {
   				var date = cal.date;
   				endDate = new Date(cal.date)
   				endDate.setHours(0,0,0,0)	// used for compares without TIME
   			}

   			/*
   			* This functions return true to disallow a date
   			* and false to allow it.
   			*/


   			/*
   			* Check-Out calendar allowed dates
   			* Check-Out date can not be BEFORE Check-In date
   			* Check-Out date can not be before today
   			*/
   			function disallowDateBefore(dateCheckOut) {
   				dateCheckOut.setHours(0,0,0,0)
   				if ((startDate != null) && startDate > dateCheckOut)
   					// startDate is defined, make sure cal date is NOT before start date
   					return true;

   				var now = new Date()
   				now.setHours(0,0,0,0)
   				if (dateCheckOut < now)
   					// check out date can not be befor today if startDate NOT defined
   					return true;

   				return false;
   			}

   			/*
   			* Check-In date checking
   			* Check-In date can not be AFTER Check-Out date
   			* Check-In date can not be before today
   			*/
   			function disallowDateAfter(dateCheckIn) {
   				dateCheckIn.setHours(0,0,0,0)
   				if ((endDate != null) && dateCheckIn > endDate)
   					// endDate defined, calendar date can NOT be after endDate
   					return true;

   				var now = new Date()
   				now.setHours(0,0,0,0)

   				if (dateCheckIn < now)
   					// endDate NOT defined, calendar date can not be before today
   					return true;

   				return false;
   			}

   			// end hiding contents from old browsers  -->
   		</script>

   			<script type="text/javascript">
   			var cal = new Zapatec.Calendar.setup({

   	         inputField     :    "checkIn_date",   // id of the input field
   	         button         :    "button8a",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         dateStatusFunc :    disallowDateAfter, //the function to call
   	         onUpdate       :    filterDates1

   			});

   	      Zapatec.Calendar.setup({
   	         inputField     :    "checkOut_date",
   	         button         :    "button8b",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         dateStatusFunc :    disallowDateBefore, //the function to call
   	         onUpdate       :    filterDates2
   	      });

   		</script>
   		</span>
   		</div>

</body>
</html>
<%
 Rs.Close
 Rs1.Close
 Rs2.Close
 Rs3.Close
 Rs4.Close
 Rs5.Close
 Rs6.Close
 Rs7.Close
 Conn.Close
 Else
 Response.Redirect("../backOffice/login.asp")
 End If %>
