<% If Session("PayerEmail") = "" Then 
%>
	<script type="text/javascript">top.location.href='/memberlogin.asp';</script>
<% Else %>
<html>
<head>
<TITLE>ITILstudy </TITLE>
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
Dim kno1,kno2,kno3,kno4,kno5,kno6
Dim bgcolor

'Retrive The Test Number'
If (Request.Form("TestNo")<>"") Then
	Session("TestNo")=Request.Form("TestNo")
Else
	Session("TestNo")=Session("TestNo")
End If
'Response.write(Session("TestNo"))

rqtype=Request.QueryString("type")
'Retrive The User Response Table'
Set objRs = ConnObj.Execute("SELECT  QuesNo, SelectedChoice, Marked, Duration from Sim15QuesResponse WHERE TestNo='"&Session("TestNo")&"' ORDER BY GID")

'Retrive The Correct Answer Table'
Set objRs1 = ConnObj.Execute("SELECT  QuesNo, Ans, KNo from Sim15QuesCorrectAns ORDER BY GID")


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
  <LI> <a href="#go1"><B>Summary Test Results</B></A> - Overall Scores and % Correct: If more than 11 questions answered correctly, then you are well-prepared for ITIL Foundation Certification Exams.<BR>
    <BR>
  </LI>
 
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
'	Else
	
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
		Select Case Array1(2,k)
		
			Case "1"
				kno1 = kno1 + 1
				kno1ques = kno1ques + 1
				If Array(3,i) <> "" Then
					kno1time = CDbl(kno1time) +  CDbl(Array(3,i))
				End If
				
			Case "2"
				kno2 = kno2 + 1
				kno2ques = kno2ques + 1
				If Array(3,i) <> "" Then
					kno2time = CDbl(kno2time) +  CDbl(Array(3,i))
				End If
				
			Case "3"
				kno3 = kno3 + 1
				kno3ques = kno3ques + 1
				If Array(3,i) <> "" Then
					kno3time = CDbl(kno3time) +  CDbl(Array(3,i))
				End If
				
			Case "4"
				kno4 = kno4 + 1
				kno4ques = kno4ques + 1
				If Array(3,i) <> "" Then
					kno4time = CDbl(kno4time) +  CDbl(Array(3,i))
				End If
		
			Case "5"
				kno5 = kno5 + 1
				kno5ques = kno5ques + 1
				If Array(3,i) <> "" Then
					kno5time = CDbl(kno5time) +  CDbl(Array(3,i))
				End If
		
			Case "6"
				kno6 = kno6 + 1
				kno6ques = kno6ques + 1
				If Array(3,i) <> "" Then
					kno6time = CDbl(kno6time) +  CDbl(Array(3,i))
				End If
		
			
			Case Else
			
		End Select

	Else
	
		Select Case Array1(2,k)
		
			Case "1"
				kno1ques = kno1ques + 1
				If Array(3,i) <> "" Then
					kno1time = CDbl(kno1time) +  CDbl(Array(3,i))
				End If
				
			Case "2"
				kno2ques = kno2ques + 1
				If Array(3,i) <> "" Then
					kno2time = CDbl(kno2time) +  CDbl(Array(3,i))
				End If
				
			Case "3"
				kno3ques = kno3ques + 1
				If Array(3,i) <> "" Then
					kno3time = CDbl(kno3time) +  CDbl(Array(3,i))
				End If
				
			Case "4"
				kno4ques = kno4ques + 1
				If Array(3,i) <> "" Then
					kno4time = CDbl(kno4time) +  CDbl(Array(3,i))
				End If
		
			Case "5"
				kno5ques = kno5ques + 1
				If Array(3,i) <> "" Then
					kno5time = CDbl(kno5time) +  CDbl(Array(3,i))
				End If
		
			Case "6"
				kno6ques = kno6ques + 1
				If Array(3,i) <> "" Then
					kno6time = CDbl(kno6time) +  CDbl(Array(3,i))
				End If
		
			Case Else
			
		End Select

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
	  
    <td class=<% = bgcolor %>><div align="center"><B>
        <% l = l + 1 %>
        <% = Array1(l,k) %></B></div></td>
		<% j = j + 1 %>
<!--    <td class=<% = bgcolor %>><div align="center"><% If Array(j,i) <> "" Then %><% = Round((Array(j,i)/60),2)%><% Else %>&nbsp;<% End If %></div></td>
-->	
    <%
		j = 0
		l = 0
		i = i + 1
		k = k + 1
		Next
	%>
  </tr>
  <%
  iCount = iCount + 1
  Next%>
  <tr>
    <td class="TableRowEven" colspan="6">&nbsp;</td>
  </tr>
</table>
<% TimeTaken = (kno1time + kno2time + kno3time + kno4time + kno5time + kno6time) %>
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
<B>% Time Taken : </B><% = Round((TimeTaken)/60,2) %> Minutes (this is only the question answering time and does not include time spent in breaks or viewing all answers)<br><br>
<a name="go"></a>
<%
markstotal = FormatNumber(correctans/0.15,2)

 If markstotal < 65 Then %> 
<p><font size="2px"><b>98% of students passed ITIL Certification exam with <a href="http://www.ITIlstudy.com">ITILstudy</a>! </b></font><br/><br/>
<font size="3px"><b><i><a href="http://www.itilstudy.com/ITIL-Online-Courses.asp">Enroll</a> with us to increase your score from <%=markstotal%>% to more than 65!</i></b></font></b><br/><br/>

<% If Session("CountryOrigin") <> "India" Then %>

<b>Our confidence in our quality is reflected by the fact that we are the only ITIL Foundation Training provider in the industry to offer Exam Retake Guarantee.<br/><br/>



<%End If%>

Book Online or call

	
	<% If Session("CountryOrigin") = "India" Then
	
		strBody = strBody & " <font color=""#0099FF"">080 41557547</font> "
	
	ElseIf Session("CountryOrigin") = "US" OR Session("CountryOrigin") ="Canada" Then
	
		strBody = strBody & " <font color=""#0099FF"">+1-855-234-845</font> "
	
	ElseIf Session("CountryOrigin") = "Australia" Then
	
		strBody = strBody & " <font color=""#0099FF"">+61 2 88964376</font> "

	ElseIf Session("CountryOrigin") = "UAE" Then
		
		strBody = strBody & " <font color=""#0099FF"">50-2757445</font> "
	
	ElseIf Session("CountryOrigin") = "United Kingdom" Then
	
    	strBody = strBody & " <font color=""#0099FF"">0800 0337 097</font> "
	
	End If %>
    
	 to speak to an ITIL Training Counsellor today.<br/><br/>



To know Percentage Score In Different Knowledge Area Please <a href="/ITILsim/Sim15Ques/evaluate.asp?type=display#more">Click Here</a></b><br/><br/>
<%End If%>

</div>
<%

	Set objRs = connObj.Execute("SELECT TestNo FROM Sim15QuesUserTable WHERE TestNo = '"&Session("TestNo")&"' AND KNo1 Is Null")	
	If Not objRs.EOF Then
	TestNoCheck = objRs("TestNo")	
    End if
    objRs.Close
    set objRs = Nothing
	
   If TestNoCheck <>"" Then
	
		 	OverAllPercentage =correctans/6*100
			
		
 	
		Set objRs = connObj.Execute("Update Sim15QuesUserTable SET EMail = '"&Session("PayerEmail")&"',OverAll = "&OverAllPercentage&" WHERE TestNo = '"&Session("TestNo")&"'")
		
		

'Sending exam result email to the user

	rqUserName = Session("FirstName") &" "& Session("LastName")

	strBody = "<table width=""80%"" border=""0"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;"">"
	strBody = strBody & "<tr><td width=""45px"">&nbsp;</td></tr>"
	strBody = strBody & "<tr><td><table width=""600"" border=""0"" style=""border:0px solid #CCCCCC"" align=""center"" cellpadding=""4"" cellspacing=""0"" bgcolor=""#FFFFFF"">"
	strBody = strBody & "<tr><td width=""595"" bgcolor=""#FFFFFF""><span><img src=""http://www.ITILstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" /></span>" 
    strBody= strBody &"</td></tr>"
	strBody = strBody & "<tr><td colspan=""2"" width=""560px"">"
	strBody = strBody & "<table border=""0"" cellpadding=""6"" width=""560px"">"
	strBody = strBody & "<tr><td><span style=""font-family: Arial, Helvetica, sans-serif;font-size: 13px;color: #2F95D3;font-weight: bold;line-height: 18px;font-style: normal;padding-top: 5px;padding-bottom: 5px;"" >Dear "&Session("FirstName")&"&nbsp;"&Session("LastName")&",</span></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"" >You have completed the ITIL Foundation Mock Test (TestNo: "&Session("TestNo")&")</font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>Here is a summary of your test results:</b> </font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"" color=""#666666"">Total Number of Questions:</font> <font face=""Arial"" size=""2"" color="""">15</font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"" color=""#666666"">Questions used for scoring:</font> <font face=""Arial"" size=""2"" color="""">15</font><br><font face=""Arial"" size=""2"" color=""#666666"">Questions Answered Correctly:</font> <font face=""Arial"" size=""2"" color="""">"&correctans&"</font><br><font face=""Arial"" size=""2"" color=""#666666"">Percentage Questions Answered Correctly:</font> <font face=""Arial"" size=""2"" color="""">"&markstotal&" % (i.e. "&correctans&" / 15 * 100 )</font><br><br></td></tr>"
	
If markstotal < 65 Then 
	strBody = strBody & "<tr><td><span style=""font-family: Arial, Helvetica, sans-serif;font-size: 13px;font-weight: bold;line-height: 18px;font-style: normal;padding-top: 5px;padding-bottom: 5px;"" ><p><font size=""2px""><b>98% of students passed ITIL Certification exam with <a href=""http://www.ITIlstudy.com"">ITILstudy</a>! </b></font><br/><br/><font size=""3px""><b><i><a href=""http://www.itilstudy.com/ITIL-Online-Courses.asp"">Enroll</a> with us to increase your score from "&markstotal&"% to more than 65!</i></b></font></b><br/><br/>"
	If Session("CountryOrigin") <> "India" Then
	strBody = strBody & "<b>Our confidence in our quality is reflected by the fact that we are the only ITIL Foundation Training provider in the industry to offer Exam Retake Guarantee." 
	End If
	
	strBody = strBody & "<br/><br/>Book Online or call" 
	
	If Session("CountryOrigin") = "India" Then
	
		strBody = strBody & " <font color=""#0099FF"">080 41557547</font> "
	
	ElseIf Session("CountryOrigin") = "US" OR Session("CountryOrigin") ="Canada" Then
	
		strBody = strBody & " <font color=""#0099FF"">+1-855-234-845</font> "
	
	ElseIf Session("CountryOrigin") = "Australia" Then
	
		strBody = strBody & " <font color=""#0099FF"">+61 2 88964376</font> "

	ElseIf Session("CountryOrigin") = "UAE" Then
		
		strBody = strBody & " <font color=""#0099FF"">50-2757445</font> "
	
	ElseIf Session("CountryOrigin") = "United Kingdom" Then
	
    	strBody = strBody & " <font color=""#0099FF"">0800 0337 097</font> "
	
	End If
	
	strBody = strBody & "to speak to an ITIL Training Counsellor today.<br/></span></td></tr>" 


End If
	
	If markstotal > 65 Then
	
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">We would like to congratulate you on doing well in the Mock Exam and hope that you would do better in the actual exam with ITILstudy.</font></td></tr>"
	
	Else
	
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">We hope that the mock exam gave you a better understanding of the actual ITIL exam and recommend you to get back to the study guides of the chapters where you struggled in this exam.</font></td></tr>"
	
	End If
	
	
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">Best Regards,<br>Customer Support<br>www.ITILstudy.com<br>Email: <a href=""mailto:adminsupport@ITILstudy.com"" target=""_blank"">adminsupport@ITILstudy.com</a></font></td></tr>"
	strBody = strBody & "</table></td></tr></table><tr><td width=""45px"">&nbsp;</td></tr></table>"
	'response.Write(strBody)

	Dim objCDOMail

	'Holds the CDONTS NewMail Object
	'Create the e-mail server object
	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")

	'Who the e-mail is from
	objCDOMail.From = "marketing@itilstudy.com"
    'objCDOMail.From = "edusyspriyanka@gmail.com"
	
	'Who the e-mail is sent to
	objCDOMail.To = Session("PayerEmail")

	'Who the CC are sent to
	objCDOMail.Cc = "marketing@itilstudy.com"
	'objCDOMail.Cc =  "edusyssavita@gmail.com"

	'Set the subject of the e-mail
	objCDOMail.Subject = Session("FirstName") &" "& Session("LastName")&" : Exam Result ITILstudy Mock Test "

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
<% End If %>