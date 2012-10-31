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
 
payer_email=Request.Form("payer_email")

Set rsQues = Server.CreateObject("ADODB.Recordset")

rsQues.ActiveConnection = ConnObj
rsQues.Open "SELECT email, coursedetails, firstname, lastname, phoneno, nameofemployeer, courseid, country, coursedate, dateofenrollment, checkreceived from ITIL_enrolledusers WHERE email= '"&payer_email&"' order by ID DESC"

%>
	<table border="1" padding="4" spacing="4" align="left" width="75%">
<%
If not rsQues.BOF then%>
<tr><td>Email</td><td>course Name</td><td><B>First Name</B></td><td><B>Last Name</B></td><td><B>Company Name</B></td><td><B>Phone Number</B></td><td>Courseid</td><td>Country</td><td>Coursedate</td><td>dateofenrollment</td><td>Checkreceived</td></tr>
<%
Do While Not rsQues.EOF %>
<tr><td><B><%=rsQues("email")%></B></td><td><B><%=rsQues("coursedetails")%></B></td><td><%=rsQues("firstname")%></td><td><%=rsQues("lastname")%></td><td><%=rsQues("nameofemployeer")%></td><td><%=rsQues("phoneno")%></td><td><%=rsQues("courseid")%></td></td><td><%=rsQues("country")%></td><td><%=rsQues("coursedate")%></td><td><%=rsQues("dateofenrollment")%></td><td><%=rsQues("checkreceived")%></td></tr>
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