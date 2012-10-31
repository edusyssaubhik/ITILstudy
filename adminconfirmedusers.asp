<HTML>
<HEAD>
</HEAD>
<BODY><font="arial" size="3">
<!--#include virtual="/includes/connection.asp"-->
	<%
	Dim payer_email, first_name, address_country, payment_gross
	
	Set rsQues = Server.CreateObject("ADODB.Recordset")
	rsQues.ActiveConnection = ConnObj
	rsQues.Open "SELECT payer_email, pass, item_name, first_name, last_name,custom,ebay_address_id, kno_passed, address_country, payment_gross, verify_sign,date_entered, date_valid, item_number, dategranted, onlinecertissued, onlinecertdate, phycertissued, phycertdate, phycertdet from PaypalDB where paypal_address_id <> 'BB' order by ID DESC"
	
	%>
	 
	<table border="1" padding="4" spacing="4" align="left" width="75%">
	<tr><td colspan="20"><div style="background-color:green; height:15px;" ></div></td></tr>
	<%
	If not rsQues.BOF then%>
		<tr><td>&nbsp;</td><td>payer_email</td><td>Password</td><td>item_name</td><td><B>first_name</B></td><td><B>last_name</B></td><td><B>Company Name</B></td><td><B>Phone Number</B></td><td>kno_passed<td>address_country</td><td>payment_gross</td><td>verify_sign</td><td>date_entered</td><td>date_valid</td><td>item_number</td><td>dategranted</td><td>onlinecertissued</td><td>onlinecertdate</td><td>phycertissued</td><td>phycertdate</td><td>phycertdet</td></tr>
	<%
		Do While Not rsQues.EOF %>
			<tr><td bgcolor="green" width="10px">&nbsp;</td><td><B><%=rsQues("payer_email")%></B></td><td><B><%=rsQues("pass")%></B></td><td><B><%=rsQues("item_name")%></B></td><td><%=rsQues("first_name")%></td><td><%=rsQues("last_name")%></td><td><%=rsQues("custom")%></td><td><%=rsQues("ebay_address_id")%></td><td><%=rsQues("kno_passed")%></td><td><%=rsQues("address_country")%></td><td><%=rsQues("payment_gross")%></td><td><%=rsQues("verify_sign")%></td><td><%=rsQues("date_entered")%></td><td><%=rsQues("date_valid")%></td><td><%=rsQues("item_number")%></td><td><%=rsQues("dategranted")%></td><td><%=rsQues("onlinecertissued")%></td><td><%=rsQues("onlinecertdate")%></td><td><%=rsQues("phycertissued")%></td><td><%=rsQues("phycertdate")%></td><td><%=rsQues("phycertdet")%></td></tr>
		<%rsQues.MoveNext
		Loop
		rsQues.close%>
	
	<%
	else
	end if  
	%></table><%
	rsQues.Open "SELECT payer_email, pass, item_name, first_name, last_name,custom,ebay_address_id, kno_passed, address_country, payment_gross, verify_sign,date_entered, date_valid, item_number, dategranted, onlinecertissued, onlinecertdate, phycertissued, phycertdate, phycertdet from PaypalDB where paypal_address_id = 'BB' order by ID DESC"
	
	%>
	<br><br> 
	<table border="1" padding="4" spacing="4" align="left" width="75%">
	<tr><td colspan="21"><div style="background-color:black; height:15px;" ></div></td></tr>
	<%
	If not rsQues.BOF then%>
		<tr><td>&nbsp;</td><td>payer_email</td><td>Password</td><td>item_name</td><td><B>first_name</B></td><td><B>last_name</B></td><td><B>Company Name</B></td><td><B>Phone Number</B></td><td>kno_passed<td>address_country</td><td>payment_gross</td><td>verify_sign</td><td>date_entered</td><td>date_valid</td><td>item_number</td><td>dategranted</td><td>onlinecertissued</td><td>onlinecertdate</td><td>phycertissued</td><td>phycertdate</td><td>phycertdet</td></tr>
	<%
		Do While Not rsQues.EOF %>
			<tr><td bgcolor="black" width="10px">&nbsp;</td><td><B><%=rsQues("payer_email")%></B></td><td><B><%=rsQues("pass")%></B></td><td><B><%=rsQues("item_name")%></B></td><td><%=rsQues("first_name")%></td><td><%=rsQues("last_name")%></td><td><%=rsQues("custom")%></td><td><%=rsQues("ebay_address_id")%></td><td><%=rsQues("kno_passed")%></td><td><%=rsQues("address_country")%></td><td><%=rsQues("payment_gross")%></td><td><%=rsQues("verify_sign")%></td><td><%=rsQues("date_entered")%></td><td><%=rsQues("date_valid")%></td><td><%=rsQues("item_number")%></td><td><%=rsQues("dategranted")%></td><td><%=rsQues("onlinecertissued")%></td><td><%=rsQues("onlinecertdate")%></td><td><%=rsQues("phycertissued")%></td><td><%=rsQues("phycertdate")%></td><td><%=rsQues("phycertdet")%></td></tr>
		<%rsQues.MoveNext
		Loop
		rsQues.close%>
	 
	<%
	else
	end if
  %></table><%
	set rsQues=Nothing%>
<!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>



