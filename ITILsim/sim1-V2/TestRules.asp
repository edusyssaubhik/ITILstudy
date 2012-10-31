<!--#include virtual = "/includes/header.asp"-->
<!--#include virtual = "/includes/innerbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->

<!-- Body Starts -->

<%
'Declare The Local Variable'
Dim FirstName,LastName,DateValid
Dim TestNo,SimNo


'Retrive The Data From practiceTestsIndex.asp Page'
LastName   =  Session("LastName")
FirstName  =  Session("FirstName")
PayerEmail =  Session("PayerEmail")
DateValid  =  CDate(Session("DateValid"))
TestNo     =  Request.Form("TestNo")

'Creating the record set'
Set rsQues = Server.CreateObject("ADODB.Recordset")

'Store The Test Number And SimNo In Session Variables'
Session("TestNo") = TestNo

'If Test Number Is Nothing Then If Statement Executes'
'Increments Test Number'
If  TestNo = "" Then
	
	'Insert The User Details Into User Table Based Simulator
	ConnObj.Execute "INSERT INTO FoundV2_Sim1Users(EMail, LastName, FirstName) VALUES ('"&PayerEmail&"', '"&LastName&"','"&FirstName&"')"	
	
	
	
	Set rsQues = Server.CreateObject("ADODB.Recordset")
	rsQues.ActiveConnection = connObj
	
	
	'Retrive The Maximum Test Number Based On Email ID'
	rsQues.Open "SELECT TestNo from FoundV2_Sim1Users WHERE EMail='"&PayerEmail&"' order by TestNo Desc"
	
	
	'store The TEst Number In Session Variable'
	Session("TestNo") = rsQues("TestNo")
	TestNo = Session("TestNo")
	
	
	'Assign The Question Number To Zero'
	Session("QuesNo") = 0
	
	
	Set rsQues=Nothing
	
	'If Test Number Is Something Then Else Part Will Be Execute'
'Retrive The Maximum Question Number, Selected Choice And Marked Of That Test'
Else


		    'Retrive The Maximum Question Number'
			'This Else Part Is For Continue Test'
			'Retrive The Maximum Question Number Increment & Display That Question Continue The Test'
				Set objRs = connObj.Execute("SELECT Max(QuesNo) as QuesNo FROM FoundV2_Sim1TestResponse WHERE Duration <> '' And TestNo = '"& Session("TestNo") &"'")
				
				
				Do Until ObjRs.EOF
		
		'Retrive The Maximum Question Number'
		 maxQuesNo = objRs("QuesNo") 

		'Increment The Question Number Not Equal to 75'
		'If Question Number Is Equal to 75 No Increment'
		'IC : In Complete'
		If maxQuesNo = 40 Then
			Session("ICQuesNo") = maxQuesNo
		ElseIf IsNull(maxQuesNo) Then
			Session("ICQuesNo") = 1
		Else
			Session("ICQuesNo") = maxQuesNo + 1
		End If
		
	objRs.Movenext
	Loop
	objRs.Close
 
	'If Maximum Question Number Is Something Store That Value In Session Variable'
	'Else Assign The Zero In Session Varaible'
	If maxQuesNo <> "" Then
	
		Session("QuesNo") = maxQuesNo
		Session("TimeTaken") = "TimeTaken"
		
	Else
	
		Session("QuesNo") = 1
		Session("TimeTaken") = ""
		
		'First Time User Cliked Begin Test But He Didn't Write The Exam After User Came and Continue The Test With That Test Number That's Why We Are Creating 200 Rows Response Table With Test Number'
		For i = 1 To 40
		
			ConnObj.Execute "INSERT INTO FoundV2_Sim1TestResponse(TestNo, QuesNo, SelectedChoice) VALUES ('"& TestNo &"','"& i &"','')"
			
		Next		
		
	End If
	
End If
%>
 
 
  <div>
  	<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="235" align="left" valign="top" bgcolor="#FFFFFF">
				<table width="100%" border="0" cellspacing="0" cellpadding="8">

                  <tr>
                    <td width="2%" class="Header">&nbsp;</td>
                    <td width="25%" class="PageTitle">&nbsp;</td>
                    <td width="73%" class="PageTitle">Test Rules</td>
                  </tr>
                  <tr>
					<!--#include virtual="/includes/innerLeftMenu.asp"-->
                    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
					<div style="margin-top:-12px;">
					<!-- Content Start From Here-->

						<div> 
					<span class="Header"><% = Session("FirstName") %>&nbsp;<% = Session("LastName") %></span>, your Test Number is <font color="Blue" face=Arial><B>
					<% = Session("TestNo") %>
					</B></font> - please write this down somewhere...<BR>
					<p>Please note that every question you answer is saved to a database. So, if for any reason your test session gets discontinued, or if you cannot complete the test, you can use this number to start from where you left off.</p>
					
					<span class="SubHeader">Please note : </span>
					<UL>
					 <LI>If you <B>continue with the test</B>,</LI>
						<UL>
						  <LI>Please click on "View All Answers" </B>. </LI>
						  <LI>In the next screen, click the <B>question number you would like
							to continue working on.</B>.</LI>
						</UL>					 
					  
					  <LI>If you <B> have completed the test and like to see your answers</B>,</LI>
						<UL>
						  <LI>Please click on "View All Answers"</B> </LI>
						  <LI>In the next screen, <B>click "Evaluate
							for Answers"</B></LI>
						</UL>
						<LI>To pass the ITIL Foundation exam, you have to get 26 out of 40 questions correct (i.e. Pass Percentage is 65%). </LI>
						
					</UL>
					<p>All The best !!!</p>
					
				  </div>
				  <div align="center">
				  <form method="post" action="test.asp" >
				    
                    <input type="submit" value="Please click here to continue" class="ButtonGeneral" style="width:200px;">
				  </form>
				  </div>
				</div>
			  </div>
			</div>


  <!-- Content End From Here-->
  </div>

					</td>
                    </tr>


                </table>
          </td>
		</tr>
	</table>
  </div>
  <!-- Body Ends -->
  
<!--#include virtual="/includes/connectionClose.asp"-->
<!--#include virtual="/includes/footer.html"-->