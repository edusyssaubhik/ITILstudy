<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<% If Session("FirstName") = "" Then 
response.Redirect("/memberlogin.asp")
Else
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Search Data</title>
</head>
<body>
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
 'Written By : Bharath'
 'Last UpaDated: 20/12/2010'
 'Description :'
 'Purpose : Searching data'
'======================================================='

'Delcare the local variable'
Dim rqSearchData, strSearch, objRs

'Creating the recordset'
Set objRs = Server.CreateObject("ADODB.Recordset")

'Retriving the search data'
rqSearchData = Request.Form("searchData")

'Retrive the relevant data from table'
strSearch = "SELECT * FROM SOAterm_definition WHERE term LIKE '%"& rqSearchData &"%' OR definition LIKE '%"& rqSearchData &"%'"

objRs.Open strSearch, ConnObj

'Displaying the records'
If (Not objRs.BOF) And (Not objRs.EOF) Then

'Displaying Only ODD Color'
If Eval(iCount\2 = iCount/2) Then
	   bgcolor =  "TableRowEven"
Else 
 	   bgcolor = "TableRowOdd"
End If 

%>

<table border="0" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" width="70%">
	<tr>
    	<td class="TableRowOdd">Term</td>
        <td class="TableRowOdd">Definition</td>
    </tr>
    <% 
	iCount = 0
	Do Until objRs.EOF 
	
	'Displaying Only ODD Color'
				  	If Eval(iCount\2 = iCount/2) Then 
							bgColor = "TableRowEven"
					Else 
 							bgColor = "TableRowOdd"
					End If
	%>
	<tr>
    	<td class="<% = bgcolor %>"><% = objRs("term") %></td>
        <td class="<% = bgcolor %>"><% = objRs("definition") %></td>
    </tr>
    <% 
	 iCount = iCount +1 
	objRs.Movenext
	   Loop
	   objRs.Close %>
    <% Else %>
    <tr><td colspan="3" class="TableRowOdd">No data available</td></tr>
<% End If %>
	<tr><td colspan="3" class="TableRowEven">&nbsp;</td></tr>
</table>
</body>
<% End If %>
</html>
