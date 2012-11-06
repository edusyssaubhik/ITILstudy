<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Free, Paid Enrollment Report</title>
<%
   If Session("UserId") = "" Then
     Response.Redirect("../login.asp")
   End If
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
rqFromDate = Request("FromDate")
If trim(rqFromDate) <> "" Then
Session("rqFromDate") = rqFromDate
End If 

rqToDate = Request("ToDate")

If trim(rqToDate) <> "" Then
Session("rqToDate") = rqToDate
End If 

rqClasstype = Request("Classtype")

rqReports = Request("reports")

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
        <td width="20%"><input type="text" name="FromDate" value="<% = Session("rqFromDate") %>">
          <br>(EX: YYYY-MM-DD)</td>
      </tr>
      <tr>
        <td width="20%"><b>To Date:</b></td>
        <td width="20%"><input type="text" name="ToDate" value="<% = Session("rqToDate") %>">
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




<% If Session("rqFromDate") <> "" Then %>

<hr />

<div style="margin-left:20px; padding-top:50px;">

<table  border="0" class="table1" width="100%" cellpadding="0" cellspacing="0">


<tr><td width="60%"><b>Enrollment Details - <%= rqClasstype %></b>&nbsp;&nbsp;<span style="font-size:14px; color:#333;">( From <b><% = Session("rqFromDate") %></b> to <b><% = Session("rqToDate") %> </b>)</span><br /><br />
<table  border="1" class="table1" width="100%" cellpadding="3" cellspacing="0">
<tr>
<th>Sl.</th>
<th>Date</th>
<th>Name</th>
<th>Email ID</th>
<th>Item Name</th>
<th>Roll No</th>

</tr>



<%
' Queriy for selecting days in between given values'

If rqClasstype = "Free" Then
 
strQuery2="select * FROM PaypalDB WHERE date_entered BETWEEN '"&Session("rqFromDate")&"' AND '"&Session("rqToDate")&"' AND (item_number = '0051' OR item_number = '112')"

ElseIf rqClasstype = "Paid" Then

strQuery2="select * FROM PaypalDB WHERE date_entered BETWEEN '"&Session("rqFromDate")&"' AND '"&Session("rqToDate")&"' AND (item_number <> '0051' AND item_number <> '112')"

ElseIf rqClasstype = "All" Then

strQuery2="select * FROM PaypalDB WHERE date_entered BETWEEN '"&Session("rqFromDate")&"' AND '"&Session("rqToDate")&"'"

End If

'response.Write(strQuery2)

objRs3.open strQuery2,ConnObj

If Not objRs3.EOF Then

		arrAllRecords3 = objRs3.getrows
		Session("arrAllRecords3") = arrAllRecords3
		EnrollmentsNum3 = Ubound(arrAllRecords3,2)
        firstRow = 0
        lastRow = 99
        numRows = Ubound(arrAllRecords3,2)
        If lastRow > numRows Then
           lastRow = numRows
        End If
        allNumRows = numRows
		cnt = 1

End If
If cnt = 1 Then

 If Request.QueryString("page") = "" Then
	
	iPageCurrent = 1
	
	'arrAllRecords = Session("arrAllRecords")	
	numRows = Ubound(arrAllRecords3,2)
	
	 firstRow = 0 
	 
	 If numRows > 99 Then
	    lastRow = 99  
	 Else
	 	lastRow = numRows
	 End If 
  Else
	
	arrAllQueries = Session("arrAllRecords3")	
	numRows = Ubound(arrAllRecords3,2)
	
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

objRs3.close


%>
  
<%For rowcounter1 = 0 TO EnrollmentsNum3 %>
<tr>
<td><% =  rowcounter1 + 1 %></td>
<td><% =  arrAllRecords3(39,rowcounter1) %></td>
<td><% =  arrAllRecords3(8,rowcounter1)&"&nbsp;"& arrAllRecords3(9,rowcounter1) %></td>
<td><% =  arrAllRecords3(7,rowcounter1) %></td>
<td><% =  arrAllRecords3(2,rowcounter1) %></td>
<td><% =  arrAllRecords3(1,rowcounter1) %></td>
</tr>

<%

    Next
%>
</table>
</td></tr>
</table>
<% End If %>
</div>
</body>
</html>

