<%@ LANGUAGE="VBScript" %>
<% OPTION EXPLICIT %>
<%
 'Written By : Priyanka'
 'Last UpaDated: 26/05/2011'
 'Description :'
 'Purpose :Inserting Exam Result'
%>
<!--#include virtual ="/india/connection-PROJ.asp"-->
<% If not Session("UserId") = "" Then %>
<%
Response.Buffer = True
Response.ExpiresAbsolute = 0

Dim rqFoundation,rqPractitioner,rqPrimaryEmail
Dim rqActive, conObj,rqComment
Dim rqType,rqStatus,rqUser,strQuery,strQuery1,strQuery2,rqEnrollUserId
Dim rqUserId,rqEnrollDate,rqRevLevel
Dim ChangeStatusDateBy,rqMarks
Dim rqStatusNumber,rqCourseDetails,rqCity,str,i
Dim rqCourseId

set Rs = Server.CreateObject("ADODB.Recordset")



rqUserId = Session("UserId")

'-------------------------------'
' Extracting values from posted values'
' for serching'
'-------------------------------'

	rqType				= Request.Querystring("type")
	rqMarks	    = Request.Form("foundation")
    rqEnrollUserId      = Request.form("enrollUserId")
	rqCourseId          = Request.Form("courseId")



If rqType = "submit" Then


	  strQuery = "Update PROJITIL_enrolledusers Set Marks = '" & rqMarks & "' where  id = '" & rqEnrollUserId & "'"
response.Write(strQuery)
      Rs.Open strQuery,Conn

      Response.redirect("ITIL-courses.asp?CourseId="&rqCourseId)
	  
ElseIf rqType = "save" Then


	  strQuery = "Update PROJITIL_enrolledusers Set Practitioner = '" & rqPractitioner & "'  where  id = '" & rqEnrollUserId & "'"
response.Write(strQuery)
      Rs.Open strQuery,Conn

      Response.redirect("ITIL-courses.asp?CourseId="&rqCourseId)

	End If




%>
<%

  Conn.Close
  Else
  Response.Redirect("../login.asp")
  End If
%>