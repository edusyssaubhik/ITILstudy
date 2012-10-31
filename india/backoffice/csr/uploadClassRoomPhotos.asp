<%@ Language = "VBScript" %>
<% 
option explicit 
Response.Expires = -1
Server.ScriptTimeout = 600
Response.Buffer = true
%>
<!-- #include file="imageUpload.asp" -->
<%
'======================================================='
 'Written By : Bharath'
 'Last UpaDated: '
 'Description : This Page is Upload images for all sessions'
'======================================================='
 
If not  Session("UserId") = "" Then %>
<!--#include virtual="/india/connection.asp"-->
<%
' ****************************************************
' Change the value of the variable below to the pathname
' of a directory with write permissions, for example "C:\Inetpub\wwwroot"
  Dim uploadsDirVar

  uploadsDirVar = "d:\Webspace\pugmarks\pmstudy\pmstudy.com\www\india\classRoomImages"
' ****************************************************


'======================================================='
 'Declare The Variables'
'======================================================='


 Dim rqType,rqPage,rqRow
 Dim strQuery,viewQuestionNo,i
 Dim country
 Dim city
 Dim strQuery1,Rs1
 Dim Dates
 Dim upload

 Dim message
 message = Session("message")
 Session("message") = ""

 Set Rs = Server.CreateObject("ADODB.Recordset")
  
'======================================================='
'Sql Query For Retrive The CityId and City For Displaying'
'And Put Into Array'
'And Do The Paginavigation'
'======================================================='

  strQuery = "select Distinct(city) from ITIL_city where country = '"& session("country") &"'"
  
  Rs.Open strQuery,Conn

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
<title>Images</title>
<link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
<link href="../../css/pmstyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="calendar/zapatec.js"></script>
<script type="text/javascript" src="calendar/calendar.js"></script>
<script type="text/javascript" src="calendar/calendar-en.js"></script>
<link href="calendar/template.css" rel="stylesheet" type="text/css">
<link href="calendar/system.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	<!--
/**
 * Determines if a field is exceeding the maximum size
 * and truncates the string if it is over the limit.
 */
function maxlength(field, size) {
    if (field.value.length > size) {
        field.value = field.value.substring(0, size);
    }
}
// -->
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

 with(theform)
 {
     if (validate_required(startsession,"Please enter Starting Session")==false)
     	  {startsession.focus();return false}
		  
     if (validate_required(endsession,"Please enter Ending Session")==false)
     	  {endsession.focus();return false}		  
}
		 
    //Check To See If The Startdate And Enddate Is Same

     if(theform.startsession.value == theform.endsession.value)
     {
      alert("Start Date and End Date Should Not Be Equal")
      return(false);
     }

	 
 with(theform)
 {
 
     if (validate_required(image1,"Please browse the Image1")==false)
     	  {image1.focus();return false} 	 

     if (validate_required(imageDescription1,"Please enter Description1")==false)
     	  {imageDescription1.focus();return false}

     if (validate_required(image2,"Please browse the Image2")==false)
     	  {image2.focus();return false}

     if (validate_required(imageDescription2,"Please enter Description2")==false)
     	  {imageDescription2.focus();return false}		  
 }

}
</script>
</head>
<body><div id="htMap">
<table border="1" height="550" cellspacing="0" class="dbborder" width="1000px">
 <tr>
   <td colspan="3" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% =Session("country") %></span> ITILstudy Back Office</font></div></td>
 </tr>
 <tr>
  <td width="100px" valign="top" rowspan="22">
    <!--#include file="leftMenu.html"-->
  </td>
 </tr>
 <tr>
 	<td>
		<table border="0" align="center" width="400px" height="350px" cellpadding="2" cellspacing="0">
			<tr>
				<td colspan="2" align="center" class="h3">Upload Class Room Training Photos <div><hr /></div>
				<% If message <> "" Then %><div align="center"><% = message %></div><% End If %></td>
			</tr>
<% function OutputForm() %>
			<form name="frmSend" method="POST" enctype="multipart/form-data" action="uploadClassRoomPhotos.asp" onSubmit="return validate_form(this)">
			<tr>
			 <td valign="top">
			   <table border="0" align="center" width="100%" cellpadding="5" cellspacing="2" bgcolor="#e7f2f7">
			    <tr bgcolor="#ffffff">
				<td class="imagetitles">Country : </td>
				<td>&nbsp;&nbsp;&nbsp;<% = Session("country") %></td>
			</tr>
			<tr bgcolor="#ffffff">
				<td class="imagetitles">City : </td>
				<td>&nbsp;&nbsp;&nbsp;<select name="city" id="city"    style="width:115px"  />
						<option value="">--Select--</option>
		  			<% do until Rs.EOF 
						for each  i in Rs.Fields
					%>
					<option value="<% = Rs("city") %>"><% =Rs("city") %></option>
					<% next
						Rs.movenext
						loop 
					%>
					</select></td>
			 </tr>
			 <tr bgcolor="#ffffff">
				<td class="imagetitles">Start Session :</td>
				<td>
				  <input autocomplete="off" name="startsession" readonly id="checkIn_date" type="text">
		          <input value=" ... " id="button8a" class="buttonc" type="reset">
				</td>
			</tr>
			<tr bgcolor="#ffffff">
				<td class="imagetitles">End Session :</td>
				<td>
				  <input autocomplete="off" name="endsession" readonly id="checkOut_date" type="text">
               	  <input value=" ... " id="button8b" class="buttonc" type="reset">
				</td>
			</tr>			
			<tr bgcolor="#ffffff">
				<td class="imagetitles">Upload Image1 : </td>
				<td><input type="file" name="image1" /></td>
			</tr>
			<tr bgcolor="#ffffff">
				<td class="imagetitles">Description1 : </td>
				<td>&nbsp;&nbsp;&nbsp;<textarea name="imageDescription1" rows="3" cols="25"  onkeypress="maxlength(this, 1975);"></textarea></td>
			</tr>
			<tr bgcolor="#ffffff">
				<td class="imagetitles">Upload Image2 : </td>
				<td><input type="file" name="image2" /></td>
			</tr>
			<tr bgcolor="#ffffff">
				<td class="imagetitles">Description2 : </td>
				<td>&nbsp;&nbsp;&nbsp;<textarea name="imageDescription2" rows="3" cols="25"  onkeypress="maxlength(this, 1975);"></textarea></td>
			</tr>						
			<tr bgcolor="#ffffff">
			    <td></td>
				<td>
				 <table>
				  <tr>
				   <td><input type="submit" value="Upload" class="buttonc" /></td></form>
        			   <form name="cancel" action="csrHome.asp">
				   <td><input type="submit" value="Cancel" class="buttonc" /></td>
			    </form>
				</tr>
			  </table>
			  </td>
			</tr>
		</table>
		</td>
		</tr>
	<%
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
	
	
	SaveFiles = SaveFiles & "<br>Country = " & Session("country") & "<br>"
	SaveFiles = SaveFiles & "City = " & Upload.Form("city") & "<br>"
	Session("city") = Upload.Form("city")
	SaveFiles = SaveFiles & "Start Session = " & Upload.Form("startsession") & "<br>"
	Session("startsession") = Upload.Form("startsession")
	SaveFiles = SaveFiles & "End Session = " & Upload.Form("endsession") & "<br>"
	Session("endsession") = Upload.Form("endsession")	
	SaveFiles = SaveFiles & "Description1 = " & Upload.Form("imageDescription1") & "<br>"
	Session("description1") = Upload.Form("imageDescription1")
	SaveFiles = SaveFiles & "Description2 = " & Upload.Form("imageDescription2") & "<br>"
	Session("description2") = Upload.Form("imageDescription2")	
	
	Set Rs2 = Server.CreateObject("ADODB.Recordset")
    Dim Sql2,Rs2
	
    if Session("startsession") <> "" then
   
   		Sql2 = "insert into ITIL_images (country,city,startsession,endsession,image1,image2,description1,description2)"
		Sql2 = Sql2 & " values "
		Sql2 = Sql2 & "('" & Session("country") & "',"
		Sql2 = Sql2 & "'" & Session("city") & "',"
		Sql2 = Sql2 & "'" & Session("startsession") & "',"
		Sql2 = Sql2 & "'" & Session("endsession") & "',"		
		if (UBound(Upload.UploadedFiles.keys) <> -1) then
		for each fileKey in Upload.UploadedFiles.keys 
		Sql2 = Sql2 & "'" & Replace(Upload.UploadedFiles(fileKey).FileName,"'","''") & "',"
		next
		End If	
		sql2 = Sql2 & "'" & Replace(Trim(Session("description1")),"'","''") & "',"
		sql2 = Sql2 & "'" & Replace(Trim(Session("description2")),"'","''") & "')"
		
    	Rs2.open Sql2,conn

	 end if
	
end function


%>
<%
Dim diagnostics
if Request.ServerVariables("REQUEST_METHOD") <> "POST" then
    diagnostics = TestEnvironment()
    if diagnostics<>"" then
        response.write diagnostics
    else
        OutputForm()
    end if
else
    OutputForm()
end if
 
%>
 		 
		<tr>
			<td colspan="2" align="left"><% response.Write(SaveFiles) %></td>
										  
		</tr>
	 	<tr>
			<td colspan="2" align="right"><div><a href="imageManagement.asp?action=view"><span>Click here to see all uploaded IMAGES</span></a></div></td>	
		</tr>
			 
				
		</table>

	</td>
 </tr>				
</table>
</div>
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
   						dateStatusFunc :    disallowDateBefore, //the function to call
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
   	         dateStatusFunc :    disallowDateBefore, //the function to call
   	         onUpdate       :    filterDates2
   	      });

   		</script>
</body>
</html>
<%
 Rs.Close
 Set Rs = Nothing
 Conn.Close
 Set Conn = Nothing
 Else
 Response.Redirect("../login.asp")
 End If
%>