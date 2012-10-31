<html>
<head>
<title>Past Payment History</title>
<script language="javascript">
function validate_form(thisform)
{
     //validations for faculty selected or not
	 if (thisform.faculty.selectedIndex =="")
	   {
		 alert("Please Select the Faculty");
		 thisform.faculty.focus();
		 return (false);
	   }
}	   
</script>	
<script language="javascript" type="text/javascript">
<!--

function popitup(url) {
	newwindow=window.open(url,'name','toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=0,minimizable=0,resizable=0,height=300,width=300,top=250,left=400');
	if (window.focus) {newwindow.focus()}
	return false;
}

// -->
<!--  PMstudy -->
</script>   
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
</body>
<% 
If Session("USBUserId") = "" Then
	Response.Redirect("login.asp")
Else
%>
<!--#include virtual="/includes/connection.asp"-->
<% 
'Written By : Priyanka and Savita'
'Created Date: 19/04/2010'
'Last Updated Date: 20/04/2010'
'Description : creating a page to display payment history'
'Purpose : To keep the history of all the records'

'Declring the variables
Dim strQuery, objRs, objRs1, strQuery2
Dim rqfaculty, objRs4, facName, PayId

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
Set objRs4 = Server.CreateObject("ADODB.Recordset")

strQuery = "SELECT firstname, lastname, emailid1 FROM ITIL_instructor WHERE typeofuser = 'Faculty' ORDER BY firstname "
			
objRs1.Open strQuery,connObj


'Retrive the faculty email id'
If Request.QueryString("faculty") <> "" Then
	rqFaculty = Request.QueryString("faculty")
Else	
	rqFaculty = Request.Form("faculty")	
End If	

If rqFaculty <> "" Then

 strQuery="select ITIL_finance.finid,ITIL_finance.faculty, ITIL_finance.pay_cat, ITIL_finance.details, ITIL_finance.amount, ITIL_finance.added_date, ITIL_finance.added_by, ITIL_finance.last_mod_date,ITIL_finance.last_mod_by, ITIL_finance.Approved_by, ITIL_finance.Approved_date, ITIL_instructor.comp_name,ITIL_instructor.comp_addr,ITIL_finance.status,ITIL_finance.Approved_by,ITIL_finance.Approved_date,ITIL_finance.Tax From ITIL_finance INNER JOIN ITIL_instructor ON ITIL_finance.faculty=ITIL_instructor.emailid1 WHERE ITIL_finance.faculty = '" & rqFaculty & "' AND ITIL_finance.status = '1' ORDER BY ITIL_finance.added_date DESC"

objRs.open strQuery ,ConnObj

strQuery2="select * from ITIL_finance_pay WHERE faculty = '"& rqFaculty &"'  ORDER BY payid desc"

objRs4.open strQuery2 ,ConnObj
			
End If			
%>
<% If Session("TypeOfUser") = "Admin" Then %>
<form method="post" action="payHis.asp" onSubmit="return validate_form(this)">		
<div align="left">
<table border="0" cellpadding="10" cellspacing="10">
	<tr>
		<td>Faculty:</td>
		<td>
			<select name="faculty">
                  <option value="Select">--Select--</option>
                  <% Do Until objRs1.EOF 
				       facName = objRs1("firstname") &" "& objRs1("lastname")
		    	  %>
                  <option <% If rqFaculty = objRs1("emailid1") Then %> selected="selected" <% End If %> value="<% = objRs1("emailid1") %>">
                  <% = facName %>
                  </option>
                  <% objRs1.Movenext
				     Loop 
					 objRs1.Close %>
                </select>
		</td>
		<td><input type="submit" name="" value="Submit"></td>
	</tr>
</table>
</div>
</form>
<% End If %>
<% If rqFaculty <> "" Then %>
<div align="left" style="padding:10px;">
  <p><b>Payment Details</b></p>
</div>
<% If Session("typeofuser") = "Admin" Then %>
<div align="right" style="margin-right:70px; padding:5px;"><a href="fin.asp?action=addPayment&type=pastPay">Add Past Payments</a></div>
<% End If %>
<div align="left" style="margin-left:20px;">
<table border="1" class="table1" width="95%" cellpadding="3" cellspacing="0">
  <tr>
    <td><b>Faculty</b></td>
    <td><b>Payment Category</b></td>
    <td><b>Details</b></td>
    <td><b>Amount</b></td>
	<% If Session("CRM_Country") = "United Kingdom" OR Session("CRM_Country") = "India" OR Session("CRM_Country") = "Australia" Then %>
    <td><b>Tax</b></td>
    <td><b>Total Amount</b></td>
    <% End If %>
    <td><b>Added Date</b></td>
    <td><b>Added By</b></td>
    <td><b>Last Modified Date</b></td>
    <td><b>Last MOdified By</b></td>
    <td><b>Company Name</b></td>
    <td><b>Company Address</b></td>
    <% If Session("TypeOfUser") = "Admin" Then %>
    <td><b>Action Taken By</b></td>
    <td><b>View</b></td>
	<td>Edit</td>
   <% End If %>
  </tr>
  <% Do Until objRs.EOF %>
  <tr>
    <td><% = objRs("faculty") %></td>
    <td><% = objRs("pay_cat") %></td>
    <td><% = objRs("details") %></td>
    <td><% = objRs("amount") %></td>
	<% If Session("CRM_Country") = "United Kingdom" OR Session("CRM_Country") = "India" OR Session("CRM_Country") = "Australia" Then %>
    <td><% = objRs("Tax") %></td>
    <td><% = Currency_Format_Front %><% = objRs("amount") + objRs("Tax") %><% = Currency_Format_Back %></td> 
    <% End If %>   
    <td><% = objRs("added_date") %></td>
    <td><% = objRs("added_by") %></td>
    <td><% = objRs("last_mod_date") %></td>
    <td><% = objRs("last_mod_by") %></td>
    <td><% = objRs("comp_name") %></td>
    <td><% = objRs("comp_addr") %></td>
    <% If Session("TypeOfUser") = "Admin" Then %>
    <td><% If objRs("status") = 1  Then %>Reviewed<% End If %><br><% = objRs("Approved_by") %><br>Date: <% = objRs("Approved_date") %></td>
    <td><a href="paymentDetails.asp?ID=<% = objRs("finid") %>" onClick="return popitup('paymentDetails.asp?ID=<% = objRs("finid") %>')">View</a></td>
	<td><a href="fin.asp?action=editFin&id=<% = objRs("finid") %>">Edit</a> </td>
	<% End If %>
   </tr>
  <% objRs.Movenext
	 Loop
	 objRs.Close %>
</table>
</div>
<div align="left" style="padding:10px;">
  <p><b>Paid Details</b></p>
</div>
<div align="left" style="margin-left:20px;">
<table border="1" class="table1" width="95%" cellpadding="3" cellspacing="0">
  <tr>
    <td><b>Payment Status</b></td>
    <td><b>Payment Made Date</b></td>
	<td><b>Payment for the month</b></td>
    <% If Session("TypeOfUser") = "Admin" Then %>
    <td><b>Payment Made By</b></td>
    <% End If %>
    <td><b>Payment Mode</b></td>
    <td><b>Transaction/Check number</b></td>
    <td><b>Total amount</b></td>
	<% If Session("TypeOfUser") = "Admin" Then %>
	<td><b>Edit</b></td>
	<% End If %>
  </tr>
<% 
	Do Until objRs4.EOF
		
		PayId             = objRs4("payid")
		PaymentStatus     = objRs4("pay_status") 
		Payment_Made_Date = objRs4("pay_made_date") 
		Payment_Made_By   = objRs4("pay_made_by")
		PayMode           = objRs4("Pay_mode") 
		CheckNo           = objRs4("checkno") 
		TotalAmount       = objRs4("Totalamount") 
		MonthOfPayment    = objRs4("month_of_pay")
		
		If PaymentStatus = 1 Then
			str  = "Paid"
		Else
			str = "Not Paid"
		End If
%>
  <tr>
   <td><% = str %></td>
    <td><% = Payment_Made_Date %></td>
    <td><% = MonthOfPayment %></td>	
    <% If Session("TypeOfUser") = "Admin" Then %>
    <td><% = Payment_Made_By %></td>
    <% End If %>
    <td><% = PayMode %></td>
    <td><% = CheckNo %></td>
    <td><% = TotalAmount %></td>
	<% If Session("TypeOfUser") = "Admin" Then %>
    <td><a href="fin.asp?faculty=<% = rqFaculty %>&action=editpay_det&payid=<% = PayId %>&paymonth=<% = Payment_Made_Date %>">Edit Payment Details</a></td>	
	<% End If %>
  </tr>
<%
		 
	objRs4.MoveNext
	Loop
	objRs4.Close

%>  
</table>
</div>
<br><br>
<% If Session("TypeOfUser") = "Admin" Then %>
<div align="left" style="padding:10px;">
  <p><b>Payments</b></p>
</div>
<div align="left" style="margin-left:20px;">
<form action="fin.asp?action=payMade" method="post">
<input type="hidden" name="faculty" value="<% = rqFaculty %>">
<table border="1" class="table1" width="30%" cellpadding="3" cellspacing="0">
  <tr>
  	<td width="10%"><b>Payments:</b></td>
	<td width="20%"><input type="text" name="payment_month">&nbsp;(EX: YYYY-MM-DD)</td>
  </tr>
  <tr>
  	<td colspan="2" align="center"><input type="submit" name="payments" value="Submit"></td>
  </tr>
</table>
</form>
</div>
<% End If %>
<% End If %>
<pre>



</pre>
</html>
<% End If %>
