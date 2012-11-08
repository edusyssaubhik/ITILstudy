<!--#include virtual="/metatags/comprehensive_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/guaranteed-success-banner.asp"-->
<!-- Body Starts -->

<% If Session("CountryOrigin") = "Other"  Then 
 
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
                <%' If  Session("CountryOrigin") = "US" Or Session("CountryOrigin") = "Canada" OR  Session("CountryOrigin") = "Germany"  Then  %>
                Most Successful ITIL Course with 99.2% Success Rate</h1>
                <p>With a high success rate of 99.2% in the first attempt, ITILstudy classroom course is the preferred high quality partner for delegates in the ITIL Foundation exam.</p>
                <p>CSME official report for past 6 months proves that our pass rates are significantly higher than average pass rate for ITIL Foundation training.</p>
                 <p><img src="/images/buttons/ITILpassrate.png" width="600" border="0"><br />     Source : CSME reports indicating the pass rates of VMEdu compared with CSME pass rates.</p>
                
                <p><span class="SubHeader">Our classroom course:</span>
                <ul>
                <li>Has been developed, assessed, and evaluated by several ITIL<sup>&reg;</sup> experts</li>
                <li>Is delivered by ITIL certified faculty (approved by APMG or CSME) with over 15 years of project and service management experience across industries</li>
                <li>Draws instructional elements from the three primary learning styles, i.e., visual (presentations, aids, etc.), auditory (verbal instructions, interactions, etc.) and kinesthetic (do-it-yourself)</li>
                <%If Session("CountryOrigin") <> "India" Then %>
                <li>Comes with a unique and unmatched 100% Moneyback Guarantee</li>
                <%End If %>
                </ul>
                </p>
                <%' ElseIf  Session("CountryOrigin") = "India" Then  %>
                
                 <!--  Most Successful ITIL Foundation Course with 99.2% Success Rate </h1>
				<p>Our classroom course has been developed, assessed, and evaluated by several ITIL Experts, and approved by APMG and CSME. Several interactive methods such as experiential learning, repetition, periodic evaluation and case studies are extensively used which makes the program very interesting.To improve the learning experience and to enhance retention of the concepts, our course draws instructional elements from the three primary learning styles, i.e., visual (presentations, aids, etc.), auditory (verbal instructions, interactions, etc.) and kinaesthetic (do-it-yourself). <br /><br />With our high quality and focused ITIL Foundation classroom training, 99.2% students have passed their ITIL Foundation exam.<span class="Required">*</span><br /><br />The 99.2% success rate consists of delegates who have passed the ITIL Foundation exam in the first attempt. <br /><br /><span class="Required">*</span> The success rate is as per the most recent data available with us for  May 2012  - June 2012.</p>-->
                
                <%' ElseIf Session("CountryOrigin") <> "US" AND  Session("CountryOrigin") <> "Canada" AND  Session("CountryOrigin") <> "India"  Then %>
                
              <!--  Most Successful ITIL Foundation Course with 99.2% Success Rate and 100% Money Back Guarantee</h1>
				<p>Our classroom course has been developed, assessed, and evaluated by several ITIL Experts, and approved by APMG and CSME. Several interactive methods such as experiential learning, repetition, periodic evaluation and case studies are extensively used which makes the program very interesting.To improve the learning experience and to enhance retention of the concepts, our course draws instructional elements from the three primary learning styles, i.e., visual (presentations, aids, etc.), auditory (verbal instructions, interactions, etc.) and kinaesthetic (do-it-yourself). <br /><br />With our high quality and focused ITIL Foundation classroom training, 99.2% students have passed their ITIL Foundation exam.<span class="Required">*</span><br /><br />The 99.2% success rate consists of delegates who have passed the ITIL Foundation exam in the first attempt. This rate will go up siginificantly once the results are released for students who had availed of our exam retake guarantee.<br /><br />Our confidence in our classroom methodology, quality of our course content and the training that we offer is reflected in a unique and unmatched 100% Moneyback Guarantee - We guarantee that you will be successful in your ITIL<sup>&reg;</sup> Foundation exam after attending the classroom training program offered by us or we will pay for your exam retake. If you fail again, we will refund back your money as per our 100% Moneyback policy.<br /><br /><span class="Required">*</span> The success rate is as per the most recent data available with us for  May 2012  - June 2012.</p>-->
                <%' End If %>
                <%' If Session("CountryOrigin") = "US" Or Session("CountryOrigin") = "Canada"  Or Session("CountryOrigin")= "United Kingdom" Or Session("CountryOrigin")= "Germany" Then%>
                <p><span class="general-bodyBold"><a href="/ITIL-Courses.asp">Enrol now</a></span> or <span class="general-bodyBold">Call</span> <font size="2px"><%if Session("CountryOrigin")= "United Kingdom" Then%>0800 0337 947<%elseIf Session("CountryOrigin") = "US" Or Session("CountryOrigin") = "Canada" Then%>001  855 234 8454<%elseIf Session("CountryOrigin") = "Germany" Then%>+49 069 344643 <%End if%> </font> to speak to an ITIL trainer today.</p>
                <pre>
            
                
                
                </pre>
                <p><font size="1px">Note: The success rate is as per the most recent data available with us for  May 2012 - June 2012 including exam retake.</font></p>
                <% 'End If %>
                

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
