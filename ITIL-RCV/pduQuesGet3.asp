<HTML>
<HEAD>
<TITLE>ITILstudy</TITLE>
<link rel="stylesheet" href="/css/style.css" type="text/css">
<META http-equiv=Content-type content="text/html; charset=ISO-8859-1">
</HEAD>
<BODY><font="arial" size="3">
<!--#include virtual="/includes/connection.asp"-->
<%
Dim KNo,nCur,nCurNo ,quesAsked
Dim sArray
ReDim sArray(9,1,1)


quesCorrect=0
sArray=Session("PDUArray")
KNo=Request.Form("KNo")
nCur=Request.Form("nCur")
nCurNo=int(nCur)

QuesAsked=sArray(nCurNo,0,0)

Set rsQues = Server.CreateObject("ADODB.Recordset")
rsQues.ActiveConnection = ConnObj

rsQues.Open "SELECT Question_ITILDB.QuestionDesc, Question_ITILDB.CorrectChoice, Question_ITILDB.Justification, Question_ITILDB.ExhibitURL ,Choice_ITILDB.ChoiceNumber, Choice_ITILDB.ChoiceValue from Question_ITILDB, Choice_ITILDB WHERE Question_ITILDB.KNo='"&KNo&"' and Choice_ITILDB.KNo='"&KNo&"' and Question_ITILDB.QuestionNo='"&QuesAsked&"' and Question_ITILDB.QuestionNo=Choice_ITILDB.QuestionNo ORDER BY Choice_ITILDB.ChoiceNumber"

'rsQues.Open "SELECT Question_ITILDB.QuestionDesc, Question_ITILDB.ExhibitURL ,Choice_ITILDB.ChoiceNumber, Choice_ITILDB.ChoiceValue from Question_ITILDB, Choice_ITILDB WHERE Question_ITILDB.KNo='"&KNo&"' and Choice_ITILDB.KNo='"&KNo&"' and Question_ITILDB.QuestionNo='"&sArray(nCurNo,0,0)&"' and Question_ITILDB.QuestionNo=Choice_ITILDB.QuestionNo Order by Choice_ITILDB.ChoiceNumber"

%>
 <table width="100%" border="0" cellpadding="0" cellspacing="0" class="TableTest">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
       <tr>
        <td class="SubHeader" colspan="2">
			<% If Not rsQues.BOF Then %>
			<FORM METHOD="POST" ACTION="/Foundation/pduquesget2.asp">
			Selected Choice: <%=sArray(nCurNo,0,1)%><br>
        	Correct Answer: <%=sArray(nCurNo,1,0)%>
        </td>
		<tr><td colspan="2"><span class="HeaderLarge">Question <%=nCurNo+1%> : </span><br><span class="PopupSubHeader"><%=rsQues("QuestionDesc")%></span></td></tr>
		<tr><td colspan = "2">&nbsp;</td></tr>
        <tr><td><%=rsQues("ChoiceNumber")%></td><td><span class="PopupSubHeader"><%=rsQues("ChoiceValue")%></span></td></tr><%rsQues.MoveNext%>
        <tr><td><%=rsQues("ChoiceNumber")%></td><td><span class="PopupSubHeader"><%=rsQues("ChoiceValue")%></span></td></tr><%rsQues.MoveNext%>
        <tr><td><%=rsQues("ChoiceNumber")%></td><td><span class="PopupSubHeader"><%=rsQues("ChoiceValue")%></span></td></tr><%rsQues.MoveNext%>
        <tr><td><%=rsQues("ChoiceNumber")%></td><td><span class="PopupSubHeader"><%=rsQues("ChoiceValue")%></span></td></tr>
        <tr><td colspan="2">&nbsp;</td></tr>
        <!--<tr><td colspan="2"><span class="HeaderLarge">Justification:</span><br><span class="PopupSubHeader"><%'=rsQues("Justification")%></span></td></tr>-->
        <INPUT TYPE="HIDDEN" NAME="KNo" VALUE='<%=KNo%>'>
        <tr><td colspan = "2">&nbsp;</td></tr>
        <tr><td colspan="2"><input type="submit" Name="Submit" value="Go Back to Answers" class="ButtonTestGeneral"></td></tr>
		</form>
	   <% 
	      End If
		  Set rsQues = Nothing
	   %>
</table>
  <!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>

