<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<% 
	If Session("USBUserId") = "" Then 
		Response.Redirect("login.asp")
	Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'Declare the local variables'	
Dim rqCourseId
Dim strEnrollDet, strCourse
Dim objRs, objRs1, CourseName
Dim City, StartDate, EndDate,CourseID,Cand_No

rqCourseId = Request.QueryString("courseid")

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")

'strEnrollDet = "SELECT firstname, lastname, email, nameofemployeer, phoneno, dateofenrollment FROM ps_enrolledusers WHERE checkreceived = 'Yes' AND status= 'Active' And courseid = '"& rqCourseId &"'"

strEnrollDet = "SELECT id, firstname, lastname, email, nameofemployeer, phoneno, dateofenrollment, checkreceived, us_status, enrolledFor,Cand_No FROM ITIL_enrolledusers WHERE  status= 'Active' And (us_status <> 'Dummy' or us_status Is Null) And courseid = '"& rqCourseId &"' order by checkreceived desc"

'Response.write(strEnrollDet)

objRs.Open strEnrollDet,ConnObj

strCourse = "SELECT courseid, city, startdate, enddate FROM ITIL_course WHERE courseid = '"& rqCourseId &"'"

objRs1.Open strCourse,ConnObj

Do Until objRs1.EOF 

  City = objRs1("city")
  StartDate = objRs1("startdate")
  EndDate = objRs1("enddate")
   CourseID = objRs1("courseid")
   ' Cand_No = objRs1("Cand_No")

objRs1.Movenext
Loop
objRs1.Close


'Logged in username putting into one variable'
'LoggedInInst = Session("FirstName") &" "& Session("LastName")


	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Enrollment Details</title>

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
</head>

<body>
	<div id="wrapper">
        <!--#include file="includes/topMenu.asp"-->
        <!-- // #end mainNav -->
        
        <div id="containerHolder" style="width:1300px;">
			<div id="container" style="width:1300px;">
        		<div id="sidebar">
                	<!--#include file="includes/leftMenu.asp"-->
                    <!-- // .sideNav -->
                </div>    
                <!-- // #sidebar -->
                
                <!-- h2 stays for breadcrumbs -->
                <h2><a href="home.asp">Home</a> &raquo; <a href="scheClasses.asp" class="active">Classes Scheduled</a></h2>
                
                <div id="main">

					<p><h3>Paid students</h3></p>
					<fieldset>
                    <label><% = City %> : <% = FormatDateTime(StartDate,1) %> to <% = FormatDateTime(EndDate,1) %></label>
                    <label>&nbsp;</label>
					   <% If (Not objRs.BOF) And (Not objRs.EOF) Then %>
						<table border="0" cellpadding="5"  class="table1">
						 <tr>
                         <td><b>Candidate No</b></td>
						  <td><b>Name</b></td>
                          <td><b>Enrolled For</b></td>
						  <td><b>Phone Number</b></td>
						  <td><b>Email Id</b></td>
						  <td><b>Name Of Employer</b></td>
                          <td><b>Date Of Enrolled</b></td>
                          <td><b>Payment Status</b></td>
						  <td><b>Comments</b></td>
				          <td><b>History</b></td>
						 </tr>
						 <% Do Until objRs.EOF %>
						 <tr>
                         <td><% = objRs("cand_No") %></td>
						  <td><% = objRs("firstname") %>&nbsp;<% = objRs("lastname") %></td>
                          <td><% = objRs("enrolledFor") %></td>
						  <td><% = objRs("phoneno") %></td>
						  <td><% = objRs("email") %></td>
						  <td><% = objRs("nameofemployeer") %></td>
                          <td><% = objRs("dateofenrollment") %></td>
                          <td>
                          	<%
								If objRs("checkreceived") = "Yes" Then
									Response.Write("Paid")
								ElseIf IsNull(objRs("checkreceived")) And IsNull(objRs("us_status")) Then
									Response.Write("Not Paid")
								Else
									Response.Write(objRs("us_status"))
								End If
							%>
                          </td>
						    <form name="comment" action="addEnrollComments.asp" method="post" onsubmit="return Form_Validator(this)">
                          <input type="hidden" name="enrollid" value="<% = objRs("id") %>">
                          <input type="hidden" name="courseid" value="<% = CourseID %>" />
                          <input type="hidden" name="redirect" value="ScheClasses" />
                          <td><Textarea name="comment" rows="5" cols="20" ></Textarea>
                            <input type="submit" name="type" value="Save">
                        </form>
                        </td>
                        <td><iframe src="enroll_comments.asp?enrollid=<% = objRs("id") %>" frameborder="0" height="100" scrolling="yes" width="200"></iframe></td>
						
						 </tr>
						 <% objRs.Movenext
						    Loop
							objRs.Close %>
						 </table>
						<% Else %>
							<label>No Paid Students</label>
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