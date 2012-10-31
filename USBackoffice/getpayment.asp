<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<%
'Declare the local variable'
Dim objRs, strCourses
Dim strCity, strDate, strStartDate,strEndDate 
Dim arrAllCourses, firstRow, lastRow, numRows, rowCounter
Dim rqcount,rqPayment,strGetvalues
Dim rqEnroll,rqStudents,rqDistance
'Creating Record object''
Set objRs=Server.CreateObject("ADODB.Recordset")

 'Retriving the values from fin.asp page through AJAX'
rqStudents = Request.QueryString("students")
rqDistance = Request.QueryString("distance")



'Price Format Display Functions'
Currency_Format_Front = CurrencyFormat_Front(Session("CRM_Country"))

Currency_Format_Back = CurrencyFormat_Back(Session("CRM_Country"))

'If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then
'
'	CRM_Country = "US"
'	
'Else
'
'	CRM_Country = Session("CRM_Country")	
'
'End If

'Query for comparing all the distance,students and prices from database for openclass and corporate 

If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then

strGetvalues = "SELECT * From payment_matrix WHERE noofstudents = '"&rqStudents&"' AND country = 'US'"

Else

strGetvalues = "SELECT * From payment_matrix WHERE noofstudents = '"&rqStudents&"' AND country = 'Other'"

End If

objRs.Open strGetvalues,ConnObj


If (Not objRs.BOF) AND (Not objRs.EOF) Then

if rqDistance = "Less than 60 miles" Then

rqPayment = int(objRs("lessthan60"))

Elseif rqDistance = "60 to 200 miles" Then

rqPayment = int(objRs("between60to200"))

Elseif rqDistance = "More than 200 miles" Then

rqPayment = int(objRs("morethan200"))

End If

End If


Str = "<td>Total Amount:</td><td><select name=""Currency1"" id=""Currency1"" style=""width:75px;""><option value="""">--Select--</option><option"

Str = Str &"<option value=""INR"">INR</option><option value=""USD"">USD</option><option value=""GBP"">GBP</option><option value=""AUD"">AUD</option><option value=""EUR"">EUR</option><option value=""SGD"">SGD</option>&nbsp;<input type=""text"" name=""amount"" value="&rqPayment&" id=""amount""></td>"

Response.Write(Str)


%>
<!--#include virtual="/includes/connectionClose.asp"-->