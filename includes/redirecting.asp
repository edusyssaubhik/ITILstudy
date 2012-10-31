<% 
svrHttps = request.servervariables("HTTPS")
svrHost = request.servervariables("HTTP_HOST")
svrUrl = request.servervariables("URL")
svrQueryString = request.servervariables("QUERY_STRING")
IF left(svrHost,4) <> "www." THEN
IF svrHttps = "off" THEN
svrNewUrl = "http://www."
END IF
svrNewUrl = svrNewUrl & svrHost & svrUrl
svrNewUrl = replace(svrNewUrl,"index.asp","")
IF len(svrQueryString) > 0 THEN
svrNewUrl = svrNewUrl & "?" & svrQueryString
END IF
response.status = "301 Moved Permanently"
response.addheader "Location", svrNewUrl
response.end
END IF
%>
