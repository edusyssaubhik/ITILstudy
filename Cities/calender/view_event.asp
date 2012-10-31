<!--#Include File="functions.asp"-->
<%
'///////////////////////////////////////////////////////////////////
'///     FILE: calender/view_event.asp
'///
'///  PURPOSE: output an html document displaying the record
'///           for the eventid passed in from the request object.
'///
'///  HISTORY:
'///---------------------------------------------------------------
'///  01.12.2002   HEPFERM    Created.
'///////////////////////////////////////////////////////////////////

' Declare some variables
Dim objRSTemp
Dim ll_eventId
Dim ls_sql

' get the article id
ll_eventId=Request("event_Id")
If ll_eventId="" Then ll_eventId=0

' get the article from the database for the event id
ls_sql = "Select * FROM calender_event WHERE event_id=" & ll_eventId 
open_calender_connection()
Set objRSTemp = Server.CreateObject("ADODB.RecordSet")
Set objRSTemp = connCalender.execute(ls_sql)

' Write out the article
With Response
    ' start writing the html document
	.Write "<HTML><HEAD>"
	.Write "<LINK rel='stylesheet' type='text/css' href='default.css'>"
	.Write "</HEAD><BODY>"

	' write out the record	
	If objRSTemp.EOF Then  ' display an error message
		.Write "invalid event id"
	Else  ' write out the record
		.Write "<h2>View Event</h2>"
		WriteEventsForRecordset( objRSTemp ) ' this function does most of the work
		' write out a hyperlink to edit the record.  Will only be one.
		objRSTemp.movefirst     
		.Write "<a href='event_maint.asp?event_id=" & objRSTemp( "event_id" ) &_
		        "'>Edit this event</a>"
	End If

	' close up the html
	.Write "</BODY></HTML>"
End With

' close and dispose of resources
call close_calender_connection()
Set objRSTemp = nothing
%>