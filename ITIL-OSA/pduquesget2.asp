<% If Session("FirstName") = "" Then 
response.Redirect("/memberlogin.asp")
Else
%>
<HTML>
<HEAD>
<TITLE>ITILstudy</TITLE>
<link rel="stylesheet" href="/css/style.css" type="text/css">
<META http-equiv=Content-type content="text/html; charset=ISO-8859-1">
</HEAD>
<BODY><font="arial" size="3">
<%
Dim KNo, quesCorrect
Dim sArray
iCount = 0
ReDim sArray(9,1,1) 

quesCorrect=0
sArray=Session("PDUArray")
KNo=Request.Form("KNo")%>

<table width="600" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td width="20%" class="TableRowOdd"><B>Question #</B></td>
	<td width="20%" class="TableRowOdd"><B>Selected Answer</B></td>
	<td width="20%" class="TableRowOdd"><B>Correct Answer</B></td>
	<td width="20%" class="TableRowOdd"><B>Answer Status</B></td>
	<!--<td width="20%" class="TableRowOdd"><B>Answer Justification</B></td></tr>-->
<%for nCurNo=0 to 9%>
<tr>
<% 
   'Displaying Only ODD Color'
 If Eval(iCount\2 = iCount/2) Then 
   
		bgColor = "TableRowEven"
 Else 
 
		bgColor = "TableRowOdd"
					 
 End If 
%>  
	<td class="<% = bgColor %>"><B><%=nCurNo+1%></B></td>
	<td class="<% = bgColor %>"><% If sArray(nCurNo,0,1) <> "" Then %><B><%=sArray(nCurNo,0,1)%></B><% Else %>&nbsp;<% End If %></td>
	<td class="<% = bgColor %>"> <B><%=sArray(nCurNo,1,0)%></B></td>
	<td class="<% = bgColor %>"> <B>
		<% if (int(sArray(nCurNo,1,0))=int(sArray(nCurNo,0,1))) then
			quesCorrect=quesCorrect+1%>
			<span><img src="/images/buttons/right.gif" alt="Correct"></span>
		<% else %>
			<span><img src="/images/buttons/wrong.gif" alt="Wrong"></span>
		<% end if%>
	</td>
	<!--<form method="post" action="/Foundation/pduquesget3.asp">
	<td class="<% = bgColor %>">
        <INPUT TYPE="HIDDEN" NAME="KNo" VALUE='<%=KNo%>'>
        <input type="hidden" Name="nCur" value='<%=nCurNo%>'>
        <input type="submit" Name="Submit" value="View Details" class="ButtonGeneral">
    </td>
    </form>-->
   </tr>

<%
iCount = iCount + 1
Next%>
  <tr>
    <td colspan="5" class="TableRowEven">&nbsp;</td>
  </tr>
</table>
<p class="general-body">
<% if (quesCorrect>=6) then%>
	<font color="green"> Congrats!!! You have answered <%=quesCorrect%> Questions (i.e. <%=int(quesCorrect/10*100)%> % )correctly. <BR><BR>
	<FORM METHOD="POST" ACTION="/ITIL-OSA/pduquesget4.asp">
<INPUT TYPE="HIDDEN" NAME="KNo" VALUE='<%=KNo%>'></font>
<span class="Header">Please <input type="submit" Name="Submit" value="Click here"> to continue.</span></form>
<BR>
For any questions, <A href="/contactus.asp">Please contact ITILstudy</A>
<% else%>
	<font color="red"> Sorry - You have answered <%=quesCorrect%> Questions (i.e. <%=int(quesCorrect/10*100)%> % )correctly. <BR><BR>
	To pass in the evaluation test on this chapter, you should correctly answer 6 out of 10 questions (i.e. 60%).</font><BR><BR><B>Please review the answers and <a href="./pdusindex.asp">Take the Evaluation Test again</A></B>.
<% end if%>	
</p>
<BR><BR>	
</body>
</html>
<% End If %>
