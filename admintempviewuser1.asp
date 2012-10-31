<html>
<head>
<TITLE>ITILstudy.com Economical, Effective</TITLE>
<META http-equiv=Content-type content="text/html; charset=ISO-8859-1">
<META
content="ITILstudy.com offers Online Economical, Effective, Guides on Different Knowledge Areas"
name=description>
<META
content="ITILstudy.com offers Online Economical, Effective, Guides on Different Knowledge Areas"
name=keywords>
</head>
<BODY><font="arial" size="3">
<!--#include virtual="/includes/connection.asp"-->
<%
Dim payer_email, first_name, address_country, payment_gross

 
last_name=Request.Form("last_name")

Set rsQues = Server.CreateObject("ADODB.Recordset")
rsQues.ActiveConnection = ConnObj
rsQues.Open "SELECT payer_email, pass, item_name, first_name, last_name,custom,ebay_address_id, kno_passed, address_country, payment_gross, verify_sign,date_entered, date_valid, item_number from PaypalDB WHERE last_name= '"&last_name&"' order by ID DESC"

%>
	<table border="1" padding="4" spacing="4" align="left" width="75%">
<%
If not rsQues.BOF then%>
<tr><td>payer_email</td><td>Password</td><td>item_name</td><td><B>first_name</B></td><td><B>last_name</B></td><td><B>Company Name</B></td><td><B>Phone Number</B></td><td>kno_passed</td><td>address_country</td><td>payment_gross</td><td>date_entered</td><td>date_valid</td><td>item_number</td></tr>
<%
Do While Not rsQues.EOF %>
<tr><td><B><%=rsQues("payer_email")%></B></td><td><B><%=rsQues("pass")%></B></td><td><B><%=rsQues("item_name")%></B></td><td><%=rsQues("first_name")%></td><td><%=rsQues("last_name")%></td><td><%=rsQues("custom")%></td><td><%=rsQues("ebay_address_id")%></td><td><%=rsQues("kno_passed")%></td><td><%=rsQues("address_country")%></td><td><%=rsQues("payment_gross")%></td><td><%=rsQues("date_entered")%></td><td><%=rsQues("date_valid")%></td><td><%=rsQues("item_number")%></td></tr>
		<%rsQues.MoveNext
		Loop%>
</table>
<%
else
end if
set rsQues=Nothing%>
<!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>