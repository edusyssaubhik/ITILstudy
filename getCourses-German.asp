<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<%

'Declare the local variable'
Dim objRs, strCourses
Dim strCity, strDate, strStartDate,strEndDate 
Dim arrAllCourses, firstRow, lastRow, numRows, rowCounter
Dim message

'Creating Record object''
Set objRs=Server.CreateObject("ADODB.Recordset")

'Retriving the values from dates_location.asp page through AJAX'
strCity = Request.QueryString("city")
strDate = Request.QueryString("date")


'Price Format Display Functions'
Currency_Format_Front = CurrencyFormat_Front(Session("CountryOrigin"))

Currency_Format_Back = CurrencyFormat_Back(Session("CountryOrigin"))


'If user select City that will come here'
If strCity <> "" Then				 

	strCourses="SELECT course.courseid,course.city,course.startdate,course.enddate, course.starthour,course.startminute,course.startsession,course.endhour,course.endminute,course.endsession,course.pricewithouttax,course.tax,course.pricewithtax,course.applicabledays,course.afterEBdiscountwithouttax,course.afterEBdiscountwithtax,course.status,course.coursetype,city.state_code, course.country FROM ITIL_course course, ITIL_city city WHERE "
	If strCity <> "All" Then
	strCourses = strCourses & "course.city='"&strCity&"' And  city.city = '"&strCity&"' And course.country = '"& Session("Country1") &"' And city.country = '"& Session("Country1") &"' And "
	ElseIf strCity = "All" Then
	strCourses = strCourses & "course.city = city.city And course.country = '"& Session("Country1") &"' AND "
	End If
	
	
	strCourses = strCourses & "course.startdate BETWEEN '"&Now() - 1&"' AND DATEADD(day,180,'"&Now()&"') AND course.status <> 'Cancelled' ORDER BY course.startdate"

End If




'If user select dates that will come here'
If strDate <> "" Then
	
	'If user selects date if condtion will be executed otherwise else part will be executed'
	If strDate <> "All" Then
	
		strDate = Split(Request.QueryString("date"), "to")
		
		For i = 0 to Ubound(strDate)
		
		strStartDate = FormatDateTime(strDate(0),2)
		strEndDate   = FormatDateTime(strDate(1),2)
		
		Next
	
		strCourses = "SELECT course.courseid,course.city,course.startdate,course.enddate, course.starthour,course.startminute,course.startsession,course.endhour,course.endminute,course.endsession,course.pricewithouttax,course.tax,course.pricewithtax,course.applicabledays,course.afterEBdiscountwithouttax,course.afterEBdiscountwithtax,course.status,course.coursetype,city.state_code, course.country FROM ITIL_course course, ITIL_city city WHERE course.city = city.city And course.startdate='"&strStartDate&"' and course.enddate >= '"&strEndDate&"' And course.country = '"&Session("Country1")&"' AND course.status <> 'Cancelled' ORDER BY course.city"
		
	Else
	
		strCourses = "SELECT course.courseid,course.city,course.startdate,course.enddate, course.starthour,course.startminute,course.startsession,course.endhour,course.endminute,course.endsession,course.pricewithouttax,course.tax,course.pricewithtax,course.applicabledays,course.afterEBdiscountwithouttax,course.afterEBdiscountwithtax,course.status,course.coursetype,city.state_code, course.country FROM ITIL_course course, ITIL_city city WHERE course.city = city.city And course.startdate BETWEEN '"&Now() - 1&"' AND DATEADD(day,180,'"&Now()&"') And course.country = '"&Session("Country1")&"' AND course.status <> 'Cancelled' ORDER BY course.startdate"
		

	
	End If 

End If


objRs.open strCourses,ConnObj

If Not objRs.EOF Then
	arrAllCourses = objRs.getrows
	Session("arrAllCourses") = arrAllCourses
	numRows = Ubound(arrAllCourses,2)
	firstRow = 0
	lastRow = numRows
Else
    message = "No classes scheduled in the "& strCity &" city"
End If

'Creating a table displaying the values in the dates_location.asp page'

Response.Write("<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" align=""center""><tr><td class=""TableRowOdd"" width=""100px""><span class=""HeaderLarge"">Ort</span></td><td class=""TableRowOdd"" width=""100px""><span class=""HeaderLarge"">Datum</span></td><td class=""TableRowOdd"" width=""150px""><span class=""HeaderLarge"">Kurssprache</span></td><td class=""TableRowOdd"" width=""140px""><span class=""HeaderLarge"">Preis</span></td><td class=""TableRowOdd"" width=""100px"">&nbsp;</td></tr>")

	iCount = 0
	
	If IsArray(arrAllCourses) Then
	For rowCounter = firstRow to lastRow			
		
		StartDate = arrAllCourses(2,rowCounter)
		ApplicableDays = arrAllCourses(13,rowCounter)

		'Displaying Only ODD Color'
		If Eval(iCount\2 = iCount/2) Then 
				bgColor = "TableRowEven"
		Else 
				bgColor = "TableRowOdd"
		End If 
					

			'Location - venue'
			If arrAllCourses(17,rowCounter) = "Corporate" Then
			str = "<tr onMouseOver=""javascript:highlightTableRowVersionA(this, '#FFFFCC');""><td class="&bgColor &">" & Trim(arrAllCourses(1,rowCounter))
			Else
            myCity = Split(arrAllCourses(1,rowCounter),"(")
			str = "<tr onMouseOver=""javascript:highlightTableRowVersionA(this, '#FFFFCC');""><td class="&bgColor &"><a href=venue.asp?courseID="&arrAllCourses(0,rowCounter) &" onClick=""return popitup('venue.asp?courseID="&arrAllCourses(0,rowCounter) &"')"">" & Trim(myCity(0)) ' Trim(arrAllCourses(1,rowCounter))
			End If 

			If arrAllCourses(17,rowCounter) = "Corporate" Then
			str = str & "<br>"
			Else
			str = str & "</a><br>"
			End If
			'Date and Timing
			str = str & "</td><td class="&bgColor &">" & DAY(arrAllCourses(2,rowCounter)) & " " & MonthName(Month(arrAllCourses(2,rowCounter)),3) & " "  & YEAR(arrAllCourses(2,rowCounter)) & " to  <br /> "& DAY(arrAllCourses(3,rowCounter)) & " " & MonthName(Month(arrAllCourses(3,rowCounter)),3) & " "  & YEAR(arrAllCourses(3,rowCounter))
			str = str & "</td>"
			'End If
			    myLanguage = Split(arrAllCourses(1,rowCounter),"(")
                mylanguage(1) = Replace(mylanguage(1),")","")

            str = str & "<td class="& bgColor &">"&mylanguage(1) &"</td>"
            'timing removed
			'str = str & "<td class="& bgColor &">"&arrAllCourses(4,rowCounter) &" : "& arrAllCourses(5,rowCounter) &""& arrAllCourses(6,rowCounter) &" - "& arrAllCourses(7,rowCounter) &" : "&arrAllCourses(8,rowCounter)&""& arrAllCourses(9,rowCounter) &"</td>"

			
			If arrAllCourses(17,rowCounter) = "Corporate" Then
		    str = str & "<td class="& bgColor &"><font color=""#FE2E2E""><b>Corporate class</b></font></td>"
		    str = str & "<td class="& bgColor &"><div align=""center""><font size=""3"" color=""#FE2E2E""><b>---</b></font></div></td>"
		   Else 
						
			If (CDate(StartDate)-(Date()+ApplicableDays+1) >= 0) Then
			
			str = str & "<td class="& bgColor &">"

			        str = str & ""& Currency_Format_Front &""& FormatNumber(arrAllCourses(14,rowCounter))&" "&Currency_Format_Back 
					
                    If Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" Then
			
					str= str &" + VAT <br />(Total "&Currency_Format_Front &" "& FormatNumber(arrAllCourses(15,rowCounter)) &" "& Currency_Format_Back &")<sup><font color=""red""><b>*</b></font></sup>" 
					
					Else
					
					str = str & "<sup><font color=""red""><b>*</b></font></sup>"	
		
					End If
					   
				    str = str & "</td>"

	Else
	'PRICE WITH VAT, TAX, GST After EBD'

				
				str = str & "<td class="& bgColor &">"
				
				 str = str & ""& Currency_Format_Front &""& FormatNumber(arrAllCourses(10,rowCounter))&""&Currency_Format_Back	
				
				If  Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" Then
			
				str= str &" + VAT <br />(Total "& Currency_Format_Front &" "& FormatNumber(arrAllCourses(12,rowCounter)) &" "& Currency_Format_Back &")"		  
                End if
			   
               str = str & "</td>"
				
            End If 
			
			
	
			'Enrol Button'
			If arrAllCourses(16,rowCounter) <> "Full" Then
			If arrAllCourses(17,rowCounter) = "WBT" Then 
			
			 If arrAllCourses(0,rowCounter) = "615" Then 
			str = str & "<td class="& bgColor &"><div align=""center""><form action=""/enrollClass.asp"" method=""post""><input type=""hidden"" name=""SelCourseID"" value="&arrAllCourses(0,rowCounter)&" /><input type=""submit"" name=""TypeCourse"" value=""Live"" class=""ButtonSmall""/></form></div></td>"

			   Else 
			str = str & "<td class="& bgColor &"><table colspan=""2""><tr><td><form action=""/enrollClass.asp"" method=""post""><input type=""hidden"" name=""SelCourseID"" value="&arrAllCourses(0,rowCounter)&" /><input type=""hidden"" name=""coursetype"" value="&strCourse&"/><input type=""submit"" name=""TypeCourse"" value=""Live"" class=""ButtonSmall""/></form><form action=""/enrollClass.asp"" method=""post""><input type=""hidden"" name=""SelCourseID"" value="&arrAllCourses(0,rowCounter)&" />"

			str= str &	"<input type=""submit"" name=""TypeCourse"" value=""Enroll"" class=""ButtonSmall""/></form></td></tr></table></td>"
			
			End If
			ElseIf arrAllCourses(17,rowCounter) = "Live" Then 
		str = str & "<td class="& bgColor &"><div align=""center""><form action=""/enrollClass.asp"" method=""post""><input type=""hidden"" name=""SelCourseID"" value="&arrAllCourses(0,rowCounter)&" /><input type=""hidden"" name=""coursetype"" value="&strCourse&" /><input type=""submit"" name=""TypeCourse"" value=""Live"" class=""ButtonSmall""/></form></div></td>"
			Else
			str = str & "<td class="& bgColor &"><div align=""center""><form action=""/enrollClass.asp"" method=""post""><input type=""hidden"" name=""SelCourseID"" value="&arrAllCourses(0,rowCounter)&" /><input type=""hidden"" name=""coursetype"" value="&strCourse&" />"

			str= str &	"<input type=""submit"" name=""TypeCourse"" value=""Book"" class=""ButtonSmall""/></form></div></td>"

			End If 
			Else
			str = str & "<td class="& bgColor &"><img src=""images/back/full.gif"" /></td>"
            End If
			str = str & "</tr>"
		   
		
		    End If
		   
			Response.Write(str)
	iCount = iCount +1 
	
	Next
	End If	
	
	If message <> "" Then
		Response.Write("<tr onMouseOver=""javascript:highlightTableRowVersionA(this, '#FFFFCC');"" height=""50px""><td colspan=""6"" class=""TableRowEven""><div align=""center"">"&message&"</div></td></tr>")
	End If


Response.Write("<tr><td colspan=""6"" class=""TableRowEven"">&nbsp;</td></tr><table><img src=""/images/buttons/loading.gif"" style=""display:none;"" onload=""Timer()"" />")
%>
<!--#include virtual="/includes/connectionClose.asp"-->
