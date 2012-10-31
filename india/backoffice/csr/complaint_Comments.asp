<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 23/09/2010'
'Description :'
'This Page Is Comes From user.asp Page'
'======================================================='
%>
<!--#include virtual="/india/connection.asp"-->

<%
 'Declare The Variables'
 
 Dim rqCompUserId,rqType
 Dim strQuery, strComment,rqComment
 
 Set Rs = Server.CreateObject("ADODB.Recordset")

'Retrive The enrolluserid From course.asp Page'

 rqCompUserId = Request.Querystring("compId")
 'response.Write(rqCompUserId)

rqType = request.Form("type")
'Sql Query For Retrive The comments For That EnrolledUser'



 strQuery = "SELECT comment,replied_by,replied_on FROM support_compans where complaint_no = '"& rqCompUserId &"' ORDER BY id desc"

 Rs.Open strQuery,Conn
  
'response.Write(strQuery)


 %>
 <html>
 <head>
 <title>Comments</title>
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

   
    
    <% = Rs("comment") %><br><% = Rs("replied_by") %>&nbsp;
 <% = Rs("replied_on") %>


    </li>
	  <% Rs.Movenext
     Loop %>
   </ol>
   <% 
   'response.Redirect("admin_ComplaintLog.asp")
    %>
   </td>
  </tr>

 </table>
 </body>
 </html>
