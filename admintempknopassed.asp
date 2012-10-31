<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>New Page 1</title>
</head>

<body>
<!--#include virtual="/includes/connection.asp"-->
<%

Dim Conn, Array,KNo, QuesNo, Ans, payer_email, dategr

dategr=date()

kno_passed=Request.Form("kno_passed")
payer_email=Request.Form("payer_email")

color1="Red"
color2="Blue"
Nostatus="No"
NRstatus="Not Required"


Set rsQues = Server.CreateObject("ADODB.Recordset")
rsQues.ActiveConnection = ConnObj
rsQues.Open "Select item_number,id from PaypalDB WHERE payer_email='"&payer_email&"' order by id desc"

If Not rsQues.BOF Then%>
		<%item_number = rsQues("item_number")%>
		<% payer_id = rsQues("id")%>
<%else
end if

ConnObj.Execute "UPDATE PaypalDB SET kno_passed= '"&kno_passed&"' WHERE id='"&payer_id&"'"

rsQues.Close
Set rsQues=Nothing
If (KNo_passed=11) then
	If (Item_number="103") or (Item_number="104") or (Item_number="311") or (Item_number="312")  Then 
		Response.Write "Green Belt: Candidate successfully passed Case Study Part 3. So, certificates have to be issued."
	Else  
		Response.Write "Black Belt: Candidate successfully passed Case Study 2 Part 2. So, certificates have to be issued."
	End If

%><BR><BR>
The person had been enrolled in Item Number: <%=item_number%> <BR>
( Green Belt : 103 and 311 is Online Certificate; 104 and 312 is Physical Certificate <BR> 
Black Belt : 101 is Online Certificate; 102 is Physical Certificate) <BR><BR>
<%
ConnObj.Execute "UPDATE PaypalDB SET dategranted = '"&dategr&"' WHERE id='"&payer_id&"'"

If (Item_number="311") or (Item_number="101") or (Item_number="103")  Then
Response.Write "Green Belt:"
'ConnObj.Execute "UPDATE PaypalDB SET color = '"&color1&"' WHERE payer_email='"&payer_email&"'"
'ConnObj.Execute "UPDATE PaypalDB SET onlinecertissued = '"&Nostatus&"' WHERE payer_email='"&payer_email&"'"
'ConnObj.Execute "UPDATE PaypalDB SET phycertissued = '"&NRstatus&"' WHERE payer_email='"&payer_email&"'"

ConnObj.Execute "UPDATE PaypalDB SET color = '"&color1&"', onlinecertissued = '"&Nostatus&"', phycertissued = '"&NRstatus&"' WHERE id='"&payer_id&"'"

Else
Response.Write "Black Belt:"
''ConnObj.Execute "UPDATE PaypalDB SET color = '"&color2&"' WHERE payer_email='"&payer_email&"'"
'ConnObj.Execute "UPDATE PaypalDB SET onlinecertissued = '"&Nostatus&"' WHERE payer_email='"&payer_email&"'"
'ConnObj.Execute "UPDATE PaypalDB SET phycertissued = '"&Nostatus&"' WHERE payer_email='"&payer_email&"'"

ConnObj.Execute "UPDATE PaypalDB SET color = '"&color2&"', onlinecertissued = '"&Nostatus&"', phycertissued = '"&Nostatus&"' WHERE id='"&payer_id&"'"

End If
else
end if


Response.Write "Updated KNO Passed for the given question"

%>
<!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>