<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
 'Written By : Savita'
 'Created UpaDated: 11/08/2011'
 'Last Updated Date: 11/08/2011'
 'Description :'
 'Purpose : Checking Valid User Or Not'
 '======================================================='
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
 'Declare The Variables'
'======================================================='

 Dim rqEmailId
 Dim rqPassword
 Dim strQuery, strQuery1
 Dim objRs,objRs1

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")



'======================================================='
 'Retrive UserName And Password From Login.asp Page'
'======================================================='
Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "")
End Function
 rqEmailId = StrQuoteReplace(Request.Form("emailid"))
 rqPassword = StrQuoteReplace(Request.Form("pwd"))

'======================================================='
 'Sql Query For Checking The UserName Password'
'======================================================='

  strQuery = "SELECT emailid1, emailid2, firstname, lastname, city1, city2, city3, city4, city5, city6, city7, city8, city9, city10, typeofuser, country FROM ITIL_instructor where emailid1 = '" & rqEmailId & "' and pwd = '" & rqPassword & "'"

  objRs.Open strQuery,ConnObj
  
 If (not objRs.BOF) and (not objRs.EOF) Then

'======================================================='
 'Putting Userid Into session'
 'Putting typeofuser Into session'
'======================================================='

  Session("USBUserId") = objRs("emailid1")
  Session("USBUserId1") = objRs("emailid2")
  Session("FirstName") = objRs("firstname")
  Session("LastName") = objRs("lastname")  
  Session("City1") = objRs("city1")
  Session("City2") = objRs("city2")
  Session("City3") = objRs("city3")
  Session("City4") = objRs("city4")
  Session("City5") = objRs("city5")
  Session("City6") = objRs("city6")
  Session("City7") = objRs("city7")
  Session("City8") = objRs("city8")
  Session("City9") = objRs("city9")
  Session("City10") = objRs("city10")  
  Session("TypeOfUser") = objRs("typeofuser")
  Session("CRM_Country") = objRs("country")

  
  
'======================================================='
 'if UserName and Password Valid Then Redirecting To CsrHome Page'
'======================================================='

  Response.Redirect("home.asp")

Else

'======================================================='
  'UserName and Password Not Valid Then Redirecting to Ligin Page'
  'And Print Error Message'
'======================================================='

  Session("errorMessage") = "Login Failed"
  Response.Redirect("login.asp")

End If
objRs.Close
%>
<!--#include virtual="/includes/connectionClose.asp"-->

