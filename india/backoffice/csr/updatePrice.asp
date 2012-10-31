<!--#include virtual="/india/connection.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Update Price</title>
</head>

<body>
</body>

<% 


'getting Value From updatePeice-uk.asp Page
Dim courseName,Country,city,fromDate,toDate,withTax,withoutTax,ebd,ebdWith,ebdWithout

courseNumber = Trim(Request.Form("courseName"))
Country =Trim(Request.Form("Country"))
city = Trim(Request.Form("city"))
fromDate = Trim(Request.Form("fromDate"))
toDate = Trim(Request.Form("toDate"))
withoutTax = Trim(Request.Form("priceWithOutTax"))
tax = Trim(Request.Form("tax"))
withTax = Trim(Request.Form("priceWithTax"))
ebd = Trim(Request.Form("earlybirddicount"))
ebdWithout = Trim(Request.Form("afterearlybirddiscountwithouttax"))
ebdWith = Trim(Request.Form("afterearlybirddiscountwithtax"))
applicabledays =  Trim(Request.Form("applicabledays"))

rqBrand = Trim(Request.Form("brand"))
'response.Write(rqBrand)

'End Of getting Value From updatePeice-uk.asp Page

'Declaring'
Dim strQuery,rsUpdate

'Recordset'
Set rsUpdate = server.CreateObject("ADODB.recordset")


If courseNumber = "1" Then
	courseName = "Normal"
ElseIf courseNumber = "2" Then
	courseName = "Corporate"
ElseIf courseNumber = "3" Then
	courseName = "Live"
ElseIf courseNumber = "4" Then
	courseName = "WBT"
ElseIf courseNumber = "5" Then
	courseName = "OSA"
ElseIf courseNumber = "5" Then
	courseName = "CSI"

End If


'Getting values for foundation
	
				'	 strGetQuery = "SELECT course.*, city.state_code, course.startdate, course.enddate FROM course course, city city Where city.city='"& city &"' And course.city = city.city And  course.country = '"& Country &"' AND city.country = '"& Country &"' And courseName= '"& courseName &"' and  course.status <> 'Cancelled' and startdate >='"& fromDate &"' And startdate <='"& toDate &"'  ORDER BY month(course.startdate) ,course.city DESC"
'		
			 

If city <> ""  Then
		
			strQuery = "UPDATE ITIL_course SET pricewithouttax = '"& withoutTax &"', tax= '"& tax &"', pricewithtax = '"& withTax &"', applicabledays= '"& applicabledays &"', earlybirddiscount = '"& ebd &"' , afterEBdiscountwithouttax = '"& ebdWithout &"', afterEBdiscountwithtax = '"& ebdWith &"' WHERE city = '"& city &"' and startdate >='"& fromDate &"' and startdate <='"& toDate &"' and country = '"& Country &"'  And coursetype= '"& courseName &"' And status <> 'Cancelled'"
						
	'response.write strQuery
			rsUpdate.Open strQuery,Conn
			
ElseIF city = "" Then

			strQuery = "UPDATE ITIL_course SET pricewithouttax = '"& withoutTax &"', tax= '"& tax &"', pricewithtax = '"& withTax &"', applicabledays= '"& applicabledays &"', earlybirddiscount = '"& ebd &"' , afterEBdiscountwithouttax = '"& ebdWithout &"', afterEBdiscountwithtax = '"& ebdWith &"' WHERE startdate >='"& fromDate &"' and startdate <='"& toDate &"' and country = '"& Country &"'  And coursetype= '"& courseName &"' And status <> 'Cancelled'"
						
	'response.write strQuery
			rsUpdate.Open strQuery,Conn


End If
			
%>
Inserted: From <%= fromDate %> To <%= toDate %>For <%= courseName%> <BR>
		

</html>
