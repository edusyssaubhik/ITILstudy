<html>
<head>
<TITLE>ITILstudy.com Economical, Effective</TITLE>
<META http-equiv=Content-type content="text/html; charset=ISO-8859-1">
<META
content="ITILstudy.com offers Online Economical, Effective,Guides on Different Knowledge Areas"
name=description>
<META
content="ITILstudy.com offers Online Economical, Effective,Guides on Different Knowledge Areas"
name=keywords>
</head>
<body> 
<!--#include virtual="/includes/connection.asp"-->
<%
response.Flush()
Dim Array,KNo, QuesNo, Ans, payer_email, date
item_number=Request.Form("item_number")
payer_email=Request.Form("payer_email")
color1="Red"
color2="Blue"
Nostatus="No"
NRstatus="Not Required"
 
 
			Set objRs = Server.CreateObject("ADODB.Recordset")
			
			strQuery = "SELECT TOP 1 id FROM PaypalDB WHERE payer_email='"&payer_email&"' ORDER BY id DESC"
			objRs.open strQuery,ConnObj
			
			If Not objRs.EOF Then
				payer_id = objRs("id")
			End If
			
			objRs.Close


ConnObj.Execute "UPDATE PaypalDB SET item_number= '"&item_number&"' WHERE id ='"&payer_id&"'"

Set rsQues = Server.CreateObject("ADODB.Recordset")
rsQues.ActiveConnection = ConnObj

rsQues.Open "SELECT kno_passed from PaypalDB WHERE id ='"&payer_id&"'"


If (int(rsQues("kno_passed"))=11 And item_number="312") or (int(rsQues("kno_passed"))=11 And item_number="104") or (int(rsQues("kno_passed"))=11 And item_number="102") then

ConnObj.Execute "UPDATE PaypalDB SET color = '"&color2&"' WHERE id ='"&payer_id&"'"
ConnObj.Execute "UPDATE PaypalDB SET onlinecertissued = '"&Nostatus&"' WHERE id ='"&payer_id&"'"
ConnObj.Execute "UPDATE PaypalDB SET phycertissued = '"&Nostatus&"' WHERE id ='"&payer_id&"'"


Else

If (int(rsQues("kno_passed"))=11 And item_number="311") or (int(rsQues("kno_passed"))=11 And item_number="103") or (int(rsQues("kno_passed"))=11 And item_number="101") then

ConnObj.Execute "UPDATE PaypalDB SET color = '"&color1&"' WHERE id ='"&payer_id&"'"
ConnObj.Execute "UPDATE PaypalDB SET onlinecertissued = '"&Nostatus&"' WHERE id ='"&payer_id&"'"
ConnObj.Execute "UPDATE PaypalDB SET phycertissued = '"&NRstatus&"' WHERE id ='"&payer_id&"'"
Else
End If

End If

rsQues.Close
set rsQues=Nothing

Response.Write "Updated item_number for given email ID"

%> 
<!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>