<%@ Language= "VBScript" %>
<% 'Option Explicit %>
<%
'---------------------------------------------------------------'
'Written By : Bharath'
'Last UpDated : 10/11/2009'
'Description :'
'This Page is Retrive The cities Based On Country'
'This Page Comes From dates_location.asp Page'
'--------------------------------------------------------------'
%>
<!--#include virtual="/includes/connection.asp"-->
<%

Dim rqCountry
Dim strQuery
Dim items
Dim firstrow,lastrow,numrows,rowcounter,allitems
Dim objRs

SET objRs = Server.CreateObject("ADODB.Recordset")

'Retrive Country From dates_location Page'

 rqCity = Request.Querystring("city")

strQuery = "SELECT Distinct(startdate), enddate FROM ITIL_course WHERE city = '" & rqCity & "' And startdate >= '"&Now() - 1&"' And status = 'Available' order by startdate asc"
								 
 objRs.Open strQuery,ConnObj

 If Not objRs.EOF Then
   items = objRs.getrows
   numrows = Ubound(items,2)
   firstrow = 0
   lastrow = numrows
 End If
 
 objRs.Close
 
 
If IsArray(items) Then
For rowcounter = firstrow to lastrow

'allitems = items(0,rowcounter)

allitems = (DAY(items(0,rowcounter)) & " " & MonthName(Month(items(0,rowcounter)),3) & " "  & YEAR(items(0,rowcounter)) & " to " & DAY(items(1,rowcounter)) & " " & MonthName(Month(items(1,rowcounter)),3) & " "  & YEAR(items(1,rowcounter)))

response.write(allitems & "<br>")

Next
End If


ConnObj.Close
%>
