<!--#include virtual="/includes/connection.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
</body>

<% 
'Declaring'
Dim strQuery,strGetQuery
Dim Country

'Recordset'
Set Rs = server.CreateObject("ADODB.recordset")
Set Rs1 = server.CreateObject("ADODB.recordset")
Set rsQues = server.CreateObject("ADODB.recordset")






'Getting values for foundation
	
					 strGetQuery = "SELECT ITIL_course.*, ITIL_city.state_code, ITIL_course.startdate, ITIL_course.enddate FROM ITIL_course ITIL_course, ITIL_city ITIL_city Where ITIL_course.city = ITIL_city.city  AND ITIL_city.country = 'India' and  ITIL_course.coursetype = 'Normal'  and  ITIL_course.status <> 'Cancelled' and ITIL_course.startdate >'"&now()&"'  ORDER BY month(ITIL_course.startdate) ,ITIL_course.city DESC"
					 
					 
					Response.Write(strGetQuery & "<br>")
					 	
				    Rs.Open strGetQuery,ConnObj
	
					 If Not Rs.EOF Then
			
						arrAllCourses = Rs.getrows
						Session("arrAllCourses") = arrAllCourses
						numRows = Ubound(arrAllCourses,2)
						firstRow = 0
						lastRow = numRows
					  End If
	
					  Rs.Close
					  

'For i = 1 to 900

			
	If IsArray(arrAllCourses)  Then
		
	For rowCounter = firstRow to lastRow 
	
		courseDate = arrAllCourses(3,rowCounter)
		Response.Write(courseDate)


		
			strQuery = "UPDATE ITIL_course SET earlybirddiscount = '500' WHERE  startdate > '"&now()&"' and country = 'India' and  coursetype = 'Normal'"
						
		    Response.Write(strQuery & "<br>")
	
			rsQues.Open strQuery,connObj
			
%>
Inserted: For <%= pricewithouttax %> & <%= afterEBdiscountwithouttax %> for India <BR>
		
<%
	
	 Next	
	 End IF
	 

%>

</html>
