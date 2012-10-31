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
Dim kno1,kno2,kno3,kno4,kno5,kno6,kno7
Dim kno8,kno9,kno10,kno11,kno12,kno13,kno14,kno15,kno16,kno17,kno18,kno19,bgcolor

'Retrive The Test Number'	
If (Request.Form("TestNo")<>"") Then
	TestNo=Request.Form("TestNo")
Else
	TestNo=Session("TestNo")
End If

'Retrive The User Response Table'
Set objRs = ConnObj.Execute("SELECT  QuesNo, SelectedChoice, Marked, Duration from Sim40QuesResponse WHERE TestNo='"&TestNo&"' ORDER BY GID")

'Retrive The Correct Answer Table'
Set objRs1 = ConnObj.Execute("SELECT  QuesNo, Ans, KNo from Sim40QuesCorrectAns ORDER BY GID")


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
  <LI> <a href="#go1"><B>Summary Test Results</B></A> - Overall Scores and % Correct: If more than 26 questions answered correctly, then you are well-prepared for ITIL Foundation Certification Exams.<BR>
    <BR>
  </LI>
  <LI> <a href="#go"><B>Knowledge Area Results</B></A> - Scores in Different Knowledge Areas: Identifies which Knowledge Areas require more study.<BR>
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
	<td class="TableRowOdd" width="122"><div align="center"><B><a href="#go">Knowldedge Area No</A></B></div></td>
	<td class="TableRowOdd" width="100"><div align="center"><B>Time Taken<br>(In Min.)</B></div></td>
	<td class="TableRowOdd" width="100"><div align="center"><B>Justification</B></div></td>
</tr>
<% For tf1 = 0 to 39 %>
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
<% TimeTaken = (kno1time + kno2time + kno3time + kno4time + kno5time + kno6time) %>
<BR>
<a name="go1"></a>
<span class="Header">Summary of Results:</span> <br>
<br>
Total Number of Questions: <B>40</B><BR>
<BR>
<strong>Please note:</strong> <BR>
<UL>
  <LI>Out of total 40 questions answered, <B>all 40 questions are used for scoring</B> </LI>
  <LI><B>Questions Marked for Review :</B>Total Number of Questions Marked by you for Review: <B><%=markedques%></B><BR>
    (Of the marked questions, <%=markedquescorrect%> are answered correctly and <%=(int(markedques)-int(markedquescorrect))%> are wrong) </LI>
  <LI><B>Questions Answered Correctly: <B><%=correctans%></B><BR>
    <B>Percentage Questions Answered Correctly:</B> <%=FormatNumber(correctans/0.40,2)%></B> % (i.e. <%=correctans%> / 40 * 100 )</LI>
</UL>
<B>% Time Taken : </B><% = Round((TimeTaken)/60,2) %> Minutes (this is only the question answering time and does not include time spent in breaks or viewing all answers)<br><br>
<a name="go"></a>
<span class="Header">Percentage Scores in different Knowledge Areas:</span><BR>
<br>
<div style="padding-left:10px;">
  <table width = "78%" border="0" cellpadding="3" cellspacing="0" onMouseOut="javascript:highlightTableRowVersionA(0);" id="myTable0">
    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
      <td width="5%" class="TableRowOdd"><div align="">
        <B>Knowledge Area No</B></td>
      <td width="18%" class="TableRowOdd"><div align="">
        <B>Knowledge Area</B></td>
      <td width="5%" class="TableRowOdd"><div align="">
        <B>% Correct </B></td>
      <td width="5%" class="TableRowOdd"><div align="">
        <B>% Time Taken<BR>(In Min.) </B></td>
      <td width="5%" class="TableRowOdd"><div align="">
        <B>Average Time Taken<BR>(In Min.) </B></td>
	</tr>
    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
      <td class="TableRowEven"><div align="">1</div></td>
      <td class="TableRowEven"><div align="">Introduction (<%=kno1ques%> questions)</div></td>
      <td class="TableRowEven"><div align=""><%=int(kno1/kno1ques*100)%> %</div></td>
	  <td class="TableRowEven"><div align=""><% = Round((kno1time)/60,2) %></div></td>
	  <td class="TableRowEven"><div align=""><% = Round(((kno1time)/(60*kno1ques)),2) %></div></td>
    </tr>
    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
      <td class="TableRowOdd"><div align="">2</div></td>
      <td class="TableRowOdd"><div align="">Service Strategy(<%=kno2ques%> questions)</div></td>
      <td class="TableRowOdd"><div align=""><%=int(kno2/kno2ques*100)%> %</div></td>
	  <td class="TableRowOdd"><div align=""><% = Round((kno2time)/60,2) %></div></td>
	  <td class="TableRowOdd"><div align=""><% = Round(((kno2time)/(60*kno2ques)),2) %></div></td>
    </tr>
    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
      <td class="TableRowEven"><div align="">3</div></td>
      <td class="TableRowEven"><div align="">Service Design (<%=kno3ques%> questions)</div></td>
      <td class="TableRowEven"><div align=""><%=int(kno3/kno3ques*100)%> %</div></td>
	  <td class="TableRowEven"><div align=""><% = Round((kno3time)/60,2) %></div></td>
	  <td class="TableRowEven"><div align=""><% = Round(((kno3time)/(60*kno3ques)),2) %></div></td>
    </tr>
    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
      <td class="TableRowOdd"><div align="">4</div></td>
      <td class="TableRowOdd"><div align="">Service Transition (<%=kno4ques%> questions)</div></td>
      <td class="TableRowOdd"><div align=""><%=int(kno4/kno4ques*100)%> %</div></td>
	  <td class="TableRowOdd"><div align=""><% = Round((kno4time)/60,2) %></div></td>
	  <td class="TableRowOdd"><div align=""><% = Round(((kno4time)/(60*kno4ques)),2) %></div></td>
    </tr>
    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
      <td class="TableRowEven"><div align="">5</div></td>
      <td class="TableRowEven"><div align="">Service Operation (<%=kno5ques%> questions)</div></td>
      <td class="TableRowEven"><div align=""><%=int(kno5/kno5ques*100)%> %</div></td>
	  <td class="TableRowEven"><div align=""><% = Round((kno5time)/60,2) %></div></td>
	  <td class="TableRowEven"><div align=""><% = Round(((kno5time)/(60*kno5ques)),2) %></div></td>
    </tr>
    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
      <td class="TableRowOdd"><div align="">6</div></td>
      <td class="TableRowOdd"><div align="">Continual Service Improvement(<%=kno6ques%> questions)</div></td>
      <td class="TableRowOdd"><div align=""><%=int(kno6/kno6ques*100)%> %</div></td>
	  <td class="TableRowOdd"><div align=""><% = Round((kno6time)/60,2) %></div></td>
	  <td class="TableRowOdd"><div align=""><% = Round(((kno6time)/(60*kno6ques)),2) %></div></td>
    </tr>
   
      <td class="TableRowEven" colspan="5">&nbsp;</td>
    </tr>
  </table>
</div>
<%

	Set objRs = connObj.Execute("SELECT TestNo FROM Sim40QuesUserTable WHERE TestNo = '"&TestNo&"' AND KNo1 Is Null")
	
	If (Not objRs.BOF) AND (Not objRs.EOF) Then
	
	 	OverAllPercentage =correctans/6*100
 	
		Set objRs = connObj.Execute("Update  Sim40QuesUserTable SET EMail = '"&Session("PayerEmail")&"', KNo1 = "&int(kno1/kno1ques*100)&",KNo2 = "&int(kno2/kno2ques*100)&",KNo3 = "&int(kno3/kno3ques*100)&",KNo4 = "&int(kno4/kno4ques*100)&",KNo5 = "&int(kno5/kno5ques*100)&",KNo6 = "&int(kno6/kno6ques*100)&",OverAll = "&OverAllPercentage&" WHERE TestNo = '"&TestNo&"'")
		

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
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"" >You have completed the ITIL Foundation Mock Test (TestNo: "&TestNo&")</font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>Here is a summary of your test results:</b> </font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"" color=""#666666"">Total Number of Questions:</font> <font face=""Arial"" size=""2"" color="""">40</font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"" color=""#666666"">Questions used for scoring:</font> <font face=""Arial"" size=""2"" color="""">40</font><br><font face=""Arial"" size=""2"" color=""#666666"">Questions Answered Correctly:</font> <font face=""Arial"" size=""2"" color="""">"&correctans&"</font><br><font face=""Arial"" size=""2"" color=""#666666"">Percentage Questions Answered Correctly:</font> <font face=""Arial"" size=""2"" color="""">"&FormatNumber(correctans/0.4,2)&" % (i.e. "&correctans&" / 40 * 100 )</font><br><br></td></tr>"
	strBody = strBody & "<tr><td><span style=""font-family: Arial, Helvetica, sans-serif;font-size: 13px;color: #2F95D3;font-weight: bold;line-height: 18px;font-style: normal;padding-top: 5px;padding-bottom: 5px;"" >Percentage Scores In Different Knowledge Areas:</span></td></tr>"
	strBody = strBody & "<tr><td><table width=""100%"" border=""0"" style=""border:1px solid #CCCCCC"" cellspacing=""0"" cellpadding=""3"">"
	strBody = strBody & "<tr><td style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;"" width=""10%""><span style=""font-family: Arial, Helvetica, sans-serif;font-size: 13px;color: #666666;font-weight: bold;line-height: 18px;font-style: normal;padding-top: 5px;padding-bottom: 5px;"" >Knowledge Area No</span></td><td align=""center"" style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;"" width=""33%""><span style=""font-family: Arial, Helvetica, sans-serif;font-size: 13px;color: #666666;font-weight: bold;line-height: 18px;font-style: normal;padding-top: 5px;padding-bottom: 5px;"">Knowledge Area</span></td><td align=""center"" style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><span style=""font-family: Arial, Helvetica, sans-serif;font-size: 13px;color: #666666;font-weight: bold;line-height: 18px;font-style: normal;padding-top: 5px;padding-bottom: 5px;"" >% Correct </span></td><td align=""center"" style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><span style=""font-family: Arial, Helvetica, sans-serif;font-size: 13px;color: #666666;font-weight: bold;line-height: 18px;font-style: normal;padding-top: 5px;padding-bottom: 5px;"" >% Time Taken <BR>(In Min.) </span></td><td align=""center"" style=""border-bottom:1px solid #CCCCCC;""><span style=""font-family: Arial, Helvetica, sans-serif;font-size: 13px;color: #666666;font-weight: bold;line-height: 18px;font-style: normal;padding-top: 5px;padding-bottom: 5px;"">Average Time Taken<BR>(In Min.)</span></td></tr>"
	
	strBody = strBody & "<tr><td style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">1</font></td><td style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">Introduction ("&kno1ques&" questions)</font></td><td align=""center"" style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">"&int(kno1/kno1ques*100)&" % </font></td><td align=""center"" style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">"&Round((kno1time)/60,2)&" </font></td><td align=""center"" style="";border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">"&Round(((kno1time)/(60*kno1ques)),2)&" </font></td></tr>"
	
	strBody = strBody & "<tr><td style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">2</font></td><td style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">Service Strategy ("&kno2ques&" questions)</font></td><td align=""center"" style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">"&int(kno2/kno2ques*100)&" % </font></td><td align=""center"" style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">"&Round((kno2time)/60,2)&" </font></td><td align=""center"" style=""border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">"&Round(((kno2time)/(60*kno2ques)),2)&" </font></td></tr>"
	
	strBody = strBody & "<tr><td style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">3</font></td><td style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">Service Design ("&kno3ques&" questions)</font></td><td align=""center"" style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">"&int(kno3/kno3ques*100)&" % </font></td><td align=""center"" style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">"&Round((kno3time)/60,2)&" </font></td><td align=""center"" style=""border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">"&Round(((kno3time)/(60*kno3ques)),2)&" </font></td></tr>"
	
	strBody = strBody & "<tr><td style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">4</font></td><td style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">Service Transition("&kno4ques&" questions)</font></td><td align=""center"" style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">"&int(kno4/kno4ques*100)&" % </font></td><td align=""center"" style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">"&Round((kno4time)/60,2)&" </font></td><td align=""center"" style=""border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">"&Round(((kno4time)/(60*kno4ques)),2)&" </font></td></tr>"
	
	strBody = strBody & "<tr><td style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">5</font></td><td style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">Service Operation ("&kno5ques&" questions)</font></td><td align=""center"" style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">"&int(kno5/kno5ques*100)&" % </font></td><td align=""center"" style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">"&Round((kno5time)/60,2)&" </font></td><td align=""center"" style=""border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">"&Round(((kno5time)/(60*kno5ques)),2)&" </font></td></tr>"
	
	strBody = strBody & "<tr><td style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">6</font></td><td style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">Continual Service Improvement ("&kno6ques&" questions)</font></td><td align=""center"" style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">"&int(kno6/kno6ques*100)&" % </font></td><td align=""center"" style=""border-right:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">"&Round((kno6time)/60,2)&" </font></td><td align=""center"" style=""border-bottom:1px solid #CCCCCC;""><font face=""Arial"" size=""2"">"&Round(((kno6time)/(60*kno6ques)),2)&" </font></td></tr>"
		
	strBody = strBody & "</table></td></tr>"

	strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>% Time Taken:</b> "&Round((TimeTaken)/60,2)&" Minutes (this is only the question answering time and does not include time spent in breaks or viewing all answers).</font></td></tr>"
	strBody = strBody & "<tr><td><font face=""Arial"" size=""2"">If the student scored above 65%, ""We would like to congratulate you on doing well in the Mock Exam and hope that you would do better in the actual exam with ITILstudy."" ELSE,  ""We hope that the mock exam gave you a better understanding of the actual ITIL exam and recommend you to get back to the study guides of the chapters where you struggled in this exam""</span></td></tr>"
	
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