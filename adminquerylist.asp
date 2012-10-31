<HTML>
<HEAD>
</HEAD>
<BODY><font="arial" size="3">
<!--#include virtual="/includes/connection.asp"-->

<%
Dim payer_email, first_name, address_country, payment_gross

Set Conn=Server.CreateObject("ADODB.Connection")

ID1="2026"
Set rsQues = Server.CreateObject("ADODB.Recordset")
rsQues.ActiveConnection = ConnObj
rsQues.Open "SELECT UserID, TimeofEntry, TimeofQuery, Feedback from queriesans order by QueryNo DESC "
%>
<%

dateC = now()

%>
Time Now as per our server : <%=DateC%> : please set your computer clock as per this time
<p align="center"><B>Queries Answered list - ITILstudy.com </B></P>	
<table border="1" padding="4" spacing="4" align="left" width="100%">
<%

If not rsQues.BOF then%>
<tr><td>SrNo</td><td>UserID (Customer Service person)</td><td>Time of Answering</td><td>Time Question Asked<BR>(Optional)</td><td>Question</td></tr>
<%SrNo=1
Do While Not rsQues.EOF %>
<tr><td><B><%=SrNo%></B></td><td><B><%=rsQues("UserID")%></B></td><td><B><%=rsQues("TimeofEntry")%></B></td><td><%=rsQues("TimeofQuery")%></td><td><%=rsQues("Feedback")%></td></tr>
		<%rsQues.MoveNext
SrNo=SrNo+1
		Loop%>
</table>
<%
else
end if
ConnObj.Close
set ConnObj = Nothing
set rsQues=Nothing%>

</body>
</html>


