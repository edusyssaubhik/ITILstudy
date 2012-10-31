<% If not  Session("UserId") = "" Then %>
<!--#include virtual="/india/connection.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Enrollment Report</title>
<link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="htMap">
<%
'Retriving the values
Dim rqCountry

rqCountry = request.Form("countryOrigin")
rqDate       =  Request.Form("fromDate")
rqDate2       =  Request.Form("toDate")


%>
<table border="1" height="550" cellspacing="0" class="dbborder" width="1000px">
<tr>
  <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300">
      <% =Session("country") %>
      </span> ITILstudy Back Office</font></div></td>
</tr>
<tr>
  <td width="100px" valign="top" rowspan="22"><!--#include file="leftMenu.html"-->
  </td>
</tr>
<tr>
  <td><table width="500" height="80" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#00B0EC"  class="dbborder" >
      <tr>
        <td width="547" valign="top"><table width="100%" cellspacing="0" cellpadding="2">
            <tr>
              <td colspan="2" bgcolor="#00B0EC" align="center"><span class="HeaderLarge">Enrollment Report</span></td>
            </tr>
            <form id="form1" name="form1" method="post" action="enrollreport.asp?type=preview" onSubmit="return validate_form(this)">
              <tr class="rowEven">
                <td class="btext">From Date: </td>
                <td class="btext"><input type="text" name="fromDate" size="20" value="<% = rqDate %>">
                  (mm-dd-yyyy)</td>
              </tr>
              <tr class="rowEven">
                <td class="btext">To Date: </td>
                <td class="btext"><input type="text" name="toDate" size="20" value="<% = rqDate2 %>">
                  (mm-dd-yyyy)</td>
              </tr>
              <tr class="rowEven">
                <td class="btext">Country:</td>
                <td class="btext">&nbsp;&nbsp;
                  <select name="countryOrigin">
                    <option value="">--Select--</option>
                    <option  value="Australia" <% If rqCountry = "Australia"  then%> selected="selected" <% End If%> >Australia</option>
                    <option value="Canada" <% If rqCountry= "Canada"  then%> selected="selected" <% End If%>>Canada</option>
                    <option value="India" <% If rqCountry = "India"  then%> selected="selected" <% End If%>>India</option>
                    <option value="Singapore"<% If rqCountry = "Singapore"  then%> selected="selected" <% End If%>>Singapore</option>
                    <option value="UAE" <% If rqCountry = "UAE"  then%> selected="selected" <% End If%>>UAE</option>
                    <option value="United Kingdom" <% If rqCountry = "United Kingdom"  then%> selected="selected" <% End If%>>United Kingdom</option>
                    <option value="US" <% If rqCountry = "US"  then%> selected="selected" <% End If%>>US</option>
                    <option value="All" <% If rqCountry = "All"  then%> selected="selected" <% End If%>>All</option>
                  </select></td>
              </tr>
              <tr class="rowEven">
                <td colspan="3" align="center"><input name="Submit3" type="Submit"  value="Submit" class="buttonc"/>
                </td>
              </tr>
            </form>
            <tr class="rowEven">
              <td colspan="2">&nbsp;</td>
            </tr>
          </table></td>
      </tr>
    </table>
    <br />
    <br />
    <div>
      <%
'Declare Local Variables'
Dim rqType
Dim strQuery,strQuery1,strQuery2
Dim objRs1,objRs
Dim objRs2 , objRs3
Dim rqCourseId, rqEnrollStatus,rqDate,rqDate2

	
'Recordset	
Set objRs1 = Server.CreateObject("ADODB.Recordset") 
Set objRs2 = Server.CreateObject("ADODB.Recordset") 
Set objRs3 = Server.CreateObject("ADODB.Recordset") 


'Retrive The Type Within this page'
rqType = Request.QueryString("type")
rqPage = Request.QueryString("page")
rqRow  = Request.QueryString("row")
rqCourseDetails = Request.Form("CourseDetails")
rqCourseId = Request.Form("courseId")


%>
      <%
'databases fetching from main database

response.Flush()

 	'If (rqPage = "next" AND rqPage <> "previous") then

	
	   if Request.form("fromDate") <> "" then
	       rqDate = Request.form("fromDate")
	 Elseif Request.Querystring("fromDate") <> ""then
	       rqDate=  Request.Querystring("fromDate")
	    End if
	   if Request.form("toDate") <> "" then
	       rqDate2 = Request.form("toDate")
	 Elseif Request.Querystring("toDate") <> ""then
	       rqDate2=  Request.Querystring("toDate")
	    End if
		
		  if Request.Form("countryOrigin") <> "" then
	       rqCountryOrigin = Request.form("countryOrigin")
	 Elseif Request.Querystring("countryOrigin") <> ""then
	       rqCountryOrigin=  Request.Querystring("countryOrigin")
	    End if


 If rqCountryOrigin = "US" OR rqCountryOrigin = "Canada" Then
	
	strCourseIds = "SELECT course.courseid, course.city, course.startdate, course.enddate, city.state_code, course.coursedates  FROM ITIL_course course, ITIL_city city WHERE course.city = city.city And (course.country = 'US' OR course.country = 'Canada') And (city.country = 'US' OR city.country = 'Canada') AND (course.country = city.country) AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate Between '"&rqDate&"' And '"&rqDate2&"' order by course.startdate, course.city asc"
	
	 ElseIf rqCountryOrigin = "All" Then
	
	strCourseIds = "SELECT course.courseid, course.city, course.startdate, course.enddate, city.state_code, course.coursedates  FROM ITIL_course course, ITIL_city city WHERE  course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate Between '"&rqDate&"' And '"&rqDate2&"' order by course.startdate, course.city asc"
	
	Else
	
	strCourseIds = "SELECT course.courseid, course.city, course.startdate, course.enddate, city.state_code, course.coursedates FROM ITIL_course course, ITIL_city city WHERE course.city = city.city And (course.country = '"&rqCountryOrigin&"') And (city.country = '"&rqCountryOrigin&"') AND (course.country = city.country) AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate  Between '"&rqDate&"' And '"&rqDate2&"' order by course.startdate, course.city asc"
	
	
	End If
		
	'Response.Write(strCourseIds)
	
	objRs1.Open strCourseIds,Conn

	%>
      <%	If rqType = "preview" then
 %>
      <table width="550" height="80" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#00B0EC"  class="dbborder" >
        <tr bgcolor="#00B0EC">
          <td  class="btext" width="100px" align="center">SrNo</td>
          <td  class="btext" width="100px" align="center">City</td>
          <td  class="btext" width="180px" align="center">Classes</td>
          <td  class="btext" width="180px" align="center">Total Enrollment</td>
          <td  class="btext" width="180px" align="center">Paid Student</td>
        </tr>
        <%  
				SrNO = 1
				Do Until objRs1.EOF
   
     CourseId = objRs1("courseid")
	 City = Trim(objRs1("city"))
	 StartDate = objRs1("startdate")
	 EndDate = objRs1("enddate")
	 State_Code = objRs1("state_code")
	 CourseDates = objRs1("coursedates")
	 
	 'If (CDate(StartDate)-(Date()-1)>=0) Then
	 
		 strEnrollments = "SELECT count(*) AS Total FROM ITIL_enrolledusers WHERE courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule' And (us_status Is Null OR us_status <> 'Dummy')"
		 
		' Response.write(strEnrollments)
		 
		 objRs2.Open strEnrollments,Conn
		 
		 Do Until objRs2.EOF
			TotalEnrollments = objRs2("Total")
		 objRs2.Movenext
		 Loop
		 objRs2.Close
		 
		 strPaid = "SELECT count(*) AS Paid FROM ITIL_enrolledusers WHERE checkreceived = 'Yes' AND courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule'"
		 
		 objRs3.Open strPaid,Conn	 
	
		 Do Until objRs3.EOF
		 
			Paid = Int(objRs3("Paid"))
		 
		 objRs3.Movenext
		 Loop
		 objRs3.Close
		 

		%>
        <tr class="rowEven">
          <td  class="btext" width="20%"><% = SrNo %></td>
          <td  class="btext" width="20%"><% = City %>
          </td>
          <td  class="btext" width="150%"><% = FormatDateTime(StartDate,1) %> to <% = FormatDateTime(EndDate,1) %></td>
          <td  class="btext" width="70%" align="center"><% = TotalEnrollments %></td>
          <td  class="btext" width="70%" align="center"><% = Paid  %></td>
        </tr>
        <%  
				   SrNo = SrNo + 1
     objRs1.Movenext
     Loop
	 objRs1.Close %>
      </table>
      <% End If %>
    </div>
    <%

 Else
 Response.Redirect("../login.asp")
 End If
%>
</body>
</html>
