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
<!--#include virtual="/includes/connection_global.asp"-->
<%

Dim rqCountry
Dim strQuery
Dim items
Dim firstrow,lastrow,numrows,rowcounter,allitems
Dim objRs

SET objRs = Server.CreateObject("ADODB.Recordset")


 rqCountry = Request.Querystring("country") 

 'Session("Country1") = rqCountry
 
 If (rqCountry = "US" OR rqCountry = "Canada") Then
 
 strQuery = "SELECT states, statecode FROM ps_us_states WHERE country = '"& rqCountry &"' ORDER BY states"
 
  objRs.Open strQuery,ConnObj1
 
 Else

'Sql Query For Retrive The Cities For The Selected Country And Put Into Array'
 strQuery = "SELECT state, state_code From ITIL_city WHERE country = '"& rqCountry &"' ORDER BY state"
 
 'response.Write(strQuery)

 objRs.Open strQuery,ConnObj
 
 End If

 If Not objRs.EOF Then
   items = objRs.getrows
   numrows = Ubound(items,2)
   firstrow = 0
   lastrow = numrows
 End If
 
 objRs.Close
 
 
If IsArray(items) Then
For rowcounter = firstrow to lastrow

allitems = items(0,rowcounter)

If items(1,rowcounter) <> "" Then
allitems = allitems &", "
allitems = allitems & items(1,rowcounter)
End If

response.write(allitems & "<br>")

Next
End If

ConnObj.Close
%>
