<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'Written By : Bharath'
'Created Date: 09/09/2009'
'Last UpaDated: 09/09/2009'
'Description :'
'Taking daily backup from US-Backoffice System'
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'Declare the local variables'
Dim strCallRec, strFacComments
Dim objRs, objRs1

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
Set objRs2 = Server.CreateObject("ADODB.Recordset")

strCallRec = "SELECT * FROM ps_callsreceived ORDER BY callid desc"

objRs.Open strCallRec, ConnObj

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>USBackoffice BackUp</title>
</head>
<body>
<b>Calls Received</b>
<table width="100%" border="1" cellpadding="3" cellspacing="0">
  <tr>
    <td>Call ID</td>
    <td>Call For</td>
    <td>Caller Name</td>
    <td>Phone Number</td>
    <td>City</td>
    <td>OtherCity</td>
    <td>Email Id</td>
    <td>Question</td>
    <td>Other1</td>
    <td>Other2</td>
    <td>Added Date</td>
    <td>Status</td>
    <td>Added By</td>
    <td>Call Status</td>
    <td>Comments</td>
  </tr>
  <% Do Until objRs.Eof %>
  <tr>
    <td><% = objRs("callid") %></td>
    <td><% = objRs("callfor") %></td>
    <td><% = objRs("callername") %></td>
    <td><% = objRs("phoneno") %></td>
    <td><% = objRs("city") %></td>
    <td><% = objRs("othercity") %></td>
    <td><% = objRs("emailid") %></td>
    <td><% = objRs("question") %></td>
    <td><% = objRs("other1") %></td>
    <td><% = objRs("other2") %></td>
    <td><% = objRs("addeddate") %></td>
    <td>
	  <% If objRs("status") = 1 Then %>
      	No Follow Up Call
      <% ElseIf objRs("status") = 2 Then %>
        Follow Up Call
	  <% ElseIf objRs("status") = 3 Then %>        
         Closed
      <% End If %>
    </td>
    <td><% = objRs("addedby") %></td>
    <td><% = objRs("call_status") %></td>
    <%
		strFacComments = "SELECT * FROM ps_fac_comments WHERE callid = '"& objRs("callid") &"' ORDER BY f_cid desc"

		objRs1.Open strFacComments, ConnObj
	%>
    <td> 
    <% Do Until objRs1.EOF %>
    <% = objRs1("f_comment") %><br /><% = objRs1("comm_addedby")%>&nbsp;<% = objRs1("comm_date") %><br /><br />
    <% objRs1.Movenext
	   Loop
	   objRs1.Close %> 
    </td>
  </tr>
  <% objRs.Movenext
     Loop
	 objRs.Close %>
</table>

<br /><br /><br />
<%

strCourseIds = "SELECT courseid, startdate FROM ps_course WHERE country = 'US' AND status <> 'Cancelled' order by courseid asc"

objRs.Open strCourseIds,ConnObj
%>
<b>Enrolled Users</b>
<table width="100%" border="1" cellpadding="3" cellspacing="0">
  <tr>
    <td>Enroll ID</td>
    <td>Name</td>
    <td>Email Id</td>
    <td>Name Of Employer</td>
    <td>phoneno</td>
    <td>Course Details</td>
    <td>Date Of Enrollment</td>
    <td>Check Received</td>
    <td>Check Received Date</td>
    <td>Check Received By</td>
    <td>Status</td>
    <td>Backoffice Status</td>
    <td>Comments</td>
  </tr>
<%

Do Until objRs.Eof 

StartDate = objRs("startdate")

If(CDate(StartDate)-(Date()-1)>=0) then

strUSEnrollUsers = "SELECT * FROM ps_enrolledusers WHERE country = 'US' And courseid = '"& objRs("courseid") &"' ORDER BY id desc"

objRs1.Open strUSEnrollUsers, ConnObj

%>


  <% Do Until objRs1.Eof %>  
  <tr>
    <td><% = objRs1("id") %></td>
    <td><% = objRs1("firstname") %>&nbsp;<% = objRs1("lastname") %></td>
    <td><% = objRs1("email") %></td>
    <td><% = objRs1("nameofemployeer") %></td>
    <td><% = objRs1("phoneno") %></td>
    <td><% = objRs1("coursedetails") %></td>
    <td><% = objRs1("dateofenrollment") %></td>
    <td><% = objRs1("checkreceived") %></td>
    <td><% = objRs1("checkreceiveddate") %></td>
    <td><% = objRs1("checkreceivedby") %></td>
    <td><% = objRs1("status") %></td>
    <td><% = objRs1("us_status") %></td>
    <%
		strEnrollComments = "SELECT * FROM ps_enroll_comments WHERE enrollid = '"& objRs1("id") &"' ORDER BY cid desc"

		objRs2.Open strEnrollComments, ConnObj
	%>
    <td> 
    <% Do Until objRs2.EOF %>
    <% = objRs2("comment") %><br /><% = objRs2("comm_addedby")%>&nbsp;<% = objRs2("comm_date") %><br /><br />
    <% objRs2.Movenext
	   Loop
	   objRs2.Close %> 
    </td>
  </tr>
  <% objRs1.Movenext
     Loop
	 objRs1.Close %>  

<% End If %>
<% objRs.Movenext
   Loop
   objRs.Close %>
   </table>
   
<br /><br /><br />
<%

strStudyMat = "SELECT * FROM ps_studymaterial ORDER BY added_by"

objRs.Open strStudyMat, ConnObj

%>
<b>Study Material</b>
<table width="100%" border="1" cellpadding="3" cellspacing="0">
  <tr>
    <td>ID</td>
    <td>Workbook </td>
    <td>Process Chart </td>
    <td>Certificate Folder </td>
    <td>Blank Process sheet </td>
    <td>PMP Chapter Test </td>
    <td>PMP Final Test </td>
    <td>PMP Certificate</td>
    <td>CAPM Chapter Test</td>
    <td>CAPM Final Test </td>
    <td>CAPM Certificate</td>
    <td>Added By</td>
    <td>Added Date</td>
  </tr>
  <% Do Until objRs.EOF %>
  <tr>
    <td><% = objRs("id") %></td>
    <td><% = objRs("workbook") %></td>
    <td><% = objRs("processchart") %></td>
    <td><% = objRs("certfolder") %></td>
    <td><% = objRs("blankprocesssheet") %></td>
    <td><% = objRs("pmp_chaptertest") %></td>
    <td><% = objRs("pmp_finaltest") %></td>
    <td><% = objRs("pmp_certificate") %></td>
    <td><% = objRs("capm_chaptertest") %></td>
    <td><% = objRs("capm_finaltest") %></td>
    <td><% = objRs("capm_certificate") %></td>
    <td><% = objRs("added_by") %></td>
    <td><% = objRs("added_date") %></td>
  </tr>
  <% objRs.Movenext
     Loop
	 objRs.Close %>
</table>    
<br /><br /><br />
<%
strGifts = "SELECT *  FROM ps_gifts ORDER BY added_by"

objRs.Open strGifts, ConnObj
%>
<b>Gifts</b>
<table width="100%" border="1" cellpadding="3" cellspacing="0">
  <tr>
    <td>Id</td>
    <td>4 in 1 Pens</td>
    <td>Highlighter Neon Yellow</td>
    <td>Highlighter Neon Green </td>
    <td>Highlighter Neon Pink </td>
    <td>Pencil - Z- Grip </td>
    <td>Quick point Pen Holder </td>
    <td>Robot Series Calculator </td>
    <td>Backpack Travel </td>
    <td>Cap</td>
    <td>Stress Ball </td>
    <td>Added By</td>
    <td>Added Date</td>
  </tr>
  <% Do Until objRs.EOF %>  
  <tr>
    <td><% = objRs("id") %></td>
    <td><% = objRs("pen") %></td>
    <td><% = objRs("highlighter_yellow") %></td>
    <td><% = objRs("highlighter_green") %></td>
    <td><% = objRs("highlighter_pink") %></td>
    <td><% = objRs("pencil") %></td>
    <td><% = objRs("pen_holder") %></td>
    <td><% = objRs("calculator") %></td>
    <td><% = objRs("backpack") %></td>
    <td><% = objRs("cap") %></td>
    <td><% = objRs("stressball") %></td>
    <td><% = objRs("added_by") %></td>
    <td><% = objRs("added_date") %></td>
  </tr>
  <% objRs.Movenext
     Loop
	 objRs.Close %>  
</table>

</body>
</html>
