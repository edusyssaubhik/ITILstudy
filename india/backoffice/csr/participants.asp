<%@ Language = "VBScript" %>
 <%
'======================================================='
 'Written By : Bharath'
 'Last UpaDated: 21/04/2008 '
 'Description : Displaying Participants'
'======================================================='
%>
<!--#include virtual="/india/connection.asp"-->
<%
'Declaring Local Variables'
Dim Sql,rqID

rqID = Request.QueryString("ID")
 
  Sql = "select id,name,company from ps_participants where sessionid = '"& rqID &"'"

  Rs.open Sql,conn
  
If Not Rs.EOF Then
   arrAllRecords = Rs.getrows
   Session("arrAllRecords") = arrAllRecords
   numRows = Ubound(arrAllRecords,2)
   firstRow = 0
   lastRow = numRows
End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Participants</title>
<link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
<link href="../../css/pmstyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<form name="participants" action="#" method="post">
<fieldset style="width:500px">
<legend><span class="citydiv">Participants</span></legend>
<table border="0" width="500px" align="center"  bgcolor="#e7f2f7" cellpadding="3">
 <tr bgcolor="#D3BBE3" align="center" class="titlediv">
  <td>Name</td>
  <td>Company</td>
 </tr>
<%  If IsArray(arrAllRecords) Then
   	For rowcounter = firstRow to lastRow %>
 <tr bgcolor="#ffffff" class="text">
  <td><% =arrAllRecords(1,rowcounter) %></td>
  <td><% =arrAllRecords(2,rowcounter) %></td>
 </tr>
 <%	next
	End if %>
</table>
</fieldset>
</form>
</body>
</html>
