<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>

<!--#include virtual="/includes/connection.asp"-->
<%

 Dim strQuery
 Dim objRs,UserIDTest

Set objRs = Server.CreateObject("ADODB.Recordset")

  strQuery = "SELECT * from accesstable"

  objRs.Open strQuery,ConnObj
  
 If (not objRs.EOF) Then

  Session("UserIDTest") = objRs("UserID")
  
  UserIDTest = Session("UserIDTest")
  
  Response.Write(Session("UserIDTest"))
  
  response.Write("<br>	Test"&UserIDTest)
 
End If
objRs.Close
%>
<!--#include virtual="/includes/connectionClose.asp"-->

