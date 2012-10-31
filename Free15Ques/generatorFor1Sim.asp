<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PROJstudy</title>
</head>
<body>
<!--#include virtual="/includes/connection.asp"-->
<%

Server.ScriptTimeout = 100000

x = 1
y = 1
a = 1
b = 1
c = 1
d = 1
e = 1
f = 1
g = 1
m = 1

Set rsQues = Server.CreateObject("ADODB.Recordset")
Set fsoObject=Server.CreateObject ("Scripting.FileSystemObject")

'Connection String
 
'ConnObj.Open "PROVIDER=SQLOLEDB;DATA SOURCE=db.winwinhosting.com;UID=pmstudy;PWD=HSH8s58DXCL8ScsW;DATABASE=pmstudy"

'Truncating correctans table of all simulators in order to avoid duplicate correctanswers.
ConnObj.Execute ("truncate table Sim1CorrectAns")


'For i = 1 to 900

For i = 1 to 580

'First PHR'
	
	For j = 1 to 19
		
		If a <= 75 Then
		
	    	If j = 3 Then
		
			strQuery = "SELECT QuestionDb.QuestionDesc, QuestionDb.CorrectChoice, QuestionDb.Justification, QuestionDb.ExhibitURL ,ChoiceDb.ChoiceNumber, QuestionDb.KNo, ChoiceDb.ChoiceValue FROM QuestionDb, ChoiceDb WHERE  QuestionDb.QuestionNo = '"& m &"' AND QuestionDb.KNo = '"& j &"' AND  ChoiceDb.QuestionNo = '"& m &"' AND ChoiceDb.KNo = '"& j &"' ORDER BY QuestionDb.QuestionNo, ChoiceDb.KNo, ChoiceDb.ChoiceNumber"
			
			
			m = m + 2
			
			Else
			
			strQuery = "SELECT QuestionDb.QuestionDesc, QuestionDb.CorrectChoice, QuestionDb.Justification, QuestionDb.ExhibitURL ,ChoiceDb.ChoiceNumber, QuestionDb.KNo, ChoiceDb.ChoiceValue FROM QuestionDb, ChoiceDb WHERE QuestionDb.QuestionNo = '"& x &"' AND QuestionDb.KNo = '"& j &"' AND  ChoiceDb.QuestionNo = '"& x &"' AND ChoiceDb.KNo = '"& j &"' ORDER BY QuestionDb.QuestionNo, ChoiceDb.KNo, ChoiceDb.ChoiceNumber"
			
			End If
			
			Response.Write(strQuery & "<br>")
			
			rsQues.Open strQuery,connObj
			
			If (Not rsQues.BOF) AND (Not rsQues.EOF) Then 
			
				Do While Not rsQues.EOF
				
					Ques = rsQues("QuestionDesc")
					Justification = rsQues("Justification")
					CorrectChoice = rsques("CorrectChoice")	
					Kno = rsques("KNo")							
	
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
					
					ConnObj.Execute "INSERT INTO Sim1CorrectAns(QuesNo,Kno, Ans) VALUES ('"&a&"','"&Kno&"','"&CorrectChoice&"')"
		
					strEnding  = "<BR><BR><form method=""post"" action=""./index.asp""><div class=""overflowTest""><table width=""880"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td width=""10px""></td><td colspan=""2""><font face=""Arial,sans-serif"" size=""3"">"&Ques&"</font><BR><BR></td></tr><tr><td colspan=""3"">&nbsp;</td></tr>"

 
strEnding = strEnding & "<tr><td width="" "">&nbsp;</td><td width=""7%""><font face=""Arial,sans-serif"" size=""3"">1 &nbsp;&nbsp; <INPUT TYPE=""radio"" NAME=""SelectedChoice"" VALUE="&ChoiceNumber1&"></font></td><td><font face=""Arial,sans-serif"" size=""3"">"&ChoiceValue1&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strEnding = strEnding & "<tr><td width="" "">&nbsp;</td><td width="" ""><font face=""Arial,sans-serif"" size=""3"">2 &nbsp;&nbsp; <INPUT TYPE=""radio"" NAME=""SelectedChoice"" VALUE="&ChoiceNumber2&"></font></td><td><font face=""Arial,sans-serif"" size=""3""> "&ChoiceValue2&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strEnding = strEnding & "<tr><td width="" "">&nbsp;</td><td width="" ""><font face=""Arial,sans-serif"" size=""3"">3 &nbsp;&nbsp; <INPUT TYPE=""radio"" NAME=""SelectedChoice"" VALUE="&ChoiceNumber3&"></font></td><td><font face=""Arial,sans-serif"" size=""3""> "&ChoiceValue3&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strEnding = strEnding & "<tr><td width="" "">&nbsp;</td><td width="" ""><font face=""Arial,sans-serif"" size=""3"">4 &nbsp;&nbsp; <INPUT TYPE=""radio"" NAME=""SelectedChoice"" VALUE="&ChoiceNumber4&"></font></td><td><font face=""Arial,sans-serif"" size=""3"">"&ChoiceValue4&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

					
					
					'Set tsObject = fsoObject.CreateTextFile("E:\vhosts\projstudy.com\httpdocs\FoundationSims\Sim1\"& a &".asp")
					Set tsObject = fsoObject.CreateTextFile("C:\Inetpub\wwwroot\FoundationSims\sim1\"& a &".asp")
					tsObject.Write strEnding
					tsObject.Write strEnding1
					tsObject.Write strEnding2
					tsObject.Write strEnding3
					tsObject.Write strEnding4
					tsObject.Write strEnding5
					tsObject.Write strEnding6
										
%>
sim1: <% = a %>.asp created<BR>
<%		

					 strJust  = "<BR><BR><table width=""880"" border=""0"" cellspacing=""0"" cellpadding=""0"">"

strJust = strJust & "<tr><td width=""10px""></td><td colspan=""2""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Question No : "&CountofSim1&"</font><BR><BR></td></tr>"

strJust = strJust & "<tr><td width=""10px""></td><td colspan=""2""><font face=""Arial,sans-serif"" size=""3"">"&Ques&"</font><BR><BR></td></tr><tr><td colspan=""3"">&nbsp;</td></tr>"
 
strJust = strJust & "<tr><td width="" "">&nbsp;</td><td width=""7%""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Choice 1 </font></td><td><font face=""Arial,sans-serif"" size=""3"">"&ChoiceValue1&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strJust = strJust & "<tr><td width="" "">&nbsp;</td><td width="" ""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Choice 2 </font></td><td><font face=""Arial,sans-serif"" size=""3""> "&ChoiceValue2&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strJust = strJust & "<tr><td width="" "">&nbsp;</td><td width="" ""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Choice 3 </font></td><td><font face=""Arial,sans-serif"" size=""3""> "&ChoiceValue3&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strJust = strJust & "<tr><td width="" "">&nbsp;</td><td width="" ""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Choice 4 </font></td><td><font face=""Arial,sans-serif"" size=""3"">"&ChoiceValue4&"</font></td></tr>"

strJust = strJust & "<td colspan=""3"">&nbsp;</td></tr><tr><td>&nbsp;</td</tr><tr><td width="" "">&nbsp;</td><td width="" "" colspan=""2""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Correct Choice : "&CorrectChoice&"</font></td> </tr><tr><td colspan=""3"">&nbsp;</td></tr>"

strJust = strJust & "<tr><td width=""10px""></td><td colspan=""2""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Justification : </font><BR><BR></td></tr>"

strJust = strJust & "<tr><td width="" "">&nbsp;</td><td valign=""top"" colspan=""2""><font face=""Arial,sans-serif"" size=""3"">"&Justification&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"
					

					'Set tsObject = fsoObject.CreateTextFile("E:\vhosts\projstudy.com\httpdocs\FoundationSims\Sim1\"&a&"ans.asp")
					Set tsObject = fsoObject.CreateTextFile("C:\Inetpub\wwwroot\FoundationSims\sim1\"&a&"ans.asp")
					
					tsObject.Write strJust
					tsObject.Write strJust1
					tsObject.Write strJust2
					tsObject.Write strJust3
					tsObject.Write strJust4
					tsObject.Write strJust5
					tsObject.Write strJust6
%>
sim1: <%= a %>ans.asp created<BR>
		
<%
		
		a = a + 1
		
 		End If

		rsQues.Close					
		
	End If
	
 		
	i = i + 1
	
	'If (x >= 4 AND j = 5) Then
	'	x = x - 2
	'ElseIf (x >= 3 AND j = 5) Then
	'	x = x - 1
    'ElseIf (x >= 2 AND j = 6) Then
	'	x = x + 1
	'End If	
		
		
	Next
	
	x =  x + 1
	
	For k = 1 to 18
		 
		If a <= 75 Then
		
			strQuery = "SELECT QuestionDb.QuestionDesc, QuestionDb.CorrectChoice, QuestionDb.Justification, QuestionDb.ExhibitURL ,ChoiceDb.ChoiceNumber, QuestionDb.KNo, ChoiceDb.ChoiceValue FROM QuestionDb, ChoiceDb WHERE  QuestionDb.QuestionNo = '"& x &"' AND QuestionDb.KNo = '"& k &"' AND ChoiceDb.QuestionNo = '"& x &"' AND ChoiceDb.KNo = '"& k &"' ORDER BY QuestionDb.QuestionNo, ChoiceDb.KNo, ChoiceDb.ChoiceNumber"
	
		Response.Write(strQuery & "<br>")
	
		rsQues.Open strQuery,connObj
		
		If (Not rsQues.BOF) AND (Not rsQues.EOF) Then 
		
			Do While Not rsQues.EOF
			
			Ques = rsQues("QuestionDesc")
			Justification = rsQues("Justification")
			CorrectChoice = rsques("CorrectChoice")
			Kno = rsques("KNo")

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
			
			ConnObj.Execute "INSERT INTO Sim1CorrectAns(QuesNo,Kno, Ans) VALUES ('"&a&"','"&Kno&"','"&CorrectChoice&"')"			

			strEnding  = "<BR><BR><form method=""post"" action=""./index.asp""><div class=""overflowTest""><table width=""880"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td width=""10px""></td><td colspan=""2""><font face=""Arial,sans-serif"" size=""3"">"&Ques&"</font><BR><BR></td></tr><tr><td colspan=""3"">&nbsp;</td></tr>"

 
strEnding = strEnding & "<tr><td width="" "">&nbsp;</td><td width=""7%""><font face=""Arial,sans-serif"" size=""3"">1 &nbsp;&nbsp; <INPUT TYPE=""radio"" NAME=""SelectedChoice"" VALUE="&ChoiceNumber1&"></font></td><td><font face=""Arial,sans-serif"" size=""3"">"&ChoiceValue1&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strEnding = strEnding & "<tr><td width="" "">&nbsp;</td><td width="" ""><font face=""Arial,sans-serif"" size=""3"">2 &nbsp;&nbsp; <INPUT TYPE=""radio"" NAME=""SelectedChoice"" VALUE="&ChoiceNumber2&"></font></td><td><font face=""Arial,sans-serif"" size=""3""> "&ChoiceValue2&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strEnding = strEnding & "<tr><td width="" "">&nbsp;</td><td width="" ""><font face=""Arial,sans-serif"" size=""3"">3 &nbsp;&nbsp; <INPUT TYPE=""radio"" NAME=""SelectedChoice"" VALUE="&ChoiceNumber3&"></font></td><td><font face=""Arial,sans-serif"" size=""3""> "&ChoiceValue3&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strEnding = strEnding & "<tr><td width="" "">&nbsp;</td><td width="" ""><font face=""Arial,sans-serif"" size=""3"">4 &nbsp;&nbsp; <INPUT TYPE=""radio"" NAME=""SelectedChoice"" VALUE="&ChoiceNumber4&"></font></td><td><font face=""Arial,sans-serif"" size=""3"">"&ChoiceValue4&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

			
			

			'Set tsObject = fsoObject.CreateTextFile("E:\vhosts\projstudy.com\httpdocs\FoundationSims\Sim1\"& a &".asp")
			Set tsObject = fsoObject.CreateTextFile("C:\Inetpub\wwwroot\FoundationSims\sim1\"& a &".asp")
			
			tsObject.Write strEnding
			tsObject.Write strEnding1
			tsObject.Write strEnding2
			tsObject.Write strEnding3
			tsObject.Write strEnding4
			tsObject.Write strEnding5
			tsObject.Write strEnding6


%>
sim1: <%= a %>.asp created<BR>
<%

					 strJust  = "<BR><BR><table width=""880"" border=""0"" cellspacing=""0"" cellpadding=""0"">"

strJust = strJust & "<tr><td width=""10px""></td><td colspan=""2""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Question No : "&CountofSim1&"</font><BR><BR></td></tr>"

strJust = strJust & "<tr><td width=""10px""></td><td colspan=""2""><font face=""Arial,sans-serif"" size=""3"">"&Ques&"</font><BR><BR></td></tr><tr><td colspan=""3"">&nbsp;</td></tr>"
 
strJust = strJust & "<tr><td width="" "">&nbsp;</td><td width=""7%""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Choice 1 </font></td><td><font face=""Arial,sans-serif"" size=""3"">"&ChoiceValue1&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strJust = strJust & "<tr><td width="" "">&nbsp;</td><td width="" ""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Choice 2 </font></td><td><font face=""Arial,sans-serif"" size=""3""> "&ChoiceValue2&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strJust = strJust & "<tr><td width="" "">&nbsp;</td><td width="" ""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Choice 3 </font></td><td><font face=""Arial,sans-serif"" size=""3""> "&ChoiceValue3&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strJust = strJust & "<tr><td width="" "">&nbsp;</td><td width="" ""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Choice 4 </font></td><td><font face=""Arial,sans-serif"" size=""3"">"&ChoiceValue4&"</font></td></tr>"

strJust = strJust & "<td colspan=""3"">&nbsp;</td></tr><tr><td>&nbsp;</td</tr><tr><td width="" "">&nbsp;</td><td width="" "" colspan=""2""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Correct Choice : "&CorrectChoice&"</font></td> </tr><tr><td colspan=""3"">&nbsp;</td></tr>"

strJust = strJust & "<tr><td width=""10px""></td><td colspan=""2""><font style=""font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;"">Justification : </font><BR><BR></td></tr>"

strJust = strJust & "<tr><td width="" "">&nbsp;</td><td valign=""top"" colspan=""2""><font face=""Arial,sans-serif"" size=""3"">"&Justification&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"
					

					'Set tsObject = fsoObject.CreateTextFile("E:\vhosts\projstudy.com\httpdocs\FoundationSims\Sim1\"&a&"ans.asp")
					Set tsObject = fsoObject.CreateTextFile("C:\Inetpub\wwwroot\FoundationSims\sim1\"&a&"ans.asp")
					
					tsObject.Write strJust
					tsObject.Write strJust1
					tsObject.Write strJust2
					tsObject.Write strJust3
					tsObject.Write strJust4
					tsObject.Write strJust5
					tsObject.Write strJust6
					
%>
sim1: <%= a %>ans.asp created<BR>
		
<%
		a = a + 1
	
		End If

		rsQues.Close		

	End If 

	i = i + 1

	
	Next

	x = x + 1
	
	Next

	%>
</body>
</html>