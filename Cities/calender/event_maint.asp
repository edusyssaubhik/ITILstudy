<!--#Include File="functions.asp"-->
<%
'///////////////////////////////////////////////////////////////////
'///     FILE: calender/event_maint.asp
'///
'///  PURPOSE: handles all funcitons related to creating and
'///           editing a event record.
'///
'///  HISTORY:
'///---------------------------------------------------------------
'///  01.11.2002   HEPFERM    Created.
'///////////////////////////////////////////////////////////////////

' declare varables.
dim objRSTemp
Dim lb_validData
Dim ll_return
Dim	event_id
Dim	ls_name 
Dim	li_start_dt_month 
Dim	li_start_dt_day 
Dim	li_start_dt_year 
Dim	li_start_time_hour 
Dim	li_start_time_minute 
Dim	ls_start_time_half
Dim	li_end_dt_month 
Dim	li_end_dt_day
Dim	li_end_dt_year
Dim	li_end_time_hour
Dim	li_end_time_minute
Dim	ls_end_time_half
Dim	ls_location
Dim	ls_description
Dim ll_temp
Dim lt_time
Dim ld_start_dt
Dim ld_end_dt

' start writing the html document
With Response
	.Write "<html>"
	.Write "<head>"
	.Write "<title>Event Maint</title>"
	.Write "<LINK rel='stylesheet' type='text/css' href='default.css'>"
    .Write "</head>"
	.Write "<body>"
End With

' do the work
If ( Request.Form("ls_submit") = "Submit" ) then  ' save the form data
	if validate() then             ' validate the data.
		With Response 
			ll_return = save()     ' call the local function to save the record
			If ll_return > 0 then  ' if all went well, tell the user.
				.write "Your event was recorded successfully<P>"
				.Write "<a href='default.asp'>Return to the Calender</a>"
				.Write "</body>"
				.Write "</html>"
				.End   ' all done, bye bye.
			Else
				.Write "An error occurred while saving the record<br>"
				.Write "Please make note of the error message and contact<br>"
				.Write "the webmaster."  & "<br>Error # " & ll_return & "<br>"
				'End   ' we'll let them have another go at it.
			End If
		End With
	End If
	' If were here, then we failed validation or had db errors.
	' load the form data back into the form variables so we can try again.
	With Request
		event_id = .Form("event_id")
		ls_name = .Form("ls_name")
		li_start_dt_month = .Form("li_start_dt_month") 
		li_start_dt_day = .Form("li_start_dt_day") 
		li_start_dt_year = .Form("li_start_dt_year")
		li_start_time_hour = .Form("li_start_time_hour")
		li_start_time_minute = .Form("li_start_time_minute")
		ls_start_time_half = .Form("ls_start_time_half")
		li_end_dt_month = .Form("li_end_dt_month")
		li_end_dt_day = .Form("li_end_dt_day")
		li_end_dt_year = .Form("li_end_dt_year")
		li_end_time_hour = .Form("li_end_time_hour")
		li_end_time_minute = .Form("li_end_time_minute" )
		ls_end_time_half = .Form("ls_end_time_half")
		ls_location = .Form("ls_location")
		ls_description = .Form("ls_description")
	End With
Else  ' try to pull up the record from the UID
	event_id=request("event_id")     ' get the event id
	If event_id <> "" Then           ' pull up the event_id's record
		 
		 ' get the record from the database
		 open_calender_connection()                          ' open the database object
		 Set objRSTemp = Server.CreateObject("ADODB.Recordset") ' create the object
	     ls_sql="select * from calender_event where event_id=" & event_id
	     set objRSTemp=connCalender.execute(ls_sql)             ' execute the querry
	     
	     ' put the recordset's values into local variables
		 If not objRSTemp.EOF Then 
			' read in the strings
			ls_name = objRSTemp( "name" )
			ls_location = objRSTemp( "location" )
			ls_description = objRSTemp( "description" )
			     
			' split the start date up into an array
			ld_start_dt = objRSTemp( "start_dt" )
			li_start_dt_month = month( ld_start_dt )
			li_start_dt_day = day( ld_start_dt )
			li_start_dt_year = year( ld_start_dt )
			     
			' split the start time up into variables
			lt_time = objRSTemp( "start_time" )
			li_start_time_hour = hour( lt_time )
			If li_start_time_hour > 12 then
				li_start_time_hour = li_start_time_hour - 12
			End If
			li_start_time_minute = minute( lt_time )
			If hour( lt_time ) < 12 then 
				ls_start_time_half = "AM"
			Else
				ls_start_time_half = "PM"
			End If
			     
			' split the end date up into an array
			ld_end_dt = objRSTemp( "end_dt" )
			li_end_dt_month = month( ld_end_dt )
			li_end_dt_day = day( ld_end_dt )
			li_end_dt_year = year( ld_end_dt )
			     
			' split the end time up into variables
			lt_time = objRSTemp( "end_time" )
			li_end_time_hour = hour( lt_time )
			If li_end_time_hour > 12 then
				li_end_time_hour = li_end_time_hour - 12
			End If
			li_end_time_minute = minute( lt_time )
			If hour( lt_time ) < 12 then 
				ls_end_time_half = "AM"
			Else
				ls_end_time_half = "PM"
			End If
	    End If 
	    Set objRSTemp = nothing
	    close_calender_connection()
	End if
End If
 
' Write out the form
With Response
	' start writing out the form
 	.Write "<form name=form1 method=post>"
 	.Write "<br>"
 	.Write "<h2>View/Edit Event</h2>"
 	.Write "<table border =0>"
 	.Write "<tr align='left'>"
	.Write "<td class='eventLabel' valign='top'>Event Name:</td>"
	.Write "<td><textarea name='ls_name' rows=3 cols=23>" & ls_name & "</textarea></td>"
	.Write "<td class='eventLabel' valign='top'>Location:</td>"
	.Write "<td><textarea name='ls_location' rows=3 cols=30>" & ls_location & "</textarea></td>"
	'.Write "<td</td>"
	.Write "</tr>"
	.Write "<tr align='left'>"
			
	'.Write "<td><input type='text' name='ls_name' value='" & ls_name & "'></td>"
	.Write "<td class='eventLabel'>Start Date:</td>"
	.Write "<td valign='top'><nobr>"
					
 	' write out the month
 	.Write "<select NAME='li_start_dt_month'>"
 	For ll_temp = 1 to 12
 		.write "<option value=" & ll_temp 
 		If clng( li_start_dt_month ) = ll_temp Then
 			.write " selected"
 		End If
 		.write ">" & MonthName( ll_temp, True ) & "</option>" & vbcrlf	
 	Next ' ll_temp
 	.Write "</select>"

 	' write out the day
 	.Write "<select NAME='li_start_dt_day'>"
 	For ll_temp = 1 To 31
 		.write "<option value=" & ll_temp 
 		If clng( li_start_dt_day ) = ll_temp Then
 			.write " selected"
 		End If
 		.write ">" & ll_temp & "</option>" & vbcrlf	
 	Next ' ll_temp
 	.Write "</select>"

 	' write out the year
 	.Write "<select NAME='li_start_dt_year'>"
 	For ll_temp = Year(Now()) To Year(Now()) + 10
 		.write "<option value=" &  ll_temp 
 		If clng( li_start_dt_year ) = ll_temp Then
 			.write " selected"
 		End If
 		.write ">" & ll_temp & "</option>" & vbcrlf	
 	Next ' ll_temp
 	.Write "</select>"
 	.Write "</nobr></td>"
					
 	' write out the start time cells
 	.Write "<td class='eventLabel'>Start Time:</td>"
 	.Write "<td valign='top' colspan = 2><nobr>"

 	' write the start hour
 	.Write "<select NAME='li_start_time_hour'>"
 	For ll_temp = 1 to 12
 		.write "<option value=" & ll_temp 
 		If clng( li_start_time_hour ) = ll_temp Then
 			.write " selected"
 		End If
 		.write ">" & ll_temp & "</option>" & vbcrlf	
 	Next ' ll_temp
 	.Write "</select>:"
					
 	' write the start minute
 	.Write "<select NAME='li_start_time_minute'>"
 	For ll_temp = 0 to 59
 		.write "<option value=" & ll_temp 
 		If clng( li_start_time_minute ) = ll_temp Then
 			.write " selected"
 		End If
 		.write ">"
 		if ll_temp < 10 then 
			.Write "0"
		End If
 		.Write ll_temp & "</option>" & vbcrlf	
 	Next ' ll_temp
 	.Write "</select>"

	' write out the AM/PM select box
	.Write "<select name='ls_start_time_half'>"
	.Write "<option VALUE='AM'" 
	If ls_start_time_half = "AM" then
		.Write " selected"
	End If
	.Write ">AM</option>"
    .Write "<option VALUE='PM'"
	If ls_start_time_half = "PM" then
		.Write " selected"
	End If
	.Write ">PM</option>"
	.Write "</select>"
	.Write "</nobr></td>"    
	.Write "</tr>"

	' write out the location
	.Write "<tr>"

	.Write "<td class='eventLabel'>End Date:</td>"
	.Write "<td valign=top><nobr>"

	' write out the month
	.Write "<select NAME='li_end_dt_month'>"
	For ll_temp = 1 to 12
		.write "<option value=" & ll_temp 
		If clng( li_end_dt_month ) = ll_temp Then
			.write " selected"
		End If
		.write ">" & MonthName( ll_temp, True ) & "</option>" & vbcrlf	
	Next ' ll_temp
	.Write "</select>"

	' write out the day
	.Write "<select NAME='li_end_dt_day'>"
	For ll_temp = 1 To 31
		.write "<option value=" & ll_temp
		If clng( li_end_dt_day ) = ll_temp Then
			.write " selected"
		End If
		.write ">" & ll_temp & "</option>" & vbcrlf	
	Next ' ll_temp
	.Write "</select>"

	' write out the year
	.Write "<select NAME='li_end_dt_year'>"
	For ll_temp = Year(Now()) To Year(Now()) + 10
		.write "<option value=" &  ll_temp 
		If clng( li_end_dt_year ) = ll_temp Then
			.write " selected"
		End If
		.write ">" & ll_temp & "</option>" & vbcrlf	
	Next ' ll_temp
	.Write "</select>"
	.Write "</nobr></td>"
					
	' write out the end time cells
	.Write "<td class='eventLabel'>End Time:</td>"
	.Write "<td valign=top colspan = 2><nobr>"
		   
	' write the end hour
	.Write "<select NAME='li_end_time_hour'>"
	For ll_temp = 1 to 12
		.write "<option value=" & ll_temp 
		If clng( li_end_time_hour ) = ll_temp Then
			.write " selected"
		End If
		.write ">" & ll_temp & "</option>" & vbcrlf	
	Next ' ll_temp
	.Write "</select>:"
					
	' write the end minute
	.Write "<select NAME='li_end_time_minute'>"
	For ll_temp = 0 to 59
		.write "<option value=" & ll_temp 
		If clng( li_end_time_minute ) = ll_temp Then
			.write " selected"
		End If
		.write ">" 
		if ll_temp < 10 then 
			.Write "0"
		End If
		.Write ll_temp & "</option>" & vbcrlf	
	Next ' ll_temp
	.Write "</select>"	

	' write out the AM/PM select box
	.Write "<select name='ls_end_time_half'>"
	.Write "<option VALUE='AM'" 
	If ls_end_time_half = "AM" then
		.Write " selected"
	End If
	.Write ">AM</option>"
    .Write "<option VALUE='PM'"
	If ls_end_time_half = "PM" then
		.Write " selected"
	End If
	.Write ">PM</option>"
	.Write "</select>"
	.Write "</nobr></td>"    
	.Write "</tr>"
			
	'write out the description
    .Write "<tr>"
    .Write "<td class='eventLabel' valign='top'>Description:</td>"
	.Write "<td colspan='3'><textarea name='ls_description' rows=5 cols=72>" & ls_description 
	.Write "</textarea></td>"
	.Write "</tr>"
	.Write "<tr>"
    .Write "<td></td>"
		    
    ' Write out the submit button and close
    .Write "<input type=hidden name='event_id' value='" & event_id & "'>"
	.Write "<td colspan=3 align='right'><input type='submit' name='ls_submit' value='Submit'></td>"
	.Write "</tr>"
	.Write "</table>"
	.Write "<br><br>"
	.Write "</form>"
	.Write "</body>"
	.Write "</html>"
End With

'----------------------------------------------------------------------------------------------
'    L O C A L    F U N C T I O N S
'----------------------------------------------------------------------------------------------
'////////////////////////////////////////////////////////////////////////////////////////
'/// Private function save()  returns the event_id or a negative error number
'///
'/// Purpose: Save the record
'///
'/// History:
'///	01.12.01 HEPFERM	Created
'///////////////////////////////////////////////////////////////////////////////////////
Private Function save()
	' declare some variables
	Dim objRSTemp
	Dim ls_sql
	Dim event_id
     
	' get the existing record, or get a new record.
	event_id = Request("event_id")
	If event_id = "" Then event_id = 0
	ls_sql = "SELECT * FROM calender_event WHERE event_id=" & event_Id & ";"
	open_calender_connection()	
	Set objRSTemp = Server.CreateObject("ADODB.RecordSet")
	with objRSTemp
		.Open ls_sql, connCalender, adOpenDynamic, adLockPessimistic				
		If .EOF Then .AddNew  ' if there wasn't a record, add a new one
		
		' set values for the fields in the record
		.Fields("name") = Request.Form("ls_name")
		.Fields("start_dt") = Request.Form("li_start_dt_month") & "/" &_
		                      Request.Form("li_start_dt_day") & "/" & _
		                      Request.Form("li_start_dt_year")
		.Fields("start_time") = Request.Form("li_start_time_hour") & ":" & _
								Request.Form("li_start_time_minute") & " " &_
								Request.Form("ls_start_time_half")
		.Fields("end_dt") = Request.Form("li_end_dt_month") & "/" &_
							Request.Form("li_end_dt_day") & "/" &_
							Request.Form("li_end_dt_year")
		.Fields("end_time") = Request.Form("li_end_time_hour") & ":" &_
							  Request.Form("li_end_time_minute") & " " &_
							  Request.Form("ls_end_time_half")
		.Fields("location") = Request.Form("ls_location")
		.Fields("description") = Request.Form("ls_description")
		.Update
		
		' get the message ID
		event_id = .Fields(0).value
		.Requery 	
		If Not .EOF Then  
			.MoveFirst
			event_id = .Fields("event_id")
		End If
		.close
	End With
	
	' close and dispose of resources
	close_calender_connection()
	Set objRSTemp = Nothing
	
	' return
	If  err.number > 0 Then
		save = err.number  ' a negative number
	Else
		save = event_id
	End If
End Function ' save


'////////////////////////////////////////////////////////////////////////////////////////
'/// Private function validate()  returns Boolean
'///
'/// Purpose: Server side validation of the data. Needed because I didn't put any client
'///          side validation in at all, and we at least want to make sure the event 
'///          has a name.
'/// History:
'///	01.12.01 HEPFERM	Created
'///////////////////////////////////////////////////////////////////////////////////////
Private Function validate()
	Validate = TRUE
	if Request.Form("ls_name") = "" Then
		.write "The Name cannot be blank"
		Validate = FALSE
	End If
End Function
%>