<!--#include virtual="/metatags/comprehensive_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/innerwhyusbanner.html"-->
<!-- Body Starts -->

<% If Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Other"  Then 
 
 Response.Redirect("/index.asp")
 
 Else
  %>
<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" >&nbsp;</td>
            <td width="25%" >&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; WHY US &raquo; Success Rate</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px; width:97%;">
                <!-- Content Start From Here-->
                <h1 class="PageTitle"><br />
                <% If  Session("CountryOrigin") = "US" Or Session("CountryOrigin") = "Canada" Then  %>
                MOST SUCCESSFUL ITIL COURSE WITH 98% SUCCESS RATE</h1>
                <p>With a high success rate of 98% in Foundation in the first attempt, ITILstudy classroom course is the preferred high quality partner for delegates in the ITIL exams. </p>
                <p><span class="SubHeader">Our classroom course:</span>
                <ul>
                <li>Has been developed, assessed, and evaluated by several ITIL<sup>&reg;</sup> experts</li>
                <li>Is delivered by ITIL and PMP certified faculty with over 15 years of project and service management experience across industries</li>
                <li>Draws instructional elements from the three primary learning styles, i.e., visual (presentations, aids, etc.), auditory (verbal instructions, interactions, etc.) and kinesthetic (do-it-yourself)</li>
                <li>Comes with a unique and unmatched 100% Moneyback Guarantee</li>
                </ul>
                </p>
                <% Else %>
                Most Successful ITIL Foundation Course with 98% Success Rate and 100% Money Back Guarantee</h1>
				<p>Our classroom course has been developed, assessed, and evaluated by several ITIL Experts, and approved by APMG and CSME. Several interactive methods such as experiential learning, repetition, periodic evaluation and case studies are extensively used which makes the program very interesting.To improve the learning experience and to enhance retention of the concepts, our course draws instructional elements from the three primary learning styles, i.e., visual (presentations, aids, etc.), auditory (verbal instructions, interactions, etc.) and kinaesthetic (do-it-yourself). <br /><br />With our high quality and focused ITIL Foundation classroom training, 98% students have passed their ITIL Foundation exam.<span class="Required">*</span><br /><br />The 98% success rate consists of delegates who have passed the ITIL Foundation exam in the first attempt. This rate will go up siginificantly once the results are released for students who had availed of our exam retake guarantee.<br /><br />Our confidence in our classroom methodology, quality of our course content and the training that we offer is reflected in a unique and unmatched 100% Moneyback Guarantee - We guarantee that you will be successful in your ITIL<sup>&reg;</sup> Foundation exam after attending the classroom training program offered by us or we will pay for your exam retake. If you fail again, we will refund back your money as per our 100% Moneyback policy.<br /><br /><span class="Required">*</span>As per the most recent data available with us for January 2012</p>
                <% End If %>
                <% If Session("CountryOrigin") = "US" Or Session("CountryOrigin") = "Canada" Then %>
                <p><span class="general-bodyBold"><a href="/ITIL-Courses.asp">Enrol now</a></span> or <span class="general-bodyBold">Call</span> <font size="2px">001  855 234 8454 </font> to speak to an ITIL counsellor today.</p>
                <pre>
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                </pre>
                <p><font size="1px">Note:  The success rate is as per the most recent data available with us for January 2012.</font></p>
                <% End If %>
                

                <!-- Content End From Here-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<% End If %>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
