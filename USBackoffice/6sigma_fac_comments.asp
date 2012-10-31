<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'Written By : Bharath'
'Created Date: 19/08/2009'
'Last UpaDated: 19/08/2009'
'Description :'
%>
<!--#include virtual="/includes/connection.asp"-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<%
'Declare The Variables'
Dim rqCallId
Dim strQuery
Dim objRs

'Creating Recordset'
Set objRs = Server.CreateObject("ADODB.Recordset")

'Retrive The enrolluserid From couobjRse.asp Page'
rqCallId = Request.Querystring("callid")

'Sql Query For Retrive The comments For That EnrolledUser'
strQuery = "SELECT * FROM sixsigma_fac_comments WHERE callid = '" & rqCallId & "' Order by f_cid desc"

objRs.Open strQuery,ConnObj


%>
 <html>
 <head>
 <title>Faculty Comments</title>
 </head>
 <body>
 <table border="0" cellspacing="0" cellpadding="0">
  <tr>
   <td>
   <ol>
   	  <% do until objRs.EOF %>
    <li>

    <% = objRs("f_comment") %><br>Call initiated by <% = objRs("comm_addedby") %>&nbsp;
 <% = objRs("comm_date") %>

    </li>
	<li>&nbsp;</li>
	  <% objRs.Movenext
     	 Loop
		 objRs.Close  %>
   </ol>
   </td>
  </tr>
 </table>
 </body>
 </html>
