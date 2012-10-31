<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/connection.asp"-->
<%
Set objRs = Server.CreateObject("ADODB.Recordset")
'todays date'	
dateof_fac_mail = Date()

objRs.ActiveConnection = ConnObj

objRs.Open "SELECT datesent from facultymailsent where CONVERT(VARCHAR(10), datesent, 101)='"&dateof_fac_mail&"' And country = 'US'"

Response.Write("SELECT datesent from facultymailsent where CONVERT(VARCHAR(10), datesent, 101)='"&dateof_fac_mail&"' And country = 'US'")

If (objRs.BOF) And (objRs.EOF) Then
	Response.Write("A")
Else
	Response.Write("B")
End If
%>
