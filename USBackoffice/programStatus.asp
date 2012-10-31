<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<% 
	If Session("USBUserId") = "" Then 
		Response.Redirect("login.asp")
	Else
%>
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/USBackoffice/includes/connection-PROJ.asp"-->
<%
'Written By : Savita'
'Created Date: 18/04/2012'
'Description :'
'Purpose : Show all the Us enrollment details'

'Declare The Variables'
Dim strCourseIds, strEnrollments, strPaid, paymentstatus,PO_Received
Dim objRs, objRs2, strCountry, strCity, strPayment, PaymentDeclined
Dim CourseId, City, StartDate, EndDate, CourseType, UnderProcess
Dim TotalEnrollments, Paid ,State_Code, Instructor,CourseDates,strClassType
Dim enrolledFor,LiveTotalEnrollments,LivePaid,Livepaymentstatus,LivePO_Received
Dim LivePaymentDeclined, LiveUnderProcess,strCoursePROJITIL,objRs1

Server.ScriptTimeout = 1800
 

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs2 = Server.CreateObject("ADODB.Recordset")
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
	strCity = "(city.country = 'US' OR city.country = 'Canada')"
	

ElseIf Session("CRM_Country") = "United Kingdom" Then

	strCountry = "(course.country = 'United Kingdom')"
	strCity = "(city.country = 'United Kingdom')"

ElseIf Session("CRM_Country") = "UAE" Then

	strCountry = "(course.country = 'UAE')"
	strCity = "(city.country = 'UAE')"

ElseIf Session("CRM_Country") = "Singapore" Then

	strCountry = "(course.country = 'Singapore')"
	strCity = "(city.country = 'Singapore')"
	
ElseIf Session("CRM_Country") = "Australia" Then

	strCountry = "(course.country = 'Australia')"
	strCity = "(city.country = 'Australia')"
	
ElseIf Session("CRM_Country") = "India" Then

	strCountry = "(course.country = 'India')"
	strCity = "(city.country = 'India')"
	
ElseIf Session("CRM_Country") = "Germany" Then

	strCountry = "(course.country = 'Germany')"
	strCity = "(city.country = 'Germany')"
	
ElseIf Session("CRM_Country") = "Netherlands" Then

	strCountry = "(course.country = 'Netherlands')"
	strCity = "(city.country = 'Netherlands')"

ElseIf Session("CRM_Country") = "Global" Then	

	strCountry = "(course.country = 'US' OR course.country = 'Canada')"
	strCity = "(city.country = 'US' OR city.country = 'Canada')"
	Session("CRM_Country") = "US"

End If	


Session.Timeout = 120

'strCourseIds = "SELECT courseid, city, startdate, enddate FROM ITIL_course WHERE country = '"&Session("CRM_Country")&"' AND status <> 'Cancelled' AND status <> 'Completed' ORDER BY startdate"

strCourseIds = "SELECT course.courseid, course.city, course.startdate, course.enddate, city.state_code, course.instructor, course.coursedates, course.coursetype FROM ITIL_course course, ITIL_city city WHERE course.city = city.city And "& strCountry &" AND "& strCity &" AND (course.country = city.country) AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' order by course.startdate, course.city asc"

'Response.Write(strCourseIds)

objRs.Open strCourseIds,ConnObj
%>
<html>
<head>
<title>Program Status</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<table width="60%" border="1" class="table1" >
  <tr>
    <td width="50px"><b>City</b></td>
    <td width="500px"><b>Class Date</b></td>
    <td width="200px"><b>Instructor<font color="red" size="2">*</font></b></td>
    <% If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then %>
    <td width="50px"><b>Class Type</b></td>
    <% End If %>
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
	 StartDate = objRs("startdate")
	 EndDate = objRs("enddate")
	 State_Code = objRs("state_code")
	 Instructor = objRs("instructor")
	  CourseDates = objRs("coursedates")
	 CourseType  = objRs("coursetype")
	 
	 If (CDate(StartDate)-(Date()-1)>=0) Then
	 
	  strClassType = "SELECT enrolledFor FROM ITIL_enrolledusers WHERE courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule' And (us_status Is Null OR us_status <> 'Dummy')"
		 
		 objRs2.Open strClassType,ConnObj
		 
		 Do Until objRs2.EOF
			enrolledFor = objRs2("enrolledFor")
		 objRs2.Movenext
		 Loop
		 objRs2.Close
	 
	
	 If CourseType = "WBT" Then
	  
	   'If enrolledFor = "Live" Then 
	   
		 strEnrollments = "SELECT count(*) AS Total FROM ITIL_enrolledusers WHERE  enrolledFor = 'Live' And courseid = '"& CourseId &"'  AND status <> 'Cancel' AND status <> 'Re-Schedule' And (us_status Is Null OR us_status <> 'Dummy')"
		 
		 objRs2.Open strEnrollments,ConnObj
		 
		 Do Until objRs2.EOF
		 LiveTotalEnrollments = objRs2("Total")
		 objRs2.Movenext
		 Loop
		 objRs2.Close
		' Response.Write("tetst1"&LiveTotalEnrollments)
		 
	  'ElseIf enrolledFor = "Classroom" Then 
		 strEnrollments = "SELECT count(*) AS Total FROM ITIL_enrolledusers WHERE  enrolledFor = 'Classroom' And courseid = '"& CourseId &"'  AND status <> 'Cancel' AND status <> 'Re-Schedule' And (us_status Is Null OR us_status <> 'Dummy')"
		 
		 ' Response.Write(strEnrollments)
		 
		 objRs2.Open strEnrollments,ConnObj
		  Do Until objRs2.EOF
			TotalEnrollments = objRs2("Total")
		 objRs2.Movenext
		 Loop
		 objRs2.Close
		' Response.Write("tetst2" &TotalEnrollments)
		' End If
		 ElseIf CourseType = "Live" Then
	  
	   'If enrolledFor = "Live" Then 
	   
		 strEnrollments = "SELECT count(*) AS Total FROM ITIL_enrolledusers WHERE  enrolledFor = 'Live' And courseid = '"& CourseId &"'  AND status <> 'Cancel' AND status <> 'Re-Schedule' And (us_status Is Null OR us_status <> 'Dummy')"
		 
		 objRs2.Open strEnrollments,ConnObj
		 
		 Do Until objRs2.EOF
		 LiveTotalEnrollments = objRs2("Total")
		 objRs2.Movenext
		 Loop
		 objRs2.Close
		 
		 Else
		 strEnrollments = "SELECT count(*) AS Total FROM ITIL_enrolledusers WHERE courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule' And (us_status Is Null OR us_status <> 'Dummy')"
		 
		 		 ' Response.Write(strEnrollments)
		 
		 objRs2.Open strEnrollments,ConnObj
		 
		 Do Until objRs2.EOF
			TotalEnrollments = objRs2("Total")
			
		 objRs2.Movenext
		 Loop
		 objRs2.Close
		' Response.write("test3" &TotalEnrollments)
		  End If
		 
		 
		 If CourseType = "WBT" Then
		 
		  'If enrolledFor = "Live" Then 
		 
		 strPaid = "SELECT count(*) AS Paid FROM ITIL_enrolledusers WHERE  enrolledFor = 'Live' And checkreceived = 'Yes' AND courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule'"
		 
		 ' Response.Write(strPaid)
		 
		 objRs2.Open strPaid,ConnObj	 
	
		 Do Until objRs2.EOF
		 
			LivePaid = Int(objRs2("Paid"))
		 
		 objRs2.Movenext
		 Loop
		 objRs2.Close
		 
		  'ElseIf enrolledFor = "Classroom" Then 
		   strPaid = "SELECT count(*) AS Paid FROM ITIL_enrolledusers WHERE  enrolledFor = 'Classroom' And checkreceived = 'Yes' AND courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule'"
		 
		 ' Response.Write(strPaid)
		 
		 objRs2.Open strPaid,ConnObj	 
	
		 Do Until objRs2.EOF
		 
			Paid = Int(objRs2("Paid"))
		 
		 objRs2.Movenext
		 Loop
		 objRs2.Close
		 
		  ElseIf CourseType = "Live" Then
		 
		  'If enrolledFor = "Live" Then 
		 
		 strPaid = "SELECT count(*) AS Paid FROM ITIL_enrolledusers WHERE  enrolledFor = 'Live' And checkreceived = 'Yes' AND courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule'"
		 
		 ' Response.Write(strPaid)
		 
		 objRs2.Open strPaid,ConnObj	 
	
		 Do Until objRs2.EOF
		 
			LivePaid = Int(objRs2("Paid"))
		 
		 objRs2.Movenext
		 Loop
		 objRs2.Close
		 
		' End If
		 
		  Else
		 strPaid = "SELECT count(*) AS Paid FROM ITIL_enrolledusers WHERE checkreceived = 'Yes' AND courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule'"
		 
		 ' Response.Write(strPaid)
		 
		 objRs2.Open strPaid,ConnObj	 
	
		 Do Until objRs2.EOF
		 
			Paid = Int(objRs2("Paid"))
		 
		 objRs2.Movenext
		 Loop
		 objRs2.Close
		 
		 End If
		 
 If CourseType = "WBT" Then
 
 'If enrolledFor = "Live" Then 
 
		 strPayment = "SELECT us_status FROM ITIL_enrolledusers WHERE  enrolledFor = 'Live' And (checkreceived <> 'Yes' OR checkreceived Is Null) AND courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule'"
		 
		' Response.Write(strPayment)
		 
		 objRs2.Open strPayment,ConnObj	 
	
		 Do Until objRs2.EOF
		  
			 Livepaymentstatus = objRs2("us_status")
			 
			 Select case paymentstatus
			 
				 case "P.O Received"
				 
				 LivePO_Received = PO_Received + 1
				 
				 case "Payment Declined"
				 LivePaymentDeclined = PaymentDeclined + 1
				 
				 case "Under Process"
				 LiveUnderProcess = UnderProcess + 1
			 
			 End Select
		 
		 objRs2.Movenext
		 Loop
		 objRs2.Close
		 
		' ElseIf enrolledFor = "Classroom" Then 
		 
		  strPayment = "SELECT us_status FROM ITIL_enrolledusers WHERE  enrolledFor = 'Classroom' And (checkreceived <> 'Yes' OR checkreceived Is Null) AND courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule'"
		 
		' Response.Write(strPayment)
		 
		 objRs2.Open strPayment,ConnObj	 
	
		 Do Until objRs2.EOF
		  
			 paymentstatus = objRs2("us_status")
			 
			 Select case paymentstatus
			 
				 case "P.O Received"
				 
				 PO_Received = PO_Received + 1
				 
				 case "Payment Declined"
				 PaymentDeclined = PaymentDeclined + 1
				 
				 case "Under Process"
				 UnderProcess = UnderProcess + 1
			 
			 End Select
		 
		 objRs2.Movenext
		 Loop
		 objRs2.Close
		 
	 ElseIf CourseType = "Live" Then
 
 'If enrolledFor = "Live" Then 
 
		 strPayment = "SELECT us_status FROM ITIL_enrolledusers WHERE  enrolledFor = 'Live' And (checkreceived <> 'Yes' OR checkreceived Is Null) AND courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule'"
		 
		' Response.Write(strPayment)
		 
		 objRs2.Open strPayment,ConnObj	 
	
		 Do Until objRs2.EOF
		  
			 Livepaymentstatus = objRs2("us_status")
			 
			 Select case paymentstatus
			 
				 case "P.O Received"
				 
				 LivePO_Received = PO_Received + 1
				 
				 case "Payment Declined"
				 LivePaymentDeclined = PaymentDeclined + 1
				 
				 case "Under Process"
				 LiveUnderProcess = UnderProcess + 1
			 
			 End Select
		 
		 objRs2.Movenext
		 Loop
		 objRs2.Close
	' End If
		 
		  Else
		 
		 strPayment = "SELECT us_status FROM ITIL_enrolledusers WHERE (checkreceived <> 'Yes' OR checkreceived Is Null) AND courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule'"
		 
		' Response.Write(strPayment)
		 
		 objRs2.Open strPayment,ConnObj	 
	
		 Do Until objRs2.EOF
		  
			 paymentstatus = objRs2("us_status")
			 
			 Select case paymentstatus
			 
				 case "P.O Received"
				 
				 PO_Received = PO_Received + 1
				 
				 case "Payment Declined"
				 PaymentDeclined = PaymentDeclined + 1
				 
				 case "Under Process"
				 UnderProcess = UnderProcess + 1
			 
			 End Select
		 
		 objRs2.Movenext
		 Loop
		 objRs2.Close
	 
	 End If
	' End If
	 
		 
  
    If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then
	 
	   If CourseType = "WBT" Then  %>
  <tr>
    <td rowspan="2"><% = City %>
      <% If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then %>
      ,
      <% = State_Code %>
      <% End If %>
      <br>
      <% If (CourseType = "Weekend") Then %>
      Weekend Course
      <% ElseIf (CourseType = "Normal") Then %>
      Foundation Course
      <% ElseIf (CourseType = "Corporate") Then  %>
      Corporate Course
      <% ElseIf (CourseType = "Live") Then %>
      Live Course
      <% ElseIf (CourseType = "WBT") Then %>
      WBT Course
      <%   ElseIf (CourseType = "OSA") Then %>
      OSA Course
      <%   ElseIf (CourseType = "CSI") Then %>
      CSI Course
      <% End If %></td>
    <% If (CourseType <> "Normal" AND CourseType <> "Foundation" AND CourseType <> "WBT" AND CourseType <> "Corporate" AND CourseType <> "Live" AND CourseType <> "OSA" AND CourseType <> "CSI") Then %>
    <td rowspan="2"><% = CourseDates %></td>
    <% Else
     If CourseDates <> "" Then  %>
    <td rowspan="2"><% = CourseDates %></td>
    <% Else %>
    <td rowspan="2"><% = FormatDateTime(StartDate,1) %>
      to
      <% = FormatDateTime(EndDate,1) %></td>
    <% End If %>
    <% End If %>
    <td rowspan="2"><% = Instructor %></td>
    <td>Classroom</td>
    <td><% = TotalEnrollments %></td>
    <td><% = Int(Paid) %></td>
    <td><% = Int(PO_Received) %></td>
    <td><% = Int(PaymentDeclined) %></td>
    <td><% = Int(UnderProcess) %></td>
    <td><% = (TotalEnrollments - (Paid + PO_Received + PaymentDeclined + UnderProcess)) %></td>
  </tr>
  <tr>
    <td>Live</td>
    <td><% = LiveTotalEnrollments %></td>
    <td><% = Int(LivePaid) %></td>
    <td><% = Int(LivePO_Received) %></td>
    <td><% = Int(LivePaymentDeclined) %></td>
    <td><% = Int(LiveUnderProcess) %></td>
    <td><% = (LiveTotalEnrollments - (LivePaid + LivePO_Received + LivePaymentDeclined + LiveUnderProcess)) %></td>
  </tr>
  <%
	ElseIf CourseType <> "WBT" Then 
	
	 %>
  <tr>
    <td><% = City %>
      <% If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then %>
      ,
      <% = State_Code %>
      <% End If %>
      <br>
      <% If (CourseType = "Weekend") Then %>
      Weekend Course
      <% ElseIf (CourseType = "Normal") Then %>
      Foundation Course
      <% ElseIf (CourseType = "Corporate") Then  %>
      Corporate Course
      <%   ElseIf (CourseType = "Live") Then %>
      Live Course
      <%   ElseIf (CourseType = "WBT") Then %>
      WBT Course
      <%   ElseIf (CourseType = "OSA") Then %>
      OSA Course
      <%   ElseIf (CourseType = "CSI") Then %>
      CSI Course
      <% End If %></td>
    <% If (CourseType <> "Normal" AND CourseType <> "Foundation" AND CourseType <> "WBT" AND CourseType <> "Corporate" AND CourseType <> "Live" AND CourseType <> "OSA" AND CourseType <> "CSI") Then %>
    <td><% = CourseDates %></td>
    <% Else
     If CourseDates <> "" Then  %>
    <td><% = CourseDates %></td>
    <% Else %>
    <td><% = FormatDateTime(StartDate,1) %>
      to
      <% = FormatDateTime(EndDate,1) %></td>
    <% End If %>
    <% End If %>
    <td><% = Instructor %></td>
    <% If (CourseType <> "Live") Then %>
    <td>Classroom</td>
    <td><% = TotalEnrollments %></td>
    <td><% = Int(Paid) %></td>
    <td><% = Int(PO_Received) %></td>
    <td><% = Int(PaymentDeclined) %></td>
    <td><% = Int(UnderProcess) %></td>
    <td><% = (TotalEnrollments - (Paid + PO_Received + PaymentDeclined + UnderProcess)) %></td>
  </tr>
  <% Else %>
  <td>Live</td>
    <td><% = LiveTotalEnrollments %></td>
    <td><% = Int(LivePaid) %></td>
    <td><% = Int(LivePO_Received) %></td>
    <td><% = Int(LivePaymentDeclined) %></td>
    <td><% = Int(LiveUnderProcess) %></td>
    <td><% = (LiveTotalEnrollments - (LivePaid + LivePO_Received + LivePaymentDeclined + LiveUnderProcess)) %></td>
  </tr>
  <% End If
  End If 
	 
	 Else
	
	%>
  <tr>
    <td><% = City %>
       <% If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then %>
      ,
      <% = State_Code %>
      <% End If %>
      <br>
      <% If (CourseType = "Weekend") Then %>
      Weekend Course
      <% ElseIf (CourseType = "Normal") Then %>
      Foundation Course
      <% ElseIf (CourseType = "Corporate") Then  %>
      Corporate Course
      <%   ElseIf (CourseType = "Live") Then %>
      Live Course
      <%   ElseIf (CourseType = "WBT") Then %>
      WBT Course
      <%   ElseIf (CourseType = "OSA") Then %>
      OSA Course
      <%   ElseIf (CourseType = "CSI") Then %>
      CSI Course
      <%  End If  %></td>
    <% If (CourseType <> "Normal" AND CourseType <> "Foundation" AND CourseType <> "WBT" AND CourseType <> "Corporate" AND CourseType <> "Live" AND CourseType <> "OSA" AND CourseType <> "CSI") Then %>
    <td><% = CourseDates %></td>
    <% Else
     If CourseDates <> "" Then  %>
    <td><% = CourseDates %></td>
    <% Else %>
    <td><% = FormatDateTime(StartDate,1) %>
      to
      <% = FormatDateTime(EndDate,1) %></td>
    <% End If %>
    <% End If %>
    <td><% = Instructor %></td>
    <td><% = TotalEnrollments %></td>
    <td><% = Int(Paid) %></td>
    <td><% = Int(PO_Received) %></td>
    <td><% = Int(PaymentDeclined) %></td>
    <td><% = Int(UnderProcess) %></td>
    <td><% = (TotalEnrollments - (Paid + PO_Received + PaymentDeclined + UnderProcess)) %></td>
  </tr>
  <% End If
   ' End If
  ' End If %>
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

<br><br>
<% 'PROJ - ITIL program status

If Session("CRM_Country") = "United Kingdom" Then

strCoursePROJITIL = "SELECT PROJITIL_course.courseid, PROJITIL_course.city, PROJITIL_course.startdate, PROJITIL_course.enddate, ITIL_city.state_code, PROJITIL_course.instructor, PROJITIL_course.coursedates FROM PROJITIL_course PROJITIL_course, ITIL_city ITIL_city WHERE PROJITIL_course.city = ITIL_city.city And PROJITIL_course.country = 'United Kingdom' AND ITIL_city.country = 'United Kingdom' AND (PROJITIL_course.country = ITIL_city.country) AND PROJITIL_course.status <> 'Cancelled' AND PROJITIL_course.status <> 'Completed' And PROJITIL_course.startdate >= '"&Now() - 1&"' order by PROJITIL_course.startdate, PROJITIL_course.city asc"


objRs.Open strCoursePROJITIL,Conn1



%>
<html>
<head>
<title>Program Status</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<table width="60%" border="1" class="table1" >
<h3 align="left">PROJ-ITIL Program Status</h3>
  <tr>
    <td width="50px"><b>City</b>  </td>
    <td width="500px"><b>Class Date</b></td>
    <td width="200px"><b>Instructor<font color="red" size="2">*</font></b></td>	
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
	 StartDate = objRs("startdate")
	 EndDate = objRs("enddate")
	 State_Code = objRs("state_code")
	 Instructor = objRs("instructor")
	 CourseType = objRs("coursedates")
	 
	 If (CDate(StartDate)-(Date()-1)>=0) Then
	 
		 strEnrollments = "SELECT count(*) AS Total FROM PROJITIL_enrolledusers WHERE courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule' And (us_status Is Null OR us_status = 'Active')"
		 
		 objRs1.Open strEnrollments,Conn1
		 
		 Do Until objRs1.EOF
			TotalEnrollments = objRs1("Total")
		 objRs1.Movenext
		 Loop
		 objRs1.Close
		 
		 strPaid = "SELECT count(*) AS Paid FROM PROJITIL_enrolledusers WHERE checkreceived = 'Yes' AND courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule'"
		 
		 objRs1.Open strPaid,Conn1	 
	
		 Do Until objRs1.EOF
			Paid = objRs1("Paid")
		 objRs1.Movenext
		 Loop
		 objRs1.Close
		 
		  strPayment = "SELECT us_status FROM PROJITIL_enrolledusers WHERE (checkreceived <> 'Yes' OR checkreceived Is Null) AND courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule'"
		 
		 objRs1.Open strPayment,Conn1	 
	
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
    <td><% = City %><br>
	<% If (CourseType <> "" AND CourseType <> "Corporate") Then %>Foundation Course<% End If %></td>
    <% If (CourseType <> "" AND CourseType <> "Corporate") Then %> 
    <td><% = CourseType %></td>
    <% Else %>
    <td><% = FormatDateTime(StartDate,1) %> to <% = FormatDateTime(EndDate,1) %></td>
    <% End If %>
    <td><% = Instructor %></td>
   
	<td><% = TotalEnrollments %></td>
    <td><% = Paid %></td>
	<td><% = Int(PO_Received) %></td>
    <td><% = Int(PaymentDeclined) %></td>
	<td><% = Int(UnderProcess) %></td>	
	<td><% = (TotalEnrollments - (Paid + PO_Received + PaymentDeclined + UnderProcess)) %></td>
    <%'End If %>
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
     Conn1.Close %>
</table>

<% End If %>


<table width="900px" border="0" class="table2" >
  <tr>
    <td><br>
      <font color="red" size="2">*</font>Instructor: This is a tentative assignment of classroom programs and may be changed based on company requirements and other factors.</td>
  </tr>
</table>
</body>
</html>
<% End If %>