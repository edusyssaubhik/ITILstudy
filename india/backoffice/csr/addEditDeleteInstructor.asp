<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 23/09/2010'
'Description :'
' Add/Edit/Delete instructors'
'======================================================='
%>
<% If Session("UserId") <> "" Then %>
<!--#include virtual="/india/connection.asp"-->
<%
 'Declare The Variables'
 Dim rqAdd, todayDate
 Dim rqEdit
 Dim rqEditId
 Dim rqDeleteId
 Dim strQuery2
 Dim strQuery3
 Dim strQuery1
 Dim revLevel
 Dim Rs1,Rs2,Rs3

 Set Rs  = Server.Createobject("ADODB.Recordset")
 Set Rs1 = Server.Createobject("ADODB.Recordset")
 Set Rs2 = Server.Createobject("ADODB.Recordset")
 Set Rs3 = Server.Createobject("ADODB.Recordset") 

'Retrive The Type From instructor.asp Page'

 rqAdd       =  Request.Form("addinstructor")
 rqEdit      =  Request.Form("editinstructor")
 rqDeleteId  =  Request.Querystring("deleteinstructorId")

'If you Adding New Instructor That values Comes Here and Insert Into DataBase'

'formatting date
	   todayDate = (YEAR(now()) & "-" & (Month(now())) & "-" & (DAY(now()))) 


If (rqAdd = "Add Instructor") Then

 Dim rqInstructorId
 Dim rqFirstName,UserId
 Dim rqLastName
 Dim rqEmail1
 Dim rqEmail2
 Dim rqPhoneNo1
 Dim rqPhoneNo2
 Dim rqCompName
 Dim rqCompAdd
 Dim rqCountry
 Dim rqComment
 Dim strQuery
 Dim FirstName
 Dim LastName
 Dim City
 Dim Location
 Dim rqUserId
 Dim rqPassword
 
 rqInstructorId          =  Session("maxInstructorId")
 rqFirstName             =  Trim(Request.Form("firstname"))
 rqLastName 		     =  Trim(Request.Form("lastname"))
 rqEmail1   		     =  Request.Form("email1")
 rqEmail2   		     =  Request.Form("email2")
 rqPhoneNo1			     =  Request.Form("phoneno1")
 rqPassword              =  Request.Form("pwd")
 rqCompName              =  Request.Form("compName")
 rqCompAdd               =  Replace(Request.Form("compAdd"),"'","''")
 rqAdd                   =  Replace(Request.Form("address"),"'","''")
 rqCountry               =  Request.Form("country") 
 

'Checking The Instructor Already Added Or Not'
'If Added That Instructor Through One Message "This Instructor Is Already Added"'
'Else Insert Into DataBase'

 strQuery2 = "SELECT firstname,lastname,emailid1 FROM ITIL_instructor WHERE emailid1 = '"& rqEmail1 &"' AND country = '"& session("country") &"'"
response.Write(strQuery2)
 Rs2.Open strQuery2,Conn

  If (not Rs2.BOF) and (not Rs2.EOF) Then

      FirstName =  Rs2("firstname")
      LastName  =  Rs2("lastname")
	  UserId =    Rs2("emailid1")

    If (rqEmail1 = UserId) Then

      Session("msg") = "This Instructor Already Added"
      Response.Redirect("instructor.asp")

   End if

  Else

 revLevel = 1

 strQuery = "INSERT INTO ITIL_instructor (firstname,lastname,emailid1,emailid2,phoneno1,comp_name,comp_addr,address1,country,pwd)"
 strQuery = strQuery & " values "
 strQuery = strQuery & "('" & rqFirstName & "',"
 strQuery = strQuery & "'" & rqLastName & "',"
 strQuery = strQuery & "'" & rqEmail1 & "',"
 strQuery = strQuery & "'" & rqEmail2 & "',"
 strQuery = strQuery & "'" & rqPhoneNo1 & "',"
 strQuery = strQuery & "'" & rqCompName & "',"
 strQuery = strQuery & "'" & rqCompAdd & "',"
 strQuery = strQuery & "'" & rqAdd & "',"
 strQuery = strQuery & "'" & session("country") & "',"
 strQuery = strQuery & "'" & rqPassword & "')"

'Response.Write(strQuery)
Rs.Open strQuery,Conn

'If You Entered Comment Then Only Add That Comment'

 If rqComment <> "" Then

 strQuery1 = "Insert Into ITIL_instructorcomments (comment,enteredby,createddate,revlevel,instid)"
 strQuery1 = strQuery1 & " Values "
 strQuery1 = strQuery1 & "('" & rqComment & "',"
 strQuery1 = strQuery1 & "'" & Session("UserId") & "',"
 strQuery1 = strQuery1 & "'" & todayDate & "',"
 strQuery1 = strQuery1 & "'" & revLevel & "',"
 strQuery1 = strQuery1 & "'" & rqInstructorId & "')"

Rs1.Open strQuery1,Conn

End If

End If

'Add Instructor If Condition Closed Here'
'And Redirecting This Page to instructor.asp Page'

 Session("msg") = "You Have Successfully Added The Instructor"
 Response.Redirect("instructor.asp")

'If You Editing The Instructor That Values Comes here'

Elseif(rqEdit = "Edit Instructor") Then

 Dim rqEditFirstName
 Dim rqEditLastName
 Dim rqEditEmail1
 Dim rqEditEmail2
 Dim rqEditPhoneNo1
 Dim rqEditCompName
 Dim rqEditCompAdd 
 Dim rqEditAdd 
 Dim rqEditCountry
 Dim rqRevLevel
 Dim rqNewRevLevel
 
 

 rqInstructorId              =  Request.Form("editinstructorid")
 rqEditFirstName             =  Trim(Request.Form("editfirstname"))
 rqEditLastName 		     =  Trim(Request.Form("editlastname"))
 rqEditEmail1   		     =  Request.Form("editemail1")
 rqEditEmail2   		     =  Request.Form("editemail2")
 rqEditPhoneNo1			     =  Request.Form("editphoneno1")
 rqEditCompName              =  Request.Form("editCompName")
 rqEditCompAdd               =  Replace(Request.Form("editCompAdd"),"'","''") 
 rqEditAdd	                 =  Replace(Request.Form("editAdd"),"'","''")
 rqEditCountry   	         =  Request.Form("editCountry")
 rqComment                   =  Replace(Request.Form("comment"),"'","''")
 rqRevLevel                  =  Session("maxRevLevel")
 rqPassword                  =  Request.Form("pwd")

'Sql Query For Updating the instructor'

 strQuery = "UPDATE ITIL_instructor SET "
 strQuery = strQuery & " firstname = '" & rqEditFirstName & "',"
 strQuery = strQuery & " lastname = '" & rqEditLastName & "',"
 strQuery = strQuery & " emailid1 = '" & rqEditEmail1 & "',"
 strQuery = strQuery & " emailid2 = '" & rqEditEmail2 & "',"
 strQuery = strQuery & " phoneno1 = '" & rqEditPhoneNo1 & "',"
 strQuery = strQuery & " comp_name = '" & rqEditCompName & "',"
 strQuery = strQuery & " comp_addr = '" & rqEditCompAdd & "',"
 strQuery = strQuery & " address1 = '" & rqEditAdd & "',"
 strQuery = strQuery & " country = '" & rqEditCountry & "',"
 strQuery = strQuery & " pwd = '" & rqPassword & "'" 
 strQuery = strQuery & " WHERE instid = '" & rqInstructorId &"'"
 

 Rs.Open strQuery,Conn
 
'Add The Comment'
 If rqComment <> "" Then

 strQuery1 = "Insert Into ITIL_instructorcomments (comment,enteredby,createddate,revlevel,instid)"
 strQuery1 = strQuery1 & " Values "
 strQuery1 = strQuery1 & "('" & rqComment & "',"
 strQuery1 = strQuery1 & "'" & Session("UserId") & "',"
 strQuery1 = strQuery1 & "'" & todayDate & "',"
 strQuery1 = strQuery1 & "'" & rqRevLevel & "',"
 strQuery1 = strQuery1 & "'" & rqInstructorId & "')"

 Rs1.Open strQuery1,Conn

 End If

'After Updating The Instructor Redirect to instructor.asp Page '

 Session("msg") = "You Have Successfully Edited The Instructor"
 Response.Redirect("instructor.asp?type=editOrDelete")

'If You Click The Delete That Will COmes Here'
'And Redirecting To instructor.asp Page'

Elseif rqDeleteId <> "" Then

 strQuery = "DELETE FROM ITIL_instructor Where instid = '" & rqDeleteId & "'"

 Rs.Open strQuery,Conn

 Session("msg") = "You Have Successfully Deleted The Instructor"
 Response.Redirect("instructor.asp?type=editOrDelete")

End If

'If you want only add comment that will come here'
'After add the comment redirecting to instructor.aps page'

Dim rqAddComment
Dim rqAddCommentInstructorId

rqAddComment   =  Request.Form("addcommnet")
rqInstructorId =  Request.Form("instructorId")
rqComment      =  Replace(Request.Form("comment"),"'","''")
rqRevLevel     =  Session("maxRevLevel")

If rqAddComment = "Add Comment" Then

 strQuery = "Insert Into ITIL_instructorcomments (comment,enteredby,createddate,revlevel,instid)"
 strQuery = strQuery & " Values "
 strQuery = strQuery & "('" & rqComment & "',"
 strQuery = strQuery & "'" & Session("UserId") & "',"
 strQuery = strQuery & "'" & todayDate & "',"
 strQuery = strQuery & "'" & rqRevLevel & "',"
 strQuery = strQuery & "'" & rqInstructorId & "')"

 Rs.Open strQuery,Conn

 Response.Redirect("instructor.asp?type=View&viewinstructorid=" &rqInstructorId)
End If

Rs.Close
Rs1.Close
Conn.Close
Else
 Response.Redirect("../backOffice/login.asp")
End if
%>
