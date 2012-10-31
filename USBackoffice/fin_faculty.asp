<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<% 
If Session("USBUserId") = "" Then
	Response.Redirect("login.asp")
Else
%>
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<%
'Written By : Priyanka and Savita'
'Created Date: 22/04/2010'
'Modified By : Praveen 
'Last Updated Date: 06/09/2011'
'Description :'
'Purpose : '

'Declare The Variables'
Dim objRs, facName ,strQuery
Dim strFinance, rqFinid, rqFaculty, strQuery1,rqPay_Status
Dim getMonth,todayDate,strQuery4
Dim rs, Amount, PaymentStatus, str,TotalAmount
Amount=0
Dim Currency_Format_Front, Currency_Format_Back

Set objRs  = Server.CreateObject("ADODB.Recordset")
Set Rs  = Server.CreateObject("ADODB.Recordset")

'Currency Format Display Functions'
Currency_Format_Front = CurrencyFormat_Front(Session("CRM_Country"))
Currency_Format_Back = CurrencyFormat_Back(Session("CRM_Country"))

rqFaculty = Request.Form("faculty")
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
      <h2><a href="home.asp">Home</a> &raquo; <a href="fin.asp" class="active">Finance</a></h2>
      <div id="main">
        <h3><% = MonthName(Month(date())) %> Payments</h3>
        <fieldset>

      <% 
	 strQuery=" SELECT * FROM ITIL_finance WHERE faculty = '"& Session("USBUserId")&"' and status = '1' and (CONVERT(varchar(2), DATEPART(month, added_date)) = '"& Cint(Month(Now())) &"' AND DATEPART(yyyy, added_date) = '"& Cint(Year(Now())) &"')"
	
		objRs.open strQuery, ConnObj	
      %>
      <table border="0" class="table1" cellpadding="5" width="55%">
        <tr>
          <td><b>Payment Category</b></td>
          <td><b>Details</b></td>
           <td><b>Amount</b></td>
        </tr>
        <% Do until objRs.EOF %>
        <tr>
          <td><% = objRs("pay_cat") %></td>
          <td><% = objRs("details") %></td>
          <td><% = Currency_Format_Front %><% = objRs("amount") %><% = Currency_Format_Back %></td>
        </tr>
        
		<% Amount = Amount + objRs("amount")
           objRs.Movenext
		   Loop
		   objRs.Close %>
		<tr>
			<td colspan="2"><div align="right">Total: </div></td>
			<td><% = Currency_Format_Front %><% = Amount %><% = Currency_Format_Back %></td>
		</tr>
      </table>
      <% end if %>
	  <% 
	  
	  'strQuery1=" SELECT * FROM ps_finance_pay WHERE faculty = '"& Session("USBUserId")&"' and (CONVERT(varchar(2), DATEPART(month, pay_made_date)) = '"& Cint(Month(Now())) &"'  AND DATEPART(yyyy, pay_made_date) = '"& Cint(Year(Now())) &"')"
	  str = MonthName(Month(Now()),3) & "-" & Year(Now())
	  strQuery1=" SELECT * FROM ITIL_finance_pay WHERE faculty = '"& Session("USBUserId")&"' and month_of_pay = '"& str &"' ORDER BY payid desc"

      Rs.open strQuery1, ConnObj	
      %>
      </br><br />
	   <table border="0" class="table1" cellpadding="5" width="55%">
        <tr>
          
          <td><b>Date of payment</b></td>
          <td><b>Mode of pay</b></td>
           <td><b>Status</b></td>
        <td><b>Total Amount</b></td>
        </tr>
        <% Do until Rs.EOF %>
        <tr>
         <%
		 PaymentStatus     = Rs("pay_status")  
		 If PaymentStatus = 1 Then
			   		str  = "Paid"
				Else
					str = "Not Paid"
				End If
		%>
		  <% If str = "Paid" Then %>
       <td><% = Rs("pay_made_date") %></td>
		  <% Else %>
		  <td>&nbsp;</td>
		  <% End If %>
          <td><% = Rs("Pay_mode") %></td>
          <td><% = str %></td> 
		  <td><% = Currency_Format_Front %><% =  Rs("totalamount")  %><% = Currency_Format_Back %></td> 
         	
        </tr>
		
		<%  TotalAmount = TotalAmount + Rs("totalamount")
           Rs.Movenext
		   Loop
		   Rs.Close %>
		    <tr>
		 <td colspan="3"><div align="right">Total: </div></td>
			<td><% = Currency_Format_Front %><% = Int(TotalAmount) %><% = Currency_Format_Back %></td>  
		</tr>
      </table>
	  
	      </br><br />
		 
      <%' end if %>

      <div align="center"><br><br><a href="payHis.asp?faculty=<% =  Session("USBUserId") %>" target="_blank">Payment History</a></div>
      </br>
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
