<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<%
'======================================================='
'Written By : savita'
'Last UpDated : 09/12/2011'
'Description :'
'This Page Is Comes From complaint Page'
'======================================================='
%>
<% 
	If Session("UserId") = "" Then 
		Response.Redirect("../login.asp")
	Else
%>
<!-- #include virtual = "/includes/connection.asp"-->
<%

 'Declare The Variables'
 
 Dim rqCompUserId,rqType
 Dim strQuery, Rs,strComment,rqComment
 
 Set Rs = Server.CreateObject("ADODB.Recordset")

'Retrive The enrolluserid From course.asp Page'

 rqCompUserId = Request.Querystring("compId")
 'response.Write(rqCompUserId)

rqType = request.Form("type")
'Sql Query For Retrive The comments For That EnrolledUser'

 strQuery = "SELECT comment,replied_by,replied_on FROM support_compans where complaint_no = '"& rqCompUserId &"' ORDER BY id desc"

 Rs.Open strQuery,ConnObj
  
'response.Write(strQuery)
%>
<html>
<head>
<title>Complaint Comments History</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<table width="400" border="1" class="table1" >
  <tr>
    <td><b>Comments</b>  </td>
    <td><b>Replied By</b>  </td>
    <td><b>Replied On</b>  </td>
  </tr>
  <% Do Until Rs.EOF %>
  <tr>
    <td><% = Rs("comment") %></td>
    <td><% = Rs("replied_by") %></td>
    <td><% = Rs("replied_on") %></td>
  </tr>
  <% Rs.Movenext
     Loop
	 Rs.Close
     ConnObj.Close %>
</table>
</body>
</html>
<% End If %>