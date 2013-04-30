
<!--#include virtual="/india/connection.asp"-->
<%
 'Declare The Variables'
 
 Dim rqOnlineEnrollUserId
 Dim strQuery

'Retrive The OnlineEnrollUserId From course.asp Page'

 rqOnlineEnrollUserId = Request.Querystring("OnlineEnrollUserId")

'Sql Query For Retrive The comments For That EnrolledUser'


 strQuery = "SELECT * FROM ITIL_onlineenrolledusercomments WHERE OnlineEnrollUserId = '" & rqOnlineEnrollUserId & "' ORDER BY commentid desc"
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
