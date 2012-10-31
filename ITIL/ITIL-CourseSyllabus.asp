<!--#include virtual="/metatags/index_metatag.html"-->
<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innermethodologybanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<% If Session("FirstName") = "" Then 
response.Redirect("/memberlogin.asp")
Else
%>
<!-- Body Starts -->
<% 
'======================================================='
'Written By : Vinaya'
'Last UpDated : 19/08/2011'
'Description :'
'This Page is ITIL Course syllabus Page'
'======================================================='

%>

<script language="JavaScript" type="text/javascript" src="/js/tableH.js"></script>
<style type="text/css">
#myTable0{
	border:#CCC solid 1px;
}

#myTable0 td{
	padding:5px;
	border-top:#CCC solid 1px;
	border-left:#CCC solid 1px;
}

#myTable0 #header td{
	border-top:solid 1px #ccc;
	font:Verdana, Geneva, sans-serif;
	font-size:12px;
	font-weight:bold;
    background-color:#EAEAEA;  
    text-align: center;
    vertical-align: middle;	
	padding:5 0 5 10;
	color:#09C;
}

</style>
<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
    
    <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
    
    <table width="100%" border="0" cellspacing="0" cellpadding="8">
      <tr>
        <td width="2%" class="Header">&nbsp;</td>
        <td width="25%" class="PageTitle">&nbsp;</td>
        <td width="73%" class="PageTitle">ITIL v3 Foundation Course Syllabus <a href="/ITIL/help.asp#Query" style="float:right; margin-right:20px;"><img src="/images/buttons/Help.png" height="20px" style="border-color:#FFFFFF" onmouseover="this.src='/images/buttons/help_h.png'" onmouseout="this.src='/images/buttons/Help.png'"></a></td>
      </tr>
      <tr>
      
      <!--#include virtual="/includes/innerLeftMenu.asp"-->
      <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
      
      <div style="margin-top:-12px;">
        <!-- Content Start From Here-->
         <table border="0" id="myTable0" cellspacing="0" cellpadding="0" width="100%" class="TableGeneral">
          <tr id="header" >
           <td colspan="2">ITIL v3 Foundation Syllabus </td>
          </tr>
          <tr id="header" >
           <td> Syllabus Area</td>
           <td> Where would you find it</td>
          </tr>
          <tr id="header">
           <td colspan="2">Service Management as a practice</td>
          </tr>
          <tr>
           <td>The purpose of this unit is to help the candidate define Service and comprehend and explain the concept of Service Management as a practice.</td>
           <td></td>
          </tr>
          <tr>
           <td>Describe the concept of Good <i>Practice</i> (SS 1.2.2)</td>
           <td>Introduction Page 3</td>
          </tr>
          <tr>
           <td>Define and explain the concept of a <i>Service</i> (SS  2.2.1)</td>
           <td>Introduction Page 5</td>
          </tr>
          <tr>
           <td>Define and explain the concept of <i>Service Management</i> (SS 2.1)</td>
           <td>Introduction Page 5</td>
          </tr>
          <tr>
           <td>Define <i>Functions</i> and <i>Processes</i> (SS 2.3, 2.6.1, SD 2.3, SD 3.6.4, ST 2.3, SO 2.3, 3.1, CSI 2.3)</td>
           <td>Introduction Page 10</td>
          </tr>
          <tr>
           <td>Explain the <i>process</i> model and the characteristics of <i>processes</i> (SD 2.3.2, 3.6.4)</td>
           <td>Service Strategy (SS) Page 8</td>
          </tr>
          <tr>
           <td><i>The recommended study period for this unit is 45 minutes.</i></td>
           <td></td>
          </tr>
          <tr id="header">
           <td colspan="2">The Service Lifecycle</td>
          
          </tr>
          <tr>
           <td>The purpose of this unit is to help the candidate understand the value of the <i>Service Lifecycle</i>, how the <i>processes</i> integrate with each other, throughout the <i>Lifecycle</i> and explain the <i>objectives</i> and business value for each phase in the <i>lifecycle</i>.</td>
           <td></td>
          </tr>
          <tr>
           <td>Describe the structure, <i>scope, components</i> and interfaces of the Service Lifecycle (SS 1.2.3 all)</td>
           <td>Introduction Pages 6 to 9 & 13</td>
          </tr>
          <tr>
           <td>Account for the main goals and <i>objectives</i> of <i>Service Strategy</i> (SS 1.3)</td>
           <td>SS Pages 3 & 4</td>
          </tr>
          <tr>
           <td>Account for the main goals and <i>objectives</i> of <i>Service Design</i> (SD 2.4.1, SD 3.1)</td>
           <td>Service Design (SD) Pages 3 & 4</td>
          </tr>
          <tr>
           <td>Briefly explain what value <i>Service Design</i> provides to the <i>business</i> (SD 2.4.3)</td>
           <td>SD Page 4</td>
          </tr>
          <tr>
           <td>Account for the main goals and <i>objectives</i> of <i>Service Transition</i> (ST 2.4.1)</td>
           <td>Service Transition (ST) Page 3</td>
          </tr>
          <tr>
           <td>Briefly explain what value <i>Service Transition</i> provides to the <i>business</i> (ST 2.4.3)</td>
           <td>ST Page 4</td>
          </tr>
          <tr>
           <td>Account for the main goals and <i>objectives</i> of <i>Service Operations</i> (SO 2.4.1)</td>
           <td>Service Operation (SO) Page 3</td>
          </tr>
          <tr>
           <td>Briefly explain what value <i>Service Operation</i> provides to the <i>business</i> (SO 2.4.3 1st paragraph, SO 1.2.3.4)</td>
           <td>SO Page 3</td>
          </tr>
          <tr>
           <td>Account for the main goals and <i>objectives</i> of <i>Continual Service Improvement</i> (CSI 2.4.1, 2.4.2)</td>
           <td>Continual Service Improvement (CSI) Pages 3 & 4</td>
          </tr>
          <tr>
           <td>It is recommended that this training is covered within other units.If delivered as a standalone unit the recommended study period is 1.0 hour.</td>
           <td></td>
          </tr>
          <tr id="header">
           <td colspan="2">Generic concepts and definitions</td>          
          </tr>
          <tr>
           <td>The purpose of this unit is to help the candidate define some of the key terminology and explain the key concepts of <i>Service Management</i>.</td>
           <td></td>
          </tr>
          <tr>
           <td><i>Utility and Warranty</i> (SS 2.2.2)</td>
           <td>SS Page 6</td>
          </tr>
          <tr>
           <td><i>Resources, Capabilities and Assets</i> (SS 3.2.1)</td>
           <td>SS Page 5</td>
          </tr>
          <tr>
           <td><i>Service Portfolio</i> (SS 4.2.3, SD 3.6.2 – to end of 1<sup>st</sup> bullet list)</td>
           <td>SS Page 11</td>
          </tr>
          <tr>
           <td><i>Service Catalogue (Business Service Catalogue and Technical Service Catalogue)</i> (SS 4.2.3.1, SD4.1.4)</td>
           <td>SD Page 6</td>
          </tr>
          <tr>
           <td><i>The role of IT Governance across the Service Lifecycle</i> (CSI 3.10 all)</td>
           <td>CSI Page 19</td>
          </tr>
          <tr>
           <td><i>Business Case</i> (SS 5.2.1 intro, CSI 4.4.1)</td>
           <td>SS Page 7</td>
          </tr>
          <tr>
           <td><i>Risk</i> (SS 9.5.1, CSI 5.6.3)</td>
           <td>SS Page 10</td>
          </tr>
          <tr>
           <td>Service Provider (the candidate is not expected to know the detail of each of the three types of Service Providers) (SS 3.3 intro only, not 3.3.1, 3.3.2, 3.3.3)</td>
           <td>SS Page 9</td>
          </tr>
          <tr>
           <td><i>Supplier</i>  (SD 4.2.4, 4.7.2)</td>
           <td>SD Page 14</td>
          </tr>
          <tr>
           <td><i>Service Level Agreement</i> (SLA) (SD 4.2.4, 4.2.5.1)</td>
           <td>SD Page 8</td>
          </tr>
          <tr>
           <td><i>Operational Level Agreement</i> (OLA) (SD 4.2.4)</td>
           <td>SD Page 8</td>
          </tr>
          <tr>
           <td><i>Contract</i> (SD 4.7.5.1)</td>
           <td>SD Page 8</td>
          </tr>
          <tr>
           <td><i>Service Design Package</i> (SD  Appendix A)</td>
           <td>Introduction Page 11 & SS Page 9</td>
          </tr>
          <tr>
           <td><i>Availability</i> (SD 4.4.4)</td>
           <td>SD Page 11</td>
          </tr>
          <tr>
           <td><i>Service Knowledge Management System (SKMS)</i> (ST 4.7.4.2)</td>
           <td>ST Page 19</td>
          </tr>
          <tr>
           <td><i>Configuration Item (CI)</i> (ST 4.3.4.2)</td>
           <td>ST Page 14</td>
          </tr>
          <tr>
           <td><i>Configuration Management System</i> (ST 4.3.4.3 )</td>
           <td>ST Page 15</td>
          </tr>
          <tr>
           <td><i>Definitive Media Library (DML)</i> (ST 4.3.4.3)</td>
           <td>ST Page 15</td>
          </tr>
          <tr>
           <td><i>Service Change</i> (ST 4.2.2)</td>
           <td>ST Page 6</td>
          </tr>
          <tr>
           <td><i>Change types (Normal, Standard and Emergency)</i> (ST 4.2.6.1, 4.2.4.5, 4.2.6.9)</td>
           <td>ST Page 7</td>
          </tr>
          <tr>
           <td><i>Release Unit</i> (ST 4.4.4.1)</td>
           <td>ST Page 22</td>
          </tr>
          <tr>
           <td>Concept of Seven R’s of <i>Change Management</i> (ST 4.2.6.4) no requirement to learn list</td>
           <td>ST Page 11</td>
          </tr>
          <tr>
           <td><i>Event</i> (SO 4.1 1st paragraph)</td>
           <td>SO Page 6</td>
          </tr>
          <tr>
           <td><i>Alert</i> (SO Glossary)</td>
           <td>SO Page 6</td>
          </tr>
          <tr>
           <td><i>Incident</i> (SO 4.2)</td>
           <td>SO Page 7</td>
          </tr>
          <tr>
           <td><i>Impact, Urgency and Priority</i> (SO 4.2.5.4, 4.4.5.4)</td>
           <td>SO Page 7</td>
          </tr>
          <tr>
           <td><i>Service Request</i> (SO 4.3)</td>
           <td>SO Page 9</td>
          </tr>
          <tr>
           <td><i>Problem</i> (SO 4.4)</td>
           <td>SO Page 10</td>
          </tr>
          <tr>
           <td><i>Workaround</i> (SO 4.4.5.6)</td>
           <td>SO Page 10</td>
          </tr>
          <tr>
           <td><i>Known Error</i> (SO 4.4.5.7)</td>
           <td>SO Page 10</td>
          </tr>
          <tr>
           <td><i>Known Error Data Base (KEDB)</i> (SO 4.4.7.2)</td>
           <td>SO Page 10</td>
          </tr>
          <tr>
           <td>The role of communication in <i>Service Operation</i> (SO 3.6)</td>
           <td>SO Page 4</td>
          </tr>
          <tr>
           <td><i>Service Assets</i> (SS 3.2)</td>
           <td>SS Page 5</td>
          </tr>
          <tr>
           <td>Release policy (ST 4.1.4.2)</td>
           <td>SS Page 22</td>
          </tr>
          <tr>
           <td><i>It is recommended that this unit is covered as part of the training in the other units.If delivered as a standalone unit the recommended study period is 1.0 hour.</i></td>
           <td></td>
          </tr>
          <tr id="header">
           <td colspan="2">Key Principles and Models</td>
           
          </tr>
          <tr>
           <td>The purpose of this unit is to help the candidate comprehend, account for the key principles and <i>models of Service Management</i> and to balance some of the opposing forces within <i>Service Management</i>.</td>
           <td></td>
          </tr>
          <tr>
           <td>Describe basics of Value Creation through <i>Services</i> (SS 3.1.1, 3.1.2)</td>
           <td>SS Page 6</td>
          </tr>
          <tr>
           <td>Understand the importance of People, <i>Processes</i>, Products and Partners for <i>Service Management</i> (SD 2.4.2)</td>
           <td>SD Page 6</td>
          </tr>
          <tr>
           <td>Discuss the five major aspects of <i>Service Design</i> (SD 2.4.2)<ul><li><i>Service Portfolio</i> Design</li><li>Identification of <i>Business Requirements</i>,definition of Service requirements and <i>design of Services</i></li><li>Technology and architectural <i>design</i></li><li><i>Process design</i></li><li>Measurement <i>design</i></li></ul></td>
           <td>SD Page 5 (all)</td>
          </tr>
          <tr>
           <td>Explain the <i>Plan, Do, Check and Act</i> (PDCA) <i>Model to control and manage quality</i> (CSI 3.6, 5.5.1 Fig 5.6)</td>
           <td>CSI Page 6</td>
          </tr>
          <tr>
           <td><i>Explain the Continual Service Improvement Model</i> (CSI 2.4.4 Fig 2.3)</td>
           <td>CSI Pages 7 & 8</td>
          </tr>
          <tr>
           <td>Understand the role of measurement for Continual Service Improvement and explain the following  key elements:<ul><li>The role of KPIs in the Improvement Process (CSI 4.1.2)</li><li>Baselines (CSI 3.7.1) </li><li>Types of metrics (technology metrics, process metrics, service metrics) (CSI 4.1.2</li></ul></td>
           <td><br /><br />CSI Page 10<br/><br />CSI Page 11<br /><br />CSI Page 9</td>
          </tr>
          <tr>
           <td><i>The recommended study period for this unit is 1.5 hours</i>.</td>
           <td></td>
          </tr>
          <tr id="header">
           <td colspan="2">Processes</td>        
          </tr>
          <tr>
           <td>The purpose of this unit is to help the candidate understand how the <i>Service Management processes</i> contribute to the <i>Service Lifecycle</i>, to explain the high level <i>objectives, scope</i>, basic concepts, <i>activities</i> and challenges for five of the core <i>processes</i> and to state the <i>objectives</i> and some of the basic concepts for thirteen of the remaining <i>processes</i> including how they relate to each other.<br />The list of activities to be included from each process is the minimum required and should not be taken as an exhaustive list. </td>
           <td></td>
          </tr>
          <tr>
           <td><b><i>Service Strategy</i><br /> State the <i>objectives and basic concepts for:</i></b></td>
           <td></td>
          </tr>
          <tr>          
           <td><i>Demand Management</i> (SS 5.5)<br />The following list must be covered:<ul><li>Challenges in managing demand for services (SS 5.5.1)</li><li>Activity-based Demand Management (Patterns of business activity (PBAs)) (SS 5.5.2)</li><li>Business activity patterns and user profiles (User profiles) (SS 5.5.3)</li></ul></td>           
           <td><br /><br /><br />SS Pages 12 & 14<br /><br />SS Pages 12 & 14<br /><br />SS Page 13</td>
          </tr>
          <tr>          
           <td><i>Financial Management (SS 5.1 Intro, 5.1.2 intro)</i><ul><li>Business case</li></ul></td>           
           <td><br />SS Page 7</td>
          </tr>          
          <tr>           
           <td><b><i>Service Design Explain the high level <i>objectives</i>, basic concepts, process <i>activities and relationships</i> for:</b></td>
           <td></td>          
          </tr>
          <tr>          
           <td><i>Service Level Management (SLM) (SD 4.2.1, 4.2.2, 4.2.5, 4.2.5.1 - 9, CSI 3.5 )</i><br />The following list must be covered:<ul><li>Service-based SLA </li><li>Multi-level SLAs</li><li>Service level requirements (SLRs)</li><li>SLAM chart</li><li>Service review</li><li>Service improvement plan (SIP)</li></ul></td>           
           <td>SD Pages 7 to 10<br /><br /><br /><br />SD Page 8<br />SD Page 10<br />SD Page 9<br />SD Page 9<br />SD Page 10<br />SD Page 10</td>
          </tr>
          <tr>          
           <td><b><i>Service Design</i> State the <i>objectives and basic concepts for</i>:</b></td>
           <td></td>           
          </tr>
          <tr>          
           <td><i>Service Catalogue</i> Management (SD 4.1 Intro, 4.1.1, 4.1.4)</td>           
           <td>SD Page 6</td>
          </tr>
          <tr>           
           <td><i>Availability Management</i> (SD 4.4.1, 4.4.4)<ul><li>Service availability</li><li>Component availability</li><li>Reliability </li><li>Maintainability </li><li>Serviceability</li></ul></td>           
           <td>SD Pages 11 & 12<br /><br />SD Page 11<br />SD Page 11<br />SD Page 12<br />SD Page 12<br />SD Page 12</td>
          </tr>           
          <tr>          
           <td><i>Information Security Management</i> (ISM) (SD 4.6 Intro, 4.6.1, 4.6.4)<ul><li>Security framework (SD 4.6.4.1)</li><li>Information security policy (SD 4.6.4.2)</li><li>Information security management system (ISMS) (SD 4.6.4.3)</li></ul></td>           
           <td>SD Page 13 (all)</td>
          </tr>
          <tr>           
           <td><i>Supplier Management</i> (SD 4.7 Intro, 4.7.1)<ul><li>Supplier Contract Database (SCD) (SD 4.7.4)</li></ul></td>           
           <td>SD Page 14 (all)</td>
          </tr>
          <tr>           
           <td><i>Capacity Management</i> (SD 4.3.1, 4.3.4)<ul><li>Capacity plan</li><li>Business capacity management</li><li>Service capacity management</li><li>	Component capacity management</li></ul></td>           
           <td>SD Pages 15 & 16<br /><br />SD Page 15<br />SD Page 15<br />SD Page 16<br />SD Page 16</td>
          </tr>
          <tr>           
           <td><i>IT Service Continuity Management</i> (SD 4.5.1, 4.5.4) <ul><li>Business Continuity Plans</li><li>Business Continuity Management</li><li>Business Impact Analysis </li><li>Risk Analysis</li></ul></td>           
           <td>SD Pages 17 & 18<br /><br />SD Page 17<br />SD Page 17<br />SD Page 18<br />SD Page 18</td>
          </tr>
          <tr>           
           <td><b><i>Service Transition</i> Explain the high level <i>objectives</i>, basic concepts, process <i>activities</i> and relationships for: </b></td>
           <td></td>          
          </tr>          
          <tr>           
           <td><i>Change Management</i> (ST 4.2)<ul><li>Types of change request (ST 4.2.4.3, Table 4.3)</li><li>Change process models and workflows (ST 4.2.4.4)</li><li>Standard change (ST 4.2.4.5)</li><li>Remediation Planning (ST 4.2.5)</li><li>Change Advisory Board / Emergency Change Advisory Board (ST 4.2.6.8)</li></ul></td>           
           <td>ST Pages 6 to 13<br /><br />ST Pages 6 & 7<br />ST Page 10<br /><br />ST Page 7<br />ST Page 9<br />ST Pages 8 & 9</td>
          </tr>
          <tr>           
           <td><i>Service Asset and Configuration Management</i> (SACM) (ST 4.3.1, 4.3.4, 4.3.5) to include<ul><li>The Configuration Model</li><li>Configuration items </li><li>Configuration Management System (CMS)</li><li>Definitive Media Library</li><li>Configuration baseline</li></ul></td>           
           <td>ST Pages 14 to 17<br /><br /><br />ST Page 16<br />ST Page 14<br />ST Page 15<br />ST Page 15<br />ST Page 16</td>
          </tr>
          <tr>           
           <td><b><i>Service Transition</i> State the objectives and basic concepts for:</b></td>
           <td></td>           
          </tr>
          <tr>           
           <td><i>Release and Deployment Management</i> (ST 4.4.1, 4.4.4)</td>           
           <td>ST Pages 21 to 24</td>
          </tr>
          <tr>          
           <td><i>Knowledge Management</i> (ST 4.7 Intro, 4.7.1, 4.7.4)<ul><li>DIKW & SKMS</li></ul></td>           
           <td>ST Pages 18 to 20</td>
          </tr>
          <tr>           
           <td><b><i>Service Operation</i> Explain the high level <i>objectives</i>, basic concepts, process <i>activities</i> and relationships for:</b></td>
           <td></td>           
          </tr>           
          <tr>           
           <td><i>Incident Management</i> (SO 4.2, Fig 4.2)</td>           
           <td>SO Pages 7 & 8</td>
          </tr>
          <tr>           
           <td><i>Problem Management</i> (SO 4.4, Fig 4.4) not PM <i>techniques</i></td>           
           <td>SO Pages 10 to 12</td>
          </tr>
          <tr>          
           <td><b><i>Service Operation</i> State the <i>objectives and</i>, basic concepts for:</b></td>
           <td></td>          
          </tr>
          <tr>           
           <td><i>Event Management</i> (SO 4.1 Intro, 4.1.1, 4.1.4)</td>           
           <td>So Page 6</td>
          </tr>
          <tr>           
           <td><i>Request Fulfilment</i> (SO 4.3 Intro, 4.3.1, 4.3.4)</td>           
           <td>So Page 9</td>
          </tr>
          <tr>           
           <td><i>Access Management</i> (SO 4.5 Intro, 4.5.1, 4.5.4)</td>           
           <td>SO Pages 13 & 14</td>
          </tr>
          <tr id="header">
           <td colspan="2">Functions</td>                   
          </tr>
          <tr>           
           <td>The purpose of this unit is to help the candidate explain the <i>role, objectives and organizational</i> structures, of the <i>Service Desk function</i> and to state the <i>role, objectives</i> and overlap of three other <i>functions</i>.</td>           
           <td></td>
          </tr>
          <tr>          
           <td>Explain the <i>role, objectives</i> and <i>organizational</i> structures for the <i>Service Desk function</i> (SO 6.2)</td>           
           <td>SO Page 15</td>
          </tr>          
          <tr>           
           <td>State the <i>role, objectives</i> and <i>organizational</i> overlap of:<ul><li>The <i>Technical Management function</i> (SO 6.1.6.3 Intro, 6.3.1, 6.3.2)</li><li>The <i>Application Management function</i> (SO 6.5 Intro 6.5.1, 6.5.2)</li><li>The <i>IT Operations Management function</i> (IT Operations Control and Facilities Management) (SO 6.4 Intro, 6.4.1, 6.4.2)</li></ul></td>           
           <td><br /><br />SO  Page 18<br />SO Page 20<br />SO Page 19</td>
          </tr>
          <tr id="header">          
           <td colspan="2">Roles</td>    
          </tr>
          <tr>          
           <td>The purpose of this unit is to help the candidate account for and be aware of the responsibilities of some of the key roles in <i>Service Management</i>.Specifically, candidates must be able to:</td>
           <td></td>           
          </tr>
          <tr>          
           <td>Account for the <i>role</i> and the responsibilities of the<ul><li><i>Process owner</i> (SD 6.4 Intro, 6.4.1)</li><li><i>Service owner</i> (CSI 6.1 Intro, 6.1.4)</li></ul></td>           
           <td><br /><br />CSI Page 13<br />CSI Page 14</td>
          </tr>
          <tr>          
           <td>Recognize the <i>RACI</i> model and explain its role in determining <i>organizational</i> structure. (SD 6 Intro, CSI 6.2 – not RASI-VS or RASCI)</td>           
           <td>CSI Pages 16 to 18</td>
          </tr>          
          <tr>          
           <td><i>The recommended study period for this unit is 30 minutes.</i></td>          
           <td></td>
          </tr>
          <tr id="header">           
           <td colspan="2">Technology and Architecture</td>                     
          </tr>
          <tr>           
           <td>The purpose of this unit is to help the candidate to</td>
           <td></td>          
          </tr>
          <tr>           
           <td>Understand how <i>Service</i> Automation assists with integrating <i>Service Management</i> processes (SS 8.1)</td>           
           <td>SS Page 17</td>
          </tr>
          <tr>          
           <td><i>It is recommended that this unit is covered as part of the training in the other units.</i></td>
           <td></td>           
          </tr>
          <tr id="header">           
           <td colspan="2">ITIL Qualification Scheme</td>       
          </tr>
          <tr>          
           <td>Explain the ITIL <i>Qualification</i> scheme, distinguish between the purposes of the two intermediate streams, mention the included certificates, ITIL Expert and ITIL Master, and understand the different options for further training (Non examinable).</td>
           <td>Introduction Page 6 & 7</td>           
          </tr>
          <tr>          
           <td><i>The recommended study period for this unit is 15 minutes.</i></td>           
           <td></td>
          </tr>
          <tr id="header">           
           <td colspan="2">Mock Exam</td>      
          </tr>
          <tr>          
           <td>Sit minimum one ITIL Foundation mock exam</td>           
           <td></td>
          </tr>
          <tr>         
           <td><i>The recommended study period for this unit is 2.0 hours inclusive of revision.</i></td>           
           <td>Embedded within the Material is a final Mock exam.</td>
          </tr>
                   
         </table>      
        </td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
  <!-- Content End From Here-->
 <% End If %>
<!--#include virtual="/includes/connectionClose.asp"-->
</div>

<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->