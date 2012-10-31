<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->

<%'initialising icount.  
   
   
 Currency_Format_Front = CurrencyFormat_Front(countries)

 Currency_Format_Back = CurrencyFormat_Back(countries)   
   
Set Rs = Server.CreateObject("ADODB.Recordset")

'query for retriving values from database

 strQuery = "SELECT course.*, city.state_code, course.country FROM ITIL_course course,ITIL_city city Where course.city = city.city And course.country = '" & countries & "' AND city.country = '" & countries & "' AND city.city = '"&City&"' AND course.status <> 'Cancelled' And course.startdate BETWEEN '"&Now() - 1&"' AND DATEADD(day,180,'"&Now()&"') order by course.startdate, course.city asc"				 
	'response.write(strQuery)				


Rs.Open strQuery,ConnObj 
 
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
				
strEnding= strEnding &"<tr onMouseOver=""javascript:highlightTableRowVersionA(this, '#FFFFCC');""><td class="&bgColor&"><a href=""/venue.asp?courseID="& arrAllCourses(0,rowCounter)&""" onClick=""return popitup('/venue.asp?courseID="& arrAllCourses(0,rowCounter) &"')"">"&Trim(arrAllCourses(1,rowCounter))&""
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
strEnding= strEnding &"<td class="& bgColor &">"& Currency_Format_Front &""& FormatNumber(arrAllCourses(17,rowCounter)) &""& Currency_Format_Back &"<sup><font color=""red""><b>*</b></font></sup>"
If countries = "India" Then
strEnding= strEnding &"+ "& arrAllCourses(11,rowCounter) &" %<br /> tax <br />(Total Rs. "& FormatNumber(arrAllCourses(18,rowCounter)) &" )"
End If 
strEnding= strEnding &"</td>"
Else 
strEnding= strEnding &"<td class="& bgColor &">"& Currency_Format_Front &""& FormatNumber(arrAllCourses(10,rowCounter)) &""& Currency_Format_Back &""
If countries = "India" Then
strEnding= strEnding &" + "& arrAllCourses(11,rowCounter) &" %<br /> tax <br />(Total Rs. "& FormatNumber(arrAllCourses(12,rowCounter)) &" )"
End If 
strEnding= strEnding &"</td>"
End If 
If arrAllCourses(25,rowCounter) <> "Full" Then
strEnding= strEnding &"<td class="& bgColor &"><form action=""/enrollClass.asp"" method=""post""><input type=""hidden"" name=""SelCourseID"" value="& arrAllCourses(0,rowCounter) &"><input type=""submit"" name=""Course"" value=""Enroll"" class=""ButtonSmall"" /></form></td>"
Else
strEnding= strEnding &"<td class="& bgColor &"><img src=""images/back/full.gif"" /></td>"
End If
End If  
Response.Write(strEnding)


iCount = iCount +1 
End If 
Next
End If 


%>
   
    
    
