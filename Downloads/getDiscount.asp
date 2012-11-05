<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="includes/connection.asp"-->
<!--#include virtual="/includes/connectionRef.asp"-->
<%



'---------------------------------------------------------------'
'Written By : Praveen'
'Created Date : 15/09/2011'
'Description :'
'This page is for Checking facebook and Referral discounts from ajax' 
'--------------------------------------------------------------'


'Declare the local variable'
Dim objRs, strCourses
Dim strCity, strDate, strStartDate,strEndDate 
Dim arrAllCourses, firstRow, lastRow, numRows, rowCounter
Dim rqcount,rqPayment,strGetvalues
Dim rqEnroll,rqStudents,rqDistance
'Creating Record object''
Set objRs=Server.CreateObject("ADODB.Recordset")

 'Retriving the values from fin.asp page through AJAX'
rqVoucher = Request.QueryString("HRID")
rqPrice = Request.QueryString("Price")

rqDiscountCode = 0

If Left(rqVoucher,2) = "RF" Then


'Query for checking Referral Discount Code' 

strQuery = "SELECT * FROM Ref_Voucher WHERE Voucher = '"& rqVoucher &"' AND ValidDate >= '"&Now()&"' AND VStatus IS NULL"
							'response.Write(strQuery)
							objRs.Open strQuery, ConnObjRef
							Do Until objRs.EOF
							
							rqDiscountCode = objRs("Voucher")
							UsedPoints = objRs("UsedPoints")
						'response.Write(ITILcode)
							objRs.Movenext
							Loop
							objRs.Close


Else


'Query for checking FB Discount Code'

strQuery = "SELECT TOP 1 * FROM facebookDiscounts Order by Id desc"
							'response.Write(strQuery)
							objRs.Open strQuery, ConnObj
							Do Until objRs.EOF
							
							rqDiscountCode = objRs("discountCode")
						'response.Write(ITILcode)
							objRs.Movenext
							Loop
							objRs.Close




End If

If rqVoucher = rqDiscountCode Then



Str = "<font style=""color:#009900"">Discount Code Valid</font> <input type=""hidden"" name=""Discount"" value=""Valid"">"

If Left(rqVoucher,2) = "RF" Then

Str = Str & " <input type=""hidden"" name=""Tag"" value="&rqVoucher&">"

End If
response.Write(Str)

Else

Str = "<font style=""color:#FF0000"">Discount Code Not Valid</font><input type=""hidden"" name=""Discount"" value=""NotValid""><input type=""BUTTON"" value=""Validate"" id =""facebookValidate"" class=""button"" onClick=""findEmail(this.value);"" />"

response.Write(Str)

End If



ConnObjRef.Close

%>


<!--#include virtual="/includes/connectionClose.asp"-->
