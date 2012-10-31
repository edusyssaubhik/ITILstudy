<HTML>
<HEAD>
</HEAD>
<BODY>
<!--#include virtual="/includes/connection.asp"-->

<%

submitvalue=Request.Form("submitvalue")


Select Case submitvalue

Case "Initialize"%>

<%' Initialize begins ---------------------------------------------------------------------------

Set rsQues = Server.CreateObject("ADODB.Recordset")
rsQues.ActiveConnection = connObj
Kno=Request.Form("kno")
Quesno=Request.Form("quesno")
rsQues.Open "SELECT Questiondb.QuestionDesc, Questiondb.CorrectChoice, Questiondb.Justification, Questiondb.ExhibitURL ,choicedb.ChoiceNumber, choicedb.ChoiceValue from Questiondb, choicedb WHERE Questiondb.KNo='"&KNo&"' and choicedb.KNo='"&KNo&"' and Questiondb.QuestionNo='"&QuesNo&"' and Questiondb.QuestionNo=choicedb.QuestionNo ORDER by choicedb.ChoiceNumber"
If Not rsQues.BOF Then%>
<P align="center"><B>View/Edit/Add given question:</B><BR><BR></P>
<B><U>View Question:</U></B>&nbsp;&nbsp;&nbsp;<B><a href="./writeques.asp">Home Page</A></B>
<form method="post" action="./writeques.asp">
<%QuesNoPrev=int(QuesNo)-1%>
<input type="hidden" name="QuesNo" value="<%=QuesNoPrev%>">
<input type="hidden" name="Kno" value="<%=KNo%>">
<input type="hidden" name="submitvalue" value="Initialize">
<input type="Submit" Value="Previous Question">
</form>
<form method="post" action="./writeques.asp">
<%QuesNoNext=int(QuesNo)+1%>
<input type="hidden" name="QuesNo" value="<%=QuesNoNext%>">
<input type="hidden" name="Kno" value="<%=KNo%>">
<input type="hidden" name="submitvalue" value="Initialize">
<input type="Submit" Value="Next Question">
</form>

<%QuestionDesc=rsQues("QuestionDesc")
ChoiceValue1=rsQues("ChoiceValue")
rsQues.MoveNext
ChoiceValue2=rsQues("ChoiceValue")
rsQues.MoveNext
ChoiceValue3=rsQues("ChoiceValue")
rsQues.MoveNext
ChoiceValue4=rsQues("ChoiceValue")
Justification=rsQues("Justification")
CorrectChoice=rsQues("CorrectChoice")
%>
<B>Ques <%=Quesno%> (KNo = <%=Kno%>): <%=QuestionDesc%></B><BR><BR>
<OL>
<LI><%=ChoiceValue1%><BR></LI>
<LI><%=ChoiceValue2%><BR></LI>
<LI><%=ChoiceValue3%><BR></LI>
<LI><%=ChoiceValue4%><BR></LI>
</OL><BR>
Correct Choice: <B><%=CorrectChoice%></B><BR><BR>
Justification: <%=Justification%><BR><BR>

<B><U>Edit Question:</U></B><BR><BR>
<form method="post" action="./writeques.asp">
<p>Question # : <input type="text" Name="quesno" size="4" value="<%=quesno%>"><BR><BR>
<p>KNO : <input type="text" Name="kno" size="2" value="<%=kno%>"><BR><BR>
<input type="hidden" Name="pmpno" size="2">
<p>Question Desc: <textarea name="questiondesc" rows="6" cols="100"><%=questionDesc%></textarea><BR><BR>
<p>Choice 1: <textarea name="choicevalue1" rows="6" cols="100"><%=choicevalue1%></textarea><BR><BR>
<p>Choice 2: <textarea name="choicevalue2" rows="6" cols="100"><%=choicevalue2%></textarea><BR><BR>
<p>Choice 3: <textarea name="choicevalue3" rows="6" cols="100"><%=choicevalue3%></textarea><BR><BR>
<p>Choice 4: <textarea name="choicevalue4" rows="6" cols="100"><%=choicevalue4%></textarea><BR><BR>
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
<form method="post" action="./writeques.asp">
<p>Question # : <input type="text" Name="quesno" size="4" value="<%=Request.Form("quesno")%>"><BR><BR>
<p>KNO : <input type="text" Name="kno" size="2" value="<%=Request.Form("kno")%>"><BR><BR>
<input type="hidden" Name="pmpno" size="2">
<p>Question Desc: <textarea name="questiondesc" rows="6" cols="100"></textarea><BR><BR>
<p>Choice 1: <textarea name="ChoiceValue1" rows="6" cols="100"></textarea><BR><BR>
<p>Choice 2: <textarea name="ChoiceValue2" rows="6" cols="100"></textarea><BR><BR>
<p>Choice 3: <textarea name="ChoiceValue3" rows="6" cols="100"></textarea><BR><BR>
<p>Choice 4: <textarea name="ChoiceValue4" rows="6" cols="100"></textarea><BR><BR>
<p>Correct Choice : <input type="text" Name="correctchoice" size="1"><BR><BR>
<p>Justification: <textarea name="justification" rows="10" cols="100"></textarea><BR><BR>
<p>Reference: <SELECT NAME="Reference">

	<Option VALUE='<BR><BR>Reference: ITILstudy.com notes as mentioned above' SELECTED> ITILstudy.com notes as mentioned above


</SELECT>-->

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
<B><U>View Question:</U></B>&nbsp;&nbsp;&nbsp;<B><a href="./writeques.asp">Home Page</A></B>
<%
QuesNo=Request.Form("QuesNo")
KNo=Request.Form("KNo")
QuesNoPrev=int(QuesNo)-1%>
<input type="hidden" name="QuesNo" value="<%=QuesNoPrev%>">
<input type="hidden" name="Kno" value="<%=KNo%>">
<input type="hidden" name="submitvalue" value="Initialize">
<input type="Submit" Value="Previous Question">
</form>
<form method="post" action="./writeques.asp">
<%QuesNoNext=int(QuesNo)+1%>
<input type="hidden" name="QuesNo" value="<%=QuesNoNext%>">
<input type="hidden" name="Kno" value="<%=KNo%>">
<input type="hidden" name="submitvalue" value="Initialize">
<input type="Submit" Value="Next Question">
</form>

<%



QuestionDesc=Replace(Request.Form("QuestionDesc"),"'","''")
ChoiceValue1=Replace(Request.Form("ChoiceValue1"),"'","''")
ChoiceValue2=Replace(Request.Form("ChoiceValue2"),"'","''")
ChoiceValue3=Replace(Request.Form("ChoiceValue3"),"'","''")
ChoiceValue4=Replace(Request.Form("ChoiceValue4"),"'","''")
CorrectChoice=Request.Form("CorrectChoice")
addoredit=Request.Form("addoredit")
If(addoredit="add") Then
Justification=Replace(Request.Form("Justification"),"'","''")&" "&Request.Form("Reference")&""&Request.Form("pageno")&"<BR><BR>"&Request.Form("comments")

Else
Justification=Replace(Request.Form("Justification"),"'","''")
End If
%>
<B>Ques <%=QuesNo%> (KNo = <%=Kno%>): <%=QuestionDesc%></B><BR><BR>
<OL>
<LI><%=ChoiceValue1%><BR></LI>
<LI><%=ChoiceValue2%><BR></LI>
<LI><%=ChoiceValue3%><BR></LI>
<LI><%=ChoiceValue4%><BR></LI>
</OL><BR>
Correct Choice: <B><%=CorrectChoice%></B><BR><BR>
Justification: <%=Justification%><BR><BR>

<B><U>Edit Question:</U></B><BR><BR>
<form method="post" action="./writeques.asp">
<p>Question # : <input type="text" Name="quesno" size="4" value="<%=QuesNo%>"><BR><BR>
<p>KNO : <input type="text" Name="kno" size="2" value="<%=kno%>"><BR><BR>
<input type="hidden" Name="pmpno" size="2">
<p>Question Desc: <textarea name="questiondesc" rows="6" cols="100"><%=questionDesc%></textarea><BR><BR>
<p>Choice 1: <textarea name="choicevalue1" rows="6" cols="100"><%=choicevalue1%></textarea><BR><BR>
<p>Choice 2: <textarea name="choicevalue2" rows="6" cols="100"><%=choicevalue2%></textarea><BR><BR>
<p>Choice 3: <textarea name="choicevalue3" rows="6" cols="100"><%=choicevalue3%></textarea><BR><BR>
<p>Choice 4: <textarea name="choicevalue4" rows="6" cols="100"><%=choicevalue4%></textarea><BR><BR>
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
Information updated in database<B><U>View Question:</U></B>&nbsp;&nbsp;&nbsp;<B><a href="./writeques.asp">Home Page</A></B>
<%
QuesNo=Request.Form("QuesNo")
KNo=Request.Form("KNo")
QuesNoPrev=int(QuesNo)-1%>
<input type="hidden" name="QuesNo" value="<%=QuesNoPrev%>">
<input type="hidden" name="Kno" value="<%=KNo%>">
<input type="hidden" name="submitvalue" value="Initialize">
<input type="Submit" Value="Previous Question">
</form>
<form method="post" action="./writeques.asp">
<%QuesNoNext=int(QuesNo)+1%>
<input type="hidden" name="QuesNo" value="<%=QuesNoNext%>">
<input type="hidden" name="Kno" value="<%=KNo%>">
<input type="hidden" name="submitvalue" value="Initialize">
<input type="Submit" Value="Next Question">
</form>

<%

QuestionDesc=Replace(Request.Form("QuestionDesc"),"'","''")
ChoiceValue1=Replace(Request.Form("ChoiceValue1"),"'","''")
ChoiceValue2=Replace(Request.Form("ChoiceValue2"),"'","''")
ChoiceValue3=Replace(Request.Form("ChoiceValue3"),"'","''")
ChoiceValue4=Replace(Request.Form("ChoiceValue4"),"'","''")
Justification=Replace(Request.Form("Justification"),"'","''")
CorrectChoice=Request.Form("CorrectChoice")
addoredit=Request.Form("addoredit")
%>
AddorEdit=<%=addoredit%>
<% addvalue="add"

'Set connObj=Server.CreateObject("ADODB.Connection")
'ConnObj.Open "PROVIDER=SQLOLEDB;DATA SOURCE=SQL5.ZNETINDIA.NET;UID=PROJstudy_789;PWD=asdfgasdfg;DATABASE=PROJstudy"
'connObj.Open "PROVIDER=SQLOLEDB;DATA SOURCE=SEKHAR;UID=sa;PWD=;DATABASE=PROJstudy"
choice1=1
choice2=2
choice3=3
choice4=4

if(addoredit=addvalue) Then
Response.Write("I am in Add")
connObj.Execute "INSERT INTO Questiondb (QuestionNo, KNo, QuestionDesc, CorrectChoice, Justification) VALUES ('"&quesno&"','"&kno&"','"&questiondesc&"','"&correctchoice&"','"&justification&"')"
connObj.Execute "INSERT INTO choicedb(QuestionNo, ChoiceNumber,ChoiceValue,KNo) VALUES ('"&quesno&"','"&choice1&"','"&choicevalue1&"','"&kno&"')"
connObj.Execute "INSERT INTO choicedb(QuestionNo, ChoiceNumber,ChoiceValue,KNo) VALUES ('"&quesno&"','"&choice2&"','"&choicevalue2&"','"&kno&"')"
connObj.Execute "INSERT INTO choicedb(QuestionNo, ChoiceNumber,ChoiceValue,KNo) VALUES ('"&quesno&"','"&choice3&"','"&choicevalue3&"','"&kno&"')"
connObj.Execute "INSERT INTO choicedb(QuestionNo, ChoiceNumber,ChoiceValue,KNo) VALUES ('"&quesno&"','"&choice4&"','"&choicevalue4&"','"&kno&"')"
addoredit="edit"
else
Response.Write("I am in Edit")
connObj.Execute "update Questiondb Set QuestionDesc='"&questionDesc&"', Justification='"&Justification&"', CorrectChoice='"&CorrectChoice&"' Where kno='"&kno&"' and QuestionNo='"&quesno&"'"
connObj.Execute "update choicedb Set ChoiceValue='"&ChoiceValue1&"' Where kno='"&kno&"' and questionno='"&quesno&"' and ChoiceNumber='"&choice1&"'"
connObj.Execute "update choicedb Set ChoiceValue='"&ChoiceValue2&"' Where kno='"&kno&"' and questionno='"&quesno&"' and ChoiceNumber='"&choice2&"'"
connObj.Execute "update choicedb Set ChoiceValue='"&ChoiceValue3&"' Where kno='"&kno&"' and questionno='"&quesno&"' and ChoiceNumber='"&choice3&"'"
connObj.Execute "update choicedb Set ChoiceValue='"&ChoiceValue4&"' Where kno='"&kno&"' and questionno='"&quesno&"' and ChoiceNumber='"&choice4&"'"

end if
'connObj.Close
'Set connObj=Nothing%>


<B>Ques <%=QuesNo%> (KNo = <%=Kno%>): <%=QuestionDesc%></B><BR><BR>
<OL>
<LI><%=ChoiceValue1%><BR></LI>
<LI><%=ChoiceValue2%><BR></LI>
<LI><%=ChoiceValue3%><BR></LI>
<LI><%=ChoiceValue4%><BR></LI>
</OL><BR>
Correct Choice: <B><%=CorrectChoice%></B><BR><BR>
Justification: <%=Justification%><BR><BR>

<B><U>Edit Question:</U></B><BR><BR>
<form method="post" action="./writeques.asp">
<p>Question # : <input type="text" Name="quesno" size="4" value="<%=QuesNo%>"><BR><BR>
<p>KNO : <input type="text" Name="kno" size="2" value="<%=kno%>"><BR><BR>
<input type="hidden" Name="pmpno" size="2">
<p>Question Desc: <textarea name="questiondesc" rows="6" cols="100"><%=questionDesc%></textarea><BR><BR>
<p>Choice 1: <textarea name="choicevalue1" rows="6" cols="100"><%=choicevalue1%></textarea><BR><BR>
<p>Choice 2: <textarea name="choicevalue2" rows="6" cols="100"><%=choicevalue2%></textarea><BR><BR>
<p>Choice 3: <textarea name="choicevalue3" rows="6" cols="100"><%=choicevalue3%></textarea><BR><BR>
<p>Choice 4: <textarea name="choicevalue4" rows="6" cols="100"><%=choicevalue4%></textarea><BR><BR>
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
Question <%=QuesNo%> deleted from database<B><U>View Question:</U></B><form method="post" action="./writeques.asp">
<%
KNo=Request.Form("KNo")
QuesNoPrev=int(QuesNo)-1%>
<input type="hidden" name="QuesNo" value="<%=QuesNoPrev%>">
<input type="hidden" name="Kno" value="<%=KNo%>">
<input type="hidden" name="submitvalue" value="Initialize">
<input type="Submit" Value="Previous Question">
</form>
<form method="post" action="./writeques.asp">
<%QuesNoNext=int(QuesNo)+1%>
<input type="hidden" name="QuesNo" value="<%=QuesNoNext%>">
<input type="hidden" name="Kno" value="<%=KNo%>">
<input type="hidden" name="submitvalue" value="Initialize">
<input type="Submit" Value="Next Question">
</form>


<% 
'Set connObj=Server.CreateObject("ADODB.Connection")
'ConnObj.Open "PROVIDER=SQLOLEDB;DATA SOURCE=SQL5.ZNETINDIA.NET;UID=PROJstudy_789;PWD=asdfgasdfg;DATABASE=PROJstudy"
'connObj.Open "PROVIDER=SQLOLEDB;DATA SOURCE=SEKHAR;UID=sa;PWD=;DATABASE=PROJstudy"


connObj.Execute "delete from Questiondb Where kno='"&kno&"' and QuestionNo='"&quesno&"'"
connObj.Execute "delete from choicedb Where kno='"&kno&"' and questionno='"&quesno&"'"

'connObj.Close
'Set connObj=Nothing%>


<%
' DeleteInformation Ends ---------------------------------------------------------------------------

Case Else

' Else begins ---------------------------------------------------------------------------
%>
<B>Enter/Edit question in Question Database</B>
<form method="post" action="./writeques.asp">
<p>Question # : <input type="text" Name="quesno" size="4"><BR><BR>
<p>KNO : <input type="text" Name="kno" size="2"><BR><BR>
<input type="hidden" Name="submitValue" value="Initialize"><BR><BR>

<p><input type="submit" value="submit">    <input type="reset" value="clear form">
</form>
<%' Else ends ---------------------------------------------------------------------------
End Select%>
<BR><BR>

<!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>
