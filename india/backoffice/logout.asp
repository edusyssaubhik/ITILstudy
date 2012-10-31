<%@ LANGUAGE="VBSCRIPT" %>
<% OPTION EXPLICIT %>
<%
'-------------------------------------------------------'
'Written By : Bharath'
'Last UpDated : 04/10/2007'
'Description :'
'This Page Abandons Active User Session As Well As All The Sesssion Variables Started In The Active'
'Users Session When Invoked.'
'-------------------------------------------------------'

'Abandons All The Sessions And Redirected To  Login Page.'
'Declare Local Variables'

Dim username,str

userName = Request.Cookies("userid")
str = "login.asp"
Session.Abandon()
Response.Redirect str
Response.end
%>