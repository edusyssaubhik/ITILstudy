<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Conversion Reports</title>
<!--#include virtual="/includes/connection.asp"-->
</head>
<body>
<%
'Checking authentication'
If Session("USBUserId") = "Admin" Then
	Response.Redirect("login.asp")
Else

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
Dim SplitCid
'initiating Record sets' 
Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
Set objRs2 = Server.CreateObject("ADODB.Recordset")
Set objRs3 = Server.CreateObject("ADODB.Recordset")
Set objRsComment = Server.CreateObject("ADODB.Recordset")
 
Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "-", "")
End Function


'retriving Values'
rqFromDate = Request.form("FromDate")
rqToDate = Request.Form("ToDate")
rqFaculty = Request.Form("Faculty")
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
		
		if (validate_required(Faculty,"Please Select Country")==false)
			  {Faculty.focus();return false}
			  
		
  	}
	 
  
 }


 
  
</script>

<div align="left" style="padding:10px;">
  <span style="color:#36F;"><h2>Call Conversion Report</h2></span>
</div>
<div align="left" style="margin-left:20px;">
  <form action="Gen_Conversion_Report.asp" method="post" onsubmit="return validate_form(this)">
    <table border="1" class="table1" width="25%" cellpadding="3" cellspacing="0">
      <tr>
        <td width="10%"><b>From Date:</b></td>
        <td width="20%"><input type="text" name="FromDate" value="<% = rqFromDate %>">
          <br>(EX: YYYY-MM-DD)</td>
      </tr>
      <tr>
        <td width="10%"><b>To Date:</b></td>
        <td width="20%"><input type="text" name="ToDate" value="<% = rqToDate %>">
          <br>(EX:  YYYY-MM-DD)</td>
      </tr>
      <tr>
        <td width="10%"><b>Faculty:</b></td>
        <td width="20%">
        
         <select name="Faculty" id="Faculty">
        <option value="">----Select----</option>
        
         <%
				'Query For Selecting faculty for us'	
				
					strFacultyname = "SELECT * FROM ITIl_instructor ORDER BY firstname ASC"
					objRs1.Open strFacultyname, ConnObj
					
					If Not objRs1.EOF THen
					arrAllFaculty = objRs1.getrows
					NumRows = Ubound(arrAllFaculty,2)
					FirstRow = 0
					LastRow  = NumRows
					End If
					
					If IsArray(arrAllFaculty) Then
					For RowCounter = FirstRow to LastRow 
			
			%>
                
               <option <% If rqFaculty = arrAllFaculty(3,RowCounter) Then %> selected="selected" <% End If %> value="<% = arrAllFaculty(3,RowCounter)%>"><% = arrAllFaculty(1,RowCounter) %></option>
               
               <% Next
                End If
                objRs1.Close
                 %>
           </select>
       
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center"><input type="submit" name="payments" value="Submit"></td>
      </tr>
    </table>
  </form>
</div>



<% If rqFromDate <> "" Then %>
<span style="color:#36F;"><h2>Calls History </h2></span>
<div style="margin-left:20px; padding-top:50px;"> 

<table  border="1" class="table1" width="75%" cellpadding="3" cellspacing="0">
<tr>
<th>S.NO</th>
<th>Caller For</th>
<th>Caller Name</th>
<th>Phone No</th>
<th>EmailID</th>
<th>State</th>
<th>Question</th>
<th>Added Date</th>
<th>Comments</th>
<th>Status</th>
<th>Payment Date</th>
</tr>



<%
' Queriy for selecting Calls in between given values'
 
strQuery2="select distinct(callid) FROM fac_comments_new WHERE comm_date BETWEEN '"&rqFromDate&"' AND '"&rqToDate&"' AND comm_addedby = '"& rqFaculty &"'"

objRs2.open strQuery2 ,ConnObj

SrNo = 1

If Not objRs2.EOF Then

Do Until objRs2.EOF 

CallID = objRs2("callid")

strCallDet = "SELECT callfor, callername, phoneno, emailid, callerstate, question, addeddate FROM ITIL_callsreceived_new WHERE callid = '"& CallID &"'"

objRs.Open strCallDet, ConnObj


Do Until objRs.EOF

	CallFor = objRs("callfor")
	CallerName = objRs("callername")
	PhoneNo = StrQuoteReplace(objRs("phoneno"))
	EmailID = objRs("emailid")
	CallerState = objRs("callerstate")
	Question = objRs("question")
	AddedDate = objRs("addeddate")
	
objRs.Movenext
Loop
objRs.Close

If CallFor = "Classroom" Then

%>

<tr align="center">
<td><% = SrNo %></td>
<td><% = CallFor %></td>
<td><% = CallerName %></td>
<td><% = PhoneNo %></td>
<td><% = EmailID %></td>
<td><% = CallerState %></td>
<td><% = Question %></td>
<td><% = AddedDate %></td>
<!--Here we are getting comments made for perticular call at that time -->
<td>
<%


'Sql Query For Retrive The comments For That EnrolledUser'
strQuery = "SELECT f_comment,comm_addedby,comm_date FROM fac_comments_new WHERE callid = '"&CallID&"'  Order by f_cid desc"
'response.Write(strQuery)
objRsComment.Open strQuery,ConnObj

 If Not objRsComment.EOF Then
   items = objRsComment.getrows
   numrows = Ubound(items,2)
   firstrow = 0
   lastrow = numrows
 End If
 
If IsArray(items) Then

	For rowcounter = firstrow to lastrow
	allitems = items(0,rowcounter)
	allitems1 = items(1,rowcounter)
	allitems2 = items(2,rowcounter)
	%>
	<div style="text-align:left;"><% response.write(allitems & "<br> added by " & allitems1 & "<br>" & allitems2 & "<br><br>" )%></div>
	<%
	
	Next
	
End If  

 objRsComment.Close  


%>


</td><%

' Queriy for selecting Status of caller'


'Sql Query For Retrive The comments For That EnrolledUser'
strQuery = "SELECT top 1 comm_date FROM fac_comments_new WHERE callid = '" & CallID & "' And comm_addedby = '"&rqFaculty&"' Order by f_cid asc"
'Response.Write(strQuery)
objRs.Open strQuery,ConnObj

LastCommDate = objRs("comm_date")

objRs.Close

strQuery3="select top 1 checkreceived, checkreceiveddate FROM ITIL_enrolledusers WHERE email= '"&EmailID&"' OR phoneno = '"&PhoneNo&"' order by id desc"
'Response.Write(strQuery3 &"<br>")
objRs3.open strQuery3,ConnObj



'Response.Write("<br> Comm Add Date " & LastCommDate & "<br>")

If Not objRs3.EOF Then
	
	If Trim(objRs3("checkreceived"))  = "Yes" Then
	
'	Response.Write("<br>" & objRs3("checkreceiveddate") & " Last Comm Date " & LastCommDate)
'	x = CDATE(LastCommDate) - CDate(objRs3("checkreceiveddate"))
'	Response.Write("<br>Sr No -" & rowcounter & " - " & x & " - " & PhoneNo & "<br>")

	CheckReceivedDate = objRs3("checkreceiveddate")
	
	'If (CDate(CheckReceivedDate) - CDATE(AddedDate)  >= 0) Then
	If (CDATE(FormatDateTime(AddedDate,2)) - CDate(FormatDateTime(CheckReceivedDate,2)) = 0) Then
	
		RqStatus = "Converted"
	
	ElseIf (CDATE(FormatDateTime(AddedDate,2)) - CDate(FormatDateTime(CheckReceivedDate,2)) > 0) Then
	
		RqStatus = "Followup"
	
	Else
	
		'If (CDATE(LastCommDate) - CDate(CheckReceivedDate) >= 0) Then
		If ( CDate(FormatDateTime(CheckReceivedDate,2)) - CDATE(FormatDateTime(LastCommDate,2)) >= 0) Then
		
			RqStatus = "Converted"
	
		Else 
		
			RqStatus = "Not Converted"
		
		End If

'	Else 
		
'		RqStatus = "Not Converted"
		
	End If
	Else
	RqStatus = "Not Converted"	
  End If
		
Else

        RqStatus = "Not Converted"	
		
End If

Session("LastCommDate") = "" 

objRs3.close

%>


<td><% = RqStatus %></td>
<td><% = CheckReceivedDate %></td>
<% CheckReceivedDate = "" %>
</tr>

<% 
SrNo = SrNo + 1
End If

objRs2.Movenext
Loop
objRs2.Close

Else
%>

<tr>
<td colspan="11" align="center"> No records for this faculty </td></tr>

<% End If %>
<% End If %>

</table>
</div>
<% 
'Checking authentication - end if'
End If %>
</body>
</html>
