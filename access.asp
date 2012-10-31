<%@ LANGUAGE="VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 26/10/2010'
'Description :'
'This Page is Login Page'
'======================================================='

'Declare The Variables'
'If You Given Wrong Username And Password Then Display One Error Message In This Page'

 Dim errorMessage
 errorMessage = Session("errorMessage")
 Session("errorMessage") = ""
%>
<html>
<head>
<title>Login</title>
<link href="/css/pagestyle.css" rel="stylesheet" type="text/css">
 <title>Login</title>
</head>
<body><div id="htMap">
<div style="position:absolute;top:150px;left:340px;">
<form action="validAccess.asp" method="post">
<table border="0" width="400px" align="center" class="dbborder">
 <tr>
 <!--Displaying Error Message-->
  <td colspan="2"><font face="Arial" color="red"><% = errorMessage %></font></td>
 </tr>
 <tr>
  <td colspan="2" align="center">Login</td>
 </tr>
 <tr>
  <td>UserName:</td>
  <td><input type="text" name="username"</td>
 </tr>
 <tr>
  <td>Password:</td>
  <td><input type="password" name="password"></td>
 </tr>
 <tr>
  <td></td>
  <td align="center"><input type="submit"  value="Login"></td>
 </tr>
</table>
</form>
</div>
</div>
</body>
</html>
