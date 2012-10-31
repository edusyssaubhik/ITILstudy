<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Marketing DB</title>
<!--#include virtual="/includes/connection.asp"-->
</head>
<body>

<%

'---------------------------------------------------------------'
'Written By : Praveen'
'Created Date : 27/04/2012'
'Modified By : Praveen'
'Modified Date: 27/04/2012'
'Description :'
'This page is for getting enrollments and payments based on the dates entered' 

'--------------------------------------------------------------'

'Diclaring Variables'

Dim rqFromDate,rqToDate,objRs,objRs1
Dim strQuery,strQuery1
Dim EnrollmentsNum,PaymentsNum,rqCountry

'initiating Record sets' 

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
Set objRs2 = Server.CreateObject("ADODB.Recordset")
Set objRs3 = Server.CreateObject("ADODB.Recordset")


'retriving Values'
rqFromDate = Request.form("FromDate")
rqToDate = Request.Form("ToDate")
rqCountry = Request.Form("Country")

%>
<script type="text/javascript">

function validate_number(field,alerttxt)
  {
  	var iChars = "0123456789";

  	with (field)
  	{
  		for (var i = 0; i < value.length; i++) {
  		  	if (!(iChars.indexOf(value.charAt(i)) != -1)) {
  		  	alert (alerttxt);
  		  	return false;
  		  	}
  		}
  	}
  }
   function validate_noNumber(field,alerttxt)
  {
  	var iChars = "0123456789";

  	with (field)
  	{
  		for (var i = 0; i < value.length; i++) {
  		  	if ((iChars.indexOf(value.charAt(i)) != -1)) {
  		  	alert (alerttxt);
  		  	return false;
  		  	}
  		}
  	}
 }
 function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}
}



function validate_form(thisform)
{

    with (thisform)
    {
     
	   //Check To See If The Details Field Is Balnk     
		
		if (validate_required(FromDate,"Please enter the From Date")==false)
			  {FromDate.focus();return false}
			  
	 //Check To See If The Amount Field Is Balnk     
		
		if (validate_required(ToDate,"Please enter the To Date")==false)
			  {ToDate.focus();return false}
  
			 
		//Check To See If The Company name Field Is Balnk     
		
		if (validate_required(Country,"Please Select Country")==false)
			  {Country.focus();return false}
			  
		
  	}
	 
  
 }


 
  
</script>

<div style="width:auto; border:#666;">
<div align="left" style="padding:10px;">
  <p><b>Enrollments</b></p>
</div>
<div align="left" style="margin-left:20px;">

<div style="margin-left:20px; padding-top:100px;">

<table  border="1" class="table1" width="50%" cellpadding="3" cellspacing="0">
<tr>
<th>Firstname</th>
<th>Lastname</th>
<th>Email</th>
<th>Cousedetails</th>
</tr>



<%
' intiating the counts for grant total'
PaymentsNumGrandtotal = 0
EnrollmentsNumGrandtotal = 0


' Queriy for selecting days in between given values'
 
 
 strQuery2="select Distinct(courseid) FROM ITIL_course WHERE startdate <= '"&Now()&"' AND (country = 'US' OR country = 'Canada') AND Status = 'Available'"
 
 
 
'strQuery2="select Distinct(convert(varchar(10),dateofenrollment,121)) FROM ps_enrolledusers WHERE dateofenrollment BETWEEN '"&rqFromDate&"' AND '"&rqToDate&"' AND country = '"& rqCountry &"'"

objRs2.open strQuery2 ,ConnObj

If Not objRs2.EOF Then

		arrAllRecords2 = objRs2.getrows
		Session("arrAllRecords2") = arrAllRecords2
		EnrollmentsNum2 = Ubound(arrAllRecords2,2)
		
		firstrow = 0
		lastrow = EnrollmentsNum2
End If

'Running loop for retriving values based on day for getting payments and enrollments count'

If IsArray(arrAllRecords2) Then
       
for rowcounter = firstrow to lastrow

' Queriy for selecting enrollments count per each day in the loop'


strQuery3="SELECT firstname, lastname, email, country, dateofenrollment, courseid,coursedetails FROM ITIL_enrolledusers where courseid = '"&arrAllRecords2(0,rowcounter)&"' AND checkreceived = 'Yes' and status = 'Active' And (us_status Is Null OR us_status <> 'Dummy') and (country = 'US' or country = 'Canada')"

objRs3.open strQuery3,ConnObj



' Queriy for selecting payments count per each day in the loop'
%>
 <% SrNo = 1
    Do Until objRs3.EOF %>
    
<tr align="center">
<td><% = objRs3("firstname") %></td>
<td><% = objRs3("lastname")  %></td>
<td><% = objRs3("email") %></td>
<td><% = objRs3("coursedetails")  %></td>
</tr>



 <% objRs3.Movenext 
	SrNo = SrNo + 1
    Loop %>
<%
objRs3.close

NEXT

End If

%>
</table>
</div>
</div>
</body>
</html>
