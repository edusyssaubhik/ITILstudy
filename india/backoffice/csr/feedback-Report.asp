<%@ Language = "VBScript" %>
<% 
   If Session("UserId")  = "" Then
    Response.Redirect("../login.asp")
   Else
%>

<%
'======================================================='
 'Written By : Mahima'
 'Last UpaDated: 22/11/2011'
 'Description :'
 'Purpose :Faculty Report'
'======================================================='
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title>Facult Report</title>
 <link href="/India/css/pagestyle.css" rel="stylesheet" type="text/css">
 </head>
<!--#include virtual="/india/connection.asp"-->
 <script type="text/javascript" src="calendar/zapatec.js"></script><!-- Custom includes --><!-- import the calendar script -->
<script type="text/javascript" src="calendar/calendar.js"></script><!-- import the language module -->
<script type="text/javascript" src="calendar/calendar-en.js"></script><!-- other languages might be available in the lang directory; please check-->
<style type="text/css">
#feedback{
border:1px solid #ccc;
border-collapse:collapse;

}
#feedback td{
border:solid 1px;
background:#f2f2f2;

}



</style>

<link href="calendar/template.css" rel="stylesheet" type="text/css">
<link href="calendar/system.css" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Feedback Report</title>
</head>
<%
Dim strQuery,strQuery1,Rs1,strQuery2,Rs2,strQuery3,Rs3,strQuery4,Rs4,Rs5,strQuery5,strQuery6
Dim arrAllQueries,FirstRow,LastRow,countryRowCounter
Dim rqfromdate,rqcountryOrigin,rqfrom,rqtodate,rqto,rqSubmit
Dim rqfromReport,Reporfrom,rqtoReport,reportto
Dim arrAllRecords,first,last,numRows
Dim From_Friend,PMI_Website,From_Internet,From_Magzines
Dim enrollfirstRow,enrolllastRow,enrollnumRows,arrQueries
Dim Reimbursementy,ReimbursementN,ReimbursementNa,TotalCount
Dim Course_Quality,Faculty_Quality,Price,Moneyback_Guarantee,Pass_Rate,Location_Proximity,Free_SixSigma
Dim Course_Material,avgCourseMaterial,Teacher_Meth,avgTeacherMeth,Instructor,AvgInstructor,OverallProgram,avgOverallProgram,Rating,AverageRating
Dim rqInstructors,rqfacultyid,rqfirstname,rqlastname,rqname,Country,rqType

  Set Rs = Server.CreateObject("ADODB.Recordset")
  Set Rs1 = Server.CreateObject("ADODB.Recordset")
  Set Rs2 = Server.CreateObject("ADODB.Recordset")
  Set Rs3 = Server.CreateObject("ADODB.Recordset")
  Set Rs4 = Server.CreateObject("ADODB.Recordset")
  Set Rs5 = Server.CreateObject("ADODB.Recordset")
  Set Rs6 = Server.CreateObject("ADODB.Recordset")
  Set Rs7 = Server.CreateObject("ADODB.Recordset")

'Session("country") = "India"

 message = Session("message")
Session("message") = "" 
If Request.Form("countryOrigin") <> "" then
	rqCountry = Request.Form("countryOrigin")
Else 
	rqCountry = Session("country")	
End If
Session("rqCountry")= rqCountry
'retiving facultyid from the Form 
If Request.Form("facultyid") <> "" then
	rqfacultyid = Request.Form("facultyid")
Else 
	rqfacultyid = Request.Querystring("facultyid")
End If
 City = Request.Form("facultyid") 

  rqType = Request.QueryString("type")

If Request.Form("courseId") <> "" then
rqCourseId = Request.Form("courseId")
Else 
rqCourseId = Request.Querystring("courseId")
End If  

'Response.write(rqCourseId)
    
	rqfromdate      =  Request.Form("fromdate") 
	session("rqfromdate")=rqfromdate
	rqfrom          =  FormatDatetime(rqfromdate)
	session("rqfrom")=rqfrom
	rqtodate        =  Request.Form("todate")
	Session("rqtodate") = rqtodate
	rqto            =  FormatDatetime(rqtodate) 
	session("rqto")=rqto
	'rqSubmit        =  Request.Form("submit")
	
	'Retiving the values from the Form for faculty Date wise Report
	rqfromReport    =  Request.Form("fromdateReport")
	Session("rqfromReport") =rqfromReport
	Reporfrom       =  FormatDatetime(rqfromReport)
	Session ("Reporfrom") = Reporfrom
	rqtoReport      =  Request.Form("todateReport")
	Session("rqtoReport") =rqtoReport
	reportto        =  FormatDatetime( rqtoReport )
	Session("reportto")=reportto
	
      
	
  strQuery = "Select Distinct(country) From ITIL_city"
 'Response.write(strQuery)
  Rs.Open strQuery,Conn

  If Not Rs.EOF Then
     arrAllQueries = Rs.getRows	
     Session("arrAllQueries") = arrAllQueries
     countryRowCounter = Ubound(arrAllQueries,2)
     FirstRow = 0
     LastRow  = countryRowCounter
  End If

  strQuery3 = "SELECT instid,firstname,lastname FROM ITIL_instructor where typeofuser ='Faculty' and country ='"&rqCountry&"'"
' Response.write(strQuery3)
  Rs3.Open strQuery3,Conn

  If Not Rs3.EOF Then
     arrInstructors = Rs3.getRows	
     RowInstructors = Ubound(arrInstructors,2)
     FirstInstructors = 0
     LastInstructors  = RowInstructors
  End If	  
  
  		
		strQuery2 = "select * from ITIL_competitors  WHERE country = '"&rqCountry&"'"
		'Response.write(strQuery2)
		Rs2.Open strQuery2,Conn  
		If Not Rs2.EOF THen
		arrAllproviders = Rs2.getrows
		providersNumRows = Ubound(arrAllproviders,2)  
		providersFirstRow = 0
		providersLastRow  = providersNumRows
		End If
		Rs2.close
		
		strQuery6 = "SELECT distinct(c.courseId), c.city, c.startdate, c.enddate from ITIL_course c, ITIL_feedbacks f WHERE c.country = '"&rqCountry&"' AND  startdate < '"& Now() &"' AND status <> 'Cancelled'  and c.courseId = f.Course_ID group by c.courseId,c.city,c.startdate,c.enddate order by startdate desc"


      Rs6.Open strQuery6,Conn	 	
	
	  If Not Rs6.EOF Then
		arrAllRecords = Rs6.getrows
		Session("arrAllRecords") = arrAllRecords
		firstRecords = 0
		lastRecords = 9
		numRowsRecords = Ubound(arrAllRecords,2)
		If lastRecords > numRowsRecords Then
		   lastRecords = numRowsRecords
		End If		
		allNumRecords= numRowsRecords
	  End If
	  Rs6.Close
	  
	  If rqCourseId <> "" Then		    
	  	strQuery1 = "select * from ITIL_feedbacks where Course_ID ='"&rqCourseId&"'"
		'Response.write(strQuery1)   
		Rs1.Open strQuery1,Conn
		If Not Rs1.EOF Then
		arrQueries = Rs1.getRows
		enrollnumRows = Ubound(arrQueries,2)  
		enrollfirstRow = 0
		enrolllastRow = enrollnumRows
		End IF 
		Rs1.close
		
		strQuery7 = "SELECT city, startdate, enddate from ITIL_course WHERE courseID='"&rqCourseId&"'"
		Rs7.Open strQuery7,Conn
		  If Not Rs7.EOF Then
		  City1= Rs7("city")
		  startdate1= Rs7("startdate")
     	  enddate1= Rs7("enddate")
	   	End If
		Rs7.close
	  End If
	  
		
If rqfromdate <> "" Then 
		
		strQuery1 = "select f.* from ITIL_course c,ITIL_feedbacks f,ITIL_enrolledusers u where c.courseid = f.Course_ID and c.startdate between '"&rqfrom &"' and '"&rqto&"' and u.id = f.Enroll_ID and c.country='"&rqCountry&"' "
		'Response.write(strQuery1)		
		Rs1.Open strQuery1,Conn
		If Not Rs1.EOF Then
		arrQueries = Rs1.getRows
		enrollnumRows = Ubound(arrQueries,2)  
		enrollfirstRow = 0
		enrolllastRow = enrollnumRows
		End IF 
		Rs1.close
End If		

'If rqfacultyid <> "" Then 	
	
If rqfacultyid <> "" Then 
'Query to retrive faculty name
		strQuery5 = "select firstname,lastname from ITIL_instructor where instid ='"&rqfacultyid&"'"
	    'Response.write(strQuery5)
		Rs5.Open strQuery5,Conn
		
		If Not Rs5.EOF Then
		
		rqfirstname = Rs5("firstname") 
		rqlastname = Rs5("lastname")  
		End If		
		'Concatinating First and last name for the instructor ,to retrive values from ps_course 
		rqname =  rqfirstname & " " & rqlastname
	Session("rqname") =rqname 
		
		strQuery1 = "select f.* from ITIL_course c,ITIL_feedbacks f,ITIL_enrolledusers u where c.courseid = f.Course_ID and c.startdate between '"&Reporfrom&"' and '"&reportto&"' and u.id = f.Enroll_ID and c.instructor = '"&rqname&"'"
		'Response.write(strQuery1)   
		Rs1.Open strQuery1,Conn
		If Not Rs1.EOF Then
		arrQueries = Rs1.getRows
		enrollnumRows = Ubound(arrQueries,2)  
		enrollfirstRow = 0
		enrolllastRow = enrollnumRows
		End IF 
		Rs1.close
		
End If
		

%>  <body><div id="htMap">
<table border="1" height="550" cellspacing="0" class="dbborder" width="1000px" >
    <tr>
      <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300">
          <% =Session("country") %>
          </span> ITILstudy Back Office</font></div></td>
    </tr>
	<p class="Error"><%=message%></p>
    <tr>
      <td width="100px" valign="top" rowspan="22"><!--#include file="leftMenu.html"-->
      </td>
	 <td valign="top" >
	 <table border="0" cellpadding="0">
	  <tr>
	  <td valign="top"> 
				<table width="300" height="80" border="0" cellpadding="8" cellspacing="0" bordercolor="#00B0EC"  class="dbborder" >
				<tr>
				<td colspan="2" bgcolor="#00B0EC" align="center"><span class="HeaderLarge">FeedBack Report Based on Dates</span></td>
				</tr>
				<form id="form1" name="form1" method="post" action="feedback-Report.asp?" onSubmit="return validate_form(this)">				  
				
				<tr>
				<td class="zpCalSubheader">From Date:</td>
				<td><input autocomplete="off" name="fromdate" readonly id="from_Date" type="text" value="<% =rqfromdate %>" >
				<input value=" ... " id="button8a" class="buttonc" type="reset"></td>
				</tr>
				<tr>
				<td  class="zpCalSubheader">To Date:</td>
				<td><input autocomplete="off" name="todate" readonly id="to_Date" type="text" value="<% =rqtodate %>" >
				<input value=" ... " id="button8b" class="buttonc" type="reset"></td>
				</tr>
				<tr class="rowEven">
				<td class="btext">Country:</td>
				<td class="btext">
				<select name="countryOrigin"> 
				<option value="">--Select--</option>
				<% If IsArray(arrAllQueries) Then
				For RowCounter = FirstRow to LastRow %>
				<option <% If rqCountry = arrAllQueries(0,RowCounter) Then %> selected="selected" <% End If %> value="<% = arrAllQueries(0,RowCounter) %>" >
				<% = arrAllQueries(0,RowCounter) %>
				</option>
				<% Next
				End If %>
				</select>                    
				</td>
				</tr>
				<tr class="rowEven">
				<td>&nbsp;</td><td><input name="Submit" type="Submit"  value="Submit" class="buttonc"/></td>
				</tr>
				</form> 
				
				</table>
	   </td>
		
	     <td valign="top"> 
					<table width="300" height="80" border="0" cellpadding="8" cellspacing="0" bordercolor="#00B0EC"  class="dbborder" >
				<tr>
				<td colspan="2" bgcolor="#00B0EC" align="center"><span class="HeaderLarge">FeedBack Report Based on Faculty</span></td>
				</tr>
				<form id="form1" name="form1" method="post" action="feedback-Report.asp" onSubmit="return validate_form(this)">				  
				
				<tr>
				<td class="zpCalSubheader">From Date:</td>
				<td><input autocomplete="off" name="fromdateReport" readonly id="from-Date" type="text" value="<% =rqfromReport %>">
				<input value=" ... " id="button8aa" class="buttonc" type="reset"></td>
				</tr>
				<tr>
				<td  class="zpCalSubheader">To Date:</td>
				<td><input autocomplete="off" name="todateReport" readonly id="to-Date" type="text" value="<% =rqtoReport %>" >
				<input value=" ... " id="button8bb" class="buttonc" type="reset"></td>
				</tr>
				<tr class="rowEven">
				<td class="btext">Faculty:</td>
				
				<td class="btext">
				<select select name="facultyId" id="faculty"  style="width:143px;"> 
				<option value="">--Select--</option>
				<% If IsArray(arrInstructors) Then
				For RowInstructors = FirstInstructors to LastInstructors
				facultyid = arrInstructors(0,RowInstructors) 
			
				 %>
				<option <% If Int(rqfacultyid) = Int(facultyid) Then %> selected="selected" <% End If %>  value="<% = facultyid %>" >
			<% = arrInstructors(1,RowInstructors) %>&nbsp;<% = arrInstructors(2,RowInstructors) %>
				</option>
				<% Next
				End If %>
				</select>                    
				</td>
				</tr>
				<tr class="rowEven">
				<td>&nbsp;</td><td><input name="Submit" type="Submit"  value="Submit" class="buttonc"/></td>
				</tr>
				</form> 
				</table>
	   </td>
	     <td valign="top"> 
					<table width="300" height="80" border="0" cellpadding="8" cellspacing="0" bordercolor="#00B0EC"  class="dbborder" >
				<tr>
				<td colspan="2" bgcolor="#00B0EC" align="center"><span class="HeaderLarge">FeedBack Report Based on Course</span></td>
				</tr>
				<form id="form2" name="form2" method="post" action="feedback-Report.asp">	
				<tr>
				<td colspan="2" align="center"><b>Select the Course:</b></td><tr>
				<tr><td colspan="2"><select name="CourseId" id="CourseId" style="width:350px">
             <option value="">-- Select --</option>
             <% If IsArray(arrAllRecords) Then
          		 For rowRecords = firstRecords to allNumRecords 
				courseId = arrAllRecords(0,rowRecords)
		  %>
	
 				<option <% If Int(rqCourseId) = Int(arrAllRecords(0,rowRecords)) Then %> selected="selected" <% End If %> value="<% = arrAllRecords(0,rowRecords) %>"><% = arrAllRecords(1,rowRecords) %> - <% = FormatDateTime(arrAllRecords(2,rowRecords),1) %>&nbsp;to&nbsp;<% = FormatDateTime(arrAllRecords(3,rowRecords),1) %></option>
                <% Next %>
          		<% End If %>
 				</select>
				</td>
				</tr>
				<tr class="rowEven">
				<td align="center" colspan="2"><input name="Submit" type="Submit"  value="Submit" class="buttonc"/></td>
				</tr>
				</form> 
				</table>
	            </td>
	            </tr>
		        <% 
                If IsArray(arrQueries) Then
                For enrollrowcounter = enrollfirstRow TO enrolllastRow	%>
				<%
				If arrQueries(5,enrollrowcounter) ="Y" then 
				From_Friend  = From_Friend + 1 			 
				End If
				If arrQueries(6,enrollrowcounter) ="Y" then 
				PMI_Website  = PMI_Website + 1 			 
				End If
				If arrQueries(7,enrollrowcounter) ="Y" then 
				From_Internet  = From_Internet + 1 			 
				End If
				If arrQueries(8,enrollrowcounter) ="Y" then 
				From_Magzines  = From_Magzines + 1 			 
				End If
				
				
				If arrQueries(11,enrollrowcounter) ="Y" then 
				Course_Quality  = Course_Quality + 1 			 
				End If
				If arrQueries(12,enrollrowcounter) ="Y" then 
				Faculty_Quality  = Faculty_Quality + 1 			 
				End If
				If arrQueries(13,enrollrowcounter) ="Y" then 
				Price  = Price + 1 			 
				End If
				If arrQueries(14,enrollrowcounter) ="Y" then 
				Moneyback_Guarantee  = Moneyback_Guarantee + 1 			 
				End If
				If arrQueries(15,enrollrowcounter) ="Y" then 
				Pass_Rate = Pass_Rate + 1 			 
				End If
				If arrQueries(16,enrollrowcounter) ="Y" then 
				Location_Proximity  = Location_Proximity+ 1 			 
				End If
				If arrQueries(39,enrollrowcounter) ="Y" then 
				Free_SixSigma  = Free_SixSigma + 1 			 
				End If
				
				If arrQueries(17,enrollrowcounter) ="Yes" then 
				Reimbursementy  = Reimbursementy + 1 	
				ElseIf arrQueries(17,enrollrowcounter) ="No" then 
				ReimbursementN  = ReimbursementN + 1 			 
				ElseIf arrQueries(17,enrollrowcounter) ="NA" then  
				ReimbursementNa  = ReimbursementNa + 1 			 
				End If
				
				TotalCount = TotalCount + 1
				session("TotalCount")= TotalCount
							
				Course_Material = Course_Material + arrQueries(19,enrollrowcounter)
				avgCourseMaterial = Round(Course_Material / TotalCount,2)
				
				Teacher_Meth = Teacher_Meth + arrQueries(20,enrollrowcounter)
				avgTeacherMeth = Round(Teacher_Meth / TotalCount,2)
				
				Instructor = Instructor + arrQueries(21,enrollrowcounter)
				AvgInstructor = Round(Instructor / TotalCount,2)
				
				OverallProgram = OverallProgram +arrQueries(22,enrollrowcounter)
				avgOverallProgram = Round(OverallProgram / TotalCount,2)
				
				Rating = Rating + arrQueries(23,enrollrowcounter)	
				AverageRating = Round(Rating / TotalCount,2) 
				'Session("AverageRating")	=  AverageRating
				If arrQueries(26,enrollrowcounter) ="Yes" Then
				Recommended_to_Othersy = Recommended_to_Othersy +1
				ElseIf arrQueries(26,enrollrowcounter) ="No" then
				Recommended_to_OthersN =Recommended_to_OthersN + 1
				End If 
				strCompitetors = arrQueries(10,enrollrowcounter)
				strCompitetors1 = strCompitetors & ","
		        strCompitetors2 = strCompitetors2 + strCompitetors1
				
				%>
			 			 
		 <% Next
		 End If%>

 <% If rqfromdate <>"" Or rqfromReport <>""  or rqType <>"" or rqCourseId <> "" Then 
 
body ="<table width=""600px"" style=""margin:5px; border:0px solid #ccc;border-collapse:collapse;"" cellspacing=""0"" cellpadding=""10""><tr><td style=""border:solid 1px ;background:#f2f2f2;"">Course</td><td style=""border:solid 1px;background:#f2f2f2;"">ITIL Class</td><td style=""border:solid 1px;background:#f2f2f2;""></td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;"">No Of students</td><td style=""border:solid 1px;background:#f2f2f2;"">"& TotalCount &"</td><td style=""border:solid 1px;background:#f2f2f2;""></td></tr>"
	 If rqfromdate <>"" Then
body= body &"<tr><td style=""border:solid 1px;background:#f2f2f2;"">Dates </td><td style=""border:solid 1px;background:#f2f2f2;"">"& rqfromdate &" to "& rqtodate &"</td><td style=""border:solid 1px;background:#f2f2f2;""></td></tr>"
	End If
	If rqname <> "" Then
body= body &"<tr><td style=""border:solid 1px;background:#f2f2f2;"">Dates </td><td style=""border:solid 1px;background:#f2f2f2;"">"&rqfromReport&" to "&rqtoReport&"</td><td style=""border:solid 1px;background:#f2f2f2;""></td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;"">Instructor</td><td style=""border:solid 1px;background:#f2f2f2;"">"& rqname &"</td><td style=""border:solid 1px;background:#f2f2f2;""></td></tr>"
    End If
body= body &"<tr><td style=""border:solid 1px;background:#f2f2f2;""><b>Question</b></td><td style=""border:solid 1px;background:#f2f2f2;""><b>How did you hear about ITILstudy</b></td><td style=""border:solid 1px;background:#f2f2f2;""><b>No. of Delegates</b></td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">From a friend/colleague</td><td style=""border:solid 1px;background:#f2f2f2;"">"&From_Friend&"</td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">APMG website </td><td style=""border:solid 1px;background:#f2f2f2;"">"&PMI_Website&"</td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">Internet Search</td><td style=""border:solid 1px;background:#f2f2f2;"">"&From_Internet&"</td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">Magazines</td><td style=""border:solid 1px;background:#f2f2f2;"">"&From_Magzines&"</td></tr>"

body= body &"<tr><td style=""border:solid 1px;background:#f2f2f2;""><b>Question</b></td><td style=""border:solid 1px;background:#f2f2f2;""><b>3 most important factors for considering ITILstudy? </b></td><td style=""border:solid 1px;background:#f2f2f2;""></td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">Course quality</td><td style=""border:solid 1px;background:#f2f2f2;"">"&Course_Quality&"</td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">Faculty quality </td><td style=""border:solid 1px;background:#f2f2f2;"">"& Faculty_Quality&"</td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">Price</td><td style=""border:solid 1px;background:#f2f2f2;"">"& Price&"</td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">Money-back guarantee</td><td style=""border:solid 1px;background:#f2f2f2;"">"& Moneyback_Guarantee&"</td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">Pass rate </td><td style=""border:solid 1px;background:#f2f2f2;"">"& Pass_Rate&"</td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">Location proximity</td><td style=""border:solid 1px;background:#f2f2f2;"">"& Location_Proximity&"</td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">Free Six Sigma</td><td style=""border:solid 1px;background:#f2f2f2;"">"& Free_SixSigma&"</td></tr>"

body= body &"<tr><td style=""border:solid 1px;background:#f2f2f2;""><b>Question</b></td><td style=""border:solid 1px;background:#f2f2f2;""><b>Company reimbursement available for the course</b></td><td style=""border:solid 1px;background:#f2f2f2;""></td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">Yes</td><td style=""border:solid 1px;background:#f2f2f2;"">"& Reimbursementy &"</td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">No</td><td style=""border:solid 1px;background:#f2f2f2;"">"& ReimbursementN &"</td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">NA</td><td style=""border:solid 1px;background:#f2f2f2;"">"& ReimbursementNa &"</td></tr>"

body= body &"<tr><td style=""border:solid 1px;background:#f2f2f2;""><b>Question</b></td><td style=""border:solid 1px;background:#f2f2f2;""><b>Important Factors Considered</b></td><td style=""border:solid 1px;background:#f2f2f2;""></td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">Rating for course material</td><td style=""border:solid 1px;background:#f2f2f2;"">"& avgCourseMaterial&"</td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">Rating for teaching methodology</td><td style=""border:solid 1px;background:#f2f2f2;"">"&avgTeacherMeth &"</td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">Rating for the instructor</td><td style=""border:solid 1px;background:#f2f2f2;"">"& AvgInstructor &"</td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">Rating for the overall programme</td><td style=""border:solid 1px;background:#f2f2f2;"">"&avgOverallProgram &"</td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">Average Rating</td><td style=""border:solid 1px;background:#f2f2f2;"">"& AverageRating &"</td></tr>"	

body= body &"<tr><td style=""border:solid 1px;background:#f2f2f2;"">Question</td><td style=""border:solid 1px;background:#f2f2f2;""><b>Recommend ITILstudy to others?</b></td><td style=""border:solid 1px;background:#f2f2f2;""></td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">Yes</td><td style=""border:solid 1px;background:#f2f2f2;"">"&Recommended_to_Othersy &"</td></tr><tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">No</td><td style=""border:solid 1px;background:#f2f2f2;"">"& Recommended_to_OthersN &"</td></tr>"

body= body &"<tr><td style=""border:solid 1px;background:#f2f2f2;""><b>Question</b></td><td style=""border:solid 1px;background:#f2f2f2;""><b>Count of each Other PMP training course providers</b></td><td style=""border:solid 1px;background:#f2f2f2;""></td></tr>"

     	If IsArray(arrAllproviders) Then
		For providersRowCounter = providersFirstRow to providersLastRow 
		ArrayRecords = arrAllproviders(1,providersRowCounter) 
		ArrayRecords1 = ArrayRecords&","
		ArrayRecords2 = ArrayRecords2 + ArrayRecords1
		Next
		End If
		MyArray = Split(ArrayRecords2,",")
		'getting array values from ps_feedback table
		strArray = Split(strCompitetors2,",")
	
		Dim No()
		ReDim No(providersRowCounter)
		For l = 0 To Ubound(MyArray)-1
		For k = 0 To Ubound(strArray)-1 
		Select Case MyArray(l)
		Case MyArray(l)
		'comparing two array values
		If MyArray(l) = Trim(strArray(k)) Then
		'if word from array are equal add the count to the variable
		No(l) = No(l) + 1
		End If
		End Select
		Next
		'Response.write(Int(No(l)))
body= body &" <tr><td style=""border:solid 1px;background:#f2f2f2;""></td><td style=""border:solid 1px;background:#f2f2f2;"">"& MyArray(l) &"</td><td style=""border:solid 1px;background:#f2f2f2;"">"&Int(No(l))&"</td></tr>"
		Next 
		body= body &"</table>"
	
	'Response.write(body)
If rqType = "preview" then	
'Retrive The EnrollUserId,subject and body from this Page'

    body    = Request.form("QueryReply")
   'rqSendEmail = Request.Form("emailid")  	
	rqSendEmail = Request.Form("mailids")
   Session("rqSubject") = Request.Form("Subject")

End If


%>

<%
if rqType = "sendmail" Then

   Dim objCDOMail
   Dim rqBody
   Dim rqSubject
   Dim rqSendEmail

'Retrive The enrolluserid from this page'  

    rqBody    =  Request.Form("body")       
    rqSendEmail = Request.Form("mailids")
    rqSubject = Request.Form("Subject")


    Set objCDOMail = Server.CreateObject("CDONTS.NewMail")

	objCDOMail.From = "marketing@itilstudy.com"

	objCDOMail.To =  rqSendEmail
	
	'If Session("country") is India then cc send to salesindia@pmstudy.com otherwise send to marketing@pmstudy.com'
	
	'objCDOMail.Cc = "marketing@itilstudy.com"
	
	'objCDOMail.Bcc = "t_satpathy@yahoo.com" 
	
	'Importance of the e-mail (0=Low, 1=Normal, 2=High)
	
	objCDOMail.Importance = 2
	
	objCDOMail.Subject = rqSubject

	objCDOMail.BodyFormat = 0

	objCDOMail.MailFormat = 0

	objCDOMail.Body = rqBody

	objCDOMail.Send

	Set objCDOMail = Nothing
'	
	
     Session("message")=("Successfully send mail")
	Response.redirect("feedback-Report.asp")
    
	
Else
%>
 <table width="700" height="580" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#00B0EC">
    <tr>
      <td width="547" valign="top"><table width="100%" cellspacing="0" cellpadding="2">
          <form id="form1" name="form1" method="post" action="feedback-Report.asp?type=preview#display">            
            <tr>
              <td colspan="2" bgcolor="#00B0EC">Send Exam Result </td>
            </tr>
            <tr class="rowEven">
              <td width="28%">To : </td>
              <td width="72%"><input type="text" name="mailids" size="50px" value="<% =rqSendEmail %>"/></td>
            </tr>
            <tr class="rowOdd">
              <td>Subject : </td>			  
               <td width="72%">
			   
			    <% If rqfromdate  <>"" Then 
				subject1 = rqfromdate&" to "& rqtodate
				%>	
			    <input type="text" name="Subject" size="50px" value="<%= subject1 %>"/>
			    <% ElseIf rqfromReport <>"" Then 
				subject2 = rqfromReport &" to "&rqtoReport 
				%>
			    <input type="text" name="Subject" size="50px" value="<%= subject2 %>"/>
			    <% ElseIf rqCourseId <> "" Then 
				subject3 = City1&" - "&startdate1&" to "& enddate1
				%>
			    <input type="text" name="Subject" size="50px" value="<%= subject3 %>"/>
				<% Else%>
				<% rqsubject = Request.Form("Subject")%>
				<input type="text" name="Subject" size="50px" value="<%= rqsubject %>"/>
				<% End If %>
			   </td>
            </tr>
            <tr class="rowEven">
              <td colspan="2"><textarea name="QueryReply" cols="90" rows="25"><%= body%></textarea>
              </td>
            </tr>
            <tr class="rowEven">
              <td>&nbsp;</td>
              <td></td>
            </tr>
            <tr class="rowOdd">
              <td colspan="2" align="center"><input name="Submit" type="submit" class="buttonc" value="Preview" /></td>
            </tr>
          </form>
          <form  method="post" action="feedback-Report.asp?type=sendmail">
          	    <input type="hidden" name="body" value='<%= body %>' />
            <input type="hidden" name="Subject" value="<%= rqSubject %>" />
			<input type="hidden" name="mailids" value="<%= rqSendEmail %>" />
			
            <tr class="rowEven">
              <td colspan="2">&nbsp;</td>
            </tr>
            <tr class="rowEven">
			
              <td colspan="2" bgcolor="#00B0EC">Send Mail </td>
            </tr>
            <tr class="rowEven">
              <td>&nbsp;</td>
              <td></td>
            </tr>
            <tr class="rowOdd">	
              <td colspan="2" align="center"><input type="submit" class="buttonc" name="sendmail" value="Send Mail" />
              </td>
            </tr>
        
          <tr class="rowEven">
            <td colspan="2">&nbsp;</td>
          </tr>
        </table></td>
    </tr>

    <% If rqType = "preview" Then 
	     body        = Request.form("QueryReply")
         rqSubject   = Request.form("Subject")
         rqSendEmail = Request.form("mailids")
%>
    <tr>
      <td colspan="3"><a name="display"></a><%
	  Response.write( "<b>To: </b>"& rqSendEmail & "<br/><br/>")
	  Response.write("<b>subject: </b>"& rqSubject & "<br/><br/>")
	  Response.write(body)%></td>
    </tr>
    <% End If 
	 End If%>
  </table>

<%End If%>
		</table>
		</td></tr>
		</tr>
		
</table>

  <script type="text/javascript">
        <!-- to hide script contents from old browsers
      var startDate;
      var endDate;

      function resetDates() {
       startDate = endDate = null;
      }

      function filterDates1(cal) {
       startDate = new Date(cal.date)
       startDate.setHours(0,0,0,0) // used for compares without TIME
       /* If they haven't chosen an
       end date before we'll set it to the same date as the start date This
       way if the user scrolls in the start date 5 months forward, they don't
       need to do it again for the end date.
       */

       if (endDate == null) {
        Zapatec.Calendar.setup({
         inputField     :    "to_Date",
         button         :    "button8b",  // What will trigger the popup of the calendar
         ifFormat       :    "%b %d, %Y",
         date           :     cal.date,
         showsTime      :     false,          //no time
         //dateStatusFunc  :    disallowDateBefore, //the function to call
         onUpdate       :    filterDates2
        });
       }
      }

      function filterDates2(cal) {
       var date = cal.date;
       endDate = new Date(cal.date)
       endDate.setHours(0,0,0,0) // used for compares without TIME
      }

      // end hiding contents from old browsers  -->
     </script>

      <script type="text/javascript">
      var cal = new Zapatec.Calendar.setup({

             inputField     :    "from_Date",   // id of the input field
             button         :    "button8a",  // What will trigger the popup of the calendar
             ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
             showsTime      :     false,          //no time
             onUpdate       :    filterDates1

      });

          Zapatec.Calendar.setup({
             inputField     :    "to_Date",
             button         :    "button8b",  // What will trigger the popup of the calendar
             ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
             showsTime      :     false,          //no time
             onUpdate       :    filterDates2
          });
    
     </script>
     
      <script type="text/javascript">
        <!-- to hide script contents from old browsers
      var startDate1;
      var endDate1;

      function resetDates() {
       startDate1 = endDate1 = null;
      }

      function filterDates1(cal) {
       startDate1 = new Date(cal.date)
       startDate1.setHours(0,0,0,0) // used for compares without TIME
       /* If they haven't chosen an
       end date before we'll set it to the same date as the start date This
       way if the user scrolls in the start date 5 months forward, they don't
       need to do it again for the end date.
       */

       if (endDate1 == null) {
        Zapatec.Calendar.setup({
         inputField     :    "to-Date",
         button         :    "button8bb",  // What will trigger the popup of the calendar
         ifFormat       :    "%b %d, %Y",
         date           :     cal.date,
         showsTime      :     false,          //no time
         //dateStatusFunc  :    disallowDateBefore, //the function to call
         onUpdate       :    filterDates2
        });
       }
      }

      function filterDates2(cal) {
       var date = cal.date;
       endDate1 = new Date(cal.date)
       endDate1.setHours(0,0,0,0) // used for compares without TIME
      }

      // end hiding contents from old browsers  -->
     </script>

      <script type="text/javascript">
      var cal = new Zapatec.Calendar.setup({

             inputField     :    "from-Date",   // id of the input field
             button         :    "button8aa",  // What will trigger the popup of the calendar
             ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
             showsTime      :     false,          //no time
             onUpdate       :    filterDates1

      });

          Zapatec.Calendar.setup({
             inputField     :    "to-Date",
             button         :    "button8bb",  // What will trigger the popup of the calendar
             ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
             showsTime      :     false,          //no time
             onUpdate       :    filterDates2
          });
    
     </script>
</html>

    <%End If%>