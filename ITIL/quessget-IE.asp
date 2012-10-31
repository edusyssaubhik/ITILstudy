<%Response.Buffer = True%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<% If Session("FirstName") = "" Then 
response.Redirect("/memberlogin.asp")
Else
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META http-equiv=Content-type content="text/html; charset=ISO-8859-1">
<title>ITILstudy</title>
<link rel="shortcut icon" href="/images/buttons/favicon.ico">
<link rel="stylesheet" href="/css/style.css" type="text/css">
<script language ="javascript">
/*
function ExitAlert() {
  if(confirm("Are you sure you want quit the chapter test?")) 
  {
  	return true;
  } 
  else
  {
	return false;
  }*/
function ExitAlert() {
  
var r=confirm("Are you sure you want quit the chapter test?");
	
	if (r==true) {
		top.location.href='/Foundation/chapterTestsIndex.asp';
	}
	else {
		return false;
	}
}
</script>
</HEAD>
<BODY>
<font face="Arial">
<!--#include virtual="/includes/connection.asp"-->
<%
Dim rsQues
Dim adoRec
Dim KNo
Dim NoofQues
Dim QuesAsked
Dim QuesCorrect
Dim PercentCorrect
Dim Count
Count = 1
Dim ChoiceNumber1
Dim ChoiceNumber2
Dim ChoiceNumber3
Dim ChoiceNumber4
Dim ChoiceValue1
Dim ChoiceValue2
Dim ChoiceValue3
Dim ChoiceValue4
Dim Ques
Dim StartQuesNo
Dim CountofQues

%>
<%
KNo=Request.Form("KNo")
NoofQues=Request.Form("NoofQues")
QuesAsked=Request.Form("QuesAsked")
QuesCorrect=Request.Form("QuesCorrect")
StartQuesNo=Request.Form("StartQuesNo")
CountofQues=Request.Form("CountofQues")%>
<BR>
<%
Response.Write("KNO "& KNO)
Response.Write("<br>")
Response.Write("NoofQues "& NoofQues)

'If(Int(QuesAsked)<(Int(NoofQues)+Int(StartQuesNo)-1)) Then
'	QuesAsked = int(CountofQues)+int(StartQuesNo)
'
'	CountofQues=Int(CountofQues)+1	
'End If	
	%>
<BR>

<!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>
<% End If %>