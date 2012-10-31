<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<%
If Session("USBUserId") = "" Then
	Response.Redirect("/USBackoffice/login.asp")
Else
%>

<%'In Enrolled but not paid  based on the website slected connection will be worked%>

<!--#include virtual="/includes/connection.asp"-->

<%
'Declare The Variables'
Dim strCallDet, strUSCity, strCanadaCity
Dim objRs, objRsUSCity, objRsCID, objRsCanadaCity, objRsState
Dim arrAllCallDet
Dim firstRow, lastRow, numRows
Dim rqPage, rqRow, rowcounter
Dim CallID, rqPaymentNotRec
Dim arrAllPayNotRec
Dim payNotRecFirstRow, payNotRecLastRow, payNotRecNumRows
Dim rqAction, rqPayNotRecRow, payNotRecRowcounter
Dim enrollId
Dim strPayment1, strPayment2, strPayment3, strPayment4
Dim disp, strPayNotRec
Dim rqCity, rqName, searchName, searchLastName, searchCity
Dim rqLastName, strCourseIds
Dim strPayNotRec1, strPayNotRec2, strPayNotRec3, strPayNotRec4, strStates
Dim rqState, strSendmails, strMail, objRsMail, rqType
Dim objRsCity, strCity,iPageCurrent

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRsUSCity = Server.CreateObject("ADODB.Recordset")
Set objRsCanadaCity = Server.CreateObject("ADODB.Recordset")
Set objRsCity = Server.CreateObject("ADODB.Recordset")
Set objRsCID = Server.CreateObject("ADODB.Recordset")
Set objRsState = Server.CreateObject("ADODB.Recordset")
Set objRsMail = Server.CreateObject("ADODB.Recordset")
Set objRsCallID = Server.CreateObject("ADODB.Recordset")

'Displaying all the Call Received and Enrolled Users code start here'
rqPage = Request.QueryString("page")

If Request.QueryString("action") <> "" Then
	rqAction = Request.QueryString("action")
Else
	rqAction = Request.Form("action")
End If	

If Request.Form("type") <> "" Then
	rqType = Request.Form("type")
Else
	rqType = Request.QueryString("type")
End If
	
rqPage = Request.QueryString("page")
rqRow = Request.QueryString("row")

'Retrive the values from serach option in this page'
If Request.Form("city") <> "" Then
	rqCity = Request.Form("city")
Else
	rqCity = Request.QueryString("city")
End If


'Retrive the values from serach option in this page'
If Request.Form("state") <> "" Then
	rqState = Request.Form("state")
Else
	rqState = Request.QueryString("state")
End If

If Request.Form("name") <> "" Then
	rqName = Request.Form("name")
Else
	rqName = Request.QueryString("name")
End If

searchName = Trim(rqName)

searchCity = rqCity

 

strCity = "SELECT city,state_code FROM ITIL_city WHERE country = '"& Session("CRM_Country") &"' ORDER BY city"

objRsCity.Open strCity,ConnObj




'Display the queries country wise'
If Session("CRM_Country") = "India" Then
	strCountry = "India"

ElseIf Session("CRM_Country") = "US" Then
	strCountry = "US"
End If	

'Display the queries country wise'
If Session("CRM_Country") = "India" Then
	strCountry1 = "(country = 'India')"
ElseIf Session("CRM_Country") = "US" Then
	strCountry1 = "(country = 'US')"

End If	


'Retriving the allocated states based on assigned states to the faculty'
strStates = "SELECT states, statecode From ITIL_states WHERE (fac_emailid1 = '"& Session("USBUserId") &"' OR fac_emailid2 = '"& Session("USBUserId") &"' OR fac_emailid3 = '"& Session("USBUserId") &"' OR fac_emailid4 = '"& Session("USBUserId") &"' OR fac_emailid5 = '"& Session("USBUserId") &"') ORDER BY states"
				

objRsState.Open strStates, ConnObj


i = 0
Do Until objRsState.EOF
	
	
	If i = 0 Then
		assignedStates = "'" & objRsState("states") & "'"
	Else
		assignedStates = "'" & objRsState("states") &"',"& assignedStates 
	End If
	
	i = i + 1
	
objRsState.Movenext
Loop
objRsState.Close


''If country is US, Canada or United Kingdom then display based on state else show all the queries'
'If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then
'	
'	If assignedStates <> "" Then
'		assignedStates = assignedStates
'	Else
'		assignedStates = "'" & "'"
'	End If
'	
'ElseIf Session("CRM_Country") = "UAE" Then
'	
'	assignedStates = "'Sharjah','Abu Dhabi','Dubai'" 
'	
'ElseIf Session("CRM_Country") = "Singapore" Then
'	
'	assignedStates = "'Singapore'" 
'	
'End If
 

If rqAction = "paymentNotRec" OR rqAction = "paymentRec" Then


		If rqAction = "paymentNotRec" Then
			
			If Session("TypeOfUser") = "Admin" Then
			
				'If user selects city in the drop down that will come here'
				If rqCity <> "" Then
		
					strPayNotRec = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ITIL_enrolledusers WHERE (checkreceived Is Null OR checkreceived <> 'Yes') AND "& strCountry1 &" And coursedetails like '%"&searchCity&"%' And (us_status Is Null OR us_status = 'Active')  ORDER BY id desc"
		
				'If user entered lastname in the serach option that will come here'
				ElseIf rqName <> "" Then
		
					strPayNotRec = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ITIL_enrolledusers WHERE (checkreceived Is Null OR checkreceived <> 'Yes') AND "& strCountry1 &" And (firstname like '%"&searchName&"%' OR lastname like '%"&searchName&"%' OR email like '%"&searchName&"%') And (us_status Is Null OR us_status = 'Active') ORDER BY id desc"
		
				ElseIf rqCity = "" And rqName = "" OR rqWebsite <> ""  Then
		
		
				strCourseIds = "SELECT courseid FROM ITIL_course Where startdate >= '"&now()&"'"
		
				objRsCID.Open strCourseIds,ConnObj
		
				Do Until objRsCID.EOF
		
					strPayNotRec1 = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ITIL_enrolledusers WHERE (checkreceived Is Null OR checkreceived <> 'Yes') AND "& strCountry1 &" And (us_status Is Null OR us_status = 'Active')"
		
					strPayNotRec2 = strPayNotRec1 & " And courseid = '"&objRsCID("courseid")&"'"
		
					If strPayNotRec <> "" Then
					strPayNotRec3 = " UNION ALL "
					End If
		
					strPayNotRec = strPayNotRec &  strPayNotRec3 & strPayNotRec2
		
					objRsCID.Movenext
				Loop
				objRsCID.Close
		
					strPayNotRec = strPayNotRec & " ORDER BY id desc"
		
				End If
			
				
			
			Else 
			
				'If user selects city in the drop down that will come here'
				If rqCity <> "" Then
		
					strPayNotRec = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ITIL_enrolledusers WHERE (checkreceived Is Null OR checkreceived <> 'Yes') AND "& strCountry1 &" And coursedetails like '%"&searchCity&"%' And (us_status Is Null OR us_status = 'Active')  And ROUND (cast ((datediff (minute,dateofenrollment,getdate()) / 60.0) as FLOAT), 2)  >= 24 ORDER BY id desc"
		
				'If user entered lastname in the serach option that will come here'
				ElseIf rqName <> "" Then
		
					strPayNotRec = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ITIL_enrolledusers WHERE (checkreceived Is Null OR checkreceived <> 'Yes') AND "& strCountry1 &" And (firstname like '%"&searchName&"%' OR lastname like '%"&searchName&"%' OR email like '%"&searchName&"%') And (us_status Is Null OR us_status = 'Active')  And ROUND (cast ((datediff (minute,dateofenrollment,getdate()) / 60.0) as FLOAT), 2)  >= 24 ORDER BY id desc"
		
				ElseIf rqCity = "" And rqName = "" OR rqWebsite <> "" Then
		
		
				strCourseIds = "SELECT courseid FROM ITIL_course Where startdate >= '"&now()&"'"
		
				objRsCID.Open strCourseIds,ConnObj
		
				Do Until objRsCID.EOF
		
					strPayNotRec1 = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ITIL_enrolledusers WHERE (checkreceived Is Null OR checkreceived <> 'Yes') AND "& strCountry1 &" And (us_status Is Null OR us_status = 'Active') And ROUND (cast ((datediff (minute,dateofenrollment,getdate()) / 60.0) as FLOAT), 2)  >= 24"
		
					strPayNotRec2 = strPayNotRec1 & " And courseid = '"&objRsCID("courseid")&"'"
		
					If strPayNotRec <> "" Then
					strPayNotRec3 = " UNION ALL "
					End If
		
					strPayNotRec = strPayNotRec &  strPayNotRec3 & strPayNotRec2
		
					objRsCID.Movenext
				Loop
				objRsCID.Close
		
					strPayNotRec = strPayNotRec & " ORDER BY id desc"
		
				End If
			
		End If

	ElseIf rqAction = "paymentRec" Then

		'If user selects city in the drop down that will come here'
		If rqCity <> "" Then

			strPayNotRec = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ITIL_enrolledusers  WHERE checkreceived = 'Yes' And status = 'Active' AND "& strCountry1 &" And coursedetails like '%"&searchCity&"%' And (us_status Is Null OR us_status = 'Active') ORDER BY id desc"

		'If user entered lastname in the serach option that will come here'
		ElseIf rqName <> "" Then

			strPayNotRec = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ITIL_enrolledusers  WHERE checkreceived = 'Yes' And status = 'Active' AND "& strCountry1 &" And (firstname like '%"&searchName&"%' OR lastname like '%"&searchName&"%' OR email like '%"&searchName&"%') And (us_status Is Null OR us_status = 'Active') ORDER BY id desc"

		ElseIf rqCity = "" And rqName = "" OR rqWebsite <> "" Then

		strCourseIds = "SELECT courseid FROM ITIL_course Where startdate >= '"&now()&"'"

		objRsCID.Open strCourseIds,ConnObj

		Do Until objRsCID.EOF

			strPayNotRec1 = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ITIL_enrolledusers WHERE checkreceived = 'Yes' And status = 'Active' AND "& strCountry1 &" And (us_status Is Null OR us_status = 'Active')"
						strPayNotRec2 = strPayNotRec1 & " And courseid = '"&objRsCID("courseid")&"'"

			If strPayNotRec <> "" Then
			strPayNotRec3 = " UNION ALL "
			End If

			strPayNotRec = strPayNotRec &  strPayNotRec3 & strPayNotRec2

        objRsCID.Movenext
		Loop
		objRsCID.Close

			strPayNotRec = strPayNotRec & " ORDER BY id desc"

		End If

	End If

	objRs.Open strPayNotRec, ConnObj
'response.Write(strPayNotRec)
	If Not objRs.EOF Then
		arrAllPayNotRec = objRs.getrows
		payNotRecFirstRow = 0
		payNotRecLastRow = 9
		payNotRecNumRows = Ubound(arrAllPayNotRec,2)
		If payNotRecLastRow > payNotRecNumRows Then
		   payNotRecLastRow = payNotRecNumRows
		End If
	End If

	objRs.Close
	
	'getting values for pagination

	If rqPage = "next" Then

	   payNotRecNumRows = Ubound(arrAllPayNotRec,2)

	   payNotRecFirstRow = rqRow + 1
	   payNotRecLastRow = payNotRecFirstRow + 9

	   If payNotRecFirstRow >= payNotRecNumRows Then
		  payNotRecFirstRow = rqRow + 1
		  payNotRecLastRow = payNotRecFirstRow + 9
	   End If

	   If payNotRecFirstRow < 0 Then
		  payNotRecFirstRow = 0
	   End If

	   If payNotRecLastRow > payNotRecNumRows Then
		  payNotRecLastRow = payNotRecNumRows
	   End If

	End If

	If rqPage = "previous" Then

	   payNotRecNumRows = Ubound(arrAllPayNotRec,2)

	   payNotRecLastRow = rqRow - 1
	   payNotRecFirstRow = payNotRecLastRow - 9

	   If payNotRecFirstRow =< 0 Then
		  payNotRecFirstRow = 0
		  payNotRecLastRow = payNotRecFirstRow + 9
	   End If

	   If payNotRecLastRow > payNotRecNumRows Then
		  payNotRecLastRow = payNotRecNumRows
	   End If

	End If
 'End If

Else

If rqAction = "noFollowUp" Then

	'If user select city in the city dropdown of No Follow Up calls that will come here'
	If rqState <> "" Then

	'Retrive the not follow up calls details based on city search'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '1' And callfor = 'Classroom' And callerstate = '"&rqState&"' And country = '"& strCountry &"' And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"

	'If user entered name in the serach of No Follow Up calls that will come here'
	ElseIf rqName <> "" Then

	'Retrive the not follow up calls details based on lastname'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '1' And callfor = 'Classroom' And (callername like '%"&searchName&"%' OR emailid like '%"& searchName &"%') And country = '"& strCountry &"'  And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"

	'If user as a admin, i am showing all the cities'
	ElseIf Session("TypeOfUser") = "Admin" And rqType = "" Then

	'Retrive the not follow up calls details for all the cities (ADMIN)'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '1'  And country = '"& strCountry &"' ORDER BY callid desc"
'response.Write(strCallDet)
	'If user as a admin, i am showing all the cities'
	ElseIf Session("TypeOfUser") = "Admin" And rqType = "Corporate" Then

	'Retrive the not follow up calls details for all the cities (ADMIN)'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '1' And country = '"& strCountry &"' And callfor = 'Corporate'  ORDER BY callid desc"
	
	ElseIf Session("TypeOfUser") = "Faculty" And rqType = "" Then

	'Retrive the not follow up calls details based on city'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '1' And (callerstate in ("& assignedStates &")  OR addedby = '"& Session("USBUserId") &"') And (callfor = 'Classroom' OR callfor = 'Corporate') And country = '"& strCountry &"' And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"
		
	ElseIf Session("TypeOfUser") = "Faculty" And rqType = "Corporate" Then
	
	'Retrive the not follow up calls details based on city'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '1'  And (callerstate in ("& assignedStates &")  OR addedby = '"& Session("USBUserId") &"') And callfor = 'Corporate' And country = '"& strCountry &"' And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"
	
	End If

ElseIf rqAction = "followUp" Then

	'If user select city in the city dropdown of Follow Up calls that will come here'
	If rqState <> "" Then

	'Retrive the not follow up calls details based on city search'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '2' And callfor = 'Classroom' And callerstate = '"&rqState&"' And country = '"& strCountry &"' And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"

	'If user entered name in the serach of Follow Up calls that will come here'
	ElseIf rqName <> "" Then

	'Retrive the follow up calls details based on lastname'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '2' And callfor = 'Classroom' And (callername like '%"&searchName&"%' OR emailid like '%"& searchName &"%') And  country = '"& strCountry &"' And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"

	'If user as a admin, i am showing all the cities'
	ElseIf Session("TypeOfUser") = "Admin" And rqType = "" Then

	'Retrive the follow up calls details for all the cities (ADMIN)'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '2'  And country = '"& strCountry &"' ORDER BY callid desc"

	'If user as a admin, i am showing all the cities'
	ElseIf Session("TypeOfUser") = "Admin" And rqType = "Corporate" Then

	'Retrive the follow up calls details for all the cities (ADMIN)'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '2' And '"& strCountry &"' And callfor = 'Corporate' ORDER BY callid desc"
	
	ElseIf Session("TypeOfUser") = "Faculty" And rqType = "" Then

	'Retrive the follow up calls details based on city'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '2' And (callerstate in ("& assignedStates &") OR addedby = '"& Session("USBUserId") &"') And (callfor = 'Classroom' OR callfor = 'Corporate') And country = '"& strCountry &"' And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"

	ElseIf Session("TypeOfUser") = "Faculty" And rqType = "Corporate" Then
	
	'Retrive the not follow up calls details based on city'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '2'  And (callerstate in ("& assignedStates &") OR addedby = '"& Session("USBUserId") &"') And callfor = 'Corporate' And country = '"& strCountry &"' And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"
	
	ElseIf rqType = "ByFaculty" Then
	
	'Retriving call ids based on faculty email id'
	strQuery = "SELECT distinct callid FROM fac_comments_new WHERE comm_addedby = '"& Session("USBUserId") &"' ORDER BY callid DESC"

	objRsCallID.Open strQuery, ConnObj
	
	'Intializing i value as zero'
	i = 0 
	
	Do Until objRsCallID.EOF
	
	'Retrive the follow up calls details based on city'
	strCallDet1 = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '2' And (callfor = 'Classroom' OR callfor = 'Corporate') And (call_status2 Is Null OR call_status2 <> 'Dummy')  And country = '"& strCountry &"' And callid = '"& objRsCallID("callid") &"'"
	
	If i = 0 Then
	
		strCallDet2 = strCallDet1
	
	Else
	
		strCallDet2 = strCallDet2 & " UNION " & strCallDet1
	
	End If
	
	strCallDet = strCallDet2 & "  ORDER BY callid desc"

	i = i + 1
	
	objRsCallID.Movenext
	Loop
	objRsCallID.Close
	
	End If

ElseIf rqAction = "closed" Then

	'If user select city in the city dropdown of Closed calls that will come here'
	If rqState <> "" Then

	'Retrive the closed calls details based on city search'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '3' And callfor = 'Classroom' And callerstate = '"&rqState&"'  And country = '"& strCountry &"' And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"

	'If user entered name in the serach of Closed calls that will come here'
	ElseIf rqName <> "" Then

	'Retrive the Closed calls details based on lastname'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '3' And callfor = 'Classroom' And (callername like '%"&searchName&"%' OR emailid like '%"& searchName &"%')  And country = '"& strCountry &"' And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"

	'If user as a admin, i am showing all the cities'
	ElseIf Session("TypeOfUser") = "Admin" And rqType = "" Then


	'Retrive the Closed calls details for all the cities (ADMIN)'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '3'  And country = '"& strCountry &"' ORDER BY callid desc"
	
	'If user as a admin, i am showing all the cities'
	ElseIf Session("TypeOfUser") = "Admin" And rqType = "Corporate" Then

	'Retrive the Closed calls details for all the cities (ADMIN)'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '3'  And country = '"& strCountry &"'  And callfor = 'Corporate' ORDER BY callid desc"	

	ElseIf Session("TypeOfUser") = "Faculty" And rqType = "" Then

	'Retrive the Closed calls details based on city'
   	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '3' And (callerstate in ("& assignedStates &") OR addedby = '"& Session("USBUserId") &"') And (callfor = 'Classroom' OR callfor = 'Corporate')  And country = '"& strCountry &"' And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"

	ElseIf Session("TypeOfUser") = "Faculty" And rqType = "Corporate" Then
	
	'Retrive the not follow up calls details based on city'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '3'  And (callerstate in ("& assignedStates &") OR addedby = '"& Session("USBUserId") &"') And callfor = 'Corporate'  And country = '"& strCountry &"' (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"

	ElseIf rqType = "ByFaculty" Then
	
	'Retriving call ids based on faculty email id'
	strQuery = "SELECT distinct fcn.callid FROM fac_comments_new fcn, ITIL_callsreceived_new cn  WHERE fcn.comm_addedby = '"& Session("USBUserId") &"'"
	
	objRsCallID.Open strQuery, ConnObj
	
	'Intializing i value as zero'
	i = 0 
	
	Do Until objRsCallID.EOF
	
	'Retrive the follow up calls details based on city'
	strCallDet1 = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '3' And (callfor = 'Classroom' OR callfor = 'Corporate')  And country = '"& strCountry &"' And (call_status2 Is Null OR call_status2 <> 'Dummy') And callid = '"& objRsCallID("callid") &"'"
	
	If i = 0 Then
	
		strCallDet2 = strCallDet1
	
	Else
	
		strCallDet2 = strCallDet2 & " UNION " & strCallDet1
	
	End If
	
	strCallDet = strCallDet2 & " ORDER BY callid desc"

	i = i + 1
	
	objRsCallID.Movenext
	Loop
	objRsCallID.Close

	End If

End If
'response.Write(strCallDet)
objRs.Open strCallDet, ConnObj

If Not objRs.EOF Then
	arrAllCallDet = objRs.getrows
	firstRow = 0
	lastRow = 9
	numRows = Ubound(arrAllCallDet,2)
	If lastRow > numRows Then
	   lastRow = numRows
	End If
End If

objRs.Close

If rqPage = "next" Then

   numRows = Ubound(arrAllCallDet,2)

   firstRow = rqRow + 1
   lastRow = firstRow + 9

   If firstRow >= numRows Then
      firstRow = rqRow + 1
      lastRow = firstRow + 9
   End If

   If firstRow < 0 Then
      firstRow = 0
   End If

   If lastRow > numRows Then
      lastRow = numRows
   End If

End If

If rqPage = "previous" Then

   numRows = Ubound(arrAllCallDet,2)

   lastRow = rqRow - 1
   firstRow = lastRow - 9

   If firstRow =< 0 Then
      firstRow = 0
      lastRow = firstRow + 9
   End If

   If lastRow > numRows Then
      lastRow = numRows
   End If

End If

End If

'Displaying all the Call Received and Enrolled Users code end here'



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Marketing B2C</title>
<!-- CSS -->
<link href="css/style1.css" rel="stylesheet" type="text/css" media="screen" />
<script language="javascript">
function Form_Validator(theform)
{

	if (theform.comment.value == "")
	{
	 alert("Please enter the comment");
	 theform.comment.focus();
	 return (false);
	}

}

function Form_Validator1(theform)
{

	if (theform.status.value == "")
	{
	 alert("Please select the status");
	 theform.status.focus();
	 return (false);
	}

}

function getQueries() {

    document.forms["myform"].submit();

}

</script>
</head>
<body>
<div id="wrapper">
  <!--#include file="includes/topMenu.asp"-->
  <!-- // #end mainNav -->
  <div id="containerHolder" style="width:1400px;">
    <div id="container"  style="width:1400px;">
      <div id="sidebar">
        <!--#include file="includes/leftMenu.asp"-->
        <!-- // .sideNav -->
      </div>
      <!-- // #sidebar -->
      <!-- h2 stays for breadcrumbs -->
      <h2><a href="home.asp">Home</a> &raquo; <a href="marketingB2C.asp?action=noFollowUp" class="active">Marketing B2C</a> &raquo;
        <% If rqAction = "noFollowUp" Then %>
        Calls to be made
        <% ElseIf rqAction = "followUp" Then %>
        Calls to be followed up
        <% ElseIf rqAction = "closed" Then %>
        Closed calls
        <% ElseIf rqAction = "paymentNotRec" Then %>
        Payment not received
        <% ElseIf rqAction = "paymentRec" Then %>
        &raquo; Payment received
        <% End If %>
      </h2>
	  
      <div>&nbsp;</div>

      <div style="margin-left:200px;">
        <table width="65%" class="table2">
          <tr><br />
            <td width="15%">
			
			<form action="newCall.asp" method="post">
			
                <input type="submit" value="Add New Prospect" />
              </form></td>
            <td width="15%">
            <form action="/enrolClass.asp" method="post" target="_blank">
                <input type="hidden" name="usInstEmailId" value="<% = Session("USBUserId") %>" />
                <input type="submit" value="Add New Enrollment" />
              </form></td>
              <% If (rqAction <> "paymentNotRec" AND rqAction <> "paymentRec") Then  %>
              <% If Session("TypeOfUser") = "Faculty" Then %>
            <form action="marketingB2C.asp" method="post">
            <td  width="65%">Calls made by <% = Session("FirstName") %>&nbsp;<% = Session("LastName") %>: 
         		<input type="hidden" value="ByFaculty" name="type" />
            	<select name="action">
                	<option value="">-Select-</option>
                	<option value="followUp">Calls to be followed up</option>
                    <option value="closed">Closed calls</option>
                </select>
               <input type="submit" value="Submit" />
            </td>
            </form>
            <% Else %>
            <td width="65%">&nbsp;</td>
            <% End If %>
            <% End If %>
          </tr>
        </table>
      </div>
      <div>&nbsp;</div>
      <div id="topbar" style="margin-left:25px;">
        <ul class="topNav">
          <li><a href="marketingB2C.asp?action=noFollowUp">Calls to be made </a></li>
        </ul>
      </div>
      <div id="topbar" style="margin-left:-20px;">
        <ul class="topNav">
          <li><a href="marketingB2C.asp?action=followUp">Calls to be followed up </a></li>
        </ul>
      </div>
      <div id="topbar" style="margin-left:5px;">
        <ul class="topNav">
          <li><a href="marketingB2C.asp?action=closed">Closed calls </a></li>
        </ul>
      </div>
      <div id="topbar" style="margin-left:-15px;">
        <ul class="topNav">
          <li><a href="marketingB2C.asp?action=paymentNotRec">Enrolled but not paid </a></li>
        </ul>
      </div>
      <div id="topbar" style="margin-left:10px;">
        <ul class="topNav">
          <li><a href="marketingB2C.asp?action=paymentRec">Enrolled paid</a></li>
        </ul>
      </div>
	  <div id="main">
        <% If rqAction = "paymentNotRec" OR rqAction = "paymentRec" Then %>
         <table width="900px" class="table2">
          <tr><br />
        
            <form action="marketingB2C.asp?action=<% = rqAction %>" method="post">
              <td width="200px">City:
                <select name="city" style="width:150px;">
                  <option value="">-Select-</option>
				  <% Do Until objRsCity.EOF %>
                  <option <% If rqCity = objRsCity("city") Then %> selected="selected" <% End If %> value="<% = objRsCity("city") %>">
                  <% = objRsCity("city") %>                  </option>
                  <% objRsCity.Movenext
				   Loop
				   objRsCity.Close %>
				 
                </select>
                <input type="submit" name="search" value="Search" />
              </td>
            </form>
            <form action="marketingB2C.asp?action=<% = rqAction %>" method="post">
              <td width="200px">Name/Email ID:
                <input type="text" name="name" size="15" value="<% = rqName %>" />
                <input type="submit" name="search" value="Search" />
              </td>
            </form>
          </tr>
        </table>
        <table width="900px">
          <tr>
            <td width="25%"><% If rqAction = "paymentNotRec" Then %>
              <h3>Payment Not Received</h3>
              <% ElseIf rqAction = "paymentRec" Then %>
              <h3>Payment Received</h3>
              <% End If %>
            </td>
           </tr>
         </table>

		<div>&nbsp;</div>
        <fieldset>
        <table border="2" cellpadding="0" cellspacing="0" class="table1" width="900px">
          <tr>
            <td bgcolor="#A7DBFB" align="center"><b>Name</b></td>
            <td bgcolor="#A7DBFB" align="center" width="50%"><b>Course Details</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Phone Number</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Email Id</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Name of Employer</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Date of Enrollment</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Comments</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>History</b></td>
            <% If rqAction = "paymentNotRec" Then %>
            <td bgcolor="#A7DBFB" align="center"><b>Status</b></td>
            <% End If %>
          </tr>
          <% If IsArray(arrAllPayNotRec) Then
						      For payNotRecRowcounter = payNotRecFirstRow To payNotRecLastRow
							  enrollId = arrAllPayNotRec(7,payNotRecRowcounter) %>
          <% If arrAllPayNotRec(8,payNotRecRowcounter) <> "" And arrAllPayNotRec(8,payNotRecRowcounter) <> "Active" Then %>
          <tr class="even">
            <% Else %>
          <tr>
            <% End If %>
            <td><% = arrAllPayNotRec(0,payNotRecRowcounter) %>
              &nbsp;
              <% = arrAllPayNotRec(1,payNotRecRowcounter) %></td>
            <td><% = arrAllPayNotRec(5,payNotRecRowcounter) %></td>
            <td><% = arrAllPayNotRec(4,payNotRecRowcounter) %></td>
            <td><% = arrAllPayNotRec(2,payNotRecRowcounter) %></td>
            <td><% = arrAllPayNotRec(3,payNotRecRowcounter) %></td>
            <td><% = arrAllPayNotRec(6,payNotRecRowcounter) %></td>
            <form name="comment" action="addEnrollComments.asp" method="post" onsubmit="return Form_Validator(this)">
              <input type="hidden" name="enrollid" value="<% = enrollId %>">
              <input type="hidden" name="action" value="<% = rqAction %>" />
              <input type="hidden" name="page" value="<% = rqPage %>" />
              <input type="hidden" name="row" value="<% = rqRow %>" />
              <input type="hidden" name="city" value="<% = rqCity %>" />
              <input type="hidden" name="name" value="<% = rqName %>" />
              <td><Textarea name="comment" rows="5" cols="20" ></Textarea>
                <input type="submit" name="type" value="Save">
            </form>
            </td>
            <td><iframe src="enroll_comments.asp?enrollid=<% = enrollId %>" frameborder="0" height="100" scrolling="yes" width="200"></iframe></td>
            <form name="comment" action="addEnrollComments.asp" method="post" onsubmit="return Form_Validator1(this)">
              <input type="hidden" name="enrollid" value="<% = enrollId %>">
              <input type="hidden" name="action" value="<% = rqAction %>" />
              <input type="hidden" name="page" value="<% = rqPage %>" />
              <input type="hidden" name="row" value="<% = rqRow %>" />
              <input type="hidden" name="city" value="<% = rqCity %>" />
              <input type="hidden" name="lastname" value="<% = rqName %>" />
              <td><br />
                <% If rqAction = "paymentNotRec" Then %>
                <% If IsNull(arrAllPayNotRec(8,payNotRecRowcounter)) Then %>
                <select name="status">
                  <option value="">--Select--</option>
                  <option value="Dummy">Dummy</option>
                  <option value="Closed enrollment - student not interested">Closed enrollment - student not interested</option>
                </select>
                <br />
                <br />
                <input type="submit" name="type" value="Submit" />
                <% Else %>
                <select name="status">
                  <option value="">--Select--</option>
                  <option value="Dummy">Dummy</option>
                  <option value="Closed enrollment - student not interested">Closed enrollment - student not interested</option>
                </select>
                <br />
                <br />
                <input type="submit" name="type" value="Submit" />
                <% = arrAllPayNotRec(8,payNotRecRowcounter) %>
                added by
                <% = arrAllPayNotRec(9,payNotRecRowcounter) %>
                <% End If %>
                <% End If %>
              </td>
            </form>
            <!-- <td class="action"><a href="payNotReceived.asp?enrollUserId=<% '=  enrollId %>" class="addcomments" target="_blank">Send Email</a></td>			-->
          </tr>
          <% Next %>
          <tr>
           <td colspan="10">
           <% If Not payNotRecFirstRow = 0 Then %>
         
              <a href="marketingB2C.asp?action=<% = rqAction %>&<% If rqCity <> "" Then %>city=<% = rqCity %>&<% End If %><% If rqName <> "" Then %>name=<% = rqName %>&<% End If %>page=previous&row=<% = payNotRecFirstRow %>"> &lt;&lt;Previous</a>
            
               <% End If %>
           
              <% = ((payNotRecFirstRow + 1) & " - " & (payNotRecLastRow + 1) & " of " & (payNotRecNumRows + 1)) %>
              
              <% If Not payNotRecNumRows = payNotRecLastRow Then %>
              
              <a href="marketingB2C.asp?action=<% = rqAction %>&<% If rqCity <> "" Then %>city=<% = rqCity %>&<% End If %><% If rqName <> "" Then %>name=<% = rqName %>&<% End If %>page=next&row=<% = payNotRecLastRow %>"> &gt;&gt;Next</a>
              
              <% End If %>
             
            </td>
          </tr>
          <% End If %>
        </table>
        </fieldset>
        <% ElseIf rqAction = "noFollowUp" OR rqAction = "followUp" OR rqAction = "closed" Then %>
              <table width="1000px" class="table2">
               <tr><br />
            <% If Session("TypeOfUser") = "Faculty" Then %>
          <!--  <form action="marketingB2C.asp?action=<% = rqAction %>" method="post">
              <td width="30%">View your <% If Session("CRM_Country") <> "United Kingdom" Then %>states<% Else %>Counties<% End If %>:
                <select name="state">
                  <option value="">-Select-</option>
                  <% 
				strStates = "SELECT states, statecode From states WHERE (fac_emailid1 = '"& Session("USBUserId") &"' OR fac_emailid2 = '"& Session("USBUserId") &"' OR fac_emailid3 = '"& Session("USBUserId") &"' OR fac_emailid4 = '"& Session("USBUserId") &"' OR fac_emailid5 = '"& Session("USBUserId") &"') ORDER BY states"
				
				objRsState.Open strStates, ConnObj
				
				Do Until objRsState.EOF %>
                  <option <% If rqState = objRsState("states") Then %> selected="selected" <% End If %> value="<% = objRsState("states") %>">
                  <% = objRsState("states") %><% If Session("CRM_Country") = "US" OR  Session("CRM_Country") = "Canada" Then %>,
                  <% = objRsState("statecode") %><% End If %>
                  </option>
                  <% objRsState.Movenext
				   Loop
				   objRsState.Close %>
                </select>
                <input type="submit" name="search" value="Search" />
              </td>
            </form>-->
            <% End If %>
            
       

               <!--<form action="marketingB2C.asp?action=<% = rqAction %>" method="post">
                <td width="40%">
              View all <% If Session("CRM_Country") <> "United Kingdom" Then %>states<% Else %>Counties<% End If %>: 
                <select name="state">
				  <option value="">-Select-</option>
				  <% If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then %>
				  <optgroup label="US">
                  
                  <%
				strStates = "SELECT states, statecode From states WHERE country = 'US' ORDER BY states"
				
				objRsState.Open strStates, ConnObj
				
				Do Until objRsState.EOF %>
                  <option <% If rqState = objRsState("states") Then %> selected="selected" <% End If %> value="<% = objRsState("states") %>">
                  <% = objRsState("states") %>
                  </option>
                  <% objRsState.Movenext
				   Loop
				   objRsState.Close %>
				   </optgroup>
				   <optgroup label="Canada">
                  
                  <%
				strStates = "SELECT states, statecode From states WHERE country = 'Canada' ORDER BY states"
				
				objRsState.Open strStates, ConnObj
				
				Do Until objRsState.EOF %>
                  <option <% If rqState = objRsState("states") Then %> selected="selected" <% End If %> value="<% = objRsState("states") %>">
                  <% = objRsState("states") %>,
                  <% = objRsState("statecode") %>
                  </option>
                  <% objRsState.Movenext
				   Loop
				   objRsState.Close %>
				   </optgroup>
				   <% Else %>
                  
                  <%
				strStates = "SELECT states, statecode From states WHERE country = '"& Session("CRM_Country") & "' ORDER BY states"

				objRsState.Open strStates, ConnObj
				
				Do Until objRsState.EOF %>
                  <option <% If rqState = objRsState("states") Then %> selected="selected" <% End If %> value="<% = objRsState("states") %>">
                  <% = Trim(objRsState("states")) %>                  </option>
                  <% objRsState.Movenext
				   Loop
				   objRsState.Close %>


				   <% End If %>		   
                </select>
                <input type="submit" name="search" value="Search" />
              </td>
            </form>			-->
            <form action="marketingB2C.asp?action=<% = rqAction %>" method="post">
              <td width="30%">Name/Email ID:
                <input type="text" name="name" size="15" value="<% = rqName %>" />
                <input type="submit" name="search" value="Search" />
              </td>
            </form>
            </td>
			</tr>
            <tr>          
            <td width="13%"><% If rqAction = "noFollowUp" Then %>
              <h3>Calls to be made</h3>
              <% ElseIf rqAction = "followUp" Then %>
              <h3>Follow Up Calls</h3>
              <% ElseIf rqAction = "closed" Then %>
              <h3>Closed Calls</h3>
              <% End If %>
            </td>
          </tr>
        </table>
		<table><tr><td>&nbsp;</td></tr></table>
        <fieldset>
        <table border="2" cellpadding="0" cellspacing="0" class="table1" width="950px">
          <tr>
		    <% If Session("CRM_Country") = "United Kingdom" OR Session("CRM_Country") <> "Australia" Then %>
			<td bgcolor="#A7DBFB" align="center"><b>County</b></td>
			<% Else %>
            <td bgcolor="#A7DBFB" align="center"><b>State</b></td>
			<% End If %>
            <td bgcolor="#A7DBFB" align="center"><b>City</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Name</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Phone Number</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Email Id</b></td>
			<td bgcolor="#A7DBFB" align="center"><b>Type of Call</b></td>			
            <td bgcolor="#A7DBFB" align="center"><b>Question</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Comments</b></td>
            <% If rqAction <> "noFollowUp" Then %>
            <td bgcolor="#A7DBFB" align="center"><b>History</b></td>
            <% End If %>
            <td bgcolor="#A7DBFB" align="center"><b>Email</b></td>

            <td bgcolor="#A7DBFB" align="center"><b>Status</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Edit</b></td>
          </tr>
          <% If IsArray(arrAllCallDet) Then
			 For rowcounter = firstRow To lastRow
			 CallID = arrAllCallDet(0,rowcounter) %>
          <tr>
            <td><% 'If arrAllCallDet(1,rowcounter) <> "" Then %>
              <% = arrAllCallDet(1,rowcounter) %>
              <%' Else %>
              <% '= arrAllCallDet(6,rowcounter) %>
              <% 'End If %>
            </td>
            <td><% = arrAllCallDet(2,rowcounter) %></td>
            <td><% = arrAllCallDet(3,rowcounter) %></td>
            <td><% = arrAllCallDet(4,rowcounter) %></td>
	
            <td><% = arrAllCallDet(5,rowcounter) %></td>
						<td><% = arrAllCallDet(9,rowcounter) %></td>		
            <td><% = arrAllCallDet(6,rowcounter) %>
              <br />
              Added date:
              <% = arrAllCallDet(8,rowcounter) %></td>
            <td><form name="comment" action="addComments_New.asp" method="post" onsubmit="return Form_Validator(this)">
                <input type="hidden" name="callid" value="<% = CallID %>">
                <Textarea name="comment" rows="5" cols="20" ></Textarea>
                <BR />
                <input type="hidden" name="action" value="<% = rqAction %>" />
                <input type="hidden" name="page" value="<% = rqPage %>" />
                <input type="hidden" name="row" value="<% = rqRow %>" />
                <input type="hidden" name="state" value="<% = rqState %>" />
                <input type="submit" name="type" value="Save">
                <% If rqAction <> "closed" Then %>
                <input type="submit" name="type" value="Close" />
                <% End If %>
              </form></td>
            <% If rqAction <> "noFollowUp" Then %>
            <td><iframe src="fac_comments_New.asp?callid=<% = CallId %>" frameborder="0" height="100" scrolling="yes" width="200"></iframe></td>
            <% End If %>
            <td class="action" width="75px"><% If arrAllCallDet(4,rowcounter) <> "" Then %>
              <a href="sendmail.asp?callid=<% = CallID %>" class="addcomments" target="_blank">Send Email</a>
              <% Else %>
              &nbsp;
              <% End If %>
            </td>
            <form name="comment" action="addComments_New.asp" method="post" onsubmit="return Form_Validator1(this)">
              <input type="hidden" name="callId" value="<% = CallId %>">
              <input type="hidden" name="action" value="<% = rqAction %>" />
              <input type="hidden" name="page" value="<% = rqPage %>" />
              <input type="hidden" name="row" value="<% = rqRow %>" />
              <input type="hidden" name="state" value="<% = rqState %>" />
              <td><br />
                <% If IsNull(arrAllCallDet(7,rowcounter)) Then %>
                <select name="status">
                  <option value="">--Select--</option>
                  <option value="Dummy">Dummy</option>
                    <option value="Interested">Interested</option>
                    <option value="Not Interested">Not Interested</option>
                     <option value="Enrolled">Enrolled</option>
                      <option value="Enrolled and Paid">Enrolled and Paid</option>
                  <option value="No follow up required">No follow up required</option>
                </select>
                <br />
                <br />
                <input type="submit" name="type" value="Submit" />
                <% Else %>
                <% = arrAllCallDet(7,rowcounter) %>
                  <span><a href="javascript:void(0)" onClick="this.parentNode.lastChild.style.display='Block'">Edit</a> <br /><br />
                      <span id="comment" style="display:none">  
                      <select name="status">
                  <option value="">--Select--</option>
                  <option value="Dummy">Dummy</option>
                    <option value="Interested">Interested</option>
                    <option value="Not Interested">Not Interested</option>
                     <option value="Enrolled">Enrolled</option>
                      <option value="Enrolled and Paid">Enrolled and Paid</option>
                  <option value="No follow up required">No follow up required</option>
                </select>
                 <br />
                <br />
                <input type="submit" name="type" value="Submit" />
</span></span>
                <% End If %>
              </td>
            </form>
       <td><a href="updateUserDet.asp?type=Edit&editId=<% = arrAllCallDet(0,rowcounter) %>&action=<% = rqAction %>">Edit</a></td>

          </tr>
          <% Next %>
          <tr>
            <td colspan="13">
             <% If Not firstRow = 0 Then %>
              <a href="marketingB2C.asp?action=<% = rqAction %>&<% If rqType = "ByFaculty" Then %>type=<% = rqType %>&<% End If %><% If rqState <> "" Then %>state=<% = rqState %>&<% End If %><% If rqName <> "" Then %>name=<% = rqName %>&<% End If %>page=previous&row=<% = firstRow %>"> &lt;&lt;Previous</a>
              <% End If %>
              <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
              <% If Not numRows = lastRow Then %>
              <a href="marketingB2C.asp?action=<% = rqAction %>&<% If rqType = "ByFaculty" Then %>type=<% = rqType %>&<% End If %><% If rqState <> "" Then %>state=<% = rqState %>&<% End If %><% If rqName <> "" Then %>name=<% = rqName %>&<% End If %>page=next&row=<% = lastRow %>"> &gt;&gt;Next</a>
              <% End If %>
              <% End If %>
            </td>
          </tr>
          <% End If %>
        </table>
        </fieldset>
        <% End If %>
      </div>
      <!-- // #main -->
      <div class="clear"></div>
    </div>
    <!-- // #container -->
  </div>
  <!-- // #containerHolder -->
  <p id="footer">&nbsp;</p>
</div>
<!-- // #wrapper -->
<%
'Sending mails'

'Query to remind faculty within 4 hours to reply for the question'

'Set objRsMail = Server.CreateObject("ADODB.Recordset") 
'Set objRs1 = Server.CreateObject("ADODB.Recordset") 
'
'strSendMail = "SELECT callid, sendmail1, sendmail2 FROM ps_callsreceived_new WHERE (sendmail1 Is Null OR sendmail2 Is Null) And call_status1 = '1' And call_status2 Is Null And callfor = 'Classroom' And ROUND (cast ((datediff (minute,addeddate,getdate()) / 60.0) as FLOAT), 2)  >= 4"
'
'objRs1.Open strSendMail, ConnObj
'
'Do Until objRs1.EOF
'
'sendEmail1 = objRs1("sendmail1")
'sendEmail2 = objRs1("sendmail2")
'callId = objRs1("callid")
'
'If IsNull(sendEmail1) then
'
'  strSendmails = "SELECT callername, phoneno, emailid, callerstate, city, question, addeddate FROM ps_callsreceived_new WHERE  callid = '"&callId& "'  AND ROUND (cast ((datediff (minute,addeddate,getdate()) / 60.0) as FLOAT), 2)  >= 4"
'				
'ElseIf IsNull(sendEmail2) then
'
'  strSendmails = "SELECT callername, phoneno, emailid, callerstate, city, question, addeddate FROM ps_callsreceived_new WHERE callid = '"&callId& "'  AND ROUND (cast ((datediff (minute,addeddate,getdate()) / 60.0) as FLOAT), 2)  >= 24"
'						
'End If
'
'objRs.Open strSendmails, ConnObj
'
'Do Until objRs.EOF
'
'	rqCallerName = objRs("callername")
'	rqCallerState = objRs("callerstate")
'	rqCity = objRs("city")
'	rqPhoneNo = objRs("phoneno")
'	rqEmailId = objRs("emailid")
'	rqQuestion = objRs("question")
'	rqAddedDate = objRs("addeddate")
'
'objRs.Movenext
'Loop
'objRs.Close
'
'
'If rqCallerState <> "" Then
'
''strMail = "SELECT fac_emailID1, fac_emailID2, fac_emailID3, fac_emailID4, fac_emailID5, fac_sec_emailid1, fac_sec_emailid2, fac_sec_emailid3, fac_sec_emailid4, fac_sec_emailid5 FROM ps_us_states WHERE states = '"& rqState &"'"
'
'
'strMail = "SELECT fac_emailID1, fac_emailID2, fac_emailID3, fac_emailID4, fac_emailID5, fac_sec_emailid1, fac_sec_emailid2, fac_sec_emailid3, fac_sec_emailid4, fac_sec_emailid5 FROM ps_us_states WHERE states = '"& rqCallerState &"'"
'
'objRsMail.Open strMail, ConnObj
'
'Do Until objRsMail.EOF
'
'Fac1 = objRsMail("fac_emailID1")
'Fac2 = objRsMail("fac_emailID2")
'Fac3 = objRsMail("fac_emailID3")
'Fac4 = objRsMail("fac_emailID4")
'Fac5 = objRsMail("fac_emailID5")
'Fac1_Sec = objRsMail("fac_sec_emailid1")
'Fac2_Sec = objRsMail("fac_sec_emailid2")
'Fac3_Sec = objRsMail("fac_sec_emailid3")
'Fac4_Sec = objRsMail("fac_sec_emailid4")
'Fac5_Sec = objRsMail("fac_sec_emailid5")
'
'
'EmailIds = Fac1 &","& Fac2 &","& Fac3 &","& Fac4 &","& Fac5 &","& Fac1_Sec &","& Fac2_Sec &","& Fac3_Sec &","& Fac4_Sec &","& Fac5_Sec
'
'strBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.PROJstudy.com/images/banners/email_header.jpg"" alt=""PROJstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""540px""><table border=""0"" width=""520px"" align=""center""><tr height=""30px""><td><font face=""Arial"" size=2>Hi,<BR><BR>We got the following call from student for follow up. <BR><BR>Name: "&rqCallerName&"<BR><BR>State:  "&rqCallerState&"<BR><BR>City:  "&rqCity&"<BR><BR>Phone Number: "&rqPhoneNo&""
'If rqEmailId <> "" Then
'strBody = strBody & "<BR><BR>EmailId: "&rqEmailId
'End If 
'
'strBody = strBody & "<BR><BR>Time: "&rqAddedDate&"<BR><BR>Ques: "&rqQuestion&"<BR><BR>Please do the needful.<BR><BR>Best Regards, <BR>Custmer Support<br>www.PROJstudy.com<BR>(PMI Approved Registered Education Provider)<BR>Email: marketing@PROJstudy.com</font></td></tr></table></td></tr></table></td></tr></table>"
'
'Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'objCDOMail.From = "marketing@PROJstudy.com"
'objCDOMail.To =  EmailIds 
'objCDOMail.cc = "marketing@PROJstudy.com"
'objCDOMail.Bcc = "t_satpathy@yahoo.com"
'objCDOMail.Importance = 2
'If IsNull(sendEmail1) then
'objCDOMail.Subject = "PROJstudy Receptionist call received (follow up)"
'ElseIf IsNull(sendEmail2) then
'objCDOMail.Subject = "PROJstudy Receptionist call received (reminder)"
'End If
'objCDOMail.BodyFormat = 0
'objCDOMail.MailFormat = 0
'objCDOMail.Body =  strBody
'objCDOMail.Send
'Set objCDOMail = Nothing
'
'If IsNull(sendEmail1) then
'	ConnObj.Execute("UPDATE ps_callsreceived_new SET sendmail1 = '1' WHERE callid = '"& callId &"'")
'ElseIf IsNull(sendEmail2) then
'	ConnObj.Execute("UPDATE ps_callsreceived_new SET sendmail2 = '1' WHERE callid = '"& callId &"'")
'End If
'
'objRsMail.Movenext
'Loop
'objRsMail.Close
'
'End If
'
'objRs1.Movenext
'Loop
'objRs1.Close
'
'
''Sending a reminder mail to students after 4 hours'
'
'
'Dim rqcity1
'
'Set objRsMail2 = Server.CreateObject("ADODB.Recordset") 
'Set objRs2 = Server.CreateObject("ADODB.Recordset") 
'Set objRsMail3 = Server.CreateObject("ADODB.Recordset") 
'Set Rs2 = Server.CreateObject("ADODB.Recordset") 
'
'strSendMail2 = "SELECT id,firstname,lastname,email,nameofemployeer,phoneno,coursedetails,coursedate,amount,dateofenrollment,paybefore,checkreceived,checkreceiveddate,checkreceivedby,status,checkrecmailsent,courseid,country, us_status,rem_mail FROM ps_enrolledusers WHERE us_status Is Null  AND (country = 'US' OR country = 'Canada') AND (checkreceived Is Null OR checkreceived <> 'Yes') And rem_mail Is Null And status <> 'Cancel' And ROUND (cast ((datediff (minute,dateofenrollment,getdate()) / 60.0) as FLOAT), 2)  >= 8"
'
''response.Write(strSendMail2)
'
'
'objRs2.Open strSendMail2, ConnObj
'
'Do Until objRs2.EOF
'
'Id = objRs2("id")
'rqcheckreceived  = objRs2("checkreceived")
'rqEmailId = objRs2("email")
'rqrem_mail = objRs2("rem_mail")
'rqfirstname = objRs2("firstname")
'rqlastname = objRs2("lastname")
'rqphoneno = objRs2("phoneno")
'rqdateofenrollment = objRs2("dateofenrollment")
'rqcoursedetails = objRs2("coursedetails")
'
'
'rqcity1 = Split(rqcoursedetails, " ")
'
''status Is Null than we are sending mail to student as a reminder mail after 4 hour
'If IsNull(rqrem_mail) then
'
'strBody2 = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""45%"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td align=""center"" width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.PROJstudy.com/images/banners/email_header.jpg"" alt=""PROJstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "&rqfirstname&" "&rqlastname&",<BR><BR>Greetings from PROJstudy!<BR><BR>We thank you for enrolling with PROJstudy for PMP Exam Prep classroom training scheduled to be held at "&rqcity1(0)&". <BR><BR>In order to complete the enrollment process and secure your seat for this program, please make payment towards the program fee using the link:<a href=""http://www.PROJstudy.com/payforclass.asp"" target=""_blank"">http://www.PROJstudy.com/payforclass.asp</a><BR><BR>Once we receive your payment, we will provide you with access to our 100% Online PMP Pre-Preparatory course. On completion of this Pre-Prep course, you will get 40 PMI<sup>&reg;</sup> approved contact hours. (Note: PMI requires a minimum of 35 contact hours in order to qualify to take the PMP exam.) For more details regarding the application process and requirements, see <a href = ""http://PROJstudy.com/about-PMP/pmp.html"" target=""_blank"">http://PROJstudy.com/about-PMP/pmp.html</a>. This Pre-Prep course will assist you to prepare for our classroom training program.  <BR><BR> To find out more about the benefits of joining our classroom training program early, go to <a href=""http://PROJstudy.com/whyjoinearly.asp"" target=""_blank"">http://PROJstudy.com/whyjoinearly.asp</a>.<BR><BR>If you have any questions or need any additional information, please email us at <a href=""mailto:marketing@PROJstudy.com"" target=""_blank"">marketing@PROJstudy.com</a>.<BR><BR>If you have already paid for the course, please ignore this email. <BR><BR> We look forward to having you as our student.<BR><BR>Best Regards, <br>Marketing Team<br><a href =""http://www.PROJstudy.com"">www.PROJstudy.com</a><BR>(PMI Approved Registered Education Provider)<BR>Email: <a href=""mailto:marketing@PROJstudy.com"" target=""_blank"">marketing@PROJstudy.com</a><BR>Ph.- 888-507-6872</font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"
'
'
'Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'objCDOMail.From = "marketing@PROJstudy.com"
'objCDOMail.To =  ""& rqEmailId &""
''objCDOMail.To =  "edusysbharath@gmail.com, edusyssavita@gmail.com, edusysankit@gmail.com, edusysrajeev@gmail.com"
'objCDOMail.cc = "marketing@PROJstudy.com"
'objCDOMail.Importance = 2
'objCDOMail.Subject = "Confirm your participation for the PROJstudy PMP exam Prep program"
'objCDOMail.BodyFormat = 0
'objCDOMail.MailFormat = 0
'objCDOMail.Body =  strBody2
'objCDOMail.Send
'Set objCDOMail = Nothing
'
''After sending reminder mail to student we are updating the rem_mail column in DB with 1
'
'ConnObj.Execute("UPDATE ps_enrolledusers SET rem_mail = '1' WHERE id = '"& Id &"'")
'
'End If
'
'objRs2.Movenext
'Loop
'objRs2.Close
'
'

%>

</body>
</html>


