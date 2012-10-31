<%@ Language= "VBScript" %>
<% Option Explicit %>
<%
'---------------------------------------------------------------'
'Written By : Bharath'
'Last UpDated : 17/11/2007'
'Description :'
'This Page is Retrive The Locations Based On City'
'This Page Comes From instructor.asp Page'
'--------------------------------------------------------------'
%>
<!--#include virtual="/india/connection.asp"-->
<%

Dim rqCountry
Dim strQuery
Dim items
Dim firstrow,lastrow,numrows,rowcounter,allitems

'Retrive City From instructor Page'

 rqCountry = Request.Querystring("country")

'Sql Query For Retrive The Cities For The Selected Country And Put Into Array'
'And Calling This Page In The instructor.asp Page Using Ajax'

 strQuery = "select city from ps_city where country = '" & rqCountry & "'"

 Rs.Open strQuery,Conn


 If Not Rs.EOF Then
   items = Rs.getrows
   numrows = Ubound(items,2)
   firstrow = 0
   lastrow = numrows
 end if
if IsArray(items) Then
For rowcounter = firstrow to lastrow
allitems = items(0,rowcounter)
response.write(allitems & "<br>")
next
end if
Rs.Close
Conn.Close
%>
