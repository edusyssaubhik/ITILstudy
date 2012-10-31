<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<% If Session("FirstName") = "" Then 
response.Redirect("/memberlogin.asp")
Else
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<TITLE>ITILstudy</TITLE>
<link rel="stylesheet" href="/css/style.css" type="text/css">
<script language ="javascript">

function ExitAlert() {
  
var r=confirm("Are you sure you want quit the evaluation test?");
	
	if (r==true) {
		top.location.href='/Foundation/pdusindex.asp';
	}
	else {
		return false;
	}
}

</script>
</HEAD>
<BODY>
<font="arial" size="3">
<!--#include virtual="/includes/connection.asp"-->
<%
Dim rsQues
Dim nCur, AnsValue,nCurNo,AnsValueNo,KNo,Submit
Dim sArray
iCount = 0

ReDim sArray(10,1,1)


nCur=Request.Form("nCur")
AnsValue=Request.Form("AnsValue")

AnsValueNo=int(AnsValue)
KNo=Request.Form("KNo")
Submit=Request.Form("Submit")

nCurNo=int(nCur)

sArray=Session("PDUArray")

If(nCurNo>-1) and AnsValueNo <> 0 then
	sArray(nCurNo,0,1)=AnsValueNo
else
end if

If (Submit="View All Answers") then%>

<table width="40%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" class="TableRowOdd"><span class="HeaderLarge">Question </span></td>
        <td class="TableRowOdd"><span class="HeaderLarge">Selected Answer</span></td>
        <td class="TableRowOdd">&nbsp;</td>
      </tr>
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
      <td class="<% = bgColor %>"><%=nCurNo+1%></td>
      <td align="center" class="<% = bgColor %>"><% If sArray(nCurNo,0,1) <> "" Then %><%=sArray(nCurNo,0,1)%><% Else %>&nbsp;<% End If %></td>
      <form method="post" action="/ITIL-CSI/pduquesget1.asp">
        <td align="center" class="<% = bgColor %>"><INPUT TYPE="HIDDEN" NAME="KNo" VALUE='<%=KNo%>'>
          <input type="hidden" Name="nCur" value="<%=nCurNo%>">
          <input type="submit" Name="Submit" value="Go to Question" class="ButtonGeneral">
        </td>
        </tr>
        
      </form>
      <%
		iCount = iCount + 1
		Next%>
      <tr>
        <td colspan="4" class="TableRowEven">&nbsp;</td>
      </tr>
    </table>
    <FORM METHOD="POST" ACTION="/ITIL-CSI/pduquesget2.asp">
      <table width="400" border="0" cellspacing="0" cellpadding="8">
        <tr>
          <td valign="middle" class="PopupCost">After completing all the answers, Please click on Evaluate the Answers button</td>
        </tr>
        <INPUT TYPE="HIDDEN" NAME="KNo" VALUE='<%=KNo%>'>
        <input type="hidden" Name="nCur" value="<%=nCurNo%>">
        <tr>
          <td><input type="submit" Name="Submit" value="Evaluate the Answers" class="ButtonGeneral"></td>
        </tr>
      </table>
    </form>
    <%Session("PDUArray")=sArray%>
    <%else

		If (Submit="Please click here to continue") then
			nCurNo=nCurNo+1
		else
		end if
		
		If (Submit="Next Question") then
			nCurNo=nCurNo+1
		else
		end if
		
		If (Submit="Previous Question") then
			nCurNo=nCurNo-1
		else
		end if
		
		
		If (nCurNo<10) then
		
		Set rsQues = Server.CreateObject("ADODB.Recordset")
		rsQues.ActiveConnection = ConnObj
		
		rsQues.Open "SELECT Question_CSIDB.QuestionDesc, Question_CSIDB.ExhibitURL ,Choice_CSIDB.ChoiceNumber, Choice_CSIDB.ChoiceValue from Question_CSIDB, Choice_CSIDB WHERE Question_CSIDB.KNo='"&KNo&"' and Choice_CSIDB.KNo='"&KNo&"' and Question_CSIDB.QuestionNo='"&sArray(nCurNo,0,0)&"' and Question_CSIDB.QuestionNo=Choice_CSIDB.QuestionNo Order by Choice_CSIDB.ChoiceNumber"
		
		If Not rsQues.BOF Then
	
	%>
    <FORM METHOD="POST" ACTION="/ITIL-CSI/pduquesget1.asp">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="TableTest">
      <tr>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" colspan="2"><%Ques = rsQues("QuestionDesc")%>
                <p><span class="HeaderLarge">Question <%=nCurNo+1%>:</span></p>
                <p class="PopupSubHeader"> <%=Ques%><br />
                  <br />
                </p></td>
            </tr>
            <tr>
              <td height="30" width="4%"><%ChoiceNumber1=rsQues("ChoiceNumber")
		ChoiceValue1=rsQues("ChoiceValue")%>
                <INPUT TYPE="radio" NAME="AnsValue" VALUE="<%=ChoiceNumber1%>"></td>
              <td><span class="PopupSubHeader"><%=ChoiceValue1%> </span>
                <INPUT TYPE="HIDDEN" NAME="ChoiceNumber1" VALUE='<%=ChoiceNumber1%>'>
                <%rsQues.MoveNext%>
              </td>
            </tr>
            <tr>
              <td height="30"><%ChoiceNumber2=rsQues("ChoiceNumber")
		ChoiceValue2=rsQues("ChoiceValue")%>
                <INPUT TYPE="radio" NAME="AnsValue" VALUE="<%=ChoiceNumber2%>"></td>
              <td><span class="PopupSubHeader"><%=ChoiceValue2%> </span>
                <INPUT TYPE="HIDDEN" NAME="ChoiceNumber2" VALUE='<%=ChoiceNumber2%>'>
                <%rsQues.MoveNext%>
              </td>
            </tr>
            <tr>
              <td height="30"><%ChoiceNumber3=rsQues("ChoiceNumber")
		ChoiceValue3=rsQues("ChoiceValue")%>
                <INPUT TYPE="radio" NAME="AnsValue" VALUE="<%=ChoiceNumber3%>"></td>
              <td><span class="PopupSubHeader"><%=ChoiceValue3%></span>
                <INPUT TYPE="HIDDEN" NAME="ChoiceNumber3" VALUE='<%=ChoiceNumber3%>'>
                <%rsQues.MoveNext%>
              </td>
            </tr>
            <tr>
              <td height="30"><%ChoiceNumber4=rsQues("ChoiceNumber")
		ChoiceValue4=rsQues("ChoiceValue")%>
                <INPUT TYPE="radio" NAME="AnsValue" VALUE="<%=ChoiceNumber4%>"></td>
              <td><span class="PopupSubHeader"><%=ChoiceValue4%></span>
                <INPUT TYPE="HIDDEN" NAME="ChoiceNumber4" VALUE='<%=ChoiceNumber4%>'>
                <INPUT TYPE="HIDDEN" NAME="KNo" VALUE='<%=KNo%>'>
                <input type="hidden" Name="nCur" value="<%=nCurNo%>">
              </td>
            </tr>
            <tr>
              <td colspan = "2">&nbsp;</td>
            </tr>
            <tr>
              <td height="84" colspan="2" class="TableRowOdd"><div align="left"><span class="PopupCopy">
                  <% if (nCurNo>0) then%>
                  <input type="submit" Name="Submit" value="Previous Question" class="ButtonTestGeneral">
                  <%else
        end if%>
                  <input type="submit" Name="Submit" value="Next Question" class="ButtonTestGeneral">
                  <input type="submit" Name="Submit" value="View All Answers" class="ButtonTestGeneral">
                  <a href="/ITIL-CSI/pdusindex.asp" onclick="return ExitAlert(this.href);"><input type="button" class="ButtonTest" value="Exit" /></a>
                  </span></td>
            </tr>
          </table>
    </form>
    <%
Set rsQues = Nothing
%>
    <%Else

%>
    There are no questions
     <a href="/ITIL-CSI/pdusindex.asp"><input type="button" class="ButtonTest" value="Exit" /></a>
    <%End If
%>
    <%Session("PDUArray")=sArray
%>
    <%else%>
	<table width="40%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" class="TableRowOdd"><span class="HeaderLarge">Question </span></td>
            <td class="TableRowOdd"><span class="HeaderLarge">Selected Answer</span></td>
            <td class="TableRowOdd">&nbsp;</td>
          </tr>
          <%for nCurNo=0 to 9%>
          <% 
			   'Displaying Only ODD Color'
			 If Eval(iCount\2 = iCount/2) Then 
			   
			   		bgColor = "TableRowEven"
			 Else 
			 
			   		bgColor = "TableRowOdd"
								 
			 End If 
		%>
          <td class="<% = bgColor %>"><%=nCurNo+1%></td>
          <td class="<% = bgColor %>"><% If sArray(nCurNo,0,1) <> "" Then %><%=sArray(nCurNo,0,1)%><% Else %>&nbsp;<% End If %></td>
            <form method="post" action="/ITIL-CSI/pduquesget1.asp">
              <td class="<% = bgColor %>"><INPUT TYPE="HIDDEN" NAME="KNo" VALUE='<%=KNo%>'>
                <input type="hidden" Name="nCur" value="<%=nCurNo%>">
                <input type="submit" Name="Submit" value="Go to Question" class="ButtonGeneral">
              </td>
              </tr>
            </form>
            <%
		iCount = iCount + 1
		Next%>
          <tr>
            <td colspan="4" class="TableRowEven">&nbsp;</td>
          </tr>
        </table>
        <FORM METHOD="POST" ACTION="/ITIL-CSI/pduquesget2.asp">
          <table width="300" border="0" cellspacing="0" cellpadding="5">
            <tr>
              <td valign="middle" class="PopupCost">Please Review the Answers:</td>
            </tr>
            <INPUT TYPE="HIDDEN" NAME="KNo" VALUE='<%=KNo%>'>
            <input type="hidden" Name="nCur" value="<%=nCurNo%>">
            <tr>
              <td><input type="submit" Name="Submit" value="Evaluate "></td>
            </tr>
          </table>
        </form>
        <%Session("PDUArray")=sArray%>
        <%end if%>
        <%end if%>
        <!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>
<% End If %>