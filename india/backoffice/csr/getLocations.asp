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

Dim rqInstructorCity
Dim strQuery
Dim items
Dim firstrow,lastrow,numrows,rowcounter,allitems

'Retrive City From instructor Page'

 rqInstructorCity = Request.Querystring("instructorCity")

'Sql Query For Retrive The Locations For The Selected City And Put Into Array'
'And Calling This Page In The instructor.asp Page Using Ajax'

 strQuery = "select location from ps_location where city = '" & rqInstructorCity & "'"

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
