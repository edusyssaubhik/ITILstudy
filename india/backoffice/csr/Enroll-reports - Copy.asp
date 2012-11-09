<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Free, Paid Enrollment Report</title>
<%
   If Session("UserId") = "" Then
     Response.Redirect("../login.asp")
   Else
%>
<!--#include virtual="/includes/connection.asp"-->
</head>
<body>


<%

'Diclaring Variables'

Dim rqFromDate,rqToDate,objRs,objRs1
Dim strQuery,strQuery1
Dim EnrollmentsNum,PaymentsNum,rqClasstype
Dim Noof_Enrolled, Noof_Paid, Total_No

Noof_Enrolled = 0
Noof_Paid = 0
Total_No = 0


CountReferred = 0
ReferreEmailID = ""

'initiating Record sets' 

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
Set objRs2 = Server.CreateObject("ADODB.Recordset")
Set objRs3 = Server.CreateObject("ADODB.Recordset")
Set objRs4 = Server.CreateObject("ADODB.Recordset")
Set objRs5 = Server.CreateObject("ADODB.Recordset")


'retriving Values'
rqFromDate = Request.form("FromDate")
rqToDate = Request.Form("ToDate")
rqClasstype = Request.Form("Classtype")
rqReports = Request.QueryString("reports")

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
		
		if (validate_required(Classtype,"Please Select Course Type")==false)
			  {Classtype.focus();return false}
			  
		
  	}
	 
  
 }


 
  
</script>

<div align="left" style="padding:10px;">
  <p><b>Online Reports</b>
  </p>
</div>
<div align="left" style="margin-left:20px;">
  <form action="enroll-reports.asp" method="post" onsubmit="return validate_form(this)">
    <table border="1" class="table1" width="25%" cellpadding="3" cellspacing="0">
      <tr>
        <td width="20%"><b>From Date:</b></td>
        <td width="20%"><input type="text" name="FromDate" value="<% = rqFromDate %>">
          <br>(EX: YYYY-MM-DD)</td>
      </tr>
      <tr>
        <td width="20%"><b>To Date:</b></td>
        <td width="20%"><input type="text" name="ToDate" value="<% = rqToDate %>">
          <br>(EX:  YYYY-MM-DD)</td>
      </tr>
       <tr>
        <td width="20%"><b>Course Type:</b></td>
        <td width="20%"><select name="Classtype" id="Classtype">
        <option value="">----Select----</option>
        <option <% If rqClasstype = "Free" THEN %> selected="selected" <% End if %> value="Free">Free</option>
        <option <% If rqClasstype = "Paid" THEN %> selected="selected" <% End if %> value="Paid">Paid</option>
        <option <% If rqClasstype = "All" THEN %> selected="selected" <% End if %> value="All">All</option>
        </select>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center"><input type="submit" name="Reports" value="Submit"></td>
      </tr>
    </table>
  </form>
  <br /><br />
</div>




<% If rqFromDate <> "" Then %>

<hr />

<div style="margin-left:20px; padding-top:50px;">

<table  border="0" class="table1" width="100%" cellpadding="0" cellspacing="0">


<tr><td width="60%"><b>Enrollment Details</b>&nbsp;&nbsp;<span style="font-size:14px; color:#333;">( From <% = rqFromDate %> to <% = rqToDate %> )</span><br /><br />
<table  border="1" class="table1" width="100%" cellpadding="3" cellspacing="0">
<tr>
<th>Date</th>
<th>Name</th>
<th>Email ID</th>
<th>Test name</th>
<th>Persons Referred</th>
<th>EmailId's</th>
</tr>



<%
' Queriy for selecting days in between given values'

If rqClasstype = "Free" Then
 
strQuery2="select Distinct(convert(varchar(10),date_entered,121)) FROM PaypalDB WHERE date_entered BETWEEN '"&rqFromDate&"' AND '"&rqToDate&"' AND (item_number = '0051' OR item_number = '112')"

ElseIf rqClasstype = "Paid" Then

strQuery2="select Distinct(convert(varchar(10),date_entered,121)) FROM PaypalDB WHERE date_entered BETWEEN '"&rqFromDate&"' AND '"&rqToDate&"' AND (item_number <> '051' AND item_number <> '112')"

ElseIf rqClasstype = "All" Then

strQuery2="select Distinct(convert(varchar(10),date_entered,121)) FROM PaypalDB WHERE date_entered BETWEEN '"&rqFromDate&"' AND '"&rqToDate&"'"

End If

response.Write(strQuery2)
objRs2.open strQuery2 ,ConnObj

If Not objRs2.EOF Then

		arrAllRecords2 = objRs2.getrows
		Session("arrAllRecords2") = arrAllRecords2
		EnrollmentsNum2 = Ubound(arrAllRecords2,2)
		
		firstrow = 0
		lastrow = EnrollmentsNum2
End If

objRs2.close
'Running loop for retriving values based on day for getting payments and enrollments count'

If IsArray(arrAllRecords2) Then
       
for rowcounter = firstrow to lastrow

' Queriy for selecting enrollments count per each day in the loop'

If rqClasstype = "Free" Then

strQuery3="select * FROM PaypalDB WHERE convert(varchar(10),TimeofEntry1,121) = '"&arrAllRecords2(0,rowcounter)&"' AND (item_number = '005' OR item_number = '605' OR item_number = '0051' OR item_number = '0052' OR item_number = '811' OR item_number = '812' OR item_number = '813' OR item_number = '200')"

ElseIf rqClasstype = "Paid" Then

strQuery3="select * FROM PaypalDB WHERE convert(varchar(10),TimeofEntry1,121) = '"&arrAllRecords2(0,rowcounter)&"' AND (item_number <> '005' AND item_number <> '605' AND item_number <> '0051' AND item_number <> '0052' AND item_number <> '811' AND item_number <> '812' AND item_number <> '813' AND item_number <> '200')"

ElseIf rqClasstype = "All" Then

strQuery3="select * FROM PaypalDB WHERE convert(varchar(10),TimeofEntry1,121) = '"&arrAllRecords2(0,rowcounter)&"'"

End If

'Response.Write(strQuery3&" <Br>")
objRs3.open strQuery3,ConnObj

If Not objRs3.EOF Then

		arrAllRecords3 = objRs3.getrows
		Session("arrAllRecords3") = arrAllRecords3
		EnrollmentsNum3 = Ubound(arrAllRecords3,2)
		firstrow1 = 0
		lastrow1 = EnrollmentsNum3

End If


objRs3.close





If IsArray(arrAllRecords3) Then
       
for rowcounter1 = firstrow1 to lastrow1
CountReferred = 0
ReferreEmailID = ""

'Here im getting the referre emailid'

strQuery5= "Select TOP 1 * FROM Ref_Account WHERE EmailId = '"& arrAllRecords3(6,rowcounter1) &"'"

'response.Write(strQuery5)
objRs5.open strQuery5,ConnObjRef



If Not objRs5.EOF Then


  strQuery4="select * FROM Ref_Enrollments WHERE RefID = '"& objRs5("RefID")  &"'"
'Response.Write(strQuery4)

    objRs4.open strQuery4,ConnObjRef

		
          If Not objRs4.EOF Then

              Do While NOT objRs4.EOF 

				CountReferred = CountReferred + 1
				
				
				ReferreEmailID = ReferreEmailID + objRs4("ReferredEmail")
				
				ReferreEmailID = ReferreEmailID + "<br>"

			  objRs4.Movenext
			  Loop

              ReferreEmailID = mid(ReferreEmailID,1,len(ReferreEmailID)-1)

           End If
		   
	  objRs4.close

	  
End If
objRs5.close
%>
  

<tr align="center">
<td><% =  arrAllRecords3(41,rowcounter1) %></td>
<td><% =  arrAllRecords3(7,rowcounter1)&"&nbsp;"& arrAllRecords3(8,rowcounter1) %></td>
<td><% =  arrAllRecords3(6,rowcounter1) %></td>
<td><% =  arrAllRecords3(1,rowcounter1) %></td>
<td><% =  CountReferred %></td>
<td><% =  ReferreEmailID %></td>
</tr>

<%

NEXT
End If

NEXT
End If

%>
</table>
</td></tr>
</table>
<% End If %>
<% End If %>
</div>
</body>
</html>

