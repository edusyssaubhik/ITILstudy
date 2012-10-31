<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 'Written By : Bharath'
 'Last UpaDated: 17/11/2007'
 'Description :'
 'Purpose : This Page is EnrollUSerComments page'
 'In The Course Page Admin,SeniourCSR or CSR writes Comments for The Enroolledusers'
 'That Comments We Dispay Particular Page'
%>
<!--#include virtual="/india/connection-PROJ.asp"-->
<%
 'Declare The Variables'
 
 Dim rqEnrollUserId
 Dim strQuery

'Retrive The enrolluserid From course.asp Page'

 rqEnrollUserId = Request.Querystring("enrollUserId")

'Sql Query For Retrive The comments For That EnrolledUser'

 strQuery = "SELECT * FROM PROJITIL_enrolledusercomments WHERE enrolluserid = '" & rqEnrollUserId & "'"

 Rs.Open strQuery,Conn

 %>
 <html>
 <head>
 <title>EnrollUser Coments</title>
 </head>
 <body>
 <table border="0" cellspacing="0" cellpadding="0">
 <!-- <tr>
   <td bgcolor="#00B0EC" align="center">Comment</td>
   <td bgcolor="#00B0EC" align="center">Entered By</td>
   <td bgcolor="#00B0EC" align="center">EnteredDate</td>
  </tr>-->

  <tr>
   <td>
   <ol>
   	  <% do until Rs.EOF %>
    <li>

    <% = Rs("comment") %><br><% = Rs("enteredby") %>&nbsp;
 <% = Rs("createddate") %>

    </li>
	  <% Rs.Movenext
     Loop %>
   </ol>
   </td>
  </tr>

 </table>
 </body>
 </html>
