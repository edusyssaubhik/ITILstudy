<%@ LANGUAGE="VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Bharath'
'Created Date : 17/02/2012'
'Modified By : Bharath'
'Modified Date : 17/02/2012'
'Description :'
'Purpose :Inserting Exam Result'
'======================================================='
%>
<!--#include virtual="/India/connection_global.asp"-->
<% If not Session("UserId") = "" Then %>
<%
Response.Buffer = True
Response.ExpiresAbsolute = 0

Dim rqFoundation,rqPractitioner,rqPrimaryEmail
Dim rqActive, conObj,rqComment
Dim rqType,rqStatus,rqUser,strQuery,strQuery1,strQuery2,rqEnrollUserId
Dim rqUserId,rqEnrollDate,rqRevLevel
Dim ChangeStatusDateBy
Dim rqStatusNumber,rqCourseDetails,rqCity,str,i
Dim rqCourseId, rqEnrollStatus,Rs

set Rs = Server.CreateObject("ADODB.Recordset")



rqUserId = Session("UserId")

'-------------------------------'
' Extracting values from posted values'
' for serching'
'-------------------------------'

	rqType				= Request.Querystring("type")
	rqFoundation	    = Request.Form("foundation")
	rqPractitioner      = Request.Form("practitioner")
    rqEnrollUserId      = Request.form("enrollUserId")
	rqCourseId          = Request.Form("courseId")



If rqType = "submit" Then


	  strQuery = "Update prince2_enrolledusers Set Foundation = '" & rqFoundation & "' where  id = '" & rqEnrollUserId & "'"
response.Write(strQuery)
      Rs.Open strQuery,ConnObj

      Response.redirect("PRINCE2-BCourses.asp?CourseId="&rqCourseId)
	  
ElseIf rqType = "save" Then


	  strQuery = "Update prince2_enrolledusers Set Practitioner = '" & rqPractitioner & "'  where  id = '" & rqEnrollUserId & "'"
response.Write(strQuery)
      Rs.Open strQuery,ConnObj

      Response.redirect("PRINCE2-BCourses.asp?CourseId="&rqCourseId)

	End If




%>
<%

  ConnObj.Close
  Else
  Response.Redirect("/India/backoffice/login.asp")
  End If
%>