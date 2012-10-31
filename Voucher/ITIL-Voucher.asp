<html>
<head>
<title>ITIL Voucher</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
#nameOfTheUser {
	font-family: "bookman Old Style";
	font-size: 13px;
	color: #000;
	text-align: center;
	vertical-align: middle;
	position: absolute;
	width: 229px;
	top: 145px;
	height: 20px;
	margin-top: 5px;
	margin-bottom: 5px;
}
#V-code{
	font-family: "bookman Old Style";
	font-size: 13px;
	color: #000;
	text-align: center;
	vertical-align: middle;
	position: absolute;
	width: 111px;
	top: 199px;
	height: 20px;
	margin-top: 5px;
	margin-bottom: 5px;
}

#valid{
	font-family: "bookman Old Style";
	font-size: 13px;
	color: #000;
	text-align: left;
	vertical-align: middle;
	position: absolute;
	width: 84px;
	top: 199px;
	height: 20px;
	margin-bottom: 5px;
	margin-top: 5px;
	padding-left: 3px;
}

#country{
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	color: #333;
	text-align: left;
	vertical-align: middle;
	position: absolute;
	width: 174px;
	height: 21px;
	top: 404px;
}
-->
</style>
</head>
<!--#include virtual="/includes/connection.asp"-->

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%

Dim vocher_Number1,vocher_ValidDate1,objRs,RsVocher1,strQuery,strVoucher1,payer_id

Set objRs = server.CreateObject("ADODB.recordset")

strQuery = "SELECT TOP 1 id FROM PaypalDB WHERE payer_email='"&Session("PayerEmail")&"' ORDER BY id DESC"
	objRs.open strQuery,ConnObj
	
	If Not objRs.EOF Then
		payer_id = objRs("id")

	End If
	objRs.Close
	
				Set RsVocher1 = server.CreateObject("ADODB.recordset")

strVoucher1 = "SELECT vocherNo, vocherValidDate FROM PaypalDB where id ='"&payer_id&"'"
			
					RsVocher1.Open strVoucher1, ConnObj
					
					Do Until RsVocher1.EOF
						
							vocher_Number1 = RsVocher1("vocherNo")
							vocher_ValidDate1 = RsVocher1("vocherValidDate")
					
					RsVocher1.Movenext
					Loop
					RsVocher1.Close


%>
<table id="Table_01" width="600" height="684" border="0" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td colspan="9">
			<img src="images/ITIL-Voucher_01.png" width="600" height="149" alt=""></td>
	</tr>
	<tr>
		<td rowspan="6">
			<img src="images/ITIL-Voucher_02.png" width="199" height="534" alt=""></td>
		<td colspan="5">
        <div id="nameOfTheUser"><%=Session("FirstName")%>&nbsp;<%=Session("LastName")%></div>
<img src="images/ITIL-Voucher_03.png" width="234" height="24" alt=""></td>
		<td colspan="3" rowspan="2">
			<img src="images/ITIL-Voucher_04.png" width="167" height="54" alt=""></td>
	</tr>
	<tr>
		<td colspan="5">
			<img src="images/ITIL-Voucher_05.png" width="234" height="30" alt=""></td>
	</tr>
	<tr>
		<td colspan="2" rowspan="2">
			<img src="images/ITIL-Voucher_06.png" width="48" height="202" alt=""></td>
		<td colspan="2">
        <div id="V-code">ITIL<%=vocher_Number1%></div>
<img src="images/ITIL-Voucher_07.png" width="115" height="24" alt=""></td>
		<td colspan="2" rowspan="4">
			<img src="images/ITIL-Voucher_08.png" width="91" height="480" alt=""></td>
		<td>
      <div id="valid"><%=vocher_ValidDate1%></div>
    <img src="images/ITIL-Voucher_09.png" width="71" height="24" alt=""></td>
		<td rowspan="4">
			<img src="images/ITIL-Voucher_10.png" width="76" height="480" alt=""></td>
	</tr>
	<tr>
		<td colspan="2">
			<img src="images/ITIL-Voucher_11.png" width="115" height="178" alt=""></td>
		<td rowspan="3">
			<img src="images/ITIL-Voucher_12.png" width="71" height="456" alt=""></td>
	</tr>
	<tr>
		<td rowspan="2">
			<img src="images/ITIL-Voucher_13.png" width="45" height="278" alt=""></td>
		<td colspan="2">
        	<div id="country"><%=Session("CountryOrigin")%></div>
			<img src="images/ITIL-Voucher_14.png" width="72" height="14" alt=""></td>
		<td rowspan="2">
			<img src="images/ITIL-Voucher_15.png" width="46" height="278" alt=""></td>
	</tr>
	<tr>
		<td colspan="2">
			<img src="images/ITIL-Voucher_16.png" width="72" height="264" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="images/spacer.gif" width="199" height="1" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="45" height="1" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="3" height="1" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="69" height="1" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="46" height="1" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="71" height="1" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="20" height="1" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="71" height="1" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="76" height="1" alt=""></td>
	</tr>
</table>
</body>
</html>