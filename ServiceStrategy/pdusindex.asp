<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerindustryrecognizedbanner.html"-->
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
            <td width="73%" class="PageTitle">Evaluation Test <a href="/ServiceStrategy/help.asp#Evolution" style="float:right; margin-right:20px;"><img src="/images/buttons/Help.png" height="20px" style="border-color:#FFFFFF" onmouseover="this.src='/images/buttons/help_h.png'" onmouseout="this.src='/images/buttons/Help.png'"></a></td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="width:95%;margin-top:-12px;" >
                <!-- Content Start From Here-->
                <div>
                  <p class="Header">
                    <% = Session("FirstName") %>&nbsp;<%=Session("LastName")%>, please select the Chapter </p>
                </div>
                <%
'Declare The Local Variables'
Dim payer_email
Dim pass
Dim kno_passed
Dim rsQues
Dim KNumber, count

If Session("State") = "verified14"   Then
kno_passed = int(Session("KnoPassed")) + 1
Else
	kno_passed=1
End If


'Instantiate an ADO Recordset object.
Set rsQues = Server.CreateObject("ADODB.Recordset")

rsQues.ActiveConnection = ConnObj
rsQues.Open "SELECT KNo, AreaTitle from KArea_Strategy"

%>
                <div>
                  <form method="post" action="./pduquesget.asp">
                    <%
KNumber=kno_passed
count=0
%>
                    <span> Chapter :</span> <span>
                    <select name="KNo" class="TeXtFielddropdown">
                      <%Do While Not rsQues.EOF %>
                      <%' If count < KNumber Then %>
                      <Option <% If Session("KNO") =  rsQues("KNo") Then %> selected="selected" <% End If %> VALUE="<%=rsQues("KNo")%>"><%= "Chapter"&" "& rsQues("KNo")&" : "&rsQues("AreaTitle")%></Option>
                      <%' Else %>
                     <!-- <Option disabled="disabled"><%'= '"Chapter"&" "& rsQues("KNo")&" : "&rsQues("AreaTitle")%></Option>-->
                      <% 'End If %>
                      <%
	   		rsQues.MoveNext
			count=count+1
			Loop
		Set rsQues = Nothing

	   %>
                    </select>
                    </span> <span>
					<input type="submit" class="ButtonGeneral" value="Submit">
                  
                    </span>
                  </form>
                </div>
                <BR>
                <div><b>Please note :</b> <BR>
                  <UL>
				 
                    <LI>Each chapter is followed by an evaluation test.</LI>
				    <li>The delegate will be allowed to complete the evaluation test for each chapter within 20 minutes.</li>
                    <LI>The questions are in the Multiple Choice format wherein the delegate will have to choose one correct answer from a choice of four (4) options.</LI>
                    <li>It is mandatory for the delegate to pass this test for each chapter so as to gain access to the next chapter.</li>
                  </UL>
                </div>
                <!-- Content End From Here-->
                <!--#include virtual="/includes/connectionClose.asp"-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<% End If %>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->

