<%Response.Buffer = True%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<% If Session("FirstName") = "" Then 
response.Redirect("/memberlogin.asp")
Else
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ITILstudy</title>
<link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<body>
<%
Dim KNo
Dim NoofQues
Dim QuesAsked
Dim QuesCorrect
Dim PercentCorrect
Dim SelectedChoice
Dim CorrectChoice
Dim Justification
Dim QuestionDesc
Dim StartQuesNo
Dim CountofQues
Dim ChoiceValue1, ChoiceValue2, ChoiceValue3, ChoiceValue4
Dim ChoiceNumber1, ChoiceNumber2,ChoiceNumber3,ChoiceNumber4
%>
<%
StartQuesNo=Request.form("StartQuesNo")
ChoiceValue1=Request.form("ChoiceValue1")
ChoiceValue2=Request.form("ChoiceValue2")
ChoiceValue3=Request.form("ChoiceValue3")
ChoiceValue4=Request.form("ChoiceValue4")

ChoiceNumber1=Request.form("ChoiceNumber1")
ChoiceNumber2=Request.form("ChoiceNumber2")
ChoiceNumber3=Request.form("ChoiceNumber3")
ChoiceNumber4=Request.form("ChoiceNumber4")

QuestionDesc=Request.form("QuestionDesc")

KNo=Request.form("KNo")
NoofQues=Request.form("NoofQues")
QuesAsked=Request.form("QuesAsked")
QuesCorrect=Request.form("QuesCorrect")
Justification=Request.form("Justification")
CorrectChoice=Request.form("CorrectChoice")
SelectedChoice=Request.form("SelectedChoice")
CountofQues=Request.form("CountofQues")
StartQuesNo=Request.form("StartQuesNo")
Relevance=Request.form("Relevance")

%>
<%'=Request.form("CountofQues")%>
<div>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="TableTest">
    <tr>
    <td>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30"><% If(SelectedChoice=CorrectChoice)Then %>
          <font color="green"> <b>Correct Answer !!!</b></font> <span style="margin-left:405px;"><b><%=Relevance%></b></span> </td>
      </tr>
      <tr>
        <td class="SubHeader"><b>Selected Choice: # <%=SelectedChoice%> </b><br>
          <b>Correct Answer: # <%=CorrectChoice%> </b> </td>
      </tr>
      <tr>
        <td class="PopupSubHeader"><%QuesCorrect=QuesCorrect+1%>
          <hr color=Maroon width="100%" align="center">
          <span class="HeaderLarge">Question: </span><span class="PopupSubHeader"><%=Request.form("QuestionDesc")%></span><br>
          <ol>
            <li> <%=Request.form("ChoiceValue1")%></li>
            <li> <%=Request.form("ChoiceValue2")%></li>
            <li> <%=Request.form("ChoiceValue3")%></li>
            <li> <%=Request.form("ChoiceValue4")%></li>
          </ol>
          <hr color=Maroon width="100%" align="center">
        </td>
      </tr>
      <tr>
        <td class="PopupSubHeader"><span class="HeaderLarge">Justification: </span><span class="PopupSubHeader"><%=Justification%> </span> </td>
      </tr>
      <tr>
      <td class="PopupSubHeader">
      <hr color=Maroon width="100%" align="center">
      Total No of Questions: <b><%=NoofQues%></b> <br>
      Questions Attempted : <b><%=CountofQues%></b> <br>
      Questions Answered Correctly: <b><%=QuesCorrect%></b><br>
      Percentage Correct(within 2 attempts): <b><%=Int((Int(QuesCorrect)*100)/Int(CountofQues))%> %</b> <br>
      <form method="POST" action="quessget.asp">
        <input type="hidden" name="QuesAsked" value='<%=QuesAsked%>'>
        <input type="hidden" name="QuestionDesc" value='<%=QuestionDesc%>'>
        <input type="hidden" name="QuesCorrect" value='<%=QuesCorrect%>'>
        <input type="hidden" name="NoofQues" value='<%=NoofQues%>'>
        <input type="hidden" name="StartQuesNo" value='<%=StartQuesNo%>'>
        <input type="hidden" name="Kno" value='<%=KNo%>'>
        <input type="hidden" name="CountofQues" value='<%=CountofQues%>'>
        <input type="hidden" name="Relevance" value='<%=Relevance%>'>
        <hr color=Maroon width="100%" align="center">
        </td>
        
        </tr>
       
        <tr>
          <td><input type="submit" value="Go to Next Question" class="ButtonTestGeneral">
          </td>
        </tr>
      </form>
      </td>
      
      </tr>
      
    </table>
    <%Else%>
    <form method="POST" action="ansget1.asp">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" colspan="2"><span class="Required">This is the wrong answer</b> Please try again </td>
            </tr>
            <tr>
              <td height="30" colspan="2"><p><span class="HeaderLarge"><b>Question <%=QuesAsked%></span><span style="margin-left:405px;"><%=Relevance%></span></p>
                <p class="PopupSubHeader"><%=QuestionDesc%><br />
                  <br />
                </p></td>
            </tr>
            <tr>
              <td height="30" width="4%"><input type="radio" name="SelectedChoice" value="<%=ChoiceNumber1%>"></td>
              <td><span class="PopupSubHeader"><%=ChoiceValue1%></span> </td>
            </tr>
            <tr>
              <td height="30"><input type="radio" name="SelectedChoice" value="<%=ChoiceNumber2%>"></td>
              <td><span class="PopupSubHeader"><%=ChoiceValue2%></span> </td>
            </tr>
            <tr>
              <td height="30"><input type="radio" name="SelectedChoice" value="<%=ChoiceNumber3%>"></td>
              <td><span class="PopupSubHeader"><%=ChoiceValue3%></span> </td>
            </tr>
            <tr>
              <td height="30"><input type="radio" name="SelectedChoice" value="<%=ChoiceNumber4%>"></td>
              <td><span class="PopupSubHeader"><%=ChoiceValue4%></span> </td>
            </tr>
            <input type="hidden" name="Relevance" value='<%=Relevance%>'>
            <input type="hidden" name="ChoiceNumber1" value='<%=ChoiceNumber1%>'>
            <input type="hidden" name="ChoiceValue1" value='<%=ChoiceValue1%>'>
            <input type="hidden" name="StartQuesNo" value='<%=StartQuesNo%>'>
            <input type="hidden" name="ChoiceNumber2" value='<%=ChoiceNumber2%>'>
            <input type="hidden" name="ChoiceValue2" value='<%=ChoiceValue2%>'>
            <input type="hidden" name="ChoiceNumber3" value='<%=ChoiceNumber3%>'>
            <input type="hidden" name="ChoiceValue3" value='<%=ChoiceValue3%>'>
            <input type="hidden" name="ChoiceNumber4" value='<%=ChoiceNumber4%>'>
            <input type="hidden" name="ChoiceValue4" value='<%=ChoiceValue4%>'>
            <input type="hidden" name="QuesAsked" value='<%=Request.form("QuesAsked")%>'>
            <input type="hidden" name="QuesCorrect" value='<%=Request.form("QuesCorrect")%>'>
            <input type="hidden" name="NoofQues" value='<%=Request.form("NoofQues")%>'>
            <input type="hidden" name="CorrectChoice" value='<%=CorrectChoice%>'>
            <input type="hidden" name="Justification" value='<%=Justification%>'>
            <input type="hidden" name="QuestionDesc" value='<%=QuestionDesc%>'>
            <input type="hidden" name="CountofQues" value='<%=CountofQues%>'>
            <input type="hidden" name="Kno" value='<%=KNo%>'>
            <tr>
              <td colspan = "2">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="2" height="84" class="TableRowOdd"><div align="left">
                <span class="PopupCopy">
                <input type="submit" value="ENTER SELECTION" class="ButtonTestGeneral">
                <input type="reset" value="RESET" class="ButtonTest">
                </span> </td>
            </tr>
            <tr>
              <td colspan="2"><br />
                <a href="http://www.itilstudy.com/index.asp"><b>Go to home page</b></a></td>
            </tr>
          </table>
    </form>
    </td>
    
    </tr>
    
  </table>
  <% End If
%>
</div>
</body>
</html>
<% End If %>
