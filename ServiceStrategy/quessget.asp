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


If(Int(QuesAsked)<(Int(NoofQues)+Int(StartQuesNo)-1)) Then
	QuesAsked = int(CountofQues)+int(StartQuesNo)

	CountofQues=Int(CountofQues)+1	%>
<BR>
<%'Instantiate an ADO Recordset object.
Set rsQues = Server.CreateObject("ADODB.Recordset")
rsQues.ActiveConnection = ConnObj

rsQues.Open "SELECT Question_StrategyDB.QuestionDesc, Question_StrategyDB.CorrectChoice, Question_StrategyDB.Justification, Question_StrategyDB.ExhibitURL ,Choice_StrategyDB.ChoiceNumber, Choice_StrategyDB.ChoiceValue from Question_StrategyDB, Choice_StrategyDB WHERE Question_StrategyDB.KNo='"&KNo&"' and Choice_StrategyDB.KNo='"&KNo&"' and Question_StrategyDB.QuestionNo='"&QuesAsked&"' and Question_StrategyDB.QuestionNo=Choice_StrategyDB.QuestionNo ORDER by Choice_StrategyDB.ChoiceNumber"

%>
<% If Not rsQues.BOF Then%>
<form method="post" action="ansget.asp">
  <%
Ques = rsQues("QuestionDesc")
'PMPCAPMQues = rsQues("GBBB")
%>
  <input TYPE="hidden" name="QuestionDesc" value='<%=Ques%>'>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="TableTest">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" colspan="2"><%
		   'If(PMPCAPMQues="CAPM") Then
			 'Relevance="Relevance: PMP Exam / CAPM Exam"
		  ' Else
			 'Relevance="Relevance: SPHR/PHR Exam"
		   'End If
		 %>
            <input type="hidden" name="Relevance" value='<%=Relevance%>'>
            <p><span class="HeaderLarge">Question <%=QuesAsked%></span><span style="margin-left:405px;"><b><%=Relevance%></b></span></p>
            <p class="PopupSubHeader"><%=Ques%><br /><br /></p></td>
        </tr>
        <%
			 ChoiceNumber1=rsQues("ChoiceNumber")
		  	 ChoiceValue1=Trim(rsQues("ChoiceValue"))
		%>
        <tr>
          <td height="30" width="4%"><input type="radio" name="SelectedChoice" value="<%=ChoiceNumber1%>"></td>
		  <td>
            <span class="PopupSubHeader"><%=ChoiceValue1%></td>
          </span></tr>
        <%
	  		rsQues.MoveNext
			ChoiceNumber2=rsQues("ChoiceNumber")
			ChoiceValue2=rsQues("ChoiceValue")
	    %>
        <tr>
          <td height="30"><input type="radio" name="SelectedChoice" value="<%=ChoiceNumber2%>"></td>
		  <td>
            <span class="PopupSubHeader"><%=ChoiceValue2%></span> </td>
        </tr>
        <% 
			rsQues.MoveNext
			ChoiceNumber3=rsQues("ChoiceNumber")
			ChoiceValue3=rsQues("ChoiceValue")
		%>
        <tr>
          <td height="30"><input type="radio" name="SelectedChoice" value="<%=ChoiceNumber3%>"></td>
		  <td>
            <span class="PopupSubHeader"><%=ChoiceValue3%></span> </td>
        </tr>
        <%
			rsQues.MoveNext
			ChoiceNumber4=rsQues("ChoiceNumber")
			ChoiceValue4=rsQues("ChoiceValue")
		%>
        <tr>
          <td height="30"><input type="radio" name="SelectedChoice" value="<%=ChoiceNumber4%>"></td>
		  <td>
            <span class="PopupSubHeader"><%=ChoiceValue4%></span> </td>
        </tr>
        <tr>
          <td height="30" colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2" height="84" class="TableRowOdd"><div align="left">
            <span class="PopupCopy">
            <input type="submit" value="ENTER SELECTION" class="ButtonTestGeneral">
            <input type="reset" value="RESET" class="ButtonTest">
            
            <a href="/ServiceStrategy/chapterTestsIndex.asp" onclick="return ExitAlert(this.href);"><input type="button" class="ButtonTest" value="Exit" /></a>
          </td>
          
        </tr>
      </table>
      <input type="hidden" name="ChoiceNumber1" value='<%=ChoiceNumber1%>'>
      <input type="hidden" name="ChoiceValue1" value='<%=ChoiceValue1%>'>
      <input type="hidden" name="ChoiceNumber2" value='<%=ChoiceNumber2%>'>
      <input type="hidden" name="ChoiceValue2" value='<%=ChoiceValue2%>'>
      <input type="hidden" name="ChoiceNumber3" value='<%=ChoiceNumber3%>'>
      <input type="hidden" name="ChoiceValue3" value='<%=ChoiceValue3%>'>
      <input type="hidden" name="ChoiceNumber4" value='<%=ChoiceNumber4%>'>
      <input type="hidden" name="ChoiceValue4" value='<%=ChoiceValue4%>'>
      <input type="hidden" name="QuesAsked" value='<%=QuesAsked%>'>
      <input type="hidden" name="QuesCorrect" value='<%=QuesCorrect%>'>
      <input type="hidden" name="CountofQues" value='<%=CountofQues%>'>
      <input type="hidden" name="NoofQues" value='<%=NoofQues%>'>
      <input type="hidden" name="CorrectChoice" value='<%=Trim(rsQues("CorrectChoice"))%>'>
      <input type="hidden" name="Justification" value='<%=rsQues("Justification")%>'>
      <input type="hidden" name="Kno" value='<%=KNo%>'>
      <input type="hidden" name="StartQuesNo" value='<%=StartQuesNo%>'>
</form>
<%	Else %>
<font face="Arial" size="2"><B>There are no more questions </B><BR>
<BR>
Please <a href="http://www.itilstudy.com/index.asp">Go to home Page</A> or <a href="./chaptertestsindex.asp">Work on questions again</A>
<%

End If

Set rsQues = Nothing

Else
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="TableTest">
  <tr>
    <td><span class="HeaderLarge">Results</span></td>
  </tr>
  <tr>
    <td><span class="PopupSubHeader"><br>
      Total No of Questions: <%=NoofQues%></span></td>
  </tr>
  <tr>
    <td><span class="PopupSubHeader">Questions Attempted : <%=CountofQues%></span></td>
  </tr>
  <tr>
    <td><span class="PopupSubHeader">Questions Answered Correctly: <%=QuesCorrect%></span></td>
  </tr>
  <tr>
    <td><span class="PopupSubHeader">Percentage Correct: <%=Int(Int(QuesCorrect)*100/Int(CountofQues))%> % </span></td>
  </tr>
  <tr>
    <td><% If(Int(Int(QuesCorrect)*100/Int(CountofQues)) > 75) Then %>
      <p class="PopupSubHeader"> You have answered more than 75% questions correctly -  You can move ahead to the evaluation test.</p>
      <% Else %>
      <p class="PopupSubHeader">You have answered less than 75% questions correctly - Please take the Chapter Tests for this chapter again till
        you get more than 75%.</p>
      <% End If %>
    </td>
  </tr>
  <tr>
    <td height="84" class="TableRowOdd"><div align="left">
      <span class="PopupCopy">
      <form method="post" action="chaptertestsindex.asp">
        <input type="submit" value="Work on Questions" class="ButtonTestGeneral">
      </form></td>
  </tr>
</table>
<% End If %>
<!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>
<% End If %>