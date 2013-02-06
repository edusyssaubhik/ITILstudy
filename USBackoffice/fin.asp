<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
If Session("USBUserId")="" Then
	Response.Redirect("login.asp")
Else
%>
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->

<%
'Written By : Priyanka and Savita'
'Created Date: 19/04/2010'
'Modified By: Praveen Kumar
'Last Updated Date: 30/08/2011'
'Description :'
'Purpose : '

'Declare The Variables'
Dim rqAction, objRs, facName,strQuery, objRs1,objRs3,objRs4,objRs6,strPay_status
Dim strFinance, rqFinid, objRs2, rqFaculty, strQuery1,rqPay_Status,objRs5
Dim getMonth,todayDate,strQuery4,strQuery2,rqPayid,streditpay_det
Dim rs, Amount, PaymentStatus, str,strQuery_1
Dim Payment_Made_Date, Payment_Made_By, CheckNo, TotalAmount
Dim arrAllPayDet, firstRow, lastRow, numRows, rowcounter, rs1
Dim firstname, lastname, PayMode, Pay_Id, PayId, rqType
Dim Pay_Month, strPay_Amount, companyname, strCountry
Dim MonthofPay, PaymentMadeDate,Currency_Format_Front,Currency_Format_Back
Dim strQuery_2,objRs7,rqID

set rs=server.CreateObject("ADODB.recordset")
set rs1=server.CreateObject("ADODB.recordset")
set objRs= server.CreateObject("ADODB.recordset")
set objRs1= server.CreateObject("ADODB.recordset")
set objRs2= server.CreateObject("ADODB.recordset")
set objRs3= server.CreateObject("ADODB.recordset")
set objRs4= server.CreateObject("ADODB.recordset")
set objRs5= server.CreateObject("ADODB.recordset")
set objRs6= server.CreateObject("ADODB.recordset")
set objRs7= server.CreateObject("ADODB.recordset")

'Displaying all the Call Received and Enrolled Users code start here'
rqAction=request.QueryString("action")
rqType = Request.QueryString("type")

'Retrive the selected faculty name'
If Request.Form("faculty") <> "" Then
	rqFaculty = Request.Form("faculty")
Else
	rqFaculty = Request.Querystring("faculty")
End If	
'Currency Format Display Functions'

Currency_Format_Front = CurrencyFormat_Front(Session("CRM_Country"))

Currency_Format_Back = CurrencyFormat_Back(Session("CRM_Country"))

'Display the faculty based on counrty'
If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" OR Session("CRM_Country") = "Global") Then
	
	strCountry = "(country = 'US' OR country = 'Canada')"
	
ElseIf (Session("CRM_Country") = "UAE" OR Session("CRM_Country") = "Saudi Arabia") Then
	
	strCountry = "(country = 'UAE' OR country = 'Saudi Arabia')"

ElseIf (Session("CRM_Country") = "Australia" OR Session("CRM_Country") = "New Zealand") Then
	
	strCountry = "(country = 'Australia' OR country = 'New Zealand')"	
	
ElseIf (Session("CRM_Country") = "India") Then
	
	strCountry = "(country = 'India')"	

ElseIf (Session("CRM_Country") = "Global") Then
	
	strCountry = "(country = 'US' OR country = 'Canada')"

Else

	strCountry = "(country = '"&Session("CRM_Country")&"')"	
	
End If	


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Finance</title>
<!-- CSS -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<!--[if IE 6]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie6.css" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie7.css" /><![endif]-->
<!-- JavaScripts-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jNice.js"></script>
<script type="text/javascript" src="js/courses.js"></script>
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
     //validation for faculty
       if (thisform.faculty.selectedIndex =="")
	   {
		 alert("Please Select the Faculty");
		 thisform.faculty.focus();
		 return (false);
	   }
}

function validate_form1(thisform)
{
     //validations for payment status in payment
	 if (thisform.pay_status.selectedIndex =="")
	   {
		 alert("Please Select the payment status");
		 thisform.pay_status.focus();
		 return (false);
	   }
  
 }


function validate_form2(thisform)
{
     //validations for add payment
	 if (thisform.faculty.selectedIndex =="")
	   {
		 alert("Please Select the Faculty");
		 thisform.faculty.focus();
		 return (false);
	   }

	 if (thisform.paymentCategory.selectedIndex =="")
	   {
		 alert("Please Select the Payment Category");
		 thisform.paymentCategory.focus();
		 return (false);
	   }

	   if (thisform.Students.selectedIndex =="")
	   {
		 alert("Please Select the size of class");
		 thisform.Students.focus();
		 return (false);
	   }
	
	
	   if (thisform.distance.selectedIndex =="")
	   {
		 alert("Please Select the  Faculty Distance ");
		 thisform.distance.focus();
		 return (false);
	   }
	

    with (thisform)
    {
     
	   //Check To See If The Details Field Is Balnk     
		
		if (validate_required(details,"Please enter the Details")==false)
			  {details.focus();return false}
			  
	 //Check To See If The Amount Field Is Balnk     
		
		if (validate_required(amount,"Please enter the Amount")==false)
			  {amount.focus();return false}
  
			 
		//Check To See If The Company name Field Is Balnk     
		
		if (validate_required(compName,"Please enter the Company name")==false)
			  {compName.focus();return false}
			  
	    //Check To See If The Company Address Field Is Balnk     
		
		if (validate_required(compAdd,"Please enter the Company Address")==false)
			  {compAdd.focus();return false}	 
			  
			   //Check To See If The Attended students feild is balnk for corporate classes    
		
		if (validate_required(noofEnroll,"Please enter the No Of Attended students")==false)
			  {noofEnroll.focus();return false}	
			  
			  //Check To See If The Attended students feild is balnk for open classes    
		
		if (validate_required(EnrollNo,"Please enter the No Of Attended students")==false)
			  {EnrollNo.focus();return false}	
			  
			  
		
  	}
	 
  
 }

 function validate_form3(thisform)
{
   

	 if (thisform.paymentCategory.selectedIndex =="")
	   {
		 alert("Please Select the Payment Category");
		 thisform.paymentCategory.focus();
		 return (false);
	   }

    with (thisform)
    {
     
	   //Check To See If The Details Field Is Balnk     
		
		if (validate_required(details,"Please enter the Details")==false)
			  {details.focus();return false}
			  
	 //Check To See If The Amount Field Is Balnk     
		
		if (validate_required(amount,"Please enter the Amount")==false)
			  {amount.focus();return false}
  
       //Check To See If The Amount Have Numerals    
	   
 	  //  if (validate_number(amount,"Amount is not a numeral")==false)
 	     //    {amount.focus();return false}
  	}
	 
  
 } 
 function validate_form4(thisform)
{
     //validations for payment status in payment
	 if (thisform.pay_status.selectedIndex =="")
	   {
		 alert("Please Select the payment status");
		 thisform.pay_status.focus();
		 return (false);
	   }

	
    with (thisform)
    {
     

  
       //Check To See If The Check number Have Numerals    
	   
 	    //if (validate_number(Checkno,"Check number is not a numeral")==false)
 	      //   {Checkno.focus();return false}
  	}
	 
  
 }
  
</script>
<!--Here this javascript function is for displaying classes based on selection-->

</head>
<body>
<div id="wrapper">
  <!--#include file="includes/topMenu.asp"-->
  <!-- // #end mainNav -->
  <div id="containerHolder">
    <div id="container">
      <div id="sidebar">
        <!--#include file="includes/leftMenu.asp"-->
        <!-- // .sideNav -->
      </div>
      <!-- // #sidebar -->
      <!-- h2 stays for breadcrumbs -->
      <h2><a href="home.asp">Home</a> &raquo; <a href="fin.asp" class="active">Finance</a>
        <% If rqAction = "addPayment" Then %>
        &raquo; Add Payment
        <% ElseIf rqAction = "paymentDetails" Then%>
        &raquo;Payment details
        <% ElseIf rqAction = "editFin" Then %>
        &raquo;  Edit
        <% ElseIf rqAction = "payMade" Then %>
        &raquo;  Payment
        <% ElseIf rqAction = "editpay_det" Then %>
        &raquo; Edit Payment Details
        <% Else %>
        &raquo;Faculty details
        <% End If %>
      </h2>
      <% If Session("TypeOfUser") = "Admin" Then %>
      <div id="topbar" style="margin-left:31px;">
        <ul class="topNav">
          <li><a href="fin.asp?action=addPayment">Add Payment</a></li>
        </ul>
      </div>
      <div id="topbar" style="margin-left:- 30px;">
        <ul class="topNav">
          <li><a href="payHis.asp" target="_blank">Payment History</a></li>
        </ul>
      </div>
      <% End if %>
 
      <div id="main">
        <% If rqAction = "addPayment" Then %>
        <h3>Add <% = MonthName(Month(date())) %> payment</h3>
        <% ElseIf rqAction = "editFin" Then %>
        <h3>Edit <% = MonthName(Month(date())) %> Payment Details</h3>
        <% ElseIf rqAction = "payMade" Then %>
        <h3>Payment</h3>
        <% ElseIf rqAction = "editpay_det" Then %>
        <h3>Edit Payment Details</h3>
        <% Else %>
        <h3><% = MonthName(Month(date())) %> Payment details</h3>
        <% End If %>
        <fieldset>
        <%
	   	If rqAction = "addPayment" Then

			strQuery = "SELECT  firstname, lastname, emailid1 FROM ITIL_instructor WHERE "& strCountry & " And typeofuser = 'Faculty' ORDER BY firstname"
			
		    objRs.Open strQuery,connObj
	  
	    %>
        <form action="addEditPayment.asp" method="post" onSubmit="return validate_form2(this)">
          <table border="0" width="100%" class="table2">
            <tr>
              <td width="15%">Faculty:</td>
              <td width="85%"><select name="faculty">
                  <option value="Select">--Select--</option>
                   <% 
				   Do Until objRs.EOF 
				   facName = objRs("firstname") &" "& objRs("lastname")
		    	  %>
                  <option value="<% = objRs("emailid1") %>">
                  <% = facName %>
                  </option>
                  <% objRs.Movenext
				     Loop 
					 objRs.Close %>
                  
                </select>
              </td>
            </tr>
            <tr>
              <td>Payment Category:</td>
              <td><select id="paymentCategory" name="paymentCategory" onchange="findClass(this.value);">
                  <option value="Select">--Select--</option>
                  <option value="Reimbursement">Reimbursement</option>
                  <option value="TravelConveyanceCharges">Travel and Conveyance charges</option>
                  <option value="Paymentforopenclass">Payment for open class</option>
                  <option value="Paymentforcorporateclass">Payment for corporate class</option>
                  <option value="Facultyincentiveformarketing">Faculty incentive for marketing</option>
                  <option value="Consultancycharges">Consultancy charges</option>
                  <option value="Classroom Training for ITIL Study">Classroom Training for ITIL Study</option>
                </select>
              </td>
            </tr>
            <!--Here this will comes by selecting the option of Payment for open and carporate class-->
            <tr id="txtHint">
                <!--Here Comes dropdown from AJAX Base on selection For Open and Corporate Classes-->  
             <tr id="txtHint1"></tr>   
             <tr id="txtHint2"></tr>      
			<% If rqType = "pastPay" Then %>
			<tr>
			  <td>Date:</td>
			  <td><input type="text" name="pastPayDate" /><br />(Ex: YYYY-MM-DD)</td>
			</tr>
			<% End If %>
            <tr>
              <td> Details </td>
              <td><textarea rows="8" cols="20"  name="details"></textarea>
              </td>
            </tr>
            
            <tr id="op3" style="display:none;">
              <td>Amount </td>
              <td><select name="Currency" id="Currency" style="width:75px;">
                  <option value="">--Select--</option>
                  <option value="INR">INR</option>
                  <option value="USD">USD</option>
                  <option value="GBP">GBP</option>
                  <option value="AUD">AUD</option>
                  <option value="EUR">EUR</option>
                  <option value="SGD">SGD</option>
                </select>
                &nbsp;
                <input type="text" name="amount" /></td>
              </tr>
             
            <tr id="op4" style="display:none;">
            <% If Session("CRM_Country") = "United Kingdom" OR Session("CRM_Country") = "India" OR Session("CRM_Country") = "Australia" Then %>
            <td><% If Session("CRM_Country") = "United Kingdom" Then%>VAT<% ElseIf Session("CRM_Country") = "Australia" Then %>GST<% ElseIf Session("CRM_Country") = "India" Then %>Tax<% End If %><% If Session("CRM_Country") = "United Kingdom" Then %> (&#163;)<% ElseIf  Session("CRM_Country") = "India" Then %> Rs <% Else %> ($) <% End If %> <br /><font style="font-size:10px">(If Applicable)</font></td>
            <td><input type="text" name="Tax" size="8" /></td>
             <% End If %>
            </tr>
          
           <tr>
              <td></td>
              <td><div>
                  <input type="submit" name="action" value="Add Payment" />
                  &nbsp;&nbsp;
                  <input type="reset" value="Reset"  onclick="document.getElementById('amount').value='';"/>
                </div></td>
            </tr>
          </table>
        </form>
        <%    ElseIf rqAction = "" OR rqAction = "paymentDetails" Then
				    		
				strQuery = "SELECT  firstname, lastname, emailid1 FROM ITIL_instructor WHERE "& strCountry & " And typeofuser = 'Faculty' ORDER BY firstname"
			
				objRs.Open strQuery,ConnObj 
		%>
        <form action="fin.asp?action=paymentDetails" method="post" onSubmit="return validate_form(this)">
          <table border="0" cellpadding="15" cellspacing="10" width="30%" class="table2">
            <tr>
              <td>Faculty: </td>
              <td><select name="faculty">
                  <option value="Select">--Select--</option>
                  <% Do Until objRs.EOF 
					       facName = objRs("firstname") &" "& objRs("lastname")
						%>
                  <option <% If rqFaculty = objRs("emailid1") Then %> selected="selected" <% End If %> value="<% = objRs("emailid1") %>">
                  <% = facName %>
                  </option>
                  <% objRs.Movenext
						   Loop 
						   objRs.Close %>
                </select></td>
             
            </tr>
            <tr>
            	<td>Dashboard for the month</td>
                <td><input type="text" name="monthofpay" /><br />(Ex: 9-2011)</td>
			</tr>
            <tr>
            	<td>&nbsp;</td>
                 <td><input type="submit" name="type" value="Submit" /></td>
            </tr>
          </table>
        </form>
        <%  If rqAction = "paymentDetails" Then
			
			rqMonthofPay = Request.Form("monthofpay")
			
			If rqMonthofPay <> "" Then
				strDate = Split(rqMonthofPay,"-")
				For i = 0 to 1
					
					strMonth = strDate(0)
					strYear = strDate(1)
					
				Next
				
			Else
			
					strMonth = Cint(Month(Now()))
					strYear = Cint(Year(Now()))		
			
			End If 
			
			'For Table 1  i.e. finance table'
			strQuery="select ITIL_finance.finid, ITIL_finance.pay_cat, ITIL_finance.details, ITIL_finance.amount, ITIL_finance.added_date, ITIL_finance.added_by, ITIL_finance.last_mod_date, ITIL_finance.last_mod_by,ITIL_instructor.comp_name,ITIL_instructor.comp_addr,ITIL_finance.status,ITIL_finance.Approved_by,ITIL_finance.Approved_date,ITIL_finance.Tax  From ITIL_finance INNER JOIN ITIL_instructor ON ITIL_finance.faculty=ITIL_instructor.emailid1  WHERE faculty = '"& rqFaculty &"' AND (CONVERT(varchar(2), DATEPART(month, added_date)) = '"& strMonth &"' AND DATEPART(yyyy, added_date) = '"& strYear &"')"

'response.Write(strQuery)
		    objRs1.open strQuery ,ConnObj 
			
			If Not objRs1.EOF Then
				arrAllPayDet = objRs1.getrows
				firstRow = 0
				numRows = Ubound(arrAllPayDet,2)
				lastRow = numRows
			End If

			'for Table2 i.e. finance_pay  table'
			'strQuery2="select Top 1 * from ps_finance_pay WHERE faculty = '"& rqFaculty &"' AND (CONVERT(varchar(2), DATEPART(month, pay_made_date)) = '"& Cint(Month(Now())) &"'  AND DATEPART(yyyy, pay_made_date) = '"& Cint(Year(Now())) &"') ORDER BY payid desc"
			
			If rqMonthofPay <> "" Then
			str = MonthName(Month(rqMonthofPay),3) & "-" & Year(rqMonthofPay)
			Else
			str = MonthName(Month(Now()),3) & "-" & Year(Now())
			End If
			strQuery2="select  * from ITIL_finance_pay WHERE faculty = '"& rqFaculty &"' AND month_of_pay = '"& str &"' ORDER BY payid desc"
			
			objRs4.open strQuery2 ,ConnObj
			
			Do Until objRs4.EOF
				
				PayId             = objRs4("payid")
				PaymentStatus     = objRs4("pay_status") 
				Payment_Made_Date = objRs4("pay_made_date") 
				Payment_Made_By   = objRs4("pay_made_by")
				PayMode           = objRs4("Pay_mode") 
				CheckNo           = objRs4("checkno") 
				MonthofPay        = Trim(objRs4("month_of_pay"))
				
				PaymentMadeDate = MonthName(Month(Payment_Made_Date),3) & "-" & Year(Payment_Made_Date)
				
				'TotalAmount       = objRs4("Totalamount") 
				
				If PaymentStatus = 1 Then
			   		str  = "Paid"
				Else
					str = "Not Paid"
				End If

				 
			objRs4.MoveNext
			Loop
			'objRs4.Close
			
			
			
		%>
		<% 
		'If Pay_Cat is something then only display the below tables otherwise display the message'
		If IsArray(arrAllPayDet) Then %>
        <% 'If (MonthofPay <> CStr(Trim(PaymentMadeDate))) Then
		If ((objRs4.BOF) AND (objRs4.EOF)) OR (MonthofPay <> CStr(Trim(PaymentMadeDate))) Then %>
        <div align="right"><a href="fin.asp?faculty=<% = rqFaculty %>&action=payMade">Payment</a> </div>
        </br>
        <% Else %>
        <div align="right"> Status: <b>
          <% Response.Write("Payment is done") %>
          </b> </div>
        <% End If %>
        <table border="1" class="table1" width="100%">
          <tr><br />
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
            <td><b>View</b></td>
            <% If PaymentStatus = 0 Then %>			
            <td><b>Edit</b></td>
			<% End If %>	
            <td><b>Status</b></td>	
            <td><b>Action taken By</b></td>
          </tr>
		  <% For rowcounter = firstRow To lastRow  
				
				
				'If arrAllPayDet(10,rowcounter) = "1" Then
				'TotalAmount = TotalAmount + arrAllPayDet(3,rowcounter)
		  		'End If
		  %>
          <tr>
            <td><% = arrAllPayDet(1,rowcounter) %></td>
            <td><% = arrAllPayDet(2,rowcounter) %></td>
            <td><% = Currency_Format_Front %><% = arrAllPayDet(3,rowcounter) %><% = Currency_Format_Back %></td>
            <% If Session("CRM_Country") = "United Kingdom" OR Session("CRM_Country") = "India" OR Session("CRM_Country") = "Australia" Then %>
            <td><% = Currency_Format_Front %><% = arrAllPayDet(13,rowcounter) %><% = Currency_Format_Back %></td>
            <td><% = Currency_Format_Front %><% = arrAllPayDet(3,rowcounter) + arrAllPayDet(13,rowcounter) %><% = Currency_Format_Back %></td> 
            <% End If %>           
            <td><% = arrAllPayDet(4,rowcounter) %></td>
            <td><% = arrAllPayDet(5,rowcounter) %></td>
            <td><% = arrAllPayDet(6,rowcounter) %></td>
            <td><% = arrAllPayDet(7,rowcounter) %></td>
            <td><% = arrAllPayDet(8,rowcounter) %></td>
            <td><% = arrAllPayDet(9,rowcounter) %></td>
			<td>
			<a href="paymentDetails.asp?ID=<% = arrAllPayDet(0,rowcounter) %>" onClick="return popitup('paymentDetails.asp?ID=<% = arrAllPayDet(0,rowcounter) %>')">View</a> 
			</td>
            <% If PaymentStatus = 0 Then %>
            <td>
			<a href="fin.asp?action=editFin&id=<% = arrAllPayDet(0,rowcounter) %>">Edit</a> 
			</td>
            <% End if %>
            <% If arrAllPayDet(5,rowcounter) = Session("USBUserId") Or  arrAllPayDet(7,rowcounter) = Session("USBUserId") Then  %>
            <% if arrAllPayDet(10,rowcounter) = "1" Then %>
            <td>Reviewed</td>
            <%Elseif arrAllPayDet(10,rowcounter) = "2" Then %>
            <td>Not Reviewed</td>
            <% Else %>
             <td> Waiting for approval </td>
             <% End If %>
            <% Else %>	
            <% if arrAllPayDet(10,rowcounter) = "1" Then %>
            <td>Reviewed</td>
            <%Elseif arrAllPayDet(10,rowcounter) = "2" Then %>
            <td>Not Reviewed</td>
            <% Else %>
             <td>
              <table class="table2">
             <form method="post" action="addEditPayment.asp" />
             <input type="hidden" name="ID" value="<% = arrAllPayDet(0,rowcounter) %>" />
             <input type="hidden" name="faculty" value="<% = rqFaculty %>"/>
             <tr>
             <td><input type="radio" name="Approve"  value="1" /></td>
             <td>Reviewed</td>
             </tr>
             <tr>
             <td><input type="radio" name="Approve" value="2" /></td>
             <td>Not Reviewed</td>
             </tr>
             <tr>
             <td colspan="2"><input type="submit" name="type" value="Submit"  /></td>
             </tr>
             </form>
             </table>
            </td>
            <% End if %>
            <% End If %>
           <%If arrAllPayDet(11,rowcounter) <> "" Then %>
           <td><% = arrAllPayDet(11,rowcounter) %><br />Date: <% = arrAllPayDet(12,rowcounter) %></td>
           <% Else %>
           <td align="center">------</td>
           <% End If %>
          </tr>
		  <% Next %>
        </table>
        <div>
          <p>&nbsp;</p>
        </div>
		<% 
		'If PaymentStatus is something then onlu we are displaying this table'
		'If (MonthofPay = CStr(Trim(PaymentMadeDate))) Then
		If Payment_Made_Date <> "" Then 
		
			If rqMonthofPay <> "" Then
			str = MonthName(Month(rqMonthofPay),3) & "-" & Year(rqMonthofPay)
			Else
			str = MonthName(Month(Now()),3) & "-" & Year(Now())
			End If
		
		strQuery1=" SELECT * FROM ITIL_finance_pay WHERE faculty = '"& rqFaculty &"' and month_of_pay = '"& str &"' ORDER BY payid desc"

	    Rs.open strQuery1, ConnObj			
		Do until Rs.EOF 

		  TotalAmount = TotalAmount + Rs("totalamount")
           Rs.Movenext
		   Loop
		   Rs.Close %>
        <div>
          <p><b>Paid Details</b></p>
        </div>
        <div>
          <p></p>
        </div>
        <table border="0" class="table1" width="100%">
          <tr>
            <td><b>Payment status</b></td>
            <td><b>Payment made date</b></td>
            <td><b>payment made by</b></td>
            <td><b>Payment Mode</b></td>
            <td><b>Transaction/Check number</b></td>
            <td><b>Total amount</b></td>
            <td><b>Edit</b></td>
          </tr>
          <tr>
            <td><% = str %></td>
            <td><% = Payment_Made_Date %></td>
            <td><% = Payment_Made_By %></td>
            <td><% = PayMode %></td>
			<td><% = CheckNo %></td>
             <td><% = Currency_Format_Front %>
              <% = TotalAmount %>
              <% = Currency_Format_Back %></td>

            <td><a href="fin.asp?faculty=<% = rqFaculty %>&action=editpay_det&payid=<% = PayId %>">Edit Payment Details</a></td>
          </tr>
        </table>
		<% 
			'EndIf is closing here - PaymentStatus is something then only we are displaying this table'
			End If %>
        </br>
        <div align="right"><br />
          <a href="payHis.asp?faculty=<% = rqFaculty %>" target="_blank">Payment History</a></div>
        </br>
		<% Else %>
		<div align="left"  style="margin:50px;"><p>No Payments</p></div>
		<% End If %>
        <% End If  %>
        <% ElseIf rqAction = "editFin" Then 
			
			   rqFinid = Request.QueryString("id")

			   strFinance = "SELECT * FROM ITIL_finance WHERE finid = '"&rqFinid&"'"
				
			   objRs2.Open strFinance,ConnObj
	%>
        <form  action="addEditPayment.asp"  method="post" onSubmit="return validate_form3(this)" >
          <% Do until objRs2.EOF %>
          <input type="hidden" name="finid" value="<%= objRs2("finid") %>"/>
          <input type="hidden" name="faculty" value="<%= objRs2("faculty") %>"/>
          <table>
            <tr>
              <td>Faculty:</td>
              <td><% 
			  rs1.Open "SELECT  firstname, lastname FROM ITIL_instructor WHERE emailid1 = '"& objRs2("faculty") &"'", ConnObj
			  Do Until rs1.EOF
				
				firstname = rs1("firstname")
				lastname = rs1("lastname")
				
				rs1.Movenext
			Loop
			rs1.Close
			%>
			<% = firstname %>&nbsp;<% = lastname %></td>
            </tr>
            <tr>
              <td>Payment Category:</td>
              <td><select name="paymentCategory">
                  <option value="Select">--Select--</option>
                  <option value="Reimbursement" <% If objRs2("pay_cat") = "Reimbursement" Then %> selected="selected" <% End If %>>Reimbursement</option>
                   <option value="TravelConveyanceCharges" <% If objRs2("pay_cat") = "TravelConveyanceCharges" Then %> selected="selected" <% End If %>>Travel and Conveyance charges</option>
                  <option value="Paymentforopenclass" <% If objRs2("pay_cat")="Paymentforopenclass" Then %> selected="selected" <% End If %> >Payment for open class</option>
                  <option value="Paymentforcorporateclass" <% If objRs2("pay_cat")="Paymentforcorporateclass" Then %> selected="selected" <% End If %> >Payment for corporate class</option>
                  <option value="Facultyincentiveformarketing" <% If objRs2("pay_cat")="Facultyincentiveformarketing" Then %> selected="selected" <% End If %> >Faculty incentive for marketing</option>
                  <option value="Consultancycharges" <% If objRs2("pay_cat")="Consultancycharges" Then %> selected="selected" <% End If %> >Consultancy charges</option>
                  <option value="Classroom Training for ITIL Study" <% If objRs2("pay_cat")="Classroom Training for ITIL Study" Then %> selected="selected" <% End If %> >Classroom Training for ITIL Study</option>
                </select>
              </td>
            </tr>
            <tr>
              <td>Details:</td>
              <td><textarea rows="10" cols="20"  name="details"><% =objRs2("details") %>
</textarea></td>
            </tr>
            <tr>
              <td>Amount:</td>
              <td><select name="Currency" id="Currency" style="width:75px;">
                  <option value="">--Select--</option>
                  <option <% if objRs2("currency") = "INR" Then %>  selected="selected"<% End If %> value="INR">INR</option>
                  <option <% if objRs2("currency") = "USD" Then %>  selected="selected"<% End If %> value="USD">USD</option>
                  <option <% if objRs2("currency") = "GBP" Then %>  selected="selected"<% End If %> value="GBP">GBP</option>
                  <option <% if objRs2("currency") = "AUD" Then %>  selected="selected"<% End If %> value="AUD">AUD</option>
                  <option <% if objRs2("currency") = "EUR" Then %>  selected="selected"<% End If %> value="EUR">EUR</option>
                  <option <% if objRs2("currency") = "SGD" Then %>  selected="selected"<% End If %> value="SGD">SGD</option>                  
                </select>
                &nbsp;
                <input type="text" value="<% =objRs2("amount") %>"  name="amount"/></td>
              <td></td>
            </tr>
            <tr>
            <% If Session("CRM_Country") = "United Kingdom" OR Session("CRM_Country") = "India" OR Session("CRM_Country") = "Australia" Then %>
            <td><% If Session("CRM_Country") = "United Kingdom" Then %>VAT<% ElseIf Session("CRM_Country") = "India" Then%>Tax<% ElseIf Session("CRM_Country") = "Australia" Then %>GST<% End If %> <br /><font style="font-size:10px">(If Applicable)</font></td>
            <td><input type="text" name="Tax" size="8" value="<% =objRs2("Tax") %>"/></td>
             <% End If %>
            </tr>
            <tr>
              <td></td>
              <td><input type="submit" name="action" value="Edit"/></td>
            </tr>
          </table>
          <% objRs2.Movenext
		   Loop
		   objRs2.Close %>
        </form>
        <% ElseIf rqAction = "payMade" Then 
			
			Dim payment_month
			
			'Retriving from payHis.asp page'
			payment_month = Request.Form("payment_month")
			
			
		
			If payment_month = "" Then
		
			'totaling the amount from ps_finance table
			'rs.open "select amount from ps_finance where faculty='" & rqFaculty & "' And CONVERT(varchar(2), DATEPART(month, added_date)) = '"& Cint(Month(Now())) &"'", connObj
			rs.open "select finid,amount,Tax,currency from ITIL_finance where faculty='" & rqFaculty & "' And status = '1' And (CONVERT(varchar(2), DATEPART(month, added_date)) = '"& Cint(Month(Now())) &"' AND DATEPART(yyyy, added_date) = '"& Cint(Year(Now())) &"')", connObj

			Else
			
			rqFaculty = Request.Form("faculty")
			'totaling the amount from ps_finance table
			'rs.open "select amount from ps_finance where faculty='" & rqFaculty & "' And CONVERT(varchar(2), DATEPART(month, added_date)) = '"& Cint(Month(payment_month)) &"'", connObj
			rs.open "select finid,amount,Tax,currency from ITIL_finance where faculty='" & rqFaculty & "' And status = '1' And (CONVERT(varchar(2), DATEPART(month, added_date)) = '"& Cint(Month(payment_month)) &"' AND DATEPART(yyyy, added_date) = '"& Cint(Year(payment_month)) &"')", connObj

			End If
			
			
			If (Not rs.BOF) AND (Not rs.EOF) Then
			rqID = rs("finid")
			rqCurrency = rs("currency")
			End If
			
			TotalAmount = 0
			TotalVat = 0
			
			Do Until rs.EOF
				
				TotalAmount = TotalAmount + rs("amount")
				TotalVat    = TotalVat + rs("Tax")
			rs.Movenext
			Loop
			rs.Close
		   FinalAmount = TotalAmount + TotalVat
			
		
		%>
        <form  action="addEditPayment.asp"  method="post" onSubmit="return validate_form1(this)" >
         <input type="hidden" name="Currency" value="<% = rqCurrency %>"/>
          <input type="hidden" name="faculty" value="<% = rqFaculty %>"/>
          <% If Session("CRM_Country") = "United Kingdom" OR Session("CRM_Country") = "India" OR Session("CRM_Country") = "Australia" Then %>
		  <input type="hidden" name="Amount" value="<% = FinalAmount %>"/>
		  <% Else %>
          <input type="hidden" name="Amount" value="<% = TotalAmount %>"/>
          <% End If %>
          <input type="hidden" name="ID" value="<% = rqID %>"/>
          <table border="0" width="50%" class="table2">
            <tr>
              <td><b>Faculty:</b></td>
              <td><% 
			  rs1.Open "SELECT  firstname, lastname, comp_name FROM ITIL_instructor WHERE emailid1 = '"& rqFaculty &"'", ConnObj
			  Do Until rs1.EOF
				
				firstname = rs1("firstname")
				lastname = rs1("lastname")
				companyname = rs1("comp_name")
				
				rs1.Movenext
			Loop
			rs1.Close
			
			facName = firstname & " " & lastname
			%>
			<% = facName %></td>
            </tr>
			<input type="hidden" name="facName" value="<% = facName %>"/>
			<input type="hidden" name="compName" value="<% = companyname %>"/>
			<input type="hidden" name="payment_month" value="<% = payment_month %>">
            <tr>
              <td><b>Amount:</b></td>
              <td><% = rqCurrency %> &nbsp; <% = TotalAmount %></td>
            </tr>
            <% If Session("CRM_Country") = "United Kingdom" OR Session("CRM_Country") = "India" OR Session("CRM_Country") = "Australia" Then %>
             <tr>
             <td><% If Session("CRM_Country") = "United Kingdom" Then %><b>VAT</b><% ElseIf Session("CRM_Country") = "India" Then%><b>Tax</b><% ElseIf Session("CRM_Country") = "Australia" Then %><b>GST</b><% End If %> <br /><font style="font-size:10px">(If Applicable)</font></td>
            <td><% = TotalVat %></td>
            </tr>
            <tr>
            <td><b>Total Amount</b></td>
            <td><% If Session("CRM_Country") = "United Kingdom" Then %>&#163; <% Else %>$ <% End If %><% = FinalAmount %></td>
            </tr>
            <% End If %>            
            <tr>
              <td><b>Payment Status:</b></td>
              <td><select name="pay_status">
                  <option value="">--Select--</option>
                  <option value="1">Paid</option>
                  <option value="0">Not Paid</option>
                </select>
              </td>
            </tr>
             <tr>
              <td><b>Payment Approve:</b></td>
              <td><select name="pay_Approve">
                  <option value="">--Select--</option>
                  <option value="1">Approved</option>
                  <option value="0">Not Approved</option>
                </select>
              </td>
            </tr>
             <tr>
			<td><b>Payment Mode</b></td>
			<td><select name="Pay_mode">
			    <option value="">-----Select-----</option>
				<option value="Check">Check</option>
				<option value="Online Transaction">Online Transaction</option>
                <option value="Wire Transfer">Wire Transfer</option>
				</select>
				</td> 
			</tr>
            <tr>
              <td><b>Payment Date:</b></td>
              <td><input type="text"  name="pay_date"/>&nbsp;(MM/DD/YYYY)</td>
            </tr>			
            <tr>
              <td><b>Transaction/Check number:</b></td>
              <td><input type="text"  name="Checkno"/></td>
            </tr>
            <tr>
              <td></td>
              <td><input type="submit" name="action" value="Submit" /></td>
            </tr>
          </table>
        </form>
        <% ElseIf rqAction = "editpay_det" Then 
		   	
			   Pay_Id = Request.QueryString("payid")
			   
			   Pay_Month = Request.QueryString("paymonth")
			   
			   'Response.Write("Pay_Month "& Pay_Month)
			   
			   streditpay_det = "SELECT pay_status, checkno, Pay_mode, pay_made_date FROM ITIL_finance_pay WHERE faculty = '"& rqFaculty &"' And payid = '"& Pay_Id &"'"
		
	  		   objRs4.Open streditpay_det,ConnObj
			   
			'totaling the amount from ps_finance table
			strPay_Amount = "SELECT amount,Tax FROM ITIL_finance where faculty='" & rqFaculty & "' And status = '1' And "
			If Pay_Month = "" Then
			'strPay_Amount = strPay_Amount & "CONVERT(varchar(2), DATEPART(month, added_date)) = '"& Cint(Month(Now())) &"'"
			strPay_Amount = strPay_Amount & "(CONVERT(varchar(2), DATEPART(month, added_date)) = '"& Cint(Month(Now())) &"' AND DATEPART(yyyy, added_date) = '"& Cint(Year(Now())) &"')"
			Else 
			'strPay_Amount = strPay_Amount & "CONVERT(varchar(2), DATEPART(month, added_date)) = '"& Pay_Month &"'"
			strPay_Amount = strPay_Amount & "(CONVERT(varchar(2), DATEPART(month, added_date)) = '"& Cint(Month(Pay_Month)) &"' AND DATEPART(yyyy, added_date) = '"& Cint(Year(Pay_Month)) &"')"
			End If
			'Response.Write(strPay_Amount)
			rs.Open strPay_Amount, ConnObj
			
			TotalAmount = 0
			
			Do Until rs.EOF
				
				TotalAmount = TotalAmount + rs("amount")
				TotalVat = TotalVat + rs("Tax")
			rs.Movenext
			Loop
			rs.Close
			
			FinalAmount = TotalAmount + TotalVat
			
		 %>
        <form  action="addEditPayment.asp"  method="post"  onSubmit="return validate_form4(this)"  >
          <% Do Until objRs4.EOF %>
          <input type="hidden" name="faculty" value="<% = rqFaculty %>"/>
		  <input type="hidden" name="payid" value="<% = Pay_Id %>" />
		  <% If Session("CRM_Country") = "United Kingdom" OR Session("CRM_Country") = "India" OR Session("CRM_Country") = "Australia" Then %>
		  <input type="hidden" name="Amount" value="<% = FinalAmount %>"/>
		  <% Else %>
          <input type="hidden" name="Amount" value="<% = TotalAmount %>"/>
          <% End If %>
          <table border="0"  width="50%" class="table2">
            <tr>
              <td><b>Faculty:</b></td>
              <td><% 
			  rs1.Open "SELECT  firstname, lastname FROM ITIL_instructor WHERE emailid1 = '"& rqFaculty &"'", ConnObj
			  Do Until rs1.EOF
				
				firstname = rs1("firstname")
				lastname = rs1("lastname")
				
				rs1.Movenext
			Loop
			rs1.Close
			%>
			<% = firstname %>&nbsp;<% = lastname %>
			</td>
            </tr>
            <tr>
              <td><b>Amount:</b></td>
              <td><% If Session("CRM_Country") = "United Kingdom" Then %>&#163; <% Else %>$ <% End If %> <% = TotalAmount %></td>
            </tr>
             <% If Session("CRM_Country") = "United Kingdom" OR Session("CRM_Country") = "India" OR Session("CRM_Country") = "Australia" Then %>
             <tr>
             <td><% If Session("CRM_Country") = "United Kingdom" Then %><b>VAT</b><% ElseIf Session("CRM_Country") = "India" Then%><b>TAx</b><% ElseIf Session("CRM_Country") = "Australia" Then %><b>GST</b><% End If %> <br /><font style="font-size:10px">(If Applicable)</font></td>
            <td><% = TotalVat %></td>
            </tr>
            <tr>
            <td><b>Total Amount</b></td>
            <td><% If Session("CRM_Country") = "United Kingdom" Then %>&#163; <% Else %>$ <% End If %><% = FinalAmount %></td>
            </tr>
            <% End If %> 			
            <%
		   
			PaymentStatus = objRs4("pay_status") 
			If PaymentStatus = 1 Then
			   str  = "Paid"
			Else
				str = "Not Paid"
			End If
		  
		  %>
            <tr>
              <td><b>Payment Status:</b></td>
              <td><select name="pay_status">
                  <option value="">--Select--</option>
                  <option value="1" <% If objRs4("pay_status") = "1"  Then %> selected="selected"<% End If %>>Paid</option>
                  <option value="0" <% If objRs4("pay_status") = "0"  Then %> selected="selected"<% End If %>>Not Paid</option>
                </select>
              </td>
            </tr>
            <tr>
			<td><b>Payment Mode</b></td>
			<td><select name="Pay_mode">
			    <option value="">-----Select-----</option>
				<option value="Check" <% If objRs4("Pay_mode")= "Check" Then %>selected="selected" <% End If %>>Check</option>
				<option value="Online Transaction" <% If objRs4("Pay_mode")="Online Transaction" Then %>selected="selected" <% End If %>>Online Transaction</option>
                <option value="Wire Transfer" <% If objRs4("Pay_mode")="Wire Transfer" Then %>selected="selected" <% End If %>>Wire Transfer</option>
				</select>
				</td> 
			</tr>
            <tr>
              <td><b>Payment Date:</b></td>
              <td><input type="text"  name="pay_date" value="<% = objRs4("pay_made_date") %>"/>&nbsp;(MM/DD/YYYY)</td>
            </tr>           
            <tr>
              <td><b>Transaction/Check number:</b></td>
              <td><input type="text"  name="Checkno" value="<% = objRs4("checkno") %>"/></td>
            </tr>
            
            <tr>
              <td></td>
              <td><input type="submit" name="action" value="Edit Payment Detail" /></td>
            </tr>
          </table>
          <% objRs4.Movenext
		     Loop
		     objRs4.Close %>
        </form>
        <% End If %>
        </fieldset>
   
      </div>
      <!-- // #main -->
      <div class="clear"></div>
    </div>
    <!-- // #container -->
  </div>
  <!-- // #containerHolder -->
  <p id="footer">&nbsp;</p>
</div>
<!-- // #wrapper -->
</body>
</html>
<% End If %>
