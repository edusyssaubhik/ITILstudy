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
Dim payer_email, first_name, address_country, payment_gross, company_name, company_name1, company_name2, SrNo

company_name=Request.Form("company_name")
company_name1=Request.Form("company_name1")
company_name2=Request.Form("company_name2")
 
 Set rsQues = Server.CreateObject("ADODB.Recordset")
rsQues.ActiveConnection = ConnObj

If (company_name1="") Then
rsQues.Open "SELECT payer_email, item_name, first_name, last_name,custom,ebay_address_id, kno_passed, address_country, payment_gross, verify_sign,date_entered, date_valid, item_number from PaypalDB WHERE payer_email LIKE '%"&company_name&"%' OR custom LIKE '%"&company_name&"%' order by payment_gross DESC"
Else
If(company_name2="") Then
rsQues.Open "SELECT payer_email, pass, item_name, first_name, last_name,custom,ebay_address_id, kno_passed, address_country, payment_gross, verify_sign,date_entered, date_valid, item_number from PaypalDB WHERE payer_email LIKE '%"&company_name&"%' OR custom LIKE '%"&company_name&"%' OR payer_email LIKE '%"&company_name1&"%' OR custom LIKE '%"&company_name1&"%' order by payment_gross DESC"
Else
rsQues.Open "SELECT payer_email, pass, item_name, first_name, last_name,custom,ebay_address_id, kno_passed, address_country, payment_gross, verify_sign,date_entered, date_valid, item_number from PaypalDB WHERE payer_email LIKE '%"&company_name&"%' OR custom LIKE '%"&company_name&"%' OR payer_email LIKE '%"&company_name1&"%' OR custom LIKE '%"&company_name1&"%' OR payer_email LIKE '%"&company_name2&"%' OR custom LIKE '%"&company_name2&"%' order by payment_gross DESC"
End If
End If
SrNo=1
%>
	<table border="1" padding="4" spacing="4" align="left" width="75%">
<%
If not rsQues.BOF then%>
<tr><td>no</td><td>payer_email</td><td>item_name</td><td><B>first_name</B></td><td><B>last_name</B></td><td><B>Company Name</B></td><td>payment_gross</td><td><B>Phone Number</B></td><td>kno_passed<td>address_country</td><td>date_entered</td><td>date_valid</td><td>item_number</td></tr>
<%
Do While Not rsQues.EOF %>
<tr><td><B><%=SrNo%></B></td><td><B><%=rsQues("payer_email")%></B></td><td><B><%=rsQues("item_name")%></B></td><td><%=rsQues("first_name")%></td><td><%=rsQues("last_name")%></td><td><%=rsQues("custom")%></td><td><%=rsQues("payment_gross")%></td><td><%=rsQues("ebay_address_id")%></td><td><%=rsQues("kno_passed")%></td><td><%=rsQues("address_country")%></td><td><%=rsQues("date_entered")%></td><td><%=rsQues("date_valid")%></td><td><%=rsQues("item_number")%></td></tr>
		<%rsQues.MoveNext
SrNo=SrNo+1
		Loop%>
</table>
<%
else
end if
 
set rsQues=Nothing%>
<!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>