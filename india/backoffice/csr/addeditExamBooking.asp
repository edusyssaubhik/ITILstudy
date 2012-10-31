<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 '======================================================='
'Written By : Savita'
'Last UpDated : 09/04/2012'
'Description :'
'This Page Is Comes From terms_definition.asp Page'
'======================================================='%
 
%>
<% 
   If Session("UserId")  = "" Then
     Response.Redirect("/india/backOffice/login.asp")
   Else
%>
<!--#include virtual="/india/connection.asp"-->
<%
'-----------------------------------------------------------'
'Insert '
'-----------------------------------------------------------'

'Declare The Variables'
 
 Dim strQuery
 Dim rqATO_Ref_No 
 Dim rqExam_No
 Dim rqExam_Recp_No
 Dim rqCourseId,rqCand_No,rqId

 Dim rqType
 
 Set Rs = Server.CreateObject("ADODB.Recordset")

'Retrive Type From exam booking.asp Page'

 'rqType = Request.Form("Add")

'Retrive All terms Defintion Values From terms_Defintion.asp Page'

 rqATO_Ref_No       =  Request.Form("ATO_Ref_No")
 rqExam_No          =  Request.Form("Exam_No")
 rqExam_Recp_No     =  Request.Form("Exam_Recp_No")
  rqCourseId        =  Request.Form("CourseId")
  rqCand_No         =  Request.Form("Cand_No")
    rqId            =  Request.Form("enrollid")
	rqType          = Request.QueryString("type")


If rqType = "addCandNo" Then


 strQuery = "UPDATE ITIL_enrolledusers SET"
 strQuery = strQuery & " Cand_No = '" & rqCand_No & "'"
 strQuery = strQuery & " WHERE id = '" & rqId & "'"
 
'Response.write(strQuery)
 Rs.Open strQuery,Conn

 Session("message") = "You Have Successfully Added Candidate Number"

Response.Redirect("/india/backoffice/csr/courses.asp")



ElseIf rqType = "addExamNo" or rqType = "" Then

 strQuery = "UPDATE ITIL_course SET"
 strQuery = strQuery & " ATO_Ref_No = '" & rqATO_Ref_No & "',"
 strQuery = strQuery & " Exam_No = '" & rqExam_No & "',"
 strQuery = strQuery & " Exam_Recp_No = '" & rqExam_Recp_No & "'"
 strQuery = strQuery & " WHERE courseid = '" & rqCourseId & "'"
'Response.write(strQuery)
 Rs.Open strQuery,Conn

 Session("message") = "You Have Successfully Added Exam Booking Number"


 Response.Redirect("/india/backoffice/csr/courses.asp")

End If
End If


%>