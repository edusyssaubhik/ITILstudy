<!--#include virtual="/metatags/index_metatag.html"-->
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
            <td width="73%" class="PageTitle">Chapter Tests</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="width:95%;">
              <!-- Content Start From Here-->
              <div class="general-body">
                <% If Session("State") = "verified1" OR Session("State") = "verified2" OR Session("State") = "verified3" OR Session("State") = "verified5" OR Session("State") = "verified6" OR Session("State") = "verified7"  Then %>
                <p>You will have access to this section after your Classroom Program begins. Click here for the <a href="./prepcourse1.asp">Preparatory Program which is a pre-requisite for the PROJstudy PMP-Prep Classroom Course. </a> </p>
                <%Else%>
                <% If Session("State") = "verified1" OR Session("State") = "verified2" OR Session("State") = "verified3" OR Session("State") = "verified5" OR Session("State") = "verified6" OR Session("State") = "verified7"  Then %>
                <span class="Header"><%=Session("FirstName")%>, Please select the Chapter to work on today : </span>
				<br /><br />
                <%else%>
                <% end if %>
                <%
Dim KNo, kno_passed,objRs1, strQuery,questionNo

kno_passed=int(Session("KnoPassed"))+1

'Instantiate an ADO Recordset object.
Set rsQues = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")

rsQues.ActiveConnection = ConnObj
rsQues.Open "select KNo, Areatitle from KArea"%>
                <div>
                  <table width="95%" border="0" cellspacing="3" cellpadding="3" align="left" class="general-body">
                    <form method="post" action="/Foundation/quessget.asp" target="_blank">
                      <%Dim KNumber, count
KNumber=Session("KnoPassed")+1
count=0
%>
                      <tr>
                        <td width="40%" class="general-body"> Chapter: </td>
                        <td><select name="KNo" class="TeXtFielddropdown">
                            <%


      Do While Not rsQues.EOF %>
                             <% If count < KNumber Then %>
                      <Option <% If Session("KNO") =  rsQues("KNo") Then %> selected="selected" <% End If %> VALUE="<%=rsQues("KNo")%>"> <%=rsQues("AreaTitle")%></Option>
                      <% Else %>
                      <Option disabled="disabled"> <%=rsQues("AreaTitle")%></Option>
                      <% End If %>
                            <%rsQues.MoveNext
		count=count+1
	Loop
	Set rsQues = Nothing
%>
                          </select></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <%
					  strQuery ="SELECT max(QuestionNo) as Num  FROM QuestionDB  WHERE KNo = '" & Session("KNO") &"' "
					  objRs1.Open strQuery, ConnObj
                      
		   
                   questionNo = objRs1("Num")
                   response.Write(objRs1("Num"))
                  
					  
					   %>
                      <tr>
                        <td class="general-body">Select number of questions to work on:</td>
                        <td class="general-body"><select name="NoofQues" class="TeXtFielddropdown" style="width:45px;">
           <option value='5'> 5</option>
                            <option value='10'> 10</option>
                            <option value='15'> 15</option>
                            <option value='20'> 20</option>
                            <option value='25'> 25</option>
                            <option value='30'> 30</option>
                            <option value='40'> 40</option>
                            <option value='50'> 50</option>
                            <option value='60'> 60</option>
                            <option value='70'> 70</option>
                            <option value='80'> 80</option>
                            <option value='90'> 90</option>
                            <option value='100'> 100</option>
                          
                          
                         
                          </select></td>
                      </tr>
                      <input type="HIDDEN" name="QuesAsked" value='0'>
                      <input type="HIDDEN" name="CountofQues" value='0'>
                      <input type="HIDDEN" name="QuesCorrect" value='0'>
                      <tr>
                        <td class="general-body"> Question number to begin with: <br />
                          <i><span class="Note">(This should be a <em>numeric </em> field)</span></i></td>
                        <td class="general-body"><input type="text" name="StartQuesNo" size="3" value="1" class="TeXtField" style="width:45px;"></td>
                      </tr>
                      <!-- <tr>
                        <td colspan="2" width="75%"><span class="SmallText">Example: If you have already answered till Question # 20, you can decide to start from Question # 21. Default question to begin with is Question # 1</span></td>
                      </tr>-->
                      <tr>
                        <td align="left" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <input type="submit" class="ButtonGeneral" value="Enter Selection">
                          &nbsp;&nbsp;&nbsp;&nbsp;
                          <input type="reset" style="width:60px;" class="ButtonGeneral" value="Reset"></td>
                      </tr>
                      <tr>
                        <td COLSPAN="2" class="general-body"><%If Session("State") = "verified1" OR Session("State") = "verified2" OR Session("State") = "verified3" OR Session("State") = "verified5" OR Session("State") = "verified6" OR Session("State") = "verified7"  Then

	%>
                          <!--<p><span class="general-bodyBold">Please note :</span> As this is a mastery level series, participants taking the complete 6sigmastudy.com course must complete for each Chapter before proceeding
                            to the next one.</p>-->
                          <%end if%>
                    </form>
                    <%End If%>
                    <p><span class="general-bodyBold">Please note:</span></p>
                    <ul>
                      <li>The Chapter Tests assess the delegate’s degree of understanding of the respective chapter content. </li>
                      <li>The questions are in the Multiple Choice format wherein the delegate will have to choose one correct answer from a choice of four (4) options. The correct option is provided along with justification and reference.</li>
                      <li>Each answer is given a ‘Justification’ which enhances the delegate’s understanding of the concept. The delegate can understand why the correct option is correct and why the rest of the options are incorrect.</li>
                 
                        <li>The 'Reference' directs the delegate to where the concept embodied in the justification can be found in the PRINCE2<sup>&reg;</sup> manual Managing Successful Projects with PRINCE2<sup>&reg;</sup>.</li>
                     
                    </ul>
                    
                  </table>
                </div>
                <!-- Content End From Here-->
                <!--#include virtual="/includes/connectionClose.asp"-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<% End If %>
<!--#include virtual="/includes/footer.html"-->
