<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Facebook Discounts</title>
</head>
<body>
<!--#include virtual="/includes/connection.asp"-->
<%
	
 'Generating default/random password '
Dim pChar, pCount, strFBdiscount,Rs,rqgeneratedDate,objRs, rqexpiryDate

'record set
Set Rs = Server.CreateObject("ADODB.Recordset")
Set objRs = server.CreateObject("ADODB.Recordset")

rqgeneratedDate = Now() + 7
 
' Here you can add other characters such as lowercase or special.
pChar = "ABCDEFGHIJKLMNPQRSTUVWXYZ@#$&0123456789"
 
pCount = Len(pChar) 
 
Dim FBdisCode
FBdisCode = "PM"

 'genereating discount code for PMstudy
 Randomize
 For i = 1 To 6 ' password length
	FBdisCode = FBdisCode & Mid( pChar, 1 + Int(Rnd * pCount), 1 )
	rqFBdisCode = FBdisCode
 Next
 
' selecting the last discount code inserted
strDate = "SELECT top 1 expiryDate FROM facebookDiscounts Order by Id desc"

objRs.Open strDate,ConnObj

Do until objRs.EOF

	'Response.Write("Test")
	rqexpiryDate = FormatDateTime(objRs("expiryDate"),2)
		
objRs.Movenext
Loop
objRs.Close

'inserting the new discount code every week
 
 If rqexpiryDate = FormatDateTime(now(),2) Then
 
 strFBdiscount = "INSERT INTO facebookDiscounts (discountCode, generatedDate, expiryDate) VALUES ('"& rqFBdisCode &"','"& Now() &"','"& rqgeneratedDate &"')"

 Rs.Open strFBdiscount,ConnObj
 
 Response.Write("Inserted one record successfully!!!")
 
 End If
 %>
</body>
</html>
