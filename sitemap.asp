<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerwhyusbanner.html"-->
<!--#include virtual="includes/connection.asp"-->
<!--#include virtual="/metatags/index_metatag.html"-->
<script language="JavaScript" type="text/javascript" src="/js/tableH.js"></script>

<div>
  <!-- Start #mainContent -->
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; Sitemap</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="80%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px; width:95%;"> <br />
                <div>
                  <table border="0" width="90%" align="center">
                    <tr>
                      <td ><span class="TableCopyName">WHY US</span>
                        <ul>
                         <%Session.Timeout=1000%>
						 <% If Session("CountryOrigin") = "Other" Then  %>
                          <li> <a href="/ITIL-Training/courseBenefits-Online.asp" onmouseover="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onmouseout="MM_swapImgRestore()">Online - Course Benefits</a></li>
						<% Else %>
                          <li> <a href="/ITIL-Training/better-than-competitors.asp" onmouseover="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onmouseout="MM_swapImgRestore()">Classroom - Better than Competitors</a></li>
                         <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin")="United Kingdom" Then %>
                          <li> <a href="/ITIL-Training/moneyBack.asp" onmouseover="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onmouseout="MM_swapImgRestore()">Classroom - Money Back Guarantee</a></li>
                         <% End If %>
                          <li> <a href="/ITIL-Training/courseBenefits.asp" onmouseover="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onmouseout="MM_swapImgRestore()">Classroom Course Benefits </a></li>
                         <% If Session("CountryOrigin") = "India" Then %>
                          <li> <a href="/ITIL-Training/bestPrice.asp" onmouseover="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onmouseout="MM_swapImgRestore()">Classroom Best Price </a></li>
                         <% End If %>
                          <li> <a href="/ITIL-Training/instructors.asp" onmouseover="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onmouseout="MM_swapImgRestore()">Classroom Best Faculty</a></li>
                         <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin")="United Kingdom" Then %>
                          <li> <a href="/ITIL-Training/free-onlinecertification.asp" onmouseover="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onmouseout="MM_swapImgRestore()">Classroom - Free 6sigma Green Belt Course / Free HRD</a></li>
                         <% End If %>
                          <li> <a href="/ITIL-Training/classroom-FAQ.asp" onmouseover="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onmouseout="MM_swapImgRestore()">Classroom FAQs </a></li>
                          <li> <a href="/ITIL-Training/comprehensive.asp" onmouseover="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onmouseout="MM_swapImgRestore()">Most Comprehensive and Effective</a></li>
                          <li> <a href="/ITIL-Training/exam-success.asp" onmouseover="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onmouseout="MM_swapImgRestore()">Most Successful and Popular</a></li>
                          <li> <a href="/ITIL-Training/PMI_PDU.asp" onmouseover="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onmouseout="MM_swapImgRestore()">PMI Approved PDUs </a></li>
						 
                         <% End If %>
                        </ul>
                         <span class="TableCopyName">COURSES/ENROLL</span>
                        <ul>
						 
                          <li> <a href="/ITIL-Online-Courses.asp" onmouseover="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onmouseout="MM_swapImgRestore()">ITIL Online Courses</a></li>
						  <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin")="United Kingdom" Then %>
                       
                          <li> <a href="/ITIL-Courses.asp" onmouseover="MM_swapImage('b','','/images/back/link_02_courses_enroll_green.jpg',1)" onmouseout="MM_swapImgRestore()">ITIL Classroom Courses</a></li>
						    <% End If %>
                        </ul>
                       </td>
                       <td width="2%" background="/images/back/left_line.jpg" class="general-body">&nbsp;</td>
                       <td><span class="TableCopyName">Free Resources</span>
                        <ul>
                           <li> <a href="/freeresources/freeGuidePodcast.asp">Free Study Guide and Podcast </a></li>
	 <li>  <a href="/freeresources/freeOnlineTest.asp" >Free 15 Question Test </a></li>
	  <li>  <a href="/freeresources/freeSimulatedTest.asp" >Free Simulated Exam </a></li>
       <li> <a href="/freeresources/aboutITIL.asp" >About ITIL </a></li>
                        </ul>
						<span class="TableCopyName">METHODOLOGY</span>
                        <ul>
						 <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin")="United Kingdom" Then %>
                          <li> <a href="/classroomTraining.asp" onmouseover="MM_swapImage('d','','/images/back/link_04_methodology_green.jpg',1)" onmouseout="MM_swapImgRestore()">Foundation Classroom Training</a></li>
						  <% End If %>
						   <li> <a href="/methodology/Online-Training.asp" onmouseover="MM_swapImage('d','','/images/back/link_04_methodology_green.jpg',1)" onmouseout="MM_swapImgRestore()">Foundation Online Training</a></li>
                        </ul>
                         <span class="TableCopyName">ABOUT US</span>
                        <ul>
                          <li><a href="/aboutus.asp" onmouseover="MM_swapImage('e','','/images/back/link_05_about_us_green.jpg',1)" onmouseout="MM_swapImgRestore()">Who We Are </a></li>
                          <li> <a href="/Affiliates.asp" onmouseover="MM_swapImage('e','','/images/back/link_05_about_us_green.jpg',1)" onmouseout="MM_swapImgRestore()">Affiliates</a></li>
                          <li> <a href="/contactus.asp" onmouseover="MM_swapImage('e','','/images/back/link_05_about_us_green.jpg',1)" onmouseout="MM_swapImgRestore()">Contact Us/Feedback</a> </li>
                        </ul>
						 <span class="TableCopyName">LOGIN</span>
                        <ul>
                          <li> <a href="/memberLogin.asp" onMouseOver="MM_swapImage('e','','/images/back/link_06_Login_green.jpg',1)" onMouseOut="MM_swapImgRestore()">Sign In </a></li>
                        </ul>
                       </td>
                      </tr>
                  </table>
                </div>
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
  <!-- end #mainContent -->
</div>
<!--#includes virtual="/includes/footer.html"-->
