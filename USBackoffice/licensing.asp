<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<% 
	If Session("USBUserId") = "" Then 
		Response.Redirect("login.asp")
	Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
'Written By : savita'
'Last UpDated : 29/07/2010'
'Description :'
'This page is Scheduled Classes page'
'======================================================='

'Declare The Variables'
Dim InstName,CourseId
Dim strCourse,City,State_Code
Dim objRs, objRs1
Dim StartDate, EndDate
Dim rqAction, rqCourseID
Dim Instructor, BackUpInstructor
Dim strInstructors
Dim objRsUSCity, objRsCanadaCity, objRsInst
Dim rqCity, rqInst, HotelContract,todaysdate,rqcomp_name

'Create the recordobjects'
Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
Set objRsUSCity = Server.CreateObject("ADODB.Recordset")
Set objRsCanadaCity = Server.CreateObject("ADODB.Recordset")
Set objRsInst = Server.CreateObject("ADODB.Recordset")

rqAction = Request.QueryString("action")
rqCourseID = Request.QueryString("courseID")

'Retrive the values from serach option in this page'
rqCity = Request.Form("city")
rqInst = Request.Form("inst")

'For search option'
strInstructors = "SELECT firstname, lastname,emailid1 FROM ITIL_instructor WHERE typeofuser = 'Faculty' And (country = '"&Session("CRM_Country") &"') ORDER BY firstname"

objRsInst.Open strInstructors, ConnObj
todaysdate = (YEAR(Date()) & "-" & (Month(Date())) & "-" & (DAY(Date())))

strCourse = "SELECT courseid, city, startdate, enddate, starthour, startminute, startsession, endhour, endminute, endsession FROM ITIL_course WHERE (country = '"&Session("CRM_Country") &"') AND status <> 'Cancelled' AND status <> 'Completed' order by startdate"

objRs.Open strCourse, ConnObj

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Licensing Agreement</title>
<script type="text/javascript" src="calendar/zapatec.js"></script>
<script type="text/javascript" src="calendar/calendar.js"></script>
<script type="text/javascript" src="calendar/calendar-en.js"></script>
<link href="calendar/template.css" rel="stylesheet" type="text/css">
<link href="calendar/system.css" rel="stylesheet" type="text/css">
<!-- CSS -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
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
<script type="text/javascript">

function validate_form2(thisform)
{
     //validations for Instructor
	 if (thisform.instemail.selectedIndex =="")
	   {
		 alert("Please Select the Instructor");
		 thisform.instemail.focus();
		 return (false);
	   }
      //validations for Sceduled class
	 if (thisform.date.selectedIndex =="")
	   {
		 alert("Please Select the Sceduled class");
		 thisform.date.focus();
		 return (false);
	   }
	   //validations for Distance
	    if (thisform.Distance.selectedIndex =="")
	   {
		 alert("Please Select the Distance");
		 thisform.Distance.focus();
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
      <h2><a href="home.asp">Home</a> &raquo; <a href="licensing.asp" class="active">Licensing</a></h2>
      <div id="main">
        <fieldset>
        <form action="license_mail.asp" target="_blank" method="post" onSubmit="return validate_form2(this)">
        <table border="0" width="100%" class="table2">
        <tr>
        <form action="scheClasses.asp" method="post" onSubmit="return validate_form2(this)">
          <td width="10%">Instructor :</td>
          <td width="90%"><select name="instemail">
              <option value="">-Select-</option>
              <% Do Until objRsInst.EOF %>
              <option  value="<% = objRsInst("emailid1")%>">
              <% = objRsInst("firstname") & " "& objRsInst("lastname") %>
              </option>
              <% objRsInst.Movenext
			   Loop
			   objRsInst.Close %>
              </optgroup>
            </select>
          </td>
        </form>
        </tr>
        <tr>
          <td>Sceduled Date:</td>
          <td><select name="date">
              <option value="Select">--Select--</option>
              <% Do Until objRs.EOF %>
		  <option value="<% = Trim(objRs("city")) & " class,  Date: " & FormatDateTime(objRs("startdate"),1) & " to " & FormatDateTime(objRs("enddate"),1) & " Time: " & objRs("starthour") &"."& objRs("startminute") & " " & objRs("startsession") & " to " &  objRs("endhour") &"."& objRs("endminute") & " " & objRs("endsession") %>">
		  <% = objRs("city") & ",  Date: " & FormatDateTime(objRs("startdate"),1) & " to " & FormatDateTime(objRs("enddate"),1) & " Time: " & objRs("starthour") &"."& objRs("startminute") & " " & objRs("startsession") & " to " &  objRs("endhour") &"."& objRs("endminute") & " " & objRs("endsession") %>
		  </option>
              <% objRs.Movenext
			   Loop
			   objRs.Close %>
            </select>
          </td>
        </tr>
        <tr>
          <td>Distance:</td>
          <td><select name="Distance">
              <option value="Select">--Select--</option>
              <option value="1-60-miles">1-60 miles</option>
            
              <option value="61-200-miles">61-200 miles</option>
              <option value="More-than-200-miles">More than 200 miles</option>
            
            </select>
          </td>
        </tr>
        <tr>
		  <td>&nbsp;</td>
          <td>
              <input type="submit" name="submitvalue" value="Submit"/>
            </td>
        </tr>
        </table>
        </form>
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
