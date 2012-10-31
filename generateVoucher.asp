<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/connection.asp"-->

<% If Session("FirstName") = "" Then 
Response.Redirect("/memberlogin.asp")
Else
%>
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="PageTitle">Generate Vocher</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px;"><br />
                <!-- Content Start From Here-->
                <%
'Declaring
Dim KNo, kno_passed,payer_email,strQuery,objRs,payer_id
Dim RsVocher,strVoucher,vocher_Number,vocher_ValidDate
Dim strVoucher1,RsVocher1,vocher_Number1,vocher_ValidDate1


payer_email=Session("PayerEmail")
'payer_email = Request.Form("payer_email")
 
set rsQues=Nothing

Set rsQues = Server.CreateObject("ADODB.Recordset")
rsQues.ActiveConnection = ConnObj

if Session("State")="verified1" OR Session("State")="verified6" OR Session("State")="verified7" OR Session("State")="verified9" OR Session("State")="verified11" then

	Set objRs = Server.CreateObject("ADODB.Recordset")

	strQuery = "SELECT TOP 1 id FROM PaypalDB WHERE payer_email='"&payer_email&"' ORDER BY id DESC"
	response.Write(strQuery)
	objRs.open strQuery,ConnObj
	
	If Not objRs.EOF Then
		payer_id = objRs("id")

	End If
	
	objRs.Close
	
		'Generating Vocher Number- starts here'
					'Only for United Kingdom and Australia'
					
					Set RsVocher = server.CreateObject("ADODB.recordset")
										
					strVoucher = "SELECT MAX(vocherNo) As vocherNumber FROM PaypalDB"
					response.Write(strVoucher)
					RsVocher.Open strVoucher, ConnObj
					
					Do Until RsVocher.EOF
						
						'Checking the Maximum vocherNumber no.'
						If Not IsNull(RsVocher("vocherNumber")) Then
							
							vocher_Number = RsVocher("vocherNumber") + 1
							
						Else
						
							vocher_Number = 1000
							
						End If
						
						vocher_ValidDate = date() + 365
					
					RsVocher.Movenext
					Loop
					RsVocher.Close

					'Generating Vocher Number - Ends here'
					
					
				Set RsVocher1 = server.CreateObject("ADODB.recordset")

'Checking whether the record as vocher no and valid date					
strVoucher1 = "SELECT vocherNo, vocherValidDate FROM PaypalDB where id ='"&payer_id&"'"
					response.Write(strVoucher1)
					RsVocher1.Open strVoucher1, ConnObj
					
					Do Until RsVocher1.EOF
						
							vocher_Number1 = RsVocher1("vocherNo")
							vocher_ValidDate1 = RsVocher1("vocherValidDate")
					
					RsVocher1.Movenext
					Loop
					RsVocher1.Close
					
' Updating table after checking
IF IsNull(vocher_Number1)  AND  IsNull(vocher_ValidDate1) Then

ConnObj.Execute "UPDATE PaypalDB SET vocherNo = '"&vocher_Number&"', vocherValidDate = '"&vocher_ValidDate&"'  WHERE id ='"&payer_id&"'"

END If

'Redirection to html page where vocher will be generated
 'response.redirect("http://www.itilstudy.com/Voucher/ITIL-Voucher.asp")
 response.redirect("/PDF/ITILVoucher.asp")

else
end if

set rsQues=Nothing
%>
                <!-- Content End From Here-->
                <!--#include virtual="/includes/connectionClose.asp"-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<% End If %>
<!--#include virtual="/includes/footer.html"-->
