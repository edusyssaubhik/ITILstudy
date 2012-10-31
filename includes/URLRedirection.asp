<%
If InStr(Request.ServerVariables("SERVER_NAME"),"www") = 0 Then

	Response.Status="301 Moved Permanently"
	Response.AddHeader "Location","http://www." & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("URL")
	Response.End

End if
%>