<%@ Language= "VBScript" %>
<% 'Option Explicit %>
<%
'---------------------------------------------------------------'
'Written By : Bharath'
'Last UpDated : 17/11/2007'
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


  rqCountry = Request.Querystring("country") 

 'Change the Session("CountryOrigin") Based on user selection'
 If Request.Querystring("country") <> "" Then
	
	 rqCountry = Request.Querystring("country") 
	 Session("CountryOrigin") = rqCountry

 End If
 
 Session("Country1") = rqCountry

'Sql Query For Retrive The Cities For The Selected Country And Put Into Array'
 strQuery = "select city, state_code from ITIL_city where country = '" & rqCountry & "' ORDER BY city"
 
'Response.Write(strQuery)

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

allitems = items(0,rowcounter)&", "&items(1,rowcounter)

response.write(allitems & "<br>")

Next
End If

ConnObj.Close
%>
