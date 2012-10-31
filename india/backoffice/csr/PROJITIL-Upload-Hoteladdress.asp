<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% If not  Session("UserId") = "" Then %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Uploading Venue Details</title>
<script language="javascript">
function Form_Validator(theform)
{
  
  if (theform.city.value == "")
  {
     alert("Please Enter The City.");
     theform.city.focus();
     return (false);
  }
  
  if (theform.HName.value == "")
  {
     alert("Please enter Hotel Name");
     theform.HName.focus();
     return (false);
  }

  if (theform.HAddress.value == "")
  {
     alert("Please enter Hotel Address");
     theform.HAddress.focus();
     return (false);
  }

  if (theform.HPhoneNo.value == "")
  {
     alert("Please enter Hotel Phone Number");
     theform.HPhoneNo.focus();
     return (false);
  }
  
}  
</script>
</head>
<body>
<!--#include virtual="/india/connection-PROJ.asp"-->
<!--#include virtual="/includes/connection.asp"-->
<%
'Uploading venue details'

'Declare the local variables'
Dim strHotelAdd, strCity, objRs
Dim rqCity, rqHName, rqHAddress, rqHPhoneNo
Dim rqFromDate, rqToDate

Set objRs = Server.CreateObject("ADODB.Recordset")

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function

'Retriving the values'
rqCity      =  Trim(Request.Form("city"))
rqHName     =  StrQuoteReplace(Trim(Request.Form("HName")))
rqHAddress  =  StrQuoteReplace(Trim(Request.Form("HAddress")))
rqHPhoneNo  =  Trim(Request.Form("HPhoneNo"))
rqFromDate  =  Request.Form("fromDate")
rqToDate    =  Request.Form("toDate")

If rqCity <> "" Then

	'Update query for updating the hotel address in the database'
	strHotelAdd = "UPDATE PROJITIL_course SET hotelname = '"& rqHName &"', hoteladdress = '"& rqHAddress &"', hotelphonenumber = '"& rqHPhoneNo &"' WHERE city = '"& rqCity &"' AND (country = 'India') AND (startdate BETWEEN '"&rqFromDate&"' AND '"&rqToDate&"') AND hotelname = ''"
	
	'Response.Write(strHotelAdd)
	
	Conn.Execute strHotelAdd
	
	Response.Write("You have been succesfully uploaded the hotel address for "& rqCity &" <br><br><br>")

End If

'Retriving the cities'
strCity = "SELECT city FROM Itil_city WHERE country = 'United Kingdom' order by city"

objRs.Open strCity, ConnObj

%>
<form action="" method="post" onsubmit="return Form_Validator(this)">
<table border="1" cellspacing="0" cellpadding="5">
	<tr>
     <td colspan="2" align="center">Uploading PROJstudy ITIL Venue Details</td>
    </tr>
    <tr>
    	<td>City:</td>
        <td>
        	<select name="city">
            	<option value="">-Select--</option>
                <% Do Until objRs.EOF %>
                <option value="<% = objRs("city") %>"><% = objRs("city") %></option>
                <% objRs.Movenext
				   Loop
				   objRs.Close %>
            </select>
        </td>
    </tr>
    <tr>
    	<td>From Date:</td>
        <td><input type="text" name="fromDate" />&nbsp;(YYYY-MM-DD)</td>
    </tr>
    <tr>
    	<td>To Date:</td>
        <td><input type="text" name="toDate" />(YYYY-MM-DD)</td>
    </tr>
    <tr>
    	<td>Hotel Name:</td>
        <td><input type="text" name="HName" /></td>
    </tr>
    <tr>
    	<td>Hotel Address:</td>
        <td><textarea name="HAddress" cols="15" rows="5"></textarea></td>
    </tr>
    <tr>
    	<td>Hotel Phone Number:</td>
        <td><input type="text" name="HPhoneNo" /></td>
    </tr>
    <tr>
    	<td>&nbsp;</td>
        <td><input type="submit" name="Submit" value="Submit" /></td>
    </tr>
</table>
</form>
</body>
</html>
<%
 ConnObj.Close
 Set ConnObj = Nothing
 Else
 Response.Redirect("../login.asp")
 End If
%>