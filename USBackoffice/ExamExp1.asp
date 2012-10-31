<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<% If Session("USBUserId") = "" Then 
	Response.Redirect("login.asp")
Else
%>
<!--#include virtual="/includes/connection.asp"-->
<head>
<%  
'======================================================='
'Written By : savita'
'Written Date : 11/08/2011'
'Last UpDated : 11/08/2011'
'Description :'
'This page is for Feedback '
'======================================================='

'Declaring variables'
Dim rqId,rqPage,rqRow
Dim strQuery,arrAllEmpDet,firstRow, lastRow, numRows, rowcounter

'Retriving the values'
rqAction=request.QueryString("action")
rqPage = Request.QueryString("page")
rqRow  = Request.QueryString("row")

' for search feild

If Request.Form("country") <> "" Then
	rqCountry = Request.Form("country")
Else
	rqCountry = Request.QueryString("country")
End If

If Request.Form("fname") <> "" Then
	rqName = Request.Form("fname")
Else
	rqName = Request.QueryString("fname")
End If

'Creating the recordset'
set rs=server.CreateObject("ADODB.recordset")

If rqCountry <> "" Then

rs.open "SELECT * FROM FacExam_feedback WHERE country  Like '%"& rqCountry &"%'  ORDER BY dateofpassing DESC",ConnObj

ElseIf rqName <> "" Then

rs.open "SELECT * FROM FacExam_feedback WHERE fname Like '%"& rqName &"%' ORDER BY dateofpassing DESC",ConnObj

Else 

rs.open "SELECT * FROM FacExam_feedback ORDER BY dateofpassing DESC",ConnObj

End If

If Not rs.EOF Then
		arrAllEmpDet = Rs.getrows
		Session("arrAllEmpDet") = arrAllEmpDet
        cnt = 1
		firstRow = 0
		lastRow = 9
		numRows = Ubound(arrAllEmpDet,2)
		If lastRow > numRows Then
		   lastRow = numRows
		End If
		
		allNumRows = numRows
				
	  End If

'Pagination code'
If cnt = 1 Then 

 If Request.QueryString("page") = "" Then
	
	iPageCurrent = 1

	'arrAllRecords = Session("arrAllRecords")	
	numRows = Ubound(arrAllEmpDet,2)
	
	 firstRow = 0  
	 If numRows > 9 Then
	    lastRow = 9  
	 Else
	 	lastRow = numRows
	 End If 
  Else
	
	arrAllEmpDet = Session("arrAllEmpDet")	
	numRows = Ubound(arrAllEmpDet,2)
	
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
 End if
rs.close


%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Feedback</title>
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
 
 function validate_form(thisform)
 {
	
	with (thisform)
    {
	   //Check To See If The Name Field Is Balnk     
		
		if (validate_required(Name,"Please enter the Name")==false)
			  {Name.focus();return false}
  
      //Check To See If The company Field Is Balnk     
		
		if (validate_required(company,"Please enter the Company Name")==false)
			  {company.focus();return false}
  
	  //Check To See If The dateofpassing Field Is Balnk     
		
		if (validate_required(dateofpassing,"Please enter the Date of Passing")==false)
			  {dateofpassing.focus();return false}
  
       //Check To See If The feedback Field Is Balnk     
		
		if (validate_required(feedback,"Please enter the Feedback")==false)
			  {feedback.focus();return false}

	}
}

  function Form_Validator2(theform)
{


 if (theform.company.value == "")
  {
     alert("Please enter company name to search.");
     theform.company.focus();
     return (false);
  }
  }
 
   function Form_Validator3(theform)
{


 if (theform.fname.value == "")
  {
     alert("Please enter name to search.");
     theform.fname.focus();
     return (false);
  }
  }
 
</script>
</head>
<body>
<h2><a href="ExamExp.asp">Feedback</a>
  <% If rqAction="addFeedback" then %>
  &raquo; Add Feedback
  <% ElseIf rqAction="editFeedback" then %>
  &raquo; Edit Feedback
  <%  ElseIf rqAction="deleteFeedback" then %>
  &raquo; Delete Feedback
  <% Else %>
  &raquo;Classroom Feedback Details &raquo; <a href="ExamExp.asp?action=addFeedback">Add</a>
  <% End If %>
</h2>
<div>
<% If rqAction="addFeedback" then %>
<h3> Add Feedback </h3>
<% ElseIf rqAction="editFeedback" then %>
<h3> Edit Feedback </h3>
<%  ElseIf rqAction="deleteFeedback" then %>
<h3> Delete Feedback </h3>
<% Else %>
<h3> Classroom Feedback Details</h3>
<% End If %>
<fieldset>
<% 
	If rqAction="addFeedback" then 
%>
<form action="addEditDelFeedback.asp" method="post" onSubmit="return validate_form(this)">
  <table border="0" width="50%">
    <tr>
      <td width="30%"><h4>Faculty Name</h4></td>
      <td ><input type="text" name="Name" size="30"/></td>
    </tr>
    <tr>
      <td><h4>Country</h4></td>
      <td><input type="text" name="country" size="30"/></td>
    </tr>
    <tr>
      <td><h4>Date of passing</h4></td>
      <td><input type="text" name="dateofpassing" size="30"/>
        Ex: (YYYY-MM-DD)</td>
    </tr>
    <tr>
      <td valign="top"><h4>Feedback</h4></td>
      <td><textarea cols="24" rows="10" name="feedback"></textarea></td>
    </tr>
    <tr>
      <td></td>
      <td align="left"><input type="submit" name="type" value="submit" /></td>
    </tr>
  </table>
</form>
<% 
	ElseIf rqAction="editFeedback" then 
	rqID=request.QueryString("id")
	strQuery="SELECT id,fname, company, dateofpassing, feedback FROM FacExam_feedback WHERE id='"&rqID&"' "
     rs.open strQuery,ConnObj

%>
<form action="addEditDelFeedback.asp" method="post" onsubmit="return validate_form(this)">
  <% do until rs.EOF %>
  <input type="hidden" name="id" value="<%=rs("id")%>"/>
  <table border="0" width="50%">
    <tr>
      <td width="30%"><h4>Name</h4></td>
      <td ><input type="text" name="Name" value="<%=rs("fname") %>"size="30"/></td>
    </tr>
    <tr>
      <td><h4>Company</h4></td>
      <td><input type="text" name="company" value="<%=rs("company") %>" size="30"/></td>
    </tr>
    <tr>
      <td><h4>Date of pasing</h4></td>
      <td><input type="text" name="dateofpassing" value="<%=rs("dateofpassing") %>"size="30"/></td>
    </tr>
    <tr>
      <td valign="top"><h4>Feedback</h4></td>
      <td><textarea cols="24" rows="10" name="feedback" ><%=rs("Feedback") %></textarea></td>
    </tr>
    <tr>
      <td></td>
      <td align="left"><input type="submit" name="type" value="update" /></td>
    </tr>
    <% rs.movenext
   loop
  rs.close%>
  </table>
</form>
<% Else

	strQuery="SELECT * FROM FacExam_feedback" 
	rs.open strQuery,ConnObj
%>


<table border="1" width="100%" cellpadding="5" cellspacing="0">
<tr>
  <td colspan="7"><table border="0" cellpadding="5" cellspacing="0" width="60%">
      <tr>
        <form action="ExamExp.asp" method="post" onsubmit="return Form_Validator2(this)">
          <td>Company:
            <input type="text" name="company" size="15" value="<% = rqCompany %>" />
            <input type="submit" name="search" value="Search" />
          </td>
        </form>
        <form action="ExamExp.asp" method="post" onsubmit="return Form_Validator3(this)">
          <td>Name:
            <input type="text" name="fname" size="15" value="<% = rqName %>" />
            <input type="submit" name="search" value="Search" />
          </td>
        </form>
      </tr>
    </table></td>
</tr>

<tr>
  <td colspan="7" align="right"><a href="ExamExp.asp?action=addFeedback">Add</a></td>
</tr>
<tr>
  <td width="50px"><h4>ID</h4></td>
  <td width="100px"><h4>Name</h4></td>
  <td width="100px"><h4>Company</h4></td>
  <td width="50px"><h4>Date of pasing</h4></td>
  <td width="150px"><h4>Feedback</h4></td>
  <td width="50px"><h4>Edit</h4></td>
  <td width="50px"><h4>Delete</h4></td>
</tr>
<% If IsArray(arrAllEmpDet) Then

      FOR rowcounter = firstRow TO lastRow

  %>
<tr>
  <td><% = arrAllEmpDet(0,rowcounter) %></td>
  <td><% = arrAllEmpDet(1,rowcounter) %></td>
  <td><% = arrAllEmpDet(2,rowcounter) %></td>
  <td><% = arrAllEmpDet(3,rowcounter) %></td>
  <td><% = arrAllEmpDet(4,rowcounter) %></td>
  <td><a href="ExamExp.asp?action=editFeedback&id=<% = arrAllEmpDet(0,rowcounter) %>">Edit</a></td>
  <td><a href="addEditDelFeedback.asp?action=deleteFeedback&id=<% = arrAllEmpDet(0,rowcounter) %>">Delete</a></td>
</tr>
<% Next %>
<tr id="htMap">
  <td colspan="8"><!--#include file="pagination.asp"-->
<% 
			    ps = getPaginationString(page, (numRows + 1), 10, 2, "ExamExp.asp?action="&rqAction&"")
				  Response.Write(ps)
	           %>
<% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
</td>
</tr>
<% End If %>
</table>
<%'End If %>
<% End If %>

</fieldset>
</div>
</body>
</html>
<%
 End If
%>