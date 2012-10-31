<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/innerwhyusbanner.html"-->
<!--#include virtual="/metatags/comprehensive_metatag.html"-->
<!-- Body Starts -->
<link href="css/style.css" rel="stylesheet" type="text/css" />
	<%
	Dim item_number 
	'rqAction  =  Request.Form("action")
		rqAction  =  Request.QueryString("action")
	'Response.write("Test	"&rqAction)
	rqType    =  Request.Form("type")
	item_number     =  Request.Form("item_number")
	
	%>
<script type="text/javascript">
function showVideo(){
window.open('/ITILdocs/tour/screen-video.html');
}
</script>

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; ITILstudy Online course</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px; width:97%;">
                <!-- Content Start From Here-->
                <p> Study guides, Chapter Tests and podcasts for all the chapters: 60 days(2 month) </p>

<span class="Sub_Header">This will provide you access to the following for 60 days(2 month) :</span>
                <ol>
                  <li> Study guides: Explain the goals, objectives, scope and basic concepts of core ITIL<sup>&reg;</sup> processes & functions and other syllabus areas of ITIL. </li>
                  <li> Chapter Tests and Evaluation Tests: These tests assess the delegate's degree of understanding of the respective chapter content.</li>
                 <li> Fill in the blanks: It helps the delegates to focus on the key terms with regards to each chapter. </li>
				 <li> APMG Sample Papers: To get a feel of the actual ITIL Intermediate exam, take the APMG's full length sample papers as part of our online course and assess your responses with the provided answers to the same. </li>
				 <li> PDU Certificate: 18 PMI PDUs certificate to help to cater to the needs of continuing education units for PMP certified professionals.</li></ol>
				 
				 
				 <p>Successful implementation of ITIL® Operational Support and Analysis best practices enables IT departments to reduce downtime and costs while improving customer satisfaction. In this course, the delegates learn how to plan, implement and optimize the Operational Support and Analysis processes and gain the skills required to take the ITIL® Intermediate Qualification: Operational Support and Analysis Certification Exam.</p>
                 
                 <span class="Sub_Header">Who Should Attend/Target Audience</span>

                 <p>This course is valuable for those who want to achieve ITIL® Intermediate Qualification: Operational Support and Analysis certification. The ITIL® V3 Foundation Certificate (or v2-V3 bridge equivalent) is required to take the ITIL® Certification Exam.</p>
                  <p>It is also strongly recommended that candidates:</p>
                   <p>Can demonstrate familiarity with IT terminology and understand the context of Operational Support and Analysis management of their own business environment</p> 
                   <p>Have experience working in the service management capacity within a service provider environment, with responsibility for at least one of the following management disciplines:</p>
                 <ul>
                 <li>Event Management Process</li>
                  <li>Incident Management Process</li>
                  <li>Request Fulfillment Process</li>
                  <li>Problem Management Process</li>
                  <li>Access Management Process</li>
                  <li>Service Desk</li>
                  <li>Technical Management</li>
                  <li>IT Operations Management</li>
                  <li>Application Management</li>
                  </ul><br />
                  <p>Please  <a href="/OSAOnlinecourse-syllabus.asp">click here</a> for the list of chapters covered in ITIL Intermediate Online course.</p>

			

                <!-- Content End From Here-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
