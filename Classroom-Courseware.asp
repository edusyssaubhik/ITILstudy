<!--#include virtual="/metatags/index_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/FreeRes-aboutITIL-banner.asp"-->
<!--#include virtual="/includes/connection.asp"-->
<!-- Body Starts -->
<style type="text/css">

    img.imgBorder {
        border:1px solid #ddd;

    }
    table.tab {

    border-collapse:collapse;
    }
    table.tab td{
    border-bottom :1px solid #ccc;
    padding:10px;
    }

    td#lastTd {
    border-bottom:none;
    }
</style>
<% If Session("CountryOrigin") = "India" Or Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore"  Then  
 Response.Redirect("/index.asp")
 End If
%>
<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" >&nbsp;</td>
            <td width="25%" >&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; Classroom Courseware</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><h1 class="PageTitle">Classroom Courseware</h1>
			
                
              <div>
                <p class="Header">Our Course Materials:</p>
                <p>ITILstudy course materials have been put together by a panel of ITIL experts with 15+ years of industry experience in IT Service Management.  The methodology devised by ITILstudy has been time-tested and is evident in our high pass rate. ITILstudy provides the required materials such as Workbooks, Chapter Test books, Final test booklet, Process Charts, Case Studies and Gift-packs. The study material covers the goals, objectives and basic concepts of core ITIL processes & functions required for passing the exam. It seamlessly combines real life case scenarios to help the students to effectively implement ITIL concepts in their organisation. One of the major benefits we offer to delegates is that we provide one month FREE access to our online study materials which include process chart, study guides, exam tips.</p>

                  <i>Delegates don't have to bring anything other than the materials provided during the classroom course</i><br /><br />
                  <table class="tab">
                      <tr>
                          <td width="30%"><b>Student Workbook:</b><br />(Course book: 67 pages) <br /><img src="/images/courseware/workbook.jpg" class="imgBorder"/>
</td>
                           <td>The ITIL course content has been updated to align with the 2011 syllabus .The workbook consists of an Introduction and chapters on each components of the Service Lifecycle:  
                            <ul>
                            <li>Service Strategy,</li>
                            <li>Service Design, </li>
                            <li>Service Transition, </li>
                            <li>Service Operation and </li>
                            <li>Continual Service improvement. </li>
                            </ul>
                            The purpose, value, scope, objectives of the processes and function in each of these lifecycle phases as well as ITIL terminology is explained in detail. This workbook contains a simple yet informative, real life scenarios that help delegates grasp the important aspects of ITIL Foundation. Each chapter is complemented by a brief chapter test that emphasises retention of concepts learnt during the course.
                            </td>
                      </tr>

                      <tr>
                          <td width="30%"><b>Chapter Booklet </b><br />(Sample paper: 26 pages) <br /><img src="/images/courseware/chapterBooklet.jpg" class="imgBorder"/>
</td>
                           <td>Delegates can discuss as well as clarify doubts during the interactive session after each chapter while they are given feedback on areas of improvement. Chapter Test booklet also contains justifications for all chapter questions for further understanding of concepts. 
                            </td>
                      </tr>

                      <tr>
                          <td width="30%"><b>Mock exam paper:</b><br />(Sample paper:9 pages)
<br /><img src="/images/courseware/mockexam.jpg" class="imgBorder"/>
</td>
                           <td>This exam paper has been modelled based upon the ITIL Foundation exam questions. <br />
The mock test is conducted on the 2nd day, prior to the actual ITIL Foundation exam. It consists of 40 questions which mimics the original exam experience. It helps the candidates prepare for the final exam and assist them in understanding their strengths and weaknesses, prior to attempting the actual ITIL Foundation exam.

                            </td>
                      </tr>

                      <tr>
                          <td width="30%"><b>Case Scenarios:</b><br />(Case Scenario booklet: 16 pages)

<br /><img src="/images/courseware/casescenario.jpg" class="imgBorder"/>
</td>
                           <td>Implementation of ITIL framework is as necessary as the knowledge of ITIL concepts is, in making a successful organization.
ITILstudy understands this reality and has prepared case studies based on real life experiences which offer a balance between theoretical concepts and implementable knowledge of the ITIL framework. A service topic is chosen and is explained with reference to each component of the service lifecycle in ITIL Foundation. By this method, delegates can get an idea of how to formulate an ITIL culture in their respective organizations to improve delivery of service and productivity.


                            </td>
                      </tr>
                      <tr><td colspan="2"><i><span class="Required">*</span> Please note that some study materials may be collected by ITILstudy at the end of the classroom training.</i></td></tr>
                  
                  <tr><td colspan="2"><span class="Header">ITILstudy's Student Gift Set:</span><br /><br />
                  <img src="/images/courseware/gifts.jpg" /><br />
                  Classroom students are provided gifts like backpack, assorted color highlighters, pencil, mark–up notes and assorted color pen. <br /><br />
                      </td></tr>

                      <tr><td colspan="2" id="lastTd">
                  <span class="Header">ITILstudy's Course Completion Certificate:</span><br /><br />
                  <img src="/images/courseware/certificates.png" /><br /><br />
                  The course completion certificate is provided after successful completion of 2 days of the classroom training program.
                </td></tr>
                </table>
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>

<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->

