<!--#include virtual="/includes/displayFormat.asp"-->
<%
'---------------------------------------------------------------'
'Written By : Praveen'
'Created Date : 15/09/2011'
'Modified By : Praveen'
'Modified Date: 29/09/2011'
'Description :'
'This page is for generating datesandlocations for ITILstudy based on' 
'Country and keeping in the txt file to reduce strain on database'
'--------------------------------------------------------------'

'Initialising counts

'initialising record set
Set rsQues = Server.CreateObject("ADODB.Recordset")
Set rsQuery = Server.CreateObject("ADODB.Recordset")


If Session("country") <> "" then

	Session("CountryOrigin") = Session("country")
	
Else 

	Session("CountryOrigin") = Session("CountryOrigin")
	
End If

If addCourse <> "" OR editCourse <> "" OR rqDeleteId <> "" Then

	generate = "AddEditCourse" 

Else

	generate = ""

End If



'Query For Selecting top Record from table to check the generator have to run or not'
'making Queries to not work when new course habeen added'

If generate = "" Then

	strQuery1 ="select TOP 1 * from generate_course WHERE country = '"& Session("CountryOrigin") &"' ORDER BY id DESC"
	rsQuery.Open strQuery1,ConnObj


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

strEnding  = "<tr id=""courses"" style=""display:block;""><td colspan=""8""><table border=""0"" cellspacing=""0"" cellpadding=""0""><tr> <td class=""TableRowOdd"" width=""100px""><span class=""HeaderLarge"">Location</span></td><td class=""TableRowOdd"" width=""100px""><span class=""HeaderLarge"">Dates</span></td><td class=""TableRowOdd"" width=""150px""><span class=""HeaderLarge"">Timing</span></td><td class=""TableRowOdd"" width=""140px""><span class=""HeaderLarge"">Price</span></td><td class=""TableRowOdd"" width=""100px"">&nbsp;</td></tr>"

'Table retriving from database.
'initialising icount.  
   
iCount = 0

Currency_Format_Front = CurrencyFormat_Front(Session("CountryOrigin"))
 
Currency_Format_Back = CurrencyFormat_Back(Session("CountryOrigin"))   

Set Rs = Server.CreateObject("ADODB.Recordset")

If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then
		strQuery2 = "SELECT course.*, city.state_code, course.country FROM ITIL_course course, ITIL_city city Where course.city = city.city And (course.country = 'US' OR course.country = 'Canada') And (city.country = 'US' OR city.country = 'Canada') AND (course.country = city.country) AND course.status <> 'Cancelled' And course.startdate BETWEEN '"&Now() - 1&"' AND DATEADD(day,180,'"&Now()&"')  order by course.startdate, course.city asc"
Else
		strQuery2 = "SELECT course.*, city.state_code, course.country FROM ITIL_course course,ITIL_city city Where course.city = city.city And course.country = '" & Session("CountryOrigin") & "' AND city.country = '" & Session("CountryOrigin") & "' AND course.status <> 'Cancelled' And course.startdate BETWEEN '"&Now() - 1&"' AND DATEADD(day,180,'"&Now()&"') order by course.startdate, course.city asc"					 
End If

If generate <> "" Then
Rs.Open strQuery2,Conn
Else
Rs.Open strQuery2,ConnObj
End If

If Not Rs.EOF Then
arrAllCourses = Rs.getrows
Session("arrAllCourses") = arrAllCourses
numRows = Ubound(arrAllCourses,2)
firstRow = 0
lastRow = numRows
End If

Rs.Close

'Query for retriving values from database

iCount = 0
'Print The Courses Using Array '
If IsArray(arrAllCourses) Then
For rowCounter = firstRow to lastRow

'format the starting date'

StartDate = arrAllCourses(2,rowCounter)
ApplicableDays = arrAllCourses(15,rowCounter)

'Display Only future dates and previous Dates'
If(CDate(StartDate)-(Date()-1)>=0) then

'Displaying Only ODD Color'
If Eval(iCount\2 = iCount/2) Then 
	  bgColor = "TableRowEven"
Else 
	  bgColor = "TableRowOdd"
End If 
				
strEnding= strEnding &"<tr onMouseOver=""javascript:highlightTableRowVersionA(this, '#FFFFCC');""><td class="&bgColor&"><a href=""venue.asp?courseID="& arrAllCourses(0,rowCounter)&""" onClick=""return popitup('venue.asp?courseID="& arrAllCourses(0,rowCounter) &"')"">"&Trim(arrAllCourses(1,rowCounter))&""
If arrAllCourses(30,rowCounter) <> "" Then 
strEnding= strEnding &", "& arrAllCourses(30,rowCounter)&""
If arrAllCourses(30,rowCounter) = "TX" Then 
strEnding= strEnding &"<sup><font color=""red""><b>**</b></font></sup>"
End If 
End If
strEnding= strEnding &"</a>"
If arrAllCourses(30,rowCounter) = "Canada" Then 
strEnding= strEnding &"(Canada)"
End If 
strEnding= strEnding &"<br></td><td class="&bgColor&">"& DAY(arrAllCourses(2,rowCounter)) & " " & MonthName(Month(arrAllCourses(2,rowCounter)),3) & " "  & YEAR(arrAllCourses(2,rowCounter))&" to <br />"& DAY(arrAllCourses(3,rowCounter)) & " " & MonthName(Month(arrAllCourses(3,rowCounter)),3) & " "  & YEAR(arrAllCourses(3,rowCounter))&"</td><td class="& bgColor &" width=""23%"">"& arrAllCourses(4,rowCounter) &":"& arrAllCourses(5,rowCounter) &"&nbsp;"& arrAllCourses(6,rowCounter) &" - "& arrAllCourses(7,rowCounter) &":"& arrAllCourses(8,rowCounter) &"&nbsp;"& arrAllCourses(9,rowCounter) &"</td>"
If arrAllCourses(28,rowCounter) = "Corporate" Then
strEnding= strEnding &"<td class="& bgColor &"><font color=""#FE2E2E""><b>Corporate class</b></font></td><td class="& bgColor &"><div align=""center""><font size=""3"" color=""#FE2E2E""><b>---</b></font></div></td>"
Else 

If (CDate(StartDate)-(Date()+Int(ApplicableDays)+1) >= 0) Then
strEnding= strEnding &"<td class="& bgColor &" width=""260px"">"
 If Session("CountryOrigin") <> "United Kingdom" Then
strEnding= strEnding &""& Currency_Format_Front &""& FormatNumber(arrAllCourses(17,rowCounter)) &""& Currency_Format_Back &"<sup><font color=""red""><b>*</b></font></sup>"
If Session("CountryOrigin") = "India" Then
strEnding= strEnding &"+ "& arrAllCourses(11,rowCounter) &" %<br /> tax <br />(Total Rs. "& FormatNumber(arrAllCourses(18,rowCounter)) &" )"
End If 
ElseIf Session("CountryOrigin") = "United Kingdom" Then
strEnding= strEnding &""& Currency_Format_Front &""& FormatNumber(arrAllCourses(17,rowCounter)) &""& Currency_Format_Back &" + VAT<br>(Total "& Currency_Format_Front &""& FormatNumber(arrAllCourses(18,rowCounter)) &""& Currency_Format_Back &")<sup><font color=""red""><b>*</b></font></sup>"

End If 
strEnding= strEnding &"</td>"
strEnding= strEnding &"<td class="& bgColor &" width=""260px"">"
If Session("CountryOrigin") <> "United Kingdom" Then
strEnding= strEnding &""& Currency_Format_Front &""& FormatNumber(arrAllCourses(10,rowCounter)) &""& Currency_Format_Back &""
If Session("CountryOrigin") = "India" Then
strEnding= strEnding &" + "& arrAllCourses(11,rowCounter) &" %<br /> tax <br />(Total Rs. "& FormatNumber(arrAllCourses(12,rowCounter)) &" )"
End If 
ElseIf Session("CountryOrigin") = "United Kingdom" Then 
strEnding= strEnding &""& Currency_Format_Front &""& FormatNumber(arrAllCourses(10,rowCounter)) &""& Currency_Format_Back &" + VAT<br>( Total "& Currency_Format_Front &""& FormatNumber(arrAllCourses(12,rowCounter)) &""& Currency_Format_Back &")"
End If   
strEnding= strEnding &"</td>"
End If 
If arrAllCourses(25,rowCounter) <> "Full" Then
strEnding= strEnding &"<td class="& bgColor &"><form action=""/enrollClass.asp"" method=""post""><input type=""hidden"" name=""SelCourseID"" value="& arrAllCourses(0,rowCounter) &"><input type=""submit"" name=""Course"" value=""Enroll"" class=""ButtonSmall""/></form></td>"
Else
strEnding= strEnding &"<td class="& bgColor &"><img src=""images/back/full.gif"" /></td>"
End If

End If  
iCount = iCount +1 
End If 
Next
End If 
strEnding= strEnding &"</tr><tr><td colspan=""6"" class=""TableRowEven"">&nbsp;</td></tr></table>"

'Initialing filesystem object 	
Set fsoObject=Server.CreateObject ("Scripting.FileSystemObject")

'Creating a text file using file systm object.


'Set tsObject = fsoObject.CreateTextFile("E:\vhosts\ITILstudy.com\httpdocs\dateslocation\ITILstudy-Classes-ITILstudy-Training-"&Session("CountryOrigin")&".txt")
Set tsObject = fsoObject.CreateTextFile("C:\ITILstudy\dateslocation\ITILstudy-Classes-ITILstudy-Training-"&Session("CountryOrigin")&".txt")


'Witing the string containing question format into an asp file using file system object.'
tsObject.Write strEnding

strEnding  =  ""

'Inserting Updated date and country Values of a generater into database'

strPay = "INSERT INTO generate_course (date,country) VALUES "
strPay = strPay & "('" & datevalue(NOW()) &"',"
strPay = strPay & " '" & Session("CountryOrigin")&"')"
IF generate <> "" Then
conn.Execute strPay
Else
Connobj.Execute strPay
End If

End If



%>
