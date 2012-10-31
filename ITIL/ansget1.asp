
<% If Session("FirstName") = "" Then 
response.Redirect("/memberlogin.asp")
Else
%>
<html>
<head>
<meta http-equiv=Content-type content="text/html; charset=ISO-8859-1">
<title>ITILstudy</title>
<link rel="shortcut icon" href="/images/buttons/favicon.ico">
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

KNo=Request.Form("KNo")
NoofQues=Request.Form("NoofQues")
QuesAsked=Request.Form("QuesAsked")
QuesCorrect=Request.Form("QuesCorrect")
Justification=Request.Form("Justification")
CorrectChoice=Request.Form("CorrectChoice")
SelectedChoice=Request.Form("SelectedChoice")
StartQuesNo=Request.Form("StartQuesNo")
CountofQues=Request.Form("CountofQues")
Relevance=Request.Form("Relevance")
%>
<div>
 <table width="100%" border="0" cellpadding="0" cellspacing="0" class="TableTest">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
       <td height="30">
		   <% If(SelectedChoice=CorrectChoice)Then %>
           <font color="green"> <b>Correct Answer !!!</b></font>
           <span style="margin-left:405px;"><b><%=Relevance%></b></span>
        </td>
       </tr>
       <tr>
        <td class="SubHeader">
          Selected Choice: # <%=SelectedChoice%><br>
          Correct Answer: # <%=CorrectChoice%>
        </td>
       </tr>
       <tr>
        <td class="PopupSubHeader">
 		 <%QuesCorrect=QuesCorrect+1%>
  		<% Else %>
         <font color="red"> <b>This is the wrong answer</b> </font>
        </td>
       </tr>
       <tr>
        <td class="SubHeader">
           Selected Choice: # <%=SelectedChoice%> <br>
           Correct Answer: # <%=CorrectChoice%> </b>
        </td>
       </tr>
     <% End If %>
     <tr>
       <td class="PopupSubHeader">
		  <hr color=Maroon width="100%" align="center"><br>
          
  		  <span class="HeaderLarge">Question:</span><span class="PopupSubHeader"> <%=Request.Form("QuestionDesc")%></span><br>
          <ol>
            <li> <%=Request.Form("ChoiceValue1")%></li>
            <li> <%=Request.Form("ChoiceValue2")%></li>
            <li> <%=Request.Form("ChoiceValue3")%></li>
            <li> <%=Request.Form("ChoiceValue4")%></li>            
          </ol>
 		 <hr color=Maroon width="100%" align="center">
        </td>
       </tr>
       <tr>
        <td>
		 <span class="HeaderLarge">Justification:</span><span class="PopupSubHeader"><%=Justification%></span>
        </td>
       </tr>
	   <tr>
         <td class="PopupSubHeader">
		  <hr color=Maroon width="100%" align="center">
             Total No of Questions: <b><%=NoofQues%></b> <br>
             Questions Attempted : <b><%=CountofQues%></b> <br>
             Questions Answered Correctly: <b><%=QuesCorrect%></b><br>
             Percentage Correct(within 2 attempts): <b><%=Int(Int(QuesCorrect)*100/Int(CountofQues))%> %</b> <br>
         <form method="post" action="quessget.asp">
            <input type="hidden" name="QuesAsked" value='<%=QuesAsked%>'>
            <input type="hidden" name="QuestionDesc" value='<%=QuestionDesc%>'>
            <input type="hidden" name="QuesCorrect" value='<%=QuesCorrect%>'>
            <input type="hidden" name="NoofQues" value='<%=NoofQues%>'>
            <input type="hidden" name="Kno" value='<%=KNo%>'>
            <input type="hidden" name="CountofQues" value='<%=CountofQues%>'>
            <input type="hidden" name="StartQuesNo" value='<%=StartQuesNo%>'>
    		<hr color=Maroon width="100%" align="center">
           </td>
         </tr>
         <tr>
          <td>
		      <input type="submit" value="Go to Next Question" class="ButtonTestGeneral">
          </td>
         </tr>
	  </form>
       <tr>
        <td><br><a href="http://www.itilstudy.com/index.asp"><b>Go to home page</b></a></td>
       </tr>
     </table>
 </div>
</body>
</html>
<% End If %>