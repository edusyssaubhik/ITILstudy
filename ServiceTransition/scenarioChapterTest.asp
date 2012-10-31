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
            <td width="73%" class="PageTitle">Chapter Tests <a href="/ITIL-CSI/help.asp#chapter-test" style="float:right; margin-right:20px;"><img src="/images/buttons/Help.png" height="20px" style="border-color:#FFFFFF" onmouseover="this.src='/images/buttons/help_h.png'" onmouseout="this.src='/images/buttons/Help.png'"></a></td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="width:95%;">
              <!-- Content Start From Here-->
              <div class="general-body">
               
               
                <% If Session("State") = "verified9"  Then %>
                <span class="Header"> <% = Session("FirstName") %>&nbsp;<%=Session("LastName")%>, please select the Chapter to work on : </span> <br />
                <br />
                <% end if %>
                <%
Dim KNo, kno_passed,objRs1, strQuery,questionNo

kno_passed=int(Session("KnoPassed"))+1

'Instantiate an ADO Recordset object.
Set rsQues = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")

rsQues.ActiveConnection = ConnObj
rsQues.Open "select KNo, Areatitle from KArea_CSI"%>
                <div>
                  <table width="95%" border="0" cellspacing="3" cellpadding="3" align="left" class="general-body">
                    <form method="post" action="/ITIL-CSI/getScenario.asp" >
                      <%Dim KNumber, count
KNumber=Session("KnoPassed")+1
count=0
%>
                      <tr>
                        <td width="40%" class="general-body"> Scenario Based Chapter Test: </td>
                        <td><select name="KNo" class="TeXtFielddropdown">
                            <% Do While Not rsQues.EOF %>
                          <%' If count < KNumber Then %>
                      <Option <% If Session("KNO") =  rsQues("KNo") Then %> selected="selected" <% End If %> VALUE="<%=rsQues("KNo")%>"><%= "Chapter"&" "& rsQues("KNo")&" : "&rsQues("AreaTitle")%></Option>
                      <%' Else %>
                   <!--   <Option disabled="disabled"><%'= "Chapter"&" "& rsQues("KNo")&" : "&rsQues("AreaTitle")%></Option>-->
                      <% 'End If %>
                            <%rsQues.MoveNext
		count=count+1
	Loop
	Set rsQues = Nothing
%>
                          </select></td>
                      </tr>
                     
                      
                      <!-- <tr>
                        <td colspan="2" width="75%"><span class="SmallText">Example: If you have already answered till Question # 20, you can decide to start from Question # 21. Default question to begin with is Question # 1</span></td>
                      </tr>-->
                      <tr>
					   <td  >&nbsp;
                         
                         </td>
                        <td colspan="4" >
                          <input type="submit" class="ButtonGeneral" value="Enter Selection">
                         </td>
                      </tr>
                      
                      </tr>
                      <tr>
                        <td COLSPAN="2" class="general-body"><% If Session("State") = "verified9" Then	%>
                          <!--<p><span class="general-bodyBold">Please note :</span> As this is a mastery level series, participants taking the complete 6sigmastudy.com course must complete for each Chapter before proceeding
                            to the next one.</p>-->
                          <%end if%>
                    </form>
                    <%End If%>
                    <p><span class="general-bodyBold">Please note:</span></p>
                    <ul>
                      <li>The Chapter Tests assess the delegate’s degree of understanding of the respective chapter content. </li>
                      <li>The questions are in the Multiple Choice format, wherein the delegate will have to choose one correct answer from a choice of four (4) options. The correct option is provided along with justification and reference.</li>
                      <li>Each answer is provided with a 'Justification' which enhances the delegate’s understanding of the concept. The delegate can understand why the correct option is correct and why the rest of the options are incorrect.</li>
                      <li>The 'Reference' directs the delegate to where the concept embodied in the justification can be found in the OGC ITIL<sup>&reg;</sup> Hand Book.</li>
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
<% 'End If %>
<!--#include virtual="/includes/footer.html"-->
