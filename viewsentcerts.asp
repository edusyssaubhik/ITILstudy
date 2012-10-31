<HTML>
<HEAD>
</HEAD>
<BODY><font="arial" size="3">
<!--#include virtual="/includes/connection.asp"-->
<%
Dim payer_email, first_name, address_country, payment_gross, color1, colorred, colorblue, colorgreen, colorcyan, colorblack

colorred="Red"
colorblue="Blue"
colorcyan="Cyan"
colorgreen="Green"
colorblack="Black"

Set rsQues = Server.CreateObject("ADODB.Recordset")

' Color = RED
rsQues.ActiveConnection = ConnObj

rsQues.Open "SELECT payer_email, first_name, last_name,custom, ebay_address_id, kno_passed, address_street, address_city, address_state, address_country, address_zip, date_entered, date_valid, item_number, color, dategranted, onlinecertissued, onlinecertdate, phycertissued, phycertdate, phycertdet from PaypalDB Where color='"&colorgreen&"' and paypal_address_id <> 'BB' order by ID DESC"

%><br><br>
<div style="background-color:green; height:15px; width:100%"></div><br><br>
<table><tr><td><B>	Course 311 or 103 (Online Certificates only sent) <BR><BR>
Course 312 or 104 (Physical certificates and online certificates sent)</B><BR><BR>
<table border="1" padding="4" spacing="4" align="left" width="75%">
<%
If not rsQues.BOF then

%>
<tr><td>&nbsp;</td><td>Status of certificate</td><td>payer_email</td><td>color</td><td><B>Name</B></td><td>dategranted</td><td><B>Company Name</B></td><td><B>Phone Number</B></td><td>Address</td><td>kno_passed</td><td>date_entered</td><td>date_valid</td><td>item_number</td><td>onlinecertissued</td><td>onlinecertdate</td><td>phycertissued</td><td>phycertdate</td><td>phycertdet</td></tr>
<%
Do While Not rsQues.EOF %>

 				<tr><td bgcolor="green" width="10px">&nbsp;</td><td>All Certificates issued<BR># 311 or 103 <BR></td><td><font color="Green"><B><%=rsQues("payer_email")%></B></font></td><td><font color="Green"><B><%=rsQues("color")%></B></font></td><td><font color="Green"><%=rsQues("first_name")%> &nbsp;<%=rsQues("last_name")%></font></td><td><%=rsQues("dategranted")%></td><td><%=rsQues("custom")%></td><td><B><%=rsQues("ebay_address_id")%></B></td><td><%=rsQues("address_street")%><BR><%=rsQues("address_city")%><BR><%=rsQues("address_state")%><BR><%=rsQues("address_country")%> - <%=rsQues("address_zip")%></td><td><%=rsQues("kno_passed")%></td><td><%=rsQues("date_entered")%></td><td><%=rsQues("date_valid")%></td><td><%=rsQues("item_number")%></td><td><%=rsQues("onlinecertissued")%></td><td><%=rsQues("onlinecertdate")%></td><td><%=rsQues("phycertissued")%></td><td><%=rsQues("phycertdate")%></td><td><%=rsQues("phycertdet")%></td></tr>


		<%rsQues.MoveNext
		Loop
		rsQues.close%>
</table></td></tr></table>
<%
else
end if
%>

<div style="background-color:black; height:15px; width:100%"></div>

<%
' Color = RED
 

rsQues.Open "SELECT payer_email, first_name, last_name,custom, ebay_address_id, kno_passed, address_street, address_city, address_state, address_country, address_zip, date_entered, date_valid, item_number, color, dategranted, onlinecertissued, onlinecertdate, phycertissued, phycertdate, phycertdet from PaypalDB Where color='"&colorgreen&"' and paypal_address_id = 'BB' order by ID DESC"

%>
<table><tr><td><B>	Course 101 (Online Certificates only sent) <BR><BR>
Course 102 (Physical certificates and online certificates sent)</B><BR><BR>
<table border="1" padding="4" spacing="4" align="left" width="75%">
<%
If not rsQues.BOF then

%>
<tr><td>&nbsp;</td><td>Status of certificate</td><td>payer_email</td><td>color</td><td><B>Name</B></td><td>dategranted</td><td><B>Company Name</B></td><td><B>Phone Number</B></td><td>Address</td><td>kno_passed</td><td>date_entered</td><td>date_valid</td><td>item_number</td><td>onlinecertissued</td><td>onlinecertdate</td><td>phycertissued</td><td>phycertdate</td><td>phycertdet</td></tr>
<%
Do While Not rsQues.EOF %>

 				<tr><td bgcolor="black" width="10px">&nbsp;</td><td>All Certificates issued<BR># 101 <BR></td><td><font color="Green"><B><%=rsQues("payer_email")%></B></font></td><td><font color="Green"><B><%=rsQues("color")%></B></font></td><td><font color="Green"><%=rsQues("first_name")%> &nbsp;<%=rsQues("last_name")%></font></td><td><%=rsQues("dategranted")%></td><td><%=rsQues("custom")%></td><td><B><%=rsQues("ebay_address_id")%></B></td><td><%=rsQues("address_street")%><BR><%=rsQues("address_city")%><BR><%=rsQues("address_state")%><BR><%=rsQues("address_country")%> - <%=rsQues("address_zip")%></td><td><%=rsQues("kno_passed")%></td><td><%=rsQues("date_entered")%></td><td><%=rsQues("date_valid")%></td><td><%=rsQues("item_number")%></td><td><%=rsQues("onlinecertissued")%></td><td><%=rsQues("onlinecertdate")%></td><td><%=rsQues("phycertissued")%></td><td><%=rsQues("phycertdate")%></td><td><%=rsQues("phycertdet")%></td></tr>


		<%rsQues.MoveNext
		Loop
		rsQues.close%>
</table></td></tr></table>
<%
else
end if


 
Set rsQues=Nothing %>

<!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>



