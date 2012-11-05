<!--#include virtual="/includes/headerConnection.asp"-->
<%
Session("CountryOrigin")="Germany"
'Session.Timeout=1000

sIPAddress = Request.ServerVariables("HTTP_X_FORWARDED_FOR")

If sIPAddress="" Then sIPAddress = Request.ServerVariables("REMOTE_ADDR")

	strQuery11 = "http://geoip1.maxmind.com/b?l=4tAUhyTgUD6d" & _
		"&i=" & sipaddress
	set objHtp = Server.CreateObject("Msxml2.ServerXMLHTTP")
	objHtp.open "GET", strQuery11, false
	objHtp.send
	sipAddress = sipAddress + ";" + objHtp.ResponseText

	ConnObj1.Execute "INSERT INTO countrydetails(other, created_date, source_from) values('"&sIPAddress&"','"&now()&"', 'Germany')" 
	Set objHtp = Nothing
	Set ConnObj1 = Nothing

%>
<%
Server.Transfer("/index.asp")
%>