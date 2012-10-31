<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% If Session("PayerEmail") = "" Then %>
	<script type="text/javascript">top.location.href='/memberlogin.asp';</script>
<% Else %>
<!--#include virtual="/includes/connection.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ITILstudy</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<style type="text/css">
.viewAllGrey
{
	background-color:#F2F4F4;
}
</style>
<script type="text/javascript">
function redirect() {
	top.location.href='evaluate.asp';
}

function displaymessage() {
	var r=confirm("Are you sure you want to end this test? You will not be able to resume the test once you submit for evaluation.");
	
if (r==true) {
	redirect();
}
}
</script>
</head>
<body>
<%
'Declare The Local Variables'
Dim TestNo
Dim StartTime,EndTime
Dim Action

'Session Time Out'
Session.Timeout=500

'Retrive The Sim Nmber, Test Number And PayerEmail Through Session'
TestNo     = Session("TestNo")

Set fsoObject=Server.CreateObject ("Scripting.FileSystemObject")

'Function For Displaying Question Format'
Function Question()
 
  	Set tsoObject = fsoObject.OpenTextFile("E:\vhosts\ITILstudy.com\httpdocs\Free15Ques\sim15Ques\"&QuesNo&".asp")
	'Set tsoObject = fsoObject.OpenTextFile("c:\ITILstudy\Free15Ques\Sim15Ques\"&QuesNo&".asp")


	StrMain = tsoObject.ReadAll
	
	Response.Write strMain
 	 
	 
	strEnding = strEnding & "</table></div><div  style=""background-color:#000066;width:955px; height:27px;"" ><input type=""hidden"" name=""SelChoice"" value="""&SelChoice&"""><input type=""hidden"" Name=""Test"" value=""test""><table border=""0"" width=""60%"" cellpadding=""0"" cellspacing=""0"" style=""""><tr>"

	If QuesNo <> 1 Then
		strEnding = strEnding & "<td width=""150px"" style=""background-color:#000066;"">&nbsp;</td><td>&nbsp;</td><td width=""150px""><input type=""submit"" name=""Next"" class=""TestButton""  value=""Previous""/> </td><td>&nbsp;</td>"
	Else
		strEnding = strEnding & "<td width=""150px"" style=""background-color:#000066;"">&nbsp;</td><td>&nbsp;</td><td width=""150px"" style=""background-color:#000066;"" ><input type=""button"" name=""Next"" class=""TestButton1""  value=""."" /></td><td>&nbsp;</td>"
	End If

	If cint(QuesNo) <> 15 Then
 		strEnding = strEnding & "<td width=""150px""><input type=""submit"" name=""Next"" class=""TestButton""  value=""Next"" /> </td><td>&nbsp;</td>"
	Else
		strEnding = strEnding & "<td width=""150px"" style=""background-color:#000066;""><input type=""button"" name=""Next"" class=""TestButton1""  value=""."" /></td><td>&nbsp;</td>"
	End If
	
	If Marked <> "" Then
		strEnding = strEnding & "<td width=""150px""><input type=""hidden"" name=""Mark"" value=""Mark""><input type=""submit"" name=""Next"" class=""Marked"" value=""Marked"" /> </td><td>&nbsp;</td></tr></table>"
	Else
		strEnding = strEnding & "<td width=""150px""><input type=""submit"" name=""Next"" class=""TestButton""  value=""Mark"" /></td><td>&nbsp;</td></tr></table>"
	End If

	If ShowMarked = "Yes" Then
		strEnding = strEnding & "<input type=""hidden"" name=""ShowMarked"" value=""Yes""></div>"
	Elseif ShowSkipped = "Yes" Then
		strEnding = strEnding & "<input type=""hidden"" name=""ShowSkipped"" value=""Yes""></div>"
	End If
 
'If QuesNo = MaxQuesNo Then
	  strEnding = strEnding & "<div>&nbsp;</div><div  style=""background-color:#000066;width:955px; height:27px;"" ><table border=""0"" width="""" cellpadding=""0"" cellspacing=""0"" style=""padding-top:0px""><tr><td width=""110px"" style=""background-color:#000066"">&nbsp;</td><td>&nbsp;</td><td><input type=""submit"" name=""Next"" class=""TestButton""  value=""View All Answers""/></td><td>&nbsp;</td><td><input type=""submit"" name=""Next"" class=""TestButton""  value=""End Exam"" /></td><td>&nbsp;</td></tr></table>"
	  
'End If

strEnding = strEnding & "</div>"
	 
Response.Write(strEnding)	 

End Function
'End Function For Displaying Question Format'

'Function For Retrive The SelectedChoice, Mark And Updating The Values'
Function Updating()

	'Retriving The Questio Number And Test Number Through Sessions'
	QuesNo = Session("QuesNo")
	TestNo = Session("TestNo")
	
	'End Time Is Now'
	EndTime = Now()
	
	'Here We Caliculating The User Spent Time On Question'
	TimeTaken = DateDiff("s",Session("StartTime"),EndTime)
	
	'If First Time Attempt The Question If Part Will Be Execute'
	'Else Add Previous Time And Present Time'
	If IsNull(Session("Duration")) Then
		TotalDuration = TimeTaken 
	Else
		TotalDuration = TimeTaken + Session("Duration")
	End If
	
	If TotalDuration > 300 Then
	   TotalDuration = 300
	Else
	   TotalDuration = TotalDuration
	End If
	

		ConnObj.Execute "UPDATE Sim15QuesResponse SET SelectedChoice = '"&SelectedChoice&"', Marked = '"&Marked&"', Duration = '"&TotalDuration&"' WHERE TestNo='"&TestNo&"' AND QuesNo='"&QuesNo&"'"


End Function


'If User Clicks Go Button In View All Answer Page That Will Come Here'
If Request.Form("go") <> "" Then
	
	'Retriving Question Number'
	QuesNo = Request.Form("QuesNo")
	Session("QuesNo") = QuesNo
	TestNo = Session("TestNo")
	
 	Set objRs  = connObj.Execute("SELECT SelectedChoice,Marked FROM  Sim15QuesResponse WHERE TestNo = '" & TestNo & "' and QuesNo = '" & QuesNo &"'")

	Do Until objRs.EOF

		SelChoice = objRs("SelectedChoice")
		Marked = objRs("Marked")

	objRs.Movenext
	Loop
	objRs.Close    
%>
<% If Session("QuesNo") = 1 Then %>
<div class="Note" align="center"><blink><B>Question 1 is the First Question - please press <B>Next</B> to go to Question 2</B></blink></div>
<% ElseIf Session("QuesNo") = 15 Then %>
<div class="Note" align="center" ><blink><B>Question 15 is the Last Question - please press View All Answers to View all the Answers</B></blink></div>
<BR>
<% End If %>
<div style="padding-left:"><span class="Header"> Question No :<% = QuesNo %><br>
  Selected Choice :<% = SelChoice %></span></div>
<%
	 Session("StartTime") = Now()
	 
	 Call Question()
	
End If

'If Session("QuesNo") Is Zero Then Populate 15 Response Colomns Based On Test Number'
If Session("QuesNo") = 0 Then

	For i = 1 To 15
	
		ConnObj.Execute "INSERT INTO Sim15QuesResponse(TestNo, QuesNo, SelectedChoice) VALUES ('"&TestNo&"','"&i&"','')"
		
	Next
	
	'Assign Session Variable Question Number to 1'
	Session("QuesNo") = 1
	QuesNo = Session("QuesNo")
 
	Session("StartTime") = Now()
	
%>
<div style="padding-left:"><span class="Header"> Question No :<% = QuesNo %><br>
Selected Choice :<% = SelChoice %></span></div>
<%	
	Call Question()

Else


	'Retrive Action From User Next,Previous Or View All Answers'
	If Request.Form("Next") <> "" Then

		Action = Request.Form("Next")
		
	ElseIf Request.QueryString("Next") <> "" Then

		Action = Request.QueryString("Next")
		
	ElseIf Request.Form("go") = "" Then
	
	    Action = "Next"

	End If

	'Retriving The Maked And SelectedChoice'
	Marked = Request.Form("Mark")
	
	If Request.Form("SelectedChoice") <> "" Then
		SelectedChoice = Request.Form("SelectedChoice")
	Else
		SelectedChoice = Request.Form("SelChoice")
	End If

    'Begin Case
		Select Case Action
			
			'If User Clicks Previous That Will Come Here'
			Case "Previous"	
				
								
				'Calling The Updating Function'
				Call Updating()
				
				
				'If User Clicks Show Marked Or Show Skipped It Will Show One By One'
				ShowMarked = Request.Form("ShowMarked")
				ShowSkipped = Request.Form("ShowSkipped")
				
				'Response.Write("ShowMarked")
				
				'If User Clicks Show Marked Which Question User Put Mark, Show One By One'
				If ShowMarked = "Yes" Then

				'Retrive The User Maked Questions'
				Set objRs = connObj.Execute("SELECT QuesNo, Marked FROM Sim15QuesResponse WHERE TestNo = '" & TestNo & "' AND Marked = 'Mark' AND QuesNo < '" & Session("QuesNo") & "'  GROUP BY QuesNo,Marked ORDER BY QuesNo Desc")
			
					'If Marked Questions Are There If Will Be Execute'
					'Else It Will Redirect To View All Answers'
					If (Not objRs.BOF) And (Not objRs.EOF) Then
						QuesNo = objRs("QuesNo")
					ELse 
 						Response.Redirect("./index.asp?Next=View All Answers") 
					End If

					objRs.Close
					
 					Session("QuesNo") = QuesNo 
				
				'Retrive The User Skipped Questions'
				ElseIf ShowSkipped = "Yes" Then
				
				'Retrive The User Skipped Questions
 				Set objRs = connObj.Execute("SELECT QuesNo, SelectedChoice FROM Sim15QuesResponse WHERE TestNo = '" & TestNo & "' and SelectedChoice = '' and QuesNo < '" & Session("QuesNo") &"' GROUP BY QuesNo,SelectedChoice ORDER BY QuesNo Desc")
			
					'If Skipped Questions Are There If Will Be Execute'
					'Else It Will Redirect To View All Answers'
					If (Not objRs.BOF) And (Not objRs.EOF) Then
					
						QuesNo = objRs("QuesNo")
						
					Else
					
						Response.Redirect("./index.asp?Next=View All Answers") 
						
					End If

					Session("QuesNo") = QuesNo
				
				Else				
			
					Session("QuesNo") = Session("QuesNo") - 1
					QuesNo = Session("QuesNo")
				
				End if
					
					'Retrive The SelectedChoice, Marked, Duration Based On Question Number And Test Number'
					'And Display The Question'
					Set objRs = ConnObj.Execute("Select SelectedChoice, Marked, Duration from Sim15QuesResponse WHERE TestNo='"&TestNo&"' AND QuesNo='"&QuesNo&"'")
					
					Array1 = objRs.GetRows
					SelChoice = Array1(0,0)
					Marked = Array1(1,0)
					Session("Duration") = Array1(2,0)
					Set objRs = Nothing					
					%>
					<% If Session("QuesNo") = 1 Then %>
					<div class="Note" align="center"><blink><B>Question 1 is the First Question - please press <B>Next</B> to go to Question 2</B></blink></div>
					<% End If %>
					<div style="padding-left:"><span class="Header"> Question No :<% = QuesNo %><br>
  					Selected Choice :<% = SelChoice %></span></div>
					<%

					Session("StartTime") = Now()
				
					Call Question()
			
			'If User Selects Next Button That Will Come Here'
			Case "Next"
				
				 'If Page Refresh In The 15th Question That Question Number Should Not Increment '
			     If Session("QuesNo") >= 14 Then
				 
				 	Session("QuesNo") = 14
				
				 End If

					'Calling The Update Function'
					Call Updating()

					'If User Clicks Show Marked Or Show Skipped It Will Show One By One'
					ShowMarked = Request.Form("ShowMarked")
					ShowSkipped = Request.Form("ShowSkipped")
					
					'Response.Write(ShowMarked)
				    'If User Clicks Show Marked Which Question User Put Mark, Show One By One'
					If ShowMarked = "Yes" Then
						
						
						'Retrive The User Maked Questions'
						Set objRs = connObj.Execute("SELECT QuesNo, Marked FROM Sim15QuesResponse WHERE TestNo = '" & TestNo & "' AND Marked = 'Mark' AND QuesNo > '" & Session("QuesNo") & "'  GROUP BY QuesNo,Marked ORDER BY QuesNo")
				
				        'If Marked Questions Are There If Will Be Execute'
						'Else It Will Redirect To View All Answers'
						If (Not objRs.BOF) And (Not objRs.EOF) Then
							QuesNo = objRs("QuesNo")
						ELse 
							Response.Redirect("./index.asp?Next=View All Answers") 
						End If
				
						objRs.Close
				
						Session("QuesNo") = QuesNo

					'If User Clicks Show Skipped Which Question User Not Answered, Show One By One'
					ElseIf ShowSkipped = "Yes" Then
				
				    	'Retrive The User Skipped Questions'
						Set objRs = connObj.Execute("SELECT QuesNo, SelectedChoice FROM Sim15QuesResponse WHERE TestNo = '" & TestNo & "' and SelectedChoice = '' and QuesNo > '" & Session("QuesNo") &"' GROUP BY QuesNo,SelectedChoice ORDER BY QuesNo")
				
						'If USer Skipped Questions Or Not Answered Questions Are There If Will Be Execute'
						'Else It Will Redirect To View All Answers'
						If (Not objRs.BOF) And (Not objRs.EOF) Then
				
							QuesNo = objRs("QuesNo")
					
						'ELseIf QuesNo < MaxQuesNo Then
				
							'QuesNo = QuesNo + 1
					
						Else
				
						Response.Redirect("./index.asp?Next=View All Answers") 
					
						End If
				
						Session("QuesNo") = QuesNo
				
					Else				
				
						Session("QuesNo") = Session("QuesNo") + 1
						QuesNo = Session("QuesNo")
				
					End if
					
					'Retrive The SelectedChoice, Marked, Duration Based On Question Number And Test Number'
					'And Display The Question'
					Set objRs = ConnObj.Execute("Select SelectedChoice, Marked, Duration from Sim15QuesResponse WHERE TestNo='"&TestNo&"' AND QuesNo='"&QuesNo&"'")
					
					Array1 = objRs.GetRows
					SelChoice = Array1(0,0)
					Marked = Array1(1,0)
					Session("Duration") = Array1(2,0)
					'Response.Write(Session("Duration"))
					
					Set objRs= Nothing						
					%>
					<% If Session("QuesNo") = 15 Then %>
					<div class="Note" align="center" ><blink><B>Question 15 is the Last Question - please press View All Answers to View all the Answers</B></blink></div>
					<% End If %>
					<div style="padding-left:"><span class="Header"> Question No :<% = QuesNo %><br>
					Selected Choice :<% = SelChoice %></span></div>
					<%
					
				Session("StartTime") = Now()
			
		    	Call Question()
			
			'Case Mark'
			'User Clicks Mark In The Exam That Will Come Here'
			Case "Mark"
				
				QuesNo = Session("QuesNo")
				TestNo = Session("TestNo")
				Marked = "Mark"

				'If User Clicks Show Marked Or Show Skipped It Will Show One By One'
				ShowSkipped = Request.Form("ShowSkipped")								
								
				If (SelectedChoice = "" And Marked = "") Then
				Else
				
					ConnObj.Execute "UPDATE Sim15QuesResponse SET SelectedChoice = '"&SelectedChoice&"', Marked = '"&Marked&"' WHERE TestNo='"&TestNo&"' AND QuesNo='"&QuesNo&"'"
					
		
				End If
				
				QuesNo = Session("QuesNo")
				
				'Retrive The SelectedChoice, Marked, Duration Based On Question Number And Test Number'
				'And Display The Question'
				Set objRs = ConnObj.Execute("Select SelectedChoice, Marked from Sim15QuesResponse WHERE TestNo='"&TestNo&"' AND QuesNo='"&QuesNo&"'")
				
				Array1 = objRs.GetRows
				SelChoice = Array1(0,0)
				Marked = Array1(1,0)
				%>
				<div style="padding-left:"><span class="Header"> Question No :<% = QuesNo %><br>
  				Selected Choice :<% = Array1(0,0) %></span></div>
				<%
				Set objRs = Nothing
					
				'Calling Question Function'
			 	Call Question()
				
			'Case Marked'
			'User Clicks Marked In The Exam That Will Come Here'
			Case "Marked"
				
				QuesNo = Session("QuesNo")
				TestNo = Session("TestNo")
				Marked = ""
				
				'If User Clicks Show Marked Or Show Skipped It Will Show One By One'
				ShowMarked = Request.Form("ShowMarked")
				ShowSkipped = Request.Form("ShowSkipped")
				
				ConnObj.Execute "UPDATE Sim15QuesResponse SET SelectedChoice = '"&SelectedChoice&"', Marked = '"&Marked&"' WHERE TestNo='"&TestNo&"' AND QuesNo='"&QuesNo&"'"

			
				QuesNo = Session("QuesNo")

				'Retrive The SelectedChoice, Marked, Duration Based On Question Number And Test Number'
				'And Display The Question'
				Set objRs = ConnObj.Execute("Select SelectedChoice, Marked from Sim15QuesResponse WHERE TestNo='"&TestNo&"' AND QuesNo='"&QuesNo&"'")
				
				Array1 = objRs.GetRows
				SelChoice = Array1(0,0)
				Marked = Array1(1,0)
				%>
				<div style="padding-left:"><span class="Header"> Question No :<% = QuesNo %><br>
  				Selected Choice :<% = Array1(0,0) %></span></div>
				<%
				Set objRs = Nothing
					
				'Calling Question Function'
			 	Call Question()
				

			'Case Show Marked'
			'User Clicks Show Marked In The Exam That Will Come Here'			
			Case "Show Marked"
				
				'User Clicked On Show Marked Question We Will Show One By One'
				'Else Show View All Answers'
				Set objRs = connObj.Execute("SELECT TOP 1 QuesNo,SelectedChoice,Marked FROM Sim15QuesResponse WHERE TestNo = '" & TestNo & "' AND Marked = 'mark' GROUP BY QuesNo,selectedChoice,Marked ORDER BY QuesNo")

				If (not objRs.BOF) And (not objRs.EOF) Then
					
					QuesNo = objRs("QuesNo")
					SelChoice = objRs("SelectedChoice")
 					Marked = objRs("Marked")
					
				Else
					Session("message") = "No Marked Questions"
					Response.Redirect("./index.asp?Next=View All Answers")
				End If
				objRs.Close
  			
			 Session("QuesNo") = QuesNo	
			 ShowMarked = "Yes"
			
			%>
			<div style="padding-left:"><span class="Header"> Question No :<% = QuesNo %><br>
  			Selected Choice :<% = SelChoice %></span></div>
			<%

			 'Calling Question Function'
			 Call Question()

			'Case Show Skipped'
			'User Clicks Show Skipped In The Exam That Will Come Here'			 
			Case "Show Skipped"
				
				'User Clicked On Show Skipped Question We Will Show One By One'
				'Else Show View All Answers'
				Set objRs = connObj.Execute("SELECT TOP 1 QuesNo FROM Sim15QuesResponse WHERE TestNo = '" & TestNo & "' and selectedChoice = ''  GROUP BY QuesNo ORDER BY QuesNo")

				If ((not objRs.BOF) And (not objRs.EOF)) Then
					
					QuesNo = objRs("QuesNo")
 				Else
 					Session("message") = "No Skipped Questions"
					Response.Redirect("./index.asp?Next=View All Answers")
				End If
				objRs.Close
				
 			
			 	Session("QuesNo") = QuesNo	
			 	ShowSkipped = "Yes"

			%>
			<div style="padding-left:"><span class="Header"> Question No :<% = QuesNo %><br>
  			Selected Choice :<% '= Array1(0,0) %></span></div>
			<%
			'Calling Question Function'
			Call Question()

		'Case End Exam'
		'User Clicks End Exam In The Exam That Will Come Here'
		'Show All The Evalte Page'
		Case "End Exam"
				
				Call Updating()		
				
				Response.Write("<script type=""text/javascript"">var r=confirm(""Are you sure you want to end this test? You will not be able to resume the test once you submit for evaluation.""); if (r==true) {top.location.href='evaluate.asp';}</script>")
				
				
				QuesNo = Session("QuesNo")
			
				'Retrive The SelectedChoice, Marked, Duration Based On Question Number And Test Number'
				'And Display The Question'
				Set objRs = ConnObj.Execute("Select SelectedChoice, Marked from Sim15QuesResponse WHERE TestNo='"&TestNo&"' AND QuesNo='"&QuesNo&"'")
				
				Array1 = objRs.GetRows
				SelChoice = Array1(0,0)
				Marked = Array1(1,0)
				%>
				<div style="padding-left:"><span class="Header"> Question No :<% = QuesNo %><br>
  				Selected Choice :<% = Array1(0,0) %></span></div>
				<%
				Set objRs = Nothing
					
				'Calling Question Function'
			 	Call Question()

							
		'Case View All Answers'
		'User Clicks View All Answers In The Exam That Will Come Here'
		'Show All The Answers'
		Case "View All Answers"
				
				If Request.QueryString("Next") <> "View All Answers" Then
					Call Updating()		
			    End If		

				Set objRs = ConnObj.Execute("SELECT  QuesNo, SelectedChoice, Marked  from Sim15QuesResponse WHERE TestNo='"&TestNo&"' ORDER BY GID")
				Array1 = objRs.GetRows
				
			
%>
<%
	message = Session("message")
	Session("message") = ""
%>
<% If message <> "" Then %>
<table width="100%" align="center">
  <tr>
    <td><font color="red" size="2">
      <% = message %>
      </font></td>
  </tr>
</table>
<br />
<% End If %>
<table width="800" border="0" align="left" cellspacing="0" cellpadding="0">
 <tr>
   <td valign="middle" >
     <div style="background-color:#000066;width:100%; height:27px;">
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
		  <td width="150px" style="background-color:#000066;">&nbsp;</td><td>&nbsp;</td>
		  <td>
		     <input type="hidden" Name="Test" value="test">
			 <input name="Submit" type="Button" class="TestButton" value="End Exam" onclick=displaymessage()>
		  </td>
		  <form method="Post" action="./index.asp">
			<td>&nbsp;</td>
			<td><input type="submit" name="Next" class="TestButton" value="Show Marked" /></td>
			<td>&nbsp;</td>
			<td><input type="submit" name="Next" class="TestButton" value="Show Skipped" /></td>
			<td>&nbsp;</td>
		  </form>
	    </tr>
	 </table>
    </div>
  </td>
 </tr>
 <tr>
    <td>&nbsp;</td>
 </tr>
</table>
</form>
<br />
<br />
<br />
<div align="" class="overflowEvaluation">
<%
i=0
j=0
iCount = 0
for tf1=0 to 3
%>
<table width = "801px" border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <%for tf2=0 to 3 %>
	<form method="post" action="./index.asp">
	<% 
	   'Displaying Only ODD Color'
	   If Eval(iCount\2 = iCount/2) Then 
	%>
      <td width="25%" class="TableRowOdd" align="center"><% Else %>
      <td width="25%" class="TableRowEven" align="center"><% End If %>
 		
          <div style="border:1px #cccccc solid; ">
          <% If i < 15 Then %>
            <table border="0" cellspacing="0" cellpadding="3">
              <tr>
			  
                <% 'Displaying Only ODD Color'
					If Eval(iCount\2 = iCount/2) Then 
				%>
				
                <td class="viewAllGrey"  width="25%"  ><% Else %>
                <td width="30%" ><% End If %>		
 				 <input type="submit" name="go" value="Q : <% = Array1(j,i)%>" style="width:60px;">
				 <input type="hidden" name="QuesNo" value="<% = Array1(j,i)%>"></td>
				 
				<% 'Displaying Only ODD Color'
					If Eval(iCount\2 = iCount/2) Then 
				%>
				
                <td class="viewAllGrey" align="center"  width="25%"  ><% Else %>
                <td width="25%" align="center"><% End If %><div align="center"><span class="Header">
					<%j=j+1%>
					<%=Array1(j,i)%></span></div></td>
					
				<% 'Displaying Only ODD Color'
					If Eval(iCount\2 = iCount/2) Then 
				%>
				
                <td class="viewAllGrey"   width="25%"  ><% Else %>
                <td width="25%" ><% End If %><%j=j+1%>
					<span class="Note"><%If Array1(j,i) <> "" Then %>Marked<% End If %></span></td>
					
					<input type="hidden" Name="Test" value="test">
					<!--<input type="submit" value="Go">-->
					
					<%j=0
					  i=i+1%>
				</td>
			</tr>
		</table>
        <% End If %>
        </div>
      </td></form>
  <% Next %>
 </tr>
</table>
<%
iCount = iCount + 1 
Next %>
<br />
<table width="800" border="0" align="left" cellspacing="0" cellpadding="0">
    <tr>
      <td valign="middle" ><div style="background-color:#000066;width:100%; height:27px;">
          <table border="0" cellspacing="0" cellpadding="0">
            <tr>
			  <td width="150px" style="background-color:#000066;">&nbsp;</td><td>&nbsp;</td>
              <td><input type="hidden" Name="Test" value="test">
                <input name="Submit" type="Button" class="TestButton" value="End Exam" onclick=displaymessage()>
              </td>
              <form method="Post" action="./index.asp">
                <td>&nbsp;</td>
                <td><input type="submit" name="Next" class="TestButton" value="Show Marked" /></td>
                <td>&nbsp;</td>
				<td><input type="submit" name="Next" class="TestButton" value="Show Skipped" /></td>
				<td>&nbsp;</td>
              </form>
            </tr>
          </table>
       </div></td>
   </tr>
</table>
</form>
</div>
<%
	End Select
	
  End If

End If 
%>
</body>
</html>