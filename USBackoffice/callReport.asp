<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Call Reports</title>
<!--#include virtual="/includes/connection.asp"-->
</head>
<body>
<%
'Checking authentication'
If Session("USBUserId") = "Admin" Then
	Response.Redirect("login.asp")
Else

'---------------------------------------------------------------'
'Written By : Priyanka'
'Created Date : 31/07/2012'
'Modified By : Priyanka'
'Modified Date: 31/07/2012'
'Description :'
'This page is to display all calls records' 

'--------------------------------------------------------------'

'Diclaring Variables'

Dim rqFromDate,rqToDate,objRs,objRs1
Dim strQuery,strQuery1
Dim EnrollmentsNum,PaymentsNum,rqCountry
Dim SplitCid,callStatus,objRsComment
'initiating Record sets' 

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
Set objRs2 = Server.CreateObject("ADODB.Recordset")
Set objRs3 = Server.CreateObject("ADODB.Recordset")
Set objRsCallID = Server.CreateObject("ADODB.Recordset")
Set objRsComment = Server.CreateObject("ADODB.Recordset")


'retriving Values'
rqFromDate = Request.form("FromDate")
rqToDate = Request.Form("ToDate")
rqCountry = Request.Form("country")
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
  <span style="color:#36F;"><h2>Call Report</h2></span>
</div>
<div align="left" style="margin-left:20px;">
  <form action="callReport.asp" method="post" onsubmit="return validate_form(this)">
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
        <td width="10%"><b>Country:</b></td>
        <td width="20%">
        
         <select name="country" id="country">
        <option value="">----Select----</option>
        
         <%
				'Query For Selecting faculty for us'	
				
					strCountryname = "SELECT * FROM ITIL_countrydetails ORDER BY id ASC"
					objRs1.Open strCountryname, ConnObj
					
					If Not objRs1.EOF THen
					arrAllCountry = objRs1.getrows
					NumRows = Ubound(arrAllCountry,2)
					FirstRow = 0
					LastRow  = NumRows
					End If
					
					If IsArray(arrAllCountry) Then
					For RowCounter = FirstRow to LastRow 
			
			%>
                
               <option <% If rqCountry = arrAllCountry(1,RowCounter) Then %> selected="selected" <% End If %> value="<% = arrAllCountry(1,RowCounter)%>"><% = arrAllCountry(1,RowCounter) %></option>
               
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
<span style="color:#36F;"><h2>Calls History</h2></span>
<div style="margin-left:20px; padding-top:50px;"> 

<table  border="1" class="table1" width="100%" cellpadding="3" cellspacing="0">
<tr>
<th>S.NO</th>
<th>Caller For</th>
<th>Caller Name</th>
<th>EmailID</th>
<th>State</th>
<th>Question</th>
<th>Added Date</th>
<th>Comments</th>
<th>Status1</th>
<th>Status2</th>

</tr>



<%

strCallDet = "SELECT callid,callfor, callername, phoneno, emailid, callerstate, question, addeddate,call_status1, call_status2 FROM  ITIL_callsreceived_new WHERE addeddate BETWEEN '"&rqFromDate&"' AND '"&rqToDate&"' AND country = '"& rqCountry &"'"
'response.Write(strCallDet)
objRs.Open strCallDet, ConnObj

callcounter = 1

If Not objRs.EOF Then


Do Until objRs.EOF
 
    CallID  = objRs("callid")
	CallFor = objRs("callfor")
	CallerName = objRs("callername")
	PhoneNo = objRs("phoneno")
	EmailID = objRs("emailid")
	CallerState = objRs("callerstate")
	Question = objRs("question")
	AddedDate = objRs("addeddate")
	callStatus1 = objRs("call_status1")
	callStatus2 = objRs("call_status2")
If callStatus1 = "1" Then
	
		RqStatus = "call to be made"
		
ElseIf callStatus1 = "2" Then

        RqStatus = "call to be followed"	
	
ElseIf callStatus1 = "3" Then

        RqStatus = "Closed call"	
	
End If


'If CallFor = "Classroom" Then

%>

<tr align="center" >
<td><% = callcounter %></td>
<td><% = CallFor %></td>
<td><% = CallerName %></td>
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


</td>


<td><% = RqStatus %></td>
<td><% = callStatus2 %></td>

</tr>

<% 


callcounter = callcounter + 1
		

objRs.Movenext
Loop
objRs.Close

Else
%>

<tr>
<td colspan="5" align="center"> No records for this Country </td></tr>

<% End If %>
<% End If %>

</table>
</div>
<% 
'Checking authentication - end if'
End If %>
</body>
</html>
