<html>
<head>
<!--#include virtual="/includes/connection.asp"-->
</head>
<BODY>
<font="arial" size="3">
<%
Dim payer_email, first_name, address_country, payment_gross

last_name=Request.Form("last_name")


Set rsQues = Server.CreateObject("ADODB.Recordset")

rsQues.ActiveConnection = ConnObj

rsQues.Open "SELECT DISTINCT ID, payer_email, first_name, last_name, custom, address_owner, address_city, ebay_address_id, date_entered, item_name, payment_gross from Paypaldb WHERE last_name Like '%"&last_name&"%' order by ID DESC, payment_gross DESC "
%>
<table border="1" cellpadding="4" cellspacing="0" align="left" width="75%">
  <tr>
    <td>Sr No</td>
    <td><B>Name</B></td>
    <td><B>Company Name</B></td>
    <td><B>EmailID</B></td>
    <td><B>IP/Location</B></td>
    <td><B>Phone Number</B></td>
    <td><B>Enrollment Date</B></td>
    <td><B>Course</B></td>
    <td><B>Payment</B></td>
  </tr>
  <%
SrNo=1%>
  <%
If not rsQues.BOF then
Do While Not rsQues.EOF%>
  <tr>
    <td><%=SrNo%></td>
    <td><%=rsQues("first_name")%>&nbsp;<%=rsQues("last_name")%></td>
    <td><%=rsQues("custom")%></td>
	<td><form name="one" method="post" action="admintempdisplayemail.asp"><input type="hidden" name="EmailID" value="<%=rsQues("payer_email")%>"><input type="submit" value="View Email"></form></td>

    <td><%=rsQues("address_owner")%></td>
    <td><%=rsQues("ebay_address_id")%></td>
    <td><%=rsQues("date_entered")%></td>
    <td><%=rsQues("item_name")%></td>
    <td><%=rsQues("payment_gross")%></td>
  </tr>
  <%rsQues.MoveNext
		SrNo=SrNo+1
		Loop%>
</table>
<%
else
end if
ConnObj.Close
set rsQues=Nothing
set ConnObj = Nothing
%>
</body>
</html>
