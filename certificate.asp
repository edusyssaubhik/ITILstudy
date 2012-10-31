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
<table id="Table_01" width="793" height="613" border="0" cellpadding="0" cellspacing="0" align="center">

<tr>
		<td colspan="5">
			<img src="images/cert/ITIL_01.jpg" alt="" width="793" height="215"></td>
	</tr>
	<tr>
		<td rowspan="4">
			<img src="images/cert/ITIL_02.jpg" alt="" width="159" height="398"></td>
		<td colspan="3" width="475" height="42" align="center" id="user"><% = Session("FirstName") %>&nbsp;<% = Session("LastName") %></td>

		<td rowspan="4">
			<img src="images/cert/ITIL_04.jpg" alt="" width="159" height="398"></td>
	</tr>
	<tr>
		<td colspan="3">
			<img src="images/cert/ITIL_05.jpg" alt="" width="475" height="118"></td>
	</tr>
	<tr>
		<td rowspan="2">

			<img src="images/cert/ITIL_06.jpg" alt="" width="21" height="238"></td>
		<td width="433" align="center" height="32"><span id="date">Granted : <% = MonthName(Month(Now())) & " " & Day(Now()) &", "&  Year(Now()) %></span>
		  </td>
		<td rowspan="2">
			<img src="images/cert/ITIL_08.jpg" alt="" width="21" height="238"></td>
	</tr>
	<tr>
		<td>

			<img src="images/cert/ITIL_09.jpg" alt="" width="433" height="206"></td>
	</tr>

</table>
</body>
</html>