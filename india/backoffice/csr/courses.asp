<%@ Language = "VBScript" %>
<% 'OPTION EXPLICIT %>
<%
 'Written By : Savita'
 'Last UpaDated: 17/04/2012'
 'Description :'
 'Purpose : Add/Edit/Delete Course Page and Enrolledusers Page'
%>
<%
   If Session("UserId") = "" Then
     Response.Redirect("../login.asp")
   Else
%>
<!--#include virtual="/india/connection.asp"-->
<!--#include virtual="/includes/connection_global.asp"-->
<%
'Declare The Variables'

 Dim message
 Dim courseDate
 Dim strQuery,Rs1,Rs2,courseId,rs3,Rs4,Rs5,Rs6
 Dim arrAllRecords,firstRow,lastRow,numRows,rowcounter
 Dim arrAllQueries,rqType,rqPage,rqRow,enrollrowcounter
 Dim strQuery1,str,str1,i,rqEnrollUsers
 Dim rqEnrollPage,rqEnrollRow,enrolllastRow,enrollfirstRow,enrollnumRows
 Dim strQuery2,strQuery3,strQuery4,allMailSent,strQuery6
 Dim arrAllCities,cityNumRows,cityFirstRow,cityLastRow,cityRowCounter
 Dim strQuery5,rqEnrollUserId,maxRevLevel
 Dim instructorFirstRow,instructorLastRow,arrAllInstructors
 Dim rqCourseId,instructorRowCounter,instructorNumRows
 Dim str2,city,CourseStartDate,CourseEndDateAndCity,CourseEndDate
 Dim enrolledUsers,str3,CourseDetails,rqEditCourseId
 Dim Sql7,Rs7
 Dim Inst, allNumRows ,rqAmount
 Dim iPageCurrent, pagenum, page, prev, nextPage, lastpage, lpm1, pagination
 Dim date2, date1
'Displaying The Messages After Add,Edit and Delete Course'
 
 message = Session("message")
 Session("message") = ""
 
 checkmessage = Session("checkmessage")
 Session("checkmessage") = ""

'Retrive The Types.It Means Tasks'
 rqCourse =  Request.Querystring("Course")
 rqType =  Request.Querystring("type")

'Retrive The Below Two are Pagination Purpose'

 rqPage =  Request.QueryString("page")
 rqRow  =  Request.QueryString("row")

 rqEnrollPage = Request.Querystring("enrollPage")
 rqEnrollRow = Request.QueryString("enrollRow")
 
 Set Rs = Server.CreateObject("ADODB.Recordset")
 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs2 = Server.CreateObject("ADODB.Recordset")
 Set Rs3 = Server.CreateObject("ADODB.Recordset")
 Set Rs4 = Server.CreateObject("ADODB.Recordset")
 Set Rs5 = Server.CreateObject("ADODB.Recordset")
 Set Rs6 = Server.CreateObject("ADODB.Recordset")
 Set Rs7 = Server.CreateObject("ADODB.Recordset")

 rqEnrollUsers = Request.Querystring("enrollusers")
 'response.Write(rqEnrollUsers)
 
If Request.Form("CourseId") <> "" then

rqCourseId = Request.Form("CourseId")

 Else
 
rqCourseId = Request.Querystring("CourseId")

End If


'Sql Query For Retrive The course Details'
If rqCourse = "pastcourses" Then 

	strQuery = "SELECT courseid, city, startdate, enddate, status, coursetype, coursedates from ITIL_course WHERE country = '"& session("country") &"' AND  startdate < '"& Now() &"' order by startdate desc"

ElseIf (rqCourse = "futurecourses" OR rqCourse = "") Then 

	strQuery = "SELECT courseid, city, startdate, enddate, status, coursetype, coursedates from ITIL_course WHERE country = '"& session("country") &"' AND  startdate >= '"& Now() &"' order by startdate asc"
    'response.Write(strQuery)
End If

	 Rs.Open strQuery,Conn
	
	'Retrive All Values From Query And Doeing Pagination'
	
	  If Not Rs.EOF Then
		arrAllRecords = Rs.getrows
		Session("arrAllRecords") = arrAllRecords

		firstRow = 0
		lastRow = 9
		numRows = Ubound(arrAllRecords,2)
		If lastRow > numRows Then
		   lastRow = numRows
		End If
		
		allNumRows = numRows
		
		cnt = 1
		
	  End If

'Pagination code'

If cnt = 1 Then

 If Request.QueryString("page") = "" Then
	
	iPageCurrent = 1
	
	'arrAllRecords = Session("arrAllRecords")	
	numRows = Ubound(arrAllRecords,2)
	
	 firstRow = 0 
	 
	 If numRows > 9 Then
	    lastRow = 9  
	 Else
	 	lastRow = numRows
	 End If 
  Else
	
	arrAllRecords = Session("arrAllRecords")	
	numRows = Ubound(arrAllRecords,2)
	
	iPageCurrent = Request.QueryString("page") 
    firstRow = ((10 * iPageCurrent)-10) 
     lastRow = firstRow + 9 

    If lastRow > numRows Then
    lastRow = numRows
   End If

    If firstRow < 0 Then
       firstRow = 0
    End If

 End if
 
End If
'Sql query For Retrive The Particular Course'
'If Click one course in course page that particular course will display here'

 strQuery1 = "SELECT * FROM ITIL_course WHERE courseid = '"& rqCourseId &"'"

 Rs1.Open strQuery1,Conn

'Sql Query For Retrive The enrolledusers particular course'

  strQuery2 = "SELECT * FROM ITIL_enrolledusers WHERE courseid = '"& rqCourseId &"' order by statusnumber asc"

  Rs2.Open strQuery2,Conn

   If Not Rs2.EOF Then

      arrAllQueries = Rs2.getRows
      Session("arrAllQueries") = arrAllQueries
      enrollfirstRow = 0
      enrolllastRow = 49
      enrollnumRows = Ubound(arrAllQueries,2)
      If enrolllastRow > enrollnumRows Then
         enrolllastRow = enrollnumRows
      End IF

 End IF

If rqEnrollPage = "next" Then

   arrAllQueries = Session("arrAllQueries")
   enrollnumRows = Ubound(arrAllQueries,2)


   enrollfirstRow = rqEnrollRow + 1
   enrolllastRow = enrollfirstRow + 49

   If enrollfirstRow >= enrollnumRows Then
      enrollfirstRow = rqEnrollRow + 1
      enrolllastRow = enrollfirstRow + 49
   End If

   If enrollfirstRow < 0 Then
      enrollfirstRow = 0
   End If

   If enrolllastRow > enrollnumRows Then
      enrolllastRow = enrollnumRows
   End If

End If

If rqEnrollPage = "previous" Then

   arrAllQueries = Session("arrAllQueries")
   enrollnumRows = Ubound(arrAllQueries,2)

   enrolllastRow = rqEnrollRow - 1
   enrollfirstRow = enrolllastRow - 49

   If enrollfirstRow =< 0 Then
      enrollfirstRow = 0
      enrolllastRow = enrollfirstRow + 49
   End If

   If enrolllastRow > enrollnumRows Then
      enrolllastRow = enrollnumRows
   End If

End If

'Sql Query For Retrive The Cities From City table'

  strQuery3 = "SELECT city FROM ITIL_city WHERE country = '"& session("country") &"' "

  Rs3.Open strQuery3,Conn

  If Not Rs3.EOF Then
     arrAllCities = Rs3.getRows
     Session("arrAllCities") = arrAllCities
     cityNumRows = Ubound(arrAllCities,2)
     cityFirstRow = 0
     cityLastRow  = cityNumRows
  End If

'Sql Query For The Rerive The Course Details For Editing'

  rqEditCourseId = Request.Querystring("editId")

  strQuery4 = "SELECT * FROM ITIL_course WHERE courseid = '" & rqEditCourseId & "'"

  Rs4.Open strQuery4,Conn

'Sql Query For The Retrive The enrollusercomments for particular enrolleduser'

  rqEnrollUserId = Request.Querystring("enrollUserId")

   strQuery5 = "SELECT max(revlevel) FROM ITIL_enrolledusercomments where enrolluserid =  '" & rqEnrollUserId & "'"

   Rs5.Open strQuery5,Conn

   do until Rs5.EOF
    For each i in Rs5.Fields
      maxRevLevel = i.value
      session("maxRevLevel") = maxRevLevel
     Next
   Rs5.Movenext
   Loop

  	if Not IsNull(maxRevLevel) then
  	  maxRevLevel = maxRevLevel + 1
  	  Session("maxRevLevel") = maxRevLevel
  	else
  	  maxRevLevel = 1
  	  Session("maxRevLevel") = maxRevLevel
  	end if

'Sql Query For Retrive The Instructor Details'

If Session("country") = "US" OR Session("country") = "Canada" Then 
 strQuery6 = "SELECT firstname,lastname from ps_us_instructors WHERE country = '"& session("country") &"'"
  Rs6.Open strQuery6,ConnObj1
'ElseIf Session("country") = "United Kingdom" OR Session("country") = "Australia" Then 
'strQuery6 = "SELECT firstname,lastname from ITIL_instructor WHERE country = 'United Kingdom' OR country = 'Australia' "
' Rs6.Open strQuery6,Conn
Else
strQuery6 = "SELECT firstname,lastname from ITIL_instructor WHERE country = '"& session("country") &"'"
 Rs6.Open strQuery6,Conn
End If



  If Not Rs6.EOF Then
     arrAllInstructors = Rs6.getRows
     Session("arrAllInstructors") = arrAllInstructors
     instructorNumRows = Ubound(arrAllInstructors,2)
     instructorFirstRow = 0
     instructorLastRow  = instructorNumRows
  End If	


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Courses</title>
<link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="calendar/zapatec.js"></script>
<script type="text/javascript" src="calendar/calendar.js"></script>
<script type="text/javascript" src="calendar/calendar-en.js"></script>
<link href="calendar/template.css" rel="stylesheet" type="text/css">
<link href="calendar/system.css" rel="stylesheet" type="text/css">
<script language ="javascript">

//Calculating The Taxes And Dicounts

function calculate() {

   var pricewithouttax = document.addcourse.priceWithOutTax.value;
   
   var tax = document.addcourse.tax.value;

   var earlybirddiscount = document.addcourse.earlybirddicount.value;

   //var x = Math.ceil((pricewithouttax / 100 * tax))
	  var x = Math.ceil((pricewithouttax * tax) / 100)
	
   var monthly = parseInt(pricewithouttax) + parseInt(x)

   var discountwithouttax = parseInt(pricewithouttax) - parseInt(earlybirddiscount)

   //var z = Math.round((discountwithouttax / 100 * tax))
    var z = Math.ceil((discountwithouttax * tax) / 100)
   
   var discountwithtax = parseInt(discountwithouttax) + parseInt(z)

   if (!isNaN(monthly) &&   
        (monthly != Number.POSITIVE_INFINITY) &&
        (monthly != Number.NEGATIVE_INFINITY)) {

        document.addcourse.priceWithTax.value = Math.ceil(monthly);

    }

    else {
        document.addcourse.priceWithTax.value = "";
       }

    if (!isNaN(discountwithouttax) &&
        (discountwithouttax != Number.POSITIVE_INFINITY) &&
        (discountwithouttax != Number.NEGATIVE_INFINITY)) {

        document.addcourse.afterearlybirddiscountwithouttax.value = round(discountwithouttax);

    }
    // Otherwise, the user's input was probably invalid, so don't
    // display anything.
    else {
        document.addcourse.afterearlybirddiscountprice.value = "";
       }

   if (!isNaN(discountwithtax) &&
        (discountwithtax != Number.POSITIVE_INFINITY) &&
        (discountwithtax != Number.NEGATIVE_INFINITY)) {

        document.addcourse.afterearlybirddiscountwithtax.value = round(discountwithtax);

    }
    // Otherwise, the user's input was probably invalid, so don't
    // display anything.
    else {
        document.addcourse.afterearlybirddiscountprice.value = "";
       }
}

// This simple method rounds a number to two decimal places.
function round(x) {
  return Math.round(x*100)/100;
}

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

 function validate_number1(field,alerttxt)
 {
 	var iChars = "0123456789.";

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
 function validate_noNumber(field,alerttxt)
 {
 	var iChars = "0123456789";

 	with (field)
 	{
 		for (var i = 0; i < value.length; i++) {
 		  	if ((iChars.indexOf(value.charAt(i)) != -1)) {
 		  	alert (alerttxt);
 		  	return false;
 		  	}
 		}
 	}
 }

//URL Validation

function isValidURL(url){
    var RegExp = /^(([\w]+:)?\/\/)?(([\d\w]|%[a-fA-f\d]{2,2})+(:([\d\w]|%[a-fA-f\d]{2,2})+)?@)?([\d\w][-\d\w]{0,253}[\d\w]\.)+[\w]{2,4}(:[\d]+)?(\/([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)*(\?(&?([-+_~.\d\w]|%[a-fA-f\d]{2,2})=?)*)?(#([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)?$/;
    if(RegExp.test(url)){
        return true;
    }else{
        return false;
    }
}

function check_it() {
     var theurl=document.addcourse.hotelurl.value;
     var tomatch= /http:\/\/www.[A-Za-z0-9\.-]{3,}\.[A-Za-z]{3}/
     if (tomatch.test(theurl))
     {

         return true;
     }
     else
     {
         window.alert("URL invalid. Try again.");
         return false;
     }
}
function checkUrl(url){
  if(url.value.match(/^(http|ftp)\:\/\/\w+([\.\-]\w+)*\.\w{2,4}(\:\d+)*([\/\.\-\?\&\%\#]\w+)*\/?$/i) ||
     url.value.match(/^mailto\:\w+([\.\-]\w+)*\@\w+([\.\-]\w+)*\.\w{2,4}$/i)){
    return true;
  } else {
    alert("Please Enter The Correct Url");
    url.select();
    url.focus();
    return false;
  }
}

function validate_special1(field,alerttxt)
{
	var iChars = "/^(([\w]+:)?\/\/)?(([\d\w]|%[a-fA-f\d]{2,2})+(:([\d\w]|%[a-fA-f\d]{2,2})+)?@)?([\d\w][-\d\w]{0,253}[\d\w]\.)+[\w]{2,4}(:[\d]+)?(\/([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)*(\?(&?([-+_~.\d\w]|%[a-fA-f\d]{2,2})=?)*)?(#([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)?$/";

	with (field)
	{
		for (var i = 0; i < value.length; i++) {
		  	if(!(iChars.indexOf(value.charAt(i)) != -1)) {
		  	alert (alerttxt);
		  	return false;
		  	}
		}
	}
}


 function Form_Validator(theform)
 {

  var alertsay = "";

// Check If The  City Selected Or Not

   if (theform.coursetype.selectedIndex == "")
   {
     alert("Please Select Course Type");
     theform.coursetype.focus();
     return (false);
   }
   
   // Check If The  Company name entered or not
if (theform.coursetype.value == "Corporate")
{
   if (theform.company.value == "")
   {
     alert("Please enter the Company");
     theform.company.focus();
     return (false);
   }
}    
     
// Check If The  City Selected Or Not

   if (theform.city.selectedIndex == 0)
   {
     alert("Please Select the City");
     theform.city.focus();
     return (false);
   }

 //Check To See If The Course Start Date Field Is Balnk

   if (theform.startdate.value == "")
   {
     alert("Please enter Course Start Date.");
     theform.startdate.focus();
     return (false);
   }

//Check To See If The Course End Date Field Is Blank

   if (theform.enddate.value == "")
   {
     alert("Please enter Course End Date.");
     theform.enddate.focus();
     return (false);
   }

 //Check To See If The Startdate And Enddate Is Same

  if(theform.startdate.value == theform.enddate.value)
  {
    alert("Start Date and End Date Should Not Be Equal")
    return(false);
  }

  //Check If The Starting Hour Selected Or Not

    if (theform.startinghour.selectedIndex == 0)
    {
      alert("Please Select the Starting Hour");
      theform.startinghour.focus();
      return (false);
    }

   //Check If The Ending Hour Selected Or Not

     if (theform.startingminute.selectedIndex == 0)
     {
       alert("Please Select the Starting Minit");
       theform.startingminute.focus();
       return (false);
     }

   //Check If The Starting Hour Selected Or Not

    if (theform.endinghour.selectedIndex == 0)
    {
      alert("Please Select the Ending Hour");
      theform.endinghour.focus();
      return (false);
    }

   //Check If The Ending Hour Selected Or Not

    if (theform.endingminute.selectedIndex == 0)
    {
       alert("Please Select the Ending Minit");
       theform.endingminute.focus();
       return (false);
    }

  //Check The Starting Time and Ending Times
  
    if (theform.sessionstart.selectedIndex == theform.sessionend.selectedIndex)
    {

    if (theform.startinghour.selectedIndex > theform.endinghour.selectedIndex)
    {
       alert("EndTime Should Not Be LessThan StartTime")

       return (false);
    }
  
   if ((theform.startinghour.selectedIndex == theform.endinghour.selectedIndex) && (theform.startingminute.selectedIndex == theform.endingminute.selectedIndex))
   {
        alert("EndTime Should Not Be EqualTo StartTime")

        return (false);
    }
  
   if ((theform.startinghour.selectedIndex == theform.endinghour.selectedIndex) && (theform.startingminute.selectedIndex > theform.endingminute.selectedIndex))
    {
        alert("EndTimeMinutes ShouldNot  Be GreaterThan StartTimeMinutes")

        return (false);
    }
 }

   //Check If The Instructor Selected Or Not

     if (theform.instructor.selectedIndex == 0)
     {
       alert("Please Select the Instructor");
       theform.instructor.focus();
       return (false);
     }
	 
   //Check If The Instructor Selected Or Not

     if (theform.backupinstructor.selectedIndex == 0)
     {
       alert("Please Select the BackUp Instructor");
       theform.backupinstructor.focus();
       return (false);
     }	
	  
   
    //Check If The Instructor And BackUp Instructor Is Same
	
     if (theform.instructor.selectedIndex == theform.backupinstructor.selectedIndex)
     {
       alert("Instructor Name and BackUp Instructor name Same")
       theform.backupinstructor.focus();
       return (false);
     }


if (theform.coursedate.value != "Corporate")
{
with (theform)
    {
		//Check If The Price WithOut Tax Field Is Blank
	
        if (validate_required(priceWithOutTax,"Please enter Price WithOut Tax")==false)
			  {priceWithOutTax.focus();return false}

		//Check If The Price WithOut Tax Field Have Special Characters

		if (validate_special(priceWithOutTax,"Please remove the Special Characters in Price WithOut Tax")==false)
					  {priceWithOutTax.focus();return false}

		//Check If The Price WithOut Tax Field Have Numerals
		
		if (validate_number(priceWithOutTax,"Your Price WithOut Tax is not a numeral")==false)
			  {priceWithOutTax.focus();return false}

		//Check If The Tax Field Is Blank
		
        if (validate_required(tax,"Please enter Tax")==false)
			  {tax.focus();return false}

		//Check If The Tax Field Have Numerals
		
		if (validate_number1(tax,"Your tax is not a numeral")==false)
			  {tax.focus();return false}

		//Check If The Tax Field Have Special Characters
				
		if (validate_special(tax,"Please remove the Special Characters in Tax")==false)
					  {tax.focus();return false}
   }

   //Check If The Tax Above 3 And Below 26
   
   if (theform.tax.value<parseFloat(0) || theform.tax.value>parseInt(26))
   {
	    alert("Please Enter Between 0 to 26");
	    theform.tax.focus();
	    return (false);
   }

 with (theform)
    {

		//Check If The Price With Tax Field Is Blank
			
        if (validate_required(priceWithTax,"Please enter Price WithOut Tax")==false)
			  {priceWithTax.focus();return false}

		//Check If The Applicable Days Field Is Blank

        if (validate_required(applicabledays,"Please enter Applicable Days")==false)
			  {applicabledays.focus();return false}

		//Check If The Applicable Days Field Have Speacial Characters

		if (validate_special(applicabledays,"Please remove the Special Characters in Applicable Days")==false)
					  {applicabledays.focus();return false}

		//Check If The Applicable Days Field Have Numerals
				
		if (validate_number(applicabledays,"Your Applicable Days is not a numeral")==false)
			  {applicabledays.focus();return false}

		//Check If The EarlyBird Discount Field Is Blank
		
        if (validate_required(earlybirddicount,"Please enter EarlyBird Discount")==false)
			  {earlybirddicount.focus();return false}

		//Check If The EarlyBird Discount Field Have Numerals
		
		if (validate_number1(earlybirddicount,"Your EarlyBird Discount is not a numeral")==false)
			  {earlybirddicount.focus();return false}

		//Check If The EarlyBird Discount Field Have Numerals
		
		if (validate_special(earlybirddicount,"Please remove the Special Characters in EarlyBird Discount")==false)
					  {earlybirddicount.focus();return false}

		}
    }

 }

 //This Function1 Validate Edit Form

 function Form_Validator1(theform)
 {

  var alertsay = "";

// Check If The  City Selected Or Not

   if (theform.coursetype.selectedIndex == "")
   {
     alert("Please Select Course Type");
     theform.coursetype.focus();
     return (false);
   } 
   
   // Check If The  Company name entered or not
if (theform.coursetype.value == "Corporate")
{
   if (theform.company.value == "")
   {
     alert("Please enter the Company");
     theform.company.focus();
     return (false);
   }
}   

 //Check If The  City Selected Or Not

   if (theform.editcity.value == "")
   {
     alert("Please Select the City");
     theform.editcity.focus();
     return (false);
   }

 //Check To See If The Startdate And Enddate Is Same

  if(theform.editstartdate.value == theform.editenddate.value)
  {
    alert("Start Date and End Date Should Not Be Equal")
    return(false);
  }

  //Check The Starting Time and Ending Times
  
  if (theform.editsessionstart.value == theform.editsessionend.value)
  {
    if ((theform.editstartinghour.value == theform.editendinghour.value) && (theform.editstartingminute.value == theform.editendingminute.value))
    {
        alert("EndTime Should Not Be EqualTo StartTime")

        return (false);
    }
  }
 
  if (theform.editsessionstart.value == theform.editsessionend.value)
  {
  
   if (theform.editstartinghour.value > theform.editendinghour.value)
   {
        alert("EndTime Should Not Be LessThan StartTime")

        return (false);
   }

 }

 if (theform.editsessionstart.value != theform.editsessionend.value)
 {

   if ((theform.editstartinghour.value == theform.editendinghour.value) && (theform.editstartingminute.value > theform.editendingminute.value))
   {
      alert("EndTimeMinutes ShouldNot Be GreaterThan StartTimeMinutes")
       return (false);
   }

 }

//Check If The City Selected Or Not

   if (theform.editinstructor.value == "")
   {
     alert("Please Select the Instructor");
     theform.editinstructor.focus();
     return (false);
   }

//Check If The City Selected Or Not

   if (theform.editbackupinstructor.value == "")
   {
     alert("Please Select the BackUp Instructor");
     theform.editbackupinstructor.focus();
     return (false);
   }

//Check If The Instructor And BackUp Instructor Is Same
	
    if (theform.editinstructor.value == theform.editbackupinstructor.value)
    {
       alert("Instructor Name and BackUp Instructor name Same")
       theform.editbackupinstructor.focus();
       return (false);
    }

if (theform.coursedate.value != "Corporate")
{

with (theform)
    {
		//Check If The Price WithOut Tax Field Is Blank
			
        if (validate_required(priceWithOutTax,"Please enter Price WithOut Tax")==false)
			  {priceWithOutTax.focus();return false}

		//Check If The Price WithOut Tax Field Have Special Characters
		
		if (validate_special(priceWithOutTax,"Please remove the Special Characters in Price WithOut Tax")==false)
					  {priceWithOutTax.focus();return false}

		//Check If The Price WithOut Tax Field Have Numerals
		
		if (validate_number(priceWithOutTax,"Your Price WithOut Tax is not a numeral")==false)
			  {priceWithOutTax.focus();return false}

		//Check If The Tax Field Is Blank
		
        if (validate_required(tax,"Please enter Tax")==false)
			  {tax.focus();return false}

		//Check If The Tax Field Have Numerals
		
		if (validate_number1(tax,"Your tax is not a numeral")==false)
			  {tax.focus();return false}

		//Check If The Tax Field Have Special Characters
		
		if (validate_special(tax,"Please remove the Special Charactesr in Tax")==false)
					  {tax.focus();return false}
     }
	 
   //Check If The Tax Above 3 And Below 26
       
	 if (theform.tax.value<parseFloat(0) || theform.tax.value>parseInt(26))
	 {
	     alert("Please Enter Between 0 to 26");
	     theform.tax.focus();
	     return (false);
     }

with(theform)
    {

		//Check If The Price With Tax Field Is Blank
		
        if (validate_required(priceWithTax,"Please enter Price WithOut Tax")==false)
  	     {priceWithTax.focus();return false}

		//Check If The Applicable Days Field Is Blank
		
         if (validate_required(applicabledays,"Please enter Applicable Days")==false)
 			  {applicabledays.focus();return false}

		//Check If The Applicable Days Field Have Speacial Characters
		
 		if (validate_special(applicabledays,"Please remove the Special Characters in Applicable Days")==false)
 					  {applicabledays.focus();return false}

		//Check If The Applicable Days Field Have Numerals
		
 		if (validate_number(applicabledays,"Your Applicable Days is not a numeral")==false)
 			  {applicabledays.focus();return false}

		//Check If The EarlyBird Discount Field Is Blank
		
         if (validate_required(earlybirddicount,"Please enter EarlyBird Discount")==false)
 			  {earlybirddicount.focus();return false}

		//Check If The EarlyBird Discount Field Have Numerals
		
 		if (validate_number1(earlybirddicount,"Your EarliBird Discount is not a numeral")==false)
 			  {earlybirddicount.focus();return false}

		//Check If The EarlyBird Discount Field Have Numerals
		
 		if (validate_special(earlybirddicount,"Please remove the Special Characters in EarlyBird Discount")==false)
					  {earlybirddicount.focus();return false}

		}
     }

}

//This Function For Without Clicking Radio Button And Confirmation Message For PaymentReceived In Course Page

function Form_Validator2(theform)
{

 if (theform.review.checked == "")
 {
   alert("Please Select Yes");
   return false;
 }

 if (theform.Paymentdate.value == "")
 {
   alert("Please Enter Check Received Date");
   theform.Paymentdate.focus();
   return false;
 }
  
  else
	 {
	
	 	var answer = confirm("Are you sure ?")

		if (answer==false)
		{
			theform.review.focus();
       		return (false);
		}
		
	  }
	
	  
} 

function Form_Validator3(theform)
{
 with(theform)  
 {

   if (validate_required(notes,"Please enter Comment")==false)
      {notes.focus();return false}
   
 }  

}

//This Function Is For Dropdown Button And Confirmation Message For Status In Course Page

 function Form_Validator4(theform)
{
     if (theform.enrollStatus.selectedIndex == 0)
     {
       alert("Please Select the Enroll Status");
       theform.enrollStatus.focus();
       return (false);
     }	
	 
	 //Check To See If The Enrollstatus value is P.O.Received And POexpected value is nothing  
	   
	if (theform.enrollStatus.value == 'P.O Received' && theform.POexpected.value == "")
	  {
		alert("Please enter P.O Expected date");
		theform.POexpected.focus();
		return(false);	
	  }
  
    //Check To See If The Enrollstatus value is other then P.O.Received And POexpected value is nothing  
	   
	if (theform.enrollStatus.value != 'P.O Received' && theform.POexpected.value != "")
	  {
		alert("No need of date for this P.O Expected Date");
		theform.POexpected.focus();
		return(false);	
	  }
  	 
	 
	 else
	 {
	 	var answer = confirm("Are you sure ?")
		if (answer==false)
		{
			theform.enrollStatus.focus();
       		return (false);
		}
		
	  }

   } 
   
//This Function Is For Dropdown Button And Confirmation Message For EnrollStatus In Course Page

function Form_Validator5(theform)
{
     if (theform.changestatus.selectedIndex == 0)
     {
       alert("Please select the status");
       theform.changestatus.focus();
       return (false);
     }	
	 else
	 {
	 	var answer = confirm("Are you sure ?")
		if (answer==false)
		{
			theform.changestatus.focus();
       		return (false);
		}
		
	  }
	  
   } 

//This Function Is POPUp Window For Rescheduling Courses

function openit(theform)       
{
 var courseDate = theform.enrolldate.value;
 var enrolledUserId = theform.enrollUserId.value

 if(theform.changestatus.value == "Re-Schedule" ){
  
  newWindow = window.open('reScheduledCourses.asp?courseDate='+courseDate+'&enrollUserId='+enrolledUserId, 'myWindow','toolbar,scrollbars,location,status=yes,menubar,resizable,minimizable=0,width=800,height=333,left = 175,top = 140');
  
  }
}


function DeleteAlert(link,site,ltext) {
  if(confirm("Are you sure you want to delete?")) 
  {
  	return true;
  } 
return false;
}



function ReferralmailAlert(link, site, ltext) {
    if (confirm("Are you sure you want to Send Referral Mail to this Emailid?")) {
        return true;
    }
    return false;
}

</script>

<script type="text/javascript">
// Javascipt to dispaly Corporate company text field
function update(a){
	if(a.value=='Corporate') {
       document.getElementById('company').style.display="table-row";
    }
    else {
	   document.getElementById('company').style.display="none";
    }
    
}
</script>


</head>
<body>
<div id="htMap">
  <table border="1" width="1470px" class="dbborder" cellspacing="0">
    <tr>
      <td colspan="3" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300">
          <% = Session("country") %>
          </span> ITILstudy Back Office</font></div></td>
    </tr>
    <tr>
      <td width="100px" valign="top" rowspan="22"><!--#include file="leftMenu.html"-->
      </td>
    </tr>
    <tr id="htMap">
      <td  height="25px" ><% If Not Session("typeofuser") = "CSR" Then %><a href="courses.asp?type=add">Add Course</a> | <% End If %> <a href="courses.asp?Course=pastcourses">Past Courses</a> | <a href="courses.asp?Course=futurecourses">Future Courses</a> | <a href="ExamBooking.asp">Exam Booking</a></td>
    </tr>
    <!-- If You Click Add Course In This Page That Will Come Here -->
    <% If rqType = "add" Then %>
    <tr>
      <td align="left" height="200px"><form name="addcourse" action="addEditDeleteCourse.asp" method="post" onsubmit="return Form_Validator(this)">
        <form onreset="resetDates()">
        <table border="0" cellpadding="5" width="70%" align="left" cellspacing="6">
        <tr>
          <td align="center" colspan="4" class="h3">Add Course</td>
        </tr>
         <% if checkmessage<>"" then %>
        
         <tr>
      <td colspan="2" align="center"><font face="Arial" size="2" color="orangered">
      	  
	  <script type="text/javascript">
	  alert("<% = checkmessage %>")
	  </script>
      
	  </font></td>
    </tr>
    <% End If %>
        <tr>
          <td>Course Type:</td>
          <td>
            <select name="coursetype" id="coursetype" onChange="update(this)">
              <option value="">--Select--</option>
              <option value="Normal">Normal</option>
               <option value="2day-live">2 Day Live</option>
                <option value="3day-live">3 Day Live</option>
             <!-- <option value="Weekend">Weekend</option>-->
              <option value="Corporate">Corporate</option>
              <option value="Live">Live</option>         
              <option value="WBT">WBT + Normal</option>
               <%' If Session("country") = "Canada" OR Session("country") = "US" OR Session("country") = "United Kingdom" Then %>
              <option value="OSA">OSA Course</option>
              <option value="CSI">CSI Course</option>
              <option value="ST">Service Transition</option>
              <option value="SS"> Service Strategy</option>
              <option value="SS-Live"> Service Strategy - Live</option>
                 <option value="Corporate-SO">Corporate-SO</option>
               <option value="Corporate-SS">Corporate-SS</option>
               <option value="Corporate-SD">Corporate-SD</option>
                   <option value="Corporate-ST"> Corporate-ST</option>
                <option value="Corporate-CSI">Corporate-CSI</option>
                <option value="Corporate-MALC">Corporate-MALC</option>
                 <%' End If %>   
            </select>
          </td>
        </tr>
        
         <tr style="display:none;" id="company">
        	<td>Company:</td>
            <td><input type="text" name="company" /></td>
        </tr>
        
        <tr>
          <td>City:</td>
          <td>
            <select name="city" id="city" onChange="clicked();">
              <option>--Select--</option>
              <% If IsArray(arrAllCities) Then
          For cityRowCounter = cityFirstRow to cityLastRow %>
              <option value="<% = arrAllCities(0,cityRowCounter) %>">
              <% = arrAllCities(0,cityRowCounter) %>
              </option>
              <% Next
          End If %>
            </select>
          </td>
        </tr>
        <tr>
          <td class="zpCalSubheader"> Date Begin: </td>
          <td><input autocomplete="off" name="startdate" readonly id="checkIn_date" type="text">
            <input value=" ... " id="button8a" class="buttonc" type="reset">
          </td>
          <td class="zpCalSubheader"> Date End: </td>
          <td><input autocomplete="off" name="enddate" readonly id="checkOut_date" type="text">
            <input value=" ... " id="button8b" class="buttonc" type="reset">
          </td>
        </tr>
        <tr>
         <td colspan="4"><b>Normal Course or Corporate Weekend  Course:</b></td>
        </tr>
        <tr>
          <td> Course Dates: </td>
          <td colspan="3"><input type="text" name="coursedate" size="50">
          </td>
        </tr>
        <tr>
          <td>Start Time:</td>
          <td width="350px">
            <select name="startinghour">
              <option value="">HH</option>
              <option>01</option>
              <option>02</option>
              <option>03</option>
              <option>04</option>
              <option>05</option>
              <option>06</option>
              <option>07</option>
              <option>08</option>
              <option>09</option>
              <option>10</option>
              <option>11</option>
              <option>12</option>
            </select>
            <select name="startingminute">
              <option value="">MIN</option>
              <option>00</option>
              <option>15</option>
              <option>30</option>
              <option>45</option>
            </select>
            <select name="sessionstart">
              <option>AM</option>
              <option>PM</option>
            </select>
          </td>
          <td>End Time:</td>
          <td width="600px">
            <select name="endinghour">
              <option value="">HH</option>
              <option>01</option>
              <option>02</option>
              <option>03</option>
              <option>04</option>
              <option>05</option>
              <option>06</option>
              <option>07</option>
              <option>08</option>
              <option>09</option>
              <option>10</option>
              <option>11</option>
              <option>12</option>
            </select>
            <select name="endingminute">
              <option value="">MIN</option>
              <option>00</option>
              <option>15</option>
              <option>30</option>
              <option>45</option>
            </select>
            <select name="sessionend">
              <option>AM</option>
              <option>PM</option>
            </select>
          </td>
        </tr>
        <% 'If Session("country") = "US" OR Session("country") = "Canada" OR  Session("country") = "UAE" OR Session("country") = "Singapore"  OR  Session("country") = "India"   OR  Session("country") = "Australia" Then %>
        <tr>
          <td>Instructor:</td>
          <td>

            <select name="instructor" id="instructor" style="width:150px">
              <option value="">--Select--</option>
              <% If IsArray(arrAllInstructors) Then
          		 For instructorRowCounter = instructorFirstRow to instructorLastRow 
				 Inst = Trim(arrAllInstructors(0,instructorRowCounter)) &" "& Trim(arrAllInstructors(1,instructorRowCounter))
			  %>
              <option value="<% = Inst %>">
              <% = arrAllInstructors(0,instructorRowCounter)%>
              &nbsp;
              <% = arrAllInstructors(1,instructorRowCounter) %>
              </option>
              <% Next
          		 End If %>
			   <% If Session("country") = "Canada" Then %>
			   <option value="Charles Quansah">Charles Quansah </option>
			   <% End If %> 
            </select>
          </td>
          <td >BackUp Instructor:</td>
          <td>
            <select name="backupinstructor" id="backupinstructor" style="width:150px">
              <option value="">--Select--</option>
              <% If IsArray(arrAllInstructors) Then
                 For instructorRowCounter = instructorFirstRow to instructorLastRow 
				 Inst = Trim(arrAllInstructors(0,instructorRowCounter)) &" "& Trim(arrAllInstructors(1,instructorRowCounter))
			  %>
              <option value="<% = Inst %>">
              <% = arrAllInstructors(0,instructorRowCounter)%>
              &nbsp;
              <% = arrAllInstructors(1,instructorRowCounter) %>
              </option>
              <% Next
          End If %>
		   <% If Session("country") = "Canada" Then %>
			   <option value="Charles Quansah">Charles Quansah </option>
			   <% End If %> 
            </select>
          </td>
        </tr>
      
        <%' End If %>
        <tr>
          <td >Price WithOut Tax:</td>
          <td><input type="text" name="priceWithOutTax" size="20" maxlength="15" onchange="calculate();">
            <br>
            &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">(Ex : 17250 )</font></td>
          <td >Tax:</td>
          <td><input type="text" name="tax" size="20" maxlength="6" onchange="calculate();" value="0">
            <br>
            &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">(Ex : 12.36 )</font> </td>
        </tr>
        <tr>
          <td>Price With Tax:</td>
          <td><input type="text" name="priceWithTax" size="20" readonly="true">
            <br>
            &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2"></font></td>
        </tr>
        <tr>
          <td>EarlyBird Discount:</td>
          <td><input type="text" name="earlybirddicount" maxlength="10" onchange="calculate()" size="20">
            <br>
            &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">(Ex : 1000 )</font></td>
          <td >Applicable Days:</td>
          <td><input type="text" name="applicabledays" maxlength="10" size="20">
            <br>
            &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">(Ex : 10 )</font></td>
        </tr>
        <tr>
          <td  width="250px">Price After EarlyBird Discount(WithOut Tax):</td>
          <td><input type="text" name="afterearlybirddiscountwithouttax" readonly="true"></td>
          <td  width="290px">Price After EarlyBird Discount(With Tax):</td>
          <td><input type="text" name="afterearlybirddiscountwithtax" readonly="true"></td>
        </tr>
        <tr>
          <td  width="250px">Hotel Name: </td>
          <td><input type="text" maxlength="200" name="hotelname"></td>
          <td  width="310px">Hotel Phone Number: </td>
          <td><input type="text" maxlength="50" name="hotelphonenumber">
            <br />
            <font face="Arial" color="red" size="2">(Ex : 0802345678 )</font></td>
        </tr>
        <form onSubmit="return checkUrl(this.hotelurl)">
          <tr>
              <td  width="250px">Hotel URL: </td>
              <td><input type="text" id="hotelurl" maxlength="300" name="hotelurl">
                <br />
                <font face="Arial" color="red" size="2">(Ex : http://www.ashoka.com)</font></td>
            </tr>
          <tr>
              <td  width="280px">Hotel Address: </td>
              <td><textarea name="hoteladdress"  rows="4" cols="25"></textarea></td>
            </tr>
          <tr>
              <td colspan="4" align="center"><input type="submit" name="addcourse" value="Add Course" class="buttond" >
              </td>
            </tr>
        </form>
    <tr>
      <td colspan="2" align="center"><font face="Arial" size="2" color="orangered"><%=message%></font></td>
    </tr>
  </table>
  </form>
  </td>
  </tr>
  <% End If 

'Add Course If Condition Closed Here'
'If You Click Edit in This PAge That Will Come Here'
'And Display That Particular Details'

 If rqType = "Edit" Then %>
  <tr>
    <td  height="200px"><form name="addcourse" action="addEditDeleteCourse.asp" method="post" onsubmit="return Form_Validator1(this)">
        <table border="0" cellspacing="5" cellpadding="6" align="left" width="70%">
          <tr>
            <td align="center" colspan="4" class="h3">Edit Course</td>
          </tr>
          <% do until Rs4.EOF %>
        <tr>
          <td>Course Type:</td>
          <td>&nbsp;&nbsp;
            <select name="coursetype" id="coursetype">
              <option>--Select--</option>
              <option <% If Rs4("coursetype") = "Normal" Then %> selected="selected" <% End If %> value="Normal">Normal</option>
              <option <% If Rs4("coursetype") = "2day-live" Then %> selected="selected" <% End If %> value="2day-live">2 Day Live</option>
              <option <% If Rs4("coursetype") = "3day-live" Then %> selected="selected" <% End If %> value="3day-live">3 Day Live</option>
             <!-- <option <%' If Rs4("coursetype") = "Weekend" Then %> selected="selected" <% 'End If %> value="Weekend">Weekend</option>-->
              <option <% If Rs4("coursetype") = "Corporate" Then %> selected="selected" <% End If %> value="Corporate">Corporate</option>
                <option <% If Rs4("coursetype") = "Live" Then %> selected="selected" <% End If %> value="Live">Live</option> 
              <option <% If Rs4("coursetype") = "WBT" Then %> selected="selected" <% End If %> value="WBT">WBT + Normal</option>
               <%' If Session("country") = "Canada" OR Session("country") = "US" OR Session("country") = "united Kingdom" Then %>
                <option <% If Rs4("coursetype") = "OSA" Then %> selected="selected" <% End If %> value="OSA">OSA Course</option>
                  <option <% If Rs4("coursetype") = "CSI" Then %> selected="selected" <% End If %> value="CSI">CSI Course</option>
                   <option <% If Rs4("coursetype") = "ST" Then %> selected="selected" <% End If %> value="ST">Service Transition</option>
                   <option <% If Rs4("coursetype") = "SS" Then %> selected="selected" <% End If %> value="SS"> Service Strategy</option>
                    <option <% If Rs4("coursetype") = "SS-Live" Then %> selected="selected" <% End If %> value="SS-Live"> Service Strategy - Live</option>
                <option <% If Rs4("coursetype") = "Corporate-SO" Then %> selected="selected" <% End If %> value="Corporate-SO">Corporate-SO</option>
                  <option <% If Rs4("coursetype") = "Corporate-SS" Then %> selected="selected" <% End If %> value="Corporate-SS">Corporate-SS
</option>
                   <option <% If Rs4("coursetype") = "Corporate-SD" Then %> selected="selected" <% End If %> value="Corporate-SD">Corporate-SD
</option>
                   <option <% If Rs4("coursetype") = "Corporate-ST" Then %> selected="selected" <% End If %> value="Corporate-ST">Corporate-ST
</option>
                   <option <% If Rs4("coursetype") = "Corporate-CSI" Then %> selected="selected" <% End If %> value="Corporate-CSI"> Corporate-CSI
</option>
                 <option <% If Rs4("coursetype") = "Corporate-MALC" Then %> selected="selected" <% End If %> value="Corporate-MALC"> Corporate-MALC
</option>
                  <%' End If %>          
            </select>
          </td>
        </tr>  
         <% If Rs4("coursetype") = "Corporate" Then %> 
        <tr>
        	<td>Company:</td>
            <td><input type="text" name="company" value="<% = Rs4("company") %>" /></td>
        </tr>  
        <% End If %>
                
          <tr>
            <input type="hidden" name="editcourseId" value="<% = Rs4("courseid") %>">
            <td>City:</td>
            <td>&nbsp;&nbsp;
              <select name="editcity" id="city" onChange="clicked();">
                <option value="<% = Rs4("city") %> ">
                <% = Rs4("city") %>
                </option>
                <option value="" disabled="disabled">--Select--</option>
                <% If IsArray(arrAllCities) Then
           For cityRowCounter = cityFirstRow to cityLastRow %>
                <option value="<% = arrAllCities(0,cityRowCounter) %>">
                <% = arrAllCities(0,cityRowCounter) %>
                </option>
                <% Next
           End If %>
              </select>
            </td>
          </tr>
          <tr>
            <td class="zpCalSubheader"> Date Begin: </td>
            <td><input autocomplete="off" name="editstartdate" readonly value="<% = Rs4("startdate") %>" id="checkIn_date" type="text">
              <input value=" ... " id="button8a" class="buttonc" type="reset">
            </td>
            <td class="zpCalSubheader"> Date End: </td>
            <td><input autocomplete="off" name="editenddate" readonly value="<% = Rs4("enddate") %>" id="checkOut_date" type="text">
              <input value=" ... " id="button8b" class="buttonc" type="reset">
            </td>
          </tr>
          <tr>
        	 <td colspan="4"><b>Normal Course or Corporate Weekend Course:</b></td>
       	  </tr>
          <tr>
          	<td> Course Dates: </td>
          	<td colspan="3"><input type="text" name="editcoursedate" value="<% = Rs4("coursedates") %>" size="50"></td>
         </tr>
         <tr>
            <td>Start Time:</td>
            <td width="350px" >&nbsp;&nbsp;
              <select name="editstartinghour">
                <option value="<% = Rs4("starthour") %>">
                <% = Rs4("starthour") %>
                </option>
                <option value="" >HH</option>
                <option>01</option>
                <option>02</option>
                <option>03</option>
                <option>04</option>
                <option>05</option>
                <option>06</option>
                <option>07</option>
                <option>08</option>
                <option>09</option>
                <option>10</option>
                <option>11</option>
                <option>12</option>
              </select>
              <select name="editstartingminute">
                <option value="<% = Rs4("startminute") %>">
                <% = Rs4("startminute") %>
                </option>
                <option value="" >MIN</option>
                <option>00</option>
                <option>15</option>
                <option>30</option>
                <option>45</option>
              </select>
              <select name="editsessionstart">
                <option selected="selected">
                <% = Rs4("startsession") %>
                </option>
                <option>AM</option>
                <option>PM</option>
              </select>
            </td>
            <td>End Time:</td>
            <td width="600px">&nbsp;&nbsp;
              <select name="editendinghour">
                <option value="<% = Rs4("endhour") %>">
                <% = Rs4("endhour") %>
                </option>
                <option value="" >HH</option>
                <option>01</option>
                <option>02</option>
                <option>03</option>
                <option>04</option>
                <option>05</option>
                <option>06</option>
                <option>07</option>
                <option>08</option>
                <option>09</option>
                <option>10</option>
                <option>11</option>
                <option>12</option>
              </select>
              <select name="editendingminute">
                <option value="<% = Rs4("endminute") %>">
                <% = Rs4("endminute") %>
                </option>
                <option value="" >MIN</option>
                <option>00</option>
                <option>15</option>
                <option>30</option>
                <option>45</option>
              </select>
              <select name="editsessionend">
                <option value="<% = Rs4("endsession") %>">
                <% = Rs4("endsession") %>
                </option>
                <option>AM</option>
                <option>PM</option>
              </select>
            </td>
          </tr>
          <tr>
            <td>Instructor:</td>
            <td>&nbsp;&nbsp;
              <select name="editinstructor" id="instructor" style="width:150px">
                <option value="<% = Rs4("instructor") %>">
                <% = Rs4("instructor") %>
                </option>
                <option value="" disabled="disabled">--Select--</option>
                <% If IsArray(arrAllInstructors) Then
        		   For instructorRowCounter = instructorFirstRow to instructorLastRow 
				   Inst = Trim(arrAllInstructors(0,instructorRowCounter)) &" "& Trim(arrAllInstructors(1,instructorRowCounter))   
				%>
                <option value="<% = Inst %>">
                <% = arrAllInstructors(0,instructorRowCounter)%>
                &nbsp;
                <% = arrAllInstructors(1,instructorRowCounter) %>
                </option>
                <% Next
          End If %>
			   <% If Session("country") = "Canada" Then %>
			   <option value="Charles Quansah">Charles Quansah </option>
			   <% End If %> 
          
              </select>
            </td>
            <td>BackUp Instructor:</td>
            <td>&nbsp;&nbsp;
              <select name="editbackupinstructor" id="backupinstructor" style="width:150px">
                <option value="<% = Rs4("backupinstructor") %>">
                <% = Rs4("backupinstructor") %>
                </option>
                <option value="" disabled="disabled">--Select--</option>
                <% If IsArray(arrAllInstructors) Then
          		   For instructorRowCounter = instructorFirstRow to instructorLastRow 
				   Inst = Trim(arrAllInstructors(0,instructorRowCounter)) &" "& Trim(arrAllInstructors(1,instructorRowCounter))   
				%>
                <option value="<% = Inst %>">
                <% = arrAllInstructors(0,instructorRowCounter)%>
                &nbsp;
                <% = arrAllInstructors(1,instructorRowCounter) %></option>
                <% Next
          End If %>
			   <% If Session("country") = "Canada" Then %>
			   <option value="Charles Quansah">Charles Quansah </option>
			   <% End If %> 
          
              </select>
            </td>
          </tr>
           <tr>
            <td  width="250px">ATO No: </td>
            <td><input type="text" name="ATO_Ref_No" value="<% = Rs4("ATO_Ref_No") %>"></td></tr>
            <tr>
            <td  width="310px">Exam No: </td>
            <td><input type="text" name="Exam_No" value="<% = Rs4("Exam_No") %>">
             </td>
             <td  width="250px">Exam Receipt No: </td>
              <td><input type="text" name="ATO_Ref_No" value="<% = Rs4("ATO_Ref_No") %>">
             </td>
          </tr>
          <tr>
            <td>Price WithOut Tax:</td>
            <td><input type="text" name="priceWithOutTax" maxlength="15" size="20" value="<% = Rs4("pricewithouttax") %>" onchange="calculate();">
              <br>
              &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">(Ex : 17250 )</font></td>
            <td>Tax:</td>
            <td><input type="text" name="tax" size="20" maxlength="6" value="<% = Rs4("tax") %>"onchange="calculate();">
              <br>
              &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">(Ex : 12.36 )</font> </td>
          </tr>
          <tr>
            <td>Price With Tax:</td>
            <td><input type="text" name="priceWithTax" value="<% = Rs4("pricewithtax") %>"size="20" readonly="true">
              <br>
              &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2"></font></td>
          </tr>
          <tr>
            <td>EarlyBird Discount:</td>
            <td><input type="text" name="earlybirddicount" maxlength="10" onchange="calculate()" value="<% = Rs4("earlybirddiscount") %>" size="20">
              <br>
              &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">(Ex : 1000 )</font></td>
            <td>Applicable Days:</td>
            <td><input type="text" name="applicabledays" maxlength="10" value="<% = Rs4("applicabledays") %>" >
              <br>
              &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">(Ex : 10 )</font></td>
          </tr>
          <tr>
            <td  width="250px">Price After EarlyBird Discount(WithOut Tax):</td>
            <td><input type="text" name="afterearlybirddiscountwithouttax" value="<% = Rs4("afterEBdiscountwithouttax") %>" readonly="true" ></td>
            <td  width="280px">Price After EarlyBird Discount(With Tax):</td>
            <td><input type="text" name="afterearlybirddiscountwithtax" value="<% = Rs4("afterEBdiscountwithtax") %>" readonly="true" ></td>
          </tr>
          <tr>
            <td  width="250px">Hotel Name: </td>
            <td><input type="text" name="edithotelname" value="<% = Rs4("hotelname") %>"></td>
            <td  width="310px">Hotel Phone Number: </td>
            <td><input type="text" maxlength="50" name="edithotelphonenumber" value="<% = Rs4("hotelphonenumber") %>">
              <br />
              <font face="Arial" color="red" size="2">(Ex : 0802345678 )</font></td>
          </tr>
          <tr>
            <td  width="250px">Hotel URL: </td>
            <td><input type="text" maxlength="300" name="edithotelurl" value="<% = Rs4("hotelurl") %>">
              <br />
              <font face="Arial" color="red" size="2">(Ex : http://www.ashoka.com)</font></td>
          </tr>
          <tr>
            <td  width="280px">Hotel Address: </td>
            <td><textarea name="edithoteladdress"  rows="4" cols="25"><% = Rs4("hoteladdress") %>
</textarea></td>
          </tr>
          <tr>
            <td>Status : </td>
            <td><select name="status">
                <option <% If Rs4("status") = "Available" Then %> selected="selected" <% End If %> value="Available">Available</option>
                <option <% If Rs4("status") = "Avail-4ED" Then %> selected="selected" <% End If %> value="Avail-4ED">Avail-4ED</option>
                <option <% If Rs4("status") = "Full" Then %> selected="selected" <% End If %> value="Full">Full</option>
                <option <% If Rs4("status") = "Full-4ED" Then %> selected="selected" <% End If %> value="Full-4ED">Full-4ED</option>
                <option <% If Rs4("status") = "4thEdition" Then %> selected="selected" <% End If %> value="4thEdition">4thEdition</option>
                <option <% If Rs4("status") = "Cancelled" Then %> selected="selected" <% End If %> value="Cancelled">Cancelled</option>
                <option <% If Rs4("status") = "Completed" Then %> selected="selected" <% End If %> value="Completed">Completed</option>
              </select>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center"><input type="submit" name="editcourse" value="Edit Course" class="buttond">
            </td>
          </tr>
        </table>
      </form></td>
  </tr>
  <% 
    Rs4.Movenext
    Loop 
    End If 
 'Edit If Condition Closed Here'
 'Displaying All The Courses Here'
 %>
  <tr>
  <td height="3765" valign="top"><table border="0" style="margin-left:-4px;margin-top:-4px;">
      <tr>
        <td><table border="1" cellpadding="5" cellspacing="0">
         <form name="course" action="courses.asp?type=submit" method="post">
         
        <tr><td><b>Courses:</b></td>
 			<td colspan="5"><select name="CourseId" id="courses" style="width:350px">
             <option value="">-- Select --</option>
             <% If IsArray(arrAllRecords) Then
          		 For rowcounter = firstRow to allNumRows 
				courseId = arrAllRecords(0,rowcounter) 
				
			  %>
 				<option value="<% = courseId %>"><% = arrAllRecords(1,rowcounter) %>&nbsp;<% = FormatDateTime(arrAllRecords(2,rowcounter),1) %>&nbsp;to&nbsp;<% = FormatDateTime(arrAllRecords(3,rowcounter),1) %></option>
         <% Next %>
		
          		<% End If %>
                    
 				</select>
   
      <input type="submit" id="submit" value="Submit"/></td>
                
          </tr>
          </form>
            <tr height="25">
              <td bgcolor="#A7DBFB" align="center"><b>Coursename</b></td>
              
              <td bgcolor="#A7DBFB" align="center"><b>Location</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Course</b></td>
              <% If Not Session("typeofuser") = "CSR" Then %>
              <td bgcolor="#A7DBFB" align="center"><b>Edit</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Delete</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Status</b></td>
              <% End If %>
            </tr>
            <% If IsArray(arrAllRecords) Then

      FOR rowcounter = firstRow TO lastRow

  %>
            <tr id="htMap">
              <td>
              <% 'If (arrAllRecords(5,rowcounter) = "Weekend") Then %>
             
              <% If (arrAllRecords(5,rowcounter) = "Corporate") Then %>
              Corporate ITIL Course
              <% ElseIf (arrAllRecords(5,rowcounter) = "OSA") Then %>
              OSA Course
              <% ElseIf (arrAllRecords(5,rowcounter) = "CSI") Then %>
              CSI Course
               <% ElseIf (arrAllRecords(5,rowcounter) = "2day-live") Then %>
              2 Day Live
               <% ElseIf (arrAllRecords(5,rowcounter) = "3day-live") Then %>
             3 Day Live
             <% ElseIf (arrAllRecords(5,rowcounter) = "SS") Then %>
             Service Strategy 
             <% ElseIf (arrAllRecords(5,rowcounter) = "SS-Live") Then %>
             Service Strategy-Live
           
                  <% ElseIf (arrAllRecords(5,rowcounter) = "Corporate-SO") Then %>
              corporate class-SO
               <% ElseIf (arrAllRecords(5,rowcounter) = "Corporate-SS") Then %>
              corporate class-SS 
              <% ElseIf (arrAllRecords(5,rowcounter) = "Corporate-SD") Then %>
              corporate class-SD 
              <% ElseIf  (arrAllRecords(5,rowcounter) = "Corporate-ST") Then %>
              corporate class-ST 
               <% ElseIf  (arrAllRecords(5,rowcounter) = "Corporate-CSI") Then %>
              corporate class-CSI 
            <% ElseIf  (arrAllRecords(5,rowcounter) = "Corporate-MALC") Then %>
              corporate class-MALC
           
                
              <% Else %>
              Normal ITIL Course
              <% End If %>
              </td>
              <% courseId = arrAllRecords(0,rowcounter) %>
              <td><% = arrAllRecords(1,rowcounter) %></td>
              <td><a href="courses.asp?CourseId=<% = courseId %>&Course=<% = rqCourse %>&page=<% = iPageCurrent %>">
                <% = FormatDateTime(arrAllRecords(2,rowcounter),1) %>
                to
                <% = FormatDateTime(arrAllRecords(3,rowcounter),1) %>
                </a></td>
              <% If Not Session("typeofuser") = "CSR" Then %>
              <td><a href="courses.asp?Course=<% = rqCourse %>&type=Edit&editId=<% = courseId %>">Edit</a></td>
              <td><a href="addEditDeleteCourse.asp?delete=<% = courseId %>" onclick="return DeleteAlert(this.href);">Delete</a></td>
              <td><b>
                <% = arrAllRecords(4,rowcounter) %>
                </b></td>
              <% End If %>
            </tr>
            <% Next %>
            <tr id="htMap">
              <td colspan="8"><!--#include file="pagination.asp"-->
               <% 
			    ps = getPaginationString(page, (numRows + 1), 10, 2, "courses.asp?Course="& rqCourse &"")
				  Response.Write(ps)
	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
              </td>
            </tr>
            <tr>
              <td colspan="9"><div align="center"><font face="Arial" size="2" color="orangered"><%=message%></font></div></td>
            </tr>
          </table></td>
      </tr>
      <% End If%>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <%
 'If You Click On One Particular Course Then Only Display That Course Full Details And EnrolledUsers That Particular Course'
 If rqCourseId <> "" Then 
 %>
      <tr>
        <td colspan="8" valign="top" ><table border="1" cellspacing="0">
            <tr>
              <td bgcolor="#A7DBFB" align="center"><b>Coursename</b></td>
              <% If (Rs1("coursetype") = "Corporate") Then %>
              <td bgcolor="#A7DBFB" align="center"><b>Company</b></td>
              <% End If %>  
              <td bgcolor="#A7DBFB" align="center"><b>Location</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Course</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Timing</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>ATO Refrence</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Exam No</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Exam Receipt No</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Price WithOut Tax</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Price With Tax</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Tax</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Instructor</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>BackUp Instructor</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Applicable Days</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>EarlyBird Discount</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Price After EarlyBird Discount(WithOut Tax)</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Price After EarlyBird Discount(With Tax)</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Hotel Name</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Hotel Phone Number</b></td>
              <td bgcolor="#A7DBFB" align="center" width="50px"><b>Hotel URL</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Hotel Address</b></td>
            </tr>
            <% do until Rs1.EOF %>
            <tr id="htMap">
              <td>

              <% If (Rs1("coursetype") = "Weekend") Then %>
              Weekend ITIL Course
              <% ElseIf (Rs1("coursetype") = "Corporate" AND Rs1("coursedates") <> "") Then %>
              Corporate Weekend ITIL Course
              <% ElseIf (Rs1("coursetype") = "Corporate") Then %>
              Corporate ITIL Course
               <% ElseIf (Rs1("coursetype") = "OSA") Then %>
              OSA Course
               <% ElseIf (Rs1("coursetype") = "CSI") Then %>
              CSI Course
               <% ElseIf (Rs1("coursetype") = "ST") Then %>
             Service Transition
              <% ElseIf (Rs1("coursetype") = "SS") Then %>
              Service Strategy
              <% ElseIf  (Rs1("coursetype") = "2day-live") Then %>
              2 Day Live
               <% ElseIf  (Rs1("coursetype") = "3day-live") Then %>
             3 Day Live
                              <% ElseIf (Rs1("coursetype") = "Corporate-SO") Then %>
              corporate class-SO
               <% ElseIf (Rs1("coursetype") = "Corporate-SS") Then %>
              corporate class-SS 
              <% ElseIf (Rs1("coursetype") = "Corporate-SD") Then %>
              corporate class-SD 
              <% ElseIf  (Rs1("coursetype") = "Corporate-ST") Then %>
              corporate class-ST 
              <% ElseIf  (Rs1("coursetype") = "Corporate-CSI") Then %>
              corporate class-CSI 
                   <% ElseIf  (Rs1("coursetype") = "Corporate-MALC") Then %>
              corporate class-MALC 
                  <% Else %>
               
              Normal ITIL Course
              <% End If %>
                            

              </td>
               <% If (Rs1("coursetype") = "Corporate") Then %>
              <td align="center"><% = Rs1("company") %></td>
              <% End If %>      
              <td align="center"><% = Rs1("city") %></td>
              <td><% = FormatDateTime(Rs1("startdate"),1) %>
                to
                <% = FormatDateTime(Rs1("enddate"),1) %></td>
              <td align="center"><% = Rs1("starthour") %>
                :
                <% = Rs1("startminute") %>
                <% =Rs1("startsession")%>
                -
                <% = Rs1("endhour") %>
                :
                <% = Rs1("endminute")%>
                <% =Rs1("endsession")%>
                </a></td>
                 <td align="center"><% = Rs1("ATO_Ref_No") %></td>
              <td align="center"><% = Rs1("Exam_No") %></td>
              <td align="center"><% = Rs1("Exam_Recp_No") %></td>  
              <td align="center"><% = Rs1("pricewithouttax") %></td>
              <td align="center"><% = Rs1("pricewithtax") %></td>
              <td align="center"><% = Rs1("tax") %></td>
              <td align="center"><% = Rs1("instructor") %></td>
              <td align="center"><% = Rs1("backupinstructor") %></td>
              <td align="center"><% = Rs1("applicabledays") %></td>
              <td align="center"><% = Rs1("earlybirddiscount") %></td>
              <td align="center"><% = Rs1("afterEBdiscountwithouttax") %></td>
              <td align="center"><% = Rs1("afterEBdiscountwithtax") %></td>
              <td align="center"><% = Rs1("hotelname") %></td>
              <td align="center"><% = Rs1("hotelphonenumber") %></td>
              <td align="center"><% = Rs1("hotelurl") %></td>
              <td align="center"><% = Rs1("hoteladdress") %></td>
            </tr>
            <% CourseStatus = Rs1("status")
                Rs1.Movenext
        Loop %>
          </table></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
      
      <td><table  width="1800px" border="1" valign="top" cellspacing="0">
          <tr>
            <td bgcolor="#A7DBFB" align="center" width="50px"><b>ID</b></td>
            <td bgcolor="#A7DBFB" align="center" width="50px"><b>Course</b></td>
            <td bgcolor="#A7DBFB" align="center" width="50px"><b>Cand No</b></td>
            <td bgcolor="#A7DBFB" align="center" width="70px"><b>First Name</b></td>
            <td bgcolor="#A7DBFB" align="center" width="80px"><b>Last Name</b></td>
            <td bgcolor="#A7DBFB" align="center" width="100px"><b>Email</b></td>
            <td bgcolor="#A7DBFB" align="center" width="70px"><b>Name Of Employeer</b></td>
            <td bgcolor="#A7DBFB" align="center" width="80px"><b>Phone Number</b></td>
			<td bgcolor="#A7DBFB" align="center" width="100px"><b>Address</b></td>
            <td bgcolor="#A7DBFB" align="center"  width="100px"><b>Course Details</b></td>
            <td bgcolor="#A7DBFB" align="center" width="100px"><b>Amount</b></td>
			<% If (Session("Country") = "United Kingdom" OR Session("Country") = "India" OR Session("Country") = "Australia"  OR Session("Country") = "Germany" ) Then %>
            <td bgcolor="#A7DBFB" align="center" width="100px"><b>VAT/Tax Amount</b></td>
            <% End If %>  
            <td bgcolor="#A7DBFB" align="center" width="50px"><b>P I Details</b></td>
            <td bgcolor="#A7DBFB" align="center" width="80px"><b>Date Of Enrollment</b></td>
            <td bgcolor="#A7DBFB" align="center" width="200px"><b>Payment Received</b></td>
            <td bgcolor="#A7DBFB" align="center" width="80px"><b>Status</b></td>
			
              <td bgcolor="#A7DBFB" align="center" width="80px"><b>Result</b></td>
       
            
            <td bgcolor="#A7DBFB" align="center" colspan="2" width="80px"><b>Comments</b></td>
            <td bgcolor="#A7DBFB" align="center" colspan="2" width="80px"><b>Enroll Status</b></td>
          </tr>
          <%
          If IsArray(arrAllQueries) Then
          For enrollrowcounter = enrollfirstRow TO enrolllastRow
       %>
          <form name="checkreceived" action="enrolledDb.asp?type=review" method="post" onsubmit="return Form_Validator2(this)">
            <tr id="htMap">
              <td align="center"><% = arrAllQueries(0,enrollrowcounter) %></td>
              <td align="center"><% = arrAllQueries(40,enrollrowcounter) %></td>
              <td align="center"><% = arrAllQueries(42,enrollrowcounter) %></td>
              <input type="hidden" name="enrollUserId" value="<% = arrAllQueries(0,enrollrowcounter) %>">
              <td align="center"><% = arrAllQueries(1,enrollrowcounter) %></td>
              <input type="hidden" name="firstname" value="<% = arrAllQueries(1,enrollrowcounter) %>">
              <td align="center"><% = arrAllQueries(2,enrollrowcounter) %></td>
              <input type="hidden" name="lastname" value="<% = arrAllQueries(2,enrollrowcounter) %>">
              <td align="center"><% = arrAllQueries(3,enrollrowcounter) %><br /><br />
             <a href="updateUserDet.asp?enrollUserId=<% = arrAllQueries(0,enrollrowcounter) %>&courseId=<% = rqCourseId %>" >Update Details</a>
              </td>
              <input type="hidden" name="email" value="<% = arrAllQueries(3,enrollrowcounter) %>">
              <td align="center"><% = arrAllQueries(4,enrollrowcounter)  %></td>
              <input type="hidden" name="employeer" value="<% = arrAllQueries(4,enrollrowcounter) %>">
              <td align="center"><% = arrAllQueries(5,enrollrowcounter) %></td>
			   <td align="center"><% = arrAllQueries(34,enrollrowcounter) %><br /><% = arrAllQueries(23,enrollrowcounter) %></td>
              <input type="hidden" name="phoneno" value="<% = arrAllQueries(5,enrollrowcounter) %>">
              <input type="hidden" name="CourseDetails" value="<% = arrAllQueries(6,enrollrowcounter) %>" />
              <input type="hidden" name="courseId" value="<% = arrAllQueries(20,enrollrowcounter) %>">
              <td align="center"><% = arrAllQueries(6,enrollrowcounter) %></td>
              <%  courseDate = arrAllQueries(7,enrollrowcounter) %>
              <input type="hidden" name="Amount" value="<% = arrAllQueries(8,enrollrowcounter) %>" />
			   <input type="hidden" name="VAT" value="<% = arrAllQueries(38,enrollrowcounter) %>" />
			  
			   <% If (arrAllQueries(14,enrollrowcounter) = "Active" And arrAllQueries(30,enrollrowcounter) <> "") Then %>
		      
			    <td align="center"> Amount = <% = arrAllQueries(8,enrollrowcounter) %><br />Re-Schedule: <% = arrAllQueries(30,enrollrowcounter) %><br />
                 <% If arrAllQueries(41,enrollrowcounter) <> ""  then %>
               	Facebook Discount:
                 <% = arrAllQueries(41,enrollrowcounter) %><br />
                               <% End IF %> 
                
                </td>
			  
			   <% ElseIf arrAllQueries(14,enrollrowcounter) = "Active" And IsNull(arrAllQueries(30,enrollrowcounter)) Then %>
			  
			   <td align="center"> Amount: <% = arrAllQueries(8,enrollrowcounter) %>
                <% If arrAllQueries(41,enrollrowcounter) <> "" then %>
               	Facebook Discount:
                 <% = arrAllQueries(41,enrollrowcounter) %><br />
                 
                 Total : <% = (Int(arrAllQueries(8,enrollrowcounter)) - Int(arrAllQueries(41,enrollrowcounter))) %>
              <% End IF %> 
               </td>
               
			  
			   <% ElseIf (arrAllQueries(14,enrollrowcounter) <> "Active") Then %>
			  
			   <td align="center">
               
               Amount: <% = arrAllQueries(8,enrollrowcounter) %><br />
                <% If arrAllQueries(41,enrollrowcounter) <> "" then %>
               	Facebook Discount:
                 <% = arrAllQueries(41,enrollrowcounter) %><br />
                 
              <% End IF %> 
                
			   <% If arrAllQueries(14,enrollrowcounter) = "Cancel" then %>
               	Cancellation fee:
			   <% ElseIf arrAllQueries(14,enrollrowcounter) = "MBG" then %>
               	MBG Paid:
			   <% ElseIf (arrAllQueries(14,enrollrowcounter) = "Re-Schedule" And arrAllQueries(30,enrollrowcounter) <> "") Then %>
                Re-Schedule:
			   <% End IF %> 
               
			   <% = arrAllQueries(30,enrollrowcounter) %><br />
			   
			   <% If arrAllQueries(14,enrollrowcounter) = "Cancel" OR arrAllQueries(14,enrollrowcounter) = "MBG"  then %>
			   	<% If arrAllQueries(14,enrollrowcounter) = "Cancel" then %> 
                	Amount Refunded:
				<% ElseIf arrAllQueries(14,enrollrowcounter) = "MBG" then %>
                	Remainig Amount:
				<% End IF %> 
                 <% If arrAllQueries(41,enrollrowcounter) <> "" then %>
               <% If arrAllQueries(0,enrollrowcounter) <> "11823" AND  arrAllQueries(0,enrollrowcounter) <> "12157" then %>
               <% = (Int(arrAllQueries(8,enrollrowcounter)) - Int(arrAllQueries(30,enrollrowcounter)) - Int(arrAllQueries(41,enrollrowcounter)) ) %>
               <% ElseIf arrAllQueries(0,enrollrowcounter) = "11823" OR  arrAllQueries(0,enrollrowcounter) = "12157" then %>
                 <% = (Int(arrAllQueries(8,enrollrowcounter)) - Int(arrAllQueries(30,enrollrowcounter)) ) %>
               <% End IF %>	
               <% Else %>
             
				<% = (Int(arrAllQueries(8,enrollrowcounter)) - Int(arrAllQueries(30,enrollrowcounter))) %>
                 <% End IF %> 
			<% End If  %>
			
           </td>
			     <% End IF %>
				 <% If (Session("Country") = "United Kingdom" OR Session("Country") = "India" OR Session("Country") = "Australia"  OR Session("Country") = "Germany" ) Then %>
			  <td>VAT/Tax:
			  <% If arrAllQueries(38,enrollrowcounter) <> "" Then %>
			  <% = arrAllQueries(38,enrollrowcounter) %>
              <% Else %>
				0
              <% End If %>
              </td> 
              <% End If %>	
			   
              <td><a href="proformaInvoiceDetails.asp?enrollUserId=<% = arrAllQueries(0,enrollrowcounter) %>">Invoice</a></td>
              <td align="center"><% = FormatDateTime(arrAllQueries(9,enrollrowcounter),1) %></td>
              <td align="center">
			  
              <table border="0" width="150px">
			 <% If  (arrAllQueries(24,enrollrowcounter)  = "Dummy") Then%>
             	 <tr><td>Dummy Enrollment</td></tr>
            <% ElseIf CourseStatus = "Cancelled" Then %>
             	 <tr><td>Cancelled Class</td></tr>
             <% Else %>
              	<tr>
                	<td>
						<% If  (arrAllQueries(11,enrollrowcounter)  = "Yes") then%>
						Payment Received: <% =  arrAllQueries(11,enrollrowcounter)  %><br /><br />
                        <% Else %>
                        Payment:  <input type ="radio" name="review" value="Yes" />Yes<br /><br />
                        Mode of Payment: <select name="modeofpayment">
                        					<option value="">--Select--</option>
                                            <option value="Google Checkout">Google Checkout</option>
                                            <option value="PayPal">PayPal</option>
											 <option value="Cash">Cash</option>
                                            <option value="BOA - Check">BOA - Check</option>
                                            <option value="BOA - Wire Transfer">BOA - Wire Transfer</option>
                                            <option value="CCAvunue - USD">CCAenue - USD</option>
                                            <option value="CCAvenue - INR">CCAvenue - INR</option>
                                            <option value="ICICI Bank">ICICI Bank</option>
                                            <option value="HSBC - UK">HSBC - UK</option>
                                            <option value="BOA-Counter Credit">BOA-Counter Credit</option>
											 <option value="Bank Transfer - ANZ">Bank Transfer - ANZ</option>
                                             <option value="Bank Transfer - DB">Bank Transfer - DB</option>

                        				 </select><br /><br />
						 Order / Trans No :<input  name="orderNo" type="text" size="20"><br /><br />
                         Date:<input  name="Paymentdate"  type="text" size="10"><br />(YYYY-MM-DD)         
                        <% End If %>
                      </td>
                     </tr>
                     <tr>
                      <td><% if  (arrAllQueries(11,enrollrowcounter)  = "Yes") then%>
                        <% If arrAllQueries(32,enrollrowcounter) <> "" Then %>
                        Mode of Payment: <% =  arrAllQueries(32,enrollrowcounter)  %><br /><br />
                        <% End If %>
                        Date: <% =  arrAllQueries(12,enrollrowcounter)  %>
                        <br>
                        <br>
                        Received by <% = arrAllQueries(13,enrollrowcounter) %>
                        <br />
                        <br />
                        <% Else %>
                        <div align="right"><input type = "submit" name="save" class="buttonc" value="Enter"/></div>
                        <% End if %>
                        <% If arrAllQueries(18,enrollrowcounter) = 1 Then 
                      Response.Write("Check received email sent") %>
                        <a href="javascript:void(0)" onClick="window.open('paymentreceivedemail.asp?enrollUserId=<% = arrAllQueries(0,enrollrowcounter) %>')"><BR />Check recd Email</a><br /><br />
                        <a href="Referral_sendmail.asp?enrollUserId=<% = arrAllQueries(0,enrollrowcounter) %>" target="_blank" onclick="return ReferralmailAlert(this.href);"><BR />Send Referral Email</a>
                        <% Else %>
                        <a href="javascript:void(0)" onClick="window.open('paymentreceivedemail.asp?enrollUserId=<% = arrAllQueries(0,enrollrowcounter) %>')"><BR />Check recd Email</a><br /><br />
                        <a href="Referral_sendmail.asp?enrollUserId=<% = arrAllQueries(0,enrollrowcounter) %>" target="_blank" onclick="return ReferralmailAlert(this.href);"><BR />Send Referral Email</a>
                        <% End if %>
                        <% if  (arrAllQueries(11,enrollrowcounter)  = "Yes") And ISNULL(arrAllQueries(19,enrollrowcounter))  then%>
                        <br />
                       <input type="hidden" name="enrollUserId" value="<%= arrAllQueries(0,enrollrowcounter) %>" />
	
                        <a href="javascript:void(0)" onClick="window.open('sendmails_Venue.asp?CourseId=<% = courseId %>&enrollUserId=<%= arrAllQueries(0,enrollrowcounter) %>')"><BR />Send Venue Detail</a>
                         <% End If %> 
                       <% If  (arrAllQueries(19,enrollrowcounter) = 1) then %>
                        <br /><br />
                       <b>Venue Detail Sent</b>
                        <% End If %>
                      </td>
                      </tr>
                      <% End If %>
                      </table>
                      
                  </form>
          
          <td align="center">
          <% If  (arrAllQueries(24,enrollrowcounter)  = "Dummy") Then%>
          Dummy Enrollment
          <% Else %>
          <form name="form1" action="reScheduledCourses.asp" method="post" onsubmit="return Form_Validator5(this)">
              <input type="hidden" name="enrollUserId" value="<% = arrAllQueries(0,enrollrowcounter) %>">
              <input type="hidden" name="CourseDetails" value="<% = arrAllQueries(6,enrollrowcounter) %>" />
              <input type="hidden" name="review" value="<% = arrAllQueries(17,enrollrowcounter) %>">
              <input type="hidden" name="courseId" value="<% = arrAllQueries(20,enrollrowcounter) %>">
              <input type="hidden" name="enrolldate" id="enrolldate" value="<% = arrAllQueries(7,enrollrowcounter) %>">
              <input type="hidden" name="mbg_amount" value="<% = arrAllQueries(30,enrollrowcounter) %>">
			    <% 'along with dropdown,text is also displayed for MBG,Active and Re-Schedule Not Confirmed status
			  
			  If arrAllQueries(14,enrollrowcounter) = "Active" OR arrAllQueries(14,enrollrowcounter) = "MBG" OR arrAllQueries(14,enrollrowcounter) = "Re-Schedule Not Confirmed" Then %>
			  <% If arrAllQueries(14,enrollrowcounter) = "Re-Schedule Not Confirmed" Then %>
			  <% = arrAllQueries(14,enrollrowcounter) %><br />
			  <% = arrAllQueries(15,enrollrowcounter) %>
			  <% End If %>
			  <br /><br />
           <select name="changestatus" >
                         <option value="">--Select--</option>
               <option value="Cancel">Cancel</option>
               <option value="Re-Schedule">Re-Schedule</option>
			   	<option value="MBG">MBG</option>
                      <% If arrAllQueries(14,enrollrowcounter) <> "Re-Schedule Not Confirmed" Then %>
                               <option value="Re-Schedule Not Confirmed">Re-Schedule Not Confirmed</option>
               <% ElseIf arrAllQueries(14,enrollrowcounter) = "Re-Schedule Not Confirmed" Then %>
               <option value="Active">Reinstate</option>
                               <% End if %>
                               
             </select><br /><br />
              <input type="Submit" class="buttonc"  Value="Change status">
              </form>
              <% Else %>
            <% = arrAllQueries(14,enrollrowcounter) %>
              <br />
              <% = arrAllQueries(15,enrollrowcounter) %>
            <% End if %>
            <% End If %>
            </td>
             
			
		<td align="center">
			 <% If  (arrAllQueries(24,enrollrowcounter)  = "Dummy") Then%>
          Dummy Enrollment
          <% Else %>
			<b>Foundation</b><br /><br />
			
             <form name="Result" action="result.asp?type=submit" method="post" onsubmit="return Form_Validator3(this)">
              <input type="hidden" name="enrollUserId" onChange="myPopup2()" value="<% = arrAllQueries(0,enrollrowcounter) %>">
             <input type="hidden" name="courseId" value="<% = arrAllQueries(20,enrollrowcounter) %>">
                
                               

                <% if  (arrAllQueries(36,enrollrowcounter) >= "26") then%>
                  <b>Result:</b> <font color="red">Pass</font> <span><a href="javascript:void(0)" onClick="this.parentNode.lastChild.style.display='Block'">Edit</a> <br /><br /><span id="Result" style="display:none"> <input type="text" name="foundation" /><br />
<div align="center"><input type ="submit" name="type" class="buttonc" value="Save"/></div></span></span><br /><br />
                   <% Elseif  (arrAllQueries(36,enrollrowcounter) < "26") then%>
                    <b>Result:</b> <font color="red">Fail</font><span><a href="javascript:void(0)" onClick="this.parentNode.lastChild.style.display='Block'">Edit</a> <br /><br /><span id="Result" style="display:none"> <input type="text" name="foundation" /><br />
<div align="center"><input type ="submit" name="type" class="buttonc" value="Save"/></div></span></span><br /><br /><br /><br />
                        <% Else %>
                       <span > <input type="text" name="foundation" /><br /><br />
                        <div align="center"><input type ="submit" name="type" class="buttonc" value="Save"/></div> </span><br /><br />
                                                
                        <% End if %>
						<% if  (arrAllQueries(36,enrollrowcounter) <> "") then%>
                     <a href="javascript:void(0)" onClick="window.open('examResult.asp?enrollUserId=<% = arrAllQueries(0,enrollrowcounter) %>&course=Foundation')">Send result</a>
              			<% End If %>
              
                </form>
                
			 
                
             <% End if %>
			   </td>   
			
			
            <form name="comment" action="enrolledDb.asp?type=comment" method="post" onsubmit="return Form_Validator3(this)">
              <input type="hidden" name="enrollUserId" onChange="myPopup2()" value="<% = arrAllQueries(0,enrollrowcounter) %>">
              <input type="hidden" name="CourseDetails" value="<% = arrAllQueries(6,enrollrowcounter) %>" />
              <input type="hidden" name="enrolldate" value="<% = arrAllQueries(7,enrollrowcounter) %>">
              <input type="hidden" name="courseId" value="<% = arrAllQueries(20,enrollrowcounter) %>">
              <td align="center"><Textarea name="notes" rows="5" cols="25" ></Textarea>
                <input type="submit" class="buttonc" value="Save">
              </td>
            </form>
            <td><iframe src="enrollUserComments.asp?enrollUserId=<% = arrAllQueries(0,enrollrowcounter) %>" frameborder="0" height="100" scrolling="yes" width="250"> </iframe></td>
            <form name="comment" action="enrolledDb.asp?type=enrollStatus" method="post" onsubmit="return Form_Validator4(this)">
              <input type="hidden" name="enrollUserId" value="<% =  arrAllQueries(0,enrollrowcounter) %>">
              <input type="hidden" name="courseId" value="<% = arrAllQueries(20,enrollrowcounter) %>">
              <td><br />
                <% If IsNull(arrAllQueries(24,enrollrowcounter)) OR arrAllQueries(24,enrollrowcounter) = "Active" OR arrAllQueries(24,enrollrowcounter) = "" Then %>
					<% If  IsNull(arrAllQueries(11,enrollrowcounter)) OR  arrAllQueries(11,enrollrowcounter) = "" then%>
					<select name="enrollStatus">
					  <option value="">--Select--</option>
					  <option value="Dummy">Dummy</option>
					  <option value="P.O Received">P.O Received</option>
					  <option value="Payment Declined">Payment Declined</option>
					  <option value="Under Process">Under Process</option>
                      <option value="Future Follow up">Future Follow up</option>
					</select>
					<br />
					<br />
              
                    P.O. Expected Date:<br />
                    
                <input name="POexpected" id="POexpected" type="text" size="10"><br />(YYYY-MM-DD)</input>
      
                   <br /><br />
					<input type="submit" name="type" value="Submit"   class="buttonc"/>
						<% If Not IsNull(arrAllQueries(24,enrollrowcounter)) Then %>
						<% = arrAllQueries(24,enrollrowcounter) %>
						added by
						<% = arrAllQueries(25,enrollrowcounter) %>
						<% End If %>
					<% End If %>
                <% Else %>
                <select name="enrollStatus">
                  <option value="">--Select--</option>
                  <option value="Active">Active</option>
                </select>
                <br />
                <br />
                <input type="submit" name="type" value="Submit"  class="buttonc"/>
                <% = arrAllQueries(24,enrollrowcounter) %>
                added by
                <% = arrAllQueries(25,enrollrowcounter) %>
                <% End If %>
              </td>
            </form>
          </tr>
          <% allMailSent = arrAllQueries(19,enrollrowcounter) 
	     	 courseId = arrAllQueries(20,enrollrowcounter) %>
          </tr>
          
          <% Next %>
          <tr>
            <td colspan="19" id="htMap"><% If Not enrollfirstRow = 0 Then %>
              <a href="courses.asp?CourseId=<% = courseId %>&enrollPage=previous&enrollRow=<% = enrollfirstRow %>&Course=<% = rqCourse %>&page=<% = iPageCurrent %>"> &lt;&lt;Previous</a>
              <% End If %>
              <% = ((enrollfirstRow + 1) & " - " & (enrolllastRow + 1) & " of " & (enrollnumRows + 1)) %>
              <% If Not enrollnumRows = enrolllastRow Then %>
              <a href="courses.asp?CourseId=<% = courseId %>&enrollPage=next&enrollRow=<% = enrolllastRow %>&Course=<% = rqCourse %>&page=<% = iPageCurrent %>"> &gt;&gt;Next</a>
              <% End If %>
            </td>
          </tr>
          <tr>
            <td colspan="19" id="htMap"><% If allMailSent = 1 Then
	       Response.Write("All Mails Sent") %>
              <a href="javascript:void(0)" onClick="window.open('sendmails.asp?CourseId=<% = courseId %>')">Send Mails</a>
              <% Else %>
              <a href="javascript:void(0)" onClick="window.open('sendmails.asp?CourseId=<% = courseId %>')">Send Mails</a>
              <!--	 </form>-->
              <% End If %>
            </td>
          </tr>
          <% End If %>
        </table></td>
      </tr>
      
    </table>
    <% End If %>
  </td>
  </tr>
  </table>
</div>
<!-- This Script For Calendar -->
<script type="text/javascript">
   			<!--  to hide script contents from old browsers
   			var startDate;
   			var endDate;

   			function resetDates() {
   				startDate = endDate = null;
   			}

   			function filterDates1(cal) {
   				startDate = new Date(cal.date)
   				startDate.setHours(0,0,0,0)	// used for compares without TIME
   				/* If they haven't chosen an
   				end date before we'll set it to the same date as the start date This
   				way if the user scrolls in the start date 5 months forward, they don't
   				need to do it again for the end date.
   				*/

   				if (endDate == null) {
   					Zapatec.Calendar.setup({
   						inputField     :    "checkOut_date",
   						button         :    "button8b",  // What will trigger the popup of the calendar
   						ifFormat       :    "%b %d, %Y",
   						date           :     cal.date,
   						showsTime      :     false,          //no time
   						dateStatusFunc		:    disallowDateBefore, //the function to call
   						onUpdate       :    filterDates2
   					});
   				}
   			}

   			function filterDates2(cal) {
   				var date = cal.date;
   				endDate = new Date(cal.date)
   				endDate.setHours(0,0,0,0)	// used for compares without TIME
   			}

   			/*
   			* This functions return true to disallow a date
   			* and false to allow it.
   			*/


   			/*
   			* Check-Out calendar allowed dates
   			* Check-Out date can not be BEFORE Check-In date
   			* Check-Out date can not be before today
   			*/
   			function disallowDateBefore(dateCheckOut) {
   				dateCheckOut.setHours(0,0,0,0)
   				if ((startDate != null) && startDate > dateCheckOut)
   					// startDate is defined, make sure cal date is NOT before start date
   					return true;

   				var now = new Date()
   				now.setHours(0,0,0,0)
   				//if (dateCheckOut < now)
//   					// check out date can not be befor today if startDate NOT defined
//   					return true;

   				return false;
   			}

   			/*
   			* Check-In date checking
   			* Check-In date can not be AFTER Check-Out date
   			* Check-In date can not be before today
   			*/
   			function disallowDateAfter(dateCheckIn) {
   				dateCheckIn.setHours(0,0,0,0)
   				if ((endDate != null) && dateCheckIn > endDate)
   					// endDate defined, calendar date can NOT be after endDate
   					return true;

   				var now = new Date()
   				now.setHours(0,0,0,0)

   				//if (dateCheckIn < now)
//   					// endDate NOT defined, calendar date can not be before today
//   					return true;

   				return false;
   			}

   			// end hiding contents from old browsers  -->
   		</script>
<script type="text/javascript">
   			var disallowDateAfter
   			var disallowDateBefore
   			var filterDates1
   			var filterDates2
   			var cal = new Zapatec.Calendar.setup({

   	         inputField     :    "checkIn_date",   // id of the input field
   	         button         :    "button8a",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         dateStatusFunc    :    disallowDateAfter, //the function to call
   	         onUpdate       :    filterDates1

   			});

   	      Zapatec.Calendar.setup({
   	         inputField     :    "checkOut_date",
   	         button         :    "button8b",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         dateStatusFunc    :    disallowDateBefore, //the function to call
   	         onUpdate       :    filterDates2
   	      });

   		</script>
</form>
</body>
</html>
<!--#include virtual="/includes/connectionCloseGlobal.asp"-->
<%

 Rs.Close
 Rs1.Close
 Rs2.Close
 Rs3.Close
 Conn.Close
 End If
 %>
