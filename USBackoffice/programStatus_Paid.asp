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
'Created Date: 24/08/2009'
'Last Updated Date: 24/08/2009'
'Description :'
'Purpose : Show all the Us enrollment details'

'Declare The Variables'
Dim strCourseIds, strEnrollments, strPaid ,strPayment
Dim objRs, objRs1,PO_Received ,PaymentDeclined ,paymentstatus
Dim CourseId, City, StartDate, EndDate ,UnderProcess
Dim TotalEnrollments, Paid, State_Code, Instructor

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")

'Retrive the values from this page'
'rqFromDate = Request.Form("fromDate")
'rqToDate   = Request.Form("toDate")
'rqCountry  = Request.Form("country")

'If fromdate is something then only if condtion will work'
'If rqFromDate <> "" Then

'strCourseIds = "SELECT courseid, city, startdate, enddate FROM ps_course WHERE country = 'US' AND status <> 'Cancelled' AND status <> 'Completed' ORDER BY startdate"

strCourseIds = "SELECT course.courseid, course.city, course.startdate, course.enddate, city.state_code, course.instructor FROM ps_course course, ps_city city WHERE course.city = city.city And (course.country = 'US' OR course.country = 'Canada') AND course.status <> 'Cancelled' AND course.status <> 'Completed' order by course.startdate, course.city asc"


objRs.Open strCourseIds,ConnObj

'End If
%>
<html>
<head>
<title>Program Status</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<table width="600px" border="1" class="table1" >
  <tr>
    <td width="50px"><b>City</b>  </td>
    <td width="200px"><b>Class Date</b></td>
    <td width="50px"><b>Total Enrollments</b></td>
    <td width="50px"><b>Payment Made</b></td>	
	<td width="50px"><b>Not Paid</b></td>
  </tr>
  <% Do Until objRs.EOF
   
     CourseId = objRs("courseid")
	 City = Trim(objRs("city"))
	 StartDate = objRs("startdate")
	 EndDate = objRs("enddate")
	 State_Code = objRs("state_code")
	 
	 'If (CDate(StartDate)-(Date()-1)>=0) Then
	 
		 strEnrollments = "SELECT count(*) AS Total FROM ps_enrolledusers WHERE courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule' And (us_status Is Null OR us_status <> 'Dummy')"
		 
		 objRs1.Open strEnrollments,ConnObj
		 
		 Do Until objRs1.EOF
			TotalEnrollments = objRs1("Total")
		 objRs1.Movenext
		 Loop
		 objRs1.Close
		 
		 strPaid = "SELECT count(*) AS Paid FROM ps_enrolledusers WHERE checkreceived = 'Yes' AND courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule' And (us_status Is Null OR us_status <> 'Dummy')"
		 
		 objRs1.Open strPaid,ConnObj	 
	
		 Do Until objRs1.EOF
			Paid = objRs1("Paid")
		 objRs1.Movenext
		 Loop
		 objRs1.Close
   %>
  <tr>
    <td><% = City %>, <% = State_Code %></td>
    <td><% = FormatDateTime(StartDate,1) %> to <% = FormatDateTime(EndDate,1) %></td>
	<td><% = TotalEnrollments %></td>
    <td><% = Paid %></td>
	<td><% = (TotalEnrollments - Paid) %></td>
  </tr>
 <% 
     'End If
     objRs.Movenext
     Loop
	 objRs.Close
     ConnObj.Close %>
</table>
</body>
</html>
<% End If %>

