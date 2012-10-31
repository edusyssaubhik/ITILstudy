<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<%
If Session("USBUserId") = "" Then
	Response.Redirect("login.asp")
Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'Written By : Bharath'
'Created Date: 17/08/2009'
'Last Updated Date: 20/08/2009'
'Description :'
'Purpose : Show all the calls received details'

'Declare The Variables'
Dim strCallDet, strUSCity, strCanadaCity
Dim objRs, objRsUSCity, objRsCID, objRsCanadaCity
Dim arrAllCallDet
Dim firstRow, lastRow, numRows
Dim rqPage, rqRow, rowcounter
Dim CallID, rqPaymentNotRec
Dim arrAllPayNotRec
Dim payNotRecFirstRow, payNotRecLastRow, payNotRecNumRows
Dim rqAction, rqPayNotRecRow, payNotRecRowcounter
Dim enrollId
Dim strPayment1, strPayment2, strPayment3, strPayment4
Dim disp, strPayNotRec
Dim rqCity, rqName, searchName, searchLastName, searchCity
Dim rqLastName, strCourseIds
Dim strPayNotRec1, strPayNotRec2, strPayNotRec3, strPayNotRec4


Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRsUSCity = Server.CreateObject("ADODB.Recordset")
Set  objRsCanadaCity = Server.CreateObject("ADODB.Recordset")
Set objRsCID = Server.CreateObject("ADODB.Recordset")



'Displaying all the Call Received and Enrolled Users code start here'

rqPage = Request.QueryString("page")
rqRow = Request.QueryString("row")
rqAction = Request.QueryString("action")

'Retrive the values from serach option in this page'
If Request.Form("city") <> "" Then
	rqCity = Request.Form("city")
Else
	rqCity = Request.QueryString("city")
End If

If Request.Form("name") <> "" Then
	rqName = Request.Form("name")
Else
	rqName = Request.QueryString("name")
End If

If Request.Form("lastname") <> "" Then
	rqLastName = Request.Form("lastname")
Else
	rqLastName = Request.QueryString("lastname")
End If

searchName = rqName & "%"

searchLastName = rqLastName & "%"

searchCity = rqCity & "%"

strUSCity = "SELECT city,state_code FROM ps_city WHERE country = 'US' ORDER BY city"

objRsUSCity.Open strUSCity,ConnObj

strCanadaCity = "SELECT city,state_code FROM ps_city WHERE country = 'Canada' ORDER BY city"

objRsCanadaCity.Open strCanadaCity,ConnObj

If rqAction = "paymentNotRec" OR rqAction = "paymentRec" Then


	If rqAction = "paymentNotRec" Then

		'If user selects city in the drop down that will come here'
		If rqCity <> "" Then

			strPayNotRec = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ps_enrolledusers WHERE (checkreceived Is Null OR checkreceived <> 'Yes') AND (country = 'US' OR country = 'Canada') And coursedetails like '"&searchCity&"' And (us_status Is Null OR us_status = 'Active') ORDER BY id desc"

		'If user entered lastname in the serach option that will come here'
		ElseIf rqLastName <> "" Then

			strPayNotRec = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ps_enrolledusers WHERE (checkreceived Is Null OR checkreceived <> 'Yes') AND (country = 'US' OR country = 'Canada') And lastname like '"&searchLastName&"' And (us_status Is Null OR us_status = 'Active') ORDER BY id desc"

		ElseIf rqCity = "" And rqLastName = "" Then


		strCourseIds = "SELECT courseid FROM ps_course Where startdate >= '"&now()&"'"

		objRsCID.Open strCourseIds,ConnObj

		Do Until objRsCID.EOF

			strPayNotRec1 = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ps_enrolledusers WHERE (checkreceived Is Null OR checkreceived <> 'Yes') AND (country = 'US' OR country = 'Canada') And (us_status Is Null OR us_status = 'Active')"

			strPayNotRec2 = strPayNotRec1 & " And courseid = '"&objRsCID("courseid")&"'"

			If strPayNotRec <> "" Then
			strPayNotRec3 = " UNION ALL "
			End If

			strPayNotRec = strPayNotRec &  strPayNotRec3 & strPayNotRec2

	        objRsCID.Movenext
		Loop
		objRsCID.Close

			strPayNotRec = strPayNotRec & " ORDER BY id desc"

		End If

	ElseIf rqAction = "paymentRec" Then

		'If user selects city in the drop down that will come here'
		If rqCity <> "" Then

			strPayNotRec = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ps_enrolledusers WHERE checkreceived = 'Yes' AND (country = 'US' OR country = 'Canada') And coursedetails like '"&searchCity&"' And (us_status Is Null OR us_status = 'Active') ORDER BY id desc"

		'If user entered lastname in the serach option that will come here'
		ElseIf rqLastName <> "" Then

			strPayNotRec = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ps_enrolledusers WHERE checkreceived = 'Yes' AND (country = 'US' OR country = 'Canada') And lastname like '"&searchLastName&"' And (us_status Is Null OR us_status = 'Active') ORDER BY id desc"

		ElseIf rqCity = "" And rqLastName = "" Then

		strCourseIds = "SELECT courseid FROM ps_course Where startdate >= '"&now()&"'"

		objRsCID.Open strCourseIds,ConnObj

		Do Until objRsCID.EOF

			strPayNotRec1 = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ps_enrolledusers WHERE checkreceived = 'Yes' AND (country = 'US' OR country = 'Canada') And (us_status Is Null OR us_status = 'Active')"
						strPayNotRec2 = strPayNotRec1 & " And courseid = '"&objRsCID("courseid")&"'"

			If strPayNotRec <> "" Then
			strPayNotRec3 = " UNION ALL "
			End If

			strPayNotRec = strPayNotRec &  strPayNotRec3 & strPayNotRec2

        objRsCID.Movenext
		Loop
		objRsCID.Close

			strPayNotRec = strPayNotRec & " ORDER BY id desc"

		End If

	End If

	objRs.Open strPayNotRec, ConnObj

	If Not objRs.EOF Then
		arrAllPayNotRec = objRs.getrows
		payNotRecFirstRow = 0
		payNotRecLastRow = 9
		payNotRecNumRows = Ubound(arrAllPayNotRec,2)
		If payNotRecLastRow > payNotRecNumRows Then
		   payNotRecLastRow = payNotRecNumRows
		End If
	End If

	objRs.Close

	If rqPage = "next" Then

	   payNotRecNumRows = Ubound(arrAllPayNotRec,2)

	   payNotRecFirstRow = rqRow + 1
	   payNotRecLastRow = payNotRecFirstRow + 9

	   If payNotRecFirstRow >= payNotRecNumRows Then
		  payNotRecFirstRow = rqRow + 1
		  payNotRecLastRow = payNotRecFirstRow + 9
	   End If

	   If payNotRecFirstRow < 0 Then
		  payNotRecFirstRow = 0
	   End If

	   If payNotRecLastRow > payNotRecNumRows Then
		  payNotRecLastRow = payNotRecNumRows
	   End If

	End If

	If rqPage = "previous" Then

	   payNotRecNumRows = Ubound(arrAllPayNotRec,2)

	   payNotRecLastRow = rqRow - 1
	   payNotRecFirstRow = payNotRecLastRow - 9

	   If payNotRecFirstRow =< 0 Then
		  payNotRecFirstRow = 0
		  payNotRecLastRow = payNotRecFirstRow + 9
	   End If

	   If payNotRecLastRow > payNotRecNumRows Then
		  payNotRecLastRow = payNotRecNumRows
	   End If

	End If

' End If

Else

If rqAction = "noFollowUp" Then

	'If user select city in the city dropdown of No Follow Up calls that will come here'
	If rqCity <> "" Then

	'Retrive the not follow up calls details based on city search'
	strCallDet = "SELECT callid, city, callername, phoneno, emailid, question, othercity, call_status, addeddate FROM ps_callsreceived WHERE Status = '1' And callfor = 'Classroom' And city = '"&rqCity&"' And (call_status Is Null OR call_status <> 'Dummy') ORDER BY callid desc"

	'If user entered name in the serach of No Follow Up calls that will come here'
	ElseIf rqName <> "" Then

	'Retrive the not follow up calls details based on lastname'
	strCallDet = "SELECT callid, city, callername, phoneno, emailid, question, othercity, call_status, addeddate FROM ps_callsreceived WHERE Status = '1' And callfor = 'Classroom' And callername like '"&searchName&"'  And (call_status Is Null OR call_status <> 'Dummy') ORDER BY callid desc"

	'If user as a admin, i am showing all the cities'
	ElseIf Session("City1") = "All" And rqCity = "" Then

	'Retrive the not follow up calls details for all the cities (ADMIN)'
	strCallDet = "SELECT callid, city, callername, phoneno, emailid, question, othercity, call_status, addeddate FROM ps_callsreceived WHERE Status = '1'  ORDER BY callid desc"

	ElseIf Session("City1") <> "All" And rqCity = "" Then

	'Retrive the not follow up calls details based on city'
	strCallDet = "SELECT callid, city, callername, phoneno, emailid, question, othercity, call_status, addeddate FROM ps_callsreceived WHERE Status = '1' And callfor = 'Classroom' And othercity = '' And (city = '"&Session("City1")&"' OR city = '"&Session("City2")&"' OR city = '"&Session("City3")&"' OR city = '"&Session("City4")&"' OR city = '"&Session("City5")&"' OR city = '"&Session("City6")&"' OR city = '"&Session("City7")&"' OR city = '"&Session("City8")&"' OR city = '"&Session("City9")&"' OR city = '"&Session("City10")&"' OR addedby = '"& Session("USBUserId") &"') And (call_status Is Null OR call_status <> 'Dummy')  ORDER BY callid desc"

	End If

ElseIf rqAction = "followUp" Then

	'If user select city in the city dropdown of Follow Up calls that will come here'
	If rqCity <> "" Then

	'Retrive the not follow up calls details based on city search'
	strCallDet = "SELECT callid, city, callername, phoneno, emailid, question, othercity, call_status, addeddate FROM ps_callsreceived WHERE Status = '2' And callfor = 'Classroom' And city = '"&rqCity&"' And (call_status Is Null OR call_status <> 'Dummy') ORDER BY callid desc"

	'If user entered name in the serach of Follow Up calls that will come here'
	ElseIf rqName <> "" Then

	'Retrive the follow up calls details based on lastname'
	strCallDet = "SELECT callid, city, callername, phoneno, emailid, question, othercity, call_status, addeddate FROM ps_callsreceived WHERE Status = '2' And callfor = 'Classroom' And callername like '"&searchName&"' And (call_status Is Null OR call_status <> 'Dummy') ORDER BY callid desc"

	'If user as a admin, i am showing all the cities'
	ElseIf Session("City1") = "All" And rqCity = "" Then

	'Retrive the follow up calls details for all the cities (ADMIN)'
	strCallDet = "SELECT callid, city, callername, phoneno, emailid, question, othercity, call_status, addeddate FROM ps_callsreceived WHERE Status = '2' ORDER BY callid desc"

	ElseIf Session("City1") <> "All" And rqCity = "" Then

	'Retrive the follow up calls details based on city'
	strCallDet = "SELECT callid, city, callername, phoneno, emailid, question, othercity, call_status, addeddate FROM ps_callsreceived WHERE Status = '2' And callfor = 'Classroom' And othercity = '' And (city = '"&Session("City1")&"' OR city = '"&Session("City2")&"' OR city = '"&Session("City3")&"' OR city = '"&Session("City4")&"' OR city = '"&Session("City5")&"' OR city = '"&Session("City6")&"' OR city = '"&Session("City7")&"' OR city = '"&Session("City8")&"' OR city = '"&Session("City9")&"' OR city = '"&Session("City10")&"' OR addedby = '"& Session("USBUserId") &"') And (call_status Is Null OR call_status <> 'Dummy') ORDER BY callid desc"


	End If

ElseIf rqAction = "closed" Then

	'If user select city in the city dropdown of Closed calls that will come here'
	If rqCity <> "" Then

	'Retrive the closed calls details based on city search'
	strCallDet = "SELECT callid, city, callername, phoneno, emailid, question, othercity, call_status, addeddate FROM ps_callsreceived WHERE Status = '3' And callfor = 'Classroom' And city = '"&rqCity&"' And (call_status Is Null OR call_status <> 'Dummy') ORDER BY callid desc"

	'If user entered name in the serach of Closed calls that will come here'
	ElseIf rqName <> "" Then

	'Retrive the Closed calls details based on lastname'
	strCallDet = "SELECT callid, city, callername, phoneno, emailid, question, othercity, call_status, addeddate FROM ps_callsreceived WHERE Status = '3' And callfor = 'Classroom' And callername like '"&searchName&"' And (call_status Is Null OR call_status <> 'Dummy') ORDER BY callid desc"

	'If user as a admin, i am showing all the cities'
	ElseIf Session("City1") = "All" And rqCity = "" Then

	'Retrive the Closed calls details for all the cities (ADMIN)'
	strCallDet = "SELECT callid, city, callername, phoneno, emailid, question, othercity, call_status, addeddate FROM ps_callsreceived WHERE Status = '3' ORDER BY callid desc"

	ElseIf Session("City1") <> "All" And rqCity = "" Then

	'Retrive the Closed calls details based on city'
   	strCallDet = "SELECT callid, city, callername, phoneno, emailid, question, othercity, call_status, addeddate FROM ps_callsreceived WHERE Status = '3' And callfor = 'Classroom' And othercity = '' And (city = '"&Session("City1")&"' OR city = '"&Session("City2")&"' OR city = '"&Session("City3")&"' OR city = '"&Session("City4")&"' OR city = '"&Session("City5")&"' OR city = '"&Session("City6")&"' OR city = '"&Session("City7")&"' OR city = '"&Session("City8")&"' OR city = '"&Session("City9")&"' OR city = '"&Session("City10")&"' OR addedby = '"& Session("USBUserId") &"') And (call_status Is Null OR call_status <> 'Dummy')  ORDER BY callid desc"

	End If

End If

objRs.Open strCallDet, ConnObj

If Not objRs.EOF Then
	arrAllCallDet = objRs.getrows
	firstRow = 0
	lastRow = 9
	numRows = Ubound(arrAllCallDet,2)
	If lastRow > numRows Then
	   lastRow = numRows
	End If
End If

objRs.Close

If rqPage = "next" Then

   numRows = Ubound(arrAllCallDet,2)

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

   numRows = Ubound(arrAllCallDet,2)

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

End If

'Displaying all the Call Received and Enrolled Users code end here'



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Marketing B2C</title>
<!-- CSS -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<!--[if IE 6]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie6.css" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie7.css" /><![endif]-->
<!-- JavaScripts-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jNice.js"></script>
<script language="javascript">
function Form_Validator(theform)
{

	if (theform.comment.value == "")
	{
	 alert("Please enter the comment");
	 theform.comment.focus();
	 return (false);
	}

}

function Form_Validator1(theform)
{

	if (theform.status.value == "")
	{
	 alert("Please select the status");
	 theform.status.focus();
	 return (false);
	}

}

</script>
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
      <h2><a href="home.asp">Home</a> &raquo; <a href="marketingB2C.asp?action=noFollowUp" class="active">Marketing B2C</a> &raquo;
        <% If rqAction = "noFollowUp" Then %>
        Calls to be made
        <% ElseIf rqAction = "followUp" Then %>
        Calls to be followed up
        <% ElseIf rqAction = "closed" Then %>
        Closed calls
        <% ElseIf rqAction = "paymentNotRec" Then %>
        Payment not received
        <% ElseIf rqAction = "paymentRec" Then %>
        &raquo; Payment received
        <% End If %>
      </h2>
      <div>&nbsp;</div>
   <!--<div style="margin-left:211px;">
        <table width="100%">
          <tr><br />
            <td width="17%"><form action="newCall.asp" method="post">
                <input type="submit" value="Add New B2C Prospect" />
              </form></td>
            <td><form action="/enrollClass.asp" method="post" target="_blank">
                <input type="hidden" name="usInstEmailId" value="<% = Session("USBUserId") %>" />
                <input type="submit" value="Add New Enrollment" />
              </form></td>
          </tr>
        </table>
      </div>-->
      <div>&nbsp;</div>
      <div id="topbar" style="margin-left:31px;">
        <ul class="topNav">
          <li><a href="marketingB2C.asp?action=noFollowUp">Calls to be made</a></li>
        </ul>
      </div>
      <div id="topbar" style="margin-left:- 30px;">
        <ul class="topNav">
          <li><a href="marketingB2C.asp?action=followUp">Calls to be followed up</a></li>
        </ul>
      </div>
      <div id="topbar" style="margin-left:5px;">
        <ul class="topNav">
          <li><a href="marketingB2C.asp?action=closed">Closed calls</a></li>
        </ul>
      </div>
      <div id="topbar" style="margin-left:-35px;">
        <ul class="topNav">
          <li><a href="marketingB2C.asp?action=paymentNotRec">Enrolled but not paid</a></li>
        </ul>
      </div>
      <div id="topbar" style="margin-left:-5px;">
        <ul class="topNav">
          <li><a href="marketingB2C.asp?action=paymentRec">Enrolled paid</a></li>
        </ul>
      </div>
      <div id="main">

		<% If rqAction = "paymentNotRec" OR rqAction = "paymentRec" Then %>
        <table width="100%">
          <tr>
            <td width="20%">
              <% If rqAction = "paymentNotRec" Then %>
              <h3>Payment Not Received</h3>
              <% ElseIf rqAction = "paymentRec" Then %>
              <h3>Payment Received</h3>
              <% End If %>
            </td>
            <form action="marketingB2C.asp?action=<% = rqAction %>" method="post">
            <td width="35%">City :
              <select name="city">
                <option value="">-Select-</option>
				<optgroup label="US">
                <% Do Until objRsUSCity.EOF %>
                <option <% If rqCity = objRsUSCity("city") Then %> selected="selected" <% End If %> value="<% = objRsUSCity("city") %>">
                <% = objRsUSCity("city") %>, <% = objRsUSCity("state_code") %>
                </option>
                <% objRsUSCity.Movenext
				   Loop
				   objRsUSCity.Close %>
				</optgroup>
				<optgroup label="Canada">
				<% Do Until objRsCanadaCity.EOF %>
                <option <% If rqCity = objRsCanadaCity("city") Then %> selected="selected" <% End If %> value="<% = objRsCanadaCity("city") %>">
                <% = objRsCanadaCity("city") %>, <% = objRsCanadaCity("state_code") %>
                </option>
                <% objRsCanadaCity.Movenext
				   Loop
				   objRsCanadaCity.Close %>
				</optgroup>
              </select>
              <input type="submit" name="search" value="Search" />
            </td>
            </form>
	        <form action="marketingB2C.asp?action=<% = rqAction %>" method="post">
            <td>Last Name :
              <input type="text" name="lastname" size="15" value="<% = rqLastName %>" />
              <input type="submit" name="search" value="Search" />
            </td>
            </form>
          </tr>
        </table>
        <fieldset>
        <table border="2" cellpadding="0" cellspacing="0" class="table1" width="100%">
          <tr>
            <td bgcolor="#A7DBFB" align="center"><b>Name</b></td>
            <td bgcolor="#A7DBFB" align="center" width="50%"><b>Course Details</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Phone Number</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Email Id</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Name of Employer</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Date of Enrollment</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Comments</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>History</b></td>
            <% If rqAction = "paymentNotRec" Then %>
            <td bgcolor="#A7DBFB" align="center"><b>Status</b></td>
            <% End If %>
          </tr>
          <% If IsArray(arrAllPayNotRec) Then
						      For payNotRecRowcounter = payNotRecFirstRow To payNotRecLastRow
							  enrollId = arrAllPayNotRec(7,payNotRecRowcounter) %>
          <% If arrAllPayNotRec(8,payNotRecRowcounter) <> "" And arrAllPayNotRec(8,payNotRecRowcounter) <> "Active" Then %>
          <tr class="even">
            <% Else %>
          <tr>
            <% End If %>
            <td><% = arrAllPayNotRec(0,payNotRecRowcounter) %>
              &nbsp;
              <% = arrAllPayNotRec(1,payNotRecRowcounter) %></td>
            <td><% = arrAllPayNotRec(5,payNotRecRowcounter) %></td>
            <td><% = arrAllPayNotRec(4,payNotRecRowcounter) %></td>
            <td><% = arrAllPayNotRec(2,payNotRecRowcounter) %></td>
            <td><% = arrAllPayNotRec(3,payNotRecRowcounter) %></td>
            <td><% = arrAllPayNotRec(6,payNotRecRowcounter) %></td>
            <form name="comment" action="addEnrollComments.asp" method="post" onsubmit="return Form_Validator(this)">
              <input type="hidden" name="enrollid" value="<% = enrollId %>">
              <input type="hidden" name="action" value="<% = rqAction %>" />
			  <input type="hidden" name="page" value="<% = rqPage %>" />
			  <input type="hidden" name="row" value="<% = rqRow %>" />
			  <input type="hidden" name="city" value="<% = rqCity %>" />
			  <input type="hidden" name="lastname" value="<% = rqLastName %>" />			  
              <td><Textarea name="comment" rows="5" cols="20" ></Textarea>
                <input type="submit" name="type" value="Save">
            </form>
            </td>
            <td><iframe src="enroll_comments.asp?enrollid=<% = enrollId %>" frameborder="0" height="100" scrolling="yes" width="200"></iframe></td>
            <form name="comment" action="addEnrollComments.asp" method="post" onsubmit="return Form_Validator1(this)">

              <input type="hidden" name="enrollid" value="<% = enrollId %>">
              <input type="hidden" name="action" value="<% = rqAction %>" />
			  <input type="hidden" name="page" value="<% = rqPage %>" />
			  <input type="hidden" name="row" value="<% = rqRow %>" />
			  <input type="hidden" name="city" value="<% = rqCity %>" />
			  <input type="hidden" name="lastname" value="<% = rqLastName %>" />			  
              <td><br />
                <% If rqAction = "paymentNotRec" Then %>
                <% If IsNull(arrAllPayNotRec(8,payNotRecRowcounter)) Then %>
                <select name="status">
                  <option value="">--Select--</option>
                  <option value="Dummy">Dummy</option>
                  <option value="Closed enrollment - student not interested">Closed enrollment - student not interested</option>
                </select>
                <br />
                <br />
                <input type="submit" name="type" value="Submit" />
                <% Else %>
                <select name="status">
                  <option value="">--Select--</option>
                  <option value="Dummy">Dummy</option>
                  <option value="Closed enrollment - student not interested">Closed enrollment - student not interested</option>
                </select>
                <br />
                <br />
                <input type="submit" name="type" value="Submit" />
                <% = arrAllPayNotRec(8,payNotRecRowcounter) %>
                added by
                <% = arrAllPayNotRec(9,payNotRecRowcounter) %>
                <% End If %>
                <% End If %>
              </td>
            </form>
            <!-- <td class="action"><a href="payNotReceived.asp?enrollUserId=<% '=  enrollId %>" class="addcomments" target="_blank">Send Email</a></td>			-->
          </tr>
          <% Next %>
          <tr>
            <td colspan="9"><% If Not payNotRecFirstRow = 0 Then %>
              <a href="marketingB2C.asp?action=<% = rqAction %>&<% If rqCity <> "" Then %>city=<% = rqCity %>&<% End If %><% If rqLastName <> "" Then %>lastname=<% = rqLastName %>&<% End If %>page=previous&row=<% = payNotRecFirstRow %>"> &lt;&lt;Previous</a>
              <% End If %>
              <% = ((payNotRecFirstRow + 1) & " - " & (payNotRecLastRow + 1) & " of " & (payNotRecNumRows + 1)) %>
              <% If Not payNotRecNumRows = payNotRecLastRow Then %>
              <a href="marketingB2C.asp?action=<% = rqAction %>&<% If rqCity <> "" Then %>city=<% = rqCity %>&<% End If %><% If rqLastName <> "" Then %>lastname=<% = rqLastName %>&<% End If %>page=next&row=<% = payNotRecLastRow %>"> &gt;&gt;Next</a>
              <% End If %>
            </td>
          </tr>
          <% End If %>
        </table>
        </fieldset>
        <% ElseIf rqAction = "noFollowUp" OR rqAction = "followUp" OR rqAction = "closed" Then %>
        <table width="100%">
          <tr>
            <td width="20%"><% If rqAction = "noFollowUp" Then %>
              <h3>No Follow Up Calls</h3>
              <% ElseIf rqAction = "followUp" Then %>
              <h3>Follow Up Calls</h3>
              <% ElseIf rqAction = "closed" Then %>
              <h3>Closed Calls</h3>
              <% End If %>
            </td>
           <form action="marketingB2C.asp?action=<% = rqAction %>" method="post">
            <td width="35%">City :
              <select name="city">
                <option value="">-Select-</option>
				<optgroup label="US">
                <% Do Until objRsUSCity.EOF %>
                <option <% If rqCity = objRsUSCity("city") Then %> selected="selected" <% End If %> value="<% = objRsUSCity("city") %>">
                <% = objRsUSCity("city") %>, <% = objRsUSCity("state_code") %>
                </option>
                <% objRsUSCity.Movenext
				   Loop
				   objRsUSCity.Close %>
				</optgroup>
				<optgroup label="Canada">
				<% Do Until objRsCanadaCity.EOF %>
                <option <% If rqCity = objRsCanadaCity("city") Then %> selected="selected" <% End If %> value="<% = objRsCanadaCity("city") %>">
                <% = objRsCanadaCity("city") %>, <% = objRsCanadaCity("state_code") %>
                </option>
                <% objRsCanadaCity.Movenext
				   Loop
				   objRsCanadaCity.Close %>
				</optgroup>
              </select>
              <input type="submit" name="search" value="Search" />
            </td>
            </form>
            <form action="marketingB2C.asp?action=<% = rqAction %>" method="post">
            <td>Name :
              <input type="text" name="name" size="15" value="<% = rqName %>" />
              <input type="submit" name="search" value="Search" />
            </td>
            </form>
          </tr>
        </table>
        <fieldset>
        <table border="2" cellpadding="0" cellspacing="0" class="table1" width="900px">
          <tr>
            <td bgcolor="#A7DBFB" align="center"><b>City</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Name</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Phone Number</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Email Id</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Question</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Comments</b></td>
            <% If rqAction <> "noFollowUp" Then %>
            <td bgcolor="#A7DBFB" align="center"><b>History</b></td>
            <% End If %>
            <td bgcolor="#A7DBFB" align="center"><b>Email</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Status</b></td>
          </tr>
          <% If IsArray(arrAllCallDet) Then
						      For rowcounter = firstRow To lastRow
							  CallID = arrAllCallDet(0,rowcounter) %>
          <tr>
            <td><% If arrAllCallDet(1,rowcounter) <> "" Then %>
              <% = arrAllCallDet(1,rowcounter) %>
              <% Else %>
              <% = arrAllCallDet(6,rowcounter) %>
              <% End If %>
            </td>
            <td><% = arrAllCallDet(2,rowcounter) %></td>
            <td><% = arrAllCallDet(3,rowcounter) %></td>
            <td><% = arrAllCallDet(4,rowcounter) %></td>
            <td><% = arrAllCallDet(5,rowcounter) %><br />Added date: <% = FormatDateTime(arrAllCallDet(8,rowcounter),2) %></td>
            <td>
			<form name="comment" action="addComments.asp" method="post" onsubmit="return Form_Validator(this)">
              <input type="hidden" name="callid" value="<% = CallID %>">
              <Textarea name="comment" rows="5" cols="20" ></Textarea>
                <BR />
                <input type="hidden" name="action" value="<% = rqAction %>" />
				<input type="hidden" name="page" value="<% = rqPage %>" />
				<input type="hidden" name="row" value="<% = rqRow %>" />
				<input type="hidden" name="city" value="<% = rqCity %>" />
                <input type="submit" name="type" value="Save">
                <% If rqAction <> "closed" Then %>
                <input type="submit" name="type" value="Close" />
                <% End If %>
            </form>
            </td>
            <% If rqAction <> "noFollowUp" Then %>
            <td><iframe src="fac_comments.asp?callid=<% = CallId %>" frameborder="0" height="100" scrolling="yes" width="200"></iframe></td>
            <% End If %>
            <td class="action" width="75px"><% If arrAllCallDet(4,rowcounter) <> "" Then %>
              <a href="sendmail.asp?callid=<% = CallID %>" class="addcomments" target="_blank">Send Email</a>
              <% Else %>
              &nbsp;
              <% End If %>
            </td>
            <form name="comment" action="addComments.asp" method="post" onsubmit="return Form_Validator1(this)">
              <input type="hidden" name="callId" value="<% = CallId %>">
              <input type="hidden" name="action" value="<% = rqAction %>" />
			  <input type="hidden" name="page" value="<% = rqPage %>" />
			  <input type="hidden" name="row" value="<% = rqRow %>" />
		      <input type="hidden" name="city" value="<% = rqCity %>" />
              <td><br />
                <% If IsNull(arrAllCallDet(7,rowcounter)) Then %>
                <select name="status">
                  <option value="">--Select--</option>
                  <option value="Dummy">Dummy</option>
                  <option value="No follow up required">No follow up required</option>
                </select>
                <br />
                <br />
                <input type="submit" name="type" value="Submit" />
                <% Else %>
                <% = arrAllCallDet(7,rowcounter) %>
                <% End If %>
              </td>
            </form>
          </tr>
          <% Next %>
          <tr>
            <td colspan="9"><% If Not firstRow = 0 Then %>
              <a href="marketingB2C.asp?action=<% = rqAction %>&<% If rqCity <> "" Then %>city=<% = rqCity %>&<% End If %><% If rqName <> "" Then %>name=<% = rqName %>&<% End If %>page=previous&row=<% = firstRow %>"> &lt;&lt;Previous</a>
              <% End If %>
              <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
              <% If Not numRows = lastRow Then %>
              <a href="marketingB2C.asp?action=<% = rqAction %>&<% If rqCity <> "" Then %>city=<% = rqCity %>&<% End If %><% If rqName <> "" Then %>name=<% = rqName %>&<% End If %>page=next&row=<% = lastRow %>"> &gt;&gt;Next</a>
              <% End If %>
            </td>
          </tr>
          <% End If %>
        </table>
        </fieldset>
        <% End If %>
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