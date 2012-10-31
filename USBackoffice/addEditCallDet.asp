<%@ Language = "VBScript" %>
<%
 'Written By : Bharath'
 'Last UpaDated: 13/08/2009'
 'Description :'
 'Purpose : Add and Edit Call Details page'
 'This page comes from scheClasses.asp page'
%>
<% If Session("USBUserId") <> "" Then %>
<!--#include file="includes/connection.asp"-->
<%
'Declare The Variables'
Dim rqAction
Dim rqCity
Dim rqEname
Dim rqClassStartDate
Dim rqClassEndDate
Dim rqPhoneNumber
Dim rqEmail
Dim strCallDet
Dim courseDate
Dim rqCallId
Dim objobjRs
Dim strCheckRec

Set objRs = Server.Createobject("ADODB.Recordset")

'Retrive the type of action'
'Action menas Add or Edit'
rqAction = Request.Form("type")
rqCity = Request.Form("city")      
rqEname = Request.Form("ename")
rqClassStartDate = Request.Form("startdate")
rqClassEndDate = Request.Form("enddate")
rqPhoneNumber = Request.Form("phoneno")
rqEmail = Request.Form("email")
rqCallId = Request.Form("callid")


'Adding new call details here'
If rqAction = "Add Calls Details" Then


 strCallDet = "INSERT INTO ps_callsreceived (city, ename, course_startdate, course_enddate, phone_number, emailid, addedby)"
 strCallDet = strCallDet & " values "
 strCallDet = strCallDet & "('" & rqCity & "',"
 strCallDet = strCallDet & "'" & rqEname & "',"
 strCallDet = strCallDet & "'" & rqClassStartDate & "',"
 strCallDet = strCallDet & "'" & rqClassEndDate & "'," 
 strCallDet = strCallDet & "'" & rqPhoneNumber & "',"
 strCallDet = strCallDet & "'" & rqEmail & "'," 
 strCallDet = strCallDet & "'" & Session("USBUserId") & "')"

 ConnObj.Execute strCallDet

 Session("messsge") = "You Have Successfully Added The Call Details"
 Response.Redirect("scheClasses.asp")

'Editing the call details here'
ElseIf rqAction = "Edit Calls Details" Then

'Sql Query For Updating the instructor'

 strCallDet = "UPDATE ps_callsreceived SET "
 strCallDet = strCallDet & " city = '" & rqCity & "',"
 strCallDet = strCallDet & " ename = '" & rqEname & "',"
 strCallDet = strCallDet & " course_startdate = '" & rqClassStartDate & "',"
 strCallDet = strCallDet & " course_enddate = '" & rqClassEndDate & "'," 
 strCallDet = strCallDet & " phone_number = '" & rqPhoneNumber & "',"
 strCallDet = strCallDet & " emailid = '" & rqEmail & "',"
 strCallDet = strCallDet & " addedby = '" & Session("USBUserId") & "'"
 strCallDet = strCallDet & " WHERE callid = '" & rqCallId &"'"  

 ConnObj.Execute strCallDet

'After Updating The Instructor Redirect to instructor.asp Page '

 Session("msg") = "You Have Successfully Edited The Call Details"
 Response.Redirect("scheClasses.asp")

'If check received'
ElseIf rqAction = "Recieved" Then 

  strCheckRec = "Update ps_callsreceived Set payment = 'Yes', payment_rec_by = '" & Session("USBUserId") & "' , payment_rec_date = '" & Now() & "' where  callid = '" & rqCallId & "'"

  ConnObj.Execute strCheckRec

  Response.Redirect("scheClasses.asp")


End if

Else
 Response.Redirect("../login.asp")
End if
%>
