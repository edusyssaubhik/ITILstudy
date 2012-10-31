<!--#include virtual="/includes/connectionRef.asp"-->
<%
'Declare the local variables'					
Dim rqEmail, rqPassword
Dim strQuery, objRs
Dim rqGenVoucher, rqRefID, rqRefName, rqRefEmail



Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "")
End Function

'Retriving the email id annd password from RefRewRedim.asp page'

RqType = Request.Form("type")
rqEmail = StrQuoteReplace(Request.Form("Ref_Email"))
rqPassword = StrQuoteReplace(Request.Form("Ref_Pass"))
rqGenVoucher = Request.Form("GenVoucher")

'Creating recordsets'
Set objRs = Server.CreateObject("ADODB.Recordset")
Set objPoints = Server.CreateObject("ADODB.Recordset")





If RqType = "Submit" Then


strQuery = "SELECT RefID, Name, PayStatus, Points FROM Ref_Account WHERE EmailID = '" & rqEmail & "' and Pass = '" & rqPassword & "'"
'Response.Write(strQuery)
objRs.Open strQuery,ConnObjRef

If (not objRs.BOF) and (not objRs.EOF) Then

Session("ReferralID") = objRs("RefID")
Session("RefName") = objRs("Name")
Response.Redirect("GenVoucher.asp")

Else

Session("Message") = "Login Failed"
Response.Redirect("RefRewRedim.asp")

End If



ElseIf RqType = "Generate Voucher" Then

'Retriving values from GenVoucher form'
rqRefID = Request.Form("RefID")
rqRefName = Request.Form("txtRefName")
rqRefEmail = Request.Form("txtRefEmail")
Points = Request.Form("txtPoints")

UsagePoints = Request.Form("points")


'Creating random voucher'
Dim pChar, pCount

pChar = "ABCDEFGHIJKLMNPQRSTUVWXYZ@$0123456789abcdefghijklmnopqrstuvwxyz"

pCount = Len(pChar) 

Dim Voucher
Voucher = "RFITIL"

Randomize
For i = 1 To 10 ' password length
Voucher = Voucher & Mid( pChar, 1 + Int(Rnd * pCount), 1 )
GenVoucher = Voucher
Next

strQuery = "SELECT * FROM Ref_Account WHERE RefID = '"&rqRefID&"'"

objRs.Open strQuery, ConnObjRef

If NOT objRs.EOF Then

'Based on the tag getting RefId and keeping that in session'


rqRefEmail = objRs("EmailId")
rqPointsRemaining = objRs("Points")

RqUsagePoints = rqPointsRemaining - UsagePoints

Else

rqPointsRemaining = 0

End if

objRs.close

'response.Write(UsagePoints)

ConnObjRef.Execute "INSERT INTO Ref_Voucher (RefID, Voucher, GenDate, ValidDate,UsedPoints) VALUES ('"& rqRefID &"','"& GenVoucher &"','"& Now() &"','"& Now()+30 &"','"& UsagePoints &"')"

ConnObjRef.Execute "UPDATE Ref_Account SET Points = '"& RqUsagePoints &"' WHERE RefID = '"& rqRefID &"'"

strBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.ITILstudy.com/images/banners/email_header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""540px""><table border=""0"" width=""720px"" align=""center""><tr height=""30px""><td><font face=""Arial"" size=2>Dear "& rqRefName &", <br><br>Voucher: "& GenVoucher &"<br><br>Generated Date: "& Now() &"&nbsp;&nbsp;Valid Till: "& Now()+30 &"<br><br>Best Regards,<br><br>Customer Support,<br><a href=""http://www.ITILstudy.com"" target=""_blank"">www.ITILstudy.com</a><br>Email: adminsupport@itilstudy.com</font></td></tr></table></td></tr></table></td></tr></table>"

'Response.Write(strBody)

Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
objCDOMail.From = "marketing@itilstudy.com"
objCDOMail.To =  "<" & rqRefEmail & ">"
objCDOMail.cc = "marketing@itilstudy.com, adminsupport@itilstudy.com"
objCDOMail.Importance = 2
objCDOMail.Subject = "Referral Voucher Code"
objCDOMail.BodyFormat = 0
objCDOMail.MailFormat = 0
objCDOMail.Body =  strBody
objCDOMail.Send
Set objCDOMail = Nothing
			

'Checking the user is valid or not'
Response.Redirect("/GenVoucher.asp?type=Voucher")

End If	

ConnObjRef.Close
%>
<!--#include virtual="/includes/footer.html"-->
