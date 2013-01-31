<!--#include virtual="/metatags/dates_location_metatag.html"-->
<!--#include virtual="/includes/headermeta_withoutDD.asp"-->
<!--#include virtual="/includes/innerbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<!--#include virtual="/includes/libfuncs.asp"-->
<!--#include virtual="/includes/connectionRef.asp"-->
<%'***** include  validation file **************' %>
<!-- #include virtual = "/includes/formvalidation.asp"-->
<%
'If course id is nothing then redirect to enrollClass.asp page'
rqCourseId =  Request.Form("courseid")
If rqCourseId = "" Then
    Response.Redirect("/enrollClass.asp")
End If
%>
<!-- Body Starts -->
<%
'Declare Local Variables'
Dim rqCourseId, rqFirstName, rqLastName, rqEmail, rqNameOfEmployeer
Dim rqPhoneNumber, rqCourseDetails, rqPriceWithTax, rqPriceWithOutTax
Dim objRs, todaysDate, PayBefore, Currency_Format_Front, Currency_Format_Back
Dim strCourseDet, City, StartDate, EndDate, ApplicableDays, Country
Dim HotelName, HotelPhNo, HotelURL, HotelAddress, TotalWithoutTax, Total, Tax
Dim VAT_Cal1, VAT_Cal2, VAT, strBody,rqStreet,rqCity,rqState,rqPostalCode,rqClasstype
Dim strCity, stateCode, CourseDetails, CourseDate, EnrolledCourse, strInsertEnrollDet
Dim Rs

'Replace method
Function StrQuoteReplace(strValue)
StrQuoteReplace = Replace(strValue, "'", "''")
End Function


'Creating recordobjects'
Set objRs = Server.CreateObject("ADODB.Recordset")
Set Rs    = Server.CreateObject("ADODB.Recordset")

'Dispaly The Today Date'
todaysDate = now()

'Increment 5 Days and Displaying purpose'
PayBefore = DateAdd("d", +4,CDate(todaysDate))

'Retrive The Enrolluser Details from enrollClass.asp page'
rqCourseId         =  Request.Form("courseid")
rqFirstName 	   =  Trim(Request.Form("firstname"))
rqLastName 		   =  Trim(Request.Form("lastname"))
rqEmail 		   =  Trim(Request.Form("email"))
rqNameOfEmployeer  =  Trim(Replace(Request.Form("employer"),"'","''"))
rqPhoneNumber 	   =  Trim(Request.Form("phoneno"))
rqStreet           =   Trim(Replace(Request.Form("street"),"'","''"))
rqCity             =   Trim(Replace(Request.Form("city"),"'","''"))
rqState 		   =   Trim(Replace(Request.Form("state1"),"'","''"))
rqPostalCode 	   =   Trim(Request.Form("postalCode"))
rqCourseDetails    =  Trim(Request.Form("class"))
rqPriceWithTax 	   =  Trim(Request.Form("pricewithtax"))
rqPriceWithOutTax  =  Trim(Request.Form("pricewithouttax"))
rqcheck        = Request.Form("check")
'response.Write(rqcheck)
'If  Request.Form("CourseType") = "Enroll" OR  Request.Form("CourseType") = "Enrol" Then
'rqCourseType = "Classroom"
'Else
'rqCourseType = Request.Form("CourseType")
'End If

If  Request.Form("CourseType") = "Live" Then
    rqCourseType = "Live"
ElseIf Request.Form("CourseType") = "WBT" Then
    rqCourseType = "WBT"
Else
    rqCourseType = "Classroom"
End If

'If we directly open enrollclass.asp , empty value is stored in enrolled for column    
If Trim(rqCourseType) = "" Then
    Set rsEnrolledfor = Server.CreateObject("ADODB.Recordset")
    Qu = "Select Coursetype from ITIL_course where courseid = '" & Trim(rqCourseId) &"'"
    rsEnrolledfor.Open Qu,ConnObj
    If Not rsEnrolledfor.Eof Then
        If Trim(rsEnrolledfor("Coursetype")) = "Live" Then
            rqCourseType = "Live"
        ElseIf Trim(rsEnrolledfor("Coursetype")) ="WBT" Then
            rqCourseType = "WBT"
        Else 
            rqCourseType = "Classroom"
        End If
    End If
    rsEnrolledfor.close
End If

today =Now()

'Put Into Session Displaying Purpose'
Session("FirstName")        =  rqFirstName
Session("LastName")         =  rqLastName
Session("Email")            =  rqEmail
Session("NameOfEmployeer")  =  rqNameOfEmployeer
Session("PhoneNumber")      =  rqPhoneNumber
Session("Course")           =  rqCourseDetails
Session("Street")           =  rqStreet
Session("city")             =  rqCity
Session("statename")        =  rqState
Session("postalCode")       =  rqPostalCode 
Session("postalCode")       =  rqPostalCode 
session("rqcheck")          = rqcheck
                             
Session("CourseId1")        =  rqCourseId



'*******'
'rqclasstype = Request.Form("classtype")
rqDiscount  =  Trim(Request.Form("Discount"))
rqDiscountCode1 = Trim(Request.Form("Disountvoucher"))
FBdiscount = Request.Form("FBdiscount")
rqClasstype = Request.Form("ClassType")
rqTag              = Trim(request.Form("Tag"))

'*********validation for the form start******************'
        'Madhava starts

	Session("ErrorFirstName") = ""
	Session("ErrorLastName") = ""
	Session("ErrorEmail") = ""
	Session("ErrorPhone") = ""
	Session("Errorstreet") = ""
	Session("Errorcity") = ""
	Session("Errorstate") = ""
	Session("ErrorPostalCode") = ""
	Session("ErrorCourse") = ""
	Session("Errorcheck") = ""


    'Madhav Ends

    If rqFirstName ="" Then
	Session("ErrorFirstName") = valueRequired(rqFirstName)
	Else
    Session("ErrorFirstName") = ForNames(rqFirstName)
	End If


     If rqLastName ="" Then
	Session("ErrorLastName") = valueRequired(rqLastName)
	Else
    Session("ErrorLastName") = ForNames(rqLastName)
	End If
	
	If rqEmail ="" Then
	Session("ErrorEmail") = valueRequired(rqEmail)
	Else
	Session("ErrorEmail") = ForEmail(rqEmail)
    End If
	
	If rqPhoneNumber ="" Then
	Session("ErrorPhone") = valueRequired(rqPhoneNumber)
	Else
    Session("ErrorPhone") = ForNumber(rqPhoneNumber)
	End If
	
	
	If Session("CountryOrigin") <> "US" And Session("CountryOrigin") <> "Canada" Then 
	
	If rqStreet ="" Then
	Session("Errorstreet") = valueRequired(rqStreet)
	End If
	
	If rqCity ="" Then
	Session("Errorcity") = valueRequired(rqCity)
	Else
    Session("Errorcity") = ForNames(rqCity)
	End If
	
	If rqState ="" Then
	Session("Errorstate") = valueRequired(rqState)
	Else
    Session("Errorstate") = ForNames(rqState)
	End If
	
    If rqPostalCode ="" Then
	Session("ErrorPostalCode") = ForotherNumber(rqPostalCode)
	Else
    Session("ErrorPostalCode") = ForotherNumber(rqPostalCode)
	End If
	
	End If
	
	If rqCourseId ="" Then
	Session("ErrorCourse") = valueRequired(rqCourseId)
	End If
	
	If rqcheck ="" Then
	Session("Errorcheck") = valueRequired(rqcheck)
	End If
	
'Response.write( Session("Errorcheck"))

If Session("ErrorFirstName") <> "" OR Session("ErrorLastName") <> "" OR Session("ErrorEmail") <> "" OR  Session("ErrorPhone") <> "" OR Session("Errorstreet") <> "" OR Session("Errorcity") <> "" OR Session("Errorstate")<> ""  OR Session("ErrorPostalCode") <> "" Then 

	'Query to insert values if they enter wrong values
		ConnObj.Execute("INSERT INTO dummy_enrolledusers (courseid,firstname, lastname, email, phoneno,street,city,state,postalCode,dateentered) VALUES ('"&rqCourseId&"', '"&rqFirstName&"','"&rqLastName&"', '"&rqEmail&"', '"&rqPhoneNumber&"', '"&rqStreet&"', '"&rqCity&"', '"&rqState&"', '"&rqPostalCode&"','"&today&"')")
	Response.redirect("enrollclass.asp")
	
	'*********validation ends ******************'
Else

'******************************* Here ends the voucher checking ******************************************'

'Here we are checking the discount voucher '

If rqTag <> "" Then

strQuery = "SELECT * FROM Ref_Voucher WHERE Voucher = '"& rqTag &"' AND ValidDate >= '"&Now()&"' AND VStatus IS NULL"
'response.Write(strQuery)
objRs.Open strQuery, ConnObjRef
If NOT objRs.EOF Then

rqDiscountCode = objRs("Voucher")
UsedPoints = objRs("UsedPoints")
'response.Write(ITILcode)


'Here updating that voucher as used one'

ConnObjRef.Execute "UPDATE Ref_Voucher SET VStatus = '1',VUsedDate = '"&Now()&"'  WHERE Voucher = '"& rqTag &"'"

End If
objRs.Close

End If

'Here ends the voucher checking'


'Server side validation'
If rqCourseId = "" OR rqFirstName = "" Then 

Response.Redirect("/enrollClass.asp")

End If



'Retriving country based on course id if session is expired'
If rqCourseId <> "" Then

 strCountry = "SELECT country FROM ITIL_course WHERE courseid = '"& rqCourseId &"'"

 objRs.Open strCountry, ConnObj

 Do Until objRs.EOF
   Session("CountryOrigin") = Trim(objRs("Country"))
   
 objRs.Movenext
 Loop		
 objRs.Close	

Else

Session("CountryOrigin") = Session("CountryOrigin")

End If

'Currency Format Display Functions'
Currency_Format_Front = CurrencyFormat_Front(Session("CountryOrigin"))

Currency_Format_Back = CurrencyFormat_Back(Session("CountryOrigin"))

'SQL Query For Retrieve The Prices Displaying purpose'
strCourseDet = "SELECT * FROM ITIL_course Where courseid = '" & rqCourseId & "'"

objRs.Open strCourseDet,ConnObj

'response.Write("Hello")
Do Until objRs.EOF



	City           =  objRs("city")
	StartDate      =  objRs("startdate")
	EndDate        =  objRs("enddate")
	ApplicableDays =  objRs("applicabledays")

	If Session("CountryOrigin") = "US" Or Session("CountryOrigin") = "Canada" Then
         If  Session("Virtualclass") <> "" then
            Country = Session("Virtualclass")
        End If
    Else
	    Country 	   =  objRs("country")
    End If
	HotelName      =  objRs("hotelname")
	HotelPhNo      =  objRs("hotelphonenumber")
	HotelURL       =  objRs("hotelurl")
	HotelAddress   =  objRs("hoteladdress")
    rqClasstype    =  objRs("coursetype")
   	
	If (CDate(StartDate)-(Date()+ApplicableDays+1) >= 0) Then
		TotalWithoutTax = objRs("afterEBdiscountwithouttax")
		Total = objRs("afterEBdiscountwithtax")
		TotalCCAvenue = Int(objRs("afterEBdiscountwithtax"))
	Else
		TotalWithoutTax = objRs("pricewithouttax")
		Total = objRs("pricewithtax")
		TotalCCAvenue = Int(objRs("pricewithtax"))
	End If
	
	'Response.Write("Test123"&rqDiscount)
	
	
	'************Calculating the FB discount AND Referral discount  amount with the total amount only for US *************'
	
	If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") Then 

	'Condition if user having both facebook and referral discount'
	
	If rqDiscount = "Valid" AND Session("RefID") <> "" Then
	If UsedPoints <> "" AND rqTag <> "" then
	
	x = UsedPoints
	
	Else
		
	x = 10
	
	End If
	
	'FBDiscountPrice = 5
	TotalFBdis = (Total - 50) - x 
	
	
	'Condition if user having only facebook and not referral discount'
	
	ElseIf rqDiscount = "Valid" AND Session("RefID") = "" Then
	If UsedPoints <> "" AND rqTag <> "" then
	
	x = UsedPoints
	
	Else
        If ucase(trim(rqDiscountCode1)) ="OSA200" OR ucase(trim(rqDiscountCode1)) ="CSI200" OR ucase(trim(rqDiscountCode1)) ="ST200" OR UCase(trim(rqDiscountCode1)) = "FD200" Then
    '***********Discount Code**************
        Select case ucase(trim(rqDiscountCode1))
                case "OSA200" : x = 200
                case "CSI200" : x = 200
                case "ST200" : x = 200
				case "FD200" : x = 200
        End Select 
    '***************Discount Code************
        Else
             x = 10
        End If
	End If
	
	'FBDiscountPrice = 5
	TotalFBdis = Total - x 
	
	
	'Condition if user having only referral discount'
	
	ElseIf rqDiscount <> "Valid" AND Session("RefID") <> "" Then
	
	TotalFBdis = Total - 50
	
	'Response.Write(x)
	End If
	
	Else 
	
	TotalFBdis = ""
	
	End If
	
	
	'************Here Ends the Calculating the FB discount AND Referral discount  amount with the total amount only for US *************'
	
	
	
	
	
	
	
	
	
		'Calculating the FB discount amount with the total amount only for US
	
	
	Tax = objRs("tax")
	
	'for displaying the prices in UK'
	'Actual amount and VAT'
	'If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Germany") Then
	If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "Australia") Then
	
		VAT_Cal1 = ((CInt(TotalWithoutTax) * Cdbl(Tax)) / 100)
		
		VAT_Cal2 = Cdbl(VAT_Cal1)
		
		If VAT_Cal2 = Fix(VAT_Cal2) Then
		VAT = VAT_Cal2
		Else
		VAT = Fix(VAT_Cal2) + 1
		End If
		
	End If

objRs.movenext
Loop
objRs.Close

'New Code Texas'
strCity = "SELECT state_code FROM ITIL_city WHERE city = '"& City &"'"

objRs.Open strCity, ConnObj

Do Until objRs.EOF

	stateCode = objRs("state_code")

objRs.Movenext
Loop
objRs.Close



'If someone enroll from texas state, they should provide company details. We are doing here server side validation'
'If company name not provided we are redirecting to enrollClass page and showing error message'
If stateCode = "TX" And rqNameOfEmployeer = "" Then

	 Session("FirstName1")        =  rqFirstName
	 Session("LastName1")         =  rqLastName
	 Session("Email1")            =  rqEmail
	 Session("PhoneNumber1")      =  rqPhoneNumber
	 Session("Course1")           =  rqCourseDetails
	 Session("SelectedCourseID") = rqCourseId
	 Session("message") = "All participants attending our programs in Texas should be sponsored by their employer, and should provide the employer details while enrolling for the ITILstudy course.<br><br>"

	Response.Redirect("enrollClass.asp")

End If

'For display the course details formatting the course like Raleigh : Saturday, April 17, 2010 to Tuesday, April 20, 2010 for $ 1,800.00'
If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "Australia") Then

	CourseDetails = City & " : " & FormatDateTime(StartDate,1) & " to " & FormatDateTime(EndDate,1) & " for " & Currency_Format_Front & " " & FormatNumber(TotalWithoutTax) & " " & Currency_Format_Back
	
Else
	
	CourseDetails = City & " : " & FormatDateTime(StartDate,1) & " to " & FormatDateTime(EndDate,1) & " for " & Currency_Format_Front & " " & FormatNumber(Total) & " " & Currency_Format_Back

End If

CourseDate = StartDate & " to " & EndDate

EnrolledCourse = City & " : " & FormatDateTime(StartDate,1) & " to " & FormatDateTime(EndDate,1)

'SQL Query For Inserting The Values Into DataBase'
strInsertEnrollDet = "INSERT INTO ITIL_enrolledusers (firstname,lastname,email,nameofemployeer,phoneno,coursedetails,coursedate,amount,dateofenrollment,paybefore,status,pmbok,courseid,statusnumber,pmbokprice,discountpercentage, speReq, address, courseType,"
If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") And (rqDiscount = "Valid" OR Session("RefID") <> "" ) Then
 strInsertEnrollDet = strInsertEnrollDet & "FBdiscount,"
End If
'If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Germany") Then 
If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "Australia") Then 
strInsertEnrollDet = strInsertEnrollDet & "VAT,"
End If
strInsertEnrollDet = strInsertEnrollDet & "enrolledFor, country)"
strInsertEnrollDet = strInsertEnrollDet & " Values "
strInsertEnrollDet = strInsertEnrollDet & "('" & StrQuoteReplace(rqFirstName) & "',"
strInsertEnrollDet = strInsertEnrollDet & "'" & StrQuoteReplace(rqLastName) & "',"
strInsertEnrollDet = strInsertEnrollDet & "'" & rqEmail & "',"
strInsertEnrollDet = strInsertEnrollDet & "'" & StrQuoteReplace(rqNameOfEmployeer) & "',"
strInsertEnrollDet = strInsertEnrollDet & "'" & rqPhoneNumber & "',"
strInsertEnrollDet = strInsertEnrollDet & "'" & CourseDetails & "',"
strInsertEnrollDet = strInsertEnrollDet & "'" & CourseDate & "',"
If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "Australia") Then
strInsertEnrollDet = strInsertEnrollDet & "'" & TotalWithoutTax & "',"
Else
strInsertEnrollDet = strInsertEnrollDet & "'" & Total & "',"		 
End If
strInsertEnrollDet = strInsertEnrollDet & "'" & now() & "',"
strInsertEnrollDet = strInsertEnrollDet & "'" & PayBefore & "',"
strInsertEnrollDet = strInsertEnrollDet & "'Active',"
strInsertEnrollDet = strInsertEnrollDet & "'No',"
strInsertEnrollDet = strInsertEnrollDet & "'" & rqCourseId & "',"
strInsertEnrollDet = strInsertEnrollDet & "'1',"
strInsertEnrollDet = strInsertEnrollDet & "'0',"
strInsertEnrollDet = strInsertEnrollDet & "'0',"

strInsertEnrollDet = strInsertEnrollDet & "'" & rqSpeReq & "'," 
strInsertEnrollDet = strInsertEnrollDet & "'" & rqStreet & "," & rqCity & "." & rqState & "." & rqPostalCode & "',"
If rqClasstype = "CSI" OR rqClasstype = "OSA" OR rqClasstype = "ST" Then
strInsertEnrollDet = strInsertEnrollDet & "'" & rqClasstype & "',"
Else
strInsertEnrollDet = strInsertEnrollDet & "'Foundation',"
End If
'Discount price
If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") And (rqDiscount = "Valid" OR Session("RefID") <> "")  Then 
strInsertEnrollDet = strInsertEnrollDet & "'"& Total - TotalFBdis &"',"
End If
'If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Germany") Then 
If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "Australia") Then
strInsertEnrollDet = strInsertEnrollDet & "'" & VAT & "',"
End If

strInsertEnrollDet = strInsertEnrollDet & "'" & rqCourseType & "',"
'End If
strInsertEnrollDet = strInsertEnrollDet & "'" & Country & "')"

ConnObj.Execute strInsertEnrollDet

strEnollID = "SELECT max(id) as EnrollId FROM ITIL_enrolledusers"

objRs.Open strEnollID,ConnObj

do until objRs.Eof

	Session("EnrollId") = objRs("EnrollId")

objRs.Movenext
Loop
objRs.Close

EnrollId = Session("EnrollId")

'Sending proforma invoice email'
		  strBody = "<table width=""100%"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td>&nbsp;</td></tr><tr><td><table width=""600px"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""595px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITIlstudy"" width=""600px"" height=""103"" /></span></td></tr>"
		  strBody = strBody & "<tr><td align=""center"" colspan=""2"" width=""560px""><table border=""0"" align=""center"" width=""560px""><tr><td align=""center""><br><br><font face=""Arial"" size=""3"" color=""#0359b4""><b>COURSE ENROLLMENT DETAILS (INVOICE)"
		  If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "United Kingdom"  OR Session("CountryOrigin") = "Australia" ) Then
		  If rqClasstype = "CSI" OR rqClasstype = "OSA" OR rqClasstype = "ST" Then
		  strBody = strBody & "<br>ITILstudy Intermediate Classroom Program "
		  Else
		  strBody = strBody & "<br>ITILstudy Foundation "&rqCourseType&" Program with Moneyback Guarantee"
		   End If
		  ElseIf (Session("CountryOrigin") = "India"  ) Then
		  strBody = strBody & "<br>ITILstudy Foundation "&rqCourseType&" Program "
		  End If
		  strBody = strBody & "</b></font></td></tr>"
		  strBody = strBody & "<tr><td align=""right"" colspan=""2""><font face=""Arial"" size=""2""><b>" & FormatDateTime(todaysDate,1) & "</b></font></td></tr>"
		  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Enroll ID : " & Session("EnrollId") & "</font></td></tr>"
		  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name : " & rqFirstName & "&nbsp;" & rqLastName & "</font></td></tr>"
		  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Email : " & rqEmail & " </font></td></tr>"
		  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Phone Number : " & rqPhoneNumber & "</font></td></tr>"
		  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name of Employer/Business : " & rqNameOfEmployeer & "</font></td></tr>"
		  strBody = strBody & "<tr><td align=""left"" colspan=""2""><br><font face=""Arial"" size=""2"">Details of your course and Payment :</font><br><table border=""1"" cellspacing=""0"" align=""center"" width=""560px"">"
		  strBody = strBody & "<tr><td width=""60%""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Details</font></b></td><td width=""15%"" align=""center""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Payment</font></b></td></tr>"
		  If rqClasstype = "CSI" OR rqClasstype = "OSA" OR rqClasstype = "ST" Then
		  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>ITIL<sup>&reg;</sup> Intermediate "&rqClasstype&" Classroom Training"
		  Else
		  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>ITIL<sup>&reg;</sup>  Foundation "&rqCourseType&" Training"
		  End If
		'  If Session("CountryOrigin") = "India" Then
'		  strBody = strBody & "2"
'		  Else
'		  strBody = strBody & "4"
'		  End If
		  strBody = strBody & " <br>  " & CourseDetails & "</b>"
		  
		 If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "India"  OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "Australia") Then
		  
		  strBody = strBody &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		  strBody = strBody & Currency_Format_Front & " " & FormatNumber(TotalWithoutTax) & " " & Currency_Format_Back
		  strBody = strBody &"</b></td></tr>"
		  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>"
		  If Session("CountryOrigin") = "India" Then
		  strBody = strBody & Tax & "% service tax"
		  ElseIf Session("CountryOrigin") = "United Kingdom" Then
		  strBody = strBody & "VAT: @ 20%"
		  ElseIf Session("CountryOrigin") = "Australia" Then 
		  strBody = strBody & " GST: @ 10%"
		  ElseIf Session("CountryOrigin") = "Germany" Then
		  strBody = strBody & " VAT: @ 19%"		  
		  ElseIf Session("CountryOrigin") = "Netherlands" Then 
		  strBody = strBody & " VAT: @ 21%"
		  End If
		  strBody = strBody & "</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		  strBody = strBody & Currency_Format_Front & " " & FormatNumber(VAT) & " " & Currency_Format_Back & "</b></font></td></tr>"		  
		  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		  strBody = strBody & Currency_Format_Front & " " & FormatNumber(Total) & " " & Currency_Format_Back & "</b></font></td></tr>"
		  Else
		  strBody = strBody &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		  strBody = strBody & Currency_Format_Front & " " & FormatNumber(Total) & " " & Currency_Format_Back
		  strBody = strBody &"</b></td></tr>"
		  'FAce book discount
		  If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") And (rqDiscount = "Valid" OR Session("RefID") <> "") Then
		  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>"
		  strBody = strBody & "Discount Amount"
		  strBody = strBody & "</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		  strBody = strBody & Currency_Format_Front & " " & FormatNumber(Total - TotalFBdis) & " " & Currency_Format_Back & "</b></font></td></tr>"	
		  End If	
		  strBody = strBody & "<tr><td colspan=""2"">&nbsp;</td></tr>"		  
		  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		  If TotalFBdis <> "" Then
		  strBody = strBody & Currency_Format_Front & " " & FormatNumber(TotalFBdis) & " " & Currency_Format_Back & "</b></font></td></tr>"
		  Else
		  strBody = strBody & Currency_Format_Front & " " & FormatNumber(Total) & " " & Currency_Format_Back & "</b></font></td></tr>"
		  End If
		  End If
		   strBody = strBody & "</table><br></td></tr>"
		  
		    'Here i am showing in the email hotel details for us and canada classes only'
		 If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Australia" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands") Then
		  If Not IsNull(HotelAddress) And HotelAddress <> "" AND rqCourseType <> "Live" Then
		  strBody = strBody & "<tr><td align=""left"" colspan=""2""><table border=""0"" width=""100%""><tr><td width=""170px"" valign=""top""><font face=""Arial"" size=""2""><b>Venue Details:</b></font></td><td width=""830px"">"& HotelName &"<br> " & HotelAddress &" "& City &"<br>"
		  If HotelPhNo <> "" Then
		  strBody = strBody & "Ph: "& HotelPhNo &"<br>"
		  End If
		  strBody = strBody & "<a href="& HotelURL &" target=""_blank"">"& HotelURL &"</a><br /><br></td></tr></table></td></tr>"
		  End If
		  End If

	  	  strBody = strBody & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><b>Please Note:</b></font><br><br>"		
		  If TotalFBdis <> "" Then
		  strBody = strBody & "<font face=""Arial"" size=""2"">Full payment of the enrollment fee <b>(" & Currency_Format_Front & " " & FormatNumber(TotalFBdis) & " " & Currency_Format_Back & "</b>) "
		  Else
		  strBody = strBody & "<font face=""Arial"" size=""2"">Full payment of the enrollment fee <b>(" & Currency_Format_Front & " " & FormatNumber(Total) & " " & Currency_Format_Back & "</b>) "
		  End If
		  strBody = strBody & "should be done through </font></td></tr><tr><td align=""left"">"
		  
		   If Session("CountryOrigin") = "United Kingdom"  Then
					  
		   strBody = strBody & "<ul><li><font face=""Arial"" size=""2""><b>Google Checkout </b></font>"
					  
		   strBody = strBody & "&nbsp;&nbsp;<a href=""http://www.ITILstudy.com/payment.asp?enrollUserID="& Session("EnrollId") &"&Country="& Session("CountryOrigin") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><b>Buy Now</b></font></a></li>"
					   
			strBody = strBody & "<li><font face=""Arial"" size=""2""><b>PayPal:</b></font>"
			strBody = strBody & "&nbsp;&nbsp;<a href=""http://www.ITILstudy.com/payment.asp?enrollUserID="& Session("EnrollId") &"&Country="& Session("CountryOrigin") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><b>Buy Now</b></font></a></li></ul>"
			End If
		
		  If Session("CountryOrigin") = "India" Then
					  
		  strBody = strBody & "<ul><li><b> <span>Cheque</span> or <span > Demand Draft</span> </b>favouring <span> ""EDUSYS SERVICES PVT LIMITED""</span><br /><br /><span>This should be couriered to the following address:</span><br /><br /><span>Edusys Services Pvt Limited</span>,<br>#27,2<sup>nd</sup> Floor,</br>Santosh Towers,<br />J.P. Nagar 4<sup>th</sup> Phase,<br>4<sup>th</sup> Main,100 Ft. Ring Road<br>Bangalore 560078<br />India<br /><br />Ph:+91 80 4155 75 47/48/49<br><br /></li><li><span><b>Bank Transfer:</b></span><span >Payee Name:  </span>EDUSYS SERVICES PVT LIMITED <br /><span>Bank Name :  </span>ICICI Bank Limited<br /><span>Account Number :  </span>ICICI Bank A/c No : 0401 0500 0128<br /><span>Branch Name :  </span>ICICI Bank, J.P. Nagar Branch, Bangalore</li><br/><li><b>Payment through Credit card or Debit card:</b> <a href=""http://www.mycatstudy.com/itilstudy_makepayment.asp"" target=""_blank"">	<font face=""Arial"" size=""3"" color=""#0359b4""><b>Buy Now</b></font></a></li></ul>"
					  
		  strBody = strBody & "<span>Alternate Payment Mechanism: </span>If you have problems in making payments through Cheque or Demand Draft, please email us at <a href=""mailto:marketing@ITILstudy.com"" target=""_blank"">marketing@ITILstudy.com</a>; we will suggest alternate payment options to you."
		  
		  ElseIf (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" ) Then
		  
		    strBody = strBody & "<ul><li><font face=""Arial"" size=""2""><b>PayPal: </b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""http://www.itilstudy.com/payment.asp?enrollUserID="& Session("EnrollId") &"&Country="& Session("CountryOrigin") &"""><font face=""Arial"" size=""2"" color=""#0359b4""><input type=""image"" src=""http://www.itilstudy.com/images/back/buybutton.gif"" alt=""BuyNow"" /></font></a></li><br/>"
		  		  
		  strBody = strBody & "<li><font face=""Arial"" size=""2""><b>Google Checkout: </b></font>&nbsp;&nbsp;<a href=""http://www.itilstudy.com/payment.asp?enrollUserID="& Session("EnrollId") &"&Country="& Session("CountryOrigin") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><input type=""image"" src=""http://www.itilstudy.com/images/back/buybutton.gif"" alt=""BuyNow"" /></font></a></li><br/>"
		 
		
		  
		    strBody = strBody & "<li><font face=""Arial"" size=""2""><b>Bank Transfer: </b></font><br><b>Bank Name: </b>Bank of America, Frederick, MD, USA<br /><b>Type of Account:</b> Current<br /><b>Account Name:</b> VMedu Inc<br><b>Account Number: </b>4460 0519 5480<br><b>Routing Number:</b> 052001633 (paper & electronic) / 026009593 (wires)<br /></li></ul>"
			
			 ElseIf (Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands") Then
		  		  
		  strBody = strBody & "<ul><li><font face=""Arial"" size=""2""><b>PayPal:</b></font>"
			strBody = strBody & "&nbsp;&nbsp;<a href=""http://www.ITILstudy.com/payment.asp?enrollUserID="& Session("EnrollId") &"&Country="& Session("CountryOrigin") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><b>Buy Now</b></font></a></li></ul>"
		  
		  ElseIf (Session("CountryOrigin") = "Singapore") Then
		  		  
		   strBody = strBody & "<ul><li><font face=""Arial"" size=""2""><b>Paypal </b></font>&nbsp;&nbsp;<a href=""http://www.itilstudy.com/payment.asp?enrollUserID="& Session("EnrollId") &"&Country="& Session("CountryOrigin") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><input type=""image"" src=""http://www.itilstudy.com/images/back/buybutton.gif"" alt=""BuyNow"" /></font></a><br></li></ul>"
		  
		  
		  ElseIf (Session("CountryOrigin") = "UAE") Then
		  		  
		   strBody = strBody & "<ul><li><font face=""Arial"" size=""2""><b>Paypal </b></font>&nbsp;&nbsp;<a href=""http://www.itilstudy.com/payment.asp?enrollUserID="& Session("EnrollId") &"&Country="& Session("CountryOrigin") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><input type=""image"" src=""http://www.itilstudy.com/images/back/buybutton.gif"" alt=""BuyNow"" /></font></a><br></li>"
	  
		  strBody = strBody & "<li><form method=""post"" action=""http://www.pmstudy.com/itil_ccavenue.asp""><input type=""hidden"" name=""item_name"" value=""ITILstudy Classroom Training - "& Session("CountryOrigin") &" ""><input type=""hidden"" name=""item_number"" value=""5007""> <input type=""hidden"" name=""ITIL_country"" value="" "& Session("CountryOrigin") &"""><input type=""hidden"" name=""Merchant_Id"" value="&Merchant_Id&"><input type=""hidden"" name=""Amount"" value="& TotalCCAvenue &"><input type=""hidden"" name=""currency_type"" value=""USD""><font face=""Arial"" size=""2""><b>CCAvenue </b></font>&nbsp;&nbsp;<font face=""Arial"" size=""3"" color=""#0359b4""><input type=""image"" src=""http://www.itilstudy.com/images/back/buybutton.gif"" alt=""BuyNow"" /></font></a></form></li></ul>"	
		  		
  		  
		    'Paymeny gateways for Australia'
		  ElseIf (Session("CountryOrigin") = "Australia") Then
		  strBody = strBody & "<ul><li><font face=""Arial"" size=""2""><b>Paypal </b></font>&nbsp;&nbsp;<a href=""http://www.itilstudy.com/payment.asp?enrollUserID="& Session("EnrollId") &"&Country="& Session("CountryOrigin") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><b>Buy Now</b></font></a><br><br></li>"
		  
		  strBody = strBody & "<li><font face=""Arial"" size=""2""><b>Bank Transfer: </b></font><br> <b>Bank Name:</b> ANZ Bank (Australia and New Zealand Banking Group Limited)<br /><b>Account Name:</b> EDUSYS SERVICES PTY LTD<br><b>Account Number: </b>376446238<br><b>BSB (Bank State Branch):</b> 012055<br /></li></ul>"
		  
		 
		  End If
		  strBody = strBody & "<font face=""Arial"" size=""2"">" & PaymentsAfterEnroll
		  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then 
		  strBody = strBody & "<tr><td>For alternate payment options, please <a href=""http://www.itilstudy.com/payforclass.asp"" target=""_blank"">click here</a></font>"
		  End If
		  
		  strBody = strBody & "</td></tr>"
		  
					 
		  'If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Germany") Then
		  If (Session("CountryOrigin") = "United Kingdom") Then
		  strBody = strBody & "<tr><td align=""left"" colspan=""2""><span style=""color:red""><sup>*</sup></span> : VAT registration number - GB 117 6616 13<br>This is a Proforma Invoice. Not eligible for VAT claims. </td></tr>"
		   ElseIf Session("CountryOrigin") = "Australia" Then
		   strBody = strBody & "<tr><td align=""left"" colspan=""2""><span style=""color:red""><sup>*</sup></span> : GST Registration Number: ABN 55 152 303 038<br>This is a Proforma Invoice. Not eligible for GST claims. </td></tr>"
		   ElseIf (Session("CountryOrigin") = "India") Then
		  strBody = strBody & "<tr><td align=""left"" colspan=""2""><br><span style=""color:red""><sup>*</sup></span> : Service tax registration number - AABCE3423BST001<br>This is a Proforma Invoice. Not eligible for TAX claims. </td></tr>"
		  
		  End If 
		If Session("CountryOrigin") = "India"Then
    		  strBody = strBody & "<tr><td align=""left"" colspan=""2""><br><font face=""Arial"" size=""2""><i>We have reserved a place for you in this course. However, your participation will be confirmed once we receive the payment - otherwise, your registration for this program will be cancelled.</i></font></td></tr>"

        Else		 
		  strBody = strBody & "<tr><td align=""left"" colspan=""2""><br><font face=""Arial"" size=""2""><i>We have reserved a place for you in this course. However, the payment should be received by us "
		  If(CDate(StartDate)-(Date()-1)>5) Then
		  strBody = strBody & "within 5 days from today i.e. before " & FormatDateTime(DateAdd("d", +4,CDate(todaysDate)),1) & "</i>"
		  End If
		  If(CDate(StartDate)-(Date())=4) Then
		  strBody = strBody & "within 4 days from today i.e. before " & FormatDateTime(DateAdd("d", +3,CDate(todaysDate)),1) & "</i>"
		  End If
		  If(CDate(StartDate)-(Date())=3) Then
		  strBody = strBody & "within 3 days from today i.e. before " & FormatDateTime(DateAdd("d", +2,CDate(todaysDate)),1) & "</i>"
		  End If
		  If(CDate(StartDate)-(Date())=2) Then
		  strBody = strBody & "within 2 days from today i.e. before " & FormatDateTime(DateAdd("d", +1,CDate(todaysDate)),1) & "</i>"
		  End If
		  If(CDate(StartDate)-(Date())=1) Then
		  strBody = strBody & "today i.e. before 5 PM " & FormatDateTime(todaysDate,1) & "</i>"
		  End If
		  If(CDate(StartDate)-(Date())=0) Then
		  strBody = strBody & "today i.e. before 9 PM " & FormatDateTime(todaysDate,1) & "</i>"
		  End If
		  
		  strBody = strBody & " - <i>otherwise, your registration for this program will be cancelled.</i> </font></td></tr>"
    End If
		  strBody = strBody & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2"">"
		   If (Session("CountryOrigin") <> "US" And Session("CountryOrigin") <> "Canada") Then 
		   strBody = strBody & "<br>Please Note: You will be provided access to the free 100% Online Preparatory Course for <a href=""http://www.ITILstudy.com"" target=""_blank"">www.ITILstudy.com</a> "&rqCourseType&" Course only after we receive your payment: this is a simple online course which can be completed with a few hours of study and will provide you with the 18 PMI approved PDUs after the completion of the "&rqCourseType&" training program.<br>"
		    End If
		    strBody = strBody & "<br>"
			
		 
		  If (Session("CountryOrigin") = "India") Then 
		  strBody = strBody & "For ITILstudy "&rqCourseType&" training terms and conditions, please visit <a href=""http://www.itilstudy.com/termsAndConditions.asp"" target=""_blank"">www.ITILstudy.com/termsAndConditions.asp</a>."
		 Else
		 
		 If rqClasstype = "CSI" OR rqClasstype = "OSA" OR rqClasstype = "ST" Then 
		  strBody = strBody & "For ITILstudy "&rqCourseType&" training terms and conditions, please visit <a href=""http://www.itilstudy.com/Intermediate-TermsAndConditions.asp"" target=""_blank"">www.ITILstudy.com/Intermediate-TermsAndConditions.asp</a>."		 
		 Else 
		  strBody = strBody & "ITILstudy offers Moneyback Guarantee on its "&rqCourseType&" programs. For details, visit <a href=""http://itilstudy.com/ITIL-Training/moneyBack.asp"" target=""_blank"">http://itilstudy.com/ITIL-Training/moneyBack.asp</a>. Also, please refer to ITILstudy "&rqCourseType&" training terms and conditions: <a href=""http://www.itilstudy.com/termsAndConditions.asp"" target=""_blank"">www.ITILstudy.com/termsAndConditions.asp</a>."
		  End If
		  End If
		   
		  strBody = strBody & "</font></td></tr>"
		  
		   If Session("CountryOrigin") <> "India" Then
		   
		  strBody = strBody & "<tr><td align=""center"" colspan=""3""><br> <a href=""https://www.facebook.com/ITILstudy/app_128953167177144"" target=""_blank"">Stay connected to get more from ITILstudy on Facebook</a>.</td></tr>"
		  
		  End If
		  
		  strBody = strBody & "<tr><td align=""center"" colspan=""3""><br><font face=""Arial"" color = ""green"" size=""3"">We look forward to having you as a student with ITILstudy.com "&rqCourseType&" Training!!!</font></td></tr>"
		  
		
		  strBody = strBody & "<tr><td align=""left""><br><font face=""Arial"" size=2>Best Regards,</font></td></tr>"
		  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=2><br>Customer Support</font></td></tr>"
		  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=2><a href=""http://www.ITILstudy.com"" target=""_blank"">www.ITILstudy.com</a></font></td></tr>"
		  'strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=2>(PMI Approved Global Registered Education Provider)</font></td></tr>"
		  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=2>Email: marketing@ITILstudy.com</font><br><br><hr></hr><div align=""center""><font size=""1px"">"
		  If Session("CountryOrigin") = "India" Then
		  strBody = strBody & "EDUsys Services Private Limited<br>Santosh Towers,4th Main,100 Ft. Ring Road, J.P. Nagar 4th Phase,<br>Bangalore - 560078, India"
		  End If
		 strBody = strBody & "<br/></font></div></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr></table></td></tr><tr><td height=""45%"">&nbsp;</td></tr></table>"

'=======================      Inserting referral and referred details while enrolling      ============================='

If Session("RefID") <> "" Then

strQuery1 = "SELECT * FROM Ref_Enrollments WHERE ReferredEmail = '"& rqEmail &"'"

Rs.Open strQuery1,ConnObjRef


'Checking The Email Id already exists or not'

If NOT Rs.EOF Then

'If Exists we are Updating his Enrollment status and date of enrollments'

ConnObjRef.Execute "Update Ref_Enrollments Set EnrollStatus = '1',DateofEnrollment = '"& Now() &"',EnrollId = '"& Session("EnrollId")&"',CourseType = 'Class'  where  ID = '" & Rs("ID") & "'"

Else

'If Not Exists we are inserting all the details'

ConnObjRef.Execute "INSERT INTO Ref_Enrollments (RefID, ReferredName, ReferredEmail, EnrollStatus, DateofEnrollment, Website, EnrollId, CourseType,ReferredDate) VALUES ('"& Session("RefID") &"','" & rqFirstName &"','"& rqEmail &"','1','"& Now() &"','ITILstudy','"& Session("EnrollId")&"','Class','"& Now() &"')"

End If


Rs.close
End If

'===================================================================================
'Response.Write(strBody)


  		 Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
		 objCDOMail.From = "marketing@ITILstudy.com"
		 objCDOMail.To =  "<" & rqEmail & ">"
		 objCDOMail.cc = "marketing@ITILstudy.com"
		 'If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India") Then
		objCDOMail.Bcc = "satpathyt@gmail.com,pmstudysales@gmail.com,itilstudysales@gmail.com, edusysgaurav@gmail.com, edusysayan@gmail.com, itilstudyleadershipteam@googlegroups.com"
		' objCDOMail.Bcc = "edusyssavita@gmail.com"
		' Else
		' objCDOMail.Bcc = "satpathyt@gmail.com"
		 'End If
		 objCDOMail.Importance = 2
		 If rqClasstype = "CSI" OR rqClasstype = "OSA" OR rqClasstype = "ST" Then
		 objCDOMail.Subject = "Enrollment in " & City & " ITILstudy Intermediate "&rqClasstype&" Coaching for ITIL Certification Exam"
		 Else 
		 objCDOMail.Subject = "Enrollment in " & City & " ITILstudy "&rqCourseType&" Coaching for ITIL Certification Exam"
		 End If
		 objCDOMail.BodyFormat = 0
		 objCDOMail.MailFormat = 0
		 objCDOMail.Body =  strBody
		 objCDOMail.Send
		 Set objCDOMail = Nothing

%>
<div>
<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
  <table width="100%" border="0" cellspacing="0" cellpadding="8">
    <tr>
      <td width="2%" class="Header">&nbsp;</td>
      <td width="25%" class="PageTitle">&nbsp;</td>
   <% If rqClasstype = "CSI" OR rqClasstype = "OSA" OR rqClasstype = "ST" Then %>
   <td width="73%" class="PageTitle"><h1 class="PageTitle"> ITILstudy Intermediate Classroom Program</h1>
   <% Else %>
      <td width="73%" class="PageTitle"><h1 class="PageTitle">ITILstudy Foundation <% = rqCourseType %> Program</h1>
        <% If (Session("CountryOrigin") <> "UAE" AND Session("CountryOrigin") <> "Colombia" AND Session("CountryOrigin") <> "India"  AND Session("CountryOrigin") <> "Oman") Then %>
        with Moneyback Guarantee
        <% End If %><% End If %></td>
    </tr>
    <tr>
    <!--#include virtual="/includes/innerLeftMenu.asp"-->
    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
    <div style="margin-top:-12px;">
    <!-- Content Start From Here-->
    <table width="97%" border="0" cellpadding="0" cellspacing="0" class="general-body">
      <tr>
        <td colspan="2" align="center" class="general-body"><br />
          <div align="center"><span class="Header">COURSE ENROLLMENT DETAILS <% If (Session("CountryOrigin") <> "United Kingdom") Then %>(INVOICE)<% End If %>
            <% If (Session("CountryOrigin") <> "India") Then %>
            <% If rqClasstype = "CSI" OR rqClasstype = "OSA" OR rqClasstype = "ST" Then %>
             <br />
            ITILstudy Intermediate <% = rqClasstype %> Classroom Program </span>
            <br />
            <% Else %>
            ITILstudy <% = rqCourseType %> Program with Moneyback Guarantee</span>
            <% End If %>
            <% Else %>
            <br />
            ITILstudy <% = rqCourseType %> Program</span>
            <% End If %>
            <br />
            <br />
          </div></td>
      </tr>
      <tr>
        <td align="right" colspan="2"><div align="right"><span class="general-bodyBold">
            <% = FormatDateTime(todaysDate,1) %>
            </span></div></td>
      </tr>
      <tr>
        <td class="general-body"><span class="general-bodyBold">Enroll ID: </span>
          <% = Session("EnrollId") %></td>
      </tr>
      <tr>
        <td class="general-body"><span class="general-bodyBold">Name: </span>
          <% = Session("FirstName") %>
          &nbsp;
          <% =  Session("LastName") %></td>
      </tr>
      <tr>
        <td class="general-body"><span class="general-bodyBold">Email: </span>
          <% = Session("Email") %></td>
      </tr>
      <tr>
        <td class="general-body"><span class="general-bodyBold">Phone Number: </span>
          <% = Session("PhoneNumber") %></td>
      </tr>
      <tr>
        <td class="general-body"><span class="general-bodyBold">Name Of Employer/Business: </span>
          <% = Session("NameOfEmployeer") %></td>
      </tr>
      <tr>
        <td colspan="2" class="general-body"><br>
          <span class="Header">Details of your course and Payment: </span><br>
          <br />
          <table border="0" width="95%" cellspacing="0" class="TableGeneral">
            <tr>
              <td align="center" class="TableRowOdd" width="85%"><span class="HeaderLarge">Details</span></td>
              <td align="center" class="TableRowOdd"><span class="HeaderLarge">Payment</span></td>
            </tr>
            <tr>
             <% If rqClasstype = "CSI" OR rqClasstype = "OSA" OR rqClasstype = "ST" Then %>
              <td class="TableRowEven"><span class="TableCopyName">ITIL<sup>&reg;</sup> Intermediate <% = rqClasstype %> Classroom Training <br />
             <% Else %>
              <td class="TableRowEven"><span class="TableCopyName">ITIL<sup>&reg;</sup> Foundation <% = rqCourseType %> Training <br />
              <% End If %>
                <% = CourseDetails %>
                </span><br>
              </td>
              <% 'If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Germany") Then %>
              <% If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "Australia") Then %>
              <td align="center" class="TableRowEven"><span class="TableCopyName">
                <% = Currency_Format_Front %>
                <% = FormatNumber(TotalWithoutTax) %>
                <% = Currency_Format_Back %>
                </span></td></tr>
              <tr>
              <td class="TableRowEven"><span class="TableCopyName"><% If (Session("CountryOrigin") = "United Kingdom") Then %>VAT: @ 20% <% ElseIf (Session("CountryOrigin") = "Germany") Then %>VAT: @ 19% <% ElseIf (Session("CountryOrigin") = "Netherlands") Then %>VAT: @ 21%   <% ElseIf (Session("CountryOrigin") = "India") Then %><% =  Tax %>% service tax <% ElseIf Session("CountryOrigin") = "Australia"  Then %>GST: @ 10%<% End If %></span></td><td align="center" class="TableRowEven"><span class="TableCopyName">
                <% = Currency_Format_Front %>
                <% = FormatNumber(VAT) %>
                <% = Currency_Format_Back %>
                </span></td>  </tr>                           
              <% Else %>
              <td align="center" class="TableRowEven"><span class="TableCopyName">
                <% = Currency_Format_Front %>
                <% = FormatNumber(Total) %>
                <% = Currency_Format_Back %>
                </span></td></tr>
              <% End If %>
              <% If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") And (rqDiscount = "Valid" OR Session("RefID") <> "")  Then %> 
            <tr>
              <td align="right" class="TableRowEven"><span class="TableCopyName"> Discount Amount</span></td>
              <td align="center" class="TableRowEven"><span class="TableCopyName">
              <% = Currency_Format_Front %>
                <% = FormatNumber(Total - TotalFBdis) %>
                <% = Currency_Format_Back %>
                </span></td>
            </tr>
            <%End If%>
            <tr>
              <td align="right" class="Tablefooter"><span class="TableCopyName">Total</span></td>
                <% If TotalFBdis <> "" Then %>
             <%'  If (Session("CountryOrigin") = "US") OR (Session("CountryOrigin") = "Canada") And rqDiscount = "Valid"  Then %> 
              <td align="center" class="Tablefooter"><span class="TableCopyName">
                <% = Currency_Format_Front %>
                <% = FormatNumber(TotalFBdis) %>
                <% = Currency_Format_Back %>
                </span></td>
              <%Else%>
              <td align="center" class="Tablefooter"><span class="TableCopyName">
                <% = Currency_Format_Front %>
                <% = FormatNumber(Total) %>
                <% = Currency_Format_Back %>
                </span></td>
				<%End If%>
            </tr>
          </table>
          <br>
        </td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      <% 	
	  
		'Generating unique order id'
		orderid = "ITILCS"&Session("CountryOrigin")

		Order_ID = orderid &""& Session("EnrollID")		
			  
	   'Here i am showing hotel details for particular class'
				'Only for US and Canada Courses'
				 If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Australia" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands") Then
				If Not IsNull(HotelAddress) And HotelAddress <> "" AND rqCourseType <> "Live"  Then %>
      <tr>
        <td colspan="2"><table border="0" width="100%">
            <tr>
              <td width="130px"><strong>Venue Details:</strong></td>
              <td width="870px"><% = HotelName %>
                <br />
                <% = HotelAddress %>
                <br />
                <% = City %>
                <br />
                <% If HotelPhNo <> "" Then %>
                Ph:
                <% = HotelPhNo %>
                .<br />
                <% End If %>
                <a href="<% = HotelURL %>" target="_blank">
                <% = HotelURL %>
                </a><br />
                <br>
              </td>
            </tr>
          </table></td>
      </tr>
      <% End If
		 End If %>
      <tr>
        <td colspan="2" class="general-body"><strong>Please Note: </strong><br>
	 Full payment of the enrollment fee <strong>(
          <% = Currency_Format_Front %>
            <% If TotalFBdis <> "" Then %> 
           <% = FormatNumber(TotalFBdis) %>
            <% Else %>
          <% =  FormatNumber(Total) %>
          <% End If %>
          <% = Currency_Format_Back %>
          )</strong> should be done through: <br />
         
          <% If Session("CountryOrigin") = "India" Then %>
          <ul>
            <li><b>Cheque or Demand Draft</b> favoring "EDUSYS SERVICES PVT LIMITED"<br />
              This should be couriered to the following address:<br />
              Edusys Services Pvt Limited,<br />
              #27, 2nd Floor, Santosh Towers,<br />
              4th Main,100 Ft. Ring Road,<br />
              J.P. Nagar 4th Phase,<br />
              Bangalore - 560078<br />
              India</li>
            <li><b>Bank Transfer:</b> Payee Name: EDUSYS SERVICES PVT LIMITED <br />
              Bank Name : ICICI Bank Limited<br />
              Account Number : ICICI Bank A/c No : 0401 0500 0128<br />
              Branch Name : ICICI Bank, J.P. Nagar Branch, Bangalore</li>
			 
			  <li><font face="Arial" size="2"><b>Payment through Credit card or Debit card:</b></font>&nbsp;&nbsp;<a href="http://www.mycatstudy.com/itilstudy_makepayment.asp?enrollUserID=<% = Session("EnrollId")%>&Country=<% = Session("CountryOrigin") %>"><font face="Arial" size="3" color="#0359b4"><b>Buy Now</b></font></a><br /></li>
          
		    <li>Alternate Payment Mechanism: If you have problems in making payments through Cheque or Demand Draft, please email us at <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com</a>; we will suggest alternate payment options to you.</li>
          </ul>
      </tr>
      <% ElseIf (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") Then %>
      <tr>
        <td class="btext"><table border="0" width="100%">
        
         <tr>
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>1. Paypal </B></td>
              <td><form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                  <input type="hidden" name="cmd" value="_xclick">
                  <input type="hidden" name="business" value="vmeduinc1@gmail.com">
                  <input type="hidden" name="item_name" value="ITILstudy <% = rqCourseType %> Course  - <% = Session("CountryOrigin") %>">
                  <input type="hidden" name="currency_code" value="USD">
                   <% If TotalFBdis <> "" Then %>
                   <input type="hidden" name="amount" value="<% = TotalFBdis %>"/>
                  <% Else %>
                    <input type="hidden" name="amount" value="<% = Total %>"/>
                   <% End If %>
                  <input name="item_name" type="hidden" value="<% = CourseDetails %>"/>
                  <input type="image" src="/images/back/buybutton.gif" alt="BuyNow" />
                </form></td>
            </tr>
        
            <tr>
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>2. Google Checkout </B></td>
              <td><form action="https://checkout.google.com/api/checkout/v2/checkoutForm/Merchant/749730688196705" id="BB_BuyButtonForm" method="post" name="BB_BuyButtonForm">
                  <input name="item_name_1" type="hidden" value="ITILstudy <% = rqCourseType %> Training"/>
                  <input name="item_description_1" type="hidden" value="ITILstudy <% = rqCourseType %> Training"/>
                  <input name="item_quantity_1" type="hidden" value="1"/>
                  <% If TotalFBdis <> "" Then %>
                  <input name="item_price_1" type="hidden" value="<% = TotalFBdis %>"/>
                  <% Else %>
                   <input name="item_price_1" type="hidden" value="<% = Total %>"/>
                   <% End If %>
                  <input name="item_currency_1" type="hidden" value="USD"/>
                  <input name="_charset_" type="hidden" value="utf-8"/>
                  <input alt="" src="https://checkout.google.com/buttons/buy.gif?merchant_id=749730688196705&amp;w=117&amp;h=48&amp;style=white&amp;variant=text&amp;loc=en_US" type="image" align="middle"/>
                </form></td>
            </tr>
           
         
      <tr>
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>3. Bank Transfer :</B></td>
              <td><b>Bank Name: </b>Bank of America, Frederick, MD, USA<br />
                <b>Type of Account:</b> Current<br />
                <b>Account Name:</b> VMedu Inc<br>
                <b>Account Number: </b>4460 0519 5480<br>
                <b>Routing Number:</b> 052001633 (paper & electronic) / 026009593 (wires) <br /></td>
             
            </tr>
          </table></td>
      </tr>
      
        <% ElseIf (Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands") Then %>
      <tr>
        <td class="btext"><table border="0" width="100%">
           
            <tr>
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B> Paypal </B></td>
              <td><form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                      <input type="hidden" name="cmd" value="_cart"> 
                      <input type="hidden" name="upload" value="1"> 
                      <input type="hidden" name="business" value="edusysservices@gmail.com">    
                      <input type="hidden" name="item_name_1" value="ITILstudy <% = rqCourseType %> Training - <% = Session("CountryOrigin") %>">
                      <input type="hidden" name="currency_code" value="EUR">  
    					<input name="item_name" type="hidden" value="<% = CourseDetails %>"/>
						 <input type="hidden" name="amount_1" value="<% = Total %> "/> 
						  <input type="hidden" name="cancel_return" value="http://www.ITILstudy.com">
                  <input type="hidden" name="return" value="http://www.ITILstudy.com/payment-success.asp">
						<input type="image" src="/images/back/buybutton.gif" alt="BuyNow" />
                </form>
				
				</td>
            </tr>
         
  
          </table></td>
      </tr>
      <% ElseIf Session("CountryOrigin") = "UAE" Then %>
      <tr>
        <td class="btext"><table border="0">
            <%
				 If(Application("ccvar2")>10000) Then

				 Else

					Application("ccvar2")=int(now())*10000

				 End If
			  %>
            <tr>
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>1. Paypal </B></td>
              <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                <input type="hidden" name="cmd" value="_xclick">
                <input type="hidden" name="business" value="adminsupport@projstudy.com">
                <input type="hidden" name="item_name" value="ITILstudy <% = rqCourseType %> Training - <% = Session("CountryOrigin") %>">
                <input type="hidden" name="item_number" value="5007">
                <input type="hidden" name="amount" value="<% = Total %>">
                <input type="hidden" name="cancel_return" value="http://www.itilstudy.com">
                <input type="hidden" name="return" value="http://www.itilstudy.com/payment-success.asp">
                <input type="hidden" name="rm" value="2">
                <input type="hidden" name="currency_code" value="USD">
                <td><input type="image" src="/images/back/buybutton.gif" alt="BuyNow" /></td>
              </form>
            </tr>
            <tr>
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>2. CCAvenue</B></td>
              <%
		  Merchant_Id	   = "t_satpat1848" 
		  Order_Id       = Order_ID	
		  Amount  = TotalCCAvenue
		  currency_type  = "USD"		
		  Redirect_Url   = "http://www.itilstudy.com/payment-success.asp"
		  WorkingKey	 = "dpgnrv2li2jvxivqk1qjg3tbm89unbxk"
		  Checksum	   = getChecksum(Merchant_Id, Order_Id, Amount, WorkingKey, currency_type, Redirect_Url)
		  
		  %>
              <td width="900px"><form method="post" action="http://www.pmstudy.com/itil_ccavenue.asp">
                  <input type="hidden" name="Merchant_Id" value="<%=Merchant_Id%>">
                  <input type="hidden" name="item_name" value="ITILstudy <% = rqCourseType %> Training - <% = Session("CountryOrigin") %>">
                  <input type="hidden" name="item_number" value="5007">
                  <input type="hidden" name="Amount" value="<% = Amount %>">
                  <input type="hidden" name="ITIL_country" value="<% = Session("CountryOrigin") %>">
                  <input type="hidden" name="TotalCCAvenue" value="<% = TotalCCAvenue %>">
				  <input type="hidden" name="Order_Id" value="<%=Order_Id%>">
                  <input type="hidden" name="Currency" value="<% = currency_type %>">
                  <input type="hidden" name="TxnType" value="A">
                  <input type="hidden" name="actionID" value="txn">
                  <input type="hidden" name="Redirect_Url" value="<%=Redirect_Url%>">
                  <input type="hidden" name="Checksum" value="<%=Checksum%>">
                  <input type="image" src="/images/back/buybutton.gif" alt="BuyNow" />
                </form></td>
            </tr>
          </table></td>
      </tr>
	   <% ElseIf Session("CountryOrigin") = "Singapore" Then %>
      <tr>
        <td class="btext"><table border="0">
            <%
				 If(Application("ccvar2")>10000) Then

				 Else

					Application("ccvar2")=int(now())*10000

				 End If
			  %>
            <tr>
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>1. Paypal </B></td>
              <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                <input type="hidden" name="cmd" value="_xclick">
                <input type="hidden" name="business" value="adminsupport@projstudy.com">
                <input type="hidden" name="item_name" value="ITILstudy <% = rqCourseType %> Training - <% = Session("CountryOrigin") %>">
                <input type="hidden" name="item_number" value="5007">
                <input type="hidden" name="amount" value="<% = Total %>">
                <input type="hidden" name="cancel_return" value="http://www.itilstudy.com">
                <input type="hidden" name="return" value="http://www.itilstudy.com/payment-success.asp">
                <input type="hidden" name="rm" value="2">
                <input type="hidden" name="currency_code" value="SGD">
                <td><input type="image" src="/images/back/buybutton.gif" alt="BuyNow" /></td>
              </form>
            </tr>
            
          </table></td>
      </tr>
	  <% ElseIf Session("CountryOrigin") = "United Kingdom" Then  %>
	  <tr>
        <td class="btext"><table border="0" width="100%">
            <tr>
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>1. Google Checkout </B></td>
				<td><form action="https://checkout.google.com/api/checkout/v2/checkoutForm/Merchant/924725040306386" id="BB_BuyButtonForm" method="post" name="BB_BuyButtonForm" target="_top">
                        <input name="item_name_1" type="hidden" value="ITILstudy <% = rqCourseType %> Training "/>
                        <input name="item_description_1" type="hidden" value="ITILstudy <% = rqCourseType %> Training "/>
                        <input name="item_quantity_1" type="hidden" value="1"/>
                        <input name="item_price_1" type="hidden" value="<% = Total %>"/>
                        <input name="item_currency_1" type="hidden" value="GBP"/>
                        <input name="_charset_" type="hidden" value="utf-8"/>
                        <input alt="" src="https://checkout.google.com/buttons/buy.gif?merchant_id=749730688196705&amp;w=117&amp;h=48&amp;style=white&amp;variant=text&amp;loc=en_US" type="image" align="middle"/>
                    </form>		</td>
            </tr>
            <tr>
			
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>2. Paypal </B></td>
              <td><form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                      <input type="hidden" name="cmd" value="_cart"> 
                      <input type="hidden" name="upload" value="1"> 
                      <input type="hidden" name="business" value="edusysservices@gmail.com">    
                      <input type="hidden" name="item_name_1" value="ITILstudy <% = rqCourseType %> Training - <% = Session("CountryOrigin") %>">
                      <input type="hidden" name="currency_code" value="GBP">  
    					<input name="item_name" type="hidden" value="<% = CourseDetails %>"/>
						 <input type="hidden" name="amount_1" value="<% = Total %> "/> 
						  <input type="hidden" name="cancel_return" value="http://www.ITILstudy.com">
                  <input type="hidden" name="return" value="http://www.ITILstudy.com/payment-success.asp">
						<input type="image" src="/images/back/buybutton.gif" alt="BuyNow" />
                </form>
				
				</td>
            </tr>
		
          </table></td>
      </tr>
                       

           <% ElseIf (Session("CountryOrigin") = "Australia") Then%>
      <tr>
        <td class="btext"><table border="0" width="100%">
            <tr>
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>1. Paypal </B></td>
              <td>
			  <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
					<input type="hidden" name="cmd" value="_xclick">
					<input type="hidden" name="business" value="edusysaus@gmail.com">
					<input type="hidden" name="item_name" value="ITILstudy <% = rqCourseType %> Training  - <% = Session("CountryOrigin") %>">
					<input type="hidden" name="amount" value="<% = Total %> "/> 
					<input type="hidden" name="cancel_return" value="http://www.ITILstudy.com">
					<input type="hidden" name="return"  value="http://www.ITILstudy.com/payment-success.asp">
					<input type="hidden" name="currency_code"  value="AUD">  
					<input type="image" src="/images/back/buybutton.gif" alt="BuyNow" />
					</form>
				<!--	<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                      <input type="hidden" name="cmd" value="_cart"> 
                      <input type="hidden" name="upload" value="1"> 
                      <input type="hidden" name="business" value="edusysservices@gmail.com">    
                      <input type="hidden" name="item_name_1" value="ITILstudy <% = rqCourseType %> Training  - <%' = Session("CountryOrigin") %>">
                      <input type="hidden" name="currency_code" value="AUD">  
    				  <input name="item_name" type="hidden" value="<%' = CourseDetails %>"/>
					  <input type="hidden" name="amount_1" value="<%' = Total %> "/> 
					  <input type="hidden" name="cancel_return" value="http://www.ITILstudy.com">
                      <input type="hidden" name="return" value="http://www.ITILstudy.com/payment-success.asp">
					  <input type="image" src="/images/back/buybutton.gif" alt="BuyNow" />
                   </form>-->
			  
			  <br /></td>
            </tr>
			 <tr>
              <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>2. Bank Transfer :</B></td>
              <td><b>Bank Name:</b> ANZ Bank (Australia and New Zealand Banking Group Limited)<br />
               <b>Account Name:</b> EDUSYS SERVICES PTY LTD<br>
               <b>Account Number: </b>376446238<br>
               <b>BSB (Bank State Branch):</b> 012055<br /><br /></td>
             </td>
            </tr>
          </table></td>
      </tr>
      <% End If %>
      <tr>
        <td colspan="2" class="general-body"><% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then %>
          <br />
          For alternate payment options, please <a href="/payforclass.asp" target="_blank">click here</a>. <br />
          <br />
          <% End If 
			If (Session("CountryOrigin") = "India") Then %>
		<span style=""color:red""><sup>*</sup></span> : Service tax registration number - AABCE3423BST001<br>This is a Proforma Invoice. Not eligible for TAX claims. <br /><br />
		  
		  <%End If%> 
          <%If Session("CountryOrigin") = "India" Then %>
          <span>
We have reserved a place for you in this course. However, your participation will be confirmed once we receive the payment - otherwise, your registration for this program will be cancelled.</span>
            <%else %>

          <span>We have reserved a place for you in this course. However, the payment should be received by us
          <% If(CDate(StartDate)-(Date()-1)>5) Then%>
          within 5 days from today i.e. before
          <% =  FormatDateTime(DateAdd("d", +4,CDate(todaysDate)),1) %>
          </span>
          <% End If %>
          <% If(CDate(StartDate)-(Date())=4) Then%>
          within 4 days from today i.e. before
          <% =  FormatDateTime(DateAdd("d", +3,CDate(todaysDate)),1) %>
          </span>
          <% End If %>
          <% If(CDate(StartDate)-(Date())=3) Then%>
          within 3 days from today i.e. before
          <% = FormatDateTime(DateAdd("d", +2,CDate(todaysDate)),1) %>
          </span>
          <% End If %>
          <% If(CDate(StartDate)-(Date())=2) Then%>
          within 2 days from today i.e. before
          <% = FormatDateTime(DateAdd("d", +1,CDate(todaysDate)),1) %>
          </span>
          <% End If %>
          <% If(CDate(StartDate)-(Date())=1) Then%>
          today i.e. before 5 PM
          <% = FormatDateTime(todaysDate,1) %>
          </span>
          <% End If %>
          <% If(CDate(StartDate)-(Date())=0) Then%>
          today i.e. before 9 AM
          <% = FormatDateTime(todaysDate,1) %>
          </span>
          <% End If %>
          - otherwise, your registration for this program will be cancelled.
            <%end If %>
        </td>
      </tr>
      <tr>
        <td colspan="2" class="general-body"><p> A copy of the invoice has also been emailed to you. Please check your email address
            i.e.
            <% = Session("Email") %>
            (Note that the email might have gone to your bulk/junk email folder). For queries
            or clarifications, please email us at marketing@ITILstudy.com.
          <p> </td>
      </tr>
      <tr>
        <td colspan="2" class="general-body">
           <% If (Session("CountryOrigin") <> "US" And Session("CountryOrigin") <> "Canada") Then %>
        <p><span class="general-bodyBold">Please Note : </span>You will be provided access to the free 100% Online Preparatory Course for <a href="http://www.ITILstudy.com">ITILstudy.com</a> <% = rqCourseType %> Course only after we receive your payment: this is a simple online course which can be completed with a few hours of study and will provide you with the 18 PMI approved PDUs after the completion of the <% = rqCourseType %> training program.</p>
          <% End If %>
          <% If (Session("CountryOrigin") = "India") Then %>
          <p>For ITILstudy <% = rqCourseType %> training terms and conditions, please visit <a href="/termsAndConditions.asp">http://www.ITILstudy.com/termsAndConditions.asp</a></p>
          <% else%>
          <% If rqClasstype = "CSI" OR rqClasstype = "OSA" OR rqClasstype = "ST" Then %>
          <p>For ITILstudy <% = rqCourseType %> training terms and conditions, please visit <a href="/Intermediate-TermsAndConditions.asp">www.ITILstudy.com/Intermediate-TermsAndConditions.asp</a></p>
          <% Else %>
          <p>ITILstudy offers Moneyback Guarantee on its <% = rqCourseType %> programs. For details, visit <a href="/ITIL-Training/moneyBack.asp">www.ITILstudy.com/ITIL-Training/moneyBack.asp</a>; Also, please refer to ITILstudy <% = rqCourseType %> training terms and conditions: <a href="/termsAndConditions.asp">www.ITILstudy.com/termsAndConditions.asp</a></p>
          <% End If %>
          <% End If %>
        </td>
      </tr>
      <%  If Session("CountryOrigin") <> "India"  Then  %>
       <tr><td align="center" colspan="3">
           <a href="https://www.facebook.com/ITILstudy/app_128953167177144" target="_blank">Stay connected to get more from ITILstudy on Facebook</a>.</td>
      </tr>
      <% End If %>

       <tr><td align="center" colspan="3"><font face="Arial" color = "green" size="2.5"><br />
            <b>We look forward to having you as a student with ITILstudy.com <% = rqCourseType %> Training!!!</b></td>
      </tr>
      
      
      <tr>
        <td><br />
          <br />
          Best Regards,<br />
          <br />
          Customer Support<br />
          <a href="http://www.itilstudy.com">www.ITILstudy.com</a><br />
          Email: marketing@ITILstudy.com</span></td>
      </tr>
      <%
					 'Clear the session variables'
					' Session("FirstName1")    =  ""
'					 Session("LastName1")     =  ""
'					 Session("Email1")        =  ""
'					 Session("PhoneNumber1")  =  ""
'					 Session("Course1")       =  ""
'					 Session("SelectedCourseID") = ""
'					 Session("message") = ""
	  %>
 <!-- Google Code for ITIL - ES Conversion Page -->



<div style="display:inline;">

<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?label=r9eNCKOpyQIQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
</table>
  <!-- Content End From Here-->
  <!--#include virtual="/includes/connectionClose.asp"-->
  </div>
  </td>
  </tr>
</table>
</td>
</tr>
</table>
</div>

<%
'validation End If
 End If %>
<% If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") Then %>
      <!-- Google Code for ITILstudy USA - ES Conversion Page -->
      <script type="text/javascript">
      /* <![CDATA[ */
      var google_conversion_id = 1026351431;
      var google_conversion_language = "en";
      var google_conversion_format = "3";
      var google_conversion_color = "ffffff";
      var google_conversion_label = "04pjCPO31QIQx8Kz6QM";
      var google_conversion_value = 0;
      /* ]]> */
      </script>
      <script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
      </script>
      <noscript>
      <div style="display:inline;">
      <img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?value=0&amp;label=04pjCPO31QIQx8Kz6QM&amp;guid=ON&amp;script=0"/>
      </div>
</noscript>
<!--=============================-->

<script type="text/javascript"> if (!window.mstag) mstag = { loadTag: function () { }, time: (new Date()).getTime() };</script> <script id="mstag_tops" type="text/javascript" src="//flex.atdmt.com/mstag/site/4625211e-e6a9-48d9-b623-3b89707bb8e4/mstag.js"></script> <script type="text/javascript">    mstag.loadTag("analytics", { dedup: "1", domainId: "1861441", type: "1", actionid: "104277" })</script> <noscript> <iframe src="//flex.atdmt.com/mstag/tag/4625211e-e6a9-48d9-b623-3b89707bb8e4/analytics.html?dedup=1&domainId=1861441&type=1&actionid=104277" frameborder="0" scrolling="no" width="1" height="1" style="visibility:hidden;display:none"> </iframe> </noscript>
<!--======================================-->

<!--Added By Madhava 20/12/2012 -->
<!-- Google Code for ITILstudy US-ES Conversion Page -->

<script type="text/javascript">
    /* <![CDATA[ */
    var google_conversion_id = 947765691;
    var google_conversion_language = "en";
    var google_conversion_format = "3";
    var google_conversion_color = "ffffff";
    var google_conversion_label = "t25gCP36twkQu4P3wwM";

    var google_conversion_value = 0;
    /* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/947765691/?value=0&amp;label=t25gCP36twkQu4P3wwM&amp;guid=ON&amp;script=0"/>

</div>
</noscript>	

<% ElseIf Session("CountryOrigin") = "Australia" Then %>
   <!-- Google Code for ITILstudy AUS - ES (P.M.5) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1001931809;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "TqBECL_9yRIQoYjh3QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1001931809/?value=0&amp;label=TqBECL_9yRIQoYjh3QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>



<%  ElseIf Session("CountryOrigin") = "Germany" Then  %>
<!-- Google Code for ITILstudy Germany - Eng- ES (P.M.2) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "aE5WCPOPlgMQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?value=0&amp;label=aE5WCPOPlgMQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>

><% ElseIf Session("CountryOrigin") = "India" Then %>
<!-- Google Code for ITILstudy IND - ES (P.M.6) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1000044564;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "ElHtCNSy1AMQlPDt3AM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1000044564/?value=0&amp;label=ElHtCNSy1AMQlPDt3AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>





<% ElseIf Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" Then %>
<!-- Google Code for ITILstudy UAE, Singapore - ES (P.M.6) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1000044564;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "eBt1CLzL1QMQlPDt3AM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1000044564/?value=0&amp;label=eBt1CLzL1QMQlPDt3AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>




<% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
<!-- Google Code for ITILstudy - ES for UK (P.M.3) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1017900619;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "cNAFCK2FlAMQy9yv5QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1017900619/?value=0&amp;label=cNAFCK2FlAMQy9yv5QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


<!-- Google Code for ITILstudy UK - ES (P.M.6) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1000044564;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "fW2YCKzN1QMQlPDt3AM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1000044564/?value=0&amp;label=fW2YCKzN1QMQlPDt3AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>

<% Else %>
<!-- Google Code for ITIL - ES Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "r9eNCKOpyQIQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?value=0&amp;label=r9eNCKOpyQIQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
<% End If %>

<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
