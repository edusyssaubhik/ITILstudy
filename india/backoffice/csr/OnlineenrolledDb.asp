
<!--#include virtual="/india/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<!--#include virtual="/includes/connectionRef.asp"-->
<% If not Session("UserId") = "" Then %>
<%
Response.Buffer = True
Response.ExpiresAbsolute = 0

Dim rqFirstName,rqLastName,rqPrimaryEmail
Dim rqActive, conObj,rqComment
Dim rqType,rqStatus,rqUser,strQuery,strQuery1,strQuery2,rqOnlineEnrollUserId
Dim rqUserId,rqEnrollDate,rqRevLevel,rqPOExpected
Dim ChangeStatusDateBy,EnrollStatus,POExpectedDate1
Dim rqStatusNumber,rqCourseDetails,rqCity,str,i,Currency_Format_Front,Currency_Format_Back
Dim rqCourseId, rqEnrollStatus,rqPaymentdate, rqModeofPayment, rqAmount, text1, rqorderNo
Dim strVAT, RsVAT, VATInvoice, VAT_Invoice, rqVAT, rqTotal, VAT,rqSrNo,rqSrNo2,rqCountryOrigin
Dim rqName,rqEmailid,rqcourse ,rqPhoneno,status1,rqStatus2,rqCountry,rqpage,rqaddress_country
DIm Rs1,Rs2,Rs3,Rs4,RsPoint,strQuery3,RefID,Ref_Points,strRewPoints,RewardPoints,Points,TotalPoints

set Rs = Server.CreateObject("ADODB.Recordset")
set Rs1 = Server.CreateObject("ADODB.Recordset")
set Rs2 = Server.CreateObject("ADODB.Recordset")
Set Rs3 = Server.CreateObject("ADODB.Recordset")
Set Rs4 = Server.CreateObject("ADODB.Recordset")
Set RsPoint  = Server.CreateObject("ADODB.Recordset")

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function

rqUserId = Session("UserId")

'Creating Recordset'
Set RsVAT = Server.CreateObject("ADODB.Recordset")

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
	rqStatus			= Request.form("status")
	rqUser 				= Request.form("Username")
    rqOnlineEnrollUserId      = Request.form("OnlineEnrollUserId")
    rqComment           = Request.Form("comment")
    rqEnrollDate        = Request.Form("enrolldate")
	rqCourseId          = Request.Form("courseId")
	rqEnrollStatus      = Request.Form("enrollStatus")
	rqPaymentdate       = Request.Form("Paymentdate")
	rqPOExpected        = Request.Form("POexpected")
	EnrollStatus        = Request.Form("enrollStatus")
	POExpectedDate1     = Request.Form("POexpected")
	rqModeofPayment     = Request.Form("modeofpayment")
	rqAmount			= Request.Form("Amount")
	rqorderNo			= Request.Form("orderNo")
	rqVAT               = Request.Form("VAT")
	 rqSrNo              = Request.Form("SrNo")
	rqSrNo2             = Request.Form("SrNo2")
	rqaddress_country   = Request.Form("address_country")
	rqCountryOrigin 	= Request.Form("CountryOrigin")


    Response.Write rqType

'Checking the VAT is null'
	
	If IsNull(rqVAT) or rqVAT = "" Then
		VAT = 0
	Else 
		VAT = rqVAT
	End If
	
	If rqAmount <> "" Then
		rqTotal = rqAmount + Int(VAT)
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



'$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ Payment Received column from OnlineCourses Page$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 
If rqType = "review" Then

	If  (rqActive = "Yes") Then
	
		'Generating VAT Invoice Number'
	'Only for United Kingdom'
	
	If (Session("country") = "United Kingdom" ) Then
	
	strVAT = "SELECT MAX(VAT_Invoice) As VATInvoice FROM ITIL_enrolledusers"
	
	RsVAT.Open strVAT, Conn
	
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
	
	'Updating the table'
	strQuery = "Update ITIL_enrolledusers Set "
	strQuery = strQuery & "checkreceived = '" & rqActive & "',"
	strQuery = strQuery & "checkreceivedby = '" & rqUserId & "'," 
	strQuery = strQuery & "checkreceiveddate = '" & rqPaymentdate & "',"
	strQuery = strQuery & "statusnumber = '4'," 
    If (Session("country") = "United Kingdom") Then
	strQuery = strQuery & "VAT_Invoice = '"& VAT_Invoice &"'," 	
    End If
	strQuery = strQuery & "modeofpayment = '"& rqModeofPayment &"'," 
	strQuery = strQuery & "orderNo = '"&rqorderNo&"'"
	strQuery = strQuery & "where  id = '" & rqOnlineEnrollUserId & "'"


	
      Rs.Open strQuery,Conn

     'Response.redirect("OnlineCourses.asp  ?CourseId="&rqCourseId)
	 
	 


	  
	  
	    'Dividing Order Number ,Transaction Number ,Check Number based on mode of payment
	  Select Case rqModeofPayment
	  	
		Case "Google Checkout", "CCAvunue - USD", "CCAvunue - INR"
		     text1 = "Order Number"
		
		Case "PayPal", "HSBC - UK", "ICICI Bank"
			 text1 = "Transaction ID"

		Case "HSBC - UK", "ICICI Bank"
			 text1 = "Transaction Number"	 
			  	
		Case "BOA - Check"
			 text1 = "Check Number"	 
			 
		Case "BOA - Wire Transfer", "BOA-Counter Credit" , "Cash" , "Bank Transfer - ANZ","Bank Transfer - DB"
			 text1 = ""	 				
		
	  End Select
	  
	  ' Response.Write("Test"& rqAmount)
	  

	 
	 If (rqModeofPayment  <> "BOA - Wire Transfer" AND rqModeofPayment <> "BOA-Counter Credit" AND rqModeofPayment <> "Bank Transfer - DB" AND rqModeofPayment <> "Cash" AND rqModeofPayment <> "Bank Transfer - ANZ") Then

 		rqComment  =  "receipt of "& Currency_Format_Front &""& rqTotal &""& Currency_Format_Back &" through "& rqModeofPayment &" with "&text1&" : "& rqorderNo &" dated " & MonthName(Month((rqPaymentdate))) & " " & Day(rqPaymentdate) & ", " & Year(rqPaymentdate)
		
	 Else
	 
  	    rqComment  =  "receipt of "& Currency_Format_Front &""& rqTotal &""& Currency_Format_Back &" through "& rqModeofPayment &" " &" dated " & rqPaymentdate

	 End If
	

	 strQuery1 = "Insert Into ITIL_onlineenrolledusercomments (comment,enteredby,createddate,OnlineEnrollUserId)"
	 strQuery1 = strQuery1 & " Values "
	 strQuery1 = strQuery1 & "('" & StrQuoteReplace(rqComment) & "',"
	 strQuery1 = strQuery1 & "'" & Session("UserId") & "',"
	 strQuery1 = strQuery1 & "'" & Now() & "',"
	 strQuery1 = strQuery1 & "'" & rqOnlineEnrollUserId & "')"
	 
	 'Response.write(strQuery1)
	
	 Conn.Execute strQuery1

    Response.redirect("OnlineCourses.asp?CourseId="&rqCourseId)

	End If

'$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ Payment Received column from OnlineCourses Page Ends $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 
 
 '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ Status column from OnlineCourses Page starts $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 

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
	  ElseIf rqStatus = "MBG" then
		 rqStatusNumber = 4
	  End If
  End If
	 
	strQuery1 =  "Update ITIL_enrolledusers set status = '" & rqStatus & "',changestatusdateby = '" & ChangeStatusDateBy &"',statusnumber = '" & rqStatusNumber & "'  where id = '" & rqOnlineEnrollUserId & "'"

    Rs.Open strQuery1,Conn

    Response.Redirect("OnlineCourses.asp?CourseId="&rqCourseId)


 '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ Status column from OnlineCourses Page Ends $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 

'*******************************If They Enter comments in OnlineCourses.asp Under comments column it will come here *****************************************************
ElseIf rqType = "comment" then
    response.Write("jjdjhdj")
 rqComment  =  Request.Form("notes")
 rqRevLevel =  Session("maxRevLevel")

 strQuery1 = "Insert Into ITIL_onlineenrolledusercomments (comment,enteredby,createddate,revlevel,OnlineEnrollUserId)"
 strQuery1 = strQuery1 & " Values "
 strQuery1 = strQuery1 & "('" & StrQuoteReplace(rqComment) & "',"
 strQuery1 = strQuery1 & "'" & Session("UserId") & "',"
 strQuery1 = strQuery1 & "'" & Now() & "',"
 strQuery1 = strQuery1 & "'" & rqRevLevel & "',"
 strQuery1 = strQuery1 & "'" & rqOnlineEnrollUserId & "')"

 Rs.Open strQuery1,Conn

 Session("message") = "You Have Successfully Added Comment"
 Response.Redirect("OnlineCourses.asp?CourseId="&rqCourseId)
 
 
'************************************************************ Entering comments ends *************************************************************************************


 ElseIf rqType = "comments" then
 
 rqComments  =  Request.Form("notes")
 rqRevLevel =  Session("maxRevLevel")

 strQuery1 = "Insert Into freeenrolledusercomments (comment,enteredby,createddate,revlevel,OnlineEnrollUserId)"
 strQuery1 = strQuery1 & " Values "
 strQuery1 = strQuery1 & "('" & StrQuoteReplace(rqComments) & "',"
 strQuery1 = strQuery1 & "'" & Session("UserId") & "',"
 strQuery1 = strQuery1 & "'" & Now() & "',"
 strQuery1 = strQuery1 & "'" & rqRevLevel & "',"
 strQuery1 = strQuery1 & "'" & rqOnlineEnrollUserId & "')"

 Rs.Open strQuery1,Conn

 Session("message") = "You Have Successfully Added Comment"
 Response.Redirect("enrolments.asp?type=Submit")
 
 ElseIf rqpage = "Status" Then
 
 strQuery1 = "Insert Into ITIL_callsreceived_new (callfor,callername,phoneno,emailid,question,call_status1,call_status2,addeddate,addedby,country,website,ID)"
 strQuery1 = strQuery1 & " Values "
  strQuery1 = strQuery1 & "('Free Enrolment',"
 strQuery1 = strQuery1 & "'" &rqName& "',"
 strQuery1 = strQuery1 & "'" & rqPhoneno& "',"
 strQuery1 = strQuery1 & "'" & rqEmailid& "',"
 strQuery1 = strQuery1 & "'" & rqcourse & "',"
 strQuery1 = strQuery1 & " '1' ,"
 strQuery1 = strQuery1 & "'" & status1 & "',"
 strQuery1 = strQuery1 & "'" & Now() & "',"
 strQuery1 = strQuery1 & "'" & Session("UserId") & "',"
 strQuery1 = strQuery1 & "'" & rqaddress_country & "',"
 strQuery1 = strQuery1 & "'ITILstudy',"
 strQuery1 = strQuery1 & "'" & rqCourseId & "'  )"
	Rs.Open strQuery1, Conn

  Response.Redirect("enrolments.asp?type=preview&CountryOrigin="&rqaddress_country&"&SrNo="&rqSrNo&"&SrNo2="&rqSrNo2&"")
  
	'ConnObj.Execute "UPDATE freeenrolleduserstatus SET status = '" & rqStatus1 & "', enteredby = '"& Session("UserId") &"' WHERE OnlineEnrollUserId = '" & rqOnlineEnrollUserId &"'"
Elseif rqpage = "Edit" Then
      
	  
Conn.Execute "UPDATE ITIL_callsreceived_new SET call_status2 = '" & rqStatus2 & "', addedby = '"& Session("UserId") &"' WHERE ID = '" & rqCourseId &"'"
 Response.Redirect("enrolments.asp?type=preview&CountryOrigin="&rqaddress_country&"&SrNo="&rqSrNo&"&SrNo2="&rqSrNo2&"")


''''******************************************** On selecting Option in Enroll Status Column in OnlineCourses.asp page************************************

ElseIf rqType = "enrollStatus" And POExpectedDate1 = "" Then

	Conn.Execute "UPDATE PayPalDbTest SET us_status = '" & rqEnrollStatus & "', us_status_addedby = '"& Session("UserId") &"' WHERE id = '" & rqOnlineEnrollUserId &"'"
	'response.Write("UPDATE PayPalBdTest SET us_status = '" & rqEnrollStatus & "', us_status_addedby = '"& Session("UserId") &"' WHERE id = '" & rqOnlineEnrollUserId &"'")
	Response.Redirect("OnlineCourses.asp?OnlineEnrollUserId="&rqOnlineEnrollUserId)


ElseIf  rqType = "enrollStatus" And EnrollStatus = "P.O Received" AND POExpectedDate1 <> "" Then

	Conn.Execute "UPDATE PayPalDbTest SET us_status = '" & rqEnrollStatus & "', po_expected = '" & rqPOExpected & "', us_status_addedby = '"& Session("UserId") &"' WHERE id = '" & rqOnlineEnrollUserId &"'"
	'response.Write("UPDATE PayPalDbTest SET us_status = '" & rqEnrollStatus & "', po_expected = '" & rqPOExpected & "', us_status_addedby = '"& Session("UserId") &"' WHERE id = '" & rqOnlineEnrollUserId &"'")
	Response.Redirect("OnlineCourses.asp?OnlineEnrollUserId="&rqOnlineEnrollUserId)

''''''******************************************************************* On selecting Option in Enroll Status Column Ends************************************
End If




%>
<%

  Conn.Close
  Else
  Response.Redirect("../login.asp")
  End If
%>