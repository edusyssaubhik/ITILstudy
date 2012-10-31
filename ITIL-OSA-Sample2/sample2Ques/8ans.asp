<!--#include virtual="/ITIL-OSA-Sample2/sample2Ques/validOSA.asp"--><BR><BR><table width="880" border="0" cellspacing="0" cellpadding="0"><tr><td width="10px"></td><td colspan="2"><font style="font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;">Question No: 8</font><BR><BR></td></tr><tr><td width="10px"></td><td colspan="2"><font face="Arial,sans-serif" size="3"><b>Scenario:</b> WIRED, is a  very successful company that provides money transfer services for individuals  and between companies. Executive officers are currently in negotiations for a  possible merger with another, larger money transfer Company. This merger is  dependent on the financial stability of the organization and the quality of  services delivered to end customers.</p>
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
<p>Which one of  the options follows ITIL Best Practice for Incident Management?</p></font><BR><BR></td></tr><tr><td colspan="3">&nbsp;</td></tr><tr><td width=" ">&nbsp;</td><td width="7%"><font style="font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;">Choice 1 </font></td><td><font face="Arial,sans-serif" size="3"><table border="1" cellspacing="0" cellpadding="0">
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

</td></tr><tr><td colspan="3">&nbsp;</font></td></tr><tr><td width=" ">&nbsp;</td><td width=" "><font style="font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;">Choice 2 </font></td><td><font face="Arial,sans-serif" size="3"> <table border="1" cellspacing="0" cellpadding="0">
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
</td></tr><tr><td colspan="3">&nbsp;</font></td></tr><tr><td width=" ">&nbsp;</td><td width=" "><font style="font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;">Choice 3 </font></td><td><font face="Arial,sans-serif" size="3"> <table border="1" cellspacing="0" cellpadding="0">
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
</table></td></tr><tr><td colspan="3">&nbsp;</font></td></tr><tr><td width=" ">&nbsp;</td><td width=" "><font style="font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;">Choice 4 </font></td><td><font face="Arial,sans-serif" size="3"><table border="1" cellspacing="0" cellpadding="0">
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

</font></td></tr><td colspan="3">&nbsp;</td></tr><tr><td>&nbsp;</td</tr><tr><td width=" ">&nbsp;</td><td width=" " colspan="2"><font style="font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;">Correct Choice : D</font></td> </tr><tr><td colspan="3">&nbsp;</td></tr><tr><td width="10px"></td><td colspan="2"><font style="font-family:Arial, Helvetica, sans-serif; color:#2F95D3; font-size: 13px; font-weight: bold; font-style: normal;">Justification : </font><BR><BR></td></tr><tr><td width=" ">&nbsp;</td><td valign="top" colspan="2"><font face="Arial,sans-serif" size="3"><table border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td width="153" valign="top"><p><strong><em>QUESTION</em></strong></p>
      <p> </p></td>
    <td width="51" valign="top"><p><strong><em>CHOICE</em></strong></p></td>
    <td width="397" valign="top"><p><strong><em>RATIONALE</em></strong></p>
      <p>This question focuses on how to apply incident prioritization an when    it’s appropriate to follow the Major Incident process </p></td>
  </tr>
  <tr>
    <td width="153" valign="top"><p><strong><em>MOST CORRECT (5)</em></strong></p></td>
    <td width="51" valign="top"><p>D</p></td>
    <td width="397" valign="top"><p>001 – This Incident was logged by the CFO while running reports for a    merger meeting. Despite this not being a time when the functionality of the    application was critical this is an example of a lower priority Incident to    be handled through the Major Incident Process due to the potential business    impact.</p>
      <p>002 – Although this is a low priority application, the Incident has    occurred at the end of the month, when priority of these Incidents may    increase and therefore should be treated with medium priority following the    Normal Incident process.</p>
      <p>003 – As stated in the scenario, all TransferX Incidents should be    logged as critical and the since the cause of this Incident is unknown it    should follow the Major Incident process.</p>
      <p>004 – TransferX Incident which is prioritized as critical, however it    is an Incident which has occurred before and the cause and resolution may be obvious,    in which case it is appropriate for this Incident to be handled by the Normal    Incident process.</p>
      <p>005 – Another critical TransferX Incident that has an obvious    resolution, to be handled through the Normal Incident Process. </p></td>
  </tr>
  <tr>
    <td width="153" valign="top"><p><strong><em>SECOND BEST (3)</em></strong></p></td>
    <td width="51" valign="top"><p>B</p></td>
    <td width="397" valign="top"><p>Each Incident in this table has been coded and prioritized well,    however 004 could be handled more appropriately.</p>
      <p>Despite this being a critical incident to a critical application the    Incident’s cause and resolution may be obvious as it has happened before.    Therefore this<br>
        Incident should be handled via the Normal Incident process. </p></td>
  </tr>
  <tr>
    <td width="153" valign="top"><p><strong><em>THIRD BEST (1)</em></strong></p></td>
    <td width="51" valign="top"><p>C</p></td>
    <td width="397" valign="top"><p>001 – Due to the potential business impact based on the CFOs current requirements    for this application the Incident should be handled by the Major Incident    process</p>
      <p>002 and 003 - are handled well.</p>
      <p>004 - Despite this being a critical incident to a critical application    the Incident’s cause and resolution may be obvious as it has happened before.    Therefore this Incident should be handled via the Normal Incident process.</p>
      <p>005 - Should not be handled by the Problem Management process. An Incident    remains an Incident forever – it may grow in impact or priority to become a    major incident, but an incident never ‘becomes’ a problem. A problem is the    underlying cause of one or more Incidents and always remains a separate    entity. </p></td>
  </tr>
  <tr>
    <td width="153" valign="top"><p><strong><em>DISTRACTOR (0)</em></strong></p></td>
    <td width="51" valign="top"><p>A</p></td>
    <td width="397" valign="top"><p>All but one (Incident #002) of the Incidents have been coded and    prioritized incorrectly. </p></td>
  </tr>
</table>
<br><br> <BR><BR><br><br> <BR><BR></td></tr><tr><td colspan="3">&nbsp;</font></td></tr>