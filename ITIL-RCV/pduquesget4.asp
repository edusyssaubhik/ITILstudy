<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerloginbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->


<% If Session("FirstName") = "" Then 
response.Redirect("/memberlogin.asp")
Else
%>
 
 <!-- Body Starts -->
  <div>
  	<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="235" align="left" valign="top" bgcolor="#FFFFFF">
				<table width="100%" border="0" cellspacing="0" cellpadding="8">

                  <tr>
                    <td width="2%" class="Header">&nbsp;</td>
                    <td width="25%" class="PageTitle">&nbsp;</td>
                    <td width="73%" class="PageTitle">Evaluation Test</td>
                  </tr>
                  <tr>
					<!--#include virtual="/includes/innerLeftMenu.asp"-->
                    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
					<div style="margin-top:-12px;"><br />
					<!-- Content Start From Here-->
					
					<span class="Header">Dear <%=Session("FirstName")%>, </span>
					<br /><br />
<%
Dim KNo,nCur,nCurNo ,quesAsked, kno_passed,payer_email, color, dategranted,onlinecertissued, onlinecertdate, phycertissued, phycertdate, phycertdet, Nostatus, NRstatus

Nostatus="No"
NRstatus="Not Required"

dategranted=Date()
color1="Red"
color2="Blue"
KNo=Request.Form("KNo")
nCur=Request.Form("nCur")
nCurNo=int(nCur)
kno_passed=int(KNo)
payer_email=Session("PayerEmail")

Set rsQues = Server.CreateObject("ADODB.Recordset")
rsQues.ActiveConnection = ConnObj
rsQues.Open "SELECT PDUs, AreaTitle, PDUs from KArea_RCV WHERE KNo='"&KNo&"'"

 
set rsQues=Nothing

Set rsQues = Server.CreateObject("ADODB.Recordset")
rsQues.ActiveConnection = ConnObj

If Session("State") = "verified11"  Then

	Set objRs = Server.CreateObject("ADODB.Recordset")

	strQuery = "SELECT TOP 1 id FROM PaypalDB WHERE payer_email='"&payer_email&"' ORDER BY id DESC"
	objRs.open strQuery,ConnObj
	
	If Not objRs.EOF Then
		payer_id = objRs("id")
	End If
	
	objRs.Close

ConnObj.Execute "UPDATE PaypalDB SET kno_passed = '"&kno_passed&"' WHERE id ='"&payer_id&"'"

Session("KnoPassed")=KNo

If (KNo=9) then


Response.Write "You successfully completed all the chapters in foundation course. <BR><BR><font color=""red""><B>Congratulations for completing all the chapters.</B><BR><BR><B>Please review the chapter before attempting the sample exam.</B></font>"


ConnObj.Execute "UPDATE PaypalDB SET dategranted = '"&date&"' WHERE id ='"&payer_id&"'"

If(Session("Item")="Online Cert") Then
ConnObj.Execute "UPDATE PaypalDB SET color = '"&color1&"' WHERE id ='"&payer_id&"'"
ConnObj.Execute "UPDATE PaypalDB SET onlinecertissued = '"&Nostatus&"' WHERE id ='"&payer_id&"'"
ConnObj.Execute "UPDATE PaypalDB SET phycertissued = '"&NRstatus&"' WHERE id ='"&payer_id&"'"
Else
ConnObj.Execute "UPDATE PaypalDB SET color = '"&color2&"' WHERE id ='"&payer_id&"'"
ConnObj.Execute "UPDATE PaypalDB SET onlinecertissued = '"&Nostatus&"' WHERE id ='"&payer_id&"'"
ConnObj.Execute "UPDATE PaypalDB SET phycertissued = '"&Nostatus&"' WHERE id ='"&payer_id&"'"
End If

Dim objCDOMail
'Holds the CDONTS NewMail Object
'Create the e-mail server object
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'Who the e-mail is from
objCDOMail.From = "adminsupport@itilstudy.com"
'Who the e-mail is sent to
objCDOMail.To = "adminsupport@itilstudy.com"
'Who the blind copies are sent to
objCDOMail.Bcc = "adminsupport@itilstudy.com"
'Set the subject of the e-mail
objCDOMail.Subject = "Completion of all sections of ITIL course for : ( "&payer_email&" )"
'Set the e-mail body format (0=HTML 1=Text)
objCDOMail.BodyFormat = 0
'Set the mail format (0=MIME 1=Text)
objCDOMail.MailFormat = 0
'Set the main body of the e-mail
objCDOMail.Body = ""&payer_email&" has completed the course."
'Importance of the e-mail (0=Low, 1=Normal, 2=High)
objCDOMail.Importance = 2
'Send the e-mail
objCDOMail.Send
'Close the server object
Set objCDOMail = Nothing




else
end if

else
end if

set rsQues=Nothing
%>

<%If (KNo<>9) then%>
<B><font color="red">Congratulations!!! You have completed this chapter. </font></B><BR><BR> 
<%else%>
<%end if%>
 
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
  <!-- Body Ends -->
  <% End If %>
<!--#include virtual="/includes/footer.html"-->



