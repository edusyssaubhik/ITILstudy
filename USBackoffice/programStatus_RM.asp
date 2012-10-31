<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<% 
	If Session("USBUserId") = "" Then 
		Response.Redirect("login.asp")
	Else
%>
<!--#include virtual="/includes/conn_rm.asp"-->
<%
'Written By : Bharath'
'Created Date: 24/08/2009'
'Modified By: 24/08/2009'
'Last Updated Date: 25/02/2011'
'Description :'
'Purpose : Show all the Us enrollment details'

'Declare The Variables'
Dim ConnObj, ConnObj1, strCourseIds, strEnrollments, strPaid ,strPayment
Dim objRs, objRs1,PO_Received ,PaymentDeclined ,paymentstatus
Dim CourseId, City, CourseDate, EndDate ,UnderProcess
Dim TotalEnrollments, Paid, State_Code, Instructor, strCountry

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")

'Display the queries country wise'
If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then
	strCountry = "(course.country = 'US' OR course.country = 'Canada')"
ElseIf Session("CRM_Country") = "United Kingdom" Then
	strCountry = "(course.country = 'United Kingdom')"
End If	

'Display the queries country wise'
If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then
	strCountry = "(course.country = 'US' OR course.country = 'Canada')"
ElseIf Session("CRM_Country") = "United Kingdom" Then
	strCountry = "(course.country = 'United Kingdom')"
ElseIf Session("CRM_Country") = "UAE" Then
	strCountry = "(course.country = 'UAE')"
ElseIf Session("CRM_Country") = "Singapore" Then
	strCountry = "(course.country = 'Singapore')"
ElseIf Session("CRM_Country") = "Global" Then	
	strCountry = "(course.country = 'US' OR course.country = 'Canada')"
	Session("CRM_Country") = "US"
End If	


Session.Timeout = 60

'strCourseIds = "SELECT courseid, city, CourseDate, enddate FROM rm_course WHERE country = 'US' AND status <> 'Cancelled' AND status <> 'Completed' ORDER BY CourseDate"

strCourseIds = "SELECT course.courseid, course.city, course.CourseDate, city.state_code, course.instructor FROM rm_course course, rm_city city WHERE course.city = city.city And "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.CourseDate >= '"&Now() - 1&"' order by course.CourseDate, course.city asc"


objRs.Open strCourseIds,ConnObj
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
    <!--<td width="200px"><b>Instructor<font color="red" size="2">*</font></b></td>	-->
    <td width="50px"><b>Total Enrollments</b></td>
    <td width="50px"><b>Payment Made</b></td>	
	<td width="50px"><b>P.O Received</b></td>
    <td width="50px"><b>Payment Declined</b></td>	
	<td width="50px"><b>Under Process</b></td>	
	<td width="50px"><b>Not Paid</b></td>
  </tr>
  <% Do Until objRs.EOF
   
     CourseId = objRs("courseid")
	 City = Trim(objRs("city"))
	 CourseDate = objRs("CourseDate")
	 State_Code = objRs("state_code")
	 Instructor = objRs("instructor")
	 
	 If (CDate(CourseDate)-(Date()-1)>=0) Then
	 
		 strEnrollments = "SELECT count(*) AS Total FROM rm_enrolledusers WHERE courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule' And (us_status Is Null OR us_status <> 'Dummy')"
		 
		 objRs1.Open strEnrollments,ConnObj
		 
		 Do Until objRs1.EOF
			TotalEnrollments = objRs1("Total")
		 objRs1.Movenext
		 Loop
		 objRs1.Close
		 
		 strPaid = "SELECT count(*) AS Paid FROM rm_enrolledusers WHERE checkreceived = 'Yes' AND courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule'"
		 
		 objRs1.Open strPaid,ConnObj	 
	
		 Do Until objRs1.EOF
			Paid = objRs1("Paid")
		 objRs1.Movenext
		 Loop
		 objRs1.Close
		 
		 strPayment = "SELECT us_status FROM rm_enrolledusers WHERE (checkreceived <> 'Yes' OR checkreceived Is Null) AND courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule'"
		 
		 objRs1.Open strPayment,ConnObj	 
	
		 Do Until objRs1.EOF
		  
		 paymentstatus = objRs1("us_status")
		 
		 Select case paymentstatus
		 
		 case "P.O Received"
		 
		 PO_Received = PO_Received + 1
		 
		 case "Payment Declined"
		 PaymentDeclined = PaymentDeclined + 1
		 
		 case "Under Process"
		 UnderProcess = UnderProcess + 1
		 
		 End Select
		 
		 objRs1.Movenext
		 Loop
		 objRs1.Close
		
   %>
  <tr>
    <td><% = City %><% If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then %>, <% = State_Code %><% End If %></td>
    <td><% = FormatDateTime(CourseDate,1) %></td>
    <!--<td><% '= Instructor %></td>-->
	<td><% = TotalEnrollments %></td>
    <td><% = Paid %></td>
	<td><% = Int(PO_Received) %></td>
    <td><% = Int(PaymentDeclined) %></td>
	<td><% = Int(UnderProcess) %></td>	
	<td><% = (TotalEnrollments - (Paid + PO_Received + PaymentDeclined + UnderProcess)) %></td>
  </tr>
  <% 
  'Making it zero'
  PO_Received = 0
  PaymentDeclined = 0
  UnderProcess = 0
  %>
  <% 
     End If
     objRs.Movenext
     Loop
	 objRs.Close
     ConnObj.Close %>
</table>
<table width="600px" border="1" class="table2" >
<tr><td><font color="red" size="2">*</font>Instructor: This is a tentative assignment of classroom programs and may be changed based on company requirements and other factors.</td></tr>
</table>
</body>
</html>
<% End If %>

