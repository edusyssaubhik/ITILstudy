<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'========================================================='
'Written By : Praveen'
'Written Date :07-09-2011'
'Description :'
'In This Page We Are Diplaying Course Details of Particular Course'
'========================================================='
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'Declare The Variables'
Dim strQueryVenue
Dim rqID 
Dim rsVenueDetails

Set rsVenueDetails = Server.CreateObject("ADODB.Recordset")

'Retrive The CourseID Using QueryString From fin.asp Page'
rqID = Request.QueryString("ID")

strQueryDetails = "SELECT * FROM ITIL_finance WHERE finid ='"& rqID &"'"

rsVenueDetails.Open strQueryDetails,ConnObj

If rsVenueDetails("status") = "0" OR rsVenueDetails("status") = "" then

RqStatus =  "Yet to Respond"
Else
RqStatus =  rsVenueDetails("status")

End If

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Course Details</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body class="popupbody">
<div style="margin-top:30px;">
  <table border="0" width="100%" class="btext" align="left">
    <tr>
      <td><table border="0"  cellpadding="2" cellspacing="0" class="table2">
          <% Do Until rsVenueDetails.EOF  %>
		  <tr align="Left">
          	<td>Faculty Email ID: <% = rsVenueDetails("faculty")  %></td>
          </tr>
         <tr align="Left">
          	<td>Payment Category: <% = rsVenueDetails("pay_cat") %></td>
          </tr>
		  <tr align="Left">
          	<td>Amount: <% = rsVenueDetails("amount") %></td>
          </tr>
          <% If Session("CRM_Country") = "United Kingdom" OR Session("CRM_Country") = "India" OR Session("CRM_Country") = "Australia" Then %>
           <tr align="Left">
          	<td> <% If Session("CRM_Country") = "United Kingdom" Then %> VAT: <% ElseIf Session("CRM_Country") = "India" Then %>Tax: <% ElseIf Session("CRM_Country") = "Australia" Then %>GST: <% End If %> <% = rsVenueDetails("Tax") %></td>
          </tr>
          <% End If %>
		  <tr align="Left">
          	<td>Added Date: <% = rsVenueDetails("added_date") %></td>
          </tr>   
          <tr align="Left">
          	<td>Added By: <% = rsVenueDetails("added_by") %></td>
          </tr>           		  
		  <tr align="Left">
          	<td>status: <% = RqStatus %></td>
          </tr> 
        </table></td>
    </tr>
     <% rsVenueDetails.Movenext
     Loop
	 rsVenueDetails.Close
	 Set rsVenueDetails = Nothing
	 ConnObj.Close
	 Set ConnObj = Nothing  %>
    </table>
</div>
</body>
</html>

