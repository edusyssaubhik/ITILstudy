<%
If Session("USBUserId") = "" Then
	Response.Redirect("/USBackoffice/login.asp")
Else
%>
<%
	Response.write("test")
%>

<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/connection_global.asp"-->
<%
End If 
%>