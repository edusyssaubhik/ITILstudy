<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="PageTitle">Guides : Terms and concepts</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
			<br />
			<div style="margin-top:-12px; width:95%">
                <!-- Content Start From Here-->
                <%
Dim kno, termno, selection

kno=Request.Form("kno")
termno=int(Request.Form("termno"))
selection=Request.Form("select")


Set rsQues = Server.CreateObject("ADODB.Recordset")
rsQues.ActiveConnection = ConnObj
rsQues.Open "SELECT quesno, term, termdesc from GuidesDB where kno='"&kno&"'"

%>
                <table border="0" cellpadding="4" cellspacing="0" width="100%">
                  <tr>
                    <td colspan="3" align="center" class="TableRowEven"><span class="Header">Important Terms and Concepts <br>
                      (Take printouts and Fold at the center to make Flashcards for quick reference)</span> </td>
                  </tr>
                  <%
If not rsQues.BOF then
Do While Not rsQues.EOF %>
                  <tr>
                    <td class="Tablefooter"><%=rsQues("quesno")%></td>
                    <td class="Tablefooter"><span class="TableCopyName"><%=rsQues("term")%></span></td>
                    <td class="Tablefooter"><%=rsQues("termdesc")%></td>
                  </tr>
                  <%rsQues.MoveNext
		Loop%>
                </table>
                <%
else
end if

set rsQues=Nothing%>
                <!-- Content End From Here-->
                <!--#include virtual="/includes/connectionClose.asp"-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
