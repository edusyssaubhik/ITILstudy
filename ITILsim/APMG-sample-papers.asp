<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<% If Session("payerEmail") = "" Then
		'Response.Redirect("/memberlogin.asp")
   End If	
    
   If Session("State") = "verified5" OR Session("State")="verified7" Then
		'Response.Redirect("/memberlogin.asp")
   End If
    %>


  <!-- Body Starts -->
 
<div>
<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  
  <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
  
  <table width="100%" border="0" cellspacing="0" cellpadding="8">
    <tr>
      <td width="2%" class="Header">&nbsp;</td>
      <td width="25%" class="PageTitle">&nbsp;</td>
      <td width="73%" class="PageTitle">APMG Sample Paper</td>
    </tr>
    <tr>
      <!--#include virtual="/includes/innerLeftMenu.asp"-->
      <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="width:95%;">
        <!-- Content Start From Here-->
        <table width="100%" border="0">

          <tr><td>
          <!--<span class="Header">Dear <%'=Session("FirstName")%>&nbsp;<%'=Session("LastName")%></span><br>
          <br>-->
          
            <b>Guidelines:</b>
              <ul>
<li>Download 2 APMG sample papers and save it in your PC (So, you don't have to log in to review the practice questions)</li>
<li>Each PDF document contains 40 objective questions with the answers.</li>
<li>Review and practice the questions and prepare for the final assessment.</li>
              </ul>
              Click the below links to download the APMG Sample Paper : <br /><br />

              <a href="/APMG-Sample-Paper- 1.pdf" Target="_blank">APMG Sample Paper - 1</a><br /><br />
              <a href="/APMG-Sample-Paper- 2.pdf" Target="_blank">APMG Sample Paper - 2</a><br /><br />

         </td>
            </tr>
           
          </table>
		  
          </td></tr>
          </table>


  </td>
  </tr>
  
</table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
