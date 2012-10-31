<%@ Language = "VBScript" %>
<% 'OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Bharath'
'Created Date : 17/02/2012'
'Modified By : Bharath'
'Modified Date : 17/02/2012'
'Description :'
'Add/Edit/Delete PRINCE2 Course Page '
'======================================================='
%>
<% 
   If Session("UserId")  = "" Then
     Response.Redirect("/India/backOffice/login.asp")
   Else
%>
<!--#include virtual="/India/connection_global.asp"-->
<%
'------------------------------------------------------'
'Insert New Course'
'------------------------------------------------------'

 'Declare The Variables'

 Dim rqCity, rqCourseName
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
 Dim rsQuery,strCourses,generate,rqdate,strEnding,iCount,Currency_Format_Front,Currency_Format_Back,ApplicableDays,bgColor,fsoObject

 Dim rqEditCity,rqEditCourseName
 Dim rqEditStartDate,editStartDate
 Dim rqEditEndDate,editEndDate
 Dim rqEditStartHour
 Dim rqEditStartMin
 Dim rqEditStartSession
 Dim rqEditEndHour
 Dim rqEditEndMin
 Dim rqEditEndSession
 Dim rqEditPriceWithoutTax
 Dim rqEditTax,rqEditCourseDates
 Dim rqEditPriceWithTax
 Dim rqEditInstructor
 Dim rqEditBackUpInstructor
 Dim rqEditCourseId, strGetQuery
 Dim rqEditApplicableDays
 Dim rqEditEarlyBirdDiscount
 Dim rqEditAfterEBDiscountWithoutTax
 Dim rqEditAfterEBDiscountWithTax
 Dim rqEditHotelName
 Dim rqEditHotelPhoneNumber, courseDate
 Dim rqEditHotelUrl,StartDate, EndDate, lastRow, rowCounter
 Dim rqEditHotelAddress ,rqCourseDates, numRows, firstRow
 Dim rqDeleteId ,todayDate,Rs, rsQues, arrAllCourses
 
 
 
 Set Rs  = Server.CreateObject("ADODB.Recordset")
 Set rsQues  = Server.CreateObject("ADODB.Recordset")
  
'Retrive The Values From PRINCE2-BCourse.asp Page'

  addCourse = Request.Form("addcourse")
  reSheduleCourse = Request.Form("reschedule")
  rqEditCourseId = Request.Form("editcourseId")
  editCourse = Request.Form("editcourse")
  response.Write(editCourse)

'Retrive The New Course Details From course.asp Page'

 rqCity            =  Request.Form("city")
 rqCourseName      =  Request.Form("course")
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
 rqInstructor      =  Trim(Request.Form("instructor"))
 rqBackUpInstructor=  Trim(Request.Form("backupinstructor"))
 rqApplicableDays    = Request.Form("applicabledays")
 rqEarlyBirdDiscount = Request.Form("earlybirddicount")
 rqAfterEBDiscountWithouttax   = Request.Form("afterearlybirddiscountwithouttax")
 rqAfterEBDiscountWithTax   = Request.Form("afterearlybirddiscountwithtax")
 rqHotelName         =  Replace(Request.Form("hotelname"),"'","''")
 rqHotelPhoneNumber  =  Request.Form("hotelphonenumber")
 rqHotelUrl          =  Request.Form("hotelurl") 
 rqHotelAddress      =  Replace(Request.Form("hoteladdress"),"'","''")
 rqCourseDates      =  Replace(Request.Form("coursedate"),"'","''")
 
 
 

 'formatting date
 todayDate = (YEAR(now()) & "-" & (Month(now())) & "-" & (DAY(now()))) 
  StartDate = (YEAR(rqStartDate) & "-" & (Month(rqStartDate)) & "-" & (DAY(rqStartDate)))
   EndDate = (YEAR(rqEndDate) & "-" & (Month(rqEndDate)) & "-" & (DAY(rqEndDate))) 
 

If addCourse = "Add Course" Then

 strQuery = "INSERT INTO prince2_course (city,courseName, startdate,enddate,starthour,startminute,startsession,endhour,endminute,endsession,pricewithouttax,tax,pricewithtax,instructor,backupinstructor,applicabledays,earlybirddiscount,afterEBdiscountwithouttax,afterEBdiscountwithtax,hotelname,hotelphonenumber,hotelurl,hoteladdress,createddate,country,coursedates,status)"
 strQuery = strQuery & " Values "
 strQuery = strQuery & "('" & rqCity & "',"
 strQuery = strQuery & "'" & rqCourseName & "',"
 strQuery = strQuery & "'" & StartDate & "',"
 strQuery = strQuery & "'" & EndDate & "',"
 strQuery = strQuery & "'" & rqStartHour & "',"
 strQuery = strQuery & "'" & rqStartMin & "',"
 strQuery = strQuery & "'" & rqStartSession & "',"
 strQuery = strQuery & "'" & rqEndHour & "',"
 strQuery = strQuery & "'" & rqEndMin & "',"
 strQuery = strQuery & "'" & rqEndSession & "',"
 strQuery = strQuery & "'" & rqPriceWithoutTax & "',"
 strQuery = strQuery & "'" & rqTax & "',"
 strQuery = strQuery & "'" & rqPriceWithTax & "',"
 strQuery = strQuery & "'" & rqInstructor & "',"
 strQuery = strQuery & "'" & rqBackUpInstructor	 & "',"
 strQuery = strQuery & "'" & rqApplicableDays & "',"
 strQuery = strQuery & "'" & rqEarlyBirdDiscount & "',"
 strQuery = strQuery & "'" & rqAfterEBDiscountWithouttax & "',"
 strQuery = strQuery & "'" & rqAfterEBDiscountWithtax & "',"
 strQuery = strQuery & "'" & rqHotelName & "',"
 strQuery = strQuery & "'" & rqHotelPhoneNumber & "',"
 strQuery = strQuery & "'" & rqHotelUrl & "',"
 strQuery = strQuery & "'" & rqHotelAddress & "',"
 strQuery = strQuery & "'" & todayDate & "',"
 strQuery = strQuery & "'" & session("country") & "',"
 strQuery = strQuery & "'" & rqCourseDates & "',"
 strQuery = strQuery & "'Available')" 

 Rs.Open strQuery,ConnObj
 
 'Getting values
	
					strGetQuery = "SELECT course.*, city.state_code, course.startdate, course.enddate FROM prince2_course course, ps_city city Where course.city = '"&rqCity&"' and city.city = '"&rqCity&"' And  (course.startdate ='"&StartDate&"' or  course.enddate ='"&EndDate&"')  And course.country = '" & session("country") & "' AND city.country = '" & session("country") & "' And createddate = '"&todayDate&"'  And courseName= 'Foundation and Practitioner' and  course.status <> 'Cancelled'  ORDER BY month(course.startdate) ,course.city DESC"
					 
					 
					response.Write(strGetQuery)
					 	
				    Rs.Open strGetQuery,ConnObj
	
					 If Not Rs.EOF Then
			
						arrAllCourses = Rs.getrows
						Session("arrAllCourses") = arrAllCourses
						numRows = Ubound(arrAllCourses,2)
						firstRow = 0
						lastRow = numRows
					  End If
	
					  Rs.Close
 

 If IsArray(arrAllCourses)  Then
		
	For rowCounter = firstRow to lastRow 
	
		courseDate = arrAllCourses(3,rowCounter)
		Response.Write(courseDate)
		
		 
 
 strQuery = "UPDATE prince2_course SET classdate = '"& courseDate &"' WHERE city = '"&arrAllCourses(2,rowCounter)&"' and startdate between '"&cdate(courseDate)&"' and '"&cdate(courseDate+4)&"' and country = '" & session("country") & "'"
						
		    Response.Write(strQuery & "<br>")
	
			rsQues.Open strQuery,connObj
			
			
	 Next	
	 End IF
		



response.Write(strQuery)
 Session("message") = "You Have Successfully Added Course"
 %>    
            
<% 

 Response.Redirect("PRINCE2-BCourses.asp")

End If

'------------------------------------------------------'
'Edit/Re-Schedule Course Details'
'------------------------------------------------------'

 'Retrive The Edit Course Details From course.asp Page'
 
 rqEditCity            =  Request.Form("editcity")
 rqEditCourseName      =  Request.Form("editCourseName")
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
 rqEditInstructor      =  Trim(Request.Form("editinstructor"))
 rqEditBackUpInstructor=  Trim(Request.Form("editbackupinstructor"))
 rqEditApplicableDays    = Request.Form("applicabledays")
 rqEditEarlyBirdDiscount = Request.Form("earlybirddicount")
 rqEditAfterEBDiscountWithoutTax   = Request.Form("afterearlybirddiscountwithouttax")
 rqEditAfterEBDiscountWithTax   = Request.Form("afterearlybirddiscountwithtax")
 rqEditHotelName         =  Replace(Request.Form("edithotelname"),"'","''")
 rqEditHotelPhoneNumber  =  Request.Form("edithotelphonenumber")
 rqEditHotelUrl          =  Request.Form("edithotelurl") 
 rqEditHotelAddress      =  Replace(Request.Form("edithoteladdress"),"'","''")
 rqStatus                 =  Request.Form("status")
 rqEditCourseDates      =  Replace(Request.Form("editcoursedate"),"'","''")
 
 'Converting date format - YYYY-MM-DD' 
	     editStartDate = (YEAR(rqEditStartDate) & "-" & (Month(rqEditStartDate)) & "-" & (DAY(rqEditStartDate)))
		 'response.Write(editStartDate)
		 editEndDate = (YEAR(rqEditEndDate) & "-" & (Month(rqEditEndDate)) & "-" & (DAY(rqEditEndDate)))
		 'response.Write(editEndDate)
		 


If editCourse = "Edit Course" Then

 strQuery = "UPDATE prince2_course SET"
 strQuery = strQuery & " city = '" & rqEditCity  & "',"
 strQuery = strQuery & " courseName = '" & rqEditCourseName  & "',"
 strQuery = strQuery & " startdate = '" & editStartDate &"',"
 strQuery = strQuery & " enddate = '"& editEndDate & "',"
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
 strQuery = strQuery & " coursedates = '" & rqEditCourseDates & "',"
 strQuery = strQuery & " status = '" & rqStatus & "'" 
 strQuery = strQuery & " WHERE courseid = '" & rqEditCourseId &"'"
 
 Rs.Open strQuery,ConnObj

response.Write(strQuery)
 Session("message") = "You Have Successfully Edited Course"
 %>    
<% 

 Response.Redirect("PRINCE2-BCourses.asp")

End If

'Retrive The Delete Id From course.asp Page'

 rqDeleteId = Request.Querystring("delete")

If rqDeleteId <> "" Then

 strQuery = "DELETE FROM prince2_course WHERE courseid = '" & rqDeleteId & "'"

 Rs.Open strQuery,ConnObj

Session("message") = "You Have Successfully Deleted The Course"
%>    
<% 

Response.Redirect("PRINCE2-BCourses.asp")

End If


''Rs.Close
ConnObj.Close
End If
%>