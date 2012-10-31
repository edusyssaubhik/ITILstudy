<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ITILstudy</title>
</head>
<body>
<!--#include virtual="/includes/connection.asp"-->
<%

Server.ScriptTimeout = 100000

x = 1
e = 1
m = 1

Set rsQues = Server.CreateObject("ADODB.Recordset")
Set fsoObject=Server.CreateObject ("Scripting.FileSystemObject")

'Connection String
 
'ConnObj.Open "PROVIDER=SQLOLEDB;DATA SOURCE=db.winwinhosting.com;UID=pmstudy;PWD=HSH8s58DXCL8ScsW;DATABASE=pmstudy"

'Truncating correctans table of all simulators in order to avoid duplicate correctanswers.

ConnObj.Execute ("truncate table Sim15QuesCorrectAns")



'For i = 1 to 900

For i = 1 to 580

'==================================================================================================================================================================
'Fifth SIM
	

		If e <= 15 Then
		
	
		
			strQuery = "SELECT Question_sim15DB.QuestionDesc, Question_sim15DB.CorrectChoice, Question_sim15DB.Justification, Question_sim15DB.ExhibitURL ,Choice_sim15DB.ChoiceNumber,  Choice_sim15DB.ChoiceValue FROM Question_sim15DB, Choice_sim15DB WHERE Question_sim15DB.QuestionNo = '"& m &"' AND  Choice_sim15DB.QuestionNo = '"& m &"' ORDER BY Question_sim15DB.QuestionNo, Choice_sim15DB.ChoiceNumber"
				m = m + 1
			
			Response.Write(strQuery & "<br>")
			
			rsQues.Open strQuery,connObj
			
			If (Not rsQues.BOF) AND (Not rsQues.EOF) Then
			
				Do While Not rsQues.EOF
				
					Ques = rsQues("QuestionDesc")
					Justification = rsQues("Justification")
					CorrectChoice = rsques("CorrectChoice")	
					'Kno = rsques("KNo")							
	
					ChoiceNumber1=rsQues("ChoiceNumber")
					ChoiceValue1=rsQues("ChoiceValue")
					rsQues.MoveNext
					
					ChoiceNumber2=rsQues("ChoiceNumber")
					ChoiceValue2=rsQues("ChoiceValue")
					rsQues.MoveNext
					
					ChoiceNumber3=rsQues("ChoiceNumber")
					ChoiceValue3=rsQues("ChoiceValue")
					rsQues.MoveNext
					
					ChoiceNumber4=rsQues("ChoiceNumber")
					ChoiceValue4=rsQues("ChoiceValue")
					
					rsQues.MoveNext
					Loop
					
					ConnObj.Execute "INSERT INTO Sim15QuesCorrectAns(QuesNo, Ans) VALUES ('"&e&"','"&CorrectChoice&"')"
		
					strEnding  = "<BR><BR><form method=""post"" action=""./index.asp""><div class=""overflowTest""><table width=""880"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td width=""10px""></td><td colspan=""2""><font face=""Arial,sans-serif"" size=""3"">"&Ques&"</font><BR><BR></td></tr><tr><td colspan=""3"">&nbsp;</td></tr>"

 
strEnding = strEnding & "<tr><td width="" "">&nbsp;</td><td width=""7%""><font face=""Arial,sans-serif"" size=""3"">1 &nbsp;&nbsp; <INPUT TYPE=""radio"" NAME=""SelectedChoice"" VALUE="&ChoiceNumber1&"></font></td><td><font face=""Arial,sans-serif"" size=""3"">"&ChoiceValue1&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strEnding = strEnding & "<tr><td width="" "">&nbsp;</td><td width="" ""><font face=""Arial,sans-serif"" size=""3"">2 &nbsp;&nbsp; <INPUT TYPE=""radio"" NAME=""SelectedChoice"" VALUE="&ChoiceNumber2&"></font></td><td><font face=""Arial,sans-serif"" size=""3""> "&ChoiceValue2&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strEnding = strEnding & "<tr><td width="" "">&nbsp;</td><td width="" ""><font face=""Arial,sans-serif"" size=""3"">3 &nbsp;&nbsp; <INPUT TYPE=""radio"" NAME=""SelectedChoice"" VALUE="&ChoiceNumber3&"></font></td><td><font face=""Arial,sans-serif"" size=""3""> "&ChoiceValue3&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strEnding = strEnding & "<tr><td width="" "">&nbsp;</td><td width="" ""><font face=""Arial,sans-serif"" size=""3"">4 &nbsp;&nbsp; <INPUT TYPE=""radio"" NAME=""SelectedChoice"" VALUE="&ChoiceNumber4&"></font></td><td><font face=""Arial,sans-serif"" size=""3"">"&ChoiceValue4&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"
					

						'Set tsObject = fsoObject.CreateTextFile("C:\ITILstudy\Free15Ques\sim15Ques\"&e&".asp")
						Set tsoObject = fsoObject.CreateTextFile("E:\vhosts\ITILstudy.com\httpdocs\ITILsim\sim15Ques\"&e&".asp")
					
					tsObject.Write strEnding
					tsObject.Write strEnding1
					tsObject.Write strEnding2
					tsObject.Write strEnding3
					tsObject.Write strEnding4
					tsObject.Write strEnding5
					tsObject.Write strEnding6
										
%>
sim15Ques: <% = e %>.asp created<BR>
<%		

					strJust  = "<BR><BR><table width=""880"" border=""0"" cellspacing=""0"" cellpadding=""0"">"

strJust = strJust & "<tr><td width=""10px""></td><td colspan=""2""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Question No : "&CountofSim15Ques&"</font><BR><BR></td></tr>"

strJust = strJust & "<tr><td width=""10px""></td><td colspan=""2""><font face=""Arial,sans-serif"" size=""3"">"&Ques&"</font><BR><BR></td></tr><tr><td colspan=""3"">&nbsp;</td></tr>"
 
strJust = strJust & "<tr><td width="" "">&nbsp;</td><td width=""7%""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Choice 1 </font></td><td><font face=""Arial,sans-serif"" size=""3"">"&ChoiceValue1&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strJust = strJust & "<tr><td width="" "">&nbsp;</td><td width="" ""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Choice 2 </font></td><td><font face=""Arial,sans-serif"" size=""3""> "&ChoiceValue2&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strJust = strJust & "<tr><td width="" "">&nbsp;</td><td width="" ""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Choice 3 </font></td><td><font face=""Arial,sans-serif"" size=""3""> "&ChoiceValue3&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strJust = strJust & "<tr><td width="" "">&nbsp;</td><td width="" ""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Choice 4 </font></td><td><font face=""Arial,sans-serif"" size=""3"">"&ChoiceValue4&"</font></td></tr>"

strJust = strJust & "<td colspan=""3"">&nbsp;</td></tr><tr><td>&nbsp;</td</tr><tr><td width="" "">&nbsp;</td><td width="" "" colspan=""2""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Correct Choice : "&CorrectChoice&"</font></td> </tr><tr><td colspan=""3"">&nbsp;</td></tr>"

strJust = strJust & "<tr><td width=""10px""></td><td colspan=""2""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Justification : </font><BR><BR></td></tr>"

strJust = strJust & "<tr><td width="" "">&nbsp;</td><td valign=""top"" colspan=""2""><font face=""Arial,sans-serif"" size=""3"">"&Justification&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"
					
					

						'Set tsObject = fsoObject.CreateTextFile("C:\ITILstudy\Free15Ques\sim15Ques\"&e&"ans.asp")
						Set tsoObject = fsoObject.CreateTextFile("E:\vhosts\ITILstudy.com\httpdocs\ITILsim\sim15Ques\"&e&"ans.asp")
					
					tsObject.Write strJust
					tsObject.Write strJust1
					tsObject.Write strJust2
					tsObject.Write strJust3
					tsObject.Write strJust4
					tsObject.Write strJust5
					tsObject.Write strJust6
%>
sim15Ques: <%= e %>ans.asp created<BR>
		
<%
		e = e + 1
				
 		End If

		rsQues.Close					
		
	End If
	
		
	Next
	
	

	%>
</body>
</html>