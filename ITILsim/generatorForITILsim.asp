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
 'Declare The local Variables'
'Dim ConnObj

'Set ConnObj=Server.CreateObject("ADODB.Connection")

'ConnObj.Open "Provider =SQLOLEDB; Data Source=db.winwinhosting.com; Initial Catalog=APMGstudy; User Id=APMGstudy; Password=wqY7r3ZvcOhQSLg7"


'ConnObj.Open "Provider=SQLOLEDB;Data Source=PRIYANKA-1545; Initial Catalog=APMGstudy; User Id=sa; Password=edusys"


'Truncating correctans table of all simulators in order to avoid duplicate correctanswers.
ConnObj.Execute ("truncate table SimITILCorrectAns")


'For i = 1 to 900

For i = 1 to 580

'First PHR'
	
	For j = 1 to 6
		
		If a <= 40 Then
		
	    	If j = 1 Then
		
			strQuery = "SELECT Question_ITILDB.QuestionDesc, Question_ITILDB.CorrectChoice, Question_ITILDB.Justification, Question_ITILDB.ExhibitURL ,Choice_ITILDB.ChoiceNumber, Question_ITILDB.KNo, Choice_ITILDB.ChoiceValue FROM Question_ITILDB, Choice_ITILDB WHERE  Question_ITILDB.QuestionNo = '"& m &"' AND Question_ITILDB.KNo = '"& j &"' AND  Choice_ITILDB.QuestionNo = '"& m &"' AND Choice_ITILDB.KNo = '"& j &"' ORDER BY Question_ITILDB.QuestionNo, Choice_ITILDB.KNo, Choice_ITILDB.ChoiceNumber"
			
			
			m = m + 1
			
			Else
			
			strQuery = "SELECT Question_ITILDB.QuestionDesc, Question_ITILDB.CorrectChoice, Question_ITILDB.Justification, Question_ITILDB.ExhibitURL ,Choice_ITILDB.ChoiceNumber, Question_ITILDB.KNo, Choice_ITILDB.ChoiceValue FROM Question_ITILDB, Choice_ITILDB WHERE Question_ITILDB.QuestionNo = '"& x &"' AND Question_ITILDB.KNo = '"& j &"' AND  Choice_ITILDB.QuestionNo = '"& x &"' AND Choice_ITILDB.KNo = '"& j &"' ORDER BY Question_ITILDB.QuestionNo, Choice_ITILDB.KNo, Choice_ITILDB.ChoiceNumber"
			
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
					
					ConnObj.Execute "INSERT INTO SimITILCorrectAns(QuesNo,Kno, Ans) VALUES ('"&a&"','"&Kno&"','"&CorrectChoice&"')"
		
					strEnding  = "<BR><BR><form method=""post"" action=""./index.asp""><div class=""overflowTest""><table width=""880"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td width=""10px""></td><td colspan=""2""><font face=""Arial,sans-serif"" size=""3"">"&Ques&"</font><BR><BR></td></tr><tr><td colspan=""3"">&nbsp;</td></tr>"

 
strEnding = strEnding & "<tr><td width="" "">&nbsp;</td><td width=""7%""><font face=""Arial,sans-serif"" size=""3"">1 &nbsp;&nbsp; <INPUT TYPE=""radio"" NAME=""SelectedChoice"" VALUE="&ChoiceNumber1&"></font></td><td><font face=""Arial,sans-serif"" size=""3"">"&ChoiceValue1&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strEnding = strEnding & "<tr><td width="" "">&nbsp;</td><td width="" ""><font face=""Arial,sans-serif"" size=""3"">2 &nbsp;&nbsp; <INPUT TYPE=""radio"" NAME=""SelectedChoice"" VALUE="&ChoiceNumber2&"></font></td><td><font face=""Arial,sans-serif"" size=""3""> "&ChoiceValue2&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strEnding = strEnding & "<tr><td width="" "">&nbsp;</td><td width="" ""><font face=""Arial,sans-serif"" size=""3"">3 &nbsp;&nbsp; <INPUT TYPE=""radio"" NAME=""SelectedChoice"" VALUE="&ChoiceNumber3&"></font></td><td><font face=""Arial,sans-serif"" size=""3""> "&ChoiceValue3&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

strEnding = strEnding & "<tr><td width="" "">&nbsp;</td><td width="" ""><font face=""Arial,sans-serif"" size=""3"">4 &nbsp;&nbsp; <INPUT TYPE=""radio"" NAME=""SelectedChoice"" VALUE="&ChoiceNumber4&"></font></td><td><font face=""Arial,sans-serif"" size=""3"">"&ChoiceValue4&"</td></tr><tr><td colspan=""3"">&nbsp;</font></td></tr>"

					
					
					'Set tsObject = fsoObject.CreateTextFile("E:\vhosts\ITILstudy.com\httpdocs\ITILSim\Sim1\"& a &".asp")
					Set tsObject = fsoObject.CreateTextFile("C:\ITILstudy\ITILsim\sim1\"& a &".asp")
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
					

					

					'Set tsObject = fsoObject.CreateTextFile("E:\vhosts\ITILstudy.com\httpdocs\ITILsim\Sim1\"&a&"ans.asp")
					Set tsObject = fsoObject.CreateTextFile("C:\ITILstudy\ITILsim\sim1\"&a&"ans.asp")
					
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