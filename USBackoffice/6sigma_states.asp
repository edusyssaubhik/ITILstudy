<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/connection.asp"-->
<%  
'======================================================='
'Written By : Priyanka'
'Last UpDated : 13/07/2010'
'Description :'
'6sigma-states Form'
'======================================================='

'Declaring variables'
Dim rs,rqId,rqPage,rqRow,rqAction
Dim strQuery,arrAllEmpDet,firstRow, lastRow, numRows, rowcounter

'Retriving the values'
rqAction=request.QueryString("action")
rqPage = Request.QueryString("page")
rqRow  = Request.QueryString("row")

'Creating the recordset'
set rs=server.CreateObject("ADODB.recordset")
rs.open "SELECT * FROM sixsigma_us_states ORDER BY id DESC",connObj
If Not rs.EOF Then
	arrAllEmpDet = rs.getrows
	firstRow = 0
	lastRow = 9
	numRows = Ubound(arrAllEmpDet,2)
	If lastRow > numRows Then
	   lastRow = numRows
	End If
End If

rs.Close

If rqPage = "next" Then

   numRows = Ubound(arrAllEmpDet,2)

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

   numRows = Ubound(arrAllEmpDet,2)

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


%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>6sigma States</title>
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



function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}
}
 

 function validate_form(thisform)
 {
	
	with (thisform)
    {
	   //Check To See If The state Field Is Balnk     
		
		if (validate_required(state,"Please enter the state")==false)
			  {state.focus();return false}
  
      //Check To See If The faculty1 Field Is Balnk     
		
		if (validate_required(faculty1,"Please enter the faculty1 name")==false)
			  {faculty1.focus();return false}
  
	  //Check To See If The faculty1 email id Field Is Balnk     
		
		if (validate_required(fac1EmailId,"Please enter the faculty1 email id")==false)
			  {fac1EmailId.focus();return false}

        if (echeck(fac1EmailId)==false)
 	         {fac1EmailId.focus();return false}	
			   
       //Check To See If The faculty2 Field Is Balnk     
		
		if (validate_required(faculty2,"Please enter the faculty2 name")==false)
			  {faculty2.focus();return false}
			  
	    //Check To See If The faculty2 email id Field Is Balnk     
		
		if (validate_required(fac2EmailId,"Please enter the faculty2 email id")==false)
			  {fac2EmailId.focus();return false}

        if (echeck(fac2EmailId)==false)
 	         {fac2EmailId.focus();return false}	
			 
	}
	
	if (thisform.country.value == "")
  	{
    	 alert("Please select Country.");
	     thisform.country.focus();
    	 return (false);
  	}
}
</script>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>

<body>
<h2><a href="6sigma_states.asp">6sigma states</a>
<% If rqAction="addStates" then %>
&raquo; Add States
<% ElseIf rqAction="editStates" then %>
&raquo; Edit States
<%  ElseIf rqAction="deleteStates" then %>
&raquo; Delete States
<% Else %>
&raquo;6sigma states Details
<% End If %>
 </h2>


<div>

<% If rqAction="addStates" then %>
<h3> Add States </h3>
<% ElseIf rqAction="editStates" then %>
<h3> Edit States </h3>
<%  ElseIf rqAction="deleteStates" then %>
<h3> Delete States </h3>
<% Else %>
<h3><a href="6sigma_states.asp?action=addStates">Add</a> 6sigma states Details</h3>
<% End If %>

<fieldset>

<% 
	If rqAction="addStates" then 
%>

<form action="addEditDel6sigmaStates.asp" method="post" onSubmit="return validate_form(this)">
<table border="0" width="100%" cellpadding="0" cellspacing="0" >
<tr align="center"><td class="TableQuestion"><div align="center">Add States</div></td></tr>
<table border="0" width="50%">
<tr>
<td width="30%"><h4>State</h4></td>
<td ><input type="text" name="state" size="30"/></td>
</tr>
<tr>
<td><h4>Faculty1</h4></td>
<td><input type="text" name="faculty1" size="30"/></td>
</tr>
<tr>
<td><h4>Faculty1 EmailId</h4></td>
<td><input type="text" name="fac1EmailId" size="30"/></td>
</tr>
<tr>
<td valign="top"><h4>Faculty2</h4></td>
<td><input type="text"  name="faculty2"/></td>
</tr>
<tr>
<td valign="top"><h4>Faculty2 EmailId</h4></td>
<td><input type="text" name="fac2EmailId"/></td>
</tr>
<tr>
<td valign="top"><h4>Country</h4></td>
<td><select name="country">
<option value="">---Select---</option>
<option value="US">US</option>
<option value="Canada">Canada</option>
</select>
</td>
</tr>
<tr>
<td></td>
<td align="left"><input type="submit" name="type" value="Submit" /></td>
</tr>
</table>
</table>
</form>


<% 
	ElseIf rqAction="editStates" then 
	rqID=request.QueryString("id")
	strQuery="SELECT id,state, faculty1, fac1_emailid, faculty2, fac2_emailid, country FROM sixsigma_us_states WHERE id='"&rqID&"' "
     rs.open strQuery,connObj

%>

<form action="addEditDel6sigmaStates.asp" method="post" onsubmit="return validate_form(this)">
<% do until rs.EOF %>
<input type="hidden" name="id" value="<%=rs("id")%>"/>

<table border="0" width="50%">
<tr>
<td width="30%"><h4>State</h4></td>
<td ><input type="text" name="state" value="<%=rs("state") %>"size="30"/></td>
</tr>
<tr>
<td><h4>Faculty1</h4></td>
<td><input type="text" name="faculty1" value="<%=rs("faculty1") %>" size="30"/></td>
</tr>
<tr>
<td><h4>Faculty1 EmailId</h4></td>
<td><input type="text" name="fac1EmailId" value="<%=rs("fac1_emailid") %>"size="30"/></td>
</tr>
<tr>
<td valign="top"><h4>Faculty2</h4></td>
<td><input type="text" name="faculty2" value="<%=rs("faculty2") %>"/></td>
</tr>
<tr>
<td valign="top"><h4>Faculty2 EmailId</h4></td>
<td><input type="text" name="fac2EmailId" value="<%=rs("fac2_emailid") %>"/></td>
</tr>
<tr>
<td valign="top"><h4>Country</h4></td>
<td> <select name="country">
	   	<option value="">--Select--</option>
		<option <% If rs("country") = "US" Then %> selected="selected" <% End If %> value="US">US</option>
		<option <% If rs("country") = "Canada" Then %> selected="selected" <% End If %> value="Canada">Canada</option>
	   </select>
</td>
</tr>
<tr>
<td></td>
<td align="left"><input type="submit" name="type" value="Update" /></td>
</tr>
<% rs.movenext
   loop
  rs.close%> 
</table>
</form>


<% Else

	strQuery="SELECT * FROM sixsigma_us_states" 
	rs.open strQuery,connObj
%>
<%  If IsArray(arrAllEmpDet) Then %> 
<table border="1" width="100%" cellpadding="5" cellspacing="0">
<tr ><td colspan="9" align="right"  ><a href="6sigma_states.asp?action=addStates"><div align="right">Add</div></a></td></tr>
<tr>
<td width="50px"><h4>ID</h4></td>
<td width="100px"><h4>State</h4></td>
<td width="100px"><h4>Faculty1</h4></td>
<td width="50px"><h4>Faculty1 EmailId</h4></td>
<td width="150px"><h4>Faculty2</h4></td>
<td width="150px"><h4>Faculty2 EmailId</h4></td>
<td width="150px"><h4>Country</h4></td>
<td width="50px"><h4>Edit</h4></td>
<td width="50px"><h4>Delete</h4></td>
</tr>
  <%  For rowcounter = firstRow To lastRow  %>
<tr>
<td><% = arrAllEmpDet(0,rowcounter) %></td>
<td><% = arrAllEmpDet(1,rowcounter) %></td>
<td><% = arrAllEmpDet(2,rowcounter) %></td>
<td><% = arrAllEmpDet(3,rowcounter) %></td>
<td><% = arrAllEmpDet(4,rowcounter) %></td>
<td><% = arrAllEmpDet(5,rowcounter) %></td>
<td><% = arrAllEmpDet(6,rowcounter) %></td>
<td><a href="6sigma_states.asp?action=editStates&id=<% = arrAllEmpDet(0,rowcounter) %>">Edit</a></td>
<td><a href="addEditDel6sigmaStates.asp?action=deleteStates&id=<% = arrAllEmpDet(0,rowcounter) %>">Delete</a></td>
</tr>
<% Next %>
 <tr>
    <td colspan="25"><% If Not firstRow = 0 Then %>
      <a href="6sigma_states.asp?page=previous&row=<% = firstRow %>">&lt;&lt;Previous</a>
      <% End If %>
      <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
      <% If Not numRows = lastRow Then %>
      <a href="6sigma_states.asp?page=next&row=<% = lastRow %>">&gt;&gt;Next</a>
      <% End If %></td>
  </tr> 
</table>
<% End If %>
<% End If %>
</fieldset>

</div> 



</body>
</html>
