<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'======================================================='
 'Written By : Bharath'
 'Last UpaDated: '
 'Description :'
 'Purpose : Add/Edit/Delete of Participants'
'======================================================='
%>
<!-- #include file="../../connection.asp"-->
<!-- #include file="imageUpload.asp"-->
 <%
 Response.Buffer = true

 If Session("UserId") = "" Then 
   Response.Redirect("../login.asp")
 Else
 ' ****************************************************
' Change the value of the variable below to the pathname
' of a directory with write permissions, for example "C:\Inetpub\wwwroot"
  Dim uploadsDirVar

uploadsDirVar = "d:\Webspace\pugmarks\pmstudy\pmstudy.com\www\india\classRoomImages"
' ****************************************************

	Dim action,Sql
	action = request.QueryString("action")
	Set Rs = Server.CreateObject("ADODB.Recordset")
	Set Rs1 = Server.CreateObject("ADODB.Recordset")	
	
	If action = "view" Then 
	
	Sql = "SELECT  image1,image2,city,startsession,endsession,description1,description2,id  FROM ITIL_images where  country = '"& Session("country") &"' order by city,startsession desc"
	
	Rs.open Sql,conn
	
	If Not Rs.EOF Then
       arrAllRecords = Rs.getrows
       Session("arrAllRecords") = arrAllRecords
       numRows = Ubound(arrAllRecords,2)
       firstRow = 0
	   lastRow = numRows
   	End If
	
	End If
	
	If action = "edit" Then
		
		id =  Request.QueryString("id")
	    Session("image1") = Request.QueryString("image1")
	    Session("image2") = Request.QueryString("image2")		
		
		  sql = "SELECT id,city,startsession,endsession,description1,description2 FROM ITIL_images WHERE id = '" & id & "'"
		  
		  Rs.Open sql,Conn
		  
		  sql1 = "SELECT city FROM ITIL_city order by city"
		  
		  Rs1.Open sql1,Conn
 
	End If
	 
 	'****************************** Delete Image*************
	
	If action = "delete" Then
		
		Set Rs1 = Server.CreateObject("ADODB.Recordset")
		Dim image,time,Sql1,Rs1
		rqID = request.QueryString("id")
		
		Sql1 = "delete from ITIL_images where id = '"& rqID &"'"

		RS1.open Sql1,conn
		
		response.Redirect("imageManagement.asp?action=view")
		
	End If
	
	'********************************************************
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Participants</title>
<link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
<link href="../../css/pmstyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="calendar/zapatec.js"></script>
<script type="text/javascript" src="calendar/calendar.js"></script>
<script type="text/javascript" src="calendar/calendar-en.js"></script>
<link href="calendar/template.css" rel="stylesheet" type="text/css">
<link href="calendar/system.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
<!-- Begin
function popUp(URL) {
day = new Date();
id = day.getTime();
eval("page" + id + " = window.open(URL, '" + id + "', 'toolbars=0,left=1,top=1,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=1,width=600,height=500');");
}
// End -->
</script>
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

function validate_form(theform)
{
 //check to see if the City field is balnk

  if (theform.city.value == "")
  {
     alert("Please Select the City.");
     theform.city.focus();
     return (false);
  }

  //Check To See If The Startdate And Enddate Is Same

  if(theform.startsession.value == theform.endsession.value)
  {
    alert("Start Date and End Date Should Not Be Equal")
    return(false);
  }

  if (theform.imageDescription1.value == "")
  {
     alert("Please Enter the Description.");
     theform.imageDescription1.focus();
     return (false);
  }	

}
</script>
</head>

<body><div id="htMap">
<table border="1" height="550" cellspacing="0" class="dbborder" width="1000px">
 <tr>
   <td colspan="3" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% = Session("country") %></span> PMstudy Back Office</font></div></td>
 </tr>
 <tr>
  <td width="100px" valign="top" rowspan="22">
    <!--#include file="leftMenu.html"-->
  </td>
 </tr>
 <tr>
 	<td align="center"  style="margin-top:20cm">
		
		<% if action = "view" then %>
		
		<table width="800px" height="163" border="0" align="center" cellpadding="5" cellspacing="0">
		
		 <tr class="h3">
		 	<td colspan="2" align="center" >Previous Class Room Sessions<div><hr /></div></td>
		</tr>
		<%
		  If IsArray(arrAllRecords) Then
            For rowcounter = firstRow to lastRow %>
 		<tr>
			<td colspan="2" class="citydiv" align="left"><% = arrAllRecords(2,rowcounter) %><div><hr /></div></td>
	    </tr>
		<tr>
			<td colspan="2" align="left"><label class="titlediv">Session : </label><label class="text"><% = FormatDateTime(arrAllRecords(3,rowcounter),1) %> to <% = FormatDateTime(arrAllRecords(4,rowcounter),1) %></label></td>
	    </tr>
		<tr>
			<td colspan="2" align="left">		
			    <a href="javascript:popUp('../../participants.asp?id=<% = arrAllRecords(7,rowCounter) %>')"><span class="paticipantsdiv">Participants of this Session</span></a>
		   </td>
		</tr>
		<tr>		
			<td width="200px"><a href ="../../classRoomImages/<%=arrAllRecords(0,rowCounter)%>" target="_blank"  ><img width="250px" src="../../classRoomImages/<% = arrAllRecords(0,rowCounter) %>" border="0"/> </a><br /><br />
			<% If Session("typeofuser") = "Admin" OR Session("typeofuser") = "SeniorCSR" Then %>
				
				<a href="./imageManagement.asp?action=edit&image1=<% = arrAllRecords(0,rowcounter) %>&id=<%=arrAllRecords(7,rowCounter)%>">Edit Image</a>

			<% end if %></td>
			<td width="200px"><a href ="../../classRoomImages/<%=arrAllRecords(1,rowCounter)%>" target="_blank"  ><img width="250px" src="../../classRoomImages/<% = arrAllRecords(1,rowCounter) %>" border="0"/> </a><br /><br />
			<% If Session("typeofuser") = "Admin" OR Session("typeofuser") = "SeniorCSR" Then %>
				
				<a href="./imageManagement.asp?action=edit&image2=<% = arrAllRecords(1,rowCounter) %>&id=<%=arrAllRecords(7,rowCounter)%>">Edit Image</a>
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!--<a href="imageManagement.asp?action=delete&image2=<%=arrAllRecords(1,rowCounter)%>&id=<%=arrAllRecords(7,rowCounter)%>">Delete Image</a>-->
            </td>
	    </tr>
		<tr>
		 <td align="left" colspan="2"><a href="imageManagement.asp?action=delete&id=<%=arrAllRecords(7,rowCounter)%>" >Delete Session</a></td>				<% end if %>
		</tr>
		<tr>
		    <td align="left"><label class="descdiv">Description : </label><label class="text"><% = arrAllRecords(5,rowCounter) %></label></td>
   		    <td align="left"><label class="descdiv">Description : </label><label class="text"><% = arrAllRecords(6,rowCounter) %></label></td>		
		</tr>
		<tr><td colspan="2"><hr /></td></tr>
		<% Next
          End If %>	
     </table>		  
	<% end if %>
	 </td>
	</tr>
	<tr>
	 <td><% = OutputForm() %> </td>
    </tr>	
    <tr>
     <td colspan="2" align="left"><% Response.Write(SaveFiles) %></td>
	</tr>			
  </table>
 </div>
 <% function OutputForm() %>	
	<% if action = "edit" then 
    	  do until Rs.EOF%>
			<table width="600px" height="163" border="0" align="center" cellpadding="5" cellspacing="2" bgcolor="#e7f2f7">
				<tr>
					<td colspan="2">Edit Image</td>
				</tr>
				<form action="imageManagement.asp?action=editDesc" name="frmSend" method="POST" enctype="multipart/form-data" onSubmit="return validate_form(this)">
				<tr bgcolor="#ffffff">	
				<% If Session("image1") <> "" Then %>
					<td width="150px">Image : </td><td><input type="file" name="image1" />&nbsp;&nbsp;&nbsp;<% = Request.QueryString("image1") %><input type="hidden" name="id" value="<% =Rs("id")  %>" /></td>
				<% Else %>
					<td width="150px">Image : </td><td><input type="file" name="image2" />&nbsp;&nbsp;&nbsp;<% = Request.QueryString("image2") %><input type="hidden" name="id" value="<% =Rs("id")  %>" /></td>
 				<% End If %>
				</tr>					
				<tr bgcolor="#ffffff">
					<td>Country : </td><td>&nbsp;&nbsp;&nbsp;<% = session("country") %></td>
				</tr>
				<tr bgcolor="#ffffff">
					<td>City : </td>
					<td>&nbsp;&nbsp;
					  <select name="city">
					    <option value="">--Select--</option>
						<% Do Until Rs1.EOF %>
						  <option <% If Rs1("city") = Rs("city") Then %> selected="selected" <% End If %>><% = Rs1("city") %></option>
						<% Rs1.Movenext
						   Loop %>
					  </select>      
					</td>
				</tr>
				<tr bgcolor="#ffffff">
					<td>Start Session : </td>
					<td>
				      <input autocomplete="off" name="startsession" value="<% = Rs("startsession") %>" readonly id="checkIn_date" type="text">
               	      <input value=" ... " id="button8a" class="buttonc" type="reset">					
				    </td>
				</tr>
				<tr bgcolor="#ffffff">
					<td>End Session : </td>
					<td>
 				      <input autocomplete="off" name="endsession" value="<% = Rs("endsession")%>" readonly id="checkOut_date" type="text">
               	      <input value=" ... " id="button8b" class="buttonc" type="reset">					 
					</td>
				</tr>				
				<tr bgcolor="#ffffff">
				<% If session("image1") <> "" Then %>
					<td>Description : </td><td>&nbsp;&nbsp;&nbsp;<textarea name="imageDescription1" rows="5" cols="40"> <% = Rs("description1") %> </textarea></td>
				<% Else %>
					<td>Description : </td><td>&nbsp;&nbsp;&nbsp;<textarea name="imageDescription2" rows="5" cols="40"> <% = Rs("description2") %> </textarea></td>
				<% End If %>
				</tr>
				<tr bgcolor="#ffffff">
					<td colspan="2">
						<table border="0" width="100%">
							<tr>
								<td align="right"><input type="submit" value="Submit" class="buttonc" /></td></form>
								
					<form name="Cancel" action="imageManagement.asp?action=view" method="post">
					<td><input type="submit" value="Cancel" class="buttonc" /></td>
					</form>
				</tr>
			</table>
<script type="text/javascript">
   			<!--  to hide script contents from old browsers
   			var startSession;
   			var endSession;

   			function resetDates() {
   				startSession = endSession = null;
   			}

   			function filterDates1(cal) {
   				startSession = new Date(cal.date)
   				startSession.setHours(0,0,0,0)	// used for compares without TIME
   				/* If they haven't chosen an
   				end date before we'll set it to the same date as the start date This
   				way if the user scrolls in the start date 5 months forward, they don't
   				need to do it again for the end date.
   				*/

   				if (endSession == null) {
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
   				endSession = new Date(cal.date)
   				endSession.setHours(0,0,0,0)	// used for compares without TIME
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
   				var dateOfCheckIn = dateCheckOut.setHours(0,0,0,0)
   				if ((startSession != null) && startSession > dateCheckOut)
   					// startSession is defined, make sure cal date is NOT before start date
   					return true;

   				var now = new Date()
   				now.setHours(0,0,0,0)
   				if (dateCheckOut < dateOfCheckIn)
   					// check out date can not be befor today if startSession NOT defined
   					return true;

   				return false;
   			}

   			/*
   			* Check-In date checking
   			* Check-In date can not be AFTER Check-Out date
   			* Check-In date can not be before today
   			*/
   			function disallowDateAfter(dateCheckIn) {
   				dateCheckIn.setHours(0,0,0,0)
   				if ((endSession != null) && dateCheckIn > endSession)
   					// endSession defined, calendar date can NOT be after endSession
   					return true;

   				var now = new Date()
   				now.setHours(0,0,0,0)

   				if (dateCheckIn < now)
   					// endSession NOT defined, calendar date can not be before today
   					return true;

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
   	         //dateStatusFunc    :    disallowDateAfter, //the function to call
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
			
		<%  Rs.moveNext
			loop
			end if 
end function 
 
function TestEnvironment()

    Dim fso, fileName, testFile, streamTest
    TestEnvironment = ""
    Set fso = Server.CreateObject("Scripting.FileSystemObject")
 	
	if not fso.FolderExists(uploadsDirVar) then
        TestEnvironment = "<B>Folder " & uploadsDirVar & " does not exist.</B><br>The value of your uploadsDirVar is incorrect. Open uploadTester.asp in an editor and change the value of uploadsDirVar to the pathname of a directory with write permissions."
        exit function
    end if
    fileName = uploadsDirVar & "\test.txt" 
	 
    on error resume next
    Set testFile = fso.CreateTextFile(fileName, true)

    If Err.Number<>0 then
        TestEnvironment = "<B>Folder " & uploadsDirVar & " does not have write permissions.</B><br>The value of your uploadsDirVar is incorrect. Open uploadTester.asp in an editor and change the value of uploadsDirVar to the pathname of a directory with write permissions."
        exit function
    end if
    Err.Clear
    testFile.Close
    fso.DeleteFile(fileName)
    If Err.Number<>0 then
        TestEnvironment = "<B>Folder " & uploadsDirVar & " does not have delete permissions</B>, although it does have write permissions.<br>Change the permissions for IUSR_<I>computername</I> on this folder."
        exit function
    end if
    Err.Clear
    Set streamTest = Server.CreateObject("ADODB.Stream")
    If Err.Number<>0 then
        TestEnvironment = "<B>The ADODB object <I>Stream</I> is not available in your server.</B><br>Check the Requirements page for information about upgrading your ADODB libraries."
        exit function
    end if
    Set streamTest = Nothing

end function

function SaveFiles
    
	Dim Upload, fileName, fileSize, ks, i, fileKey,image,UploadedFiles

    Set Upload = New FreeASPUpload
    Upload.Save(uploadsDirVar)

	' If something fails inside the script, but the exception is handled
	If Err.Number<>0 then Exit function

    SaveFiles = ""
  
    ks = Upload.UploadedFiles.keys

	 if (UBound(ks) <> -1) then
        SaveFiles = "<B>File uploaded:</B> "
		for each fileKey in Upload.UploadedFiles.keys 
	        SaveFiles = SaveFiles & Upload.UploadedFiles(fileKey).FileName  & "&nbsp;&nbsp;"
        next
     else
        'SaveFiles = "The file name specified in the upload form does not correspond to a valid file in the system."
     end if
	
	Session("id") = Upload.Form("id")
	Session("city") = Upload.Form("city")
	Session("startsession") = Upload.Form("startsession")
	Session("endsession") = Upload.Form("endsession")	
	Session("description1") = Upload.Form("imageDescription1")
	Session("description2") = Upload.Form("imageDescription2")	
	
	Set Rs2 = Server.CreateObject("ADODB.Recordset")
    Dim Sql2,Rs2
	
    If Session("startsession") <> "" then
     
   		Sql2 = "UPDATE ps_images SET "
		Sql2 = Sql2 & "country = '" & Session("country") & "',"
		Sql2 = Sql2 & "city = '" & Session("city") & "',"
		Sql2 = Sql2 & "startsession = '" & Session("startsession") & "',"
		Sql2 = Sql2 & "endsession = '" & Session("endsession") & "',"
		If Session("image1") <> "" Then 
		If (UBound(Upload.UploadedFiles.keys) <> -1) then
		for each fileKey in Upload.UploadedFiles.keys 
		Sql2 = Sql2 & " image1 = '" & Upload.UploadedFiles(fileKey).FileName & "',"
		next
		End If	
		Else
		If (UBound(Upload.UploadedFiles.keys) <> -1) then
		for each fileKey in Upload.UploadedFiles.keys 
		Sql2 = Sql2 & " image2 = '" & Upload.UploadedFiles(fileKey).FileName & "',"
		next
		End If
		End If	
		If Session("image1") <> "" Then 		
		sql2 = Sql2 & " description1 = '" & Replace(Trim(Session("description1")),"'","''") & "'"
		Else
		sql2 = Sql2 & " description2 = '" & Replace(Trim(Session("description2")),"'","''") & "'"
		End If		
		sql2 = sql2 & " WHERE id = '"& Session("id") & "'"
		
    	Rs2.open Sql2,conn
		Session("title") = ""
		response.Redirect("imageManagement.asp?action=view")
		
	 end if
	 
 end function	

Dim diagnostics
If action = "editDesc" OR action = "edit" Then
 If Request.ServerVariables("REQUEST_METHOD") <> "POST" Then
    diagnostics = TestEnvironment()
    If diagnostics <> "" Then
        response.write diagnostics
    Else
        OutputForm()
    End If
 End If
Else
    OutputForm()
End If
End If

 Rs.Close
 Set Rs = Nothing
 Conn.Close
 Set Conn = Nothing

%>
