<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->

<% If Session("FirstName") = "" Then 
response.Redirect("/memberlogin.asp")
Else
%>

<!-- Body Starts -->
<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="PageTitle">Evaluation Test</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
                <!-- Content Start From Here-->
                <div>
                  <%

					Dim sArray ' Declare your variant for the array
					Dim nCur
					Dim nNewTot
					Dim KNo
					Dim rsQues1, rsQues
					
					KNos=Request.Form("KNo")
					KNo=int(KNos)
					' Dimension the array into 2 dimensions
					
					ReDim sArray(10,1,1)
					Dim quesno
					quesno=1
					'quesno=2
					
					Set rsQues1 = Server.CreateObject("ADODB.Recordset")
					rsQues1.ActiveConnection = connObj
					
					
					rsQues1.Open "SELECT CorrectChoice,QuestionNo FROM Question_StrategyDB WHERE Question_StrategyDB.KNo='"&KNo&"'"
					
					For nCur = 0 to 9
					
					sArray(nCur,0,0) = quesno
						If Not rsQues1.BOF Then
						Do While Not rsQues1.EOF
							if (Int(quesno)=Int(rsQues1("QuestionNo"))) then
								sArray(nCur,1,0)=rsQues1("CorrectChoice")
					
								else
							end if
						rsQues1.MoveNext
						Loop
					
						else
						end if
					'quesno=quesno+2
					quesno=quesno+1
					rsQues1.MoveFirst
					Next
					
					Set rsQues1=Nothing
					
					%>
                  <%Session("PDUArray")=sArray%>
                  <p><span class="Header">Instructions for taking the Evaluation Test:  </span></p>
                  <ol>
                    <li>There will be 10 questions - each question will have 4 options. You have to mark one choice out of the available 4 options.</li>
                    <li>There are no negative marks. So, please answer every question.</li>
                    <li>To navigate through the test and the answers, you can choose the appropriate button out of the three provided :<br /><br />
					  <ul> 
						 <li>Go to the next question by clicking <span class="general-bodyBold"> "Next Question" </span></li>
						 <li>Go to the previous question by clicking <span class="general-bodyBold"> "Previous Question"</span></li>
						 <li>Review your answers by clicking <span class="general-bodyBold"> "View All Answers" </span></li>
					  </ul>
					</li>
                    <li>To gain access to the next chapter, you will have to answer 6 out of 10 questions correctly (i.e. 60% correctly).</li>
                   
                    <li>If there is <span class="general-bodyBold"><u>more than 20 minutes of inactivity, the test will time-out</u></span> i.e. you will have to take the test again from the beginning.</li>
                  </ol>
                </div>
                <br />
                <div>
                  <p>If you have any questions about the test, please click here to <% If Session("CountryOrigin") <> "India" Then %><a href="/contactus.asp">Contact ITILstudy</a><% Else %><a href="/contactus.asp">Contact ITILstudy</a><% End If %> </p>
                  <form method="post" action="/ServiceStrategy/pduquesget1.asp" target="_blank">
                    <input type="hidden" name="nCur" value="-1">
                    <input type="hidden" name="AnsValue" value="0">
                    <input type="hidden" name="KNo" value='<%=KNo%>'>
                    <input type="submit" name="Submit"  value="Please click here to continue">
                  </form>
                </div>
                <!-- Content End From Here-->
                <!--#include virtual="/includes/connectionClose.asp"-->
             </td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<% End If %>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
