<%
'======================================================='
'Written By : savita'
'Created Date : 11/10/2011'
'Modified By : Bharath'
'Last UpDated : 06/01/2012'
'Description :'
'Generating a certificate for Foundation/Practitioner/Foundation and Practitioner'
'======================================================='
%>
<% 
If Session("FirstName") = "" Then 
	Response.Redirect("/memberlogin.asp")
End If
%>
<html>
<head>
<title>ITIL Certificate</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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
<!-- Save for Web Slices (ITIL - 45.psd) -->
<table id="Table_01" width="793" height="613" border="0" cellpadding="0" cellspacing="0" align='center'>

<tr>
		<td colspan="3">
			<img src="/images/cert/OSA/OSAP_01.png" width="800" height="210" alt=""></td>
	</tr>
	<tr>
		<td rowspan="4">
			<img src="/images/cert/OSA/OSAP_02.png" width="20" height="408" alt=""></td>
		<td width="760" height="42" align="center" valign="top" id="user"><% = Session("FirstName") %>&nbsp;<% = Session("LastName") %></td>
		<td rowspan="4">
			<img src="/images/cert/OSA/OSAP_04.png" width="20" height="408" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="/images/cert/OSA/OSAP_05.png" width="760" height="132" alt=""></td>
	</tr>
	<tr>
		<td width="760" height="34" align="center"><span id="date">Granted : <% = MonthName(Month(Now())) & " " & Day(Now()) &", "&  Year(Now()) %></span></td>
	</tr>
	<tr>
		<td>
			<img src="/images/cert/OSA/OSAP_07.png" width="760" height="200" alt=""></td>
	</tr>
    	
</table>

</body>
</html>