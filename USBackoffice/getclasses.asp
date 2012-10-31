<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<%

'Declare the local variable'
Dim objRs, strCourses
Dim strCity, strDate, strStartDate,strEndDate 
Dim arrAllCourses, firstRow, lastRow, numRows, rowCounter
Dim rqcount
Dim rqCoursedate,rqcourse
'Creating Record object''
Set objRs=Server.CreateObject("ADODB.Recordset")

'Retriving the values from dates_location.asp page through AJAX'
rqCourseID = Request.QueryString("CourseID")



'Price Format Display Functions'
Currency_Format_Front = CurrencyFormat_Front(Session("CountryOrigin"))

Currency_Format_Back = CurrencyFormat_Back(Session("CountryOrigin"))

'If user select City that will come here'
strCourses = "Select * from ITIL_enrolledusers WHERE courseid = '"&rqCourseID&"'"

objRs.Open strCourses,ConnObj

rqcount = 0

DO Until objRs.EOF

rqcount = int(rqcount) + int(1)
 
objRs.Movenext
Loop 
objRs.Close

Str = "<td colspan=""2""><span><table width=""100%"" class=""table2""><tr><td width=""15%"">Attended Students: </td><td><input type=""text"" name=""EnrollNo"" id=""EnrollNo"" size=""10"" value="&rqcount&" ></td></tr><tr><td>Class Size:</td><td><select name=""Students"" id=""Students""><option value=""Select"">---------Select---------</option>"

If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then

strNoofStudents = "SELECT noofstudents FROM payment_matrix WHERE (country = 'US' OR country = 'Canada')"

Else

strNoofStudents = "SELECT noofstudents FROM payment_matrix WHERE country = 'Other'"

End If

objRs.Open strNoofStudents, ConnObj

Do Until objRs.EOF

Str = Str &"<option value='"& objRs("noofstudents") &"'>"&objRs("noofstudents")&"</option>"

objRs.Movenext
Loop
objRs.Close

Str = Str &"</select></td></tr><tr><td>Distance:</td><td><select name=""distance"" id=""distance"" onchange=""getpayment();""><option value="""">---------Select---------</option><option value=""Less than 60 miles"">Less than 60 miles</option><option value=""60 to 200 miles"">60 to 200 miles</option><option value=""More than 200 miles"">More than 200 miles</option></select></td></tr></table></form></span></td>"



response.write(Str)

%>
<!--#include virtual="/includes/connectionClose.asp"-->
 
