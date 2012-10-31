<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
   If Session("UserId") = "" Then
     Response.Redirect("../login.asp")
   Else
%>
<%
'---------------------------------------------------------------'
'Written By : Bharath'
'Last UpDated : 1st Nov 2007'
'Modified By : Bharath'
'Description : 17th Feb 2011'
'This Page is for viewing Enrolled users '
'--------------------------------------------------------------'
%>
<!--#include virtual="/india/connection.asp"-->
<%
	Dim rqcountry
	Dim message
	Dim Sql
	Dim rqMessage
	Dim i
	Dim rqCountryForm
	Dim rqCountrySession
	
	rqMessage = Session("message")
	Session("message") = ""
	
	Sql = "select distinct(country) from ITIL_city order by country desc"
	Rs.open Sql,conn
	
	rqCountryForm = Request.Form("country")
	rqCountrySession = Session("country")
	if rqCountryForm <> "" then
		rqcountry = rqCountryForm
	else
		rqcountry = rqCountrySession 
	end if
	
	Session("country") = rqcountry
	
	
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>CSR Home</title>
<link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
</head>
<body><div id="htMap">
<table border="1"  width="1000px" cellspacing="0" height="550" class="dbborder">
 <tr>
   <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% =Session("country") %></span> ITILstudy Back Office</font></div>
 </tr>
 <tr>
   <td width="100px" valign="top" rowspan="22">
    <% if Session("country") <> "" then %>
	<!--#include file="leftMenu.html"-->
	<% end if %>
   </td>
   <td >
   <form name="country" action="csrHome.asp" method="post">
	   <table border="0" height="400px">
		 <% if Session("country") = "" then %>
		 <tr>
		  <td align="center" height="" width="900px"><font color="#00B0EC" face="Arial" size="4">Welcome To ITILstudy</font></td>
		 </tr>
		 <% else %>
		 <tr>
		  <td align="center" height="" width="900px"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% =Session("country") %></span> Back Office</font></td>
		 </tr>
		 <% end if %>
		 <tr>
		  <td colspan="2" align="center" valign="top">Please select the <b>Country</b> : 
		  <select name="country" >
			<option value="">--Select--</option>
			<% do until Rs.EOF 
			   for each i in Rs.Fields %>
			<option value="<% =Rs("country") %>" <% If rqcountry = Rs("country") Then %> selected="selected" <% End If %>><% = Rs("country") %> </option>
			<% next
			   Rs.movenext
		       loop %>	
		 </select><div>&nbsp;</div>
		<div align="center" style="margin-right:-160px;"><input type="submit" value="Submit" class="buttonc" /></div> </td>
		</tr>
  	</table>
	</form>
   </td>
  </tr>															
</table>

<% 
'P.O Received email
'Creating Record objects'	
Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")

'Retriving the last mail send date'
strQuery = "SELECT id FROM ITIL_enrolledusers WHERE us_status = 'P.O Received' AND po_expected IS NOT NULL AND po_sentmail IS NULL AND po_expected = '"& Date &"' AND checkreceived IS NULL Order by id desc"

objRs.Open strQuery,Conn
'response.Write(strQuery)
Do until objRs.EOF

	rqEnrollUserId = objRs("id")

	'Retriving the last mail send date'
	strQuery = "SELECT firstname, lastname, email, po_expected, nameofemployeer, coursedetails FROM ITIL_enrolledusers WHERE id = '" & rqEnrollUserId &"' Order by id desc"
	
	objRs1.Open strQuery,Conn
	'response.Write(strQuery)
	Do until objRs1.EOF
	
		POExpected = FormatDateTime(objRs1("po_expected"),2)
		'checkReceived = objRs("checkreceived")
		firstName = objRs1("firstname")
		lastName = objRs1("lastname")
		email = objRs1("email")
		company = objRs1("nameofemployeer")
		coursedet = objRs1("coursedetails")
	objRs1.Movenext
	Loop
	objRs1.Close
	
	'Comparing the dates'
	'Comparin 1 day after P.O.expected date and today's date'
	'If (Date()- (cdate(POExpected))) =1 And Isnull(checkReceived) And IsNull(PO_SentMail) Then
	
	strBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.ITILstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Hi,<BR><BR>We didn't recieve the payment from the student "&firstName&" "&lastName&" of Company name: "& company &" whose email id is " & email &".<br><br>Course Details: "& coursedet &"<BR><BR>P.O.Expected Date: "&POExpected&"<br><br>Please follow up on this.<BR><BR>Best Regards, <BR>Custmer Support<br>www.ITILstudy.com<BR>Email: marketing@itilstudy.com</font></font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"
	'response.Write(strBody)
	
	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
	objCDOMail.From = """Payment Not Received"" <marketing@itilstudy.com>"
	objCDOMail.To =  "marketing@itilstudy.com" 
	objCDOMail.Importance = 2
	objCDOMail.Subject = "Payment not recieved from "&firstName&" "&lastName
	objCDOMail.BodyFormat = 0
	objCDOMail.MailFormat = 0
	objCDOMail.Body =  strBody
	objCDOMail.Send
	Set objCDOMail = Nothing
	

	'Inserting date into the facultymailsent table because based on this emails will send daily'
	conn.Execute "UPDATE ITIL_enrolledusers SET po_sentmail = '1' WHERE id = '" & rqEnrollUserId &"'"
	'response.Write(strQuery)
			
	'End If	

			
objRs.Movenext
Loop
objRs.Close	
%>

</div>
</body>
</html>
<% End If %>