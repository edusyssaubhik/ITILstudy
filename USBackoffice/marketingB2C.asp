<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>


<%
If Session("USBUserId") = "" Then
	Response.Redirect("/USBackoffice/login.asp")
Else
%>

<%'In Enrolled but not paid  based on the website slected connection will be worked%>

<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/connection_global.asp"-->

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
Set objRsCity1 = Server.CreateObject("ADODB.Recordset")
Set objRsCity2 = Server.CreateObject("ADODB.Recordset")


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

If Request.Form("callfor") <> "" Then
	rqcallfor = Request.Form("callfor")
Else
	rqcallfor = Request.QueryString("callfor")
End If

searchName = Trim(rqName)

searchCity = rqCity

If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then

strCity1 = "SELECT city,state_code FROM ITIL_city WHERE country = 'US' ORDER BY city"

objRsCity1.Open strCity1,ConnObj

strCity2 = "SELECT city,state_code FROM ITIL_city WHERE country = 'Canada' ORDER BY city"

objRsCity2.Open strCity2,ConnObj

Else  

strCity = "SELECT city,state_code FROM ITIL_city WHERE country = '"& Session("CRM_Country") &"' ORDER BY city"

objRsCity.Open strCity,ConnObj

End If

 

'strCity = "SELECT city,state_code FROM ITIL_city WHERE country = '"& Session("CRM_Country") &"' ORDER BY city"

'Response.write(strCity)

'objRsCity.Open strCity,ConnObj



'Display the queries country wise'
If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then
	strCountry = "(country = 'US' OR country = 'Canada')"
ElseIf Session("CRM_Country") = "India" Then
	strCountry = "(country = 'India')"
ElseIf Session("CRM_Country") = "UAE" Then
	strCountry = "(country = 'UAE')"
ElseIf Session("CRM_Country") = "Singapore" Then
	strCountry = "(country = 'Singapore')"
ElseIf Session("CRM_Country") = "Australia" Then
	strCountry = "(country = 'Australia')"
ElseIf Session("CRM_Country") = "United Kingdom" Then
	strCountry = "(country = 'United Kingdom')"
ElseIf Session("CRM_Country") = "Germany" Then
	strCountry = "(country = 'Germany')"
ElseIf Session("CRM_Country") = "Netherlands" Then
	strCountry = "(country = 'Netherlands')"
ElseIf Session("CRM_Country") = "Switzerland" Then
	strCountry = "(country = 'Switzerland')" 
ElseIf Session("CRM_Country") = "Saudi Arabia" Then
	strCountry = "(country = 'Saudi Arabia')"
ElseIf Session("CRM_Country") = "Global" Then	
	strCountry = "(country = 'US' OR country = 'Canada')"
	Session("CRM_Country") = "US"
End If	


'Bharath - Code'

If Session("USBUserId") = "edusyssheree@gmail.com" Then

'Retriving the allocated states based on assigned states to the faculty'
strStates = "SELECT states, statecode From ITIL_states WHERE country = 'United Kingdom' ORDER BY states"

Else

'Retriving the allocated states based on assigned states to the faculty'
strStates = "SELECT states, statecode From ITIL_states WHERE (fac_emailid1 = '"& Session("USBUserId") &"' OR fac_emailid1 = '"& Session("USBUserId1") &"' OR fac_emailid2 = '"& Session("USBUserId") &"' OR fac_emailid2 = '"& Session("USBUserId1") &"' OR fac_emailid3 = '"& Session("USBUserId") &"' OR fac_emailid3 = '"& Session("USBUserId1") &"' OR fac_emailid4 = '"& Session("USBUserId") &"' OR fac_emailid4 = '"& Session("USBUserId1") &"' OR fac_emailid5 = '"& Session("USBUserId") &"' OR fac_emailid5 = '"& Session("USBUserId1") &"') ORDER BY states"

End If
	
	'Response.write(strStates)
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


'If country is US, Canada or United Kingdom then display based on state else show all the queries'
If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then
	
	If assignedStates <> "" Then
		assignedStates = assignedStates
	Else
		assignedStates = "'" & "'"
	End If
	
ElseIf Session("CRM_Country") = "UAE" Then
	
	assignedStates = "'Sharjah','Abu Dhabi','Dubai'" 
	
ElseIf Session("CRM_Country") = "Singapore" Then
	
	assignedStates = "'Singapore'" 
	
ElseIf Session("CRM_Country") = "Australia" Then
	
	assignedStates = "'Sydney','Melbourne','Brisbane','Adelaide','Perth','Auckland','Wellington'" 	
	
ElseIf Session("CRM_Country") = "India" Then
	
	assignedStates = "'Karnataka','Maharashtra','Delhi','Tamil Nadu','West Bengal','Andhra Pradesh','Gujarat','Kerala'" 	
	
	
ElseIf Session("CRM_Country") = "Germany" Then
	
	assignedStates = "'Bayern','Hesse ','Berlin','North Rhine-Westphalia','Hamburg','Bavaria','Lower Saxony','Baden','Free State of Saxony'" 	
	
ElseIf Session("CRM_Country") = "Netherlands" Then
	
	assignedStates = "'Netherlands'" 	
	
ElseIf Session("CRM_Country") = "United Kingdom" Then
	
	assignedStates = "'Berkshire','Bristol','Buckinghamshire','Cardiff','Glasgow','Greater London','Edinburgh','Hampshire','Oxfordshire','Scotland','Merseyside','Devon'" 	
	
End If

 

If rqAction = "paymentNotRec" OR rqAction = "paymentRec" Then


		If rqAction = "paymentNotRec" Then
			
			If Session("TypeOfUser") = "Admin" Then
			
				'If user selects city in the drop down that will come here'
				If rqCity <> "" Then
		
					strPayNotRec = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ITIL_enrolledusers WHERE (checkreceived Is Null OR checkreceived <> 'Yes') AND "& strCountry &" And coursedetails like '%"&searchCity&"%' And (us_status Is Null OR us_status = 'Active')  ORDER BY id desc"
		
				'If user entered lastname in the serach option that will come here'
				ElseIf rqName <> "" Then
		
					strPayNotRec = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ITIL_enrolledusers WHERE (checkreceived Is Null OR checkreceived <> 'Yes') AND "& strCountry &" And (firstname like '%"&searchName&"%' OR lastname like '%"&searchName&"%' OR email like '%"&searchName&"%') And (us_status Is Null OR us_status = 'Active') ORDER BY id desc"
		
				ElseIf rqCity = "" And rqName = "" OR rqWebsite <> ""  Then
		
		
				strCourseIds = "SELECT courseid FROM ITIL_course Where startdate >= '"&now()&"'"
		
				objRsCID.Open strCourseIds,ConnObj
		
				Do Until objRsCID.EOF
		
					strPayNotRec1 = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ITIL_enrolledusers WHERE (checkreceived Is Null OR checkreceived <> 'Yes') AND "& strCountry &" And (us_status Is Null OR us_status = 'Active')"
		
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
		
					strPayNotRec = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ITIL_enrolledusers WHERE (checkreceived Is Null OR checkreceived <> 'Yes') AND "& strCountry &" And coursedetails like '%"&searchCity&"%' And (us_status Is Null OR us_status = 'Active')  And ROUND (cast ((datediff (minute,dateofenrollment,getdate()) / 60.0) as FLOAT), 2)  >= 24 ORDER BY id desc"
		
				'If user entered lastname in the serach option that will come here'
				ElseIf rqName <> "" Then
		
					strPayNotRec = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ITIL_enrolledusers WHERE (checkreceived Is Null OR checkreceived <> 'Yes') AND "& strCountry &" And (firstname like '%"&searchName&"%' OR lastname like '%"&searchName&"%' OR email like '%"&searchName&"%') And (us_status Is Null OR us_status = 'Active')  And ROUND (cast ((datediff (minute,dateofenrollment,getdate()) / 60.0) as FLOAT), 2)  >= 24 ORDER BY id desc"
		
				ElseIf rqCity = "" And rqName = "" OR rqWebsite <> "" Then
		
		
				strCourseIds = "SELECT courseid FROM ITIL_course Where startdate >= '"&now()&"'"
		
				objRsCID.Open strCourseIds,ConnObj
		
				Do Until objRsCID.EOF
		
					strPayNotRec1 = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ITIL_enrolledusers WHERE (checkreceived Is Null OR checkreceived <> 'Yes') AND "& strCountry &" And (us_status Is Null OR us_status = 'Active') And ROUND (cast ((datediff (minute,dateofenrollment,getdate()) / 60.0) as FLOAT), 2)  >= 24"
		
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

			strPayNotRec = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ITIL_enrolledusers  WHERE checkreceived = 'Yes' And status = 'Active' AND "& strCountry &" And coursedetails like '%"&searchCity&"%' And (us_status Is Null OR us_status = 'Active') ORDER BY id desc"

		'If user entered lastname in the serach option that will come here'
		ElseIf rqName <> "" Then

			strPayNotRec = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ITIL_enrolledusers  WHERE checkreceived = 'Yes' And status = 'Active' AND "& strCountry &" And (firstname like '%"&searchName&"%' OR lastname like '%"&searchName&"%' OR email like '%"&searchName&"%') And (us_status Is Null OR us_status = 'Active') ORDER BY id desc"

		ElseIf rqCity = "" And rqName = "" OR rqWebsite <> "" Then

		strCourseIds = "SELECT courseid FROM ITIL_course Where startdate >= '"&now()&"'"

		objRsCID.Open strCourseIds,ConnObj

		Do Until objRsCID.EOF

			strPayNotRec1 = "SELECT firstname, lastname, email, nameofemployeer, phoneno, coursedetails, dateofenrollment, id, us_status, us_status_addedby FROM ITIL_enrolledusers WHERE checkreceived = 'Yes' And status = 'Active' AND "& strCountry &" And (us_status Is Null OR us_status = 'Active')"
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

'Response.write("TEst"&payNotRecNumRows)
'Response.Write("Test1"&arrAllPayNotRec(0,1))
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

If rqAction = "noFollowUp"  Then

	'If user select city in the city dropdown of No Follow Up calls that will come here'
	If rqState <> "" Then

	'Retrive the not follow up calls details based on city search'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '1' And callerstate = '"&rqState&"' And "& strCountry &" And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"

	'If user entered name in the serach of No Follow Up calls that will come here'
	ElseIf rqName <> "" Then

	'Retrive the not follow up calls details based on lastname'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '1' And (callername like '%"&searchName&"%' OR emailid like '%"& searchName &"%') And "& strCountry &"  And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"
	

	'response.write(strCallDet)

	'If user as a admin, i am showing all the cities'
	ElseIf Session("TypeOfUser") = "Admin" And rqType = "" Then

	'Retrive the not follow up calls details for all the cities (ADMIN)'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '1'  And "& strCountry &" ORDER BY callid desc"
'response.Write(strCallDet)
	

	ElseIf Session("TypeOfUser") = "Faculty" And rqType = "" Then
	
	'Retrive the not follow up calls details '
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '1' And (callerstate in ("& assignedStates &")  OR addedby = '"& Session("USBUserId") &"') And ("& strCountry &") And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"
	
	'Response.Write(strCallDet)
		
	ElseIf Session("TypeOfUser") = "Faculty" And rqType = "Online" Then

	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '1'  And (callerstate in ("& assignedStates &")  OR addedby = '"& Session("USBUserId") &"') And ("& strCountry &") And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"
	
	'Response.Write(strCallDet)
	
	End If
	
	ElseIf rqAction = "freeEnrollment" Then

	'If user select city in the city dropdown of Follow Up calls that will come here'
	If rqState <> "" Then

	'Retrive the not follow up calls details based on city search'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website,country FROM ITIL_callsreceived_new WHERE call_status1 = '4' And callerstate = '"&rqState&"' And "& strCountry &" And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"

	'If user entered name in the serach of Follow Up calls that will come here'
	ElseIf rqName <> "" Then

	'Retrive the follow up calls details based on lastname'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website,country FROM ITIL_callsreceived_new WHERE call_status1 = '4' And (callername like '%"&searchName&"%' OR emailid like '%"& searchName &"%') And "& strCountry &" And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"
	
	'If user as a admin, i am showing all the cities'
	ElseIf Session("TypeOfUser") = "Admin" And rqType = "" Then

	'Retrive the follow up calls details for all the cities (ADMIN)'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website,country FROM ITIL_callsreceived_new WHERE call_status1 = '4'  And "& strCountry &" ORDER BY callid desc"

	'If user as a admin, i am showing all the cities'
	ElseIf Session("TypeOfUser") = "Admin" And rqType = "Online" Then

	'Retrive the follow up calls details for all the cities (ADMIN)'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website,country FROM ITIL_callsreceived_new WHERE call_status1 = '4' And "& strCountry &" And callfor = 'Online' ORDER BY callid desc"
	
	ElseIf Session("TypeOfUser") = "Faculty" And rqType = "" Then

	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website,country FROM ITIL_callsreceived_new WHERE call_status1 = '4'  And (callerstate in ("& assignedStates &")  OR addedby = '"& Session("USBUserId") &"') And ("& strCountry &") And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"

	'Response.Write(strCallDet)

	ElseIf Session("TypeOfUser") = "Faculty" And rqType = "Online" Then
	
	'Retrive the not follow up calls details based on city'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website,country FROM ITIL_callsreceived_new WHERE call_status1 = '4'  And (callerstate in ("& assignedStates &")  OR addedby = '"& Session("USBUserId") &"') And ("& strCountry &") And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"
	
	
	ElseIf rqType = "ByFaculty" Then
	
	'Retriving call ids based on faculty email id'
	strQuery = "SELECT distinct callid FROM fac_comments_new WHERE comm_addedby = '"& Session("USBUserId") &"' ORDER BY callid DESC"

	objRsCallID.Open strQuery, ConnObj
	
	'Intializing i value as zero'
	i = 0 
	
	Do Until objRsCallID.EOF
	
	'Retrive the follow up calls details based on city'
	strCallDet1 = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website,country FROM ITIL_callsreceived_new WHERE call_status1 = '4' And (call_status2 Is Null OR call_status2 <> 'Dummy')  And "& strCountry &" And callid = '"& objRsCallID("callid") &"'"
	
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


ElseIf rqAction = "followUp" Then

	'If user select city in the city dropdown of Follow Up calls that will come here'
	If rqState <> "" Then

	'Retrive the not follow up calls details based on city search'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '2' And callerstate = '"&rqState&"' And "& strCountry &" And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"

	'If user entered name in the serach of Follow Up calls that will come here'
	ElseIf rqName <> "" Then

	'Retrive the follow up calls details based on lastname'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '2' And (callername like '%"&searchName&"%' OR emailid like '%"& searchName &"%') And "& strCountry &" And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"
	
	ElseIf rqcallfor <> "" Then
	
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE callfor like '%"&rqcallfor&"%' And "& strCountry &"  And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"
	
	'Response.write(strCallDet)
	

	'If user as a admin, i am showing all the cities'
	ElseIf Session("TypeOfUser") = "Admin" And rqType = "" Then

	'Retrive the follow up calls details for all the cities (ADMIN)'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '2'  And "& strCountry &" ORDER BY callid desc"

	'If user as a admin, i am showing all the cities'
	ElseIf Session("TypeOfUser") = "Admin" And rqType = "Online" Then

	'Retrive the follow up calls details for all the cities (ADMIN)'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '2' And "& strCountry &" And callfor = 'Online' ORDER BY callid desc"
	
	ElseIf Session("TypeOfUser") = "Faculty" And rqType = "" Then

	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '2'  And (callerstate in ("& assignedStates &")  OR addedby = '"& Session("USBUserId") &"') And ("& strCountry &") And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"

	'Response.Write(strCallDet)

	ElseIf Session("TypeOfUser") = "Faculty" And rqType = "Online" Then
	
	'Retrive the not follow up calls details based on city'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '2'  And (callerstate in ("& assignedStates &")  OR addedby = '"& Session("USBUserId") &"') And ("& strCountry &") And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"
	
	
	ElseIf rqType = "ByFaculty" Then
	
	'Retriving call ids based on faculty email id'
	strQuery = "SELECT distinct callid FROM fac_comments_new WHERE comm_addedby = '"& Session("USBUserId") &"' ORDER BY callid DESC"

	objRsCallID.Open strQuery, ConnObj
	
	'Intializing i value as zero'
	i = 0 
	
	Do Until objRsCallID.EOF
	
	'Retrive the follow up calls details based on city'
	strCallDet1 = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '2' And (call_status2 Is Null OR call_status2 <> 'Dummy')  And "& strCountry &" And callid = '"& objRsCallID("callid") &"'"
	
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
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '3' And callerstate = '"&rqState&"'  And "& strCountry &" And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"

	'If user entered name in the serach of Closed calls that will come here'
	ElseIf rqName <> "" Then

	'Retrive the Closed calls details based on lastname'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '3'  And (callername like '%"&searchName&"%' OR emailid like '%"& searchName &"%')  And "& strCountry &" And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"
	
	ElseIf rqcallfor <> "" Then
	
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE callfor like '%"&rqcallfor&"%' And "& strCountry &"  And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"
	

	'If user as a admin, i am showing all the cities'
	ElseIf Session("TypeOfUser") = "Admin" And rqType = "" Then


	'Retrive the Closed calls details for all the cities (ADMIN)'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '3'  And "& strCountry &" ORDER BY callid desc"
	
	ElseIf Session("TypeOfUser") = "Faculty" And rqType = "" Then
	
	'Retrive the Closed calls details based on city'
 	
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '3'   And (callerstate in ("& assignedStates &")  OR addedby = '"& Session("USBUserId") &"') And ("& strCountry &") And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"
	
	'response.Write(strCallDet)

	ElseIf Session("TypeOfUser") = "Faculty" And rqType = "Online" Then
	
	'Retrive the not follow up calls details based on city'
	strCallDet = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '3'  And (callerstate in ("& assignedStates &")  OR addedby = '"& Session("USBUserId") &"') And ("& strCountry &") And (call_status2 Is Null OR call_status2 <> 'Dummy') ORDER BY callid desc"

	ElseIf rqType = "ByFaculty" Then
'	
	'Retriving call ids based on faculty email id'
	strQuery = "SELECT distinct fcn.callid FROM fac_comments_new fcn, ITIL_callsreceived_new cn  WHERE fcn.comm_addedby = '"& Session("USBUserId") &"'"
	
	objRsCallID.Open strQuery, ConnObj
	
	'Intializing i value as zero'
	i = 0 
	
	Do Until objRsCallID.EOF
	
	'Retrive the follow up calls details based on city'
	strCallDet1 = "SELECT callid, callerstate, city, callername, phoneno, emailid, question, call_status2, addeddate, callfor, website FROM ITIL_callsreceived_new WHERE call_status1 = '3'  And "& strCountry &" And (call_status2 Is Null OR call_status2 <> 'Dummy') And callid = '"& objRsCallID("callid") &"'"
	
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
<script language="javascript" type="text/javascript">
<!--

function popitup(url) {
	newwindow=window.open(url,'name','toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=0,minimizable=0,resizable=0,height=300,width=300,top=250,left=400');
	if (window.focus) {newwindow.focus()}
	return false;
}

// -->
<!--  PMstudy -->
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
        <% ElseIf rqAction = "freeEnrollment" Then %>
        Free Enrollment
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
            <form action="/enrollClass.asp" method="post" target="_blank">
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
	    <div id="main" >
<!--         <div id="topbar">
        <ul class="topNav">
          <li><a href="marketingB2C.asp?action=noFollowUp">Calls to be made </a></li>
        </ul>
      </div>
       <div id="topbar" style="margin-left:-15px;">
        <ul class="topNav">
          <li><a href="marketingB2C.asp?action=freeEnrollment">Free Enrollment </a></li>
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
      </div>-->
      <style>
	  #subNav{
		  border-collapse:collapse;
		  height:21px;
		  }
		  #subNav th{
			  border:solid 1px #ccc;
			  background-color:#f2f2f2;
			  vertical-align:middle;
			  }
		#subNav th a{
			color:#333;
			text-decoration:none;
			font-weight:normal;
			display:block;
			height:21px;
			padding-top:9px;
			}
		#subNav th a:hover {
			color:#09C;
			background-color:#E7E7E7;
		}
	 </style> 
<table width="100%" border="1" id="subNav">
  <tr>
  <th><a href="marketingB2C.asp?action=freeEnrollment">Free Enrollment </a></th>
    <th><a href="marketingB2C.asp?action=noFollowUp">Calls to be made </a></th>
    <th><a href="marketingB2C.asp?action=followUp">Calls to be followed up </a></th>
    <th><a href="marketingB2C.asp?action=closed">Closed calls </a></th>
    <th><a href="marketingB2C.asp?action=paymentNotRec">Enrolled but not paid </a></th>
    <th><a href="marketingB2C.asp?action=paymentRec">Enrolled paid</a></th>
  </tr>
</table>

	
        <% If rqAction = "paymentNotRec" OR rqAction = "paymentRec" Then %>
         <table width="900px" class="table2">
          <tr><br />
        
            <form action="marketingB2C.asp?action=<% = rqAction %>" method="post">
              <td width="200px">City:
                <select name="city" style="width:150px;">
				  <option value="">-Select-</option>
				  <% If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then %>
				  <optgroup label="US">
                  
                  <%
					strStates = "SELECT city FROM ps_city  WHERE country = 'US' ORDER BY city"
				
				'Response.write(strStates)
				
				objRsState.Open strStates, ConnObj1
				
				Do Until objRsState.EOF %>
                  <option <% If rqCity = objRsState("city") Then %> selected="selected" <% End If %> value="<% = objRsState("city") %>">
                  <% = objRsState("city") %>
                  </option>
                  <% objRsState.Movenext
				   Loop
				   objRsState.Close %>
				   </optgroup>
				   <optgroup label="Canada">
                  
                  <%
				strStates = "SELECT city FROM ps_city WHERE country = 'Canada' ORDER BY city"
				
				'Response.write(strStates)
				
				objRsState.Open strStates, ConnObj1
				
				Do Until objRsState.EOF %>
                  <option <% If rqCity = objRsState("city") Then %> selected="selected" <% End If %> value="<% = objRsState("city") %>">
                  <% = objRsState("city") %>
                  </option>
                  <% objRsState.Movenext
				   Loop
				   objRsState.Close %>
				   </optgroup>
				   <% Else %>
                  
                  <%
				strStates = "SELECT state, state_code From ITIL_city WHERE country = '"& Session("CRM_Country") & "' ORDER BY state"

				objRsState.Open strStates, ConnObj
				
				Do Until objRsState.EOF %>
                  <option <% If rqState = objRsState("state") Then %> selected="selected" <% End If %> value="<% = objRsState("state") %>">
                  <% = Trim(objRsState("state")) %>                  </option>
                  <% objRsState.Movenext
				   Loop
				   objRsState.Close %>


				   <% End If %>		   
                 
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

		
        <fieldset>
        <table border="2" cellpadding="0" cellspacing="0" class="table1" width="900px">
          <tr>
            <td bgcolor="#A7DBFB" align="center"><b>Name</b></td>
            <td bgcolor="#A7DBFB" align="center" width="50%"><b>Course Details</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Details</b></td>
          <!--  <td bgcolor="#A7DBFB" align="center"><b>Phone Number</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Email Id</b></td>-->
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
            <td><a href="/USBackoffice/userClassDetails.asp?EnrollID=<% = enrollId %>" onClick="return popitup('/USBackoffice/userClassDetails.asp?EnrollID=<% = enrollId %>')">Details</a></td>
           <!-- <td><% '= arrAllPayNotRec(4,payNotRecRowcounter) %></td>
            <td><%' = arrAllPayNotRec(2,payNotRecRowcounter) %></td>-->
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
        <% ElseIf rqAction = "noFollowUp" OR rqAction = "followUp" OR rqAction = "closed" OR rqAction = "freeEnrollment" Then %>
              <div style="padding-top:20px;">
			  <table  width="1000px" class="table2">
               <tr>
            <%' If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then %>
      
		
               <form action="marketingB2C.asp?action=<% = rqAction %>" method="post">
                <td width="40%">
              View all states: 
                <select name="state">
				  <option value="">-Select-</option>
				  <% If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then %>
				  <optgroup label="US">
                  
                  <%
					strStates = "SELECT states, statecode FROM ps_us_states WHERE country = 'US' ORDER BY states"
				
				'Response.write(strStates)
				
				objRsState.Open strStates, ConnObj1
				
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
				strStates = "SELECT states, statecode FROM ps_us_states WHERE country = 'Canada' ORDER BY states"
				
				'Response.write(strStates)
				
				objRsState.Open strStates, ConnObj1
				
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
				strStates = "SELECT state, state_code From ITIL_city WHERE country = '"& Session("CRM_Country") & "' ORDER BY state"

				objRsState.Open strStates, ConnObj
				
				Do Until objRsState.EOF %>
                  <option <% If rqState = objRsState("state") Then %> selected="selected" <% End If %> value="<% = objRsState("state") %>">
                  <% = Trim(objRsState("state")) %>                  </option>
                  <% objRsState.Movenext
				   Loop
				   objRsState.Close %>


				   <% End If %>		   
                 
                </select>
                <input type="submit" name="search" value="Search" />
              </td>
            </form>		
			 <% 'End If %>	
             <% If rqAction = "followUp" OR rqAction = "closed" Then %>
             <form action="marketingB2C.asp?action=<% = rqAction %>" method="post">
              <td width="30%">Call Type:
                <select name="callfor">
                  <option value="">--Select--</option>
                  <option value="Classroom">Classroom</option>
                   <option value="Online">Online</option>
                  <option value="Free Enrolment">Free Enrolment</option>
                </select>
                <input type="submit" name="search" value="Search" />
              </td>
            </form>
            <% End If %>
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
        </table></div>
		<table><tr><td>&nbsp;</td></tr></table>
        <fieldset>
        <table border="2" cellpadding="0" cellspacing="0" class="table1" width="950px">
          <tr>
           <%If rqAction = "freeEnrollment" Then %>
              <td bgcolor="#A7DBFB" align="center"><b>Country</b></td>
             <%End If %>
		    <%' If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then %>
			<td bgcolor="#A7DBFB" align="center"><b>State</b></td>
			<% 'Else %>
         
			<%' End If %>
            <td bgcolor="#A7DBFB" align="center"><b>City</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Name</b></td>
           <!-- <td bgcolor="#A7DBFB" align="center"><b>Phone Number</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Email Id</b></td>-->
			<td bgcolor="#A7DBFB" align="center"><b>Type of Call</b></td>			
            <td bgcolor="#A7DBFB" align="center"><b>Question</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Comments</b></td>
            <% If rqAction <> "noFollowUp" Then %>
            <td bgcolor="#A7DBFB" align="center"><b>History</b></td>
            <% End If %>
          <!--  <td bgcolor="#A7DBFB" align="center"><b>Email</b></td>-->

            <td bgcolor="#A7DBFB" align="center"><b>Status</b></td>
          
          </tr>
          <% If IsArray(arrAllCallDet) Then
			 For rowcounter = firstRow To lastRow
			 CallID = arrAllCallDet(0,rowcounter) %>
          <tr>
               <%If rqAction = "freeEnrollment" Then%>
              <td><% = arrAllCallDet(11,rowcounter) %></td>
              <%End If %>
            <td><% 'If arrAllCallDet(1,rowcounter) <> "" Then %>
              <% = arrAllCallDet(1,rowcounter) %>
              <%' Else %>
              <% '= arrAllCallDet(6,rowcounter) %>
              <% 'End If %>
            </td>
            <td><% = arrAllCallDet(2,rowcounter) %></td>
            <td><% = arrAllCallDet(3,rowcounter) %></td>
            <td><a href="/USBackoffice/userCallDetails.asp?callID=<% = CallID %>" onClick="return popitup('/USBackoffice/userCallDetails.asp?callID=<% = CallID %>')">Details</a></td>
            <!--<td><% '= arrAllCallDet(4,rowcounter) %></td>
	
            <td><% '= arrAllCallDet(5,rowcounter) %></td>-->
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
            <!--<td class="action" width="75px"><%' If arrAllCallDet(4,rowcounter) <> "" Then %>
              <a href="sendmail.asp?callid=<% = CallID %>" class="addcomments" target="_blank">Send Email</a>
              <%' Else %>
              &nbsp;
              <%' End If %>
            </td>-->
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
                   <option value="Enrolled Paid">Enrolled Paid</option>
                  <option value="Enrolled Not Paid">Enrolled Not Paid</option>
                  <option value="Not Converted">Not Converted</option>
                  <option value="Repeated Call">Repeated Call</option>
                  <option value="No follow up required">No follow up required</option>
                  <option value="Follow up required">Follow up required</option>
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
                  <option value="Enrolled Paid">Enrolled Paid</option>
                  <option value="Enrolled Not Paid">Enrolled Not Paid</option>
                  <option value="Not Converted">Not Converted</option>
                  <option value="Repeated Call">Repeated Call</option>
                  <option value="No follow up required">No follow up required</option>
                  <option value="Follow up required">Follow up required</option>
                </select>
                 <br />
                <br />
                <input type="submit" name="type" value="Submit" />
</span></span>
				
                <% End If %>
              </td>
            </form>

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
'Sending a reminder mail to students after 8 hours'


Dim strSendMail2

Set objRsMail2 = Server.CreateObject("ADODB.Recordset") 
Set objRs2 = Server.CreateObject("ADODB.Recordset") 
Set objRsMail3 = Server.CreateObject("ADODB.Recordset") 
Set Rs2 = Server.CreateObject("ADODB.Recordset") 

strSendMail2 = "SELECT id,firstname,lastname,email,nameofemployeer,phoneno,coursedetails,coursedate,amount,dateofenrollment,paybefore,checkreceived,checkreceiveddate,checkreceivedby,status,checkrecmailsent,courseid,country, us_status,rem_mail FROM ITIL_enrolledusers WHERE us_status Is Null AND (country = '"&Session("CRM_Country")&"') AND (checkreceived Is Null OR checkreceived <> 'Yes') And rem_mail Is Null And status <> 'Cancel' And ROUND (cast ((datediff (minute,dateofenrollment,getdate()) / 60.0) as FLOAT), 2)  >= 8"


'response.Write(strSendMail2)


objRs2.Open strSendMail2, ConnObj

Do Until objRs2.EOF
Id = objRs2("id")
rqcheckreceived  = objRs2("checkreceived")
rqEmailId = objRs2("email")
rqrem_mail = objRs2("rem_mail")
rqfirstname = objRs2("firstname")
rqlastname = objRs2("lastname")
rqphoneno = objRs2("phoneno")
rqdateofenrollment = objRs2("dateofenrollment")
rqcoursedetails = objRs2("coursedetails")

rqcity1 = Split(rqcoursedetails, " ")

'status Is Null than we are sending mail to student as a reminder mail after 8 hour



If IsNull(rqrem_mail) then

strBody2 = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""45%"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td align=""center"" width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.ITILstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "&rqfirstname&" "&rqlastname&",<BR><BR>Greetings from ITILstudy!<BR><BR>We thank you for "
If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then
strBody2 = strBody2 & "enrolling"
Else
strBody2 = strBody2 & "enroling"
End If
strBody2 = strBody2 & " with ITILstudy for ITIL Foundation Exam Prep classroom training scheduled to be held at "&rqcity1(0)&". <BR><BR>In order to complete the "
If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then
strBody2 = strBody2 & "enrollment"
Else
strBody2 = strBody2 & "enrolment"
End If
strBody2 = strBody2 & " process and secure your seat for this program, please make payment towards the program fee using the link: "
If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" OR Session("CRM_Country") = "UAE" OR Session("CRM_Country") = "Singapore" ) Then
strBody2 = strBody2 & "<a href=""http://www.ITILstudy.com/payforclass.asp"" target=""_blank"">http://www.ITILstudy.com/payforclass.asp</a>"
ELseIf (Session("CRM_Country") = "United Kingdom") Then
strBody2 = strBody2 & "<a href=""http://www.ITILstudy.com/payforukclass.asp"" target=""_blank"">http://www.ITILstudy.com/payforukclass.asp</a>"
ELseIf (Session("CRM_Country") = "Australia") Then
strBody2 = strBody2 & "<a href=""http://www.ITILstudy.com/payforausclass.asp"" target=""_blank"">http://www.ITILstudy.com/payforausclass.asp</a>"
ELseIf (Session("CRM_Country") = "India") Then
strBody2 = strBody2 & "<a href=""http://www.ITILstudy.com/payforIndiaclass.asp"" target=""_blank"">http://www.ITILstudy.com/payforIndiaclass.asp</a>"
ELseIf (Session("CRM_Country") = "Germany" OR Session("CRM_Country") = "Netherlands") Then
strBody2 = strBody2 & "<a href=""http://www.ITILstudy.com/payforGermanclass.asp"" target=""_blank"">http://www.ITILstudy.com/payforGermanclass.asp</a>"
ELse
strBody2 = strBody2 & "<a href=""http://www.ITILstudy.com/payforclass.asp"" target=""_blank"">http://www.ITILstudy.com/payforclass.asp</a>"
End If
strBody2 = strBody2 & "<BR><BR>Once we receive your payment, we will provide you access to our 100% online prep course. This is a complimentary course provided by ITILstudy to introduce you to the basic concepts and processes of ITIL Foundation. The prep online course is optional as the subject matter would be dealt in detail during the classroom training program by the instructor. <BR><BR> For details regarding the syllabus, please visit <a href=""http://www.itilstudy.com/course-syllabus.asp"" target=""_blank"">http://www.itilstudy.com/course-syllabus.asp</a>.<BR><BR>If you have any questions or need any additional information, please email us at <a href=""mailto:marketing@ITILstudy.com"" target=""_blank"">marketing@ITILstudy.com</a>.<BR><BR>If you have already paid for the course, please ignore this email. <BR><BR> We look forward to having you as our student.<BR><BR>Best Regards, <br>Marketing Team<br><a href =""http://www.ITILstudy.com"">www.ITILstudy.com</a><BR>Email: <a href=""mailto:marketing@ITILstudy.com"" target=""_blank"">marketing@ITILstudy.com</a><BR>"
If (Session("CRM_Country") = "India") Then
strBody2 = strBody2 & "Ph.- 080 41557547 / 9008748005"
ElseIf (Session("CRM_Country") = "Australia") Then
strBody2 = strBody2 & "Ph.- 61 2 88964376 "
ElseIf (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then
strBody2 = strBody2 & "Ph.- 855-234-8454"
ElseIf (Session("CRM_Country") = "Singapore") Then
strBody2 = strBody2 & "Ph.- 65 91555760"
ElseIf (Session("CRM_Country") = "Germany" OR Session("CRM_Country") = "Netherlands") Then
strBody2 = strBody2 & "Ph.- +49 069 344643"
ElseIf (Session("CRM_Country") = "UAE") Then
strBody2 = strBody2 & "Ph.- 50-2757445"
ElseIf (Session("CRM_Country") = "UK") Then
strBody2 = strBody2 & "Ph.- 0800 0337 947"
End If 

strBody2 = strBody2 & "</font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"

'Response.Write(strBody2)


Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
objCDOMail.From = "marketing@ITILstudy.com"
objCDOMail.To =  ""& rqEmailId &""
'objCDOMail.To =  "edusysbharath@gmail.com, edusyssavita@gmail.com, edusysankit@gmail.com, edusysrajeev@gmail.com"
objCDOMail.cc = "marketing@ITILstudy.com"
objCDOMail.Importance = 2
objCDOMail.Subject = "Confirm your participation for the ITILstudy Foundation classroom training"
objCDOMail.BodyFormat = 0
objCDOMail.MailFormat = 0
objCDOMail.Body =  strBody2
objCDOMail.Send
Set objCDOMail = Nothing

'After sending reminder mail to student we are updating the rem_mail column in DB with 1

ConnObj.Execute("UPDATE ITIL_enrolledusers SET rem_mail = '1' WHERE id = '"& Id &"'")

End If



objRs2.Movenext
Loop
objRs2.Close



%>

</body>
</html>



