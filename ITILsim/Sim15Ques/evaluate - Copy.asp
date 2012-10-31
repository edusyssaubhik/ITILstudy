<html>
<head>
<TITLE>ITILstudy.com </TITLE>
<META http-equiv=Content-type content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script language="JavaScript" type="text/javascript" src="/js/tableH.js"></script>
</head>
<body>
<!--#include virtual="/includes/connection.asp"-->
<%
'Declare The Local Variables'
Dim TestNo,objRs,objRs1, Array, Array1
Dim i, j, k, l, quesno, correctans

Dim bgcolor

'Retrive The Test Number'
If (Request.Form("TestNo")<>"") Then
	TestNo=Request.Form("TestNo")
Else
	TestNo=Session("TestNo")
End If

'Retrive The User Response Table'
Set objRs = ConnObj.Execute("SELECT  QuesNo, SelectedChoice, Marked, Duration from Sim15QuesResponse WHERE TestNo='"&TestNo&"' ORDER BY GID")

'Retrive The Correct Answer Table'
Set objRs1 = ConnObj.Execute("SELECT  QuesNo, Ans from Sim15QuesCorrectAns ORDER BY GID")


'And Putting Into Arrays And Evaluate The Answers'
Array = objRs.GetRows
Array1 = objRs1.GetRows
set objRs = Nothing
set objRs1 = Nothing
%>
<P align="center"><font size="3"><b>Evaluate All Answers</b></font> </P>
<p align="right"><font size="3"><A href="/nextsteps.asp">Next Steps</A></font></P>
<p align="left">
<UL>
  <LI> <a href="#go1"><B>Summary Test Results</B></A> - Overall Scores and % Correct: If more than 11 questions answered correctly, then you are well-prepared for ITIL Certification Exams.<BR>
    <BR>
  </LI>
  <LI> <a href="#go"><B>Results</B></A> - Scores in Different Chapters: Identifies which Chapters require more study.<BR>
    <BR>
  </LI>
  <LI> <B>Detailed Scores:</B> Scores and Justification for each answer.</LI>
</UL>
</P>
<table width="750" border="0" cellspacing="0" cellpadding="0">
<%
'Assign The Values'
i=0
j=0
k=0
l=0
kno1=0
kno2=0
kno3=0
kno4=0
kno5=0
kno6=0


kno1time = 0
kno2time = 0
kno3time = 0
kno4time = 0
kno5time = 0
kno6time = 0


quesno=0
correct=0
correctans=0
markedques=0
markedquescorrect=0
iCount = 0

randomno=int(Weekday(Date()))

%>
<tr>
	<td class="TableRowOdd" width="52" height="35px"><div align="center"><B>Ques No.</B></div></td>
	<td class="TableRowOdd" width="100" colspan="2"><div align="center"><B>Selected Choice</B></div></td>
	<td class="TableRowOdd" width="121"><div align="center"><B>Correct Answer</B></div></td>
	<td class="TableRowOdd" width="121"><div align="center"><B>Answer Status</B></div></td>
	<td class="TableRowOdd" width="100"><div align="center"><B>Time Taken<br>(In Min.)</B></div></td>
	<td class="TableRowOdd" width="100"><div align="center"><B>Justification</B></div></td>
</tr>
<% For tf1 = 0 to 14 %>
<% 
   'Displaying Only ODD Color'
   If Eval(iCount\2 = iCount/2) Then
	   bgcolor =  "TableRowEven"
%>
<% Else 
   	   bgcolor = "TableRowOdd"
   End If 
%>
<tr>
<% For tf2 = 0 to 0 %>
<% 	
		
	'If Condtion Calcualtes 25 Questions This Question Not Used For Scoring'
	'Display 25 Question in Gray Color That All Are Dummy Question'
	'If((i+randomno) mod 8 = 0) Then
		
		'bgcolor = "TableRowQues"
	
	'In The Else Part Calculate The Marked And Correct Answers'
	'Else
	
		'Calculate The Marked Questions'
		If (Array(2,i) = "Mark") Then
		markedques = markedques + 1
		Else
		End If
	
		'Calculate The Correct Answers'
		If (Array(1,i) = Array1(1,k)) Then
		correctans = correctans + 1
		
		'Calculate The Marked Questions Correct'
		If (Array(2,i) = "Mark") Then
		markedquescorrect = markedquescorrect + 1
		Else
		End If
		
		'Calculate The Questions Based On knowledge Area'
	
	'End If
	
End if 
%>
    <td class=<% = bgcolor %>><% quesno = i + 1 %>
      <div align="center"><B><% = quesno%>.</B></div></td>
	  
    <td class="<% = bgcolor %>" width="20px">
      <% j = j + 1 %>
      <div align="center"><B><% If Array(j,i) <> "" Then %><% = Array(j,i)%><% Else %>&nbsp;<% End If %></B></div></td>
	  
    <td class="<% = bgcolor %>" width="30px">
	
      <% j = j + 1 %>
      <div align="center"><font color="green"><% If Array(j,i) <> "" Then %>Marked<% Else %>&nbsp;<% End If %></font></div>
	  </td>
	  
    <td class="<% = bgcolor %>" ><div align="center"><B>
        <% l = l + 1 %>
        <% = Array1(l,k) %></B></div></td>
		
    <td class="<% = bgcolor %>"><div align="center">
        <% If (Array(1,i) <> Array1(1,k)) Then %>
        <span><img src="/images/buttons/wrong.gif" alt="Wrong"></span>
        <% ElseIf (Array(1,i) = Array1(1,k)) Then %>
        <span><img src="/images/buttons/right.gif" alt="Correct"></span>
        <% Else %>
        <span>&nbsp;</span>
        <% End If %></div>
      </td>
	  
  
		<% j = j + 1 %>
    <td class=<% = bgcolor %>><div align="center"><% If Array(j,i) <> "" Then %><% = Round((Array(j,i)/60),2)%><% Else %>&nbsp;<% End If %></div></td>
	
    <td class=<% = bgcolor %>><div align="center"><a href="<% = quesno %>ans.asp" target=_blank>Details</A></div></td>
    <%
		j = 0
		l = 0
		i = i + 1
		'k = k + 1
		Next
	%>
  </tr>
  <%
  iCount = iCount + 1
  Next%>
  <tr>
    <td class="TableRowEven" colspan="8">&nbsp;</td>
  </tr>
</table>
<% TimeTaken = quesno %>
<BR>
<a name="go1"></a>
<span class="Header">Summary of Results:</span> <br>
<br>
Total Number of Questions: <B>15</B><BR>
<BR>
<strong>Please note:</strong> <BR>
<UL>
  <LI>Out of total 15 questions answered, <B>all 15 questions are used for scoring</B> </LI>
  <LI><B>Questions Marked for Review :</B>Total Number of Questions Marked by you for Review: <B><%=markedques%></B><BR>
    (Of the marked questions, <%=markedquescorrect%> are answered correctly and <%=(int(markedques)-int(markedquescorrect))%> are wrong) </LI>
  <LI><B>Questions Answered Correctly: <B><%=correctans%></B><BR>
    <B>Percentage Questions Answered Correctly:</B> <%=FormatNumber(correctans/0.15,2)%></B> % (i.e. <%=correctans%> / 15 * 100 )</LI>
</UL>
<B>% Time Taken : </B><% = Round((TimeTaken)/60,2) %> Minutes<br><br>


<%


			Set objRs = connObj.Execute("SELECT TestNo FROM Sim15Quesusertable WHERE TestNo = '"&TestNo&"'")
	 
			If (Not objRs.BOF) And (Not objRs.EOF) Then
			
				OverAllPercentage =correctans/15*100
 	
				Set objRs = connObj.Execute("Update Sim15QuesUserTable SET EMail = '"&Session("PayerEmail")&"',OverAll = "&OverAllPercentage&" WHERE TestNo = '"&TestNo&"'")
				
'Sending exam result email to the user

	rqUserName = Session("FirstName") &" "& Session("LastName")

	strBody = "<table width=""80%"" border=""0"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;"">"
	strBody = strBody & "<tr><td width=""45px"">&nbsp;</td></tr>"
	strBody = strBody & "<tr><td><table width=""600"" border=""0""  style=""border:0px solid #CCCCCC"" align=""center"" cellpadding=""4"" cellspacing=""12"" bgcolor=""#FFFFFF"">"
	strBody = strBody & "<tr><td width=""595"" bgcolor=""#FFFFFF"">" 
						
						strBody= strBody &"<span><img src=""http://www.ITILstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" /></span>"
						'End if
						strBody= strBody &"</td></tr>"
	strBody = strBody & "<tr><td  colspan=""2"" width=""560px"">"
	strBody = strBody & "<table border=""0"" cellpadding=""6"" width=""580px"">"
	strBody = strBody & "<tr><td valign=""top""><font face=""Arial"" size=""2"">Dear "&Session("FirstName")&"&nbsp;"&Session("LastName")&",</font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">You have completed Understanding ITIL Exam (TestNo: "&TestNo&")</font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">Here is a summary of your test results : </font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">Total Number of Questions: 15</font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">Questions used for scoring: 15<br>Questions Answered Correctly: "&correctans&"<br>Percentage Questions Answered Correctly: "&FormatNumber(correctans/0.15,2)&" % (i.e. "&correctans&" / 15 * 100 )</font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">% Time Taken : "&Round((TimeTaken)/60,2)&" Minutes</font></td></tr>"

	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">We hope you are enjoying your experience with ITILstudy.com. For next steps, please refer to http://www.ITILstudy.com/nextsteps.asp</font></td></tr>"
	strBody = strBody & "<tr><td>Help your friends succeed and get rewarded too! Its easy - just enter the email address and click on the button for ""Refer Friend"".</td></tr>"
	strBody = strBody & "<tr><td><form name=""referFriend"" action=""http://www.ITILstudy.com/insertReferFrnd.asp""  method=""post""><input type=""hidden"" name=""refEmailID"" value="&Session("PayerEmail")&"><input type=""hidden"" name=""refName"" value="&rqUserName&">Friend`s Email:  <input type=""text"" name=""frndEmailID1"">&nbsp; &nbsp; Name(optional):  <input type=""text"" name=""frndName1""><br /><br>  Friend`s Email:  <input type=""text"" name=""frndEmailID2"">  &nbsp; &nbsp; Name(optional):  <input type=""text"" name=""frndName2"">  <br /><br>  Friend`s Email:  <input type=""text"" name=""frndEmailID3""> &nbsp; &nbsp;  Name(optional):  <input type=""text"" name=""frndName3""><br /><br /><div align=""center""><input type=""submit"" value=""Refer Friend"" /><div></form></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">Best Regards,<br>Customer Support<br>www.ITILstudy.com<br>Email: adminsupport@ITILstudy.com</font></td></tr>"
	strBody = strBody & "</table></td></tr></table><tr><td width=""45px"">&nbsp;</td></tr></table>"
	
	'response.Write(strBody)
	
	Dim objCDOMail

	'Holds the CDONTS NewMail Object
	'Create the e-mail server object
	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")

	'Who the e-mail is from
	objCDOMail.From = "adminsupport@ITILstudy.com"

	'Who the e-mail is sent to
	objCDOMail.To = Session("PayerEmail")

	'Who the CC are sent to
	objCDOMail.Cc = "adminsupport@ITILstudy.com"

	'Set the subject of the e-mail
	objCDOMail.Subject = Session("FirstName") &" "& Session("LastName")&" : Exam Result Understanding Simulator"

	'Set the e-mail body format (0=HTML 1=Text)
	objCDOMail.BodyFormat = 0

	'Set the mail format (0=MIME 1=Text)
	objCDOMail.MailFormat = 0

	'Set the main body of the e-mail
	objCDOMail.Body = strBody

	'Importance of the e-mail (0=Low, 1=Normal, 2=High)
	objCDOMail.Importance = 2

	'Send the e-mail
	objCDOMail.Send

	'Close the server object
	Set objCDOMail = Nothing

End If

Set objRs = Nothing
connObj.Close
Set connObj = Nothing
%>

</P>
</font>
<p class="Header">Refer Friends</p>
              <form name="referFriend" action="/insertReferFrnd.asp"  method="post" onSubmit="return validate_form(this)">
                <table border="0"  align="left" width="55%">
                  <tr>
                    <td colspan="4"><table border="0" cellpadding="10" cellspacing="0">
                        <tr>
                          <td class="TableRowOdd">Your Email ID:<span class="Note">*</span></td>
                          <td class="TableRowOdd"><input type="text" name="refEmailID" maxlength="50" /></td>
                          <td class="TableRowOdd">Your Name:</td>
                          <td class="TableRowOdd"><input type="text" name="refName" maxlength="20" /></td>
                        </tr>
                        <tr>
                          <td class="TableRowEven">Friend's Email:<span class="Note">*</span></td>
                          <td class="TableRowEven"><input type="text" maxlength="50" name="frndEmailID1" /></td>
                          <td class="TableRowEven">Name:</td>
                          <td class="TableRowEven"><input type="text" maxlength="20" name="frndName1" /></td>
                        </tr>
                        <tr>
                          <td class="TableRowEven">Friend's Email:</td>
                          <td class="TableRowEven" ><input type="text" maxlength="50" name="frndEmailID2" /></td>
                          <td class="TableRowEven">Name:</td>
                          <td class="TableRowEven"><input type="text" maxlength="20" name="frndName2" /></td>
                        </tr>
                        <tr>
                          <td class="TableRowEven">Friend's Email:</td>
                          <td class="TableRowEven"><input type="text" maxlength="50" name="frndEmailID3" /></td>
                          <td class="TableRowEven">Name: </td>
                          <td class="TableRowEven"><input type="text" maxlength="20" name="frndName3" /></td>
                        </tr>
                      </table></td>
                  </tr>
                  
                  <tr>
                    <td colspan="2"><a href="javascript:;" onClick="toggleVARetainerAddMoreBP1('AddMoreBP1');" >More</a></td>
                  </tr> 
				  
                  <tr id="AddMoreBP1" style="display:none">
                    <td colspan="4"><table border="0" cellpadding="10" cellspacing="0">
                        <tr >
                          <td class="TableRowEven">Friend's Email:</td>
                          <td class="TableRowEven"><input type="text" maxlength="50" name="frndEmailID4" /></td>
                          <td class="TableRowEven">Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                          <td class="TableRowEven"><input type="text" maxlength="20" name="frndName4" /></td>
                        </tr>
                        <tr>
                          <td class="TableRowEven">Friend's Email:</td>
                          <td class="TableRowEven"><input type="text" maxlength="50" name="frndEmailID5" /></td>
                          <td class="TableRowEven">Name:</td>
                          <td class="TableRowEven"><input type="text" maxlength="20" name="frndName5" /></td>
                        </tr>
                        <tr>
                          <td class="TableRowEven">Friend's Email:</td>
                          <td class="TableRowEven"><input type="text" maxlength="50" name="frndEmailID6" /></td>
                          <td class="TableRowEven">Name: </td>
                          <td class="TableRowEven"><input type="text" maxlength="20" name="frndName6" /></td>
                        </tr>
                      </table></td>
                  </tr>
				  <tr>
                    <td colspan="4">
						<table>
							<tr>
								<td>Personal Message:</td>
								<td  colspan="2"><textarea cols="25" rows="3" name="personalMessage" onKeyPress="maxlength(this, 1990);"  style="font-family:Arial, Helvetica, sans-serif; font-size:12px;">I have taken free simulated test provided by ITILstudy.com. I liked it and would want you to try it out.</textarea></td>
							</tr>
						</table>
					</td>
                  </tr> 
                  <tr>
                    <td colspan="3"><div align="center">
                        <input type="submit" name="Action" value="Refer Friends" />
                      </div></td>
                  </tr>
				  <!--<tr>
				  	<td><a href="/referFriendsTermsAndConditions.asp" target="_blank">Terms and conditions</a>.</td>
					</tr>-->
                </table>
              </form>
<p align="right"><font size="3"><A href="/nextsteps.asp">Test Analysis and Next Steps</A></font></p>
<script type="text/javascript" src="/js/refer_validation.js"></script>
</body>
</html>