<!--#include virtual="/metatags/courseBenefits_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/FreeRes-aboutITIL-banner.asp"-->
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
 'Declare The Variables'
'======================================================='

 Dim rqafterEBDiscountPrice, rqcurrencyformat, rqapplicabledays
 Dim strQuery ,objRs, rqebdiscount

Set objRs = Server.CreateObject("ADODB.Recordset")

'Query to get the values from ITIL_countrydetails table
 strQuery = "SELECT ebdiscount, afterEBDiscountPrice,applicabledays FROM ITIL_countrydetails WHERE country = '" & Session("CountryOrigin") & "'"	

'Response.Write(strQuery)

  objRs.Open strQuery,ConnObj
  
	
  Do Until objRs.EOF
  
	rqebdiscount = objRs("ebdiscount")
	rqafterEBDiscountPrice = objRs("afterEBDiscountPrice")
	rqapplicabledays = objRs("applicabledays")
	
  objRs.Movenext
  Loop

  objRs.Close
%>
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="25%" >&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; Specialized ITIL Training  </td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px; width:97%;">
              <!-- Content Start From Here--><br />
			  <h1 class="PageTitle">SPECIALIZED IN ITIL EXAM PREP TRAINING</h1>
                  <p>

                      ITILstudy is an expert provider of ITIL<sup>&reg;</sup> exam prep trainings. Unlike several other providers that offer multiple training options on one website, ITILstudy has a dedicated website with 35+ expert global ITIL expert faculty and a dedicated support and relationship management team. Our expertise and focus on project management has helped us become pioneers in ITIL<sup>&reg;</sup> and project management trainings globally.<br /><br />

Unlike several other provders, ITILstudy extensively uses case studies, role-plays and examples in our classes to emphasize practical application of theoretical concepts - which help our students relate to real-life scenarios in their work environment.<br /><br />

The quality of our study material, our <a href="/classroomTraining.asp">study methodology</a> and <a href="/ITIL-Training/instructors.asp">our faculty</a> has helped us achieve one of the best success rates in the industry - 99.2%.<br /><br />

We take pride in the quality of our faculty members, who are the best in the industry, have 15+ years of project management experience each, and have been trained in ITILstudy boot camp techniques and adult learning processes to deliver an exceptional training experience.<br /><br />

You will be taught by a faculty member in your local area who understands local issues and relates to project management concepts through appropriate examples, role-plays, and case studies.<br /><br />

Please contact us today. We would be pleased to customize the project management training course based on your requirements.<br /><br /></p>

                      <form action="/enrollclass.asp">
                          <input type="submit" value="Enroll Now" class="ButtonSmall">
                      </form><br />
<p>


    <a href="/ITIL-Training/better-than-competitors.asp">Read and see for yourself how ITILstudy compares with other ITIL<sup>&reg;</sup> exam prep Boot camp providers. </a><br /><br />

<a href="/feedback_class.asp">Read the feedback provided by some of our successful students </a><br /><br />

<a href="/course-syllabus.asp">Read the syllabus for our classroom program </a><br /><br />

<a href="/ITIL-Courses.asp">Find class dates and locations that are convenient for you </a><br /><br />

We provide attractive discount for bulk enrollments and for corporate programs. For details, please email <a href="mailto:marketing@ITILstudy.com">marketing@ITILstudy.com</a>.

</p>

                  
              <!-- Content End From Here-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
