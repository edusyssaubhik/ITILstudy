<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<% 
	If Session("USBUserId") = "" Then 
		Response.Redirect("login.asp")
	Else
%>
<!--#include virtual="/includes/connection.asp"-->

<!--#include virtual="/includes/connection_global.asp"-->
<%
'======================================================='
'Written By : Bharath'
'Last UpDated : 13/08/2009'
'Description :'
'This page is Scheduled Classes page'
'======================================================='

'Declare The Variables'
Dim InstName,rqCourse
Dim strCourse, strEnrollUsers
Dim CourseId
Dim objRs, objRs1
Dim City
Dim StartDate, EndDate
Dim rqAction, rqCourseID
Dim Instructor, BackUpInstructor
Dim State_Code,PastEndDate,PastStartDate
Dim strUSCity, strCanadaCity, strCity
Dim objRsUSCity, objRsCanadaCity, objRsCity,rqPastCourseId
Dim rqCity, rqInst, HotelContract,strQuery,objRsCourse
Dim strInstructors, objRsInst, strCountry,rqPastcourse,PastCourseId,ATO_Ref_No,Exam_Recp_No

'Create the recordobjects'
Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
Set objRsUSCity = Server.CreateObject("ADODB.Recordset")
Set objRsCanadaCity = Server.CreateObject("ADODB.Recordset")
Set objRsCity = Server.CreateObject("ADODB.Recordset")
Set objRsInst = Server.CreateObject("ADODB.Recordset")
Set objRsInst = Server.CreateObject("ADODB.Recordset")
Set objRsCourse = Server.CreateObject("ADODB.Recordset")

rqAction = Request.QueryString("action")
rqCourseID = Request.QueryString("courseID")
rqPastCourseId = Trim(Request.Form("PastCourseId"))

'Response.write(rqPastCourseId)

'Retrive the values from serach option in this page'
rqCity = Request.Form("city")
rqInst = Request.Form("inst")

'InstName = Session("FirstName") & " " & Session("LastName")
						
'For search option'
'Query to select City / states
If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then

	strUSCity = "SELECT city,state_code FROM ITIL_city WHERE country = 'US' ORDER BY city"
	
	objRsUSCity.Open strUSCity, ConnObj
	
	strCanadaCity = "SELECT city,state_code FROM ITIL_city WHERE country = 'Canada' ORDER BY city"
	
	objRsCanadaCity.Open strCanadaCity, ConnObj

Else

	strCity = "SELECT city,state_code FROM ITIL_city WHERE country = '"& Session("CRM_Country") &"' ORDER BY city"
	
	objRsCity.Open strCity,ConnObj

End If

'Query to select instructors
If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then

	strInstructors = "SELECT firstname, lastname FROM ps_us_instructors WHERE typeofuser = 'Faculty' And (country = 'US' OR country = 'Canada') ORDER BY firstname"
	
	objRsInst.Open strInstructors, ConnObj1

Else 

	strInstructors = "SELECT firstname, lastname FROM ITIL_instructor WHERE typeofuser = 'Faculty' And country = '"& Session("CRM_Country") &"' ORDER BY firstname"
	
	objRsInst.Open strInstructors, ConnObj

End If

'Query to select course
If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then

	strQuery = "SELECT courseid,city,startdate,enddate,instructor,status,coursedates,ATO_Ref_No,Exam_Recp_No from ITIL_course WHERE (country = 'US' OR country = 'Canada') AND  startdate < '"& Now() - 4 &"' AND status = 'Available' order by startdate desc"
		
Else

	strQuery = "SELECT courseid,city,startdate,enddate,instructor,status,coursedates,ATO_Ref_No,Exam_Recp_No from ITIL_course WHERE country = '"& session("CRM_Country") &"' AND  startdate < '"& Now() - 4 &"'   AND status = 'Available' order by startdate desc"
	
End If

objRsCourse.Open strQuery, ConnObj


'Display the queries country wise'
If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then
	strCountry = "(course.country = 'US' OR course.country = 'Canada')"
ElseIf Session("CRM_Country") = "UAE" Then
	strCountry = "(course.country = 'UAE')"
ElseIf Session("CRM_Country") = "Singapore" Then
	strCountry = "(course.country = 'Singapore')"
ElseIf Session("CRM_Country") = "India" Then
	strCountry = "(course.country = 'India')"
ElseIf Session("CRM_Country") = "Australia" Then
	strCountry = "(course.country = 'Australia')"
ElseIf Session("CRM_Country") = "United Kingdom" Then
	strCountry = "(course.country = 'United Kingdom')"
ElseIf Session("CRM_Country") = "Germany" Then
	strCountry = "(course.country = 'Germany')"
ElseIf Session("CRM_Country") = "Netherlands" Then
	strCountry = "(course.country = 'Netherlands')"	
ElseIf Session("CRM_Country") = "Netherlands" Then
	strCountry = "(course.country = 'Netherlands')"

Else
	strCountry = "(course.country = 'US' OR course.country = 'Canada')"
End If	

'If user select city in the city dropdown that will come here'
If rqCity <> "" Then

strCourse = "SELECT course.courseid, course.city, course.startdate, course.enddate, course.instructor, course.hotelContracts, city.state_code, course.coursedates,course.ATO_Ref_No,course.Exam_Recp_No FROM ITIL_course course, ITIL_city city WHERE course.city = '"&rqCity&"' And city.city = '"&rqCity&"' And "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 4&"' order by course.startdate, course.city asc"

ElseIf rqInst <> "" Then

strCourse = "SELECT course.courseid, course.city, course.startdate, course.enddate, course.instructor, course.hotelContracts, city.state_code, course.coursedates,course.ATO_Ref_No,course.Exam_Recp_No FROM ITIL_course course, ITIL_city city WHERE course.instructor Like '%"&rqInst&"%' And course.city = city.city And "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 4&"' order by course.startdate, course.city asc"

ElseIf rqPastCourseId <> "" Then

'strCourse = "SELECT courseid,city,startdate,enddate,instructor,status,coursedates from ps_course WHERE courseid = '"&rqPastCourseId&"'"

strCourse = "SELECT course.courseid, course.city, course.startdate, course.enddate, course.instructor, course.hotelContracts, city.state_code, course.coursedates,course.ATO_Ref_No,course.Exam_Recp_No FROM ITIL_course course, ITIL_city city WHERE course.city = city.city And "& strCountry &" AND course.courseid = '"&rqPastCourseId&"'"
 
Else
	
strCourse = "SELECT course.courseid, course.city, course.startdate, course.enddate, course.instructor, course.hotelContracts, city.state_code, course.coursedates,course.ATO_Ref_No,course.Exam_Recp_No FROM ITIL_course course, ITIL_city city WHERE course.city = city.city And "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 4&"' order by course.startdate, course.city asc"

End If

'Response.write(strCourse)

objRs.Open strCourse, ConnObj


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Classes Scheduled</title>
<script type="text/javascript" src="calendar/zapatec.js"></script>
<script type="text/javascript" src="calendar/calendar.js"></script>
<script type="text/javascript" src="calendar/calendar-en.js"></script>
<link href="calendar/template.css" rel="stylesheet" type="text/css">
<link href="calendar/system.css" rel="stylesheet" type="text/css">
<!-- CSS -->
<link href="css/style1.css" rel="stylesheet" type="text/css" media="screen" />
<!--[if IE 6]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie6.css" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie7.css" /><![endif]-->
<!-- JavaScripts-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jNice.js"></script>
<script language="javascript" type="text/javascript">
<!--

function popitup(url) {
	newwindow=window.open(url,'name','toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=0,minimizable=0,resizable=0,height=300,width=300,top=250,left=400');
	if (window.focus) {newwindow.focus()}
	return false;
}

// -->
<!--  PMstudy -->
</script>
<script language="javascript">
//This Function For Without Clicking Radio Button In Course Page

function Form_Validator1(theform)
{

 if (theform.review.checked == "")
 {
   alert("Please Select Yes");
   return false;
 }
 
} 

</script>
</head>
<body>
<div id="wrapper">
  <!--#include file="includes/topMenu.asp"-->
  <!-- // #end mainNav -->
  <div id="containerHolder" style="width:1100px;">
    <div id="container" style="width:1100px;">
      <div id="sidebar">
        <!--#include file="includes/leftMenu.asp"-->
        <!-- // .sideNav -->
      </div>
      <!-- // #sidebar -->
      <!-- h2 stays for breadcrumbs -->
      <h2><a href="home.asp">Home</a> &raquo; <a href="scheClasses.asp" class="active">Classes Scheduled</a></h2>
      <div id="main">
        <table width="890px">
          <tr>
            <td width="20%"><h3>Assigned Classes</h3></td>
            <form action="scheClasses.asp" method="post">
              <td width="40%">City :
                <select name="city">
                  <option value="">-Select-</option>
                  <% If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then %>
                  <optgroup label="US">
                  <% Do Until objRsUSCity.EOF %>
                  <option <% If rqCity = objRsUSCity("city") Then %> selected="selected" <% End If %> value="<% = objRsUSCity("city") %>">
                  <% = objRsUSCity("city") %>
                  ,
                  <% = objRsUSCity("state_code") %>
                  </option>
                  <% objRsUSCity.Movenext
				   Loop
				   objRsUSCity.Close %>
                  </optgroup>
                  <optgroup label="Canada">
                  <% Do Until objRsCanadaCity.EOF %>
                  <option <% If rqCity = objRsCanadaCity("city") Then %> selected="selected" <% End If %> value="<% = objRsCanadaCity("city") %>">
                  <% = objRsCanadaCity("city") %>
                  ,
                  <% = objRsCanadaCity("state_code") %>
                  </option>
                  <% objRsCanadaCity.Movenext
				   Loop
				   objRsCanadaCity.Close %>
                  </optgroup>
                  <% Else %>
                  <% Do Until objRsCity.EOF %>
                  <option <% If rqCity = objRsCity("city") Then %> selected="selected" <% End If %> value="<% = objRsCity("city") %>">
                  <% = objRsCity("city") %>
                  </option>
                  <% objRsCity.Movenext
				   Loop
				   objRsCity.Close %>
                  <% End If %>
                </select>
                <input type="submit" name="search" value="Search" />
              </td>
            </form>
            <form action="scheClasses.asp" method="post">
              <td width="55%">Instructor :
                <select name="inst">
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
                </select>
                <input type="submit" name="search" value="Search" />
              </td>
            </form>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <form action="scheClasses.asp" method="post">
              <td colspan="3">Past Courses :
                <select name="PastCourseId">
                  <option value="">-Select-</option>
                  <% If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then %>
                  <% Do Until objRsCourse.EOF
				   PastStartDate = objRsCourse("startdate")
			       PastEndDate = objRsCourse("enddate")
				   
				 
				   %>
                  <option <% If rqPastCourseId =  Trim(objRsCourse("courseid")) Then %> selected="selected" <% End If %> value="<% =objRsCourse("courseid") %>">
                  <% =  objRsCourse("city")& " : "& FormatDateTime(PastStartDate,1) & " to "& FormatDateTime(PastEndDate,1) %>
                  </option>
                  <% objRsCourse.Movenext
				   Loop
				   objRsCourse.Close %>
                  <% Else %>
                  <% Do Until objRsCourse.EOF
				    PastStartDate = objRsCourse("startdate")
			       PastEndDate = objRsCourse("enddate")
				   
				  %>
                  <option <% If rqPastCourseId =  Trim(objRsCourse("courseid")) Then %> selected="selected" <% End If %> value="<% =objRsCourse("courseid") %>">
                  <% =  objRsCourse("city")& " : "& FormatDateTime(PastStartDate,1) & " to "& FormatDateTime(PastEndDate,1) %>
                  </option>
                  <% objRsCourse.Movenext
				   Loop
				   objRsCourse.Close %>
                  <% End If %>
                </select>
                <input type="submit" name="search" value="Search" />
              </td>
            </form>
          </tr>
        </table>
        <div>&nbsp;</div>
        <fieldset>
        <% If (Not objRs.BOF) And (Not objRs.EOF) Then %>
        <table border="0" cellpadding="5" cellspacing="3" class="table1">
          <tr>
            <td><b>City</b></td>
            <td><b>Class Date</b></td>
             <td><b>Ato No</b></td>
              <td><b>Exam receipt No</b></td>
            <td><b>Instructor</b></td>
            <td><b>View Details</b></td>
            <td><b>Venue</b></td>
            <td><b>Hotel Contract</b></td>
          </tr>
          <% Do Until objRs.EOF 
						 
			  CourseId = objRs("courseid")
			  City = Trim(objRs("city"))
			  StartDate = objRs("startdate")
			  EndDate = objRs("enddate")
			  Instructor = objRs("instructor")
			  State_Code = objRs("state_code")
			  HotelContract = objRs("hotelContracts")
			   ATO_Ref_No = objRs("ATO_Ref_No")
			    Exam_Recp_No = objRs("Exam_Recp_No")
			  
			 ' If (CDate(StartDate)-(Date()-4)>=0) And (DateAdd("d",1200,date())>=EndDate) Then
		 %>
          <tr>
            <td><% = City %>
              <% If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then %>
              <% If State_Code <> "" Then %>
              ,
              <% End If %>
              <% = State_Code %>
              <% End If %>
              <% If objRs("coursedates") <> "" Then %>
              <br />
              Weekend Course
              <% End If %>
            </td>
            <td><% = FormatDateTime(StartDate,1) %>
              to
              <% = FormatDateTime(EndDate,1) %></td>
              <td><% = ATO_Ref_No %></td>
              <td><% = Exam_Recp_No %></td>
            <td><% = Instructor %></td>
            <td><a href="viewEnrollDet.asp?courseid=<% = CourseId %>">View Details</a></td>
            <td><a href="/venue.asp?courseID=<% = CourseId %>" onClick="return popitup('/venue.asp?courseID=<% = CourseId %>')">Click here</a></td>
            <% If HotelContract <> "" Then %>
            <td><a href="http://www.PMstudy.info/itildocs/<% = HotelContract %>" target="_blank">View hotel contract</a></td>
            <% Else %>
            <td>&nbsp;</td>
            <% End If %>
          </tr>
          <% 'End If
			 objRs.Movenext
			 Loop 
			 objRs.Close %>
        </table>
        <% Else %>
        <table align="center" width="50%">
          <tr>
            <td>No Classes</td>
          </tr>
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
<!--#include virtual="/includes/connectionCloseGlobal.asp"-->
<% End If %>
