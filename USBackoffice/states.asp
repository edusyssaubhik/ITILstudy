<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<!--#include virtual="/includes/connection.asp"-->
<% 
	If Session("USBUserId") = "" Then 
	   Response.Redirect("/USBackoffice/login.asp")
	Else
%>
<% 
'Declare the local variables'
Dim  rqFaculty ,objRs ,strFaculty
Dim todaysdate,arrAllStates,stateNumRows
Dim stateFirstRow ,stateLastRow ,objRs1,objRsCountry
Dim stateRowCounter,rqAction,rqstate_id,strCountry
Dim strListOfInst,strInst,objRs2,rqType,fac_name
'Creatting the record set'

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
Set objRs2 = Server.CreateObject("ADODB.Recordset")
Set objRsCountry = Server.CreateObject("ADODB.Recordset")

rqAction = Request.QueryString("action")
rqstate_id = Request.QueryString("state_id")
'Retrive the cities in the US'

strFaculty = "SELECT firstname, lastname, emailid1, emailid2, emailid3 FROM ITIL_instructor WHERE typeofuser = 'Faculty' ORDER BY firstname"

objRs.Open strFaculty, ConnObj


If Not objRs.EOF Then
	arrAllStates = objRs.getrows
	stateNumRows = Ubound(arrAllStates,2)
	stateFirstRow = 0
	stateLastRow  = stateNumRows
End If

If rqAction = "edit" Then 

	strInst = "SELECT * FROM ITIL_states WHERE state_id = '"& rqstate_id &"'"
	
	objRs1.Open strInst,ConnObj
	
Else 
	
	strInst = "SELECT * FROM ITIL_states"
	
	objRs2.Open strInst,ConnObj
	
End If

strCountry = "SELECT * FROM CRM_Countries"
	
objRsCountry.Open strCountry, ConnObj


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>US and Canada States</title>

<script language="javascript">
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

  if (theform.country.value == "")
  {
     alert("Please select the Country");
     theform.country.focus();
     return (false);
  }
  
	with (theform)
    {
  
		if (validate_required(states,"Please enter the State name")==false)
			  {states.focus();return false}
			  

		if (validate_required(FacultyEmailID1,"Please select Faculty 1")==false)
 		     {FacultyEmailID1.focus();return false} 

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

</head>

<body>
<% If rqAction = "" Then %>
<div>
<table border="0" cellpadding="5" cellspacing="0" width="100%">
<tr>

<td align="left"><a href="states.asp?action=Add">Add States</a></br></td>
</tr>
<tr>
 <table border="1" cellpadding="5" cellspacing="0" width="100%">
  <tr>
   <td><b>Country</b></td>
   <td><b>State</b></td>
   <td><b>State Code </b></td>
   <td><b>Faculty1 Name</b></td>
   <td><b>Faculty1 EmailID</b></td>
   <td><b>Faculty1 Secondary EmailID</b></td>
   <td><b>Faculty1 Third EmailID</b></td>
    <td><b>Faculty2 Name</b></td>
    <td><b>Faculty2 EmailID</b></td>
    <td><b>Faculty2 Secondary EmailID</b></td>
	<td><b>Faculty2 Third EmailID</b></td>
    <td><b>Faculty3 Name</b></td>
    <td><b>Faculty3 EmailID</b></td>
    <td><b>Faculty3 Secondary EmailID</b></td>
	<td><b>Faculty3 Third EmailID</b></td>
   <td><b>Faculty4 Name</b></td>
    <td><b>Faculty4 EmailID</b></td>
    <td><b>Faculty4 Secondary EmailID</b></td>
	<td><b>Faculty4 Third EmailID</b></td>
   <td><b>Faculty5 Name</b></td>
    <td><b>Faculty5 EmailID</b></td>
    <td><b>Faculty5 Secondary EmailID</b></td>
	<td><b>Faculty5 Third EmailID</b></td>
   <td><b>Edit</b></td>
   <td><b>Delete</b></td>
  </tr>
  <% Do Until objRs2.EOF %>
  <tr>
   <td><% = objRs2("country") %></td>
   <td><% = objRs2("states") %></td>
   <td><% = objRs2("statecode") %></td>
   <td><% = objRs2("fac_name1") %></td>
    <td><% = objRs2("fac_emailID1") %></td>
    <td><% = objRs2("fac_sec_emailID1") %></td>
	<td><% = objRs2("fac_thi_emailID1") %></td>
   <td><% = objRs2("fac_name2") %></td>
    <td><% = objRs2("fac_emailID2") %></td>
    <td><% = objRs2("fac_sec_emailID2") %></td>
	<td><% = objRs2("fac_thi_emailID2") %></td>
   <td><% = objRs2("fac_name3") %></td>
    <td><% = objRs2("fac_emailID3") %></td>
    <td><% = objRs2("fac_sec_emailID3") %></td>
	<td><% = objRs2("fac_thi_emailID3") %></td>
   <td><% = objRs2("fac_name4") %></td>
    <td><% = objRs2("fac_emailID4") %></td>
    <td><% = objRs2("fac_sec_emailID4") %></td>
	<td><% = objRs2("fac_thi_emailID4") %></td>
   <td><% = objRs2("fac_name5") %></td>
    <td><% = objRs2("fac_emailID5") %></td>
    <td><% = objRs2("fac_sec_emailID5") %></td>
	<td><% = objRs2("fac_thi_emailID5") %></td>
   <td><a href="states.asp?action=edit&state_id=<% =objRs2("state_id") %>">Edit</a></td>
   <td><a href="addEditDelStates.asp?action=delete&delStateId=<% = objRs2("state_id") %>"  onclick="return DeleteAlert(this.href);">Delete</a></td>
  </tr>  
  <% objRs2.Movenext
     Loop
	 objRs2.Close %>
 </table>
 </tr>
 </table>
</div>
<% ElseIf rqAction = "Add" Then %>
<div>
 <form action="addEditDelStates.asp" method="post" onsubmit="return Form_Validator(this)">
   <div align="center" style="border:groove; width:30%;">
   <table border="0" align="center" cellpadding="5" cellspacing="0" width="70%">
   <tr><br />
   	<td colspan="2" align="center" bgcolor="#C9C9C9">Add US/Canada States</td>
   </tr>
   <tr>
	 <td width="40%">Country:</td>
	 <td width="60%">
	 	<select name="country">
		    <option value="">--Select--</option>
			 <% Do Until objRsCountry.EOF %>
                      <% If objRsCountry("Country") <> "Global" Then %>
                      <option value="<% = objRsCountry("Country") %>">
                      <% = objRsCountry("Country") %>
                      </option>
                      <% End If %>
                      <% objRsCountry.Movenext
                       Loop
                       objRsCountry.Close %></select>
	 </td>
   </tr>
   <tr>
	 <td width="40%">State:</td>
	 <td width="60%"><input type="text" name="states" /></td>
	</tr>
	<tr>
	 <td>State Code:</td>
	 <td><input type="text" name="statecode" /></td>
	</tr>	
		<tr>
          <td width="22%">Faculty 1:</td>
           <td>
	  <select name="FacultyEmailID1">
	   <option value="">--Select--</option>
		<% 
		   If IsArray(arrAllStates) Then 
		   For stateRowCounter = stateFirstRow to stateLastRow 
		   fac_name = arrAllStates(0,stateRowCounter) &" "& arrAllStates(1,stateRowCounter)
		   %>
			<option value="<% = arrAllStates(2,stateRowCounter) %>-<% = arrAllStates(3,stateRowCounter) %>-<% = arrAllStates(4,stateRowCounter) %>-<% = fac_name %>"><% = arrAllStates(0,stateRowCounter) &" "& arrAllStates(1,stateRowCounter) %></option>
		<% Next
		   End If %>
	  </select>
	 </td>
        </tr>
		<tr>
          <td width="22%">Faculty 2:</td>
          <td>
		  <select name="FacultyEmailID2">
	   <option value="">--Select--</option>
		<% 
		   If IsArray(arrAllStates) Then 
		   For stateRowCounter = stateFirstRow to stateLastRow 
		   fac_name = arrAllStates(0,stateRowCounter) &" "& arrAllStates(1,stateRowCounter)
		   %>
			<option value="<% = arrAllStates(2,stateRowCounter) %>-<% = arrAllStates(3,stateRowCounter) %>-<% = arrAllStates(4,stateRowCounter) %>-<% = fac_name %>"><% = arrAllStates(0,stateRowCounter) &" "& arrAllStates(1,stateRowCounter) %></option>
		<% Next
		   End If %>
	  </select>
          </td>
        </tr>
		<tr>
          <td width="22%">Faculty 3:</td>
          <td>
		  <select name="FacultyEmailID3">
	   <option value="">--Select--</option>
		<% 
		   If IsArray(arrAllStates) Then 
		   For stateRowCounter = stateFirstRow to stateLastRow 
		   fac_name = arrAllStates(0,stateRowCounter) &" "& arrAllStates(1,stateRowCounter)
		   %>
			<option value="<% = arrAllStates(2,stateRowCounter) %>-<% = arrAllStates(3,stateRowCounter) %>-<% = arrAllStates(4,stateRowCounter) %>-<% = fac_name %>"><% = arrAllStates(0,stateRowCounter) &" "& arrAllStates(1,stateRowCounter) %></option>
		<% Next
		   End If %>
	  </select>
          </td>
        </tr>
		<tr>
          <td width="22%">Faculty 4:</td>
          <td>
		  <select name="FacultyEmailID4">
	   <option value="">--Select--</option>
		<% 
		   If IsArray(arrAllStates) Then 
		   For stateRowCounter = stateFirstRow to stateLastRow 
		   fac_name = arrAllStates(0,stateRowCounter) &" "& arrAllStates(1,stateRowCounter)
		   %>
			<option value="<% = arrAllStates(2,stateRowCounter) %>-<% = arrAllStates(3,stateRowCounter) %>-<% = arrAllStates(4,stateRowCounter) %>-<% = fac_name %>"><% = arrAllStates(0,stateRowCounter) &" "& arrAllStates(1,stateRowCounter) %></option>
		<% Next
		   End If %>
	  </select>
          </td>
        </tr>
		<tr>
          <td width="22%">Faculty 5:</td>
          <td>
		  <select name="FacultyEmailID5">
	   <option value="">--Select--</option>
		<% 
		   If IsArray(arrAllStates) Then 
		   For stateRowCounter = stateFirstRow to stateLastRow 
		   fac_name = arrAllStates(0,stateRowCounter) &" "& arrAllStates(1,stateRowCounter)
		   %>
			<option value="<% = arrAllStates(2,stateRowCounter) %>-<% = arrAllStates(3,stateRowCounter) %>-<% = arrAllStates(4,stateRowCounter) %>-<% = fac_name %>"><% = arrAllStates(0,stateRowCounter) &" "& arrAllStates(1,stateRowCounter) %></option>
		<% Next
		   End If %>
	  </select>
          </td>
        </tr>
		
	<tr>
	 <td>&nbsp;</td>
	 <td><input type="submit" name="type" value="Submit" />&nbsp;&nbsp;<a href="states.asp">Back</a></td>
	</tr>	
	</tr>		
   </table>
   </div>
   </form>
   
   <% ElseIf rqAction = "edit" Then %>
<div align="center" style="border:groove; width:30%;"> 
<form action="addEditDelStates.asp" method="post" onsubmit="return Form_Validator(this)">
  <% Do Until objRs1.EOF %>
   <input type="hidden" name="state_id" value="<% = objRs1("state_id") %>" />
   <table border="0" align="center" cellpadding="5" cellspacing="0" width="70%">
    <tr><br />
  <td colspan="2" align="center" bgcolor="#C9C9C9">Edit</td>
 </tr>
    <tr>
	 <td width="40%">Country:</td>
	 <td width="60%">
	 	<select name="country">
			<option <% If objRs1("country") = "US" Then %> selected="selected" <% End If %> value="US">US</option>
			<option <% If objRs1("country") = "Canada" Then %> selected="selected" <% End If %> value="Canada">Canada</option>
			<option <% If objRs1("country") = "United Kingdom" Then %> selected="selected" <% End If %> value="United Kingdom">United Kingdom</option>
            <option <% If objRs1("country") = "UAE" Then %> selected="selected" <% End If %> value="UAE">UAE</option>
            <option <% If objRs1("country") = "Singapore" Then %> selected="selected" <% End If %> value="Singapore">Singapore</option>            
		</select>
	 </td>
   </tr>
	<tr>
	 <td width="40%">State:</td>
	 <td width="60%"><input type="text" name="states" value="<% = objRs1("states") %>" /></td>
	 </tr>
	 <tr>
	 <td>State Code:</td>
	 <td><input type="text" name="statecode" value="<% = objRs1("statecode") %>" /></td>
	</tr>	
	<tr>
	 <td>Faculty 1:</td>
	 <td>
	  <select name="FacultyEmailID1">
	   <option value="">--Select--</option>
	   <% 
		   If IsArray(arrAllStates) Then 
		   For stateRowCounter = stateFirstRow to stateLastRow 
		   fac_name = arrAllStates(0,stateRowCounter) &" "& arrAllStates(1,stateRowCounter)
		   %>
			<option <% If objRs1("fac_emailID1") = arrAllStates(2,stateRowCounter) Then %> selected="selected" <% End If %> value="<% = arrAllStates(2,stateRowCounter) %>-<% = arrAllStates(3,stateRowCounter) %>-<% = arrAllStates(4,stateRowCounter) %>-<% = fac_name %>"><% = arrAllStates(0,stateRowCounter) &" "& arrAllStates(1,stateRowCounter) %></option>
		<% Next
		   End If %>
	  </select>
	 </td>
	</tr>
	<tr>
	 <td>Faculty 2:</td>
	 <td>
	  <select name="FacultyEmailID2">
	   <option value="">--Select--</option>
	   <% 
		   If IsArray(arrAllStates) Then 
		   For stateRowCounter = stateFirstRow to stateLastRow
		   fac_name = arrAllStates(0,stateRowCounter) &" "& arrAllStates(1,stateRowCounter)
		    %>
			<option <% If objRs1("fac_emailID2") = arrAllStates(2,stateRowCounter) Then %> selected="selected" <% End If %> value="<% = arrAllStates(2,stateRowCounter) %>-<% = arrAllStates(3,stateRowCounter) %>-<% = arrAllStates(4,stateRowCounter) %>-<% = fac_name %>"><% = arrAllStates(0,stateRowCounter) &" "& arrAllStates(1,stateRowCounter) %></option>
		<% Next
		   End If %>
	  </select>
	 </td>
	</tr>
	<tr>
	 <td>Faculty 3:</td>
	 <td>
	  <select name="FacultyEmailID3">
	   <option value="">--Select--</option>
	   <% 
		   If IsArray(arrAllStates) Then 
		   For stateRowCounter = stateFirstRow to stateLastRow
		   fac_name = arrAllStates(0,stateRowCounter) &" "& arrAllStates(1,stateRowCounter)
		    %>
			<option <% If objRs1("fac_emailID3") = arrAllStates(2,stateRowCounter) Then %> selected="selected" <% End If %> value="<% = arrAllStates(2,stateRowCounter) %>-<% = arrAllStates(3,stateRowCounter) %>-<% = arrAllStates(4,stateRowCounter) %>-<% = fac_name %>"><% = arrAllStates(0,stateRowCounter) &" "& arrAllStates(1,stateRowCounter) %></option>
		<% Next
		   End If %>
	  </select>
	 </td>
	</tr>
	<tr>
	 <td>Faculty 4:</td>
	 <td>
	  <select name="FacultyEmailID4">
	   <option value="">--Select--</option>
	   <% 
		   If IsArray(arrAllStates) Then 
		   For stateRowCounter = stateFirstRow to stateLastRow
		   fac_name = arrAllStates(0,stateRowCounter) &" "& arrAllStates(1,stateRowCounter)
		    %>
			<option <% If objRs1("fac_emailID4") = arrAllStates(2,stateRowCounter) Then %> selected="selected" <% End If %> value="<% = arrAllStates(2,stateRowCounter) %>-<% = arrAllStates(3,stateRowCounter) %>-<% = arrAllStates(4,stateRowCounter) %>-<% = fac_name %>"><% = arrAllStates(0,stateRowCounter) &" "& arrAllStates(1,stateRowCounter) %></option>
		<% Next
		   End If %>
	  </select>
	 </td>
	</tr>
	<tr>
	 <td>Faculty 5:</td>
	 <td>
	  <select name="FacultyEmailID5">
	   <option value="">--Select--</option>
	   <% 
		   If IsArray(arrAllStates) Then 
		   For stateRowCounter = stateFirstRow to stateLastRow
		   fac_name = arrAllStates(0,stateRowCounter) &" "& arrAllStates(1,stateRowCounter)
		   %>
			<option <% If objRs1("fac_emailID5") = arrAllStates(2,stateRowCounter) Then %> selected="selected" <% End If %>value="<% = arrAllStates(2,stateRowCounter) %>-<% = arrAllStates(3,stateRowCounter) %>-<% = arrAllStates(4,stateRowCounter) %>-<% = fac_name %>"><% = arrAllStates(0,stateRowCounter) &" "& arrAllStates(1,stateRowCounter) %></option>
		<% Next
		   End If %>
	  </select>
	 </td>
	</tr>
	<tr>
	<td>&nbsp;</td>
    <td><input type="submit" name="type" value="Edit Details"/>&nbsp;&nbsp;<a href="states.asp">Back</a></td></tr>
  </table>
	<% objRs1.Movenext
 Loop
 objRs1.Close %>
	
	</form>
	<% End If %>
   </div>
</body>
</html>
<% End If %>