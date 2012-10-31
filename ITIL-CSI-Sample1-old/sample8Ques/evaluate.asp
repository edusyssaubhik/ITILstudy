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
Dim kno1,kno2,kno3,kno4,kno5,kno6,kno7
Dim kno8,kno9,kno10,kno11,bgcolor

'Retrive The Test Number'
If (Request.Form("TestNo")<>"") Then
	TestNo=Request.Form("TestNo")
Else
	TestNo=Session("TestNo")
End If

'Retrive The User Response Table'
Set objRs = ConnObj.Execute("SELECT  QuesNo, SelectedChoice, Marked, Duration from CSIsample8QuesResponse WHERE TestNo='"&TestNo&"' ORDER BY GID")

'Retrive The Correct Answer Table'
Set objRs1 = ConnObj.Execute("SELECT  QuesNo, Ans, KNo from CSIsample8QuesCorrectAns ORDER BY GID")

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
  <LI> <a href="#go1"><B>Summary Test Results</B></A> - Overall Scores and % Correct: You need to get 28 out of the available 40 questions (70%) right to pass the foundation exam. <BR>
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
kno7=0
kno8=0
kno9=0


kno1time = 0
kno2time = 0
kno3time = 0
kno4time = 0
kno5time = 0
kno6time = 0
kno7time = 0
kno8time = 0
kno9time = 0

ChoiceRate = 0

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
	<td class="TableRowOdd" width="121"><div align="center"><B>Most Correct Answer</B></div></td>
	<td class="TableRowOdd" width="100"><div align="center"><B>Time Taken<br>(In Min.)</B></div></td>
	<td class="TableRowOdd" width="100"><div align="center"><B>Justification</B></div></td>
</tr>
<% For tf1 = 0 to 7 %>
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
		
		
		Set objRs2 = ConnObj.Execute("SELECT ChoiceRate FROM Choice_CSIsample1 WHERE QuestionNo = '"&Array(0,i)&"' AND ChoiceNumber = '"&Array(1,i)&"'")
		
		Do Until objRs2.EOF
		
			ChoiceRate = ChoiceRate + objRs2("ChoiceRate")
		
		objRs2.Movenext
		Loop
		objRs2.Close
		
		'Response.Write("SELECT ChoiceRate FROM Choice_CSIsample1 WHERE QuestionNo = '"&Array(0,i)&"' AND ChoiceNumber = '"&Array(1,i)&"'<br>")
		
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
		
			Case "7"
				kno7 = kno7 + 1
				kno7ques = kno7ques + 1
				If Array(3,i) <> "" Then
					kno7time = CDbl(kno7time) +  CDbl(Array(3,i))
				End If
		
			Case "8"
				kno8 = kno8 + 1
				kno8ques = kno8ques + 1
				If Array(3,i) <> "" Then
					kno8time = CDbl(kno8time) +  CDbl(Array(3,i))
				End If
		
			Case "9"
				kno9 = kno9 + 1
				kno9ques = kno9ques + 1
				If Array(3,i) <> "" Then
					kno9time = CDbl(kno9time) +  CDbl(Array(3,i))
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
		
			Case "7"
				kno7ques = kno7ques + 1
				If Array(3,i) <> "" Then
					kno7time = CDbl(kno7time) +  CDbl(Array(3,i))
				End If
		
			Case "8"
				kno8ques = kno8ques + 1
				If Array(3,i) <> "" Then
					kno8time = CDbl(kno8time) +  CDbl(Array(3,i))
				End If
		
			Case "9"
				kno9ques = kno9ques + 1
				If Array(3,i) <> "" Then
					kno9time = CDbl(kno9time) +  CDbl(Array(3,i))
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
		
   
	  
		<% j = j + 1 %>
    <td class=<% = bgcolor %>><div align="center"><% If Array(j,i) <> "" Then %><% = Round((Array(j,i)/60),2)%><% Else %>&nbsp;<% End If %></div></td>
	
    <td class=<% = bgcolor %>><div align="center"><a href="<% = quesno %>ans.asp" target=_blank>Details</A></div></td>
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
    <td class="TableRowEven" colspan="8">&nbsp;</td>
  </tr>
</table>
<% TimeTaken = (kno1time + kno2time + kno3time + kno4time + kno5time + kno6time + kno7time + kno8time + kno9time ) %>
<BR>
<a name="go1"></a>
<span class="Header">Summary of Results: Test - <% = ChoiceRate %></span> <br>
<br>
Total Number of Questions: <B>8</B><BR>
<BR>
<strong>Please note:</strong> <BR>
<UL>
  <LI>Out of total 8 questions answered, <B>all 8 questions are used for scoring</B> </LI>
<!--     <LI><B>Questions Marked for Review :</B>Total Number of Questions Marked by you for Review: <B><%'=markedques%></B><BR>
    (Of the marked questions, <%'=markedquescorrect%> are answered correctly and <%'=(int(markedques)-int(markedquescorrect))%> are wrong) </LI>
  <LI><B>Questions Answered Correctly: <B><%'=correctans%></B><BR>
 <B>Percentage Questions Answered Correctly:</B> <%'=FormatNumber(correctans/0.8,2)%></B> % (i.e. <%'=correctans%> / 8 * 100 )
	
</LI>-->
</UL>

<a name="go"></a>


<%


			Set objRs = connObj.Execute("SELECT TestNo FROM CSIsample8Quesusertable WHERE TestNo = '"&TestNo&"' And KNo1 Is Null")
	 
			If (Not objRs.BOF) And (Not objRs.EOF) Then
			
				OverAllPercentage =correctans/8*100
 	
				Set objRs = connObj.Execute("Update CSIsample8Quesusertable SET EMail = '"&Session("PayerEmail")&"',OverAll = "&OverAllPercentage&" WHERE TestNo = '"&TestNo&"'")
				
'Sending exam result email to the user

	rqUserName = Session("FirstName") &" "& Session("LastName")

	strBody = "<table width=""80%"" border=""0"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;"">"
	strBody = strBody & "<tr><td width=""45px"">&nbsp;</td></tr>"
	strBody = strBody & "<tr><td><table width=""600"" border=""0""  style=""border:0px solid #CCCCCC"" align=""center"" cellpadding=""4"" cellspacing=""12"" bgcolor=""#FFFFFF"">"
	strBody = strBody & "<tr><td width=""595"" bgcolor=""#FFFFFF"">" 
	strBody= strBody & "<span><img src=""http://www.ITILstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" /></span>" 
	strBody= strBody &"</td></tr>"
	strBody = strBody & "<tr><td  colspan=""2"" width=""560px"">"
	strBody = strBody & "<table border=""0"" cellpadding=""6"" width=""580px"">"
	strBody = strBody & "<tr><td valign=""top""><font face=""Arial"" size=""2"">Dear "&Session("FirstName")&"&nbsp;"&Session("LastName")&",</font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">You have completed Understanding Simulated Practice Test (TestNo: "&TestNo&")</font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">Here is a summary of your test results : </font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">Total Number of Questions: 15</font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">Questions used for scoring: 15<br>Questions Answered Correctly: "&correctans&"<br>Percentage Questions Answered Correctly: "&FormatNumber(correctans/0.8,2)&" % (i.e. "&correctans&" / 8 * 100 )</font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">% Time Taken : "&Round((TimeTaken)/60,2)&" Minutes</font></td></tr>"
	
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">We hope you are enjoying your experience with ITILstudy.com. For next steps, please refer to http://www.ITILstudy.com/nextsteps.asp</font></td></tr>"
	strBody = strBody & "<tr><td>Help your friends succeed and get rewarded too! Its easy - just enter the email address and click on the button for ""Refer Friend"".</td></tr>"
	strBody = strBody & "<tr><td><form name=""referFriend"" action=""http://www.ITILstudy.com/insertReferFrnd.asp""  method=""post""><input type=""hidden"" name=""refEmailID"" value="&Session("PayerEmail")&"><input type=""hidden"" name=""refName"" value="&rqUserName&">Friend`s Email:  <input type=""text"" name=""frndEmailID1"">&nbsp; &nbsp; Name(optional):  <input type=""text"" name=""frndName1""><br /><br>  Friend`s Email:  <input type=""text"" name=""frndEmailID2"">  &nbsp; &nbsp; Name(optional):  <input type=""text"" name=""frndName2"">  <br /><br>  Friend`s Email:  <input type=""text"" name=""frndEmailID3""> &nbsp; &nbsp;  Name(optional):  <input type=""text"" name=""frndName3""><br /><br /><div align=""center""><input type=""submit"" value=""Refer Friend"" /><div></form></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">Best Regards,<br>Customer Support<br>www.ITILstudy.com<br>Email: adminsupport@ITILstudy.com</font></td></tr>"
	strBody = strBody & "</table></td></tr></table><tr><td width=""45px"">&nbsp;</td></tr></table>"
	
	'response.Write(strBody)
	
	'Dim objCDOMail
'
'	'Holds the CDONTS NewMail Object
'	'Create the e-mail server object
'	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'
'	'Who the e-mail is from
'	objCDOMail.From = "adminsupport@ITILstudy.com"
'
'	'Who the e-mail is sent to
'	objCDOMail.To = Session("PayerEmail")
'
'	'Who the CC are sent to
'	objCDOMail.Cc = "adminsupport@ITILstudy.com"
'
'	'Set the subject of the e-mail
'	objCDOMail.Subject = Session("FirstName") &" "& Session("LastName")&" : Exam Result Understanding Simulator"
'
'	'Set the e-mail body format (0=HTML 1=Text)
'	objCDOMail.BodyFormat = 0
'
'	'Set the mail format (0=MIME 1=Text)
'	objCDOMail.MailFormat = 0
'
'	'Set the main body of the e-mail
'	objCDOMail.Body = strBody
'
'	'Importance of the e-mail (0=Low, 1=Normal, 2=High)
'	objCDOMail.Importance = 2
'
'	'Send the e-mail
'	objCDOMail.Send
'
'	'Close the server object
'	Set objCDOMail = Nothing

End If

Set objRs = Nothing
connObj.Close
Set connObj = Nothing
%>

</P>
</font>

<p align="right"><font size="3"><A href="/nextsteps.asp">Test Analysis and Next Steps</A></font></p>
<script type="text/javascript" src="/js/refer_validation.js"></script>
</body>
</html>