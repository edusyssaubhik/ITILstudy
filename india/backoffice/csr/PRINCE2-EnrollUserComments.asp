<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Bharath'
'Created Date : 17/02/2012'
'Modified By : Bharath'
'Modified Date : 17/02/2012'
'Description :'
'Purpose : This Page is EnrollUSerComments page'
'In The Course Page Admin,SeniourCSR or CSR writes Comments for The Enroolledusers'
'That Comments We Dispay Particular Page'
'======================================================='
%>
<!--#include virtual="/India/connection_global.asp"-->
<%
 'Declare The Variables'
 
 Dim rqEnrollUserId
 Dim strQuery,Rs
 
 Set Rs = server.CreateObject("ADODB.recordset")

'Retrive The enrolluserid From course.asp Page'

 rqEnrollUserId = Request.Querystring("enrollUserId")

'Sql Query For Retrive The comments For That EnrolledUser'

 strQuery = "SELECT * FROM prince2_enrolledusercomments WHERE enrolluserid = '" & rqEnrollUserId & "' ORDER BY commentid desc"

 Rs.Open strQuery,ConnObj

 %>
 <html>
 <head>
 <title>EnrollUser Coments</title>
 </head>
 <body>
 <table border="0" cellspacing="0" cellpadding="0">
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
