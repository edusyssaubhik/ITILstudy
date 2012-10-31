<!--#include virtual="/ITIL-OSA-Sample2/sample2Ques/validOSA.asp"--><BR><BR><form  method="post" action="./index.asp"><div class="overflowTest"><table width="880" border="0" cellspacing="0" cellpadding="0"><tr><td width="10px"></td><td colspan="2"><font face="Arial,sans-serif" size="3"><b>Scenario:</b> WIRED, is a  very successful company that provides money transfer services for individuals  and between companies. Executive officers are currently in negotiations for a  possible merger with another, larger money transfer Company. This merger is  dependent on the financial stability of the organization and the quality of  services delivered to end customers.</p>
<p>The Chief  Information Officer (CIO) of WIRED, has been advised that should the merger take  place, Management intends to use the existing WIRED business services.

<p>These services  are:</p>
<table border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td width="149" valign="top"><p align="center">BillMe</p></td>
    <td width="467" valign="top"><p>A billing application which is used by the sales team to produce    invoices and billing statements for both individual clients and corporate    accounts.</p>
      <p>BillMe Incidents typically have a low priority level except nearing    the end of the month or if customer statements are unable to be sent for    payment, when the priority may increase.)</p></td>
  </tr>
  <tr>
    <td width="149" valign="top"><p align="center">FinReports</p></td>
    <td width="467" valign="top"><p>Mainly used for month end reporting to the Chief Financial Officer    (CFO).</p>
      <p>FinReports Incidents are typically medium priority Incidents except    nearing month end and year end scheduled reporting when the priority may    increase. Currently, this application is being used by the CFO to produce    financial reports for a merger meeting.</p></td>
  </tr>
  <tr>
    <td width="149" valign="top"><p align="center">TransferX</p></td>
    <td width="467" valign="top"><p>The main transfers application used to perform all money transactions.</p>
      <p>All TransferX Incidents are to be treated as critical, critical    Incidents typically follow the Major Incident Process.</p></td>
  </tr>
</table>

<p>The Business  has already expressed concern about how IT currently manages Incidents and demands  this be addressed prior to the merger. It is thought that there is no  understanding of business priority for these three main services.</p>
<p>The CIO has  asked you, the Service Desk Manager, to clarify how Incidents on these three  main services should be prioritized and which Incident Management procedures  should be used. You run the following report to see a sample of the typical  Incidents occurring:</p>
<p><strong><em>Incident Report:</em></strong></p>
<table border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td width="83" valign="top"><p><strong><em>#</em></strong></p></td>
    <td width="95" valign="top"><p><strong><em>Service</em></strong></p></td>
    <td width="94" valign="top"><p><strong><em>Date</em></strong></p></td>
    <td width="95" valign="top"><p><strong><em>User Group</em></strong></p></td>
    <td width="250" valign="top"><p><strong><em>Incident Details</em></strong></p></td>
  </tr>
  <tr>
    <td width="83" valign="top"><p>001</p></td>
    <td width="95" valign="top"><p><em>FinReports<strong></strong></em></p></td>
    <td width="94" valign="top"><p><em>5 – June<strong></strong></em></p></td>
    <td width="95" valign="top"><p><em>Executive<strong></strong></em></p></td>
    <td width="250" valign="top"><p><em>“Error screen, CFO unable to run financial report for merger meeting”<strong></strong></em></p></td>
  </tr>
  <tr>
    <td width="83" valign="top"><p>002</p></td>
    <td width="95" valign="top"><p><em>BillMe<strong></strong></em></p></td>
    <td width="94" valign="top"><p><em>29 – June<strong></strong></em></p></td>
    <td width="95" valign="top"><p><em>Sales<strong></strong></em></p></td>
    <td width="250" valign="top"><p><em>“Error Screen ‘Billing Statement unable to Print”<strong></strong></em></p></td>
  </tr>
  <tr>
    <td width="83" valign="top"><p>003</p></td>
    <td width="95" valign="top"><p><em>TransferX<strong></strong></em></p></td>
    <td width="94" valign="top"><p><em>15 – June<strong></strong></em></p></td>
    <td width="95" valign="top"><p><em>User<strong></strong></em></p></td>
    <td width="250" valign="top"><p><em>“Transfer System offline”<strong></strong></em></p></td>
  </tr>
  <tr>
    <td width="83" valign="top"><p>004</p></td>
    <td width="95" valign="top"><p><em>TransferX<strong></strong></em></p></td>
    <td width="94" valign="top"><p><em>29 – June<strong></strong></em></p></td>
    <td width="95" valign="top"><p><em>Operations<strong></strong></em></p></td>
    <td width="250" valign="top"><p><em>“…yet another occurrence of the BatchZ Update Error”<strong></strong></em></p></td>
  </tr>
  <tr>
    <td width="83" valign="top"><p>005</p></td>
    <td width="95" valign="top"><p><em>TransferX<strong></strong></em></p></td>
    <td width="94" valign="top"><p><em>30 – June<strong></strong></em></p></td>
    <td width="95" valign="top"><p><em>Operations<strong></strong></em></p></td>
    <td width="250" valign="top"><p><em>“Notifications not sending (apply existing</em><br>
      <em>workaround)”<strong></strong></em></p></td>
  </tr>
</table>
<p>Incident  prioritization is already established as follows:</p>
<table border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td width="123" rowspan="5"><br>
      <strong><em>Urgency</em></strong></td>
    <td width="493" colspan="4" valign="top"><p align="center"><strong><em>Impact</em></strong></p></td>
  </tr>
  <tr>
    <td width="101"><p align="center"><em> </em></p></td>
    <td width="113"><p align="center"><strong><em>High</em></strong></p></td>
    <td width="94"><p align="center"><strong><em>Med</em></strong></p></td>
    <td width="184"><p align="center"><strong><em>Low</em></strong></p></td>
  </tr>
  <tr>
    <td width="101"><p align="center"><strong><em>High</em></strong></p></td>
    <td width="113"><p align="center"><em>1-Critical</em></p></td>
    <td width="94"><p align="center"><em>1-High</em></p></td>
    <td width="184"><p align="center"><em>1-Med</em></p></td>
  </tr>
  <tr>
    <td width="101"><p align="center"><strong><em>Med</em></strong></p></td>
    <td width="113"><p align="center"><em>2-High</em></p></td>
    <td width="94"><p align="center"><em>2-Med</em></p></td>
    <td width="184"><p align="center"><em>2-Low</em></p></td>
  </tr>
  <tr>
    <td width="101"><p align="center"><strong><em>Low</em></strong></p></td>
    <td width="113"><p align="center"><em>3-Med</em></p></td>
    <td width="94"><p align="center"><em>3-Low</em></p></td>
    <td width="184"><p align="center"><em>3-To be planned</em></p></td>
  </tr>
</table>
</font><BR><BR></td></tr><tr><td colspan="3">&nbsp;</td></tr><tr><td width="10px"></td><td colspan="2"><font face="Arial,sans-serif" size="3"><b>Question:</b> Your Service  Desk staff have given you four suggestions on Incident prioritization and what  ITIL Incident Management procedures should be used for the Incidents listed in  the report.
<p>Which one of  the options follows ITIL Best Practice for Incident Management?</p></font><BR><BR></td></tr><tr><td colspan="3">&nbsp;</td></tr><tr><td width=" ">&nbsp;</td><td width="7%"><font face="Arial,sans-serif" size="3">1 &nbsp;&nbsp; <INPUT TYPE="radio" NAME="SelectedChoice" VALUE=A></font></td><td><font face="Arial,sans-serif" size="3"><table border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td width="102" valign="top"><p align="center">#</p></td>
    <td width="227" colspan="2" valign="top"><p align="center"><strong>Priority</strong></p></td>
    <td width="288" valign="top"><p align="center"><strong>Procedures</strong></p></td>
  </tr>
  <tr>
    <td width="102" valign="top"><p>001</p></td>
    <td width="113" valign="top"><p align="center">High</p></td>
    <td width="113" valign="top"><p align="center">2</p></td>
    <td width="288" valign="top"><p>Problem Management process</p></td>
  </tr>
  <tr>
    <td width="102" valign="top"><p>002</p></td>
    <td width="113" valign="top"><p align="center">Medium</p></td>
    <td width="113" valign="top"><p align="center">3</p></td>
    <td width="288" valign="top"><p>Normal Incident process</p></td>
  </tr>
  <tr>
    <td width="102" valign="top"><p>003</p></td>
    <td width="113" valign="top"><p align="center">Critical</p></td>
    <td width="113" valign="top"><p align="center">1</p></td>
    <td width="288" valign="top"><p>Problem Management process</p></td>
  </tr>
  <tr>
    <td width="102" valign="top"><p>004</p></td>
    <td width="113" valign="top"><p align="center">Critical</p></td>
    <td width="113" valign="top"><p align="center">1</p></td>
    <td width="288" valign="top"><p>Major Incident process</p></td>
  </tr>
  <tr>
    <td width="102" valign="top"><p>005</p></td>
    <td width="113" valign="top"><p align="center">Critical</p></td>
    <td width="113" valign="top"><p align="center">1</p></td>
    <td width="288" valign="top"><p>Problem Management process</p></td>
  </tr>
</table>

</td></tr><tr><td colspan="3">&nbsp;</font></td></tr><tr><td width=" ">&nbsp;</td><td width=" "><font face="Arial,sans-serif" size="3">2 &nbsp;&nbsp; <INPUT TYPE="radio" NAME="SelectedChoice" VALUE=B></font></td><td><font face="Arial,sans-serif" size="3"> <table border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td width="102" valign="top"><p align="center">#</p></td>
    <td width="227" colspan="2" valign="top"><p align="center"><strong>Priority</strong></p></td>
    <td width="288" valign="top"><p align="center"><strong>Procedures</strong></p></td>
  </tr>
  <tr>
    <td width="102" valign="top"><p>001</p></td>
    <td width="113" valign="top"><p align="center">Medium</p></td>
    <td width="113" valign="top"><p align="center">1</p></td>
    <td width="288" valign="top"><p>Major Incident process</p></td>
  </tr>
  <tr>
    <td width="102" valign="top"><p>002</p></td>
    <td width="113" valign="top"><p align="center">Medium</p></td>
    <td width="113" valign="top"><p align="center">3</p></td>
    <td width="288" valign="top"><p>Normal Incident process</p></td>
  </tr>
  <tr>
    <td width="102" valign="top"><p>003</p></td>
    <td width="113" valign="top"><p align="center">Critical</p></td>
    <td width="113" valign="top"><p align="center">1</p></td>
    <td width="288" valign="top"><p>Major Incident process</p></td>
  </tr>
  <tr>
    <td width="102" valign="top"><p>004</p></td>
    <td width="113" valign="top"><p align="center">Critical</p></td>
    <td width="113" valign="top"><p align="center">1</p></td>
    <td width="288" valign="top"><p>Major Incident process</p></td>
  </tr>
  <tr>
    <td width="102" valign="top"><p>005</p></td>
    <td width="113" valign="top"><p align="center">Critical</p></td>
    <td width="113" valign="top"><p align="center">1</p></td>
    <td width="288" valign="top"><p>Normal Incident process</p></td>
  </tr>
</table>
</td></tr><tr><td colspan="3">&nbsp;</font></td></tr><tr><td width=" ">&nbsp;</td><td width=" "><font face="Arial,sans-serif" size="3">3 &nbsp;&nbsp; <INPUT TYPE="radio" NAME="SelectedChoice" VALUE=C></font></td><td><font face="Arial,sans-serif" size="3"> <table border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td width="102" valign="top"><p align="center">#</p></td>
    <td width="227" colspan="2" valign="top"><p align="center"><strong>Priority</strong></p></td>
    <td width="288" valign="top"><p align="center"><strong>Procedures</strong></p></td>
  </tr>
  <tr>
    <td width="102" valign="top"><p>001</p></td>
    <td width="113" valign="top"><p align="center">Medium</p></td>
    <td width="113" valign="top"><p align="center">1</p></td>
    <td width="288" valign="top"><p>Normal Incident process</p></td>
  </tr>
  <tr>
    <td width="102" valign="top"><p>002</p></td>
    <td width="113" valign="top"><p align="center">Medium</p></td>
    <td width="113" valign="top"><p align="center">3</p></td>
    <td width="288" valign="top"><p>Normal Incident process</p></td>
  </tr>
  <tr>
    <td width="102" valign="top"><p>003</p></td>
    <td width="113" valign="top"><p align="center">Critical</p></td>
    <td width="113" valign="top"><p align="center">1</p></td>
    <td width="288" valign="top"><p>Major Incident process</p></td>
  </tr>
  <tr>
    <td width="102" valign="top"><p>004</p></td>
    <td width="113" valign="top"><p align="center">Critical</p></td>
    <td width="113" valign="top"><p align="center">1</p></td>
    <td width="288" valign="top"><p>Major Incident process</p></td>
  </tr>
  <tr>
    <td width="102" valign="top"><p>005</p></td>
    <td width="113" valign="top"><p align="center">Critical</p></td>
    <td width="113" valign="top"><p align="center">1</p></td>
    <td width="288" valign="top"><p>Problem Management process</p></td>
  </tr>
</table></td></tr><tr><td colspan="3">&nbsp;</font></td></tr><tr><td width=" ">&nbsp;</td><td width=" "><font face="Arial,sans-serif" size="3">4 &nbsp;&nbsp; <INPUT TYPE="radio" NAME="SelectedChoice" VALUE=D></font></td><td><font face="Arial,sans-serif" size="3"><table border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td width="102" valign="top"><p align="center">#</p></td>
    <td width="227" colspan="2" valign="top"><p align="center"><strong>Priority</strong></p></td>
    <td width="288" valign="top"><p align="center"><strong>Procedures</strong></p></td>
  </tr>
  <tr>
    <td width="102" valign="top"><p>001</p></td>
    <td width="113" valign="top"><p align="center">High</p></td>
    <td width="113" valign="top"><p align="center">2</p></td>
    <td width="288" valign="top"><p>Major Incident process</p></td>
  </tr>
  <tr>
    <td width="102" valign="top"><p>002</p></td>
    <td width="113" valign="top"><p align="center">Medium</p></td>
    <td width="113" valign="top"><p align="center">3</p></td>
    <td width="288" valign="top"><p>Normal Incident process</p></td>
  </tr>
  <tr>
    <td width="102" valign="top"><p>003</p></td>
    <td width="113" valign="top"><p align="center">Critical</p></td>
    <td width="113" valign="top"><p align="center">1</p></td>
    <td width="288" valign="top"><p>Major Incident process</p></td>
  </tr>
  <tr>
    <td width="102" valign="top"><p>004</p></td>
    <td width="113" valign="top"><p align="center">Critical</p></td>
    <td width="113" valign="top"><p align="center">1</p></td>
    <td width="288" valign="top"><p>Normal Incident process </p></td>
  </tr>
  <tr>
    <td width="102" valign="top"><p>005</p></td>
    <td width="113" valign="top"><p align="center">Critical</p></td>
    <td width="113" valign="top"><p align="center">1</p></td>
    <td width="288" valign="top"><p>Normal Incident process </p></td>
  </tr>
</table>

</td></tr><tr><td colspan="3">&nbsp;</font></td></tr>