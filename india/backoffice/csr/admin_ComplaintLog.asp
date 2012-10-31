<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 '======================================================='
'Written By : savita'
'Last UpDated : 23/09/2010'
'Description :'
' Add/Edit/Delete Course Page and Enrolledusers Page'
'======================================================='

%>
<%
   If Session("UserId") = "" Then
     Response.Redirect("../login.asp")
   Else
%>
<!--#include virtual="/india/connection.asp"-->
<%

'Declare The Variables'

 Dim message
 Dim courseDate
 Dim strQuery,Rs1,Rs2,courseId,rs3,Rs4,Rs5,Rs6
 Dim arrAllRecords,firstRow,lastRow,numRows,rowcounter
 Dim arrAllQueries,rqType,rqPage,rqRow,complrowcounter
 Dim strQuery1,str,str1,i,rqEnrollUsers
 Dim rqEnrollPage,rqEnrollRow,complastRow,compfirstRow,enrollnumRows
 Dim strQuery2,strQuery3,strQuery4,allMailSent,strQuery6
 Dim arrAllCities,cityNumRows,cityFirstRow,cityLastRow,cityRowCounter
 Dim strQuery5,rqcompUserId,maxRevLevel
 Dim instructorFirstRow,instructorLastRow,arrAllInstructors
 Dim rqCourseId,instructorRowCounter,instructorNumRows
 Dim str2,city,CourseStartDate,CourseEndDateAndCity,CourseEndDate
 Dim enrolledUsers,str3,CourseDetails,rqEditCourseId
 Dim Sql7,Rs7, objRs, strsearch
 Dim Inst, rqComplaintNo, closedBy, rqName, complaint_no
 Dim nextPage,lastpage,rqTerm
 Dim lpm1,pagination,counter
 Dim allNumRows,cnt,iPageCurrent,page,prev,ps,rqComplaint_no
'Displaying The Messages After Add,Edit and Delete Course'
 
 message = Session("message")
 Session("message") = ""
 
'Retriving the values'
rqName=request.form("Name")

'Retrive The Types.It Means Tasks'

 rqType =  Request.Querystring("type")

'Retrive The Below Two are Pagination Purpose'

 rqPage =  Request.QueryString("page")
 rqRow  =  Request.QueryString("row")

 rqEnrollPage = Request.Querystring("enrollPage")
 rqEnrollRow = Request.QueryString("enrollRow")

 Set Rs = Server.CreateObject("ADODB.Recordset")
 Set Rs2 = Server.CreateObject("ADODB.Recordset")

 rqEnrollUsers = Request.Querystring("enrollusers")
 response.Write(rqEnrollUsers)
 
rqCourseId = Request.Querystring("CourseId")


'=================================================================================================

	'Retriving country from city table based on country entries will b edisplayed'
	Dim Sql,rec1
	Dim rqMessage
	Dim rqCountryForm,rqCountrySession,rqcountry
	
	rqMessage = Session("message")
	Session("message") = ""
	
	Set rec1  = Server.CreateObject("ADODB.Recordset")
	
	Sql = "select distinct(country) from ITIL_city order by country desc"
	rec1.open Sql,Conn
	
	
	rqCountryForm = Request.Form("country")
	rqCountrySession = Session("country")
	if rqCountryForm <> "" then
		rqcountry = rqCountryForm
	else
		rqcountry = rqCountrySession 
	end if
	
	Session("country") = rqcountry
	
'===========================================================================================================	


'Sql Query For Retrive The course Details'
If rqName <> ""  then 

'For Search option'
set objRs=server.createobject("ADODB.recordset")

strQuery="SELECT complaint_no ,customername, department, complaint, SLA, closedby,createdon from support_complaint where customername like '%"& rqName &"%' AND country = '"& Session("country") &"' order by complaint_no desc"
 
Else


 strQuery = "SELECT complaint_no,customername,department,complaint,SLA,closedby,createdon from support_complaint where country = '"& Session("country") &"' order by complaint_no desc"

End If

 Rs.Open strQuery,Conn

'Retrive All Values From Query And Doeing Pagination'

  If Not Rs.EOF Then
    arrAllRecords = Rs.getrows
    firstRow = 0
    lastRow = 9
    numRows = Ubound(arrAllRecords,2)
    If lastRow > numRows Then
       lastRow = numRows
    End If
 allNumRows = numRows
		
		cnt = 1
		
	  End If

'Pagination code'

If cnt = 1 Then

 If Request.QueryString("page") = "" Then
	
	iPageCurrent = 1
	
	'arrAllRecords = Session("arrAllRecords")	
	numRows = Ubound(arrAllRecords,2)
	
	 firstRow = 0 
	 
	 If numRows > 9 Then
	    lastRow = 9  
	 Else
	 	lastRow = numRows
	 End If 
  Else
	
	'arrAllRecords = Session("arrAllRecords")	
	numRows = Ubound(arrAllRecords,2)
	
	iPageCurrent = Request.QueryString("page") 
    firstRow = ((10 * iPageCurrent)-10) 
     lastRow = firstRow + 9 

    If lastRow > numRows Then
    lastRow = numRows
   End If

    If firstRow < 0 Then
       firstRow = 0
    End If

 End if
 
End If

'Sql Query For Retrive The enrolledusers particular course'

  strQuery2 = "SELECT * FROM support_compans where country = '"& Session("CountryOrigin") &"' order by id asc"

  Rs2.Open strQuery2,Conn

   If Not Rs2.EOF Then

      arrAllQueries = Rs2.getRows
     ' Session("arrAllQueries") = arrAllQueries
      compfirstRow = 0
      complastRow = 3
      enrollnumRows = Ubound(arrAllQueries,2)
      If complastRow > enrollnumRows Then
         complastRow = enrollnumRows
      End IF

 End IF

If rqEnrollPage = "next" Then

   'arrAllQueries = Session("arrAllQueries")
   enrollnumRows = Ubound(arrAllQueries,2)


   compfirstRow = rqEnrollRow + 1
   complastRow = compfirstRow + 3

   If compfirstRow >= enrollnumRows Then
      compfirstRow = rqEnrollRow + 1
      complastRow = compfirstRow + 3
   End If

   If compfirstRow < 0 Then
      compfirstRow = 0
   End If

   If complastRow > enrollnumRows Then
      complastRow = enrollnumRows
   End If

End If

If rqEnrollPage = "previous" Then

   'arrAllQueries = Session("arrAllQueries")
   enrollnumRows = Ubound(arrAllQueries,2)

   complastRow = rqEnrollRow - 1
   compfirstRow = complastRow - 3

   If compfirstRow =< 0 Then
      compfirstRow = 0
      complastRow = compfirstRow + 3
   End If

   If complastRow > enrollnumRows Then
      complastRow = enrollnumRows
   End If

End If

'response.Write(strQuery2)
'response.Write(strQuery)


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Complaint Log</title>
<link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="calendar/zapatec.js"></script>
<script type="text/javascript" src="calendar/calendar.js"></script>
<script type="text/javascript" src="calendar/calendar-en.js"></script>
<link href="calendar/template.css" rel="stylesheet" type="text/css">
<link href="calendar/system.css" rel="stylesheet" type="text/css">
 
</head>
<body>
<div id="htMap">
  <table border="1" width="1000px" class="dbborder"  height="550" cellspacing="0">
    <tr>
     <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% =Session("country") %></span> ITILstudy Back Office</font></div></td>
    </tr>
    <tr>
    
      <td width="100px" valign="top" rowspan="22">
	  <!--#include file="leftMenu.html"-->
      </td>
       <td width="100px" align="right">
       <table border="0" width="100%">
      <tr><td width="25%">
       
      
  <form name="country" action="admin_ComplaintLog.asp" method="post">
  Please select the <b>Country :</b>  
		  <select name="country" >
			<option value="">--Select--</option>
             
			<% do until rec1.EOF 
			   for each i in rec1.Fields %>
			<option value="<% =rec1("country") %>" <% If rqcountry = rec1("country") Then %> selected="selected" <% End If %>><% = rec1("country") %> </option>-->
			<% next
			   rec1.movenext
		       loop %>	
		 </select>
		<input type="submit" value="Submit" class="buttonc" /></form></td>
        </td>
        
        
        <td >      
      <form action="admin_ComplaintLog.asp" method="post">
     
     
			Name 
			  <input type="text" name="Name"/>
			
			  <input type="submit" name="search" value="Search" />			
              </form></td></tr></table>
              
     </td>         
    </tr>
    
    <tr valign="top">
   
      <td width="100%" valign="top"><table  width="1500px" border="1" valign="top" cellspacing="0">
          <tr>
            <td bgcolor="#A7DBFB" align="center"><b>Customer Name</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Department</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Complaint</b></td>
            <!--<td bgcolor="#A7DBFB" align="center"><b>SLA</b></td>-->
            <td bgcolor="#A7DBFB"></td>
            <td bgcolor="#A7DBFB" align="center" width="25%"><b>Comments</b></td>
          </tr>
          <%
          If IsArray(arrAllRecords) Then
          For rowcounter = firstRow TO lastRow
       %>
          <tr>
            <td align="center"><% = arrAllRecords(1,rowcounter) %></td>
            
            <td align="center"><% = arrAllRecords(2,rowcounter) %><br /><%= arrAllRecords(6,rowcounter) %></td>
           
            <td align="center"><% = arrAllRecords(3,rowcounter) %></td>
            <!-- <td align="center"><% 'If Not IsNull(arrAllRecords(4,rowcounter)) Then %>
              <%' = "Sent" %>
              <%' Else %>
              <input type="submit" class="buttonc" value="Send">-->
              <% 'End If %>
            </td>
            <form name="comment" action="addComplaint_Comments.asp" method="post">
              <input type="hidden" name="compId"  value="<% = arrAllRecords(0,rowcounter) %>">
              
              <td width="20%" align="center">
              <Textarea name="Comment" rows="5" cols="25" ></Textarea>
                <br />
                <input type="Submit" class="buttonc" value="Submit" align="middle" name="type">
              </td>
            </form>
            <td>
            
            <iframe src="complaint_Comments.asp?compId=<% = arrAllRecords(0,rowcounter) %>" frameborder="0" height="100" scrolling="yes" width="250"> </iframe>
			<a href="compCommentsHistory.asp?compId=<% = arrAllRecords(0,rowcounter) %>" target="_blank">View History</a>
           <% 
		   
		   closedBy =  arrAllRecords(5,rowcounter)
		   'response.Write(closedBy)
		   
		    %>
            <% If isnull(closedBy)  Then %>
            <form action="addStatus.asp" method="post">
		<input type="hidden" name="complaint_no" value="<% = arrAllRecords(0,rowcounter) %>" />
		<table class="table1" width="60%">
		  <tr>
			<td><b>Status:</b>&nbsp;&nbsp;
				<select name="status">
					<option value="closed">Closed</option>
				</select>
				<input type="submit" name="Close" value="Update" />
			</td>
		  </tr>
		</table>
		</form>
        <% End If %>
            </td>
            
          </tr>
		  <% Next %>
            <tr id="htMap">
              <td colspan="8"><!--#include file="pagination.asp"-->
               <% 
			    'ps = getPaginationString(page, (numRows + 1), 10, 2, "admin_ComplaintLog.asp?type=complaintlog")
				 ps = getPaginationString(page, (numRows + 1), 10, 2, "admin_ComplaintLog.asp?complaint_no="& arrAllRecords(0,numRows)&"")
				  Response.Write(ps)
	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
              </td>
            </tr>
            <tr>
              <td colspan="9"><div align="center"><font face="Arial" size="2" color="orangered"><%=message%></font></div></td>
            </tr>
          </table></td>
      </tr>
      <% End If%>
      <tr>
        <td>&nbsp;</td>
      </tr>
     
  </table>
  </td>
 </tr>
</table>
</div>
<!-- This Script For Calendar -->
<script type="text/javascript">
   			<!--  to hide script contents from old browsers
   			var startDate;
   			var endDate;

   			function resetDates() {
   				startDate = endDate = null;
   			}

   			function filterDates1(cal) {
   				startDate = new Date(cal.date)
   				startDate.setHours(0,0,0,0)	// used for compares without TIME
   				/* If they haven't chosen an
   				end date before we'll set it to the same date as the start date This
   				way if the user scrolls in the start date 5 months forward, they don't
   				need to do it again for the end date.
   				*/

   				if (endDate == null) {
   					Zapatec.Calendar.setup({
   						inputField     :    "checkOut_date",
   						button         :    "button8b",  // What will trigger the popup of the calendar
   						ifFormat       :    "%b %d, %Y",
   						date           :     cal.date,
   						showsTime      :     false,          //no time
   						dateStatusFunc		:    disallowDateBefore, //the function to call
   						onUpdate       :    filterDates2
   					});
   				}
   			}

   			function filterDates2(cal) {
   				var date = cal.date;
   				endDate = new Date(cal.date)
   				endDate.setHours(0,0,0,0)	// used for compares without TIME
   			}

   			/*
   			* This functions return true to disallow a date
   			* and false to allow it.
   			*/


   			/*
   			* Check-Out calendar allowed dates
   			* Check-Out date can not be BEFORE Check-In date
   			* Check-Out date can not be before today
   			*/
   			function disallowDateBefore(dateCheckOut) {
   				dateCheckOut.setHours(0,0,0,0)
   				if ((startDate != null) && startDate > dateCheckOut)
   					// startDate is defined, make sure cal date is NOT before start date
   					return true;

   				var now = new Date()
   				now.setHours(0,0,0,0)
   				if (dateCheckOut < now)
   					// check out date can not be befor today if startDate NOT defined
   					return true;

   				return false;
   			}

   			/*
   			* Check-In date checking
   			* Check-In date can not be AFTER Check-Out date
   			* Check-In date can not be before today
   			*/
   			function disallowDateAfter(dateCheckIn) {
   				dateCheckIn.setHours(0,0,0,0)
   				if ((endDate != null) && dateCheckIn > endDate)
   					// endDate defined, calendar date can NOT be after endDate
   					return true;

   				var now = new Date()
   				now.setHours(0,0,0,0)

   				if (dateCheckIn < now)
   					// endDate NOT defined, calendar date can not be before today
   					return true;

   				return false;
   			}

   			// end hiding contents from old browsers  -->
   		</script>
<script type="text/javascript">
   			var disallowDateAfter
   			var disallowDateBefore
   			var filterDates1
   			var filterDates2
   			var cal = new Zapatec.Calendar.setup({

   	         inputField     :    "checkIn_date",   // id of the input field
   	         button         :    "button8a",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         dateStatusFunc    :    disallowDateAfter, //the function to call
   	         onUpdate       :    filterDates1

   			});

   	      Zapatec.Calendar.setup({
   	         inputField     :    "checkOut_date",
   	         button         :    "button8b",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         dateStatusFunc    :    disallowDateBefore, //the function to call
   	         onUpdate       :    filterDates2
   	      });

   		</script>
</form>
</body>
</html>
<%
 Rs.Close

 
 Conn.Close
 End If
 %>
