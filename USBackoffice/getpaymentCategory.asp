<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<%
'Declare the local variable'
Dim objRs, strCourses
Dim strCity, strDate, strStartDate,strEndDate 
Dim arrAllCourses, firstRow, lastRow, numRows, rowCounter
Dim rqcount,rqpaymentCategory
Dim rqCoursedate,rqcourse
'Creating Record object''
Set objRs=Server.CreateObject("ADODB.Recordset")

'Currency Format Display Functions'

Currency_Format_Front = CurrencyFormat_Front(Session("CRM_Country"))

Currency_Format_Back = CurrencyFormat_Back(Session("CRM_Country"))


'Retriving the values from fin.asp page through AJAX'
rqpaymentCategory = Request.QueryString("paymentCategory")
'If user select paymentCategory that will come here'


If rqpaymentCategory = "Paymentforopenclass" OR rqpaymentCategory = "Paymentforcorporateclass" Then

If rqpaymentCategory = "Paymentforopenclass" Then

'Query for Openclass'
strCourses ="SELECT * FROM ITIL_course WHERE startdate BETWEEN DATEADD(day,-60,'"&Now()&"') AND DATEADD(day,60,'"&Now()&"')  And coursetype <> 'Corporate' AND country = '"&Session("CRM_Country")&"' ORDER BY startdate ASC"

ElseIf rqpaymentCategory = "Paymentforcorporateclass" Then
'Query for Corporate class'
strCourses ="SELECT * FROM ITIL_course WHERE startdate BETWEEN DATEADD(day,-60,'"&Now()&"') AND DATEADD(day,60,'"&Now()&"')  And coursetype ='Corporate' AND country = '"&Session("CRM_Country")&"' ORDER BY  startdate ASC"

End If

objRs.Open strCourses,ConnObj


Str = "<td> Select Course :</td><td><select name=""first"" id=""first"" onchange=""findPaymentType(this.value);""><option value="""">---------Select---------</option>"
   Do Until objRs.EOF
    Str = Str &"<option value="&objRs("courseid")&">"
                Str = Str &" "& objRs("city")&" " 
                Str = Str &": "
                Str = Str &""& FormatDateTime(objRs("startdate"),1) &""
                Str = Str &"to"
                Str = Str &""& FormatDateTime(objRs("enddate"),1) &""
                Str = Str &"</option>"
         objRs.Movenext
		 Loop 
	     objRs.Close 
               Str = Str &"</select></td></tr>"


response.write(Str)

Else

response.write(Str)

End If
%>
<!--#include virtual="/includes/connectionClose.asp"-->
 
