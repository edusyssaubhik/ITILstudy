<%
'======================================================='
'Written By : Bharath'
'Created Date : 31/03/2011'
'Modified By : Bharath'
'Last UpDated : 31/03/2011'
'Description :'
'Generating a certificate for Foundation/Practitioner/Foundation and Practitioner'
'======================================================='
%>
<% 
If Session("UserID")=""  Then 
	Response.Redirect("adminupdatedb.asp")
End If
%>
<html>
<head>
<title>ITIL Certificate</title>
<% Dim  payer_email

payer_email=Session("PayerEmail")
rqCert_Date = Request.Form("Cert_Date")

If(Request.Form("FirstName")="") Then
Else
Session("FirstName")=Request.Form("FirstName")
Session("LastName")=Request.Form("LastName")
Session("State")="verified"
End If
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
<!--

#date {
	font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size:17px;
	font-weight:bold;
	padding-left: 2px;
	margin-top: -3px;
	display: block;
	color: #333;
}
#user {
	font-family:"monotype Corsiva";
	font-size:28px;
	font-weight:bold;
}
-->
</style>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- Save for Web Slices (ITIL.psd) -->
<table id="Table_01" width="793" height="613" border="0" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td colspan="5">
			<img src="/images/cert/ITIL_01.png" width="793" height="210" alt=""></td>
	</tr>
	<tr>
		<td rowspan="4">
			<img src="/images/cert/ITIL_02.png" width="46" height="403" alt=""></td>
		<td colspan="3" width="701" height="42"  align="center" valign="top" id="user"><% = Session("FirstName") %>&nbsp;<% = Session("LastName") %></td>
		<td rowspan="4">
			<img src="/images/cert/ITIL_04.png" width="46" height="403" alt=""></td>
	</tr>
	<tr>
		<td colspan="3">
			<img src="/images/cert/ITIL_05.png" width="701" height="123" alt=""></td>
	</tr>
	<tr>
		<td rowspan="2">
			<img src="/images/cert/ITIL_06.png" width="134" height="238" alt=""></td>
		<td width="433" height="32" align="center"><span id="date">Granted : <% = MonthName(Month(rqCert_Date)) & " " & Day(rqCert_Date) &", "&  Year(rqCert_Date) %></span></td>
		<td rowspan="2">
			<img src="/images/cert/ITIL_08.png" width="134" height="238" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="/images/cert/ITIL_09.png" width="433" height="206" alt=""></td>
	</tr>
</table>
<!-- End Save for Web Slices -->
</body>
</html>