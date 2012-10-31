<% 
option explicit 
Response.Expires = -1
Server.ScriptTimeout = 600
%>
<!-- #include file="freeaspupload.asp" -->
<%
'======================================================='
 'Written By : '
 'Last UpaDated: '
 'Description :'
 'Purpose : Add/Edit/Delete City Page'
'======================================================='
 
  If not  Session("UserId") = "" Then %>
<!--#include virtual="/india/connection.asp"-->
<%


' ****************************************************
' Change the value of the variable below to the pathname
' of a directory with write permissions, for example "C:\Inetpub\wwwroot"
  Dim uploadsDirVar
  uploadsDirVar = "c:\inetpub\wwwroot\bharath\pmstudy\classRoomImages" 
  'uploadsDirVar = "d:\hosting\mygmatstudy\india\classRoomImages"
' ****************************************************

' Note: this file uploadTester.asp is just an example to demonstrate
' the capabilities of the freeASPUpload.asp class. There are no plans
' to add any new features to uploadTester.asp itself. Feel free to add
' your own code. If you are building a content management system, you
' may also want to consider this script: http://www.webfilebrowser.com/


 

 
'======================================================='
 'Declare The Variables'
'======================================================='

 Dim arrAllQueries
 Dim arrAllRecords
 Dim countryFirstRow
 Dim countryLastRow
 Dim countryRowCounter
 Dim rqType,rqPage,rqRow
 Dim firstRow,lastRow,numRows,rowcounter
 Dim strQuery,viewQuestionNo,i
 Dim country
 Dim city
 Dim strQuery1,Rs1
 Dim arrAllCities
 Dim Dates
  
''/**********************************************************************************/

 Set Rs = Server.CreateObject("ADODB.Recordset")
 
function SaveFiles
    Dim Upload, fileName, fileSize, ks, i, fileKey

    Set Upload = New FreeASPUpload
    Upload.Save(uploadsDirVar)

	' If something fails inside the script, but the exception is handled
	If Err.Number<>0 then Exit function

    SaveFiles = ""
    ks = Upload.UploadedFiles.keys 

	if (UBound(ks) <> -1) then
        SaveFiles = "<B>File uploaded:</B> "
		for each fileKey in Upload.UploadedFiles.keys
	        SaveFiles = SaveFiles & Upload.UploadedFiles(fileKey).FileName & " (" & Upload.UploadedFiles(fileKey).Length & "B)" 
			Session("image") = Upload.UploadedFiles(fileKey).FileName
        next
    else
        'SaveFiles = "The file name specified in the upload form does not correspond to a valid file in the system."
    end if
	
	
	SaveFiles = SaveFiles & "<br>Country = " & Upload.Form("country") & "<br>"
	Session("country") = Upload.Form("country")
	SaveFiles = SaveFiles & "City = " & Upload.Form("city") & "<br>"
	Session("city") = Upload.Form("city")
	SaveFiles = SaveFiles & "Title = " & Upload.Form("title") & "<br>"
	Session("title") = Upload.Form("title")
	SaveFiles = SaveFiles & "Description = " & Upload.Form("imageDescription") & "<br>"
	Session("description") = Upload.Form("imageDescription")
	
end function

 Set Rs2 = Server.CreateObject("ADODB.Recordset")
Dim Sql2,Rs2
	
   if Session("title") <> "" then
   
   		Sql2 = "insert into ps_images (country,city,title,image,description,insertedtime)"
		Sql2 = Sql2 & " values "
		Sql2 = Sql2 & "('" & Session("country") & "',"
		Sql2 = Sql2 & "'" & Session("city") & "',"
		Sql2 = Sql2 & "'" & Session("title") & "',"
		Sql2 = Sql2 & "'" & Session("image") & "',"
		sql2 = Sql2 & "'" & Session("description") & "',"
		sql2 = Sql2 & "'" & now() & "')"
		
		'response.Write(Sql2)
		'response.Flush()
		Rs2.open Sql2,conn
		
	end if			
			

 
 
 
''/**********************************************************************************/

 
 
response.Redirect("uploadClassRoomPhotos.asp")


 

%>

 





