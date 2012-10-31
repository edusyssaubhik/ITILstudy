<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 'Written By : Bharath'
 'Last UpaDated: 24/09/2008'
 'Description :'
 'Purpose : Insert/Edit/Update Week End Course Details In DataBase'
 'This Page Comes From weekendcourse.asp Page'
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
 Dim rqFirstWeekStart
 Dim rqFirstWeekEnd
 Dim rqSecondWeekStart
 Dim rqSecondWeekEnd
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
 
 Dim rqEditCity
 Dim rqEditFirstWeekStart
 Dim rqEditFirstWeekEnd
 Dim rqEditSecondWeekStart
 Dim rqEditSecondWeekEnd
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
  
'Retrive The Values From course.asp Page'

  addCourse = Request.Form("addcourse")
  reSheduleCourse = Request.Form("reschedule")
  rqEditCourseId = Request.Form("editcourseId")
  editCourse = Request.Form("editcourse")

'Retrive The New Course Details From course.asp Page'

 rqCity            =  Request.Form("city")
 rqFirstWeekStart  =  Request.Form("firstweekstart")
 rqFirstWeekEnd	   =  Request.Form("firstweekend")
 rqSecondWeekStart =  Request.Form("secondweekstart")
 rqSecondWeekEnd   =  Request.Form("secondweekend") 
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
 
 
If addCourse = "Add Course" Then

 strQuery = "INSERT INTO ps_weekend_course (city,firstweek_startdate,firstweek_enddate,secondweek_startdate,secondweek_enddate,starthour,startminute,startsession,endhour,endminute,endsession,pricewithouttax,tax,pricewithtax,instructor,backupinstructor,applicabledays,earlybirddiscount,afterEBdiscountwithouttax,afterEBdiscountwithtax,hotelname,hotelphonenumber,hotelurl,hoteladdress,createddate,country,status)"
 strQuery = strQuery & " Values "
 strQuery = strQuery & "('" & rqCity & "',"
 strQuery = strQuery & "'" & CDate(rqFirstWeekStart) & "',"
 strQuery = strQuery & "'" & CDate(rqFirstWeekEnd) & "',"
 strQuery = strQuery & "'" & CDate(rqSecondWeekStart) & "',"
 strQuery = strQuery & "'" & CDate(rqSecondWeekEnd) & "'," 
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
 strQuery = strQuery & "'Available')" 


 Rs.Open strQuery,Conn

 Session("message") = "You Have Successfully Added Course"
 Response.Redirect("weekendcourses.asp")

End If

'------------------------------------------------------'
'Edit/Re-Schedule Course Details'
'------------------------------------------------------'

 'Retrive The Edit Course Details From course.asp Page'
 
 rqEditCity            =  Request.Form("editcity")
 rqEditFirstWeekStart  =  Request.Form("editfirstweekstart")
 rqEditFirstWeekEnd	   =  Request.Form("editfirstweekend")
 rqEditSecondWeekStart =  Request.Form("editsecondweekstart")
 rqEditSecondWeekEnd   =  Request.Form("editsecondweekend") 
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
 rqStatus                 =  Request.Form("status")

If editCourse = "Edit Course" Then

 strQuery = "UPDATE ps_weekend_course SET"
 strQuery = strQuery & " city = '" & rqEditCity  & "',"
 strQuery = strQuery & " firstweek_startdate = '" & CDate(rqEditFirstWeekStart) &"',"
 strQuery = strQuery & " firstweek_enddate = '"& CDate(rqEditFirstWeekEnd) & "',"
 strQuery = strQuery & " secondweek_startdate = '" & CDate(rqEditSecondWeekStart) &"',"
 strQuery = strQuery & " secondweek_enddate = '"& CDate(rqEditSecondWeekEnd) & "'," 
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
 strQuery = strQuery & " status = '" & rqStatus & "'" 
 strQuery = strQuery & " WHERE courseid = '" & rqEditCourseId &"'"

 Rs.Open strQuery,Conn

 Session("message") = "You Have Successfully Edited Course"
 Response.Redirect("weekendcourses.asp")

End If

'Retrive The Delete Id From course.asp Page'

 rqDeleteId = Request.Querystring("delete")

If rqDeleteId <> "" Then

 strQuery = "DELETE FROM ps_weekend_course WHERE courseid = '" & rqDeleteId & "'"

 Rs.Open strQuery,Conn

Session("message") = "You Have Successfully Deleted The Course"
Response.Redirect("weekendcourses.asp")

End If


''Rs.Close
Conn.Close
End If
%>