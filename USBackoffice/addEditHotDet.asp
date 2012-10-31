<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 'OPTION EXPLICIT %>
<% 
	If Session("USBUserId") = "" Then 
		Response.Redirect("login.asp")
	Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
'Written By : Bharath'
'Written Date : 04/10/2009'
'Last UpDated : 05/10/2009'
'Description :'
'This page is Hotel Bookings Details for Classes in US'
'======================================================='

	'Retrive the values from this page'
	rqCity            =  Request.Form("city")
	rqDateOfClass     =  Request.Form("dateofclass")
	rqHotel       	  =  Request.Form("hotel")
	rqNoOfStudents 	  =  Request.Form("noofstudents")
	rqHotelProjected  =  Request.Form("hotelcostprojected")
	rqAgreementFile   =  Request.Form("agreementfile")
	rqBEODetails      =  Request.Form("beodetails")
	rqPayment1        =  Request.Form("payment1")
	rqDate1           =  Request.Form("date1")
	rqPayment2        =  Request.Form("payment2")
	rqDate2           =  Request.Form("date2")
	rqPayment3        =  Request.Form("payment3")
	rqDate3           =  Request.Form("date3")
	rqPayment4        =  Request.Form("payment4")
	rqDate4           =  Request.Form("date4")
	rqPayment5        =  Request.Form("payment5")
	rqDate5           =  Request.Form("date5")
	rqResPolicy       =  Request.Form("reschepolicy")
	rqCanPolicy       =  Request.Form("cancelclause")
	rqAddedby         =  Session("USBUserId")
	rqCountry		  =  "US"
	rqBusinessType    =  "B2C"
	rqType            =  Request.Form("type")
	rqId              =  Request.Form("id")
	rqAgreement       =  Request.Form("agreementfile")
	rqBEO             =  Request.Form("beodetails")
	rqDeposit         =  Request.Form("deposit")
	rqDepositDate     =  Request.Form("depositdate")
	
	
	'this values from Hotel Contract Details'	
	rqCourseId = Request.Form("courseid")
	rqHotContName = Request.Form("hotelContractName")
	
	'Creating Record Objects'
	Set objRs = Server.CreateObject("ADODB.Recordset")
	
    If rqType = "Add Hotel Details" then
   		
		'Inserting values into the database'
   		strHotelDet = "INSERT INTO ITIL_hoteldetails (city, dateofclass, hotel, noofstudents, hotelcostprojected, payment1, payment2, payment3, payment4, payment5,"
		If rqAgreement <> "" Then
		strHotelDet = strHotelDet & "agreementfile,"
		End If
		If rqBEO <> "" Then
		strHotelDet = strHotelDet & "beodetails,"
		End If
		If rqDate1 <> "" Then
		strHotelDet = strHotelDet & "date1,"
		End If
		If rqDate2 <> "" Then
		strHotelDet = strHotelDet & "date2,"
		End If
		If rqDate3 <> "" Then
		strHotelDet = strHotelDet & "date3,"
		End If
		If rqDate4 <> "" Then
		strHotelDet = strHotelDet & "date4,"
		End If
		If rqDate5 <> "" Then
		strHotelDet = strHotelDet & "date5,"
		End If
		strHotelDet = strHotelDet & "reschedulepolicy, cancellationpolicy, addeddate, addedby, country, businesstype,"
		If rqDepositDate <> "" Then
		strHotelDet = strHotelDet & "depositdate,"
		End If
		strHotelDet = strHotelDet & "deposit)"
		strHotelDet = strHotelDet & " VALUES "
		strHotelDet = strHotelDet & "('" & rqCity & "',"
		strHotelDet = strHotelDet & "'" & rqDateOfClass & "',"
		strHotelDet = strHotelDet & "'" & rqHotel & "',"
		strHotelDet = strHotelDet & "'" & rqNoOfStudents & "',"		
		strHotelDet = strHotelDet & "'" & rqHotelProjected & "',"
		strHotelDet = strHotelDet & "'" & rqPayment1 & "',"
		strHotelDet = strHotelDet & "'" & rqPayment2 & "',"		
		strHotelDet = strHotelDet & "'" & rqPayment3 & "',"
		strHotelDet = strHotelDet & "'" & rqPayment4 & "',"
		strHotelDet = strHotelDet & "'" & rqPayment5 & "',"
		If rqAgreement <> "" Then
		strHotelDet = strHotelDet & "'" & rqAgreement & "',"
		End If
		If rqBEO <> "" Then
		strHotelDet = strHotelDet & "'" & rqBEO & "',"
		End If
		If rqDate1 <> "" Then				
		strHotelDet = strHotelDet & "'" & rqDate1 & "',"
		End If
		If rqDate2 <> "" Then
		strHotelDet = strHotelDet & "'" & rqDate2 & "',"
		End If
		If rqDate3 <> "" Then
		strHotelDet = strHotelDet & "'" & rqDate3 & "',"
		End If
		If rqDate4 <> "" Then
		strHotelDet = strHotelDet & "'" & rqDate4 & "',"
		End If
		If rqDate5 <> "" Then
		strHotelDet = strHotelDet & "'" & rqDate5 & "',"
		End If
		strHotelDet = strHotelDet & "'" & Replace(rqResPolicy,"'","''") & "',"
		strHotelDet = strHotelDet & "'" & Replace(rqCanPolicy,"'","''") & "',"
		strHotelDet = strHotelDet & "'" & Now() & "',"
		strHotelDet = strHotelDet & "'" & rqAddedby & "',"
		strHotelDet = strHotelDet & "'" & rqCountry & "',"
		strHotelDet = strHotelDet & "'" & rqBusinessType & "',"	
		If rqDepositDate <> "" Then	
		strHotelDet = strHotelDet & "'" & rqDepositDate & "',"
		End If
		strHotelDet = strHotelDet & "'" & rqDeposit & "')"
		
		Response.Write(strHotelDet)
    	objRs.open strHotelDet,ConnObj
	 	
		Response.Redirect("hotelDetails.asp")
		
	 ElseIf rqType = "Edit Hotel Details" then
	 
		strHotelDet = "UPDATE ITIL_hoteldetails SET "
		strHotelDet = strHotelDet & "city = '"& rqCity &"',"
		strHotelDet = strHotelDet & "dateofclass = '" & rqDateOfClass & "',"
		strHotelDet = strHotelDet & "hotel = '" & rqHotel & "',"
		strHotelDet = strHotelDet & "noofstudents = '" & rqNoOfStudents & "',"		
		strHotelDet = strHotelDet & "hotelcostprojected = '" & rqHotelProjected & "',"
		If rqAgreement <> "" Then
		strHotelDet = strHotelDet & "agreementfile = '" & rqAgreement & "',"
		End If
		If rqBEO <> "" Then
		strHotelDet = strHotelDet & "beodetails = '" & rqBEO & "',"
		End If	
		strHotelDet = strHotelDet & "payment1 = '" & rqPayment1 & "',"
		If rqDate1 <> "" Then
		strHotelDet = strHotelDet & "date1 = '" & rqDate1 & "',"
		End If
		strHotelDet = strHotelDet & "payment2 = '" & rqPayment2 & "',"
		If rqDate2 <> "" Then
		strHotelDet = strHotelDet & "date2 = '" & rqDate2 & "',"
		End If
		strHotelDet = strHotelDet & "payment3 = '" & rqPayment3 & "',"
		If rqDate3 <> "" Then
		strHotelDet = strHotelDet & "date3 = '" & rqDate3 & "',"
		End If
		strHotelDet = strHotelDet & "payment4 = '" & rqPayment4 & "',"
		If rqDate4 <> "" Then
		strHotelDet = strHotelDet & "date4 = '" & rqDate4 & "',"
		End If
		strHotelDet = strHotelDet & "payment5 = '" & rqPayment5 & "',"
		If rqDate5 <> "" Then
		strHotelDet = strHotelDet & "date5 = '" & rqDate5 & "',"
		End If
		strHotelDet = strHotelDet & "reschedulepolicy = '" & Replace(rqResPolicy,"'","''") & "',"
		strHotelDet = strHotelDet & "cancellationpolicy = '" & Replace(rqCanPolicy,"'","''") & "',"
		strHotelDet = strHotelDet & "addeddate = '" & Now() & "',"
		strHotelDet = strHotelDet & "addedby = '" & rqAddedby & "',"
		strHotelDet = strHotelDet & "country = '" & rqCountry & "',"
		strHotelDet = strHotelDet & "businesstype = '" & rqBusinessType & "',"	 
		If rqDepositDate <> "" Then
		strHotelDet = strHotelDet & "depositdate = '" & rqDepositDate & "',"
		End If
		strHotelDet = strHotelDet & "deposit = '" & rqDeposit & "'"	
		strHotelDet = strHotelDet & " WHERE id = '"& rqId &"'"
		
		ConnObj.Execute strHotelDet
		
		Response.Redirect("hotelDetails.asp")
		
	 ElseIf rqType = "Add Hotel Contract" OR rqType = "Edit Hotel Contract" Then
	 
	 	ConnObj.Execute("UPDATE ITIL_course SET hotelContracts = '"& rqHotContName &"' WHERE courseid = '"& rqCourseId &"'")
	 
   	 	Response.Redirect("hotelDetails.asp?action=hotelContracts")
	 
	 End If
	 


%>
<% End If %>