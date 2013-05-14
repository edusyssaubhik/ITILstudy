
<% 
   If Session("UserId")  = "" Then
    Response.Redirect("login.asp")
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
		if (validate_required(facultyId,"select faculty Required")==false)
			  {facultyId.focus();return false}	
        if (validate_required(fromdate,"Start Date Required")==false)
			  {fromdate.focus();return false}			  
        if (validate_required(todate,"End date Required")==false)
			  {todate.focus();return false}
			  
	}
}
function Form_Validator1(theform)
 {
 with (theform)
    {	  
	    if (validate_required(fromdateReport,"start date Required")==false)
			  {fromdateReport.focus();return false}
	    if (validate_required(todateReport,"End date Required")==false)
			  {todateReport.focus();return false}
	}
	
}	
		
			
function Form_Validator2(theform)
 {
 with (theform)
    {			  
		if (validate_required(froMonth,"Date Required")==false)
			  {froMonth.focus();return false}
    }

}

</script>
 
 <%
 Dim objRs1,strQuery,enrollfirstRow,enrolllastRow,enrollnumRows,arrAllQueries,facultyRowCounter,facultyid
 Dim rqfacultyid,rqfromdate,rqtodate,strQuery1,rqfrom,rqto,rqlastname ,rqfirstname , rqname
 Dim objRs2 ,strQuery2,RowCounter,arrAllrecords,firstrow,lastrow
 Dim  SumRating, Counter,averageRating,lenOfInvoice
 Dim objRs1date,strQuerydate, datefirstRow,datelastRow,arrdateQueries,dateRowCounter
 Dim rqfromReport, Reporfrom,rqtoReport, reportto
 Dim rqfromMonth,rqMaxDate,objRs1Month,arrAllMonth,monthCounter,firstMonth,lastMonth,strQueryMonth
 Dim Date1,mont,yer,i, rqSubmit


 
 'Creating Record set 
SET objRs1       = Server.CreateObject("ADODB.Recordset")
SET Rs           = Server.CreateObject("ADODB.Recordset")
SET objRs2       = Server.CreateObject("ADODB.Recordset")
SET objRs1date   = Server.CreateObject("ADODB.Recordset")
SET objRs1Month  = Server.CreateObject("ADODB.Recordset")

'Retiving the values from the Form for faculty wise Report
 rqfromdate      =  Request.Form("fromdate") 
 rqfrom          =  FormatDatetime(rqfromdate)
 rqtodate        =  Request.Form("todate")
 rqto            =  FormatDatetime(rqtodate) 
 rqSubmit        = Request.Form("submit")

'Retiving the values from the Form for faculty Date wise Report
 rqfromReport    =  Request.Form("fromdateReport")
 Reporfrom       =  FormatDatetime(rqfromReport)
 rqtoReport      =  Request.Form("todateReport")
 reportto        =  FormatDatetime( rqtoReport )


'Retiving the values from the Form for faculty monthly wise Report 
rqfromMonth = Request.Form("froMonth")
If  Not IsNull(rqfromMonth) Then            
Date1 = Split(rqfromMonth,"/",2)
 For i = 0 to UBound(Date1)
   mont = int(Trim(Date1(0)))
   yer  = int(Trim(Date1(1)))
 Next   
   Session("mont") = mont 
   Session("yer")  = yer 
End If

'retiving facultyid from the Form 
If Request.Form("facultyid") <> "" then
	rqfacultyid = Request.Form("facultyid")
Else 
	rqfacultyid = Request.Querystring("facultyid")
End If



 'query to retrive instructor details
   strQuery = "SELECT instid,firstname,lastname FROM ITIL_instructor WHERE country = '"& session("country") &"'"
   objRs1.Open strQuery,Conn

   If Not objRs1.EOF Then
      arrAllQueries = objRs1.getrows
      facultyRowCounter = Ubound(arrAllQueries,2)
      enrollfirstRow = 0
      enrolllastRow  = facultyRowCounter
   End If
   
If rqfacultyid <> "" Then 
'Query to retrive faculty name
 strQuery1 = "select firstname,lastname from ITIL_instructor where instid = '"&rqfacultyid&"' "
   Rs.Open strQuery1,Conn
   
  If Not Rs.EOF Then
  rqfirstname = Rs("firstname") 
  rqlastname = Rs("lastname")  
 End If
 
 'Concatinating First and last name for the instructor ,to retrive values from ps_course 
 rqname =  rqfirstname & " " & rqlastname

'query to retrive city,fromdate ,to date and rating 
   strQuery2 = "SELECT c.courseid,c.city,c.startdate,c.enddate,c.instructor,avg(f.Rating_instructor) FROM ITIL_course c,ITIL_feedbacks f WHERE c.courseid = f.Course_ID and c.instructor ='"&rqname&"' and c.startdate between '"& rqfrom  &"' and '"&rqto&"' and f.Rating_instructor <> '0' group by c.courseid,c.city,c.startdate,c.enddate,c.instructor"
 'Response.write(strQuery2)  
  objRs2.Open strQuery2,Conn

   If Not objRs2.EOF Then
      arrAllrecords = objRs2.getrows
      RowCounter = Ubound(arrAllrecords,2)	    
     firstRow = 0
     lastRow = RowCounter
	'lenOfInvoice = firstRow 	 
   End If
 
 End IF  
 


'Query TO Retrive Faculty Date  Wise Report'  
If rqfromReport <> "" Then
 strQuerydate = "Select c.courseid, c.City,c.startdate,enddate,c.instructor,avg(f.Rating_Instructor) FROM ITIL_course c,ITIL_feedbacks f WHERE c.courseid = f.Course_ID and c.startdate between '"& Reporfrom &"' and  '"&reportto&"' and f.Rating_instructor <> '0' group by c.courseId,c.instructor,c.City,c.startdate,c.enddate"
'Response.write(strQuerydate)
   objRs1date.Open strQuerydate,Conn

   If Not objRs1date.EOF Then
      arrdateQueries = objRs1date.getrows
      dateRowCounter = Ubound(arrdateQueries,2)
      datefirstRow = 0
      datelastRow  = dateRowCounter
   End If
End If

'Query TO Retrive Faculty Monthly Wise Report'
If rqfromMonth <> "" Then 
strQueryMonth = "Select c.instructor,avg(f.Rating_instructor) FROM ITIL_course c,ITIL_feedbacks f WHERE c.courseid = f.Course_ID and (CONVERT(varchar(2), DATEPART(month,c.startdate)) = '"& mont &"'  AND DATEPART(yyyy,c.startdate) = '"& yer &"') group by (c.instructor)"

   objRs1Month.Open strQueryMonth,Conn
   If Not objRs1Month.EOF Then
      arrAllMonth = objRs1Month.getrows
      monthCounter = Ubound(arrAllMonth,2)
      firstMonth = 0
      lastMonth  = monthCounter
   End If

End If
 %>
 
  <body><div id="htMap">
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
   <td height="25"><a href="feedback-form.asp" target="_blank">Add Feedback</a></td>
 </tr>
  <tr>  
  <td>
  <table><tr><td>
 <!--Faculty Wise Report Table--> 
   <form name="course" action="facultyReport.asp" method="post" onSubmit="return Form_Validator(this)">
  <table border="0" cellpadding="8" cellspacing="0" class="dbborder" height="250">

  <tr><td colspan="2" class="title"> Faculty Report</td></tr>
  <tr><td >Faculty:</td> 
     <td><select name="facultyId" id="faculty"  style="width:143px;">
	                <option value="">--Select--</option>
                     <% If IsArray(arrAllQueries) Then
	                    For facultyRowCounter = enrollfirstRow to enrolllastRow
						facultyid = arrAllQueries(0,facultyRowCounter) 
						
						 %>
                    <option value="<% = facultyid %>"><% = arrAllQueries(1,facultyRowCounter) %>&nbsp;<% = arrAllQueries(2,facultyRowCounter) %></option>
   	                 <% Next
	                    End If %>
	     </select>
       </td> 
  </tr>
  <tr><td class="zpCalSubheader">From Date:</td><td><input autocomplete="off" name="fromdate" readonly id="from_Date" type="text">
     <input value=" ... " id="button8a" class="buttonc" type="reset"></td></tr>
  <tr><td  class="zpCalSubheader">To Date:</td><td><input autocomplete="off" name="todate" readonly id="to_Date" type="text">
     <input value=" ... " id="button8b" class="buttonc" type="reset"></td></tr>
  <tr><td>&nbsp;</td><td><input type="submit" name="submit" id="submit" value="Submit"/></td></tr>   
  </table>
  </form>
</td>
<td>
<!-- Date Wise Report-->  
   <form name="date-Report" action="facultyReport.asp" method="post" onSubmit="return Form_Validator1(this)" >
  <table border="0" align="center" cellpadding="8" cellspacing="0" class="dbborder" height="250"> 

  <tr><td colspan="2" class="title"> Date Report</td></tr>
   <tr><td class="zpCalSubheader">From Date:</td><td><input autocomplete="off" name="fromdateReport" readonly id="from-Date" type="text">
     <input value=" ... " id="button8aa" class="buttonc" type="reset"></td></tr>
  <tr><td  class="zpCalSubheader">To Date:</td><td><input autocomplete="off" name="todateReport" readonly id="to-Date" type="text">
     <input value=" ... " id="button8bb" class="buttonc" type="reset"></td></tr>
  <tr><td>&nbsp;</td><td><input type="submit" name="submit" id="submit" value="Submit"/></td></tr> 
  </table>
  </form>
  </td>
  <td> 
  <!-- Monthly Wise Report -->
  <form name="date-Report" action="facultyReport.asp" method="post" onSubmit="return Form_Validator2(this)" >
  <table border="0" align="center" cellpadding="8" cellspacing="0" class="dbborder" height="250">

  <tr><td colspan="2" class="title"> Monthly Wise Report </td></tr>
   <tr><td>Date:</td><td><input type="text" name="froMonth"  id="froMonth" > mm/yyyy
    </td></tr>
    <tr><td>&nbsp;</td><td><input type="submit" name="submit" id="submit" value="Submit"/></td></tr> 
  </table>
  </form>
  
  </td>
</tr>
  <tr><td colspan="3" align="center">
  
 <!--- Display faculty wise report ---> 
 <% If RowCounter > "" Then %>
 <table border="0" cellpadding="8" cellspacing="0">
 <tr><td align="center">
  <table border="0" cellpadding="8" cellspacing="0" class="dbborder" >
  <tr><td colspan="2" class="title"> Faculty Report</td></tr>
  <tr><td >Faculty :</td><td><% = rqname %></td> 
  </tr>
  <tr><td>From Date:</td><td><% = rqfrom %></td></tr>
  <tr><td>To Date:</td><td><% = rqto %></td></tr>     
  </table>
  </td></tr>
   <tr><td>
  <table border="1" cellpadding="8" cellspacing="0" class="dbborder">
  <tr class="title"><td >City: &nbsp;From Date &nbsp; To Date</td> <td>Rating</td></tr> 
   <%
   If IsArray(arrAllrecords) Then    
         FOR rowcounter = firstRow TO lastRow
		 'count no of rows
		 Counter  = rowcounter + 1
		 'total rating
		 SumRating =  SumRating + arrAllrecords(5,rowCounter)
		 'Average Rating
		 averageRating =  SumRating/Counter
       %> <tr><td>
       <a href="feedback-form.asp?courseId=<% =arrAllrecords(0,RowCounter)%>&City=<% = arrAllrecords(1,RowCounter) %>" target="_blank">
	    <% = arrAllrecords(1,RowCounter) %> : <% = arrAllrecords(2,RowCounter) %> &nbsp;<% = arrAllrecords(3,RowCounter) %></a>
         </td>           
         <td><% = arrAllrecords(5,rowCounter) %> </td>
  </tr>
 <% Next
 End If %>
  <tr><td>Average</td><td><% = averageRating %> </td></tr>
  </table>
  </td></tr>
  </table>
  <%End If%>
  
  <!--Display Date Wise Report -->
   <% If dateRowCounter > "" Then %>
    <table border="0" cellpadding="8" cellspacing="0">
 <tr><td align="center">
  <table border="0" cellpadding="8" cellspacing="0" class="dbborder" >
 <tr><td colspan="3" class="title"> Date Report</td></tr>
  <tr><td>From Date:</td><td><% = Reporfrom%></td></tr>
  <tr><td>To Date:</td><td><% = reportto %></td></tr>     
  </table>
  </td></tr>
<tr><td>
 <table border="1" cellpadding="8" cellspacing="0" class="dbborder">

    <tr class="title"><td >City: From Date   To Date</td><td>Faculty</td><td>Rating</td></tr>
   
<% If IsArray(arrdateQueries) Then

         FOR dateRowCounter =  datefirstRow TO datelastRow
       %>
        <tr> <td><a href="feedback-form.asp?courseId=<% = arrdateQueries(0,dateRowCounter) %>&City=<% = arrdateQueries(1,dateRowCounter) %>" target="_blank"><% = arrdateQueries(1,dateRowCounter) %> : <% = arrdateQueries(2,dateRowCounter) %> &nbsp;<% = arrdateQueries(3,dateRowCounter) %></a>
          </td>
    <td><% = arrdateQueries(4,dateRowCounter) %></td>                     
 <td><% = arrdateQueries(5,dateRowCounter) %> </td>
 </tr>
 <% Next
End If %>
</table>
</td></tr></table>
<% End If%>

<!-- Display Monthly Wise Report-->
<% If monthCounter > "" Then %>

<table border="0" cellpadding="8" cellspacing="0">
 <tr><td align="center">
  <table border="0" cellpadding="8" cellspacing="0" class="dbborder" >
  <tr><td colspan="2" class="title"> Monthly Report</td></tr>
    <tr><td>To Date:</td><td><% = rqfromMonth%></td></tr>     
  </table>
  </td></tr>
<tr><td>
<table border="1" width="400" align="center" cellpadding="8" cellspacing="0" class="dbborder">
         <tr class="title"><td >Faculty Name</td><td>Average</td></tr>
 <tr> <% If IsArray(arrAllMonth) Then
         FOR monthCounter = firstMonth TO lastMonth
		 
       %><td><% = arrAllMonth(0,monthCounter)%></td>
                        
 <td><% = arrAllMonth(1,monthCounter)%></td>
 </tr>
 <% Next
 End If %>
  </table>
  <%End If%>
  </td></tr></table>
</td></tr>

  </table>
  </td></tr></table>
  
  </div>
  </body>
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
    
     </script></html>
  <% End If%>