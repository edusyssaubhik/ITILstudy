<!--#include virtual="/includes/displayFormat.asp"-->
<%
'---------------------------------------------------------------'
'Written By : Praveen'
'Created Date : 15/09/2011'
'Modified By : Praveen'
'Modified Date: 29/09/2011'
'Description :'
'This page is for generating dates and location for pmstudy based on' 
'Country and keeping in the txt file to reduce strain on database'
'--------------------------------------------------------------'

'Initialising counts


'initialising record set
Set rsQues = Server.CreateObject("ADODB.Recordset")
Set rsQuery = Server.CreateObject("ADODB.Recordset")

 'Retriving country from dates_location.asp and country drop down'
'Request.QueryString("country") coming from country drop down'

If Request.QueryString("course") <> "" Then

	strCourses = Request.QueryString("course")

       Session("gencourse")= strCourses

Else 

	Session("gencourse") = Session("gencourse")

End If

If addCourse <> "" OR editCourse <> "" OR rqDeleteId <> "" Then

	generate = "AddEditCourse" 
	Session("CountryOrigin") = Session("country")

Else

	generate = ""
	Session("CountryOrigin") = Session("CountryOrigin")

End If

'Query For Selecting top Record from table to check the generator have to run or not'
'making Queries to not work when new course habeen added'
If generate = "" Then
If Session("gencourse") = "" Then

	strQuery1 ="select TOP 1 * from prince2_generate_course WHERE country = '"& Session("CountryOrigin") &"' ORDER BY id DESC"
	rsQuery.Open strQuery1,ConnObj
	
Else

    strQuery1 ="select TOP 1 * from prince2_generate_course WHERE country = '"&Session("gencourse")&"-"&Session("CountryOrigin")&"' ORDER BY id DESC"
	rsQuery.Open strQuery1,ConnObj	
End If

'Checking the date whether file is generated or not'
If (Not rsQuery.BOF) AND (Not rsQuery.EOF) Then
	rqdate = FormatDateTime(rsQuery("date"),2)
Else
	rqdate = ""	
End If
End If

'Condition for comparing retrived date and now date for running generator
todayDate = FormatDateTime(Now(),2)

'Condition for comparing retrived date and now date for running generator
If rqdate <> todayDate OR rqdate = "" OR generate <> "" Then 

'Constructing Page and keeping in  string.
'==================================================Page==================================================================== 

strEnding  = " <tr id=""courses"" style=""display:block;""><td colspan=""4""><table border=""0"" cellspacing=""0"" cellpadding=""0"" ><tr><td class=""TableRowOdd"" width=""40px""><span class=""HeaderLarge"">Course</span></td><td class=""TableRowOdd"" width=""30px""><span class=""HeaderLarge"">Location</span></td><td class=""TableRowOdd"" width=""150px""><span class=""HeaderLarge"">Dates</span></td><td class=""TableRowOdd"" width=""300px""><span class=""HeaderLarge"">Timing</span></td><td class=""TableRowOdd"" width=""120px"" colspan=""4""><span class=""HeaderLarge"">Price</span>"


strEnding  = strEnding &"</td></tr>"

'Table retriving from database.
'initialising icount.  
 Set Rs = Server.CreateObject("ADODB.Recordset")  


iCount = 0

'Price Format Display Functions'
	
Currency_Format_Front = CurrencyFormat_Front(Session("CountryOrigin"))

Currency_Format_Back = CurrencyFormat_Back(Session("CountryOrigin"))


'Sql Query For Retrive Courses'
If Session("gencourse") = "" OR generate <> "" Then

'If Country is UK - For formatting purpose'
If Session("CountryOrigin") <> "Australia" Then

strQuery = "SELECT course.courseid,course.courseName,course.city,course.startdate,course.enddate,course.starthour,course.startminute,course.startsession,course.endhour,course.endminute,course.endsession,course.pricewithouttax,course.tax,course.pricewithtax,course.applicabledays,course.afterEBdiscountwithouttax,course.afterEBdiscountwithtax,course.country,course.status,course.coursedates,city.state_code FROM prince2_course course, ps_city city Where course.city = city.city And course.country = '"&Session("CountryOrigin")&"' AND city.country = '"&Session("CountryOrigin")&"' AND course.status <> 'Cancelled' And course.startdate >= '"&Now()&"' order by course.startdate, course.city, course.pricewithouttax desc"

ElseIf Session("CountryOrigin") = "Australia" Then

strQuery = "SELECT course.courseid,course.courseName,course.city,course.startdate,course.enddate,course.starthour,course.startminute,course.startsession,course.endhour,course.endminute,course.endsession,course.pricewithouttax,course.tax, course.pricewithtax,course.applicabledays,course.afterEBdiscountwithouttax,course.afterEBdiscountwithtax,course.country,course.status,course.coursedates,city.state_code FROM prince2_course course, ps_city city Where course.city = city.city And course.country = '"&Session("CountryOrigin")&"' AND city.country = '"&Session("CountryOrigin")&"' AND course.status <> 'Cancelled' And course.startdate >= '"&Now()&"'  ORDER BY course.startdate asc"

End If

ElseIF Session("gencourse") <> "" AND Session("gencourse") <> "All" Then

strQuery = "SELECT course.courseid,course.courseName,course.city,course.startdate,course.enddate,course.starthour,course.startminute,course.startsession,course.endhour,course.endminute,course.endsession,course.pricewithouttax,course.tax, course.pricewithtax,course.applicabledays,course.afterEBdiscountwithouttax,course.afterEBdiscountwithtax,course.country,course.status,course.coursedates,city.state_code FROM prince2_course course, ps_city city Where course.city = city.city And course.courseName = '"&Session("gencourse")&"'  And course.country = '"&Session("CountryOrigin")&"' AND course.startdate > '"&Now()&"'  ORDER BY course.startdate asc"



ElseIf Session("gencourse") = "All" Then		

strQuery = "SELECT course.courseid,course.courseName,course.city,course.startdate,course.enddate,course.starthour,course.startminute,course.startsession,course.endhour,course.endminute,course.endsession,course.pricewithouttax,course.tax,course.pricewithtax,course.applicabledays,course.afterEBdiscountwithouttax,course.afterEBdiscountwithtax,course.country,course.status,course.coursedates,city.state_code FROM prince2_course course, ps_city city Where course.city = city.city AND course.startdate > '"&Now()&"' And course.country = '"&Session("CountryOrigin")&"' ORDER BY course.city, course.startdate asc"		 


End If

Rs.Open strQuery,ConnObj

If Not Rs.EOF Then
arrAllCourses = Rs.getrows
Session("arrAllCourses") = arrAllCourses
numRows = Ubound(arrAllCourses,2)
firstRow = 0
lastRow = numRows
End If

Rs.Close
					  

If IsArray(arrAllCourses) Then
For rowCounter = firstRow to lastRow 

'format the starting date'

StartDate = arrAllCourses(3,rowCounter)
ApplicableDays = arrAllCourses(14,rowCounter)					 
					 
					
'Displaying Only ODD Color'
If Eval(iCount\2 = iCount/2) Then 
bgColor = "TableRowEven"
Else 
bgColor = "TableRowOdd"
End If 

				
strEnding= strEnding &"<tr onMouseOver=""javascript:highlightTableRowVersionA(this, '#FFFFCC');""><td class="&bgColor&">"& Trim(arrAllCourses(1,rowCounter))&""
If Trim(arrAllCourses(1,rowCounter)) = "Practitioner" Then 
strEnding= strEnding &"<sup><font color=""red""><b>**</b></font></sup>"
End If 

'Location - venue'

strEnding= strEnding &"</td><td class="& bgColor &" width=""90px""><div align=""center"">"
if arrAllCourses(18,rowCounter) <> "Full" Then 
strEnding= strEnding &"<a href=""PRINCE2-venue.asp?courseID="& arrAllCourses(0,rowCounter)&""" onClick=""return popitup('PRINCE2-venue.asp?courseID="& arrAllCourses(0,rowCounter) &"')"">"& Trim(arrAllCourses(2,rowCounter)) &"</a><br>"
Else
strEnding= strEnding &""& Trim(arrAllCourses(2,rowCounter)) &"<br>"
End If
If arrAllCourses(19,rowCounter) <> "" Then 
strEnding= strEnding &"Weekend Course"
End If 

'Date'

strEnding= strEnding &"</div></td><td class="& bgColor &" width=""160px"">"
If arrAllCourses(19,rowCounter) <> "" Then 
strEnding= strEnding &""&  arrAllCourses(19,rowCounter)&""
Else 
strEnding= strEnding &""&  DAY(arrAllCourses(3,rowCounter)) & " " & MonthName(Month(arrAllCourses(3,rowCounter)),3) & " "  & YEAR(arrAllCourses(3,rowCounter)) & " to  <br /> "& DAY(arrAllCourses(4,rowCounter)) & " " & MonthName(Month(arrAllCourses(4,rowCounter)),3) & " "  & YEAR(arrAllCourses(4,rowCounter))&""
End If

'Timings'

strEnding= strEnding &"</td><td class="& bgColor &" width=""170px"">"&  arrAllCourses(5,rowCounter)& ":"&arrAllCourses(6,rowCounter)& " "&arrAllCourses(7,rowCounter)& " -  "&arrAllCourses(8,rowCounter)& ":"&arrAllCourses(9,rowCounter)& " "&arrAllCourses(10,rowCounter) &"</td>"

                   
If (CDate(StartDate)-(Date()+ApplicableDays+1) >= 0) Then 

'PRICE WITH VAT, TAX, GST Before EBD'

		strEnding= strEnding &"<td class="& bgColor &" width=""280px"">"
		
		strEnding= strEnding &""& Currency_Format_Front &""& FormatNumber(arrAllCourses(15,rowCounter)) &""& Currency_Format_Back 
		
		If Session("CountryOrigin") = "India" Then
		
		strEnding= strEnding &"<br> +"& arrAllCourses(12,rowCounter) &" % tax <br />(Total Rs. "& FormatNumber(arrAllCourses(16,rowCounter)) &")"
				
		ElseIf Session("CountryOrigin") = "Australia" Then
		
		strEnding= strEnding &" + GST<br>(Total "& Currency_Format_Front &""& FormatNumber(arrAllCourses(16,rowCounter)) &""& Currency_Format_Back &")<sup><font color=""red""><b>*</b></font></sup>"
		
		ElseIf Session("CountryOrigin") = "United Kingdom" Then
		
		strEnding= strEnding &" + VAT<br>(Total "& Currency_Format_Front &""& FormatNumber(arrAllCourses(16,rowCounter)) &""& Currency_Format_Back &")<sup><font color=""red""><b>*</b></font></sup>"
		
		Else
		
		strEnding= strEnding &"<sup><font color=""red""><b>*</b></font></sup>"
		
		End If   
 
        strEnding= strEnding &"</td>"

Else 
		
'PRICE WITH VAT, TAX, GST After EBD'
		
		strEnding= strEnding &"<td class="& bgColor &" width=""260px"">"
		
		strEnding= strEnding &""& Currency_Format_Front &""& FormatNumber(arrAllCourses(11,rowCounter)) &""& Currency_Format_Back &""
		
		If Session("CountryOrigin") = "India" Then
		
		strEnding= strEnding &"<br>+"& arrAllCourses(12,rowCounter) &" % tax <br />(Total Rs. "& FormatNumber(arrAllCourses(13,rowCounter)) &")"

		ElseIf Session("CountryOrigin") = "Australia" Then 
		
		strEnding= strEnding &" + GST<br>(Total "& Currency_Format_Front &""& FormatNumber(arrAllCourses(13,rowCounter)) &""& Currency_Format_Back &")" 
		
		ElseIf Session("CountryOrigin") = "United Kingdom" Then 
		
		strEnding= strEnding &" + VAT<br>(Total "& Currency_Format_Front &""& FormatNumber(arrAllCourses(13,rowCounter)) &""& Currency_Format_Back &")"
		
		End If    
		
		strEnding= strEnding &"</td>"
		
End If
		
			'Enrol Button'

		 
		If arrAllCourses(18,rowCounter) <> "Full" Then 
		strEnding= strEnding &"<td class="& bgColor &"><form action=""/PRINCE2-enrolClass.asp"" method=""post""><input type=""hidden"" name=""SelCourseID"" value="& arrAllCourses(0,rowCounter) &" /><input type=""hidden"" name=""Selcourse"" value="& Trim(arrAllCourses(1,rowCounter)) &" /><input type=""submit"" name=""Course"" value=""Enrol"" class=""ButtonSmall""/></form></td>"
		Else
		strEnding= strEnding &"<td class="& bgColor &" align=""center"" ><font color=""red""><div align=""center"">Full</div></font></td>"
		End If 
		
		iCount = iCount +1 
		NEXT 
End If 
                         

'ending footer
strEnding= strEnding &"</tr><tr><td colspan=""6"" class=""TableRowEven"">&nbsp;</td></tr></table>"

'Initialing filesystem object 	
Set fsoObject=Server.CreateObject ("Scripting.FileSystemObject")

'Creating a text file using file systm object.
If Session("gencourse") = "" OR generate <> "" Then

'Set tsObject = fsoObject.CreateTextFile("C:\Inetpub\wwwroot\PRINCE2-Classroom-Courses\PRINCE2-Courses-"&Session("CountryOrigin")&".txt")

Set tsObject = fsoObject.CreateTextFile("E:\vhosts\PMstudy.com\httpdocs\PRINCE2-Classroom-Courses\PRINCE2-Courses-"&Session("CountryOrigin")&".txt")

ElseIf Session("gencourse") <> ""  Then

'Set tsObject = fsoObject.CreateTextFile("C:\Inetpub\wwwroot\PRINCE2-Classroom-Courses\PRINCE2-Courses-"&Session("gencourse")&"-"&Session("CountryOrigin")&".txt")
Set tsObject = fsoObject.CreateTextFile("E:\vhosts\PMstudy.com\httpdocs\PRINCE2-Classroom-Courses\PRINCE2-Courses-"&Session("gencourse")&"-"&Session("CountryOrigin")&".txt")

End If
'Witing the string containing question format into an asp file using file system object.'
tsObject.Write strEnding

strEnding  =  ""

'Inserting Updated date and country Values of a generater into database'

strPay = "INSERT INTO prince2_generate_course (date,country) VALUES "
strPay = strPay & "('" & datevalue(NOW()) &"',"
If Session("gencourse") = "" OR generate <> "" Then
strPay = strPay & " '" & Session("CountryOrigin")&"')"
Else 
strPay = strPay & " '"&Session("gencourse")&"-"&Session("CountryOrigin")&"')"
End If
ConnObj.Execute strPay
If generate <> "" Then
strQuery5 = "DELETE FROM prince2_generate_course WHERE date = '" & datevalue(NOW()) & "' AND country LIKE '%"&Session("CountryOrigin")&"'"
Rs.Open strQuery5,ConnObj
End If

End If



%>
