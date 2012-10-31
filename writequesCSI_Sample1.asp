<HTML>
<HEAD>
</HEAD>
<BODY>
<!--#include virtual="/includes/connection.asp"-->

<%

If Session("Access") = "Granted-1102" Then

Session.Timeout=1000

submitvalue=Request.Form("submitvalue")


Select Case submitvalue

Case "Initialize"%>

<%' Initialize begins ---------------------------------------------------------------------------

Set rsQues = Server.CreateObject("ADODB.Recordset")
rsQues.ActiveConnection = connObj
Kno=Request.Form("kno")
Quesno=Request.Form("quesno")
rsQues.Open "SELECT Question_CSIsample1.QuestionDesc, Question_CSIsample1.Question, Question_CSIsample1.CorrectChoice, Question_CSIsample1.Justification, Choice_CSIsample1.ChoiceNumber, Choice_CSIsample1.ChoiceValue, Choice_CSIsample1.ChoiceRate from Question_CSIsample1, Choice_CSIsample1 WHERE Question_CSIsample1.QuestionNo='"&QuesNo&"' and Question_CSIsample1.QuestionNo=Choice_CSIsample1.QuestionNo ORDER by Choice_CSIsample1.ChoiceNumber"

If Not rsQues.BOF Then%>
<P align="center"><B>View/Edit/Add given question:</B><BR><BR></P>
<B><U>View Question:</U></B>&nbsp;&nbsp;&nbsp;<B><a href="./writequesCSI_Sample1.asp">Home Page</A></B>
<form method="post" action="./writequesCSI_Sample1.asp">
<%QuesNoPrev=int(QuesNo)-1%>
<input type="hidden" name="QuesNo" value="<%=QuesNoPrev%>">
<input type="hidden" name="submitvalue" value="Initialize">
<input type="Submit" Value="Previous Question">
</form>
<form method="post" action="./writequesCSI_Sample1.asp">
<%QuesNoNext=int(QuesNo)+1%>
<input type="hidden" name="QuesNo" value="<%=QuesNoNext%>">
<input type="hidden" name="submitvalue" value="Initialize">
<input type="Submit" Value="Next Question">
</form>

<%QuestionDesc=rsQues("QuestionDesc")
Question=rsQues("Question")
ChoiceValue1=rsQues("ChoiceValue")
ChoiceRate1=rsQues("ChoiceRate")
rsQues.MoveNext
ChoiceValue2=rsQues("ChoiceValue")
ChoiceRate2=rsQues("ChoiceRate")
rsQues.MoveNext
ChoiceValue3=rsQues("ChoiceValue")
ChoiceRate3=rsQues("ChoiceRate")
rsQues.MoveNext
ChoiceValue4=rsQues("ChoiceValue")
ChoiceRate4=rsQues("ChoiceRate")
Justification=rsQues("Justification")
CorrectChoice=rsQues("CorrectChoice")
%>
<B>Ques <%=Quesno%> : <%=QuestionDesc%></B><BR><%=Question%><BR>
<OL type="A">
<LI><%=ChoiceValue1%><BR>
<%=ChoiceRate1%><BR>
</LI>
<LI><%=ChoiceValue2%><BR><%=ChoiceRate2%><BR>
</LI>
<LI><%=ChoiceValue3%><BR><%=ChoiceRate3%><BR>
</LI>
<LI><%=ChoiceValue4%><BR><%=ChoiceRate4%><BR>
</LI>
</OL><BR>
Correct Choice: <B><%=CorrectChoice%></B><BR><BR>
Justification: <%=Justification%><BR><BR>
Reference: <%=Reference%><BR><BR>
<B><U>Edit Question:</U></B><BR><BR>
<form method="post" action="./writequesCSI_Sample1.asp">
<p>Question # : <input type="text" Name="quesno" size="4" value="<%=quesno%>"><BR><BR>
<input type="hidden" Name="pmpno" size="2">
<p>Question Scenario: <textarea name="questiondesc" rows="6" cols="100"><%=questionDesc%></textarea><BR><BR>
<p>Question : <textarea name="question" rows="6" cols="100"><%=question%></textarea><BR><BR>
<p>Choice A: <textarea name="choicevalue1" rows="6" cols="100"><%=choicevalue1%></textarea><BR><BR>
<p>Choice Rate A: <input type="text" Name="ChoiceRate1" size="1" value="<%=ChoiceRate1%>"><BR><BR>
<p>Choice B: <textarea name="choicevalue2" rows="6" cols="100"><%=choicevalue2%></textarea><BR><BR>
<p>Choice Rate B: <input type="text" Name="ChoiceRate2" size="1" value="<%=ChoiceRate2%>"><BR><BR>

<p>Choice C: <textarea name="choicevalue3" rows="6" cols="100"><%=choicevalue3%></textarea><BR><BR>
<p>Choice Rate C: <input type="text" Name="ChoiceRate3" size="1" value="<%=ChoiceRate3%>"><BR><BR>

<p>Choice D: <textarea name="choicevalue4" rows="6" cols="100"><%=choicevalue4%></textarea><BR><BR>
<p>Choice Rate D: <input type="text" Name="ChoiceRate4" size="1" value="<%=ChoiceRate4%>"><BR><BR>

<p>Correct Choice : <input type="text" Name="correctchoice" size="1" value="<%=Correctchoice%>"><BR><BR>
<p>Justification: <textarea name="justification" rows="10" cols="100"><%=Justification%></textarea><BR><BR>
<input type="hidden" Name="addoredit" value="edit">

<p><input type="Submit" Name="submitvalue" Value="UpdateinDatabase">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="Submit" Name="submitvalue" Value="PreviewInformation"></form><BR><BR></form>



<%
'connObj.Close
'Set connObj=Nothing
Set rsQues=Nothing
Else%>
<B>Question does not exist - please enter question</B>
<form method="post" action="./writequesCSI_Sample1.asp">
<p>Question # : <input type="text" Name="quesno" size="4" value="<%=Request.Form("quesno")%>"><BR><BR>
<input type="hidden" Name="pmpno" size="2">
<p>Question Scenario: <textarea name="questiondesc" rows="6" cols="100"></textarea><BR><BR>
<p>Question : <textarea name="question" rows="6" cols="100"><%=question%></textarea><BR><BR>
<p>Choice A: <textarea name="choicevalue1" rows="6" cols="100"><%=choicevalue1%></textarea><BR><BR>
<p>Choice Rate A: <input type="text" Name="ChoiceRate1" size="1" value="<%=ChoiceRate1%>"><BR><BR>
<p>Choice B: <textarea name="choicevalue2" rows="6" cols="100"><%=choicevalue2%></textarea><BR><BR>
<p>Choice Rate B: <input type="text" Name="ChoiceRate2" size="1" value="<%=ChoiceRate2%>"><BR><BR>

<p>Choice C: <textarea name="choicevalue3" rows="6" cols="100"><%=choicevalue3%></textarea><BR><BR>
<p>Choice Rate C: <input type="text" Name="ChoiceRate3" size="1" value="<%=ChoiceRate3%>"><BR><BR>

<p>Choice D: <textarea name="choicevalue4" rows="6" cols="100"><%=choicevalue4%></textarea><BR><BR>
<p>Choice Rate D: <input type="text" Name="ChoiceRate4" size="1" value="<%=ChoiceRate4%>"><BR><BR>
<p>Correct Choice : <input type="text" Name="correctchoice" size="1"><BR><BR>
<p>Justification: <textarea name="justification" rows="10" cols="100"></textarea><BR><BR>
<p>Reference: <textarea name="Reference" rows="10" cols="100" ></textarea><BR><BR>

AddorEdit=<%=addoredit%>
<!--<p>Page Number: <input type="text" Name="pageno" size="5"><BR><BR>-->
<p>Additional comments: <input type="text" Name="comments" size="50"><BR><BR>
<input type="hidden" Name="addoredit" value="add">
<p><input type="Submit" Name="submitvalue" Value="PreviewInformation"></form><BR><BR></form>
</form>
<%end if

' Initialize ends ---------------------------------------------------------------------------

Case "PreviewInformation"

' PreviewInformation Begins ---------------------------------------------------------------------------
%>

<P align="center"><B>View/Edit/Add given question:</B><BR><BR></P>
<B><U>View Question:</U></B>&nbsp;&nbsp;&nbsp;<B><a href="./writequesCSI_Sample1.asp">Home Page</A></B>
<%
QuesNo=Request.Form("QuesNo")
KNo=Request.Form("KNo")
QuesNoPrev=int(QuesNo)-1%>
<input type="hidden" name="QuesNo" value="<%=QuesNoPrev%>">
<input type="hidden" name="submitvalue" value="Initialize">
<input type="Submit" Value="Previous Question">
</form>
<form method="post" action="./writequesCSI_Sample1.asp">
<%QuesNoNext=int(QuesNo)+1%>
<input type="hidden" name="QuesNo" value="<%=QuesNoNext%>">
<input type="hidden" name="submitvalue" value="Initialize">
<input type="Submit" Value="Next Question">
</form>

<%



QuestionDesc=Replace(Request.Form("QuestionDesc"),"'","''")
Question=Replace(Request.Form("Question"),"'","''")
ChoiceValue1=Replace(Request.Form("ChoiceValue1"),"'","''")
ChoiceRate1=Replace(Request.Form("ChoiceRate1"),"'","''")

ChoiceValue2=Replace(Request.Form("ChoiceValue2"),"'","''")
ChoiceRate2=Replace(Request.Form("ChoiceRate2"),"'","''")
ChoiceValue3=Replace(Request.Form("ChoiceValue3"),"'","''")
ChoiceRate3=Replace(Request.Form("ChoiceRate3"),"'","''")
ChoiceValue4=Replace(Request.Form("ChoiceValue4"),"'","''")
ChoiceRate4=Replace(Request.Form("ChoiceRate4"),"'","''")
CorrectChoice=Request.Form("CorrectChoice")
addoredit=Request.Form("addoredit")
If(addoredit="add") Then
Justification=Replace(Request.Form("Justification"),"'","''")&"<br><br> "&Request.Form("Reference")&""&Request.Form("pageno")&"<BR><BR>"&Request.Form("comments")

Else
Justification=Replace(Request.Form("Justification"),"'","''")
End If
%>
<B>Ques <%=QuesNo%> : <%=QuestionDesc%></B><BR><%=Question%><BR>
<OL type="A">
<LI><%=ChoiceValue1%><BR>
<%=ChoiceRate1%><BR>
</LI>
<LI><%=ChoiceValue2%><BR><%=ChoiceRate2%><BR>
</LI>
<LI><%=ChoiceValue3%><BR><%=ChoiceRate3%><BR>
</LI>
<LI><%=ChoiceValue4%><BR><%=ChoiceRate4%><BR>
</LI>
</OL><BR>
Correct Choice: <B><%=CorrectChoice%></B><BR><BR>
Justification: <%=Justification%><BR><BR>

<B><U>Edit Question:</U></B><BR><BR>
<form method="post" action="./writequesCSI_Sample1.asp">
<p>Question # : <input type="text" Name="quesno" size="4" value="<%=QuesNo%>"><BR><BR>
<input type="hidden" Name="pmpno" size="2">
<p>Question Scenario: <textarea name="questiondesc" rows="6" cols="100"><%=questionDesc%></textarea><BR><BR>
<p>Question : <textarea name="question" rows="6" cols="100"><%=question%></textarea><BR><BR>

<p>Choice A: <textarea name="choicevalue1" rows="6" cols="100"><%=choicevalue1%></textarea><BR><BR>
<p>Choice Rate A: <input type="text" Name="ChoiceRate1" size="1" value="<%=ChoiceRate1%>"><BR><BR>

<p>Choice B: <textarea name="choicevalue2" rows="6" cols="100"><%=choicevalue2%></textarea><BR><BR>
<p>Choice Rate B: <input type="text" Name="ChoiceRate2" size="1" value="<%=ChoiceRate2%>"><BR><BR>

<p>Choice C: <textarea name="choicevalue3" rows="6" cols="100"><%=choicevalue3%></textarea><BR><BR>
<p>Choice Rate C: <input type="text" Name="ChoiceRate3" size="1" value="<%=ChoiceRate3%>"><BR><BR>

<p>Choice D: <textarea name="choicevalue4" rows="6" cols="100"><%=choicevalue4%></textarea><BR><BR>
<p>Choice Rate D: <input type="text" Name="ChoiceRate4" size="1" value="<%=ChoiceRate4%>"><BR><BR>

<p>Correct Choice : <input type="text" Name="correctchoice" size="1" value="<%=Correctchoice%>"><BR><BR>
<p>Justification: <textarea name="justification" rows="5" cols="100"><%=Justification%></textarea><BR><BR>
<% if(addoredit="add") Then%>
<input type="hidden" Name="addoredit" value="add">
<%Else%>
<input type="hidden" Name="addoredit" value="edit">
<%End If%>
addoredit=<%=addoredit%>

<p><input type="Submit" Name="submitvalue" Value="UpdateinDatabase">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="Submit" Name="submitvalue" Value="PreviewInformation"></form><BR><BR></form>

<%
' PreviewInformation Ends ---------------------------------------------------------------------------

Case "UpdateinDatabase"

' UpdateInformation Begins ---------------------------------------------------------------------------
%>

<P align="center"><B>View/Edit/Add given question:</B><BR><BR></P>
Information updated in database<B><U>View Question:</U></B>&nbsp;&nbsp;&nbsp;<B><a href="./writequesCSI_Sample1.asp">Home Page</A></B>
<%
QuesNo=Request.Form("QuesNo")
KNo=Request.Form("KNo")
QuesNoPrev=int(QuesNo)-1%>
<input type="hidden" name="QuesNo" value="<%=QuesNoPrev%>">
<input type="hidden" name="submitvalue" value="Initialize">
<input type="Submit" Value="Previous Question">
</form>
<form method="post" action="./writequesCSI_Sample1.asp">
<%QuesNoNext=int(QuesNo)+1%>
<input type="hidden" name="QuesNo" value="<%=QuesNoNext%>">
<input type="hidden" name="submitvalue" value="Initialize">
<input type="Submit" Value="Next Question">
</form>

<%

QuestionDesc=Replace(Request.Form("QuestionDesc"),"'","''")
Question=Replace(Request.Form("Question"),"'","''")
ChoiceValue1=Replace(Request.Form("ChoiceValue1"),"'","''")
ChoiceRate1=Replace(Request.Form("ChoiceRate1"),"'","''")

ChoiceValue2=Replace(Request.Form("ChoiceValue2"),"'","''")
ChoiceRate2=Replace(Request.Form("ChoiceRate2"),"'","''")
ChoiceValue3=Replace(Request.Form("ChoiceValue3"),"'","''")
ChoiceRate3=Replace(Request.Form("ChoiceRate3"),"'","''")
ChoiceValue4=Replace(Request.Form("ChoiceValue4"),"'","''")
ChoiceRate4=Replace(Request.Form("ChoiceRate4"),"'","''")
Justification=Replace(Request.Form("Justification"),"'","''")
CorrectChoice=Request.Form("CorrectChoice")
addoredit=Request.Form("addoredit")
%>
AddorEdit=<%=addoredit%>
<% addvalue="add"

'Set connObj=Server.CreateObject("ADODB.Connection")
'ConnObj.Open "PROVIDER=SQLOLEDB;DATA SOURCE=SQL5.ZNETINDIA.NET;UID=PROJstudy_789;PWD=asdfgasdfg;DATABASE=PROJstudy"
'connObj.Open "PROVIDER=SQLOLEDB;DATA SOURCE=SEKHAR;UID=sa;PWD=;DATABASE=PROJstudy"
choice1="A"
choice2="B"
choice3="C"
choice4="D"

if(addoredit=addvalue) Then
Response.Write("I am in Add")
connObj.Execute "INSERT INTO Question_CSIsample1 (QuestionNo, QuestionDesc, Question, CorrectChoice, Justification) VALUES ('"&quesno&"','"&questiondesc&"','"&question&"','"&correctchoice&"','"&justification&"')"
connObj.Execute "INSERT INTO Choice_CSIsample1(QuestionNo, ChoiceNumber,ChoiceValue,ChoiceRate) VALUES ('"&quesno&"','"&choice1&"','"&choicevalue1&"','"&ChoiceRate1&"')"
connObj.Execute "INSERT INTO Choice_CSIsample1(QuestionNo, ChoiceNumber,ChoiceValue,ChoiceRate) VALUES ('"&quesno&"','"&choice2&"','"&choicevalue2&"','"&ChoiceRate2&"')"
connObj.Execute "INSERT INTO Choice_CSIsample1(QuestionNo, ChoiceNumber,ChoiceValue,ChoiceRate) VALUES ('"&quesno&"','"&choice3&"','"&choicevalue3&"','"&ChoiceRate3&"')"
connObj.Execute "INSERT INTO Choice_CSIsample1(QuestionNo, ChoiceNumber,ChoiceValue,ChoiceRate) VALUES ('"&quesno&"','"&choice4&"','"&choicevalue4&"','"&ChoiceRate4&"')"
addoredit="edit"
else
Response.Write("I am in Edit")
connObj.Execute "update Question_CSIsample1 Set QuestionDesc='"&questionDesc&"', Question='"&question&"', Justification='"&Justification&"', CorrectChoice='"&CorrectChoice&"' Where QuestionNo='"&quesno&"'"
connObj.Execute "update Choice_CSIsample1 Set ChoiceValue='"&ChoiceValue1&"' , ChoiceRate='"&ChoiceRate1&"' Where  questionno='"&quesno&"' and ChoiceNumber='"&choice1&"'"
connObj.Execute "update Choice_CSIsample1 Set ChoiceValue='"&ChoiceValue2&"' , ChoiceRate='"&ChoiceRate2&"' Where  questionno='"&quesno&"' and ChoiceNumber='"&choice2&"'"
connObj.Execute "update Choice_CSIsample1 Set ChoiceValue='"&ChoiceValue3&"' , ChoiceRate='"&ChoiceRate3&"' Where  questionno='"&quesno&"' and ChoiceNumber='"&choice3&"'"
connObj.Execute "update Choice_CSIsample1 Set ChoiceValue='"&ChoiceValue4&"' , ChoiceRate='"&ChoiceRate4&"' Where questionno='"&quesno&"' and ChoiceNumber='"&choice4&"'"


end if
'connObj.Close
'Set connObj=Nothing%>


<B>Ques <%=QuesNo%> : <%=QuestionDesc%></B><BR><%=Question%><BR>
<OL type="A">
<LI><%=ChoiceValue1%><BR>
<%=ChoiceRate1%><BR>
</LI>
<LI><%=ChoiceValue2%><BR><%=ChoiceRate2%><BR>
</LI>
<LI><%=ChoiceValue3%><BR><%=ChoiceRate3%><BR>
</LI>
<LI><%=ChoiceValue4%><BR><%=ChoiceRate4%><BR>
</LI>
</OL><BR>
Correct Choice: <B><%=CorrectChoice%></B><BR><BR>
Justification: <%=Justification%><BR><BR>

<B><U>Edit Question:</U></B><BR><BR>
<form method="post" action="./writequesCSI_Sample1.asp">
<p>Question # : <input type="text" Name="quesno" size="4" value="<%=QuesNo%>"><BR><BR>
<input type="hidden" Name="pmpno" size="2">
<p>Question Scenario: <textarea name="questiondesc" rows="6" cols="100"><%=questionDesc%></textarea><BR><BR>
<p>Question : <textarea name="question" rows="6" cols="100"><%=question%></textarea><BR><BR>
<p>Choice A: <textarea name="choicevalue1" rows="6" cols="100"><%=choicevalue1%></textarea><BR><BR>
<p>Choice Rate A: <input type="text" Name="ChoiceRate1" size="1" value="<%=ChoiceRate1%>"><BR><BR>
<p>Choice B: <textarea name="choicevalue2" rows="6" cols="100"><%=choicevalue2%></textarea><BR><BR>
<p>Choice Rate B: <input type="text" Name="ChoiceRate2" size="1" value="<%=ChoiceRate2%>"><BR><BR>

<p>Choice C: <textarea name="choicevalue3" rows="6" cols="100"><%=choicevalue3%></textarea><BR><BR>
<p>Choice Rate C: <input type="text" Name="ChoiceRate3" size="1" value="<%=ChoiceRate3%>"><BR><BR>

<p>Choice D: <textarea name="choicevalue4" rows="6" cols="100"><%=choicevalue4%></textarea><BR><BR>
<p>Choice Rate D: <input type="text" Name="ChoiceRate4" size="1" value="<%=ChoiceRate4%>"><BR><BR>
<p>Correct Choice : <input type="text" Name="correctchoice" size="1" value="<%=Correctchoice%>"><BR><BR>
<p>Justification: <textarea name="justification" rows="5" cols="100"><%=Justification%></textarea><BR><BR>

<% if(addoredit="add") Then%>
<input type="hidden" Name="addoredit" value="add">
<%Else%>
<input type="hidden" Name="addoredit" value="edit">
<%End If%>

<p><!--<input type="Submit" Name="submitvalue" Value="DeleteQuestion">&nbsp;&nbsp;&nbsp;&nbsp;-->
<input type="Submit" Name="submitvalue" Value="UpdateinDatabase">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="Submit" Name="submitvalue" Value="PreviewInformation"></form><BR><BR></form>

<%
' UpdateInformation Ends ---------------------------------------------------------------------------
Case "DeleteQuestion"
' DeleteInformation Begins ---------------------------------------------------------------------------

%>

<P align="center"><B>View/Edit/Add given question:</B><BR><BR></P>
<%QuesNo=Request.Form("QuesNo")%>
Question <%=QuesNo%> deleted from database<B><U>View Question:</U></B><form method="post" action="./writequesCSI_Sample1.asp">
<%
QuesNoPrev=int(QuesNo)-1%>
<input type="hidden" name="QuesNo" value="<%=QuesNoPrev%>">
<input type="hidden" name="submitvalue" value="Initialize">
<input type="Submit" Value="Previous Question">
</form>
<form method="post" action="./writequesCSI_Sample1.asp">
<%QuesNoNext=int(QuesNo)+1%>
<input type="hidden" name="QuesNo" value="<%=QuesNoNext%>">
<input type="hidden" name="submitvalue" value="Initialize">
<input type="Submit" Value="Next Question">
</form>


<% 
'Set connObj=Server.CreateObject("ADODB.Connection")
'ConnObj.Open "PROVIDER=SQLOLEDB;DATA SOURCE=SQL5.ZNETINDIA.NET;UID=PROJstudy_789;PWD=asdfgasdfg;DATABASE=PROJstudy"
'connObj.Open "PROVIDER=SQLOLEDB;DATA SOURCE=SEKHAR;UID=sa;PWD=;DATABASE=PROJstudy"


connObj.Execute "delete from Question_CSIsample1 Where  QuestionNo='"&quesno&"'"
connObj.Execute "delete from Choice_CSIsample1 Where  questionno='"&quesno&"'"

'connObj.Close
'Set connObj=Nothing%>


<%
' DeleteInformation Ends ---------------------------------------------------------------------------

Case Else

' Else begins ---------------------------------------------------------------------------
%>
<B>Enter/Edit question in Question Database</B>
<form method="post" action="./writequesCSI_Sample1.asp">
<p>Question # : <input type="text" Name="quesno" size="4"><BR><BR>
<input type="hidden" Name="submitValue" value="Initialize"><BR><BR>

<p><input type="submit" value="submit">    <input type="reset" value="clear form">
</form>
<%' Else ends ---------------------------------------------------------------------------
End Select%>
<BR><BR>

 <%Else
  
  Response.Redirect("/access_CSIsample1.asp")
  
End If%>

<!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>
