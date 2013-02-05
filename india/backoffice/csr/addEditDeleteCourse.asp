<%@ Language = "VBScript" %>
<% 'OPTION EXPLICIT %>
<%
 'Written By : Bharath'
 'Last UpaDated: 04/10/2007'
 'Description :'
 'Purpose : Insert/Edit/Update Course Details In DataBase'
 'This Page Comes From course.asp Page'
%>
<% 
   If Session("UserId")  = "" Then
     Response.Redirect("../login.asp")
   Else
%>
<!--#include virtual="/india/connection.asp"-->
<%
'------------------------------------------------------'
'Insert New Course'
'------------------------------------------------------'

 'Declare The Variables'

 Dim rqCity
 Dim rqStartDate
 Dim rqEndDate
 Dim rqStartHour
 Dim rqStartMin
 Dim rqStartSession
 Dim rqEndHour
 Dim rqEndMin
 Dim rqEndSession
 Dim rqPriceWithoutTax
 Dim rqTax
 Dim rqPriceWithTax
 Dim rqStatus
 Dim rqInstructor
 Dim rqBackUpInstructor
 Dim rqApplicableDays
 Dim rqEarlyBirdDiscount
 Dim rqAfterEBDiscountWithoutTax
 Dim rqAfterEBDiscountWithTax
 Dim rqHotelName
 Dim rqHotelPhoneNumber
 Dim rqHotelUrl
 Dim rqHotelAddress
 Dim strQuery
 Dim addCourse
 Dim rqCourseId
 Dim editCourse
 Dim reSheduleCourse
 Dim rqCourseType
 Dim rqCompany
 
 Dim rqEditCity
 Dim rqEditStartDate
 Dim rqEditEndDate
 Dim rqEditStartHour
 Dim rqEditStartMin
 Dim rqEditStartSession
 Dim rqEditEndHour
 Dim rqEditEndMin
 Dim rqEditEndSession
 Dim rqEditPriceWithoutTax
 Dim rqEditTax
 Dim rqEditPriceWithTax
 Dim rqEditInstructor
 Dim rqEditBackUpInstructor
 Dim rqEditCourseId
 Dim rqEditApplicableDays
 Dim rqEditEarlyBirdDiscount
 Dim rqEditAfterEBDiscountWithoutTax
 Dim rqEditAfterEBDiscountWithTax
 Dim rqEditHotelName
 Dim rqEditHotelPhoneNumber
 Dim rqEditHotelUrl
 Dim rqEditHotelAddress 
 Dim rqDeleteId 
 Dim rqEditCourseDates
 
 Dim rqCourseDates
  
'Retrive The Values From course.asp Page'

  addCourse = Request.Form("addcourse")
  reSheduleCourse = Request.Form("reschedule")
  rqEditCourseId = Request.Form("editcourseId")
  editCourse = Request.Form("editcourse")

'Retrive The New Course Details From course.asp Page'

 rqCity            =  Request.Form("city")
 rqStartDate 	   =  Request.Form("startdate")
 rqEndDate		   =  Request.Form("enddate")
 rqStartHour	   =  Request.Form("startinghour")
 rqStartMin		   =  Request.Form("startingminute")
 rqStartSession	   =  Request.Form("sessionstart")
 rqEndHour		   =  Request.Form("endinghour")
 rqEndMin		   =  Request.Form("endingminute")
 rqEndSession	   =  Request.Form("sessionend")
 rqPriceWithoutTax =  Request.Form("priceWithOutTax")
 rqTax			   =  Request.Form("tax")
 rqPriceWithTax    =  Request.Form("priceWithTax")
 rqInstructor      =  Request.Form("instructor")
 rqBackUpInstructor=  Request.Form("backupinstructor")
 rqApplicableDays    = Request.Form("applicabledays")
 rqEarlyBirdDiscount = Request.Form("earlybirddicount")
 rqAfterEBDiscountWithouttax   = Request.Form("afterearlybirddiscountwithouttax")
 rqAfterEBDiscountWithTax   = Request.Form("afterearlybirddiscountwithtax")
 rqHotelName         =  Replace(Request.Form("hotelname"),"'","''")
 rqHotelPhoneNumber  =  Request.Form("hotelphonenumber")
 rqHotelUrl          =  Request.Form("hotelurl") 
 rqHotelAddress      =  Replace(Request.Form("hoteladdress"),"'","''")
 rqCourseDates       =  Replace(Request.Form("coursedate"),"'","''")
 rqCourseType        =  Request.Form("coursetype")
 rqCompany           =  Request.Form("company")
 
 Response.Write(rqCourseType & "This is the course type")
If addCourse = "Add Course" Then

 strQuery = "INSERT INTO ITIL_course (city,startdate,enddate,starthour,startminute,startsession,endhour,endminute,endsession,pricewithouttax,tax,pricewithtax,instructor,backupinstructor,applicabledays,earlybirddiscount,afterEBdiscountwithouttax,afterEBdiscountwithtax,hotelname,hotelphonenumber,hotelurl,hoteladdress,createddate,country,coursedates,coursetype,status,company)"
 strQuery = strQuery & " Values "
 strQuery = strQuery & "('" & rqCity & "',"
 strQuery = strQuery & "'" & CDate(rqStartDate) & "',"
 strQuery = strQuery & "'" & CDate(rqEndDate) & "',"
 strQuery = strQuery & "'" & rqStartHour & "',"
 strQuery = strQuery & "'" & rqStartMin & "',"
 strQuery = strQuery & "'" & rqStartSession & "',"
 strQuery = strQuery & "'" & rqEndHour & "',"
 strQuery = strQuery & "'" & rqEndMin & "',"
 strQuery = strQuery & "'" & rqEndSession & "',"
 strQuery = strQuery & "'" & rqPriceWithoutTax & "',"
 strQuery = strQuery & "'" & rqTax & "',"
 strQuery = strQuery & "'" & rqPriceWithTax & "',"
 strQuery = strQuery & "'" & rqInstructor	 & "',"
 strQuery = strQuery & "'" & rqBackUpInstructor	 & "',"
 strQuery = strQuery & "'" & rqApplicableDays & "',"
 strQuery = strQuery & "'" & rqEarlyBirdDiscount & "',"
 strQuery = strQuery & "'" & rqAfterEBDiscountWithouttax & "',"
 strQuery = strQuery & "'" & rqAfterEBDiscountWithtax & "',"
 strQuery = strQuery & "'" & rqHotelName & "',"
 strQuery = strQuery & "'" & rqHotelPhoneNumber & "',"
 strQuery = strQuery & "'" & rqHotelUrl & "',"
 strQuery = strQuery & "'" & rqHotelAddress & "',"
 strQuery = strQuery & "'" & Now() & "',"
 strQuery = strQuery & "'" & session("country") & "',"
 strQuery = strQuery & "'" & rqCourseDates & "',"
 strQuery = strQuery & "'" & rqCourseType & "'," 
 strQuery = strQuery & "'Available'," 
 strQuery = strQuery & "'" & rqCompany & "')" 

 Rs.Open strQuery,Conn

 Session("message") = "You Have Successfully Added Course"
 %>
 <!--#include virtual="/includes/generator4datesandlocation.asp"-->  
<%If Session("Country") = "Germany" Then %>
  <!--#include virtual="/includes/generator4datesandlocation-German.asp"--> 
<%End If %> 
    <!--#include virtual="/includes/generator4CSI-Courses.asp"-->
    <!--#include virtual="/includes/generator4OSA-Courses.asp"-->
    <!--#include virtual="/includes/generator4ST-Courses.asp"-->
 <%
 
 Response.Redirect("courses.asp")

End If

'------------------------------------------------------'
'Edit/Re-Schedule Course Details'
'------------------------------------------------------'

 'Retrive The Edit Course Details From course.asp Page'
 
 rqEditCity            =  Request.Form("editcity")
 rqEditStartDate 	   =  Request.Form("editstartdate")
 rqEditEndDate		   =  Request.Form("editenddate")
 rqEditStartHour	   =  Request.Form("editstartinghour")
 rqEditStartMin		   =  Request.Form("editstartingminute")
 rqEditStartSession	   =  Request.Form("editsessionstart")
 rqEditEndHour		   =  Request.Form("editendinghour")
 rqEditEndMin		   =  Request.Form("editendingminute")
 rqEditEndSession	   =  Request.Form("editsessionend")
 rqEditPriceWithoutTax =  Request.Form("priceWithOutTax")
 rqEditTax			   =  Request.Form("tax")
 rqEditPriceWithTax    =  Request.Form("priceWithTax")
 rqEditInstructor      =  Request.Form("editinstructor")
 rqEditBackUpInstructor=  Request.Form("editbackupinstructor")
 rqEditApplicableDays    = Request.Form("applicabledays")
 rqEditEarlyBirdDiscount = Request.Form("earlybirddicount")
 rqEditAfterEBDiscountWithoutTax   = Request.Form("afterearlybirddiscountwithouttax")
 rqEditAfterEBDiscountWithTax   = Request.Form("afterearlybirddiscountwithtax")
 rqEditHotelName         =  Replace(Request.Form("edithotelname"),"'","''")
 rqEditHotelPhoneNumber  =  Request.Form("edithotelphonenumber")
 rqEditHotelUrl          =  Request.Form("edithotelurl") 
 rqEditHotelAddress      =  Replace(Request.Form("edithoteladdress"),"'","''")
 rqStatus                =  Request.Form("status")
 rqEditCourseDates       =  Request.Form("editcoursedate")

If editCourse = "Edit Course" Then

 strQuery = "UPDATE ITIL_course SET"
 strQuery = strQuery & " city = '" & rqEditCity  & "',"
 strQuery = strQuery & " startdate = '" & CDate(rqEditStartDate) &"',"
 strQuery = strQuery & " enddate = '"& CDate(rqEditEndDate) & "',"
 strQuery = strQuery & " starthour = '"& rqEditStartHour & "',"
 strQuery = strQuery & " startminute = '"& rqEditStartMin & "',"
 strQuery = strQuery & " startsession = '"& rqEditStartSession & "',"
 strQuery = strQuery & " endhour = '"& rqEditEndHour & "',"
 strQuery = strQuery & " endminute = '"& rqEditEndMin & "',"
 strQuery = strQuery & " endsession = '"& rqEditEndSession & "',"
 strQuery = strQuery & " pricewithouttax = '"& rqEditPriceWithoutTax &"',"
 strQuery = strQuery & " tax='"& rqEditTax &"',"
 strQuery = strQuery & " pricewithtax = '"& rqEditPriceWithTax & "',"
 strQuery = strQuery & " instructor = '" & rqEditInstructor	 & "',"
 strQuery = strQuery & " backupinstructor = '" & rqEditBackUpInstructor	 & "',"
 strQuery = strQuery & " applicabledays = '" & rqEditApplicableDays	 & "',"
 strQuery = strQuery & " earlybirddiscount = '" & rqEditEarlyBirdDiscount	 & "',"
 strQuery = strQuery & " afterEBdiscountwithouttax = '" & rqEditAfterEBDiscountWithoutTax	 & "',"
 strQuery = strQuery & " afterEBdiscountwithtax = '" & rqEditAfterEBDiscountWithTax & "',"
 strQuery = strQuery & " hotelname = '" & rqEditHotelName & "',"
 strQuery = strQuery & " hotelphonenumber = '" & rqEditHotelPhoneNumber & "',"
 strQuery = strQuery & " hotelurl = '" & rqEditHotelUrl & "',"
 strQuery = strQuery & " hoteladdress = '" & rqEditHotelAddress & "',"
 strQuery = strQuery & " status = '" & rqStatus & "'," 
 strQuery = strQuery & " coursedates = '" & rqEditCourseDates & "'," 
 strQuery = strQuery & " coursetype = '" & rqCourseType & "'," 
 strQuery = strQuery & " company = '" & rqCompany & "'"   
 strQuery = strQuery & " WHERE courseid = '" & rqEditCourseId &"'"

 Rs.Open strQuery,Conn

 Session("message") = "You Have Successfully Edited Course"
  %>
 <!--#include virtual="/includes/generator4datesandlocation.asp"--> 
<%If Session("Country") = "Germany" Then %> 
  <!--#include virtual="/includes/generator4datesandlocation-German.asp"-->  
<%End If %>
 <!--#include virtual="/includes/generator4CSI-Courses.asp"-->
    <!--#include virtual="/includes/generator4OSA-Courses.asp"--> 
 <%
 Response.Redirect("courses.asp")

End If

'Retrive The Delete Id From course.asp Page'

 rqDeleteId = Request.Querystring("delete")

If rqDeleteId <> "" Then

 strQuery = "DELETE FROM ITIL_course WHERE courseid = '" & rqDeleteId & "'"

 Rs.Open strQuery,Conn

Session("message") = "You Have Successfully Deleted The Course"
 %>
 <!--#include virtual="/includes/generator4datesandlocation.asp"-->
<%If Session("Country") = "Germany" Then %>
  <!--#include virtual="/includes/generator4datesandlocation-German.asp"-->  
<%End if %>
   <!--#include virtual="/includes/generator4CSI-Courses.asp"-->
    <!--#include virtual="/includes/generator4OSA-Courses.asp"-->
 <%
Response.Redirect("courses.asp")

End If


''Rs.Close
Conn.Close
End If
%>