<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerbanner.html"-->
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

Set rsQues = Server.CreateObject("ADODB.Recordset")

'Store The Test Number And SimNo In Session Variables'
Session("TestNo") = TestNo

'If Test Number Is Nothing Then If Statement Executes'
'Increments Test Number'

If  TestNo = "" Then
	
	'Insert The User Details Into User Table Based Simulator
	ConnObj.Execute "INSERT INTO Sim15Quesusertable(EMail, LastName, FirstName) VALUES ('"&PayerEmail&"', '"&LastName&"','"&FirstName&"')"	
	
	Set rsQues = Server.CreateObject("ADODB.Recordset")
	rsQues.ActiveConnection = connObj
	
	'Retrive The Maximum Test Number Based On Email ID'
	rsQues.Open "SELECT TestNo from Sim15Quesusertable WHERE EMail='"&PayerEmail&"' order by TestNo Desc"
	
	'store The TEst Number In Session Variable'
	Session("TestNo") = rsQues("TestNo")
	TestNo = Session("TestNo")
	
	'Assign The Question Number To Zero'
	Session("QuesNo") = 0
	Session("TimeTaken") = ""
			 
	Set rsQues=Nothing
	
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
					</B></font> - please write this down somewhere...<BR><BR>
					
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