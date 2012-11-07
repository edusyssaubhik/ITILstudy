<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Sending Cross Word Email</title>
<script type="text/javascript">
    window.opener.document.location = "http://www.ITILstudy.com"
</script>
</head>
<body oncontextmenu="return false;">
<%
'Declate the local variables'
Dim objCDOMail
Dim rqEmail
Dim rqBody

'Retriving the values from index.html pahe' 
rqEmail = Request.Form("email")
rqBody  = Request.Form("emailtext") 
rqBody = rqBody 
Response.Write(rqBody)

 Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
 objCDOMail.From = "marketing@ITILstudy.com"
 objCDOMail.To =  "<" & rqEmail & ">"
 objCDOMail.Bcc = "marketing@ITILstudy.com"
 objCDOMail.Importance = 2
 objCDOMail.Subject = "ITILstudy: Cross Word"
 objCDOMail.BodyFormat = 0
 objCDOMail.MailFormat = 0
 objCDOMail.Body =  rqBody
 objCDOMail.Send
 Set objCDOMail = Nothing

%>
<br><br> Successfully sent an email!
</body>
</html>
