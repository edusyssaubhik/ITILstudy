<!--#include virtual="/includes/displayFormat.asp"-->
<%
	'---------------------------------------------------------------'
	'Written By : Savita'
	'Created Date : 23/08/2012'
	'Modified By : Savita'
	'Modified Date: 23/08/2012'
	'Description :'
	'This page is for generating datesandlocations for ITILstudy based on' 
	'Country and keeping in the txt file to reduce strain on database'
	'--------------------------------------------------------------'
	
	'Initialising counts
	
	'initialising record set
	Set rsQues = Server.CreateObject("ADODB.Recordset")
	Set rsQuery = Server.CreateObject("ADODB.Recordset")
	
	
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
	
		strQuery1 ="select TOP 1 * from generate_course WHERE country = '"& Session("CountryOrigin") &"-ST' ORDER BY id DESC"
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
	'If rqdate <> todayDate OR rqdate = "" OR generate <> "" Then
	
	'Constructing Page and keeping in  string.
	'==================================================Page==================================================================== 
	
	strEnding  = "<tr id=""courses"" style=""display:block;""><td colspan=""8""><table border=""0"" cellspacing=""0"" cellpadding=""0""><tr> <td class=""TableRowOdd"" width=""100px""><span class=""HeaderLarge"">Location</span></td><td class=""TableRowOdd"" width=""100px""><span class=""HeaderLarge"">Dates</span></td><td class=""TableRowOdd"" width=""150px""><span class=""HeaderLarge"">Timing</span></td><td class=""TableRowOdd"" width=""140px""><span class=""HeaderLarge"">Price</span></td><td class=""TableRowOdd"" width=""100px"">&nbsp;</td></tr>"
	
	'Table retriving from database.
	'initialising icount.  
	   
	iCount = 0
	
	Currency_Format_Front = CurrencyFormat_Front(Session("CountryOrigin"))
	 
	Currency_Format_Back = CurrencyFormat_Back(Session("CountryOrigin"))   
	
	Set Rs = Server.CreateObject("ADODB.Recordset")
	
	'Sql Query For Retrive Courses'
	
	If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then
	
	strQuery2 = "SELECT course.courseid,course.city,course.startdate,course.enddate, course.starthour,course.startminute,course.startsession,course.endhour,course.endminute,course.endsession,course.pricewithouttax,course.tax,course.pricewithtax,course.applicabledays,course.afterEBdiscountwithouttax,course.afterEBdiscountwithtax,course.status,course.coursetype,city.state_code, course.country FROM ITIL_course course, ITIL_city city Where course.city = city.city And (course.country = 'US' OR course.country = 'Canada') And (city.country = 'US' OR city.country = 'Canada') AND (course.country = city.country) AND course.coursetype = 'ST' AND course.status <> 'Cancelled' And course.startdate BETWEEN '"&Now() - 1&"' AND DATEADD(day,180,'"&Now()&"')  order by course.startdate, course.city asc"
	
		' Response.Write(strQuery2)	
	
	ElseIf Session("CountryOrigin") = "United Kingdom" Then
			 
			 
     strQuery2 = "SELECT course.courseid,course.city,course.startdate,course.enddate, course.starthour,course.startminute,course.startsession,course.endhour,course.endminute,course.endsession,course.pricewithouttax,course.tax,course.pricewithtax,course.applicabledays,course.afterEBdiscountwithouttax,course.afterEBdiscountwithtax,course.status,course.coursetype,city.state_code, course.country FROM ITIL_course course, ITIL_city city Where course.city = city.city And  course.country = 'United Kingdom' And city.country = 'United Kingdom' AND (course.country = city.country) AND course.coursetype = 'ST' AND course.status <> 'Cancelled' And course.startdate BETWEEN '"&Now() - 1&"' AND DATEADD(day,180,'"&Now()&"')  order by course.startdate, course.city asc"	
	 
	 	 'Response.Write(strQuery2)	
	 

	 Else
			 
			 
     strQuery2 = "SELECT course.courseid,course.city,course.startdate,course.enddate, course.starthour,course.startminute,course.startsession,course.endhour,course.endminute,course.endsession,course.pricewithouttax,course.tax,course.pricewithtax,course.applicabledays,course.afterEBdiscountwithouttax,course.afterEBdiscountwithtax,course.status,course.coursetype,city.state_code, course.country FROM ITIL_course course, ITIL_city city Where course.city = city.city And  course.country = '" & Session("CountryOrigin") & "' And city.country = '" & Session("CountryOrigin") & "' AND (course.country = city.country) AND course.coursetype = 'ST' AND course.status <> 'Cancelled' And course.startdate BETWEEN '"&Now() - 1&"' AND DATEADD(day,180,'"&Now()&"')  order by course.startdate, course.city asc"			 		 
		' Response.Write(strQuery2)			 
	End If
	
	'response.Write(strQuery2)
	
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
	ApplicableDays = arrAllCourses(13,rowCounter)
	
	'Display Only future dates and previous Dates'
	If(CDate(StartDate)-(Date()-1)>=0) then
	
	'Displaying Only ODD Color'
	If Eval(iCount\2 = iCount/2) Then 
		  bgColor = "TableRowEven"
	Else 
		  bgColor = "TableRowOdd"
	End If 
			
	'Location - venue
					
	strEnding= strEnding &"<tr onMouseOver=""javascript:highlightTableRowVersionA(this, '#FFFFCC');""><td class="& bgColor &">"
	If arrAllCourses(16,rowCounter) <> "Full" Then
	
	If arrAllCourses(17,rowCounter) = "Corporate" Then
	strEnding= strEnding &""& Trim(arrAllCourses(1,rowCounter)) &""
	Else
	strEnding= strEnding &"<a href=""venue.asp?courseID="& arrAllCourses(0,rowCounter) &""" onClick=""return popitup('venue.asp?courseID="& arrAllCourses(0,rowCounter) &"')"">"& Trim(arrAllCourses(1,rowCounter)) &""
	End If 
	
	Else
	strEnding= strEnding &""& Trim(arrAllCourses(1,rowCounter)) &"<br>"
	End If
	If Session("CountryOrigin") <> "United Kingdom" Then 
	If arrAllCourses(18,rowCounter) <> "" Then
	strEnding= strEnding &", "& arrAllCourses(18,rowCounter)&""
	End If 
	'If arrAllCourses(18,rowCounter) = "TX" Then 
	'strEnding= strEnding &"<sup><font color=""red""><b>**</b></font></sup>"
	'End If 
	End If
	If arrAllCourses(17,rowCounter) <> "Corporate" Then
	strEnding= strEnding &"</a>"
	End If
	If arrAllCourses(18,rowCounter) = "Canada" Then
	strEnding= strEnding &"(Canada)"
	End If 
	
	'Date'
	
	strEnding= strEnding &"<br></td><td class="& bgColor &"> "& DAY(arrAllCourses(2,rowCounter)) & " " & MonthName(Month(arrAllCourses(2,rowCounter)),3) & " "  & YEAR(arrAllCourses(2,rowCounter))&" to <br /> "& DAY(arrAllCourses(3,rowCounter)) & " " & MonthName(Month(arrAllCourses(3,rowCounter)),3) & " "  & YEAR(arrAllCourses(3,rowCounter))&"</td><td class="& bgColor &" width=""23%"">"& arrAllCourses(4,rowCounter) &":"& arrAllCourses(5,rowCounter) &"&nbsp;"& arrAllCourses(6,rowCounter) &" - "& arrAllCourses(7,rowCounter) &":"& arrAllCourses(8,rowCounter) &"&nbsp;"& arrAllCourses(9,rowCounter) &"</td>"
	
	If arrAllCourses(17,rowCounter) = "Corporate" Then
strEnding= strEnding &"<td class="& bgColor &"><font color=""#FE2E2E""><b>Corporate class</b></font></td><td class="& bgColor &"><div align=""center""><font size=""3"" color=""#FE2E2E""><b>---</b></font></div></td>"
Else 
	If (CDate(StartDate)-(Date()+Int(ApplicableDays)+1) >= 0) Then
	
	'PRICE WITH VAT, TAX, GST Before EBD
	
			strEnding= strEnding &"<td class="& bgColor &">"
			
			strEnding= strEnding &""& Currency_Format_Front &" "& FormatNumber(arrAllCourses(14,rowCounter)) &" "& Currency_Format_Back 
			
			If Session("CountryOrigin") = "India" Then
			
			strEnding= strEnding &"<br> + "& arrAllCourses(11,rowCounter) &" % tax <br />(Total Rs. "& FormatNumber(arrAllCourses(15,rowCounter)) &")<sup><font color=""red""><b>*</b></font></sup>"
			
			ElseIf Session("CountryOrigin") = "Germany" Then
			
			strEnding= strEnding &" + VAT <br />(Total "&Currency_Format_Front &" "& FormatNumber(arrAllCourses(15,rowCounter)) &" "& Currency_Format_Back &")<sup><font color=""red""><b>*</b></font></sup>"
					
					
			ElseIf Session("CountryOrigin") = "Australia" Then
			
			strEnding= strEnding &" + GST<br>(Total "& Currency_Format_Front &""& FormatNumber(arrAllCourses(15,rowCounter)) &""& Currency_Format_Back &")<sup><font color=""red""><b>*</b></font></sup>"
			
			ElseIf Session("CountryOrigin") = "United Kingdom" Then
			
			strEnding= strEnding &" + VAT<br>(Total "& Currency_Format_Front &""& FormatNumber(arrAllCourses(15,rowCounter)) &""& Currency_Format_Back &")<sup><font color=""red""><b>*</b></font></sup>"
			
			Else
			
			strEnding= strEnding &"<sup><font color=""red""><b>*</b></font></sup>"
			
			End If   
	 
			strEnding= strEnding &"</td>"		
	
	Else
	
	'PRICE WITH VAT, TAX, GST After EBD'
			
			strEnding= strEnding &"<td class="& bgColor &">"
			
			strEnding= strEnding &""& Currency_Format_Front &""& FormatNumber(arrAllCourses(10,rowCounter)) &""& Currency_Format_Back &""
			
			If Session("CountryOrigin") = "India" Then
			
			strEnding= strEnding &"<br> + "& arrAllCourses(11,rowCounter) &" % tax <br />(Total Rs. "& FormatNumber(arrAllCourses(12,rowCounter)) &")"
			
			ElseIf  Session("CountryOrigin") = "Germany" Then
			
			strEnding= strEnding &" + VAT <br />(Total "& Currency_Format_Front &" "& FormatNumber(arrAllCourses(12,rowCounter)) &" "& Currency_Format_Back &")"
	
			ElseIf Session("CountryOrigin") = "Australia" Then 
			
			strEnding= strEnding &" + GST<br>(Total "& Currency_Format_Front &""& FormatNumber(arrAllCourses(12,rowCounter)) &""& Currency_Format_Back &")" 
			
			ElseIf Session("CountryOrigin") = "United Kingdom" Then 
			
			strEnding= strEnding &" + VAT<br>(Total "& Currency_Format_Front &""& FormatNumber(arrAllCourses(12,rowCounter)) &""& Currency_Format_Back &")"
			
			End If    
			
			strEnding= strEnding &"</td>"
			
	End If
	
	

	'Enrol Button'

	
	If arrAllCourses(16,rowCounter) <> "Full" Then

	strEnding= strEnding &"<td class="& bgColor &"><div align=""center""><form action=""/enrollclass.asp"" method=""post""><input type=""hidden"" name=""SelCourseID"" value="& arrAllCourses(0,rowCounter) &" /><input type=""hidden"" name=""coursetype"" value=""ST"" />"
	
	If Session("CountryOrigin") = "United Kingdom" Then 
	strEnding= strEnding &"<input type=""submit"" name=""TypeCourse"" value=""Enrol"" class=""ButtonSmall""/></form></div></td>"
	Else
	strEnding= strEnding &"<input type=""submit"" name=""TypeCourse"" value=""Enroll"" class=""ButtonSmall""/></form></div></td>"
	End IF
	
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
	
	
	Set tsObject = fsoObject.CreateTextFile("E:\vhosts\ITILstudy.com\httpdocs\dateslocation\ITILstudy-Classes-ITILstudy-Training-ST-"&Session("CountryOrigin")&".txt")
	
	'Set tsObject = fsoObject.CreateTextFile("C:\GitHub\ITIlstudy\dateslocation\ITILstudy-Classes-ITILstudy-Training-ST-"&Session("CountryOrigin")&".txt")
	
	
	'Witing the string containing question format into an asp file using file system object.'
	tsObject.Write strEnding
	
	strEnding  =  ""
	
	'Inserting Updated date and country Values of a generater into database'
	
	strPay = "INSERT INTO generate_course (date,country) VALUES "
	strPay = strPay & "('" & datevalue(NOW()) &"',"
	strPay = strPay & " '" & Session("CountryOrigin")&"-ST')"
	IF generate <> "" Then
	conn.Execute strPay
	Else
	Connobj.Execute strPay
	End If
	
	'End If
	
	
	
	%>

