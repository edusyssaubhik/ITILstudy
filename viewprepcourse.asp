<HTML>
<HEAD></HEAD>
<BODY>
<font="arial" size="3">
<!--#include virtual="/includes/connection.asp"-->
<%
Dim payer_email, first_name, address_country, payment_gross
Dim rqCity


rqCity = Request.Form("city")
rqEmailId = Request.Form("emailid")

ID1="2026"

Set rsQues = Server.CreateObject("ADODB.Recordset")
Set rsQues1 = Server.CreateObject("ADODB.Recordset")


item_number = "104"

strCity = "SELECT * FROM ITIL_city order by city  asc"

rsQues1.Open strCity,ConnObj

'rsQues.Open "SELECT payer_email, pass, item_name, first_name, last_name,address_street, address_city, address_state, address_country,address_zip,ebay_address_id, custom, kno_passed,  payment_gross, verify_sign,date_entered, date_valid, item_number from PaypalDB WHERE ID < "&ID1&" order by ID DESC "

If rqCity <> "" Then

strQuery = "SELECT payer_email, pass, item_name, first_name, last_name,address_street, address_city, address_state, address_country,address_zip,ebay_address_id, custom, kno_passed,  payment_gross, verify_sign,date_entered, date_valid, item_number from PaypalDB WHERE item_number = '"&item_number&"' And address_city = '"& rqCity &"' order by ID DESC"

rsQues.Open strQuery,ConnObj

ElseIf rqEmailId <> "" Then

strQuery = "SELECT payer_email, pass, item_name, first_name, last_name,address_street, address_city, address_state, address_country,address_zip,ebay_address_id, custom, kno_passed,  payment_gross, verify_sign,date_entered, date_valid, item_number from PaypalDB WHERE item_number = '"&item_number&"' And payer_email = '"& rqEmailId &"' order by ID DESC"

rsQues.Open strQuery,ConnObj

End If


%>
<table border="0">
<tr>
<td>
<form action="viewprepcourse.asp" method="post">
Select City:	
<select name="city">
<option value="">--City--</option>

 <%     Do Until rsQues1.EOF %>
          <option <% If rqCity = rsQues1("City") Then %> selected="selected" <% End If %> value="<%=rsQues1("City")%>"> <%=rsQues1("City")%></option>
          <%rsQues1.MoveNext
		Loop

	rsQues1.Close
%>
        </select>
<input type="submit" value="Submit">
</form>
</td>
<td width="20px">&nbsp;</td>
<td>

<form action="viewprepcourse.asp" method="post">
Email Id:
<input type="text" name="emailid" size="20">
<input type="submit" value="Submit">
</form>
</td>
</tr>
</table>
<% If rqCity <> "" OR rqEmailId <> "" Then %>
<table border="1" align="left" width="75%" cellpadding="4" cellspacing="0">
  <tr>
    <td>payer_email</td>
    <td>Password</td>
    <td>item_name</td>
    <td><B>first_name</B></td>
    <td><B>last_name</B></td>
    <td><B>Company Name</B></td>
    <td>Street Address</td>
    <td>City</td>
    <td>State</td>
    <td>Country</td>
    <td>Phone Number</td>
    <td>date_entered</td>
    <td>date_valid</td>
    <td>item_number</td>
    <td>Provide 30 day online access</td>
  </tr>
  <%
Do Until rsQues.EOF %>
  <tr>
    <td><B><%=rsQues("payer_email")%></B></td>
    <td><B><%=rsQues("pass")%></B></td>
    <td><B><%=rsQues("item_name")%></B></td>
    <td><%=rsQues("first_name")%></td>
    <td><%=rsQues("last_name")%></td>
    <td><%=rsQues("custom")%></td>
    <td><%=rsQues("address_street")%></td>
    <td><%=rsQues("address_city")%></td>
    <td><%=rsQues("address_state")%></td>
    <td><%=rsQues("address_country")%></td>
    <td><%=rsQues("ebay_address_id")%></td>
    <td><%=rsQues("date_entered")%></td>
    <td><%=rsQues("date_valid")%></td>
    <td><%=rsQues("item_number")%></td>
    <td><form name="one" action="./updateprepcourse.asp" method="post">
        <input type="hidden" name="payer_email" value="<%=Trim(rsQues("payer_email"))%>">
		<input type="hidden" name="first_name" value="<%=Trim(rsQues("first_name"))%>">
		<input type="hidden" name="last_name" value="<%=Trim(rsQues("last_name"))%>">
		<input type="hidden" name="City" value="<%=Trim(rsQues("address_city"))%>"> 
		<input type="hidden" name="Custom" value="<%=rsQues("custom")%>">
        <input type="hidden" name="Street" value="<%=rsQues("address_street")%>">
        <input type="hidden" name="State" value="<%=rsQues("address_state")%>">
        <input type="hidden" name="Country" value="<%=rsQues("address_country")%>">
		<input type="hidden" name="onemonthcourse" value="OneMonthCourse" />
        <input type="submit" Value="Update to 6sigma access">
      </form>
  </tr>
  <% rsQues.MoveNext
     Loop
     rsQues.Close %>
</table>
<% End If %>
<%
ConnObj.Close
set ConnObj = Nothing
%>
</body>
</html>
