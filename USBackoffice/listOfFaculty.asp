<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<% 
	If Session("USBUserId") = "" Then 
		Response.Redirect("login.asp")
	Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'Written By : Bharath'
'Created Date: 21/08/2009'
'Last Updated Date: 21/08/2009'
'Description :'
'Purpose : Show all the Us instructors details'

'Declare The Variables'
Dim strList
Dim objRs

Set objRs = Server.CreateObject("ADODB.Recordset")

If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then
	strList = "SELECT firstname, lastname FROM ITIL_instructor WHERE typeofuser = 'Faculty' And (Country = 'US' OR Country = 'Canada')"
Else
	strList = "SELECT firstname, lastname FROM ITIL_instructor WHERE typeofuser = 'Faculty' And Country = '"& Session("CRM_Country") &"'"
End If

objRs.OPen strList,ConnObj
%>
<html>
<head>
<title>List Of Faculty</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<table width="400" border="1" class="table1" >
  <tr>
    <td><b>Name</b>  </td>
  </tr>
  <% Do Until objRs.EOF %>
  <tr>
    <td><% = objRs("firstname") %>&nbsp;<% = objRs("lastname") %></td>
  </tr>
  <% objRs.Movenext
     Loop
	 objRs.Close
     ConnObj.Close %>
</table>
</body>
</html>
<% End If %>