<%@ Language = "VBScript" %>
<%
'======================================================='
'Written By : Bharath'
'Created Date : 17/02/2012'
'Modified By : Bharath'
'Modified Date : 17/02/2012'
'Description :'
'Purpose : In This Page We Diplaying All Courses'
'Re-Scheduling The Course'
'This Page Comes From courses.asp Page'
'======================================================='
%>
<!--#include virtual="/India/connection_global.asp"-->
<!--#include virtual ="/includes/displayFormat.asp"-->
<%
 'Declare The Variables'
 Dim strQuery,strQuery1,strQuery2,strQuery3,strQuery4,CourseDate
 Dim ApplicableDays,rqReschedule,rqRescheduledCourse
 Dim FirstName,LastName,Email,NameOfEmployeer,PhoneNumber,Pmbok
 Dim startingDate,splitStartDate,endingDate,splitEndDate
 Dim Course,Course1,Course2,i,todaysDate,Date2
 Dim price,dbprice,dtax,coursePrice,Total,Rs,CourseName
 Dim CheckReceived,CheckReceivedDate,CheckReceivedBy
 Dim rqEnrollUserId,StatusNumber,CourseId,str7,DiscountPercentage,PMBokPrice,rqCourseID
 Dim strDisplay,rqType,rqStatus,rqUserId,ChangeStatusDateBy,rqActive,rqStatusNumber,rqAction
 Dim rqRescheduleCourse,str,rqResCourseID,rqVAT
 Dim rqRegType,rqWeekendType,str1,str6,rqReschRegCourse,rqReschWeekendCourse

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function
  
 rqCourseId     =  Request.Form("courseId")
 rqEnrollUserId =  Request.Form("enrollUserId")
 rqType	        =  Trim(Request.Form("changestatus"))
 rqAction       =  Request.Form("type")
 rqUserId       =  Session("UserId")
 rqAmount      =  Request.Form("Amount")

'Currency Format Display Functions'

 Currency_Format_Front = CurrencyFormat_Front(session("country"))
 Currency_Format_Back = CurrencyFormat_Back(session("country"))


 Set Rs = Server.CreateObject("ADODB.Recordset")
 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs2 = Server.CreateObject("ADODB.Recordset")
 
 'Re-Schedule Not Confirmed  
 If rqType = "Re-Schedule Not Confirmed" Then 


	  ChangeStatusDateBy = Now() & " by " & rqUserId
	  rqStatus = "Re-Schedule Not Confirmed"
	  rqStatusNumber = 5
	  
	  rqCourseId     =  Request.Form("courseId")

  	  strQuery1 =  "Update prince2_enrolledusers set status = '" & rqStatus & "',changestatusdateby = '" & ChangeStatusDateBy &"',statusnumber = '" & rqStatusNumber & "'  where id = '" & rqEnrollUserId & "'"
	
 	Response.Write(strQuery1)
     Rs1.Open strQuery1,ConnObj
     ' Rs1.Close
     'Response.Write(strQuery1)
	
     Response.Redirect("PRINCE2-BCourses.asp?CourseId="&rqCourseId)
 
End If

 'Status changing from Re-Schedule Not Confirmed to Active'
 If rqType = "Active" Then 


	  ChangeStatusDateBy = Now() & " by " & rqUserId
	  rqStatus = "Active"
	  rqStatusNumber = 1
	  
	  rqCourseId     =  Request.Form("courseId")

  	  strQuery1 =  "Update prince2_enrolledusers set status = '" & rqStatus & "',changestatusdateby = '" & ChangeStatusDateBy &"',statusnumber = '" & rqStatusNumber & "'  where id = '" & rqEnrollUserId & "'"
	
     ConnObj.Execute strQuery1
	
     Response.Redirect("PRINCE2-BCourses.asp?CourseId="&rqCourseId)
 
End If


 If rqAction = "Cancel" Then

  ChangeStatusDateBy = Now() & " by " & rqUserId
  rqStatus = "Cancel" 
  rqStatusNumber = 3
  
   rqCanAmount =  Request.Form("CanAmount")

  
    strQuery1 =  "Update prince2_enrolledusers set status = '" & rqStatus & "',changestatusdateby = '" & ChangeStatusDateBy &"',statusnumber = '" & rqStatusNumber & "',res_can_mbg_amount = '" & rqCanAmount & "'  where id = '" & rqEnrollUserId & "'"

    Rs1.Open strQuery1,ConnObj
   ' Rs1.Close
	
	'response.Write(strQuery1)
  Response.Redirect("PRINCE2-BCourses.asp?CourseId="&rqCourseId)
	
ElseIf rqAction = "ERG" Then

'ERG
 ChangeStatusDateBy = Now() & " by " & rqUserId
  rqStatus = "ERG" 
  rqStatusNumber = 5
  
    rqRefAmount =  Request.Form("RefAmount")
    rqCourseId     =  Request.Form("courseId")

  
    strQuery1 =  "Update prince2_enrolledusers set status = '" & rqStatus & "',changestatusdateby = '" & ChangeStatusDateBy &"',statusnumber = '" & rqStatusNumber & "',res_can_mbg_amount = '" & rqRefAmount & "'  where id = '" & rqEnrollUserId & "'"

    Rs1.Open strQuery1,ConnObj
   ' Rs1.Close
	
    Response.Redirect("PRINCE2-BCourses.asp?CourseId="&rqCourseId)


 
 ElseIf rqAction = "Re-Schedule" Then

 'Dispaly The Today Date'

 todaysDate=now()

'Increment 5 Days and Display That'

 Date2 = DateAdd("d", +6,CDate(todaysDate)) 

' If rqType = "Re-Schedule" Then

 'Retrive Values From This Page'
 
  strQuery1 = "SELECT * FROM prince2_enrolledusers WHERE id = '"& rqEnrollUserId &"'"
  	 
  Rs.Open strQuery1,ConnObj
  
  Do Until Rs.EOF 
  
   FirstName         =  Rs("firstname")
   LastName          =  Rs("lastname")
   Email             =  Rs("email")
   NameOfEmployeer   =  Replace(Rs("nameofemployeer"),"'","''")
   PhoneNumber       =  Rs("phoneno")
   rqStreet          =  Rs("street")
   rqCity            =  Rs("city")
   rqState           =  Rs("state1")
   rqPostalCode      =  Rs("postalCode")
   rqSpeReq           =  Rs("speReq")
   CheckReceived     =  Rs("checkreceived")
   CheckReceivedDate =  Rs("checkreceiveddate")
   CheckReceivedBy   =  Rs("checkreceivedby")
   PRINCE2Manual =  Rs("PRINCE2Manual")
   PRINCE2price   =  Rs("PRINCE2price")
   StatusNumber      =  Rs("statusnumber")
   DiscountPercentage=  Rs("discountpercentage")
   rqCourseID        =  Rs("courseid")
   rqAmount          =  Rs("Amount")
   rqOldCourseDet    =  Rs("coursedetails")
   rqOldResAmount    =  Rs("res_can_mbg_amount")
   rqVAT             =  Rs("VAT")
   
   
   'Retrive the course details and split the city, course date and price'
   'Because of displaying the course details in the email and city for sending the emails to faculty'
   rqCourseDetails   =  Split(Rs("coursedetails"),"for ")
   
   CourseDetails1 = rqCourseDetails(0)
   
   CourseDetails2 = Split(rqCourseDetails(0),":")

   oldCity = Trim(CourseDetails2(0))   
   oldCourseDate = CourseDetails2(1)
   
  Rs.Movenext
  Loop
  
  Rs.Close

 'End If   


 'rqReschedule = Request.Form("reschedule")
 
 'If rqReschedule = "Re-Schedule" Then
 
  rqResCourseID = Request.Form("reschCourseID")
   rqResAmount = request.Form("ResAmount")

' If rqResCourseID <> "" Then

	'SQL Query For Retrieve The Prices Displaying in The Step Two'

	 strQuery2 = "SELECT * FROM prince2_course Where courseid = '" & rqResCourseID & "'"

      response.Write(strQuery2)
	 Rs.Open strQuery2,ConnObj

	 Do until Rs.EOF
		CourseName = Rs("courseName")
		City       = Rs("city")
		StartDate  = Rs("startdate")
		EndDate    = Rs("enddate")
		ApplicableDays = Rs("applicabledays")

		If (CDate(StartDate)-(Date()+ApplicableDays+1) >= 0) Then
			Total = Rs("afterEBdiscountwithtax")
			TotalCCAvenue = Int(Rs("afterEBdiscountwithtax"))
		Else
			Total = Rs("pricewithtax") 
			TotalCCAvenue = Int(Rs("pricewithtax"))
		End If
		
		Tax = Rs("tax")

	 Rs.movenext
	 Loop
     Rs.Close					 

	 CourseDetails = CourseName & " - " & City & " : " & FormatDateTime(StartDate,1) & " to " & FormatDateTime(EndDate,1) & " for " & Currency_Format_Front & " " & FormatNumber(rqAmount) & " " & Currency_Format_Back

	CourseDate = StartDate & " to " & EndDate	
 

	If StatusNumber = 4 Then
	   StatusNumber = 4
	Else
	   StatusNumber = 1 
	End If
	
		If IsNull(rqOldResAmount) Then
			TotalResAmount = rqResAmount
		Else
			TotalResAmount = (Int(rqResAmount) + Int(rqOldResAmount))
		End If

		TotalWithoutTax = Int(rqAmount) + Int(TotalResAmount)
		
		Response.Write("Res: "& TotalResAmount)
		
		'for displaying the prices in UK'
		'Actual amount and VAT'
		If (Session("country") = "United Kingdom" OR Session("country") = "India" OR Session("country") = "Australia" ) Then
		    
			'X is calculating the revised VAT percentage'
			x = (1 + (Tax/100))
			
				
				'Calculating the VAT refunded'
				RevisedVAT1 = (TotalResAmount - (TotalResAmount/x))

				
				'Calculating the course fee in reschedule amount'
				RevCourseFee1 = TotalResAmount - RevisedVAT1



				'Calculating the Revised VAT'
				'RevisedVAT = rqVAT + RevisedVAT1
				  RevisedVAT = rqVAT + RevisedVAT1

				'Revised Course Fee after deducting the Revised VAT'
				RevisedCourseFee = Round(Int(rqAmount) + Int(rqResAmount))

		Else
		
			RevisedCourseFee = (Int(rqAmount) + Int(rqResAmount))
			
		End If		



	  strQuery3 = "INSERT INTO prince2_enrolledusers (firstname,lastname,email,nameofemployeer,phoneno,coursedetails,coursedate,amount,dateofenrollment,paybefore,status,checkreceived,checkreceiveddate,checkreceivedby,PRINCE2Manual,PRINCE2price,statusnumber,courseid,discountpercentage,res_can_mbg_amount,VAT,street,city,state1,postalCode,speReq,country)"
	 strQuery3 = strQuery3 & " Values "
	 strQuery3 = strQuery3 & "('" & FirstName & "',"
	 strQuery3 = strQuery3 & "'" & LastName & "',"
	 strQuery3 = strQuery3 & "'" & Email & "',"
	 strQuery3 = strQuery3 & "'" & NameOfEmployeer & "',"
	 strQuery3 = strQuery3 & "'" & PhoneNumber & "',"
	 strQuery3 = strQuery3 & "'" & CourseDetails & "',"
	 strQuery3 = strQuery3 & "'" & CourseDate & "',"
	 strQuery3 = strQuery3 & "'" & (Int(RevisedCourseFee)) & "',"
	 strQuery3 = strQuery3 & "'" & now() & "',"
	 strQuery3 = strQuery3 & "'" & Date2 & "',"
	 strQuery3 = strQuery3 & "'Active'," 
	 strQuery3 = strQuery3 & "'" & checkreceived & "'," 
	 strQuery3 = strQuery3 & "'" & checkreceiveddate & "'," 
	 strQuery3 = strQuery3 & "'" & checkreceivedby & "'," 
	 strQuery3 = strQuery3 & "'" & PRINCE2Manual & "'," 
	 strQuery3 = strQuery3 & "'" & PRINCE2price & "'," 
	 strQuery3 = strQuery3 & "'" & StatusNumber & "'," 
	 strQuery3 = strQuery3 & "'" & rqResCourseID & "'," 
	 strQuery3 = strQuery3 & "'" & DiscountPercentage & "'," 
	 strQuery3 = strQuery3 & "'" & TotalResAmount & "',"
	 strQuery3 = strQuery3 & "'" & round(RevisedVAT,2) & "',"
	 strQuery3 = strQuery3 & "'" & rqStreet & "',"
	 strQuery3 = strQuery3 & "'" & rqCity & "',"
	 strQuery3 = strQuery3 & "'" & rqState & "',"
	 strQuery3 = strQuery3 & "'" & rqPostalCode & "',"
	 strQuery3 = strQuery3 & "'" & rqSpeReq & "',"
	 strQuery3 = strQuery3 & "'" & Session("country") & "')"
 
 	 response.Write(strQuery3)

     ConnObj.Execute strQuery3
	 strNewUserId = "SELECT max(id) as EnrollId FROM prince2_enrolledusers"

	 Rs.Open strNewUserId,ConnObj

	 do until Rs.Eof
	   newEnrollId = Rs("EnrollId")
	 Rs.Movenext
	 Loop
	 Rs.Close

'Adding backoffice Comments'
	 
	 strComments = "SELECT * FROM prince2_enrolledusercomments WHERE enrolluserid = '"& rqEnrollUserId &"'"
	 
	 Rs.Open strComments,ConnObj
	 
	 Do Until Rs.Eof
	 
	 strQuery1 = "Insert Into prince2_enrolledusercomments (comment,enteredby,createddate,revlevel,enrolluserid)"
	 strQuery1 = strQuery1 & " Values "
	 strQuery1 = strQuery1 & "('" & StrQuoteReplace(Rs("comment")) & "',"
	 strQuery1 = strQuery1 & "'" & Rs("enteredby") & "',"
	 strQuery1 = strQuery1 & "'" & Rs("createddate") & "',"
	 strQuery1 = strQuery1 & "'" & Rs("revlevel") & "',"
	 strQuery1 = strQuery1 & "'" & newEnrollId & "')"
	
     ConnObj.Execute strQuery1
	 
	 Rs.Movenext
	 Loop
	 Rs.Close
	 
	  newComment = "Previous Course: "& rqOldCourseDet & "<br> New Course: " & CourseDetails

		 
		 strQuery1 = "Insert Into prince2_enrolledusercomments (comment,enteredby,createddate,enrolluserid)"
		 strQuery1 = strQuery1 & " Values "
		 strQuery1 = strQuery1 & "('" & newComment & "',"
		 strQuery1 = strQuery1 & "'" & Session("UserId") & "',"
		 strQuery1 = strQuery1 & "'" & Now() & "',"
		 strQuery1 = strQuery1 & "'" & newEnrollId & "')"
		 
		 ConnObj.Execute strQuery1
		 


'Adding US backoffice Comments'
	 
	 strUSComments = "SELECT * FROM prince2_enrolledusercomments WHERE enrolluserid = '"& rqEnrollUserId &"'"
	 
	 Rs.Open strUSComments,ConnObj
	 
	 Do Until Rs.Eof
	 
	 strQuery1 = "Insert Into prince2_enrolledusercomments (comment,enteredby,createddate,enrolluserid)"
	 strQuery1 = strQuery1 & " Values "
	 strQuery1 = strQuery1 & "('" & StrQuoteReplace(Rs("comment")) & "',"
	 strQuery1 = strQuery1 & "'" & Rs("enteredby") & "',"
	 strQuery1 = strQuery1 & "'" & Rs("createddate") & "',"
	 strQuery1 = strQuery1 & "'" & enrolluserid & "')"
	
     ConnObj.Execute strQuery1
	 
	 Rs.Movenext
	 Loop
	 Rs.Close
	 
		rqResAmount = request.Form("ResAmount")
	 rqStatus = request.Form("changestatus")
	 ChangeStatusDateBy = Now() & " by " & Session("UserId")
	   
	 strQuery1 =  "Update prince2_enrolledusers set status = 'Re-Schedule',changestatusdateby = '" & ChangeStatusDateBy &"',statusnumber = '2'  where id = '" & rqEnrollUserId & "'"
		
	 ConnObj.Execute strQuery1
	  
 
	  
	  EmailIds5 = EmailIds2 & "," & EmailIds4
	  
	 strBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px""> </td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF"">" 
						IF Session("country") = "India" Then
						strBody= strBody & "<span><img src=""http://www.PMstudy.com/images/banners/PRINCE2_email_headerIN.jpg"" alt=""PMstudy"" /></span>" 
						ElseIf Session("country")="United Kingdom" Then 
						strBody= strBody &"<span><img src=""http://www.PMstudy.com/images/banners/PRINCE2_email_headerUK.jpg"" alt=""PMstudy"" /></span>"
						ElseIf Session("country")="Other" Then
						strBody= strBody &"<span><img src=""http://www.PMstudy.com/images/banners/PRINCE2_email_header.jpg"" alt=""PMstudy"" /></span>"
						End if
						strBody= strBody &"</td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=""2"">Dear "&FirstName&" "&LastName&",<BR><BR>Greetings from PMstudy.com!<BR><BR>We are pleased to inform you that we have rescheduled your enrollment for <u>"&oldCity&"</u> classroom  program scheduled on <u>"&oldCourseDate&"</u> to <u>"&City&"</u> classroom program scheduled on <u>"&FormatDateTime(StartDate,1)&" to "&FormatDateTime(EndDate,1)&"</u>.<br><br> Best Regards,<BR>Customer Support<BR><a href=""http://www.PMstudy.com"" target=""_blank"">www.PMstudy.com</a><br><BR>Email: marketing@pmstudy.com  <BR></font></td></tr></table></td></tr><tr height=""30px""><td> </td></tr></table></td></tr><tr height=""45px""><td> </td></tr></table>"
	  'response.Write(strBody)
	  
	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
	objCDOMail.From = "marketing@pmstudy.com"
	objCDOMail.To =  Email
	objCDOMail.Cc = "marketing@pmstudy.com"
	objCDOMail.Bcc = ""&EmailIds5&",t_satpathy@yahoo.com" 
	objCDOMail.Importance = 2
	objCDOMail.Subject = "Reschedule PMstudy PRINCE2 Classroom Course"
	objCDOMail.BodyFormat = 0
	objCDOMail.MailFormat = 0
	objCDOMail.Body =  strBody
	objCDOMail.Send
	Set objCDOMail = Nothing
	 
	  Session("message") = ("Successfully Re-Scheduled The Course")
	  Response.Redirect("PRINCE2-BCourses.asp?CourseId="&rqResCourseID)



End If
 
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Re-Schedule Courses</title>
<link href="/India/css/pagestyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="calendar/zapatec.js"></script>
<script type="text/javascript" src="calendar/calendar.js"></script>
<script type="text/javascript" src="calendar/calendar-en.js"></script>
<link href="calendar/template.css" rel="stylesheet" type="text/css">
<link href="calendar/system.css" rel="stylesheet" type="text/css">

<script language="javascript">
function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}

}
function validate_special(field,alerttxt)
{
	var iChars = "!#$%^&*@()+=-[]\\\';,{}|\":<>?";

	with (field)
	{
		for (var i = 0; i < value.length; i++) {
		  	if (iChars.indexOf(value.charAt(i)) != -1) {
		  	alert (alerttxt);
		  	return false;
		  	}
		}
	}
}

 function validate_number(field,alerttxt)
 {
 	var iChars = "0123456789";

 	with (field)
 	{
 		for (var i = 0; i < value.length; i++) {
 		  	if (!(iChars.indexOf(value.charAt(i)) != -1)) {
 		  	alert (alerttxt);
 		  	return false;
 		  	}
 		}
 	}
 }


function Form_Validator(theform) {

   with (theform)
   {
     if (validate_required(CanAmount,"Please enter amount")==false)
			  {CanAmount.focus();return false}
			  
			  
	if (validate_special(CanAmount,"Please remove the Special Characters in amount")==false)
 					  {CanAmount.focus();return false}

	
if (validate_number(CanAmount,"Your amount is not a numeral")==false)
			  {CanAmount.focus();return false}
			  
		}
		}

function Form_Validator1(theform) {

   with (theform)
   {	
    if(theform.reschCourseID.value == "")
   {
	  alert("Please Select the Course");
	  return (false);
   }
   
   
 if (validate_required(ResAmount,"Please enter amount")==false)
			  {ResAmount.focus();return false}
			  
			  
}
}

function Form_Validator2(theform) {

   with (theform)
   {
     if (validate_required(RefAmount,"Please enter amount")==false)
			  {RefAmount.focus();return false}
			  
			  
	if (validate_special(RefAmount,"Please remove the Special Characters in amount")==false)
 					  {RefAmount.focus();return false}

	
if (validate_number(RefAmount,"Your amount is not a numeral")==false)
			  {RefAmount.focus();return false}
			  
		}
		}


</script>
</head>
<body onblur="this.focus()"><div id="htMap">
<table border="1" width="1000px" height="400px" class="dbborder" cellspacing="0">
 <tr>
   <td colspan="3" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% = Session("country") %></span> PMstudy Back Office</font></div></td>
 </tr>
 <tr>
  <td width="100px" valign="top" rowspan="22">
    <!--#include file="leftMenu.html"-->
  </td>
 </tr>
 <tr valign="top">
  <td>
  <% 
  If rqType = "Re-Schedule" Then

'Retrive The CourseDates Page'

 'If Country is US or Canada show both country coures'
 'Else show based on country'
 If session("country") <> "" Then
 	
 	strQuery4 = "SELECT * FROM prince2_course WHERE country = '"& session("country") &"' ORDER BY startdate desc"
	
	'response.Write(strQuery4)
 End If
'response.Write(strQuery4)
 Rs.Open strQuery4,ConnObj 
 

  
  %>
<form action="PRINCE2-ReScheduledCourses.asp" method="post" onSubmit="return Form_Validator1(this)">
 <table border="0" width="100%" cellpadding="2" cellspacing="2" >
 <input type="hidden" name="enrollUserId" value="<% = rqEnrollUserId %>" />
 <input type="hidden" name="changestatus" value="<% = rqType %>" />
  <input type="hidden" name="Amount" value="<% = rqAmount %>" />
  <tr><td align="center" colspan="2" height="50px"><font color="#00B0EC" size="4">Re-Schedule Courses</font></td></tr>
  <tr>
   <td align="left" bgcolor="#fafafa" valign="middle"><font face="Arial"size="2">
   Re-Schedule Courses : </font></td>
   <td align="left" bgcolor="#fafafa" valign="middle">
    <select name="reschCourseID">
	 <option value="">--Select--</option>
 <% 
 
     Do Until Rs.EOF 

	 ApplicableDays = Rs("applicabledays")

     If (CInt(Rs("courseid")) <> CInt(rqCourseId)) Then 
      If (CDate(Rs("startdate"))-(Date()-1) >= 0) Then %>
	  
	  
	  <option value="<% = Rs("courseid") %>">

	   <% =  Rs("courseName") %>- <% = Rs("city") %> : <% = FormatDateTime(Rs("startdate"),1) %> to <% = FormatDateTime(Rs("enddate"),1) %> for  
	   <% If Session("Country") =  "United Kingdom" Then %>
              <% = "&#163;"%>
       <% ElseIf Session("Country") =  "India" Then %>
              <% = "Rs."%>
        <% ElseIf Session("Country") =  "Australia" Then %>
              <% = "AUD"%>
        <%End If %>
			  <% If (CDate(Rs("startdate"))-(Date()+Rs("applicabledays")+1) >= 0) Then %><% = FormatNumber(Rs("afterEBdiscountwithtax")) %><% Else %><% = FormatNumber(Rs("pricewithtax")) %><% End If %>
	  <!--
       <option value="<% =  Rs("courseName") %> - <% = Rs("city") %> : <% = FormatDateTime(Rs("startdate"),1) %> to <% = FormatDateTime(Rs("enddate"),1) %> for Rs.<% If (CDate(Rs("startdate"))-(Date()+Rs("applicabledays")+1) >= 0) Then %><% = FormatNumber(Rs("afterEBdiscountwithtax")) %><% Else %><% = FormatNumber(Rs("pricewithtax")) %><% End If %> ? <% = Rs("courseid") %>">

	   <% =  Rs("courseName") %>- <% = Rs("city") %> : <% = FormatDateTime(Rs("startdate"),1) %> to <% = FormatDateTime(Rs("enddate"),1) %> for Rs.<% If (CDate(Rs("startdate"))-(Date()+Rs("applicabledays")+1) >= 0) Then %><% = FormatNumber(Rs("afterEBdiscountwithtax")) %><% Else %><% = FormatNumber(Rs("pricewithtax")) %><% End If %>-->
	   </option>	
  <%  End If 	
     End If 
     Rs.Movenext
     Loop 
	 Rs.Close %>
  </select>
		</td>
  </tr>
  <tr>
   <td align="left" bgcolor="#fafafa" valign="middle"><font face="Arial"size="2">
	 Re-schedule Amount : </font></td>
   <td align="left" bgcolor="#fafafa" valign="middle"> <input type="text" name="ResAmount"> </td>
   </tr>
  <tr>
   <td align="center" colspan="2"><input type="submit" name="type" value="Re-Schedule" class="buttonc"></td>
  </tr>
 </table>
</form>
 <% ElseIf rqType = "Cancel" Then %>
 <form action="PRINCE2-ReScheduledCourses.asp" method="post" onSubmit="return Form_Validator(this)">
 <table border="0" width="77%" cellpadding="2" cellspacing="2" >
 <input type="hidden" name="enrollUserId" value="<% = rqEnrollUserId %>" />
 <input type="hidden" name="changestatus" value="<% = rqType %>" />
  <input type="hidden" name="CourseId" value="<% = rqCourseId %>" />

  <tr><td align="center" colspan="2" height="50px"><font color="#00B0EC" size="4">Cancellation of Courses</font></td></tr>
  <tr>
   <td align="center" bgcolor="#fafafa" valign="middle"><font face="Arial"size="2">
	Cancellation Amount : </font></td>
   <td align="left" bgcolor="#fafafa" valign="middle"> <input type="text" name="CanAmount"> </td>
   </tr>
  <tr>
   <td align="center" colspan="2"><input type="submit" name="type" value="Cancel" class="buttonc"></td>
  </tr>
 </table>
</form>
<% ElseIf rqType = "ERG" Then %>
 <form action="PRINCE2-ReScheduledCourses.asp" method="post" onSubmit="return Form_Validator2(this)">
 <table border="0" width="77%" cellpadding="2" cellspacing="2" >
 <input type="hidden" name="enrollUserId" value="<% = rqEnrollUserId %>" />
 <input type="hidden" name="changestatus" value="<% = rqType %>" />
  <input type="hidden" name="CourseId" value="<% = rqCourseId %>" />

  <tr><td align="center" colspan="2" height="50px"><font color="#00B0EC" size="4">Exam Retake Guarantee</font></td></tr>
  <tr>
   <td align="center" bgcolor="#fafafa" valign="middle"><font face="Arial"size="2">
	Refund Amount : </font></td>
   <td align="left" bgcolor="#fafafa" valign="middle"> <input type="text" name="RefAmount"> </td>
   </tr>
  <tr>
   <td align="center" colspan="2"><input type="submit" name="type" value="ERG" class="buttonc"></td>
  </tr>
 </table>
</form>
 <% End If %>
</td>
</tr>
</table>
 </body>
 </html>
