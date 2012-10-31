<%@ Language = "VBScript" %>

<%
'Written By : Priyanka'
'Created Date: 03/06/2011'
'Last UpaDated: 03/06/2011'
'Description :'
%>

<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<%
'Declare The Variables'
Dim rqEnrollId
Dim strQuery
Dim objRs,rqWebsite

'Creating Recordset'
Set objRs = Server.CreateObject("ADODB.Recordset")

'Retrive The enrolluserid From couobjRse.asp Page'
rqEnrollId = Request.Querystring("enrollid")
rqWebsite = Request.Querystring("website")

'In Enrolled but not paid  based on the website slected connection will be worked%>

<!--#include virtual="/includes/connection.asp"-->
<%

'Sql Query For Retrive The comments For That EnrolledUser'
strQuery = "SELECT * FROM ITIL_enroll_comments WHERE enrollid  =  '" & rqEnrollId & "' Order by enrollid desc"
					
					'response.Write(strQuery)
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

    <% = objRs("comment") %><br>
					 <% = objRs("comm_addedby") %> &nbsp;
				
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
