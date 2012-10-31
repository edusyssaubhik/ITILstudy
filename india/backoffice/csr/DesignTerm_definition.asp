<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 '======================================================='
'Written By : Savita'
'Last UpDated : 4/02/2012'
'Description :'
'This is user Page'
'======================================================='%
%>
<!--#include virtual="/india/connection.asp"-->
<%' If not  Session("UserId") = "" Then %>
<%
 'Declare The Variables'
 Dim strQuery
 Dim username
 Dim rqType,rqPage,rqRow
 Dim arrAllQueries,UserId
 Dim firstRow,lastRow,numRows,rowcounter
 Dim rqEdit, editTermId 
 Dim strQuery1,Rs1,nextPage,lastpage,rqTerm
 Dim lpm1,pagination,counter
 Dim allNumRows,cnt,iPageCurrent,page,prev,ps
 
 If Request.Form("term") <> "" Then
	rqTerm = Request.Form("term")
Else
	rqTerm = Request.QueryString("term")
End If
 
 
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
 Set Rs = Server.CreateObject("ADODB.Recordset")

'Sql Query For Retrive The All Users '

If rqTerm <> "" Then

 strQuery = "SELECT * FROM Designterm_definition Where term like '%"&rqTerm&"%' "
 
 Else

 strQuery = "SELECT * FROM Designterm_definition"

 End If
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

'If You Click Edit In This Page That Will Come Here'

rqEdit = Request.Querystring("editTermId")


 strQuery1  = "SELECT * FROM Designterm_definition WHERE id = '" & rqEdit & "'"

 Rs1.Open strQuery1,Conn

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Service Design Terms Definition</title>
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
		 
		   if (str1.indexOf(",")!=-1){
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
		
		if (validate_required(term,"Please enter the Term")==false)
			  {term.focus();return false}
  
      
	   //Check To See If The Definition Field Is Balnk     
	   
		if (validate_required(definition,"Please enter Definition")==false)
			  {definition.focus();return false}

	   

	   //Check To See If The Reference page Field Is Balnk    
	   
		if (validate_required(refpage,"Please enter the Reference page")==false)
			  {refpage.focus();return false}

	   

	  
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
	   
	       //Check To See If The Term Field Is Balnk 
	   
			if (validate_required(editterm,"Please enter the Term")==false)
				  {editterm.focus();return false}

           

	       //Check To See If The definition Field Is Balnk  
	   
			if (validate_required(editdefinition,"Please enter Definition")==false)
				  {editdefinition.focus();return false}

	       
	       //Check To See If The Reference Field Is Balnk  
	   
			if (validate_required(editrefpage,"Please enter the Reference page")==false)
				  {editrefpage.focus();return false}

   	     

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
<body><div id="htMap">
<table border="1" width="1000" height="500" cellpadding="2" cellspacing="0" class="dbborder" >
 <tr>
     <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% =Session("country") %></span> ITILstudy Back Office</font></div></td>
 </tr>
 <tr>
   <td width="100px" valign="top" rowspan="22">
 
   </td>
   <td height="25">
    <table width="100%" >
          <tr>
            <td width="10%">
   <a href="DesignTerm_definition.asp?type=add">Add Service Design Terms definition</a></td>
    <% If rqType <> "add" And rqType <> "Edit"  Then %>
 		<form action="DesignTerm_definition.asp" method="post">
		  <td width="10%" align="right"><b>Term:</b>
			<input type="text" name="term" size="15" value="<% = rqTerm %>" />
			<input type="submit" name="search" value="Search" />
		  </td>
		</form>
		<% End If %>
		</tr></table>
   </tr>
   <!-- If You Click Add User In This Page That Will Come Here -->
   <% if rqType = "add"  Then %>
   <tr>
	  <td>
	   <form action="addEditDesignTerm_definition.asp" method="post" onSubmit="return validate_form(this)">
	   <table border="0" align="center" cellpadding="5" cellspacing="5" class="dbborder" >
	    <tr>
	      <td colspan="2" align="center" bgcolor="#A7DBFB"><font size="3"><b>Add Service Design Terms Definition</b></font></td>
	    </tr>
	    <tr>
	      <td width="30%">Term:</td>
	      <td width="60%"><input type="text" name="term" size="30">	    </tr>
	    <tr>
	      <td valign="top">Definition:</td>
	      <td><textarea cols="20" rows="10" name="definition" size="30"></textarea>	    </tr>
	    
		  <td colspan="2" align="center"><font face="Arial" size="2" color="orangered"><%=message1%></font></td>
		 </tr>
	     <tr>
	       <td colspan="2" align="center">
	       <input type="submit" name="Add" class="buttonc" value="Add">	       </td>
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
	       <form action="addEditDesignTerm_definition.asp" method="post" onSubmit="return validate_form1(this)">
	       <table border="0" align="center" cellpadding="5" cellspacing="5" class="dbborder">
	        <tr>
	         <td colspan="2" align="center" bgcolor="#A7DBFB"><font size="3"><b>Edit Service Design Terms Definition</b></font></td>
	        </tr>
	        <% do until Rs1.EOF %>
	        <input type="hidden" name="editTermId" value="<% = Rs1("id") %>">
	        <tr>
	         <td width="30%">Term:</td>
	         <td width="60%"><input type="text" name="editterm" size="30" value="<% = Rs1("term") %>">
	        </tr>
	  	  <tr>
	  	   <td valign="top">Definition:</td>
	  	   <td><textarea name="editdefinition" cols="20" rows="10"><% = Rs1("definition") %></textarea></td>
	        </tr>
	       
	       
			
	        <% Rs1.Movenext
	           Loop %>
	        <tr>
	         <td colspan="2" align="center">
	            <input type="submit" name="editTerms" class="buttonc" value="Update">
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
        <td align="center" bgcolor="#A7DBFB"><b>Term</b></td>
        <td align="center" bgcolor="#A7DBFB"><b>Definition</b></td>	 
	   
        <td align="center" bgcolor="#A7DBFB"><b>Edit</b></td>
        <td align="center" bgcolor="#A7DBFB"><b>Delete</b></td>
      </tr>
       <% If IsArray(arrAllQueries) Then

         FOR rowcounter = firstRow TO lastRow
       %>
     <tr>
     <% editTermId = arrAllQueries(0,rowcounter) %>
       <td><% = arrAllQueries(1,rowcounter) %></td>
       <td><% = arrAllQueries(2,rowcounter) %></td>	   
        	   
       <td align="center"><a href="DesignTerm_definition.asp?type=Edit&editTermId=<% = editTermId %>">Edit</a></td>
       <td align="center"><a href="addEditDesignTerm_definition.asp?deleteTermId=<% = editTermId %>" onclick="return DeleteAlert(this.href);">Delete</a></td>
    </tr>
		<% Next %>
            <tr id="htMap">
              <td colspan="8"><!--#include file="pagination.asp"-->
               <% 
			    ps = getPaginationString(page, (numRows + 1), 10, 2, "DesignTerm_definition.asp?type=editOrDelete")
				  Response.Write(ps)
	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
              </td>
            </tr>
            <tr>
              <td colspan="9"><div align="center"><font face="Arial" size="2" color="orangered"><%=message%></font></div></td>
            </tr>
          </table></td>
      </tr>
      <% End If%>
      <tr>
        <td>&nbsp;</td>
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
 'Else
' Response.Redirect("../login.asp")
' End If
%>