<%@Language = "VBScript" %>
<%
'======================================================='
 'Written By : Bharath'
 'Last UpaDated: 01/11/2007'
 'Description :'
 'Purpose : Checking Valid User Or Not'
 '======================================================='
%>
<!--#include virtual="/india/connection.asp"-->
<%
'======================================================='
 'Declare The Variables'
'======================================================='

 Dim rqUsername
 Dim rqPassword
 Dim strQuery

'======================================================='
 'Retrive UserName And Password From Login.asp Page'
'======================================================='

  Function StrQuoteReplace(strValue)
	 StrQuoteReplace = Replace(strValue, "'", "")
  End Function

 rqUsername = StrQuoteReplace(Request.Form("username"))
 rqPassword = StrQuoteReplace(Request.Form("password"))

'======================================================='
 'Sql Query For Checking The UserName Password'
'======================================================='

  strQuery = "SELECT * FROM ITIL_users where userid = '" & rqUsername & "' and password = '" & rqPassword & "'"

  Rs.Open strQuery,Conn

 If (not Rs.BOF) and (not Rs.EOF) Then

'======================================================='
 'Putting Userid Into session'
 'Putting typeofuser Into session'
'======================================================='

  Session("UserId") = Rs("userid")
  Session("typeofuser") = Rs("typeofuser")

'======================================================='
 'if UserName and Password Valid Then Redirecting To CsrHome Page'
'======================================================='

  Response.Redirect("./csr/csrHome.asp")

Else

'======================================================='
  'UserName and Password Not Valid Then Redirecting to Ligin Page'
  'And Print Error Message'
'======================================================='

  Session("errorMessage") = "Login Failed Please Check Username and Password"
  Response.Redirect("login.asp")

End If
Rs.Close
Conn.Close
%>

