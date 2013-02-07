<!--#include virtual="/includes/connection.asp"-->

<% 
If Session("USBUserId") = "" Then 
	Response.Redirect("login.asp")
Else

'Declare the local variables'	
Dim objRsCountry

Set objRsCountry = Server.CreateObject("ADODB.Recordset")

If Request.Form("country") <> "" Then
Session("CRM_Country") = Request.Form("country")
End If

strCountry = "SELECT * FROM CRM_Countries"
	
objRsCountry.Open strCountry, ConnObj
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Home</title>
<!-- CSS -->
<link href="css/style1.css" rel="stylesheet" type="text/css" media="screen" />
<!-- JavaScripts-->
<script language="javascript">

function Form_Validator(theform)
{
  if (theform.country.value == "")
  {
     alert("Please snter the Country");
     theform.country.focus();
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
      <h2><a href="home.asp" class="active">Home</a></h2>
      <div id="main">
        <div>&nbsp;</div>
        <fieldset>
          <h3>Welcome to ITILstudy
            <% = Session("CRM_Country") %>
            Backoffice</h3>
          <br />
          <br />
          <br />
          <% If Session("CRM_Country") = "Global" OR Session("TypeOfUser") = "Admin" Then %>
          <div align="left" style="margin-bottom:40px;">
            <form action="home.asp" method="post" onsubmit="return Form_Validator(this)">
              <table>
                <tr>
                  <td>Country: </td>
                  <td><select name="country">
                      <option value="">--Select--</option>
                      <% Do Until objRsCountry.EOF %>
                      <% If objRsCountry("Country") <> "Global" Then %>
                      <option <% If Session("CRM_Country") = objRsCountry("Country") Then %> selected="selected" <% End If %> value="<% = objRsCountry("Country") %>">
                      <% = objRsCountry("Country") %>
                      </option>
                      <% End If %>
                      <% objRsCountry.Movenext
                       Loop
                       objRsCountry.Close %>
                    </select></td>
                </tr>
                <tr>
                  <td colspan="2" align="right"><input type="submit" name="submit" value="Submit" /></td>
                </tr>
              </table>
            </form>
          </div>
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
<%
'Daily report of ITILstudy

 'If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" OR Session("CRM_Country") = "India" OR Session("CRM_Country") = "Australia"  OR Session("CRM_Country") = "United Kingdom"  Then
 If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" OR Session("CRM_Country") = "India" OR Session("CRM_Country") = "Australia" Then

'Declare The Local Variables'
Dim todayDate, dateof_fac_mail
Dim objRs, objRs1, objRs2
Dim objCDOMail
Dim strDate, strEmailIds, strBody, strCourseIds, strPaid, strAllcoatedCity
Dim CourseId, City, StartDate, EndDate, strEnrollments, TotalEnrollments, Paid
Dim EmailId1, EmailIds1, EmailIds2, State_Code, Instructor, datesent_email
Dim Date1, Date2,LiveTotalEnrollments

'Creating Record objects'	
Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
Set objRs2 = Server.CreateObject("ADODB.Recordset")

'todays date'
'and i am changing the date format like mm/dd/yyyy'	
dateof_fac_mail = FormatDateTime(Now(),2)

'Checking mail already sent or not based on date'
'Retriving the last mail send date'
If Session("CRM_Country") <> "" AND Session("CRM_Country") <> "Global" Then 

If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then 

strDate = "SELECT top 1 datesent FROM facultymailsent where country = 'US' Order by id desc"

Else 

strDate = "SELECT top 1 datesent FROM facultymailsent where country = '"&Session("CRM_Country") &"' Order by id desc"

End If

'Response.Write(strDate)

objRs.Open strDate,ConnObj

Do until objRs.EOF

	'Response.Write("Test")
	datesent_email = FormatDateTime(objRs("datesent"),2)
	
	'Response.Write(datesent_email)
	
objRs.Movenext
Loop
objRs.Close
'datesent_email = 1
'Comparing the dates'
'Compatin the last mail send date and today's date'
'If last mail sent date and todays is different and then send a mail to faculty'

If datesent_email <> dateof_fac_mail Then

'If datesent_email = 1 Then
'Else

	todayDate=Now()
	
	Date1 = FormatDateTime(todayDate,4)
	Date2 = "5.30"
	
	'Checking the time early morning sent a mail to faculty'
	If DateDiff("h",Date2,Date1) >= 0 Then 
	

	strBody = "<table width=""100%"" border=""0"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Hi,<BR><BR>Please find the updates for the"
	 If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then
	strBody = strBody & " US and Canada"
	Else
	strBody = strBody&" "&Session("CRM_Country") &" "
	End If 
	
	 strBody = strBody&" candidates below: <br><br>"
	
	'Response.Write(strBody)
	
	 If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then
	
	strCourseIds = "SELECT course.courseid, course.city, course.startdate, course.enddate, city.state_code, course.instructor, course.coursedates, course.coursetype  FROM ITIL_course course, ITIL_city city WHERE course.city = city.city And (course.country = 'US' OR course.country = 'Canada') And (city.country = 'US' OR city.country = 'Canada') AND (course.country = city.country) AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' order by course.startdate, course.city asc"
	
	'ElseIf Session("CRM_Country") = "United Kingdom" Then
'	
'	strCourseIds = "SELECT course.courseid, course.city, course.startdate, course.enddate, city.state_code, course.instructor, course.coursedates, course.coursetype  FROM ITIL_course course, ITIL_city city WHERE course.city = city.city And (course.country = 'United Kingdom') And (city.country = 'United Kingdom') AND (course.country = city.country) AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' order by course.startdate, course.city asc"
	
	ElseIf Session("CRM_Country") = "Australia" Then
	
	strCourseIds = "SELECT course.courseid, course.city, course.startdate, course.enddate, city.state_code, course.instructor, course.coursedates, course.coursetype  FROM ITIL_course course, ITIL_city city WHERE course.city = city.city And (course.country = 'Australia') And (city.country = 'Australia') AND (course.country = city.country) AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' order by course.startdate, course.city asc"
	
	ElseIf Session("CRM_Country") = "India" Then
	
	strCourseIds = "SELECT course.courseid, course.city, course.startdate, course.enddate, city.state_code, course.instructor, course.coursedates, course.coursetype  FROM ITIL_course course, ITIL_city city WHERE course.city = city.city And (course.country = 'India') And (city.country = 'India') AND (course.country = city.country) AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' order by course.startdate, course.city asc"
	
	'ElseIf Session("CRM_Country") <> "" Then
	
	End If
		
	'Response.Write(strCourseIds)
	
	objRs1.Open strCourseIds,ConnObj
	
		
	strBody = strBody & "<table width=""580"" border=""1"" cellspacing=""0"" cellpadding=""5""><tr>"
	
	strBody = strBody & "<td><font face=""Arial"" size=2><b>City</b></font></td><td><font face=""Arial"" size=2><b>Class Date</b></font></td><td><font face=""Arial"" size=2><b>Instructor</b><font color=""red"" size=""2"">*</font></font></td>"
	
	If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then
	
	strBody = strBody & "<td><font face=""Arial"" size=2><b>Class Type</b></font></td>"
	
	End If
	
	strBody = strBody & "<td><font face=""Arial"" size=2><b>Total Enrollments</b></font></td><td><font face=""Arial"" size=2><b>Payment Made</b></font></td><td><font face=""Arial"" size=2><b>P.O Received</b></font></td><td><font face=""Arial"" size=2><b>Payment Declined</b></font></td><td><font face=""Arial"" size=2><b>Under Process</b></font></td><td><font face=""Arial"" size=2><b>Not Paid</b></font></td></tr>"
 	
	'End If
	
	 Do Until objRs1.EOF
   
     CourseId = objRs1("courseid")
	 City = Trim(objRs1("city"))
	 StartDate = objRs1("startdate")
	 EndDate = objRs1("enddate")
	 State_Code = objRs1("state_code")
	 Instructor = objRs1("instructor")
	 CourseDates = objRs1("coursedates")
	 CourseType  = objRs1("coursetype")
	' Response.write(CourseType)
	 
	 If (CDate(StartDate)-(Date()-1)>=0) Then
	 
	  strClassType = "SELECT enrolledFor FROM ITIL_enrolledusers WHERE courseid = '"& CourseId &"' AND status = 'Active' And (us_status Is Null OR us_status <> 'Dummy')"
		 
		 objRs2.Open strClassType,ConnObj
		 
		 Do Until objRs2.EOF
			enrolledFor = objRs2("enrolledFor")
		 objRs2.Movenext
		 Loop
		 objRs2.Close
	 
	
	 If CourseType = "WBT" Then
	  
	   'If enrolledFor = "Live" Then 
	   
		 strEnrollments = "SELECT count(*) AS Total FROM ITIL_enrolledusers WHERE  enrolledFor = 'Live' And courseid = '"& CourseId &"'  AND status = 'Active' And (us_status Is Null OR us_status <> 'Dummy')"
		 
		 objRs2.Open strEnrollments,ConnObj
		 
		 Do Until objRs2.EOF
		 LiveTotalEnrollments = objRs2("Total")
		 objRs2.Movenext
		 Loop
		 objRs2.Close
		' Response.Write("tetst1"&LiveTotalEnrollments)
		 
	  'ElseIf enrolledFor = "Classroom" Then 
		 strEnrollments = "SELECT count(*) AS Total FROM ITIL_enrolledusers WHERE  enrolledFor = 'Classroom' And courseid = '"& CourseId &"'  AND status = 'Active' And (us_status Is Null OR us_status <> 'Dummy')"
		 
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
	   
		 strEnrollments = "SELECT count(*) AS Total FROM ITIL_enrolledusers WHERE  enrolledFor = 'Live' And courseid = '"& CourseId &"'  AND status = 'Active' And (us_status Is Null OR us_status <> 'Dummy')"
		 
		 objRs2.Open strEnrollments,ConnObj
		 
		 Do Until objRs2.EOF
		 LiveTotalEnrollments = objRs2("Total")
		 objRs2.Movenext
		 Loop
		 objRs2.Close
		 
		 Else
		 strEnrollments = "SELECT count(*) AS Total FROM ITIL_enrolledusers WHERE courseid = '"& CourseId &"' AND status = 'Active' And (us_status Is Null OR us_status <> 'Dummy')"
		 
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
		 
		 strPaid = "SELECT count(*) AS Paid FROM ITIL_enrolledusers WHERE  enrolledFor = 'Live' And checkreceived = 'Yes' AND courseid = '"& CourseId &"' AND status = 'Active'"
		 
		 ' Response.Write(strPaid)
		 
		 objRs2.Open strPaid,ConnObj	 
	
		 Do Until objRs2.EOF
		 
			LivePaid = Int(objRs2("Paid"))
		 
		 objRs2.Movenext
		 Loop
		 objRs2.Close
		 
		  'ElseIf enrolledFor = "Classroom" Then 
		   strPaid = "SELECT count(*) AS Paid FROM ITIL_enrolledusers WHERE  enrolledFor = 'Classroom' And checkreceived = 'Yes' AND courseid = '"& CourseId &"' AND status = 'Active'"
		 
		 ' Response.Write(strPaid)
		 
		 objRs2.Open strPaid,ConnObj	 
	
		 Do Until objRs2.EOF
		 
			Paid = Int(objRs2("Paid"))
		 
		 objRs2.Movenext
		 Loop
		 objRs2.Close
		 
		  ElseIf CourseType = "Live" Then
		 
		  'If enrolledFor = "Live" Then 
		 
		 strPaid = "SELECT count(*) AS Paid FROM ITIL_enrolledusers WHERE  enrolledFor = 'Live' And checkreceived = 'Yes' AND courseid = '"& CourseId &"' AND status = 'Active'"
		 
		 ' Response.Write(strPaid)
		 
		 objRs2.Open strPaid,ConnObj	 
	
		 Do Until objRs2.EOF
		 
			LivePaid = Int(objRs2("Paid"))
		 
		 objRs2.Movenext
		 Loop
		 objRs2.Close
		 
		' End If
		 
		  Else
		 strPaid = "SELECT count(*) AS Paid FROM ITIL_enrolledusers WHERE checkreceived = 'Yes' AND courseid = '"& CourseId &"' AND status = 'Active'"
		 
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
 
		 strPayment = "SELECT us_status FROM ITIL_enrolledusers WHERE  enrolledFor = 'Live' And (checkreceived <> 'Yes' OR checkreceived Is Null) AND courseid = '"& CourseId &"' AND status = 'Active'"
		 
		' Response.Write(strPayment)
		 
		 objRs2.Open strPayment,ConnObj	 
	
		 Do Until objRs2.EOF
		  
			 Livepaymentstatus = objRs2("us_status")
			 
			 Select case Livepaymentstatus
			 
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
		 
		  strPayment = "SELECT us_status FROM ITIL_enrolledusers WHERE  enrolledFor = 'Classroom' And (checkreceived <> 'Yes' OR checkreceived Is Null) AND courseid = '"& CourseId &"' AND status = 'Active'"
		 
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
 
		 strPayment = "SELECT us_status FROM ITIL_enrolledusers WHERE  enrolledFor = 'Live' And (checkreceived <> 'Yes' OR checkreceived Is Null) AND courseid = '"& CourseId &"' AND status = 'Active'"
		 
		' Response.Write(strPayment)
		 
		 objRs2.Open strPayment,ConnObj	 
	
		 Do Until objRs2.EOF
		  
			 Livepaymentstatus = objRs2("us_status")
			 
			 Select case Livepaymentstatus
			 
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
		 
		 strPayment = "SELECT us_status FROM ITIL_enrolledusers WHERE (checkreceived <> 'Yes' OR checkreceived Is Null) AND courseid = '"& CourseId &"' AND status = 'Active'"
		 
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
	 
	 If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then
	 
	   If CourseType = "WBT" Then
	 
		 strBody = strBody & "<tr>"
		 strBody = strBody & "<td rowspan=""2""><font face=""Arial"" size=2>"& City &", "& State_Code 
		 
		  If (CourseType = "WBT") Then
		  strBody = strBody & "<br>WBT Course"
		  End If
              		 
		 'If (CourseDates = "Corporate") Then
		 'strBody = strBody & "<br>Corporate"
		 'ElseIf (CourseDates <> "" AND CourseDates <> "Corporate") Then
		 'strBody = strBody & "<br>Weekend Course"
		 'End If 
		 
		 strBody = strBody & "</font></td><td rowspan=""2""><font face=""Arial"" size=2>"
		 If (CourseType <> "Normal" AND CourseType <> "Foundation" AND CourseType <> "WBT" AND CourseType <> "Corporate" AND CourseType <> "Live" AND CourseType <> "OSA" AND CourseType <> "CSI") Then 
		 strBody = strBody & ""& CourseDates & ""
		 Else 
		 If CourseDates <> "" Then 
		 strBody = strBody & ""& CourseDates & ""
		 Else 
		 strBody = strBody & ""& FormatDateTime(StartDate,1) &" to "& FormatDateTime(EndDate,1) &""
		 End If
		 End If
		 
		' Response.Write(CourseDates)
		 
		 strBody = strBody & "</font></td><td rowspan=""2""><font face=""Arial"" size=2>"& Instructor &"</font></td>"
		 
	
		  strBody = strBody & "<td><font face=""Arial"" size=2>Classroom</td><td><font face=""Arial"" size=2>"& TotalEnrollments &"</font></td><td><font face=""Arial"" size=2>"& Int(Paid) &"</font></td><td><font face=""Arial"" size=2>"& Int(PO_Received) &"</font></td><td><font face=""Arial"" size=2>"& Int(PaymentDeclined) &"</font></td><td><font face=""Arial"" size=2>"& Int(UnderProcess) &"</font></td><td><font face=""Arial"" size=2>"& (TotalEnrollments - (Paid + PO_Received + PaymentDeclined + UnderProcess)) &"</font></td></tr>"
		 
		 strBody = strBody & "<tr><td><font face=""Arial"" size=2>Live</td><td><font face=""Arial"" size=2>"& LiveTotalEnrollments &"</font></td><td><font face=""Arial"" size=2>"& Int(LivePaid) &"</font></td><td><font face=""Arial"" size=2>"& Int(LivePO_Received) &"</font></td><td><font face=""Arial"" size=2>"& Int(LivePaymentDeclined) &"</font></td><td><font face=""Arial"" size=2>"& Int(LiveUnderProcess) &"</font></td><td><font face=""Arial"" size=2>"& (LiveTotalEnrollments - (LivePaid + LivePO_Received + LivePaymentDeclined + LiveUnderProcess)) &"</font></td></tr>"
		 
		 
		 ElseIf CourseType <> "WBT" Then 
		 
		  strBody = strBody & "<tr>"
		 strBody = strBody & "<td ><font face=""Arial"" size=2>"& City &", "& State_Code 
		 
		  If (CourseType = "Weekend") Then
		  strBody = strBody & "<br>Weekend Course"
		  ElseIf (CourseType = "Foundation") Then
		  strBody = strBody & "<br>Foundation Course"
		  ElseIf (CourseType = "Corporate") Then
		  strBody = strBody & "<br>Corporate Course"
		   ElseIf (CourseType = "Live") Then
		  strBody = strBody & "<br>Live Course"
		    ElseIf (CourseType = "CSI") Then
		  strBody = strBody & "<br>CSI Course"
		    ElseIf (CourseType = "OSA") Then
		  strBody = strBody & "<br>OSA Course"
		  End If
              		 
	
		 strBody = strBody & "</font></td><td ><font face=""Arial"" size=2>"
		 If (CourseType <> "Normal" AND CourseType <> "Foundation" AND CourseType <> "WBT" AND CourseType <> "Corporate" AND CourseType <> "Live" AND CourseType <> "OSA" AND CourseType <> "CSI") Then 
		 strBody = strBody & ""& CourseDates & ""
		 Else 
		 If CourseDates <> "" Then 
		 strBody = strBody & ""& CourseDates & ""
		 Else 
		 strBody = strBody & ""& FormatDateTime(StartDate,1) &" to "& FormatDateTime(EndDate,1) &""
		 End If
		 End If
		 
		 
		 strBody = strBody & "</font></td><td ><font face=""Arial"" size=2>"& Instructor &"</font></td>"
		 
		 If (CourseType <> "Live") Then
		 
		strBody = strBody & "<td ><font face=""Arial"" size=2>Classroom</font></td><td><font face=""Arial"" size=2>"& TotalEnrollments &"</font></td><td><font face=""Arial"" size=2>"& Int(Paid) &"</font></td><td><font face=""Arial"" size=2>"& Int(PO_Received) &"</font></td><td><font face=""Arial"" size=2>"& Int(PaymentDeclined) &"</font></td><td><font face=""Arial"" size=2>"& Int(UnderProcess) &"</font></td><td><font face=""Arial"" size=2>"& (TotalEnrollments - (Paid + PO_Received + PaymentDeclined + UnderProcess)) &"</font></td></tr>"
		
		Else
		
		strBody = strBody & "<td><font face=""Arial"" size=2>Live</td><td><font face=""Arial"" size=2>"& LiveTotalEnrollments &"</font></td><td><font face=""Arial"" size=2>"& Int(LivePaid) &"</font></td><td><font face=""Arial"" size=2>"& Int(LivePO_Received) &"</font></td><td><font face=""Arial"" size=2>"& Int(LivePaymentDeclined) &"</font></td><td><font face=""Arial"" size=2>"& Int(LiveUnderProcess) &"</font></td><td><font face=""Arial"" size=2>"& (LiveTotalEnrollments - (LivePaid + LivePO_Received + LivePaymentDeclined + LiveUnderProcess)) &"</font></td></tr>"
		 
		' strBody = strBody & "</td></table>"
		End If 
		End If
		
		 Else
		 
		  strBody = strBody & "<tr>"
		 strBody = strBody & "<td ><font face=""Arial"" size=2>"& City &", "& State_Code 
		 
		   If (CourseType = "Weekend") Then
		  strBody = strBody & "<br>Weekend Course"
		  ElseIf (CourseType = "Foundation") Then
		  strBody = strBody & "<br>Foundation Course"
		  ElseIf (CourseType = "Corporate") Then
		  strBody = strBody & "<br>Corporate Course"
		   ElseIf (CourseType = "Live") Then
		  strBody = strBody & "<br>Live Course"
		    ElseIf (CourseType = "CSI") Then
		  strBody = strBody & "<br>CSI Course"
		    ElseIf (CourseType = "OSA") Then
		  strBody = strBody & "<br>OSA Course"
		  End If

		 strBody = strBody & "</font></td><td ><font face=""Arial"" size=2>"
		 If (CourseType <> "Normal" AND CourseType <> "Foundation" AND CourseType <> "WBT" AND CourseType <> "Corporate" AND CourseType <> "Live" AND CourseType <> "OSA" AND CourseType <> "CSI") Then 
		 strBody = strBody & ""& CourseDates & ""
		 Else 
		 If CourseDates <> "" Then 
		 strBody = strBody & ""& CourseDates & ""
		 Else 
		 strBody = strBody & ""& FormatDateTime(StartDate,1) &" to "& FormatDateTime(EndDate,1) &""
		 End If

		 End If
		 
		' Response.Write(CourseDates)
		 
		 strBody = strBody & "</font></td><td ><font face=""Arial"" size=2>"& Instructor &"</font></td>"
		 
		  strBody = strBody & "<td><font face=""Arial"" size=2>"& TotalEnrollments &"</font></td><td><font face=""Arial"" size=2>"& Int(Paid) &"</font></td><td><font face=""Arial"" size=2>"& Int(PO_Received) &"</font></td><td><font face=""Arial"" size=2>"& Int(PaymentDeclined) &"</font></td><td><font face=""Arial"" size=2>"& Int(UnderProcess) &"</font></td><td><font face=""Arial"" size=2>"& (TotalEnrollments - (Paid + PO_Received + PaymentDeclined + UnderProcess)) &"</font></td></tr>"
		  
		 End If
		 
		 'strBody = strBody & "</tr>"

        
     End If

           'Making it zero'
           PO_Received = 0
	       PaymentDeclined = 0
	       UnderProcess = 0
           TotalEnrollments = 0 
           Paid = 0 
           LivePO_Received = 0
           LiveTotalEnrollments = 0
           LivePaid = 0
           LivePaymentDeclined = 0
           LiveUnderProcess = 0
           LiveTotalEnrollments = 0
           LivePaid = 0
           LivePO_Received = 0
           LivePaymentDeclined = 0
           LiveUnderProcess= 0
            
           paymentstatus = ""
           Livepaymentstatus = ""

     objRs1.Movenext
     Loop
	 objRs1.Close

         strBody = strBody & "</td></tr></table>"	
		 
		 strBodyEnd  = strBodyEnd & "<br><br><font color=""red"" size=""2"">*</font><font face=""Arial"" size=2>Instructor: This is a tentative assignment of classroom programs and may be changed based on company requirements and other factors.</font>"
	
		strBodyEnd = strBodyEnd & "<BR><BR>Best Regards,<BR>Academic Team<BR><a href=""http://www.ITILstudy.com"" target=""_blank"">www.ITILstudy.com</a></font></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"
	
	

		
		strBody = strBody & strBodyEnd
			
		'Response.Write(strBody)

		'Create the e-mail server object
		Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
		'Who the e-mail is from
		objCDOMail.From = "marketing@itilstudy.com"
		'objCDOMail.From = "edusyssavita@gmail.com"
		'Who the e-mail is sent to
		'objCDOMail.To = "edusyssavita@gmail.com"
		objCDOMail.To = "marketing@itilstudy.com"
		'Who the blind copies are sent to
		If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then
		objCDOMail.Bcc = "marketing@pmstudy.com, marketing@projstudy.com, booking@pmstudy.com, instructorsitilstudy@googlegroups.com, projstudy@googlegroups.com, jodie.n.vmedu@gmail.com, jenni.b.pmstudy@gmail.com, tanya.b.pmstudy@gmail.com, phoenixsupport@googlegroups.com,connie.o.vmedu@gmail.com,catherine.p.vmedu@gmail.com,syeed.p.vmedu@gmail.com,tanya.b.vmedu@gmail.com,jenni.b.vmedu@gmail.com"
		
		'ElseIf Session("CRM_Country") = "United Kingdom" OR Session("CRM_Country") = "Australia" Then
'		objCDOMail.Bcc = "marketing@pmstudy.com, marketing@projstudy.com, satpathyt@gmail.com"
		
		Else
		objCDOMail.Bcc = "marketing@pmstudy.com, marketing@projstudy.com"
		End If
		'Set the subject of the e-mail 
		If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then
		objCDOMail.Subject = "Daily report of ITIL US and Canada candidates : "& FormatDateTime(Now(),1)
		'ElseIf Session("CRM_Country") = "United Kingdom" Then
'		objCDOMail.Subject = "Daily report of ITIL United Kingdom candidates : "& FormatDateTime(Now(),1)
		Else
		objCDOMail.Subject = "Daily report of ITIL "&Session("CRM_Country") &" candidates : "& FormatDateTime(Now(),1)
		End If
		'Set the e-mail body format (0=HTML 1=Text)
		objCDOMail.BodyFormat = 0
		'Set the mail format (0=MIME 1=Text)
		objCDOMail.MailFormat = 0
		'Set the main body of the e-mail
		objCDOMail.Body = strBody
		'Importance of the e-mail (0=Low, 1=Normal, 2=High)
		objCDOMail.Importance = 2
		'Send the e-mail
		objCDOMail.Send
		'Close the server object
		Set objCDOMail = Nothing
		
	                        
                            '//Call report start
                            a1 = todaydate
                            a2 = todaydate + 1
                            set RsSent = Server.CreateObject("ADODB.Recordset")
                            q1 = "Select * from facultymailsent where convert(datetime,datesent) between '"& formatdatetime(a1,2) &"' and '"& formatdatetime(a2,2) &"'"
                            rssent.open  q1 , ConnObj
                            If rsSent.EOF Then
                                            Set objRs = Server.CreateObject("ADODB.Recordset")
                                            Set objRsComment = Server.CreateObject("ADODB.Recordset")

                                            'country = Session("CRM_Country")
                                            fromDate =  formatdatetime(now() - 2 , 2)
                                            todate =formatdatetime(now()-1 ,2)
                                            strBody = ""
                                            strBody = "<html><body><table width=""100%"" border=""0"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""80%"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF"" align=""center""><span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""10"">Hello,<br><br>&nbsp;&nbsp;&nbsp;Call Report for the date <b>"&formatdatetime(fromdate,1)&"</b><br><br></td></tr><tr><td colspan=""2""><table border=""1"" cellspacing=""0"" cellpadding=""5"" style=""width:100%""><tr><th>Sl NO</th><th>Country</th><th>State</th><th>Caller For</th><th>Caller Name</th><th>Question</th><th>Added Date</th><th>Comments</th><th>Status</th><th>Status2</th></tr>"

                                           Query = "SELECT callid,callfor, callername, phoneno, emailid, callerstate, question, addeddate,call_status1, call_status2, Country FROM  ITIL_callsreceived_new WHERE addeddate BETWEEN '"&fromDate&"' AND '"&todate&"' And question <> '' order By addeddate asc"
                                        'response.Write(Query)
                                        objRs.Open Query, ConnObj

                                        callcounter = 1

                                        If Not objRs.EOF Then


                                        Do Until objRs.EOF
 
                                            CallID  = objRs("callid")
	                                        CallFor = objRs("callfor")
	                                        CallerName = objRs("callername")
	                                        PhoneNo = objRs("phoneno")
	                                        EmailID = objRs("emailid")
	                                        CallerState = objRs("callerstate")
	                                        Question = objRs("question")
	                                        AddedDate = objRs("addeddate")
	                                        callStatus1 = objRs("call_status1")
	                                        callStatus2 = objRs("call_status2")
                                            country = objRs("Country")
                                        If callStatus1 = "1" Then
		                                        RqStatus = "call to be made"
                                        ElseIf callStatus1 = "2" Then
                                                RqStatus = "call to be followed"	
                                        ElseIf callStatus1 = "3" Then
                                                RqStatus = "Closed call"	
                                        ElseIf callStatus1 = "4" Then
                                                RqStatus = "Free Enrollment"	
                                        End If

                                        strBody = strBody &"<tr align=""center""><td valign=""top"">&nbsp;"& callcounter &"</td><td valign=""top"">&nbsp;"&country&"</td><td valign=""top"">&nbsp;"& CallerState &"</td><td valign=""top"">&nbsp;"& CallFor &"</td><td valign=""top"">&nbsp;"& CallerName &"</td><td valign=""top"">&nbsp;"& Question&"</td><td valign=""top"">&nbsp;"& AddedDate&"</td><td valign=""top"" width=""500px"">&nbsp;"


                                        'Sql Query For Retrive The comments For That EnrolledUser'
                                        strQuery = "SELECT f_comment,comm_addedby,comm_date FROM fac_comments_new WHERE callid = '"&CallID&"'  Order by f_cid desc"
                                        'response.Write(strQuery)
                                        objRsComment.Open strQuery,ConnObj
                                        strBody1 = ""
                                        items = ""
                                        If Not objRsComment.EOF Then
                                           items = objRsComment.getrows
                                           numrows = Ubound(items,2)
                                           firstrow = 0
                                           lastrow = numrows
                                         End If
                                            
                                        allitems = ""
	                                    allitems1 = ""
	                                    allitems2 = ""
                                        If IsArray(items) Then

	                                        For rowcounter = firstrow to lastrow
	                                        allitems = items(0,rowcounter)
	                                        allitems1 = items(1,rowcounter)
	                                        allitems2 = items(2,rowcounter)

	                                        strBody = strBody & "<div style=""text-align:left;"">"& allitems & "<br> added by " & allitems1 & "<br>" & allitems2 & "<br><br></div>"

	
	                                        Next
                                        End If  

                                            objRsComment.Close  
                                            strBody = strBody & "</td><td valign=""top"">&nbsp;"&RqStatus&"</td><td valign=""top"">&nbsp;"&callStatus2&"</td></tr>"



                                        callcounter = callcounter + 1
                                        objRs.Movenext
                                        Loop
                                            else
                                               strBody1 =  " <br><br>No details found for the date "& formatdatetime(fromdate,2) 
                                            end If
                                        strBody = strBody &"<tr><td colspan=""10"">"&strBody1&"</td></tr></table></td></tr><tr><td><br><br>Best Regards,<br>ITILstudy Team<br><a href=""http://www.itilstudy.com"">www.ITILstudy.com</a></td></tr></table></body></html>"
                                            'response.write strBody

                                                Set objCDOMailsend = Server.CreateObject("CDONTS.NewMail")
		                                        objCDOMailsend.From = "marketing@itilstudy.com"
		                                        objCDOMailsend.To = "satpathyt@gmail.com"
                                                objCDOMailsend.cc = "leadershipedusysteam@googlegroups.com, ruth.k.pmstudy@gmail.com, tanya.b.pmstudy@gmail.com, keira.k@pmstudy.com, jodie.n@vmedu.com, jenni.b@pmstudy.com, gourab.nanda@vendorfit.com"
                                                objCDOMailsend.BCC="edusysbharath@gmail.com,edusysmadhava@gmail.com"
		                                        objCDOMailsend.Subject = "ITILstudy - Call report on "& Formatdatetime(fromDate,2)
		                                        objCDOMailsend.BodyFormat = 0
		                                        objCDOMailsend.MailFormat = 0
		                                        objCDOMailsend.Body = strBody
		                                        objCDOMailsend.Importance = 2
		                                        objCDOMailsend.Send
		                                        Set objCDOMailsend = Nothing

                                                '//Call report ends
                                        End If
                                        
			'Inserting date into the facultymailsent table because based on this emails will send daily'
			ConnObj.Execute "Insert into facultymailsent(datesent, country) values('"&todaydate&"', '"&Session("CRM_Country") &"')"
		
		End If
		
End If	
End If 
End If	
End If
%>
<!--#include virtual="/includes/connectionClose.asp"-->
