<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 'OPTION EXPLICIT %>
<% 
If Session("USBUserId") = "" Then 
	Response.Redirect("login.asp")
Else
%>
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/connection_global.asp"-->
<head>
<%  
'======================================================='
'Written By : savita'
'Written Date : 2/12/2011'
'Last UpDated : 2/12/2011'
'Description :'
'This page is for Faculty Feedback '
'======================================================='

'Declaring variables'
Dim rqId,rqPage,rqRow,strInstructors,rqName
Dim strQuery,arrAllEmpDet,firstRow, lastRow, numRows, rowcounter

'Retriving the values'
If Request.QueryString("action") <> "" Then
	rqAction = Request.QueryString("action")
Else
	rqAction = Request.Form("action")
End If
rqPage = Request.QueryString("page")
rqRow  = Request.QueryString("row")

'Creating the recordset'
Set rs=server.CreateObject("ADODB.recordset")
Set objRsInst = Server.CreateObject("ADODB.Recordset")


If Request.Form("fname") <> "" Then
	rqName = Request.Form("fname")
Else
	rqName = Request.QueryString("fname")
End If

searchName = Trim(rqName)
	
	If rqName <> "" Then
rs.open "SELECT * FROM FacExam_feedback Where fname like '%"&rqName&"%'  ORDER BY dateofpassing DESC",ConnObj
'Response.Write("SELECT * FROM FacExam_feedback Where fname like '%"&rqName&"%'  ORDER BY dateofpassing DESC")
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


If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then

	strInstructors = "SELECT firstname, lastname FROM ps_us_instructors WHERE typeofuser = 'Faculty' And (country = 'US' OR country = 'Canada') ORDER BY firstname"
	
	objRsInst.Open strInstructors, ConnObj1

Else 

	strInstructors = "SELECT firstname, lastname FROM ITIL_instructor WHERE typeofuser = 'Faculty' And country = '"& Session("CRM_Country") &"' ORDER BY firstname"
	
	objRsInst.Open strInstructors, ConnObj

End If


%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Faculty Exam Experience</title>
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
		
		if (validate_required(name,"Please select the Name")==false)
			  {name.focus();return false}
  
      //Check To See If The country Field Is Balnk     
		
		if (validate_required(country,"Please select the country Name")==false)
			  {country.focus();return false}
  
	  //Check To See If The dateofpassing Field Is Balnk     
		
		if (validate_required(dateofpassing,"Please enter the Date of Passing")==false)
			  {dateofpassing.focus();return false}
  
       //Check To See If The feedback Field Is Balnk     
		
		if (validate_required(feedback,"Please enter the Feedback")==false)
			  {feedback.focus();return false}

	}
}
 
</script>
<!-- CSS -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<!--[if IE 6]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie6.css" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie7.css" /><![endif]-->
<!-- JavaScripts-->
<script type="text/javascript" src="js/richtext.js"></script>

</head>
<body>
<div id="wrapper">
  <!--#include file="includes/topMenu.asp"-->
  <!-- // #end mainNav -->
  <div id="containerHolder">
    <div id="container">
      <div id="sidebar">
        <!--#include file="includes/leftMenu.asp"-->
        <!-- // .sideNav -->
      </div>
      <!-- // #sidebar -->
      <!-- h2 stays for breadcrumbs -->
      <h2><a href="home.asp">Home</a> &raquo; <a href="ExamExp.asp" class="active">Faculty Exam Experiences</a>
       <% If  Session("TypeOfUser") = "Admin" Then %>
	    <% If rqAction = "addFeedback" Then %>
        &raquo; Add Faculty Feedback
        <% End If %>
		 <% End If %>
      </h2>
      <div id="topbar" style="margin-left:31px;">
	  <% If  Session("TypeOfUser") = "Admin" Then %>
        <ul class="topNav">
          <li><a href="ExamExp.asp?action=addFeedback">Add Faculty Feedback</a></li>
        </ul>
		 <% End If %>
      </div>
	  
      
	  <div id="main">
	  <table width="60%" >
          <tr>
            <td width="10%">
        <% If rqAction = "addFeedback" AND Session("TypeOfUser") = "Admin" Then %>
        <h3>Add Faculty Feedback</h3>
        <% Else %>
        <h3>View Faculty Feedback</h3>
        <% End If %>
		</td>
		  <% If rqAction <> "addFeedback" And rqAction <> "editFeedback"  Then %>
 		<form action="ExamExp.asp" method="post">
		  <td width="10%">Name:
			<input type="text" name="fname" size="15" value="<% = rqName %>" />
			<input type="submit" name="search" value="Search" />
		  </td>
		</form>
		<% End If %>
		</tr></table>
	   
	    <fieldset>
        <% If rqAction = "addFeedback" Then %>
       <form action="addEditDelFeedback.asp" method="post" onSubmit="return validate_form(this)">
  <table border="0" width="50%">
    <tr>
      <td width="30%">Faculty Name</td>
      <td > <select name="name">
                  <option value="">-Select-</option>
                  <% If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then %>
                  <% Do Until objRsInst.EOF %>
                  <option <% If rqInst = objRsInst("firstname") & " "& objRsInst("lastname") Then %> selected="selected" <% End If %> value="<% = Trim(objRsInst("firstname")) & " "& Trim(objRsInst("lastname")) %>">
                  <% = objRsInst("firstname") & " "& objRsInst("lastname") %>
                  </option>
                  <% objRsInst.Movenext
				   Loop
				   objRsInst.Close %>
                  <% Else %>
                  <% Do Until objRsInst.EOF %>
                  <option <% If rqInst = objRsInst("firstname") & " "& objRsInst("lastname") Then %> selected="selected" <% End If %> value="<% = Trim(objRsInst("firstname")) & " "& Trim(objRsInst("lastname")) %>">
                  <% = objRsInst("firstname") & " "& objRsInst("lastname") %>
                  </option>
                  <% objRsInst.Movenext
				   Loop
				   objRsInst.Close %>
                  <% End If %>
                </select></td>
    </tr>
    <tr>
      <td>Country</td>
      <td> <select name="country">
	   	<option value="">--Select--</option>
		<option value="US">US</option>
		<option value="Canada">Canada</option>
        <option  value="UAE">UAE</option>
        <option  value="Singapore">Singapore</option>
        <option  value="India">India</option>
        <option  value="United Kingdom">United Kingdom</option>
    	</select></td>
    </tr>
    <tr>
      <td>Date of passing</td>
      <td><input type="text" name="dateofpassing" size="30"/>
        Ex: (MM-DD-YYYY)</td>
    </tr>
    <tr>
      <td valign="top">Feedback</td>
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
	strQuery="SELECT id,fname, country, dateofpassing, feedback FROM FacExam_feedback WHERE id='"&rqID&"' "
     rs.open strQuery,ConnObj

%>
<form action="addEditDelFeedback.asp" method="post" onSubmit="return validate_form(this)">
  <% do until rs.EOF %>
  <input type="hidden" name="id" value="<%=rs("id")%>"/>
  <table border="0" width="50%">
    <tr>
      <td width="30%">Name</td>
      <td ><select name="name">
	  <option value="<% = rs("fname") %>">
                <% = rs("fname") %>
                </option>
                 <option value="" disabled="disabled">--Select--</option>
                  <% If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then %>
                  <% Do Until objRsInst.EOF %>
                  <option <% If rs("fname") = objRsInst("firstname") & " "& objRsInst("lastname") Then %> selected="selected" <% End If %> value="<% = Trim(objRsInst("firstname")) & " "& Trim(objRsInst("lastname")) %>">
                  <% = objRsInst("firstname") & " "& objRsInst("lastname") %>
                  </option>
                  <% objRsInst.Movenext
				   Loop
				   objRsInst.Close %>
                  <% Else %>
                  <% Do Until objRsInst.EOF %>
                  <option <% If rs("fname") = objRsInst("firstname") & " "& objRsInst("lastname") Then %> selected="selected" <% End If %> value="<% = Trim(objRsInst("firstname")) & " "& Trim(objRsInst("lastname")) %>">
                  <% = objRsInst("firstname") & " "& objRsInst("lastname") %>
                  </option>
                  <% objRsInst.Movenext
				   Loop
				   objRsInst.Close %>
                  <% End If %>
                </select></td>
    </tr>
    <tr>
      <td>Country</td>
      <td><select name="country">
	   	<option value="">--Select--</option>
		<option <% If rs("country") = "US" Then %> selected="selected" <% End If %> value="US">US</option>
		<option <% If rs("country") = "Canada" Then %> selected="selected" <% End If %> value="Canada">Canada</option>
        <option  <% If rs("country") = "UAE" Then %> selected="selected" <% End If %> value="UAE">UAE</option>
        <option  <% If rs("country") = "Singapore" Then %> selected="selected" <% End If %> value="Singapore">Singapore</option>
        <option  <% If rs("country") = "India" Then %> selected="selected" <% End If %> value="India">India</option>
         <option  <% If rs("country") = "United Kingdom" Then %> selected="selected" <% End If %> value="United Kingdom">United Kingdom</option>
        
	   </select></td>
    </tr>
    <tr>
      <td>Date of passing</td>
      <td><input type="text" name="dateofpassing" value="<%=rs("dateofpassing") %>"size="30"/></td>
    </tr>
    <tr>
      <td valign="top">Feedback</td>
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


 
 <table border="0" width="100%" cellpadding="3" cellpadding="5" class="table1">

<tr>
 <td width="50px"><b>SrNo</b></td>
  <td width="100px"><b>Name</b></td>
  <td width="75px"><b>Country</b></td>
  <td width="75px"><b>Date of passing</b></td>
  <td width="150px"><b>Feedback</b></td>
  <% If  Session("TypeOfUser") = "Admin" Then %>
  <td width="50px"><b>Edit</b></td>
  <td width="50px"><b>Delete</b></td>
  <%End If%>
</tr>
<% 
 		SrNo = 1
	  If IsArray(arrAllEmpDet) Then

      FOR rowcounter = firstRow TO lastRow

  %>
<tr>
  <td><% = SrNo %></td>
  <td><% = arrAllEmpDet(1,rowcounter) %></td>
  <td><% = arrAllEmpDet(2,rowcounter) %></td>
  <td><% = arrAllEmpDet(3,rowcounter) %></td>
  <td><% = arrAllEmpDet(4,rowcounter) %></td>
    <% If  Session("TypeOfUser") = "Admin" Then %>
  <td><a href="ExamExp.asp?action=editFeedback&id=<% = arrAllEmpDet(0,rowcounter) %>">Edit</a></td>
  <td><a href="addEditDelFeedback.asp?action=deleteFeedback&id=<% = arrAllEmpDet(0,rowcounter) %>">Delete</a></td>
   <%End If%>
</tr>
<% SrNo = SrNo+1 %>
      <% Next %>
<%' Next %>
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
<% End If %>
       
	    </fieldset>
      </div>
      <!-- // #main -->
      <div class="clear"></div>
    </div>
    <!-- // #container -->
  </div>
  <!-- // #containerHolder -->
  <p id="footer">&nbsp;</p>
</div>
<!-- // #wrapper -->
</body>
</html>
<% End If %>
