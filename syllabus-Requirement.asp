<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innermethodologybanner.html"-->
<!-- Body Starts -->

<%' If Session("FirstName") = "" Then 
'response.Redirect("/memberlogin.asp")
'Else
%>

<div>
<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  
  <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
  
  <table width="100%" border="0" cellspacing="0" cellpadding="8">
    <tr>
      <td width="2%" class="Header">&nbsp;</td>
      <td width="25%" class="PageTitle">&nbsp;</td>
      <% If Session("State") = "verified1" OR Session("State") = "verified2" OR Session("State") = "verified3" OR Session("State") = "verified5" OR Session("State") = "verified6" OR Session("State") = "verified7" OR Session("State") = "verified13" Then  %>       
      <td width="73%" class="PageTitle">ITIL<sup>&reg;</sup> Foundation Course Syllabus</td>
    <%'CSI' 
	ElseIf Session("State") = "verified9"  Then  %>
  <td width="73%" class="PageTitle">ITIL<sup>&reg;</sup> Intermediate (CSI) Online course </td>
  	<% ElseIf Session("State") = "verified11"  Then  %>
  <td width="73%" class="PageTitle">ITIL<sup>&reg;</sup> Intermediate (OSA) Online course </td>
      
         <% End If %>
    </tr>
    <tr>
      <!--#include virtual="/includes/innerLeftMenu.asp"-->
      <input type="hidden" name="rollno" value="<%=Session("rollNo")%>"  />
      <input type="hidden" name="ID" value="<%=Session("ID")%>"  />
      <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><!-- Content Start From Here-->
  
  


<% If Session("State") = "verified1" OR Session("State") = "verified2" OR Session("State") = "verified3" OR Session("State") = "verified5" OR Session("State") = "verified6" OR Session("State") = "verified7" OR Session("State") = "verified13" Then  %>
<span class="Header">Syllabus </span>
      <!--  <p>To know more about ITIL Foundation course syllabus and how this course relates to different syllabus areas, please <a href="/ITIL/ITIL-CourseSyllabus.asp">click here</a> </p> -->

 <p>The ITIL Foundation course syllabus consists of 5 Lifecycle modules which include 20 core processes and 4 core functions.</p>
 
  <b>The 5 Lifecycle modules are:</b>

 <ul type="disc">
 <li>Service Strategy</li>
  <li>Service Design</li>
  <li>Service Transition</li>
  <li>Service Operation</li>
  <li>Continual Service Improvement</li>
  </ul>
  
 <b>20 core Processes are:</b>

<ul type="disc">
<li>Service Portfolio Management</li>
<li>Financial Management</li>
<li>Demand Management</li>
<li>Supplier Management</li>
<li>Service Level Management</li>
<li>Service Catalogue Management</li>
<li>Availability Management</li>
<li>Capacity Management</li>
<li>IT Service Continuity Management</li>
<li>Information Security Management</li>
<li>Service Asset & Configuration Management</li>
<li>Change Management</li>
<li>Release & Deployment Management</li>
<li>Knowledge Management</li>
<li>Incident Management</li>
<li>Problem Management</li>
<li>Event Management</li>
<li>Request Fulfilment Management</li>
<li>Access Management</li>
<li>Continual Service Improvement</li>
  </ul>
  
  

<b>4 core Functions are:</b><br />
 

 <ul type="disc">
 <li>Service Desk</li>
  <li>Technical Management</li>
  <li>IT Operations Management</li>
  <li>Application Management</li>
  </ul>

<% 
'CSI'
ElseIf Session("State") = "verified9"  Then  %>
<span class="Header">Syllabus </span>
     
 <p>The ITIL Intermediate CSI course syllabus consists of 8 modules which comprises of complete understanding of Continual Service Improvement terms and core concepts.</p>
 

<ul type="1">
<li>Introduction to Continual Service Improvement : </li>
<li>Continual Service Improvement Principles</li>
<li>Continual Service Improvement Processes</li>
<li>Continual Service Improvement Methods & Techniques</li>
<li>Organisation for Continual Service Improvement </li>
<li>Technology for Continual Service Improvement </li>
<li>Implementing Continual Service Improvement </li>
<li>Critical Success Factors & Risks</li>
  </ul>
  
 <% 'End If %>
 
 <% 
'CSI'
ElseIf Session("State") = "verified15"  Then  %>
<span class="Header">Syllabus </span>
     
 <p>The ITIL Service Transition course syllabus consists of 8 modules which comprises of complete understanding of Service Transition terms and core concepts.</p>
 

<ul type="1">
<li>Introduction to Service Transition</li>
<li>Service Transition principles</li>
<li>Service Transition processes</li>
<li>Managing people through Service Transitions</li>
<li>Organizing for Service Transition</li>
<li>Technology considerations</li>
<li>Implementation and improving Service Transition</li>
<li>Challenges, critical success factors and risks</li>

  </ul>
  	
  <% 

ElseIf Session("State") = "verified16"  Then  %>
<span class="Header">Syllabus </span>
     
 <p>The ITIL Service Design course syllabus consists of 8 modules which comprises of complete understanding of Service Design terms and core concepts.</p>
 

<ul type="1">
<li>Introduction to Service Design</li>
<li>Service Design principles</li>
<li>Service Design processes</li>
<li>Service Design technology related activities</li>
<li>Organizing for Service Design</li>
<li>Technology considerations</li>
<li>Implementation and improvement of Service Design</li>
<li>Challenges, critical success factors and risks</li>
 </ul>
 
 <% 

ElseIf Session("State") = "verified17"  Then  %>
<span class="Header">Syllabus </span>
     
 
<ul type="1">
<li>Introduction to Service Operation</li>
<li>Service Operation Principles</li>
<li>Service Operation Processes</li>
<li>Common Service Operation activities</li>
<li>Organising for Service Operation</li>
<li>Technology Considerations</li>
<li>Implementation of Service Operation</li>
<li>Challenges, critical success factors and risks</li>
 </ul>
  
  
   <% 
'CSI'
ElseIf Session("State") = "verified14"  Then  %>
<span class="Header">Syllabus </span>
     
 <p>The ITIL Service Strategy course syllabus consists of 8 modules which comprises of complete understanding of Service Strategy terms and core concepts.</p>
 

<ul type="1">
<li>Introduction to Service Strategy </li>
<li>Service Strategy principles</li>
<li>Service Strategy  processes</li>
<li>Governance</li>
<li>Organising for Service Strategy </li>
<li>Technology considerations</li>
<li>Implementing Service Strategy </li>
<li>Service Strategy challenges, risks & critical success factors</li>
  </ul>
  
 <% 
'OSA'
ElseIf Session("State") = "verified11"  Then  %>
<span class="Header">Syllabus </span>
     
 <p>The ITIL Intermediate OSA course syllabus consists of 9 modules which comprises of complete understanding of Operational Support & Analysis terms and core concepts.</p>
 

<ul type="1">
<li>Introduction to Service Management : </li>
<li>Event Management</li>
<li>Incident Management</li>
<li>Request Fulfilment</li>
<li>Problem Management </li>
<li>Access Management </li>
<li>Service Desk </li>
<li>Service Operation Functions</li>
<li>Technology & Implementation </li>
  </ul>
<%'PPO'
ElseIf Session("State") = "verified18"  Then  %>
<span class="Header">Syllabus </span>
     
 <p>The ITIL Intermediate PPO course syllabus consists of 8 modules which comprises of complete understanding of Continual Service Improvement terms and core concepts.</p>
 

<ul type="1">
<li>Introduction to PPO </li>
<li>Capacity Management</li>
<li>Availability Management</li>
<li>IT Service Continuity Management</li>
<li>Information Security Management</li>
<li>Demand Management </li>
<li>PPO roles and responsibilities</li>
<li>Technology and implementation cosideration</li>
  </ul>  
 
<%'SAO'
ElseIf Session("State") = "verified19"  Then  %>
<span class="Header">Syllabus </span>
     
 <p>The ITIL Intermediate SOA course syllabus consists of 8 modules which comprises of complete understanding of Continual Service Improvement terms and core concepts.</p>


<ul type="1">
<li> Introduction </li>
<li>Service portfolio management</li>
<li>Service Catalogue management</li>
<li>Service level management</li>
<li>Demand management</li>
<li>Supplier management</li>
<li>Financial management for IT services</li>
<li>Business relationship management</li>
<li>Service offerings and agreements roles and responsibilities</li>
<li>Technology and implementation considerations</li>
  </ul>
  
<%'RCV'
ElseIf Session("State") = "verified20"  Then  %>
<span class="Header">Syllabus </span>
     
 <p>The ITIL Intermediate RCV course syllabus consists of 8 modules which comprises of complete understanding of Continual Service Improvement terms and core concepts.</p>
 

<ul type="1">
<li>Introduction to PPO </li>
<li>Capacity Management</li>
<li>Availability Management</li>
<li>IT Service Continuity Management</li>
<li>Information Security Management</li>
<li>Demand Management </li>
<li>PPO roles and responsibilities</li>
<li>Technology and implementation cosideration</li>
  </ul>
 <% End If %>	
  
 
    <!-- Content End From Here-->
    </div>
    
    </td>
    
    </tr>
    
  </table>
  </td>
  
  </tr>
  
</table>
</div>
<!-- Body Ends -->
<% 'End If %>
<!--#include virtual="/includes/footer.html"-->
