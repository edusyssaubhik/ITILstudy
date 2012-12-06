<!--#include virtual="/metatags/index_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/FreeRes-aboutITIL-banner.asp"-->
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
                 
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><h1 class="PageTitle">ITILstudy's Course Materials</h1><br />
              <div>
                <p>ITILstudy course materials have been designed by a panel of ITIL experts with more than 15 years of industry experience in IT Service Management. ITILstudy has created a time-tested methodology, which is backed by high pass rates. ITILstudy provides students with all the materials they need, including workbooks, chapter test books, a final test booklet, process charts, case studies and gift packs. The study material details the goals, objectives and basic concepts of core ITIL processes and functions - everything students need to know to pass the exam. It seamlessly combines real-life examples with ITIL concepts to help students effectively implement ITIL concepts in their organizations. One of the major benefits ITILstudy offer students is one month of <b>free</b> access to online study materials, which include process charts, study guides and exam tips.</p>

                  <i>Students do not have to bring anything to class - all materials are provided!</i><br /><br />
                  <table class="tab">
                      <tr>
                          <td width="30%"><b>Student Workbook:</b><br />(67 pages) <br /><img src="/images/courseware/workbook.jpg" class="imgBorder"/>
</td>
                           <td>ITILstudy course content has been updated to align with the 2011 syllabus. The workbook contains an introduction along with chapters detailing each stage of the Service Lifecycle:    
                            <ul>
                            <li><i>Service Strategy,</i></li>
                            <li><i>Service Design,</i> </li>
                            <li><i>Service Transition,</i> </li>
                            <li><i>Service Operation and </i></li>
                            <li><i>Continual Service improvement.</i> </li>
                            </ul>
                            The purpose, value, scope and objectives of each process and function as well as ITIL terminology is explained in detail. This workbook contains simple yet informative real-life scenarios that help delegates contextualize the important concepts of ITIL. Each chapter is complemented by a brief chapter test that reinforces retention and application of important concepts.
                            </td>
                      </tr>

                      <tr>
                          <td width="30%"><b>Chapter Booklet </b><br />(26 pages) <br /><img src="/images/courseware/chapterBooklet.jpg" class="imgBorder"/>
</td>
                           <td>Delegates can discuss as well as clarify doubts during the interactive session after each chapter while they are given feedback on areas of improvement. The chapter test booklet also contains justifications for all the chapter test questions to help students understand each concept. 
                            </td>
                      </tr>

                      <tr>
                          <td width="30%"><b>Mock exam paper:</b><br />(9 pages)
<br /><img src="/images/courseware/mockexam.jpg" class="imgBorder"/>
</td>
                           <td>This exam paper has been modelled on the ITIL Foundation exam questions. <br />
The mock test is conducted on the second day of class, prior to the actual ITIL Foundation exam. The practice test consists of 40 questions that mimic the real exam. It helps students prepare for the final exam and assists them in understanding their strengths and weaknesses.


                            </td>
                      </tr>

                      <tr>
                          <td width="30%"><b>Case Scenarios:</b><br />(16 pages)

<br /><img src="/images/courseware/casescenario.jpg" class="imgBorder"/>
</td>
                           <td>Implementation of ITIL framework is as necessary as the knowledge of ITIL concepts is, in making a successful organization.
ITILstudy understands this reality and has prepared case studies based on real-life experiences, which offers a balance between theoretical concepts and implementable knowledge of ITIL framework. A service topic is chosen and is explained with reference to each component of the Service Lifecycle in ITIL Foundation. With this method, delegates can get an idea of how to formulate an ITIL culture in their respective organizations to improve delivery of service and productivity.



                            </td>
                      </tr>
                      <tr><td colspan="2">
                          <i><span class="Required">*</span> Please note that some study materials may be collected by ITILstudy at the end of the course.</i>

                          </td></tr>
                  
                  <tr><td colspan="2"><span class="Header">ITILstudy's Student Gift Set:</span><br /><br />
                  <img src="/images/courseware/gifts.jpg" /><br />
                  Classroom students are provided gift packs including backpacks, assorted highlighters, pencils, mark-up notes and pens. <br /><br />
                      </td></tr>

                      <tr><td colspan="2" id="lastTd">
                  <span class="Header">ITILstudy's Course Completion Certificate:</span><br /><br />
                  
                  On completion of ITILstudy's course, students are awarded a Course Completion Certificate.<br /><br />
                          <img src="/images/courseware/certificates.png" width="620" height="420"/><br /><br />
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

