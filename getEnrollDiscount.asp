<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="includes/connection.asp"-->
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
rqVoucher = Request.form("Disountvoucher")
rqtxtBox = Request.form("txtBox")


If Left(rqVoucher,2) = "PM" Then


'Query for checking FB Discount Code'

strQuery = "SELECT TOP 1 * FROM facebookDiscounts Order by Id desc"
							'response.Write(strQuery)
							objRs.Open strQuery, ConnObj
							Do Until objRs.EOF
							
							rqDiscountCode = Trim(objRs("discountCode"))
						
							objRs.Movenext
							Loop
							objRs.Close


ElseIf Left(rqVoucher,2) = "RF" Then


'Query for checking Referral Discount Code' 

strQuery = "SELECT TOP 1 * FROM Ref_Voucher WHERE Voucher = '"& rqVoucher &"' AND ValidDate >= '"&Now()&"' AND VStatus IS NULL"
							'response.Write(strQuery)
							objRs.Open strQuery, ConnObj
							Do Until objRs.EOF
							
							rqDiscountCode = objRs("Voucher")							
							Session("points") = objRs("UsedPoints")
							Session("Voucher") = rqDiscountCode
							
						'response.Write(ITILcode)
							objRs.Movenext
							Loop
							objRs.Close
							
							
							

End If


If rqVoucher = rqDiscountCode Then


Session("Discountmessage") = "Discount Code Valid"

Else

Session("Discountmessage") = "Discount Code Not Valid"



End If
Session("Box") = rqtxtBox
Response.Redirect("/enroll.asp")

%>


<!--#include virtual="/includes/connectionClose.asp"-->
