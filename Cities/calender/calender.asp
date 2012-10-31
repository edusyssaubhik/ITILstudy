<!--#Include File="functions.asp"-->
<!--#Include File="../common/date_time_inc.asp"-->
<%
'***************************************************************************
'*     ASP 101 Sample Code - http://www.asp101.com                         *
'*                                                                         *
'*   This code is made available as a service to our                       *
'*      visitors and is provided strictly for the                          *
'*               purpose of illustration.                                  *
'*                                                                         *
'* Please direct all inquiries to webmaster@asp101.com                     *
'*                                                                         *
'* HISTORY                                                                 *
'* ------------------------------------------------------------------------*
'*  Unk         David McIntosh     Updated and Streamlined. Contact me at  *
'*                                 dmcintosh@carolina.rr.com               *
'*                                                                         *
'*  01.14.2002  Michael S. Hepfer  Added Database and CSS interaction.     *
'*                                 michael_steven1@hotmail.com             *
'*                                                                         *
'***************************************************************************

Dim dDate			' Date we're displaying calendar for
Dim iDIM			' Days In Month
Dim iDOW			' Day Of Week that month starts on or the Day of Week were on.
Dim iCurrent		' Variable we use to hold current day of month as we write table
Dim ld_loopDate     ' holds the loop position date as we loop thru the calender
Dim lb_eventsFound  ' boolean true events were found for the loop date
DIM rstemp			' the recordset


'get the events for this month and keep them in the recordset
open_calender_connection()
Set rstemp = Server.CreateObject( "ADODB.Recordset" )
set rstemp=connCalender.execute( "select * from calender_event" )


' Call function to get the selected date
dDate = GetSelectedDate()

' write out the calender
With Response
	' first (Outer) Table is simply to get the pretty border
	.Write "<table BORDER='8' CELLSPACING='0' CELLPADDING='0'>"
	.Write "<tr>"
	.Write "<td>"
	.Write "<table BORDER='1' CELLSPACING='0' CELLPADDING='1' bgcolor='#ffffff'>"
	.Write "<tr>"
	.Write "<td ALIGN='center' COLSPAN='7' class='month'>"
	.Write "<table WIDTH='100%' BORDER='0' CELLSPACING='0' CELLPADDING='0'>"
	.Write "<tr>"
	.Write "<td class='month' ALIGN='right'><a HREF='default.asp?date=" &  SubtractOneMonth(dDate) & "'>&lt;&lt;</a></td>"
	.Write "<td class='month' ALIGN='center'>" & MonthName(Month(dDate)) & "  " & Year(dDate) & "</td>"
	.Write "<td class='month' ALIGN='left'><a HREF='default.asp?date=" &  AddOneMonth(dDate) & "'>&gt;&gt;</a></td>"
	.Write "</tr>"
	.Write "</table>"
	.Write "</td>"
	.Write "</tr>" 
	.Write "<tr>"
	.Write "<td WIDTH='80' ALIGN='center' class='weekday'>Sun<br></td>"
	.Write "<td WIDTH='80' ALIGN='center' class='weekday'>Mon<br></td>"
	.Write "<td WIDTH='80' ALIGN='center' class='weekday'>Tue<br></td>"
	.Write "<td WIDTH='80' ALIGN='center' class='weekday'>Wed<br></td>"
	.Write "<td WIDTH='80' ALIGN='center' class='weekday'>Thu<br></td>"
	.Write "<td WIDTH='80' ALIGN='center' class='weekday'>Fri<br></td>"
	.Write "<td WIDTH='80' ALIGN='center' class='weekday'>Sat<br></td>"
	.Write "</tr>"

	'Get day of the week the month starts on.
	iDOW = GetWeekdayMonthStartsOn(dDate)

	' Write spacer cells at beginning of first row if month doesn't start on a Sunday.
	.Write vbTab & "<TR>" & vbCrLf
	For iCurrent = 1 to iDOW - 1
		.Write vbTab & vbTab & "<TD class='notaDay'>&nbsp;</TD>" & vbCrLf
	Next

	' Write days of month in proper day slots
	For iCurrent = 1 to GetDaysInMonth(Month(dDate), Year(dDate))
		' set the current date, were going to use it twice later on
		ld_loopDate = cdate( Month(dDate) & "/" & iCurrent & "/" & Year(dDate) )
		
		' If we're at the begginning of a row then write TR
		If iDOW = 1 Then
			.Write vbTab & "<TR>" & vbCrLf
		End If

		' If the day we're writing is the selected day then highlight it somehow.
		If iCurrent = Day(dDate) Then
			.Write vbTab & vbTab & "<TD class='selectedDay' valign=top><FONT SIZE=""-1""><B>"
			.Write iCurrent & "</B></FONT><BR>"
		Else
			.Write vbTab & vbTab & "<TD class='day' valign=top>"
			.Write "<A HREF=""default.asp?date=" & replace( cstr( ld_loopDate ), "/", "-" ) & """>"
			.Write "<FONT SIZE=""-1"">" & iCurrent & "</FONT></A><br>" & vbCrLf
		End If
		
		' write out events for the current day filtering the recordset and calling a function
		rstemp.Filter = "start_dt <= " & ld_loopDate & " and end_dt >= " & ld_loopDate ' filter the recordset 
		lb_eventsFound = WriteEventLabelsForRecordset( rstemp )
		rstemp.Filter = 0
		If not lb_eventsFound then ' give the cell some height
			.Write "<br><br>"
		End If
		lb_eventsFound = false ' reset the flag
		
		' close up the current day
		.Write "</TD>" 
		
		' If we're at the endof a row then close it up
		If iDOW = 7 Then
			.Write vbTab & "</TD>" & vbCrLf
			iDOW = 0
		End If
		
		' Increment the days of the week
		iDOW = iDOW + 1
	Next

	' Write spacer cells at end of last row if month doesn't end on a Saturday.
	If iDOW <> 1 Then
		Do While iDOW <= 7
			.Write vbTab & vbTab & "<TD class='notaDay'>&nbsp;</TD>" & vbCrLf
			iDOW = iDOW + 1
		Loop
		.Write vbTab & "</TR>" & vbCrLf
	End If

	' close up both the tables
	.Write "</table>"
	.Write "</td>"
	.Write "</tr>"
	.Write "</table>"
	.Write "<br>"

	' call function that writes the date select form, and show events for the selected date
	Call WriteSelectDateForm()
	rstemp.Filter = "start_dt <= " & dDate & " and end_dt >= " & dDate ' filter the recordset 
	Call WriteEventsForRecordset( rstemp )  'write the events for the recordset
	
	' the add new event link
	.Write "<a href='event_maint.asp'>Add a new event</a>"
End With		

' Close the calender connection	
close_calender_connection()
set rstemp = nothing
%>
