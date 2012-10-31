<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 26/10/2010'
'Description :'
'This Page is Login Page'
'======================================================='%>
<!-- #include virtual = "/includes/connection.asp"-->
<%
'======================================================='
 'Declare The Variables'
'======================================================='

 Dim rqUsername,Rs
 Dim rqPassword
 Dim strQuery
 Dim userName, Pwd
 
'======================================================='
'Creating the Recordset objects'
'======================================================='
'SET Rs = Server.CreateObject("ADODB.Recordset")


'======================================================='
 'Retrive UserName And Password From Login.asp Page'
'======================================================='

 rqUsername = Request.Form("username")
 rqPassword = Request.Form("password")
 
 response.Write(rqUsername)
  response.Write(rqPassword)

'======================================================='
 'Sql Query For Checking The UserName Password'
'======================================================='

   userName = "itilstudyteam"
   Pwd      = "itilstudy001"
   
    response.Write(userName)
	response.Write(Pwd)

'======================================================='
 'Putting Userid Into session'
 'Putting typeofuser Into session'
'======================================================='

  Session("UserId") = userName
  'Session("typeofuser") = Rs("Admin")

'======================================================='
 'if UserName and Password Valid Then Redirecting To CsrHome Page'
'======================================================='
  If rqUsername = userName AND rqPassword = Pwd  then
  Response.Redirect("/courseEvaluation1.asp")
  Else
  Session("errorMessage") = "Login Failed Please Check Username and Password"
  Response.Redirect("/access.asp")
  End If


'Rs.Close
ConnObj.Close
%>

