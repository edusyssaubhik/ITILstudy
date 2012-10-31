<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innermethodologybanner.html"-->
<!-- Body Starts -->
<%' If Session("FirstName") = "" Then 
'response.Redirect("/memberlogin.asp")
'Else
%>
<script type="text/javascript">
function showVideo(){
window.open('http://65.182.191.206/projdocs/ITIL/tutorial/screen-video.html');
}
</script>

<div>
<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  
  <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
  
  <table width="100%" border="0" cellspacing="0" cellpadding="8">
    <tr>
      <td width="2%" class="Header">&nbsp;</td>
      <td width="25%" class="PageTitle">&nbsp;</td>
      <td width="73%" class="PageTitle">Course Details</td>
    </tr>
    <tr>
      <!--#include virtual="/includes/innerLeftMenu.asp"-->
      <input type="hidden" name="rollno" value="<%=Session("rollNo")%>"  />
      <input type="hidden" name="ID" value="<%=Session("ID")%>"  />
      <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><!-- Content Start From Here-->
        <span class="Header">Name: <%=Session("FirstName")%>&nbsp;<%=Session("LastName")%></span>
        <p><span class="SubHeader">Your membership and access details: </span></p>
        <table width = "60%" border="0" cellpadding="0" cellspacing="0" class="TableGeneral">
          <tr>
            <td class="TableRowOdd"><span class="TableCopyDetails">Date of enrollment:</span></td>
            <td class="TableRowOdd"><span class="TableCopyName"><%=Session("DateEntered")%></span></td>
          </tr>
          <tr>
            <td class="Tablefooter"><span class="TableCopyDetails">Date of expiry:</span></td>
            <td class="Tablefooter"><span class="TableCopyName"><%=Session("DateValid")%></span></td>
          </tr>
        </table>
        <br />
        <span class="general-bodyBold">(All dates in MM/DD/YYYY format)</span>
    </div>
    
    <br /><br />
	
<div><span class="general-bodyBold">Course Duration: </span> <%=Session("CourseDetails")%></div>



	<!-- <p><span class="general-bodyBold">Duration of access: </span><% '= DateDiff("d",Session("DateEntered"),Session("DateValid")) %> Days</p>-->
	 
	<!-- <p>Please <a href="" onclick="showVideo();">click here</a> for the Tour of ITIL Foundation online course.</p>-->
     
     	 <p>Please <a href="http://www.apmg-international.com/home/TermsandConditions.asp" target="_blank">click here</a> to know about the APMG terms and conditions.</p>

     
 <% If Session("State") = "verified1" OR Session("State") = "verified2" OR Session("State") = "verified3" OR Session("State") = "verified5" OR Session("State") = "verified6" OR Session("State") = "verified7"  Then %>
      <p><b>Course Overview:</b></p>

 <ul type="1">
 <li><b>Study guides:</b> Explain the goals, objectives, scope and basic concepts of core ITIL processes & functions and other syllabus areas of ITIL.
    
  </li>
  <li><b>Chapter Tests and Evaluation Tests:</b> These tests assess the delegate's degree of understanding of the respective chapter content.</li>
     
<li><b>Fill in the blanks: </b>It helps the delegates to focus on the key terms with regards to each chapter. </li>

  <li><b>APMG Sample Papers: </b>To get a feel of the actual ITIL Foundation exam, take the APMG's full length sample papers as part of our online course and assess your responses with the provided answers to the same. </li>
  <li><b>Mock Test:</b> To further strengthen your preparation and improve on the weaker areas before you attempt the actual exam.This test is only accessible after completing all the chapter tests and evaluation tests.</li>
  <li><b>PDU Certificate:</b> Helps to cater to the needs of continuing education units for PMP certified professionals.</li>
  <% If Session("State") = "verified1" OR Session("State") = "verified6" OR Session("State") = "verified7"  Then %>
  <li><b>Exam Voucher:</b> Use this section to generate your exam voucher. This voucher would be used while booking your exam, for more details, please read the terms of use on the exam voucher. This section is only accessible after successfully completing the mock test.</li>
  <% End If %>
  </ul>
  
<!-- <p> The online course is designed to be flexible to suit the convenience of the student in terms of time and effort. However, we recommend that the allocation of time to cover the study materials provided as part of our online course may be as follows:</p>

<ul type="disc">
<li><b>Foundation Study Materials:</b><br /><br />
<ul type="a">
     <li> Pre-prep (Fill in the Blanks) - Five days </li>
             
              <li>Study guides - Thirty Five days</li> 
               <li> Chapter tests – Twenty  days</li>
   </ul>
   </li>
   </ul>
<p>The students can however allocate days of study different from the above recommendation depending upon their individual aptitude, skill sets, experience, and levels of comprehension.</p>
-->
 
 
 
  <%ElseIf Session("State") = "verified1" OR Session("State") = "verified2" OR Session("State") = "verified3" OR Session("State") = "verified5" OR Session("State") = "verified6" OR Session("State") = "verified7"  Then  %>
         
         Please <a href="" onclick="showVideo(); return false;" >click here</a> for the Tour of ITIL  Foundation online course
          <p><b>Course Overview:</b></p>
               
              
<ul type="1">
<li>Study Guides:<br /><br />
<ul type="disc">
<li>Explain the goals, objectives, scope and basic concepts of core ITIL processes
& functions and other syllabus areas of ITIL.
</li>
</ul>
</li>

<li>Chapter Tests:<br /><br />
<ul type="disc">
<li>The Chapter Tests assess the student's degree of understanding of the
respective chapter content.
</li>
</ul>
</li>
<li> APMG Sample Test</li></ul>

The online course is designed to be flexible to suit the convenience of the student in terms
of time and effort. However, we recommend that the allocation of time to cover the study
materials provided as part of our online course may be as follows:<br /><br />

<ul type="disc">
            <li><b>Foundation course material includes:</b><br /><br />
            <ul type="a">
                <li><span class="SubHeader"> Learning through the Study guides - </span> Ten hours </li>
             
              <li><span class="SubHeader">Practice through Exercises:</span><br /><br />
              <ul type="disc">
              <li>Chapter tests - Two hours</li>
              <li>Fill in the Blanks - Two hours</li>
               <li>Evaluation test- Two hours	</li>
              </ul>
               </li> 
               <li><span class="SubHeader">Practice on APMG Sample Paper and Mock Paper </span> - Three hours</li>
               </ul>
               </li>
               </ul>


            <p>Please <a href="/ITIL/ITIL-TimeRequire.asp">click here</a> to know more about minimum time required to complete the course<br /><br />
            The students can however take their own time to study different concepts depending upon their individual aptitude, skill sets, experience, and levels of comprehension.The validity of the course, though, would remain to be 2 months and therefore, the course has to be completed within 2 months.</p>
            
                <%
	  'FOR ITIL Intermediate (CSI) Online course'
	  ElseIf Session("State") = "verified9" OR Session("State") = "verified11"  Then  %>
         
          <p><b>Course Overview:</b></p>
               
              
<ul type="1">
<li>Study Guides:<br /><br />
<ul type="disc">
<li>Present a complete overview of Continual Service Improvement including all its
related activities: Continually align and realign IT services to changing business needs by identifying and implementing improvements to IT services that support business processes.
</li>
</ul>
</li>

<li>Chapter Tests:<br /><br />
<ul type="disc">
<li>
The Chapter Tests assess the student's degree of understanding of the respective chapter content. 
</li>
</ul>
</li>
<li>Scenario based Chapter Tests:<br /><br />
<ul type="disc">
<li>
Scenario based Chapter Tests will help the student to understand and apply Bloom’s Taxonomy level 3 & 4 while analysing various scenarios pertaining to each chapter.
</li>
</ul>
</li>
<li>APMG Sample Tests:<br /><br />
<ul type="disc">
<li>
Two full-length APMG Sample Paper presented in the form of mock-exam facilitates the student to face the actual exam.</li>
</ul>
</li>
</ul>
The online course is designed to be flexible to suit the convenience of the student in terms of time and effort. However, we recommend that the allocation of time to cover the study materials provided as part of our online course may be as follows:<br /><br />

<ul type="disc">
            <li><b>Intermediate Study Materials:</b><br /><br />
            <ul type="a">
              <li>Pre-prep (Fill in the Blanks) - Five days </li>
              <li>Study guides - Thirty Five days</li>
               <li>Chapter tests – Twenty days</li>
              </ul>

            <p>The students can however allocate days of study different from the above recommendation depending upon their individual aptitude, skill sets, experience, and levels of comprehension.</p>
            
            
 
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
