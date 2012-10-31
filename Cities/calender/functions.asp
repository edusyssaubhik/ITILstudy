<!--#Include File="../common/mini-adovbs.inc"-->
<!--#Include File="../common/text_formatting_inc.asp"-->
<!--#Include File="../common/date_time_inc.asp"-->
<%
' delcare instance variables
Dim connCalender

'////////////////////////////////////////////////////////////////////////////////////////
'/// Public Function open_calender_connection() returns int
'/// 
'/// purpose: Opens a database connection
'///   
'/// History:
'///    10.01.01 HEPFERM		Created the Function
'///	
'///////////////////////////////////////////////////////////////////////////////////////
Public Function open_calender_connection()
	' declare variables
	Dim ls_path
	Dim ls_username
	Dim ls_password
	Dim ls_connection
	
	' set some values
	ls_username = ""
	ls_password = ""
	open_calender_connection = -1
	ls_path = "C:\websites\calender.mdb"
	ls_connection = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & ls_path 

	' open the connection
	Set connCalender = Server.CreateObject("ADODB.Connection")
	connCalender.CommandTimeout = 30
	connCalender.ConnectionTimeout = 20
 	connCalender.Open ls_connection, ls_username, ls_password
	
	' check for errors and set return value
	open_calender_connection = connCalender
	If not connCalender.Errors.Count > 0 Then open_calender_connection = 1
End Function ' open_calender_connection


'////////////////////////////////////////////////////////////////////////////////////////
'/// Public Function close_calender_connection() returns int
'/// 
'/// purpose: Opens a database connection
'///   
'/// History:
'///    10.01.01 HEPFERM		Created the Function
'///	
'///////////////////////////////////////////////////////////////////////////////////////
Public Function close_calender_connection()
	connCalender.Close
	Set connCalender = NOTHING
End Function ' close_calender_connection


'////////////////////////////////////////////////////////////////////////////////////////
'/// Public Function GetWeekdayMonthStartsOn() returns int
'/// 
'/// purpose: Determines the day of the week that the month starts on.
'///   
'/// History:
'///    UNK  from ASP101 Calender example
'///	
'///////////////////////////////////////////////////////////////////////////////////////
Public Function GetWeekdayMonthStartsOn(dAnyDayInTheMonth)
	Dim dTemp
	dTemp = DateAdd("d", -(Day(dAnyDayInTheMonth) - 1), dAnyDayInTheMonth)
	GetWeekdayMonthStartsOn = WeekDay(dTemp)
End Function ' GetWeekdayMonthStartsOn


'////////////////////////////////////////////////////////////////////////////////////////
'/// Public Function SubtractOneMonth( dDate ) returns date
'/// 
'/// purpose: subtracts one month from the current date
'///   
'/// History:
'///    UNK  from ASP101 Calender example
'///	
'///////////////////////////////////////////////////////////////////////////////////////
Function SubtractOneMonth(dDate)
	SubtractOneMonth = DateAdd("m", -1, dDate)
End Function ' SubtractOneMonth


'////////////////////////////////////////////////////////////////////////////////////////
'/// Public Function AddOneMonth( dDate ) returns date
'/// 
'/// purpose: Adds one month from the current date
'///   
'/// History:
'///    UNK  from ASP101 Calender example
'///	
'///////////////////////////////////////////////////////////////////////////////////////
Function AddOneMonth(dDate)
	AddOneMonth = DateAdd("m", 1, dDate)
End Function ' AddOneMonth


'////////////////////////////////////////////////////////////////////////////////////////
'/// Public Function GetDaysInMonth(iMonth, iYear) returns int
'/// 
'/// purpose: Determines the number of days in a month.
'///		  New and improved GetDaysInMonth implementation.
'///		  Thanks to Florent Renucci for pointing out that I
'///	      could easily use the same method I used for the
'///		  revised GetWeekdayMonthStartsOn function.
'///
'/// History:
'///    UNK  from ASP101 Calender example
'///	
'///////////////////////////////////////////////////////////////////////////////////////
Public Function GetDaysInMonth(iMonth, iYear)
	Dim dTemp
	dTemp = DateAdd("d", -1, DateSerial(iYear, iMonth + 1, 1))
	GetDaysInMonth = Day(dTemp)
End Function ' GetDaysInMonth


'////////////////////////////////////////////////////////////////////////////////////////
'/// Public Function GetSelectedDate() returns int
'/// 
'/// purpose: Determines the day of the week that the month starts on.
'///   		  Get selected date.  There are two ways to do this.
'///          First check if we were passed a full date in RQS("date").
'///          If so use it, if not look for seperate variables, putting them
'///          togeter into a date.
'///          Lastly check if the date is valid...if not use today
'///           
'/// History:
'///    UNK  from ASP101 Calender example
'///	
'///////////////////////////////////////////////////////////////////////////////////////
Public Function GetSelectedDate()
	If IsDate(Request.QueryString("date")) Then
		GetSelectedDate = CDate(Request.QueryString("date"))
	Else
		If IsDate(Request.QueryString("month") & "-" & Request.QueryString("day") & "-" & Request.QueryString("year")) Then
			GetSelectedDate = CDate(Request.QueryString("month") & "-" & Request.QueryString("day") & "-" & Request.QueryString("year"))
		Else
			GetSelectedDate = Date()
			' The annoyingly bad solution for those of you running IIS3
			If Len(Request.QueryString("month")) <> 0 Or Len(Request.QueryString("day")) <> 0 Or Len(Request.QueryString("year")) <> 0 Or Len(Request.QueryString("date")) <> 0 Then
				Response.Write "The date you picked was not a valid date.  The calendar was set to today's date.<BR><BR>"
			End If
			' The elegant solution for those of you running IIS4
			'If Request.QueryString.Count <> 0 Then Response.Write "The date you picked was not a valid date.  The calendar was set to today's date.<BR><BR>"
		End If
	End If
End Function ' GetSelectedDate


'////////////////////////////////////////////////////////////////////////////////////////
'/// Public Function WriteEventLabelsForRecordset( objRSTemp ) returns Boolean
'/// 
'/// purpose: Writes out event labels for the filtered recordset.  Returns True if
'///          event labels were found for that day.  Has the following business rules:
'///              1) Don't display time if the start date and end date arn't the same
'///              2) if the start time and end time are the same show only one.
'///              3) if the start time and end time are the same and the time is 1AM
'///                 Then don't display a time.
'///   
'/// History:
'///    01.11.2002	HEPFERM	 Created the Function.
'///	
'///////////////////////////////////////////////////////////////////////////////////////
Public Function WriteEventLabelsForRecordset( objRSTemp )
	' declare variables
	const li_cellWidth = 23   'the number of characters to wrap the text at
				
	' loop thru the recordset
	do until objRSTemp.eof
		With Response
			.Write "<font size=1><a href='view_event.asp?event_id=" & objRSTemp("event_id") & "'>" 
			.Write WordWrap( objRSTemp("name"), li_cellWidth) & "</a>"
			' business rule: if start the date is not the same as the end date
			' then don't display time
			If objRSTemp("start_dt") = objRSTemp("end_dt") Then 
				' business rule: if start time is same as end time, then don't
				' don't display time
				If objRSTemp("start_time") <> objRSTemp("end_time") Then
					.Write "<br>" & TimeWithoutSeconds( objRSTemp("start_time") )
					.Write  " - "
					.Write TimeWithoutSeconds( objRSTemp("end_time") )
				Else
					' business rule: if start date and end date are the same and the
					' the times are not 1:00:00 AM then write one of the times only.
					If Not objRSTemp("start_time") = "1:00:00 AM"  Then
						.Write "<br>" & TimeWithoutSeconds( objRSTemp("end_time") )
					End If
				End if
			End if
			.Write "</font><br>"
		End With
		WriteEventLabelsForRecordset=true
		objRSTemp.movenext
	loop
End Function ' WriteEventLabelsForRecordset


'////////////////////////////////////////////////////////////////////////////////////////
'/// Public Function WriteEventsForRecordset( objRSTemp ) returns Void
'/// 
'/// purpose: write out the events for a selected date
'///   
'/// History:
'///    01.11.2002	HEPFERM	 Created the Function.
'///	
'///////////////////////////////////////////////////////////////////////////////////////
Public Function WriteEventsForRecordset( objRSTemp )
	' declare variables
	Const li_nameLineLength = 30         ' character to wrap the event name text at
	Const li_locationLineLength = 30     ' character to wrap the location text at
	Const li_descriptionLineLength = 65  ' character to wrap the description text at

	Do until objRSTemp.eof
		With Response
			.Write "<table>" & vbcrlf
		
			' first row, the name and location
			.Write "<tr>"
			.Write "<td class='eventLabel' valign='top'>Event Name:</td>"
			.Write "<td class='eventText'>" &_
			       wordwrap( objRSTemp( "name" ), li_nameLineLength ) &_
			       "</td>"
			.Write "<td class='eventLabel' valign ='top'>Location:</td>"
			.Write "<td class='eventText'>" &_
			        wordwrap( objRSTemp( "location" ), li_locationLineLength ) &_
			       "</td>" 
			.Write "</tr>" & vbcrlf
	    
			' second row, the start date and time
			.Write "<td class='eventLabel'>Start Date:</td>"
			.Write "<td class='eventText'>" & objRSTemp( "start_dt" ) & "</td>"
			.Write "<td class='eventLabel'>Start Time:</td>"
			.Write "<td  class='eventText'>" 
			' Business Rule: If the dates and times are the same, and the time is
			' the default time of 1AM, then don't show the time.
			If Not ( ( objRSTemp( "start_dt" ) = objRSTemp( "end_dt" ) ) and  _
			         ( objRSTemp( "start_time" ) = objRSTemp( "end_time" ) ) and _
			         ( objRSTemp( "start_time" ) = "1:00:00 AM" ) ) Then
				.Write TimeWithoutSeconds ( objRSTemp( "start_time" ) )
			End If
			.Write "</td>"     
			.Write "</tr>" & vbcrlf
		
			' third row, the end date and time
			.Write "<tr>"
			.Write "<td class='eventLabel'>End Date:</td>"
			.Write "<td class='eventText'>" & objRSTemp( "end_dt" ) & "</td>"
			.Write "<td class='eventLabel'>End Time:</td>"
			.Write "<td  class='eventText'>"
			' Business Rule: If the dates and times are the same, and the time is
			' the default time of 1AM, then don't show the time.
			If Not ( ( objRSTemp( "start_dt" ) = objRSTemp( "end_dt" ) ) and  _
			         ( objRSTemp( "start_time" ) = objRSTemp( "end_time" ) ) and _
			         ( objRSTemp( "start_time" ) = "1:00:00 AM" ) ) Then
				.Write TimeWithoutSeconds( objRSTemp( "end_time" ) )
			End If
			.Write "</td>"
			.Write "</tr>" & vbcrlf
		
			' fourth row, the description
			.Write "<tr>"
			.Write "<td class='eventLabel' valign='top'>Description:</td>"
			.Write "<td class='eventText' colspan='3'>" &_
			       wordwrap( objRSTemp( "description" ), li_descriptionLineLength ) &_
			       "</td>"
			.Write "</tr>" & vbcrlf
		
			.Write "</table><br>"
		End With
	    objRSTemp.movenext
	Loop	
	Set objRSTemp = Nothing
End Function ' WriteEventsForSelectedDate


'////////////////////////////////////////////////////////////////////////////////////////
'/// Public Function WriteSelectDateForm() returns int
'/// 
'/// purpose: Writes the select date form.
'///   
'/// History:
'///    01.11.2002	HEPFERM	 Created the Function.
'///	
'///////////////////////////////////////////////////////////////////////////////////////
Public Function WriteSelectDateForm()
	' Declare variables
	Dim li_month
	Dim li_day
	Dim li_year
			
	With Response
		.Write "<table BORDER='0' CELLSPACING='0' CELLPADDING='0'><tr><td ALIGN='center'>"
		.Write "<form METHOD='GET' id=form1 name=form1>"

		' write out the month
		.Write "<select NAME='month'>"
		For li_month = 1 to 12
			.write "<option value=" & li_month 
			If month(Now()) = li_month Then
				.write " selected"
			End If
			.write ">" & MonthName( li_month, True ) & "</option>" & vbcrlf	
		Next ' li_month
		.Write "</select>"

		' write out the day
		.Write "<select NAME='day'>"
		For li_day = 1 To 31
			.write "<option value=" & li_day 
			If Day(Now()) = li_day Then
				.write " selected"
			End If
			.write ">" & li_day & "</option>" & vbcrlf	
		Next ' li_day
		.Write "</select>"

		' write out the year
		.Write "<select NAME='year'>"
		For li_year = Year(Now()) To Year(Now()) + 10
			.write "<option value=" &  li_year 
			If Year(Now()) = li_year Then
				.write " selected"
			End If
			.write ">" & li_year & "</option>" & vbcrlf	
		Next ' li_year
		.Write "</select>"

		' write out show on calender part
		.Write "<input TYPE='submit' VALUE='Show on the Calendar' id='submit'1 name='submit'1>"
		.Write "</form>"
		.Write "</td>"
		.Write "</tr></table>"
	End With
End Function ' WriteSelectDateForm
%>