<%@ LANGUAGE="VBScript" %>
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
<% If  Session("UserId")<> "" Then %>

<%
'Response.Buffer = True
'Response.ExpiresAbsolute = 0

Dim rqType,rqComment,strQuery1,rqUserId,todayDate,rqCompUserId,rqComplaintNo


Set Rs = Server.CreateObject("ADODB.Recordset")

rqUserId = Session("UserId")


rqType = request.Form("type")
rqComplaintNo = request.QueryString("complaint_no")
rqCompUserId = Request.form("compId")
 'response.Write(rqCompUserId)

'formatting date
	   todayDate = (YEAR(now()) & "-" & (Month(now())) & "-" & (DAY(now()))) 

If rqType = "Submit" then

 rqComment  =  Replace(Request.Form("comment"),"'","''")
 

 strQuery1 = "Insert Into support_compans (comment,complaint_no,replied_by,replied_on,country)"
 strQuery1 = strQuery1 & " Values "
 strQuery1 = strQuery1 & "('" & rqComment & "',"
  strQuery1 = strQuery1 & "'" & rqCompUserId & "',"
 strQuery1 = strQuery1 &  "'" & Session("UserId") & "',"
 strQuery1 = strQuery1 & "'" & now() & "',"
 strQuery1 = strQuery1 & "'" & Session("Country") & "')"
 

 Rs.Open strQuery1,Conn
 response.Write(strQuery1)

 Session("message") = "You Have Successfully Added Comment"
 Response.Redirect("admin_ComplaintLog.asp?complaint_no= "&rqComplaintNo&"")
 
 End If
%>
<%

  Conn.Close
  Else
  Response.Redirect("login.asp")
  End If
%>

