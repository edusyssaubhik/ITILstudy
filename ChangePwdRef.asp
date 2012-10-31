<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/connectionRef.asp"-->

<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 23/03/2010'
'Description :'
'This page is adding calls to the database'

'======================================================='
' Declaring the variables'
Dim strQuery
Dim strQuery1
Dim rqPayerEmail
Dim rqCurrentPassword
Dim rqNewPassword
Dim ObjRs, ObjRs1 ,body

Set objRs = server.CreateObject("ADODB.Recordset")
Set objRs1 = server.CreateObject("ADODB.Recordset")

'Retriving the values'
 rqPayerEmail             =  Request.Form("payer_email")
 rqCurrentPassword    =  Request.Form("passold")
 rqNewPassword        =  Request.Form("passnew1")
 
 strQuery = "SELECT EmailId, pass from Ref_Account WHERE EmailId='"&rqPayerEmail&"' and pass='"&rqCurrentPassword&"'"
 'response.Write(strQuery)
 objRs.Open strQuery,ConnObjRef
 
 If (Not objRs.BOF) and (Not objRs.EOF) Then 
 
  

'Comparing the current password and the password in database'
  If rqCurrentPassword <> objRs("pass") Then
  
	Session("message") = "Your Password is incorrect"
	Response.Redirect("changepasswordRef.asp")
	
  Else
  

   strQuery1 = "UPDATE Ref_Account SET pass='"&rqNewPassword&"' WHERE EmailId='"&rqPayerEmail&"'"
   'response.write( strQuery1)
   objRs1.Open strQuery1,ConnObjRef
   
      Session("message") = "Successfully Changed Password"
      Response.Redirect("changepasswordRef.asp")
   
   objRs1.Close
   Set objRs1 = Nothing
   
  
  End If
  
     Else

  Session("message") = "The UserID or Password you entered is incorrect"
	Response.Redirect("changepasswordRef.asp")


 
  End If  

objRs.Close
Set objRs = Nothing

ConnObjRef.Close
Set ConnObjRef = Nothing

%>