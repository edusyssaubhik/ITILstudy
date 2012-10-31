<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title>Student Booking</title>
 <link href="/India/css/pagestyle.css" rel="stylesheet" type="text/css">
 </head>
<!--#include virtual="/india/connection.asp"-->
<!-- other languages might be available in the lang directory; please check-->
<link href="calendar/template.css" rel="stylesheet" type="text/css">
<link href="calendar/system.css" rel="stylesheet" type="text/css">
 <script language ="javascript">
function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}
}
function Form_Validator(theform)
 {
 with (theform)
    {		
		if (validate_required(CourseId,"Required Course")==false)
			  {CourseId.focus();return false}	
        if (validate_required(ATO,"Required ATO")==false)
			  {ATO.focus();return false}			  
        if (validate_required(ExamNo1,"Required Exam No1")==false)
			  {ExamNo1.focus();return false}
	    if (validate_required(voucherNo,"Required Exam No2")==false)
			  {voucherNo.focus();return false}
		  
	}
}
	


</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Feedback Report</title>
</head>

  <body><div id="htMap">
  <%
  Dim strQuery
  
   Set Rs = Server.CreateObject("ADODB.Recordset")
   Set Rs1 = Server.CreateObject("ADODB.Recordset")
   Set Rs2 = Server.CreateObject("ADODB.Recordset")
   
  'Session("country") = "India"
Country = Session("country")

rqSubmit = Request.Form("submit")
rqType = Request.QueryString("type")


'To dispaly the meesage
message = Session("message")
Session("message") = ""


 rqId = Request.Querystring("id")
rqCourseId = Request.form("CourseId")
rqStudent  = Request.form("Student")

'strQuery = "SELECT courseId, city, startdate, enddate, coursetype, coursedates,instructor from ITIL_course WHERE country = '"&Country&"' AND  startdate < '"& Now() &"' AND status <> 'Cancelled' order by startdate desc"
  'Response.write(strQuery)
	strQuery = "SELECT courseId, city, startdate, enddate, coursetype, coursedates,instructor from ITIL_course WHERE country = '"&Country&"' AND  startdate BETWEEN DATEADD(day,-60,'"&Now()&"') AND DATEADD(day,60,'"&Now()&"') AND status <> 'Cancelled' order by startdate desc"
'Response.write(strQuery)

  Rs.Open strQuery,Conn	 	
	
	  If Not Rs.EOF Then
		arrAllRecords = Rs.getrows
		Session("arrAllRecords") = arrAllRecords
		firstRow = 0
		lastRow = 9
		numRows = Ubound(arrAllRecords,2)
		If lastRow > numRows Then
		   lastRow = numRows
		End If		
		allNumRows = numRows
	  End If
	  Rs.Close
	  
	 
	 
	  If rqCourseId <> "" Then 
	  
	  strQuery2 = "SELECT courseId, city, startdate, enddate from ITIL_course WHERE country = '"&Country&"' AND  startdate BETWEEN DATEADD(day,-60,'"&Now()&"') AND DATEADD(day,60,'"&Now()&"') AND status <> 'Cancelled'  and courseId ="&rqCourseId&" order by startdate desc"
	
	   Rs2.Open strQuery2,Conn 
	    If Not Rs2.EOF Then
		rscourseId = Rs2("courseId")
		
		rscity = Rs2("city")
		rsstartdate= Rs2("startdate")
		'startdate  = (FormatDateTime(rsstartdate,1))
		rsenddate = Rs2("enddate") 
		'enddate = (FormatDateTime(startdate,1))
	  
	    End If
	  
	  strQuery1 = "SELECT id,firstname,lastname FROM ITIL_enrolledusers WHERE courseid = '"& rqCourseId&"'"
	   
	 Rs1.Open strQuery1,Conn 
	 If Not Rs1.EOF Then
	   items1 = Rs1.getrows
	   numrows = Ubound(items1,2)
	   firstrow = 0
	   lastrow = numrows
	 End If
	 
	 End If
		  
  
  %>
  <script type="text/javascript" src="ExamDetails.js"></script>
 <table border="1" width="1200px" cellspacing="0" cellpadding="8" class="dbborder">
	   <tr>
	<td colspan="9" height="35" class="HeaderLarge"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% =Session("country") %></span> ITILstudy Back Office</font></div></td>
	</tr>
	   <tr>
	<td width="100px" valign="top" rowspan="22">
	<!--#include file="leftMenu.html"-->
	</td>
	</tr>
  <tr>
   <td height="25"><a href="examBooking.asp?type=addCandNo">Add Candidate Number</a></td>
 </tr>
  <tr>  
  <td valign="top">
  
  <%If rqType ="addCandNo" Then

   %>
  
  
  <table border="0" align="center" cellpadding="8" cellspacing="0" class="dbborder" height="100" width="650">
 <form action="ExamBooking.asp?type=details" method="post" name ="form1" onSubmit="return Form_Validator(this)"  >
  <tr><td>Select Class :</td><td><select name="CourseId" id="CourseId" style="width:350px"  >
             <option value="">-- Select --</option>
             <% If IsArray(arrAllRecords) Then
          		 For rowcounter = firstRow to allNumRows 
							
			  %>
 				<option <% If rqCourseId = arrAllRecords(0,rowcounter) Then %> selected="selected" <% End If %> value="<% = arrAllRecords(0,rowcounter) %>"><% = arrAllRecords(1,rowcounter) %> - <% = FormatDateTime(arrAllRecords(2,rowcounter),1) %>&nbsp;to&nbsp;<% = FormatDateTime(arrAllRecords(3,rowcounter),1) %></option>
         <% Next %>
         <% End If %>
                    </select>
<input type="submit" name="submit" value="Submit"/></td></tr></form>
</table> 		 
 
<% ElseIf rqType = "addExamNo" or rqType = "" Then %>
  <table border="0" align="center" cellpadding="8" cellspacing="0" class="dbborder" height="250" width="650">
 <form name="course" action="addeditExamBooking.asp?type=addExamNo" method="post" onSubmit="return Form_Validator(this)">

  <tr><td>Select Class :</td><td><select name="CourseId" id="CourseId" style="width:350px">
             <option value="">-- Select --</option>
             <% If IsArray(arrAllRecords) Then
          		 For rowcounter = firstRow to allNumRows 
				
			  %>
 				<option  value="<% = arrAllRecords(0,rowcounter) %>"><% = arrAllRecords(1,rowcounter) %> - <% = FormatDateTime(arrAllRecords(2,rowcounter),1) %>&nbsp;to&nbsp;<% = FormatDateTime(arrAllRecords(3,rowcounter),1) %></option>
         <% Next %>
		
          		<% End If %>
                    
 				</select>
    </td></tr>
  <tr><td>ATO No. :</td><td><input type="text" name="ATO_Ref_No" size="20" /></td></tr>
  <tr><td>Exam No. :</td><td><input type="text" name="Exam_No" size="20" /></td></tr>
  <tr><td>Exam Receipt No. :</td><td><input type="text" name="Exam_Recp_No" size="20" /></td></tr>  
<tr><td>&nbsp;</td><td ><input type="submit" name="submit" id="submit" value="Submit"/></td></tr>
</form>
 </table> <% End If %>
 <%  If rqType ="details" Then%>
<table border="0" align="center" cellpadding="8" cellspacing="0" class="dbborder" height="250" width="650">
	 <form action="addeditExamBooking.asp?type=addCandNo" name= "form2" method="post"  >
	   <tr>
				<td colspan="2" bgcolor="#00B0EC" align="center"><span class="HeaderLarge">Add Candidate No</span></td>
				</tr>
	<tr><td>Class Selected :</td><td><input type="text" value="<% =rscity %> - <% = FormatDateTime(rsstartdate,1) %> to <% = FormatDateTime(rsenddate,1) %>" readonly="readonly" size="60"/> </td></tr>
	   <tr><td>Delegates :</td><td><select name="enrollid" id="enrollid"  style="width:143px;" >
	                <option value="">--select--</option>
					 <% If IsArray(items1) Then
          		 For rowitems1 = firstitems1 to lastrow 								
			  %>
 				<option value="<% = items1(0,rowitems1) %>"><% = items1(1,rowitems1) %>&nbsp; <% = items1(2,rowitems1) %> </option>
         <% Next %>
         <% End If %>
	              </select></td></tr>
  <tr><td>Candidate No :</td><td><input type="text" name="Cand_No" size="20" /></td></tr>
 <tr><td>&nbsp;</td><td ><input type="submit" name="submit" id="submit" value="Submit"/></td></tr>
</form>
 </table><%End If%>
 </td></tr></table>
 
 
  
  </td></tr></table></div>
