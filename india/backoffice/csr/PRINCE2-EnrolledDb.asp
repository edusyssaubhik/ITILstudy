<%@ LANGUAGE="VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Bharath'
'Created Date : 17/02/2012'
'Modified By : Bharath'
'Modified Date : 17/02/2012'
'Description :'
'Add/Edit/Delete PRINCE2 Course Page and PRINCE2 Enrolledusers Page'
'======================================================='
%>
<!--#include virtual="/India/connection_global.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->

<% If not Session("UserId") = "" Then %>
<%
Response.Buffer = True
Response.ExpiresAbsolute = 0

Dim rqFirstName,rqLastName,rqPrimaryEmail,rqaddress_country
Dim rqActive, conObj,rqComment,rqComments,rqCountryOrigin
Dim rqType,rqStatus,rqUser,strQuery,strQuery1,strQuery2,rqEnrollUserId
Dim rqUserId,rqEnrollDate,rqRevLevel,Setcheckreceived,Currency_Format_Front,Currency_Format_Back
Dim ChangeStatusDateBy,strVAT,RsVAT,VAT_Invoice,rqorderNo,text1,rqTotal,rqPaymentdate
Dim rqStatusNumber,rqCourseDetails,rqCity,str,i,rqModeofPayment,PRINCE2Manual
Dim rqCourseId, rqEnrollStatus,Rs,rqSrNo,rqSrNo2,rqStatus1,rqpage,rqAmount,rqVAT,VAT
Dim rqName,rqEmailid,rqcourse ,rqPhoneno,status1,rqStatus2,rqCountry,PRINCE2ManualPrice
set Rs = Server.CreateObject("ADODB.Recordset")

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function

rqUserId = Session("UserId")

'-------------------------------'
' Extracting values from posted values'
' for serching'
'-------------------------------'
    rqCourseDetails     = Request.Form("CourseDetails")
	rqType				= Request.Querystring("type")
	rqpage				= Request.Querystring("page")
	rqFirstName	    	= Request.Form("firstname")
	rqLastName          = Request.Form("lastname")
	rqPrimaryEmail		= Request.Form("email")
	rqActive			= Request.Form("review")
	rqStatus1			= Request.form("Status")
	rqStatus			= Request.form("status")
	rqUser 				= Request.form("Username")
    rqEnrollUserId      = Request.form("enrollUserId")
    rqComment           = Request.Form("comment")
	rqComments           = Request.Form("comments")
    rqEnrollDate        = Request.Form("enrolldate")
	rqCourseId          = Request.Form("courseId")
	rqEnrollStatus      = Request.Form("enrollStatus")
    rqSrNo              = Request.Form("SrNo")
	rqSrNo2             = Request.Form("SrNo2")
	rqaddress_country   = Request.Form("address_country")
	rqAmount			= Request.Form("Amount")
	rqModeofPayment     = Request.Form("modeofpayment")
	rqorderNo           = Request.Form("orderNo")
	PRINCE2Manual       = Request.Form("PRINCE2Manual")
	PRINCE2ManualPrice       = Request.Form("PRINCE2ManualPrice")
	rqVAT               = Request.Form("VAT")
	rqPaymentdate       = Request.Form("Paymentdate")

	
	
	  	'Checking the VAT is null for modes of payment'
	
	If IsNull(rqVAT) or rqVAT = "" Then
		VAT = 0
	Else 
		VAT = rqVAT
	End If


	
	If rqAmount <> "" Then
	
		If PRINCE2Manual = "Yes"  Then
			rqTotal = rqAmount + Int(VAT) + Int(PRINCE2ManualPrice)
		Else
			rqTotal = rqAmount + Int(VAT)
		End If
		
	Else
		rqTotal = rqAmount
	End If


rqName = Request.Form("Name")
rqEmailid = Request.Form("Emailid")
rqcourse = Request.Form("course")
rqPhoneno = Request.Form("phoneno")
status1 = Request.form("Status")
rqStatus2 = Request.form("Edit")
rqCountry=Request.Form("country")


	
str = Split(rqCourseDetails,":")

For i = 0 to Ubound(str)
	rqCity = Trim(str(0))
Next

'Price Format Display Functions'

 Currency_Format_Front = CurrencyFormat_Front(Session("country"))

Currency_Format_Back = CurrencyFormat_Back(Session("country"))
					 


If rqType = "review" Then

	If  (rqActive = "Yes") Then
	
	'Generating VAT Invoice Number'
	'Only for United Kingdom'
	Set RsVAT = server.CreateObject("ADODB.recordset")
	
	If Session("country") = "United Kingdom" Then
	
	strVAT = "SELECT MAX(VAT_Invoice) As VATInvoice FROM prince2_enrolledusers"
	
	RsVAT.Open strVAT, ConnObj
	
	Do Until RsVAT.EOF
		
		'Checkint the Maximum VAT values'
		If Not IsNull(RsVAT("VATInvoice")) Then
			
			VAT_Invoice = RsVAT("VATInvoice") + 1
			
		Else
		
			VAT_Invoice = 1001
			
		End If
	
	RsVAT.Movenext
	Loop
	RsVAT.Close
	
	End If
	
	
	'Since we do not have blend course. So, we commented the below coode'
	'Start - Blend'	 
	'Generating code for ITILstudy blended course - Only for United Kingdom and Australia'
	Set RsVAT = server.CreateObject("ADODB.recordset")
	
'	If Session("country") = "United Kingdom" OR Session("country") = "Australia" Then
'	
'	 'Generating default/random code for ITILstudy blended course'
'							 'Generating unique random code'
'							 Dim validDate,orderid,ITIL_code
'							 Dim randomno1,randomno2,randomno3,randomno4,randomno5,randomno6,randomno7
'							 
'								orderid = "ITIL"
'								
'								randomno1=int(Year(Date()))
'								
'								randomno2=int(Month(Date()))
'								
'								randomno3=int(Day(Date()))
'								
'								randomno4=int((Hour(Now())))
'								
'								randomno5=int((Minute(Now())))
'								
'								randomno6=int((Second(Now())))
'								
'								randomno7 = (randomno1 &""& randomno2 &""& randomno3 &""& randomno4 &""& randomno5 &""& randomno6)
'								
'								ITIL_code = orderid &""& randomno7
'	
'	ValidDate = now() + 30
'	
'
'	 strQuery = "Insert Into ITIL_blended(payer_email,date_entered,date_valid,ITIL_code)"
' strQuery = strQuery & " Values "
' strQuery = strQuery & "('" & rqPrimaryEmail & "',"
' strQuery = strQuery & "'" & Now() & "',"
' strQuery = strQuery & "'" & ValidDate & "',"
' strQuery = strQuery & "'" & ITIL_code & "')"
'      Rs.Open strQuery,ConnObj
'
'	
'	End If
	
	'End - Blend'

	  strQuery = "Update prince2_enrolledusers Set "
	  strQuery = strQuery & "checkreceived = '" & rqActive & "',"
	  strQuery = strQuery & " checkreceivedby = '" & rqUserId & "' ,"
	  strQuery = strQuery & " checkreceiveddate = '" & Now() & "',"
	  If Session("country") = "United Kingdom" Then
	  strQuery = strQuery & "VAT_Invoice = '"& VAT_Invoice &"'," 	
      End If
	  strQuery = strQuery & "statusnumber   = '4',"
	  strQuery = strQuery & " modeofpayment = '"& rqModeofPayment &"',"
	  strQuery = strQuery & " OrderNo       = '"& rqorderNo &"'"
	  strQuery = strQuery & " where  id     = '" & rqEnrollUserId & "'"

      Rs.Open strQuery,ConnObj
	  
	 
	 	  'Dividing Order Number ,Transaction Number ,Check Number based on mode of payment
	  Select Case rqModeofPayment
	  	
		Case "Google Checkout", "CCAvenue - USD", "CCAvenue - INR"
		     text1 = "Order Number"
		
		Case "PayPal", "HSBC - UK", "ICICI Bank"
			 text1 = "Transaction ID"

		Case "HSBC - UK", "ICICI Bank"
			 text1 = "Transaction Number"	 
			  	
		Case "BOA - Check"
			 text1 = "Check Number"	 
			 
		Case "BOA - Wire Transfer", "BOA-Counter Credit"
			 text1 = ""	 	
			 
		Case "Cash"
			 text1 = ""	 
			 
		Case "Cheque"
			 text1 = ""	 			
		
	  End Select
	  

	 
	 If (rqModeofPayment  <> "BOA - Wire Transfer" AND rqModeofPayment <> "BOA-Counter Credit" AND rqModeofPayment <> "Cash" AND rqModeofPayment <> "Cheque") Then

 		rqComment  =  "receipt of "& Currency_Format_Front &""& rqTotal &""& Currency_Format_Back &" through "& rqModeofPayment &" with "&text1&" : "& rqorderNo &" dated " & MonthName(Month((rqPaymentdate))) & " " & Day(rqPaymentdate) & ", " & Year(rqPaymentdate)
		
	 Else
	 
  	    rqComment  =  "receipt of "& Currency_Format_Front &""& rqTotal &""& Currency_Format_Back &" through "& rqModeofPayment &" " &" dated " &  MonthName(Month((rqPaymentdate))) & " " & Day(rqPaymentdate) & ", " & Year(rqPaymentdate)

	 End If
	 
	  strQuery1 = "Insert Into prince2_enrolledusercomments (comment,enteredby,createddate,enrolluserid)"
	 strQuery1 = strQuery1 & " Values "
	 strQuery1 = strQuery1 & "('" & StrQuoteReplace(rqComment) & "',"
	 strQuery1 = strQuery1 & "'" & Session("UserId") & "',"
	 strQuery1 = strQuery1 & "'" & Now() & "',"
	 strQuery1 = strQuery1 & "'" & rqEnrollUserId & "')"
	
	 ConnObj.Execute strQuery1

    Response.redirect("PRINCE2-BCourses.asp?CourseId="&rqCourseId)

	 

	End If

ElseIf rqType = "status" then

  rqStatus = request.Form("changestatus")
  ChangeStatusDateBy = Now() & " by " & rqUserId
  'Response.Write(rqActive)
 
  If rqActive = 4 Then
     rqStatusNumber = 4
  Else
	  If rqStatus = "Active" then
		 rqStatusNumber = 1
	  ElseIf rqStatus = "Re-Schedule" then
		 rqStatusNumber = 2
	  ElseIf rqStatus = "Cancel" then
		 rqStatusNumber = 3
	  End If
  End If
	 
	strQuery1 =  "Update prince2_enrolledusers set status = '" & rqStatus & "',changestatusdateby = '" & ChangeStatusDateBy &"',statusnumber = '" & rqStatusNumber & "'  where id = '" & rqEnrollUserId & "'"

    Rs.Open strQuery1,ConnObj

    Response.Redirect("PRINCE2-BCourses.asp?CourseId="&rqCourseId)

ElseIf rqType = "comment" then

 rqComment  =  Request.Form("notes")
 rqRevLevel =  Session("maxRevLevel")

 strQuery1 = "Insert Into prince2_enrolledusercomments (comment,enteredby,createddate,revlevel,enrolluserid)"
 strQuery1 = strQuery1 & " Values "
 strQuery1 = strQuery1 & "('" & StrQuoteReplace(rqComment) & "',"
 strQuery1 = strQuery1 & "'" & Session("UserId") & "',"
 strQuery1 = strQuery1 & "'" & Now() & "',"
 strQuery1 = strQuery1 & "'" & rqRevLevel & "',"
 strQuery1 = strQuery1 & "'" & rqEnrollUserId & "')"

 Rs.Open strQuery1,ConnObj

 Session("message") = "You Have Successfully Added Comment"
 Response.Redirect("PRINCE2-BCourses.asp?CourseId="&rqCourseId)
 
 ElseIf rqType = "comments" then

' rqComments  =  Request.Form("notes")
' rqRevLevel =  Session("maxRevLevel")
'
' strQuery1 = "Insert Into freeenrolledusercomments (comment,enteredby,createddate,revlevel,enrolluserid)"
' strQuery1 = strQuery1 & " Values "
' strQuery1 = strQuery1 & "('" & StrQuoteReplace(rqComments) & "',"
' strQuery1 = strQuery1 & "'" & Session("UserId") & "',"
' strQuery1 = strQuery1 & "'" & Now() & "',"
' strQuery1 = strQuery1 & "'" & rqRevLevel & "',"
' strQuery1 = strQuery1 & "'" & rqEnrollUserId & "')"
'
' Rs.Open strQuery1,ConnObj
'
' Session("message") = "You Have Successfully Added Comment"
' Response.Redirect("enrolments.asp?type=Submit")
 
 ElseIf rqpage = "Status" Then
 
 
 strQuery1 = "Insert Into callsreceived_new (callfor,callername,phoneno,emailid,question,call_status1,call_status2,addeddate,addedby,country,website,ID)"
 strQuery1 = strQuery1 & " Values "
  strQuery1 = strQuery1 & "('Free enroll',"
 strQuery1 = strQuery1 & "'" &rqName& "',"
 strQuery1 = strQuery1 & "'" & rqPhoneno& "',"
 strQuery1 = strQuery1 & "'" & rqEmailid& "',"
 strQuery1 = strQuery1 & "'" & rqcourse & "',"
 strQuery1 = strQuery1 & " '1' ,"
 strQuery1 = strQuery1 & "'" & status1 & "',"
 strQuery1 = strQuery1 & "'" & Now() & "',"
 strQuery1 = strQuery1 & "'" & Session("UserId") & "',"
 strQuery1 = strQuery1 & "'" & rqaddress_country & "',"
 strQuery1 = strQuery1 & "'PROJstudy',"
 strQuery1 = strQuery1 & "'" & rqCourseId & "'  )"
	Rs.Open strQuery1, ConnObj
 Response.Redirect("enrolments.asp?type=preview&SrNo="&rqSrNo&"&SrNo2="&rqSrNo2&"")
	'ConnObj.Execute "UPDATE freeenrolleduserstatus SET status = '" & rqStatus1 & "', enteredby = '"& Session("UserId") &"' WHERE enrolluserid = '" & rqEnrollUserId &"'"
Elseif rqpage = "Edit" Then
      
	  
ConnObj.Execute "UPDATE callsreceived_new SET call_status2 = '" & rqStatus2 & "', addedby = '"& Session("UserId") &"' WHERE ID = '" & rqCourseId &"'"
 Response.Redirect("enrolments.asp?type=preview&SrNo="&rqSrNo&"&SrNo2="&rqSrNo2&"")


ElseIf rqType = "enrollStatus" Then

	ConnObj.Execute "UPDATE prince2_enrolledusers SET us_status = '" & rqEnrollStatus & "', us_status_addedby = '"& Session("UserId") &"' WHERE id = '" & rqEnrollUserId &"'"
	Response.Redirect("PRINCE2-BCourses.asp?CourseId="&rqCourseId)

End If

%>
<%

  ConnObj.Close
  Else
  Response.Redirect("../login.asp")
  End If
%>