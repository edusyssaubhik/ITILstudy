<%@ Language= "VBScript" %>
<% Option Explicit %>
<%
'---------------------------------------------------------------'
'Written By : Priyanka'
'Last UpDated : 17/11/2007'
'Description :'
'This Page is Retrive The Subtopics Based On Topic'
'--------------------------------------------------------------'
%>
<!--#include virtual="/india/connection.asp"-->
<%

Dim rqCountry
Dim strQuery
Dim items
Dim firstrow,lastrow,numrows,rowcounter,allitems

'Retrive Secondary Topic From dataInterLogicalReasQuestion.asp Page'

 rqCountry = Request.Querystring("country")
 
'Sql Query For Retrive The Locations For The Selected City And Put Into Array'
'And Calling This Page In The instructor.asp Page Using Ajax'

	Set Rs = server.CreateObject("ADODB.Recordset")

  strQuery = "Select Max(city) As city From ITIL_city Where Country = '"&rqCountry&"' Group by city Order By city Asc"
	 Rs.Open strQuery,Conn
'response.Write(strQuery)


 If Not Rs.EOF Then
   items = Rs.getrows
   numrows = Ubound(items,2)
   firstrow = 0
   lastrow = numrows
 End If
 
If IsArray(items) Then

	For rowcounter = firstrow to lastrow
	allitems = items(0,rowcounter)
	response.write(allitems & "<br>")
	Next
	
End If

Rs.Close
Conn.Close
%>
