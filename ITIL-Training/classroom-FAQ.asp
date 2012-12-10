<!--#include virtual="/metatags/classroom-FAQ_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/guaranteed-success-FAQ-banner.asp"-->
<!--#include virtual="/includes/connection.asp"-->
<link rel="stylesheet" type="text/css" href="/css/faq.css">

<!-- Body Starts -->
<%
'Declare The Local Variable'
Dim strCourseDetails
Dim objRsCourseDetails
Dim Price
Dim EBDiscount
Dim AfterEBDiscount
Dim Tax
Dim ApplicableDays

Set objRsCourseDetails = Server.CreateObject("ADODB.Recordset")

'Sql Query For Retrive Counry Prices and Applicable days'

strCourseDetails = "SELECT starttime,endtime,payments FROM itil_countrydetails WHERE country = '" & Session("CountryOrigin") & "'"

objRsCourseDetails.Open strCourseDetails,ConnObj

Do Until objRsCourseDetails.EOF

StartTime =  objRsCourseDetails("starttime")
EndTime	  =  objRsCourseDetails("endtime")
Payments  =  objRsCourseDetails("payments")

objRsCourseDetails.Movenext
Loop

objRsCourseDetails.Close

%>
<!-- Body Starts -->
<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="25%">&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; WHY US &raquo; Classroom - FAQs </td>

          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
			 <h1 class="PageTitle">ITILstudy Classroom Training - FAQs</h1>
              <!-- Content Start From Here-->
              <script language="javascript">
<!--
//function openit() {
//newWindow = window.open('emailus.asp', 'myWindow', 'toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=0,minimizable=0,resizable=0,width=500,height=315');
}
// -->
</script>
              <script src="/js/prototype.js" type="text/javascript"></script>
              <script src="/js/ricoCommon.js" type="text/javascript"></script>
              <script src="/js/ricoEffects.js" type="text/javascript"></script>
              <script src="/js/ricoAccordion.js" type="text/javascript"></script>
              <script type="text/JavaScript" language="JavaScript">
				function faqAccordionInit(elementId){
				
					var accordion_options={
						panelHeight: "auto",
						tabLocation: "inline",
						mode: "free",
						onLoadShowTab: -1,
						collapsedTextColor: "#333",
						expandedTextColor: "#333",
						transitionColor: "#CCCCCC",
						duration: 50
					};
				   
					new Rico.Accordion($(elementId),accordion_options);
				  }

			</script>
              <div id="outerFormContainer">
              <div id="mainContent" class="faqGroup">
                <p class="Header">About ITIL<sup>&reg;</sup>: </p>
                <div style="border-bottom: 1px solid rgb(107, 121, 165);" id="faqContainer1" class="panel">
                  <div id="faqPanel1_1">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_1" class="collapsed">
                      <h3>What is ITIL?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_1" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>ITIL (IT Infrastructure Library<sup>&reg;</sup>) is the most widely adopted framework for IT Service Management in the world. It is a practical approach to the identification, planning, delivery and support of IT services to the business. It describes how IT resources should be organized to deliver business value, documenting the processes, functions and roles of IT Service Management (ITSM).</p>
                            <p>ITIL principles are used by a number of organizations in both the public and private sectors such as NASA, IBM, HP, British Telecom, HSBC bank, L'Oreal and many others. </p>
							<p>ITIL is created and owned by the Office of Government Commerce (OGC), the ITIL best practices are explained in five core guidance publications outlining the fundamental ITIL principles which focus on areas within the service management discipline.</p>
                            <p>ITIL Best Practices also underpin the foundations of ISO/IEC 20000 (previously BS15000), the International Service Management Standard for organizational certification and compliance.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel1_2">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>What certifications are available under the ITIL Qualifications scheme?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                          
                            <p class="btext">The following certifications are available under the ITIL qualifications scheme:</p>
                            <ul class="btext">
                              <li>ITIL Foundation </li>
                              <ol type="i">
                                <li>The ITIL Foundation Certificate in IT Service Management is the entry level examination for the scheme. There are no pre-requisites for entry to this examination.</li>
                              </ol>
                            </ul>
                            <ul>
                              <li>ITIL Intermediate Level</li>
                              <ol type="i">
                                <li>The ITIL Intermediate Level is the core of the scheme. To take an examination at this level, candidates must hold the ITIL Foundation qualification and must complete an accredited training course.</li>
                                <li>The following examinations are available at the intermediate level: <br />
Service Lifecycle - management focused examinations<br />
Service Strategy;  Service Design; Service Transition; Service Operation, and; Continual Service Improvement.<br /><b>Service Capability</b> - process focused examinations<br />Planning Protection and Optimization; Release Control and Validation; Operational Support and Analysis, and; Service Offerings and Agreements

</li>
                              </ol>
                            </ul>
							
							 <ul>
                              <li>ITIL Managing Across the Lifecycle (MALC) </li>
                              <ol type="i">
                                <li>It is the Capstone examination for the scheme. Candidates who have gained a number of ITIL certifications are eligible to take this course and examination, and will be eligible for the ITIL Expert Level Award following successful completion.

</li>
                                <li>For full information on the qualifications available under the scheme please see:
<a href="http://www.itil-officialsite.com/Qualifications/ITILQualificationScheme.aspx" target="_blank">www.itil-officialsite.com/Qualifications/ITILQualificationScheme.aspx</a>

</li>
                              </ol>
                            </ul>
                           
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel1_3">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>How does ITIL work for my organization?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
						  <p>The IT Infrastructure Library (ITIL) is a universally accepted approach to the management and delivery of IT Services. Organizations implement ITIL best practices to improve service, increase productivity, better manage IT costs and develop a better understanding of the activities in the IT department.</p>
                            <p>Following are the benefits of ITIL:  </p>
                            <ul>
                              <li>Provides a single documented framework for IT best practices that flow across the IT organization.</li>
                              <li>Reduces IT costs and justifies the cost of IT quality and supports improvement of user productivity</li>
                              <li>Supports ability of IT to measure and improve internal performance and service provisioning.</li>
                              <li>Improves communication and information flows between IT and organization business departments and identifies roles and responsibilities for IT Service Management.</li>
                              <li>Improves ability of IT to adjust as business opportunities and challenges are presented.</li>
                              <li>Improves relationship of IT with the business – builds trust.</li>
                            </ul>
                           
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel1_4">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>Can I use the ITIL<sup>&reg;</sup> logo?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>The ITIL logo is the Best Practice swirl followed by the word ITIL®. This specific logo can only be used by OGC, TSO and APM Group-The Accreditor.</p>
							<p>If you wish to use the logo for any reason you will need to obtain prior permission from OGC. Please contact OGC at: <a href="mailto:ServiceDesk@ogc.gsi.gov.uk">ServiceDesk@ogc.gsi.gov.uk</a></p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                 
                         
                <script type="text/JavaScript" language="JavaScript">
	//start this accordion
	faqAccordionInit("faqContainer1");
	</script>
                <p class="Header">About ITILstudy </p>
                <div style="border-bottom: 1px solid rgb(107, 121, 165);" id="faqContainer2" class="panel">
                 
                  <div id="faqPanel2_2">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>How do I enroll for the ITIL classroom training session through ITILstudy.com?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                         
                            <p>Enrolment in ITILstudy Classroom Training is a three step process:  </p>
                            <ul style="list-style-type: square">
                              <li>Step 1: Register by providing enrolment information (approximately 3 minutes).</li>
                              <li>Step 2: Make payment for the course within 5 days of registration. </li>
							  <li>Step 3: ITILstudy confirms your participation in the course after receipt of payment.</li>
                            </ul>
							<p>To enroll with ITILstudy or for information on enrolment, please <a href="http://www.itilstudy.com/enrollClass.asp">click here</a>.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>

                  <div id="faqPanel2_4">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>What is taught during the ITILstudy training program?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                         
<UL>
<LI>The ITILstudy classroom training course content adequately covers goals, objectives, scope and basic concepts of core ITIL processes & functions and other syllabus areas of ITIL  Foundation. With an emphasis on real life and industry-specific examples, the <% If Session("CountryOrigin") = "Singapore" Or Session("CountryOrigin") = "United Kingdom" then %>3<%Else%>2<% End If %> days classroom training is designed in such a way that a student can pass ITIL exams in the first attempt. For details, please <a href="/classroomTraining.asp" target="_blank">click here</a>.</LI> 
<LI>For details regarding the training session schedules in various locations, please <a href="http://itilstudy.com/ITIL-Courses.asp">click here</a>.</LI>

</UL>


					
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel2_5">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>Who will conduct the training?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>All our trainers are APMG Accredited who are handpicked from amongst the best in the industry. Each of our trainers has successfully undergone rigorous and stringent selection process laid down by APM Group UK. They possess the required knowledge and expertise to ensure that students grasp the concepts well and are enriched with subject matter. <a href="http://itilstudy.com/ITIL-Training/instructors.asp">More</a>
                              </p>
							  
							   
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel2_601">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3> What happens if ITILstudy cancels a class?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>We have the best cancellation terms in the industry that ensure smooth re-scheduling or refunds. For more information, please <a href="/termsAndConditions.asp" target=_blank>click here</a>.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel2_6">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>What is the typical class-size?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>The number of participants varies, but we limit our class-size to 15.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>

                  <div id="faqPanel2_19">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3> What is the methodology adopted by ITILstudy to impart ITIL  Foundation classroom training? </h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>To know more about our classroom training methodology, please click below <br />
<a href="http://itilstudy.com/classroomTraining.asp">ITIL  Foundation Classroom Training</a>
</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>


                  <div id="faqPanel2_7">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>What is the fee for the ITILstudy classroom training session?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>For details on ITILstudy classroom training fee, please <a href="/ITIL-Courses.asp">click here</a>.</p>
                            
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
				  
                  <div id="faqPanel2_8">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>What is v3 in ITIL "v3" Foundation?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>V3 stands for Version 3. APMG has recently removed the usage of v3 and / or v2 from ITIL courses and towards achieving a version free ITIL.</p>
                            
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                 
                  <div id="faqPanel2_9">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>Is the ITIL Foundation course by ITILstudy is based on ITIL v3 Foundation syllabus?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Yes, it is based on ITIL v3 syllabus and is upgraded as per the ITIL 2011 refresh.</p>
                            
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
				  
                  
                 <% If Session("CountryOrigin") = "India" Or Session("CountryOrigin") = "United Kingdom" Or Session("CountryOrigin") = "US" then %>      
                
                  <div id="faqPanel2_10">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>What is the methodology adopted by ITILstudy to impart ITIL Intermediate CSI classroom training?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>To know more about our classroom training methodology, please click below <br/><a href="/course-syllabus-CSI.asp" target="_blank">
ITIL CSI  Classroom Training</a>
</p>
                            
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  
                  
                    <div id="faqPanel2_10">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>What is the methodology adopted by ITILstudy to impart ITIL Intermediate OSA classroom training?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>To know more about our classroom training methodology, please click below <br/>
<a href="/course-syllabus-OSA.asp" target="_blank">ITIL OSA  Classroom Training</a>

</p>
                            
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                
                
               <%End If%>     
                <div id="faqPanel2_11">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>How do I generate 18 PMI<sup>&reg;</sup> approved PDU's from my ITIL Foundation Classroom program and submit it to PMI ? </h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>You can download the 18 PDUs from the online prep course which is provided along with the classroom course. The link to download PDUs becomes active at the end of the first day of the classroom training program and remains active for 7 days after the end of the second day of the training program. <br/><br/>
While submitting the PDUs to PMI, please use the following information:<br /><br/><b>Provider Name:</b> VMedu, Inc. <br />
<b>Provider Number:</b> 2053 <br />
<b>Activity Number:</b> ITILSTUD <br />
<b>Activity Name:</b> ITIL Training <br />
<b>Provider Type:</b> R.E.P. <br />



</p>
                            
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                                  
                              
                  
                  
                  
                <script type="text/JavaScript" language="JavaScript">
	//start this accordion
	faqAccordionInit("faqContainer2");
	</script>
	
	            <p class="Header">About ITIL  Foundation Exam</p>
                <div style="border-bottom: 1px solid rgb(107, 121, 165);" id="faqContainer3" class="panel">
                  <div id="faqPanel3_1">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_1" class="collapsed">
                      <h3>Are there any pre-requisites (eligibility criteria) for taking the ITIL  Foundation exam?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel3_1" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>There are no pre-requisites/eligibility criteria for taking the ITIL  Foundation Exam. However, general understanding of IT is preferable.</p>
                          
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <% If Session("CountryOrigin") <> "Canada" Then %>
				       <div id="faqPanel3_11">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_2" class="collapsed">
                      <h3> When will I get the access to online course material?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>ITILstudy aims to ensure that students are aware of ITIL  Foundation concepts and terminology before they join the classes. To facilitate this, ITILstudy enables access to an online preparatory course as soon as they make the required payment.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <% End If %>
                  <div id="faqPanel3_2">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_3" class="collapsed">
                      <h3>What is the format for ITIL  Foundation Exam?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                          
                            <p class="btext">The question types for the ITIL  Foundation examination have not changed though the format has changed as outlined below: </p>
                            <ul class="btext">
                              <li>40 multiple choice questions per paper</li>
                             <li>One hour duration</li>
							 <li>Each question carries one mark.</li>
							 <li>No negative marking for incorrect answers</li>
							 <li>Passing percentage is 65%  i.e., 26 out of 40 </li>
                            </ul>
							<p>You can successfully complete the ITIL  Foundation course by enrolling in ITILstudy’s ITIL  Foundation Classroom Course.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel3_3">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_4" class="collapsed">
                      <h3>What is the syllabus for the ITIL  Foundation Course?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
						  <p>For details of the ITIL  Foundation course syllabus please <a href="http://www.itilstudy.com/course-syllabus.asp">click here</a></p>
                          
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel3_4">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_5" class="collapsed">
                      <h3>What is the pre-work required for ITILstudy Classroom course?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                          <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then %>
                          <p>ITILstudy offers a preparatory program to its students which are advisable to be completed before attending our classroom training for ITIL Foundation Exam. Access to this course is granted as soon as we receive the payment towards the classroom training course.</p>
                          <% Else %>
                            <p>ITILstudy offers a preparatory program to its students which are advisable to be completed before attending our classroom training for ITIL  Foundation Exam. Access to this course is granted as soon as we receive the payment towards the classroom training course.

</p>
<% End If %>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
				   <div id="faqPanel3_5">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_5" class="collapsed">
                      <h3>Where can I take the exam?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Exams can be taken at any of the centers of ITILstudy or any other accredited training organizations. Exams may also be taken at any APMG recognized Pro-metric centers. The open center exams are held only on certain days and at certain places. It is advisable to book the exam at the Pro-metric centers 4-6 weeks in advance. For taking the exam with ITILstudy, please contact us at <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com</a><br /><br />You can either telephone:<% If Session("CountryOrigin") = "Australia" Then%> +61 (0)2 6249 6008<% Else%> +44 (0) 1494 458 948<% End If%> to arrange the exam, email to <% If Session("CountryOrigin") = "Australia" Then%><a href="../../Users/Priyanka/Desktop/&nbsp;admin@apmg-australasia.com" target="_blank"> admin@apmg-australasia.com</a><%Else%><a href="mailto:servicedesk@apmgroupltd.com" target="_blank">servicedesk@apmgroupltd.com</a><% End If %> or visit the website <a href="http://www.itil-officialsite.com" target="_blank">www.itil-officialsite.com</a>

</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel3_6">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_6" class="collapsed">
                      <h3>When can I expect the results of my ITIL  Foundation examinations?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>ITIL  foundation exam will be declared one week after taking the exam. If you have taken your exam with us, your results are sent by the relevant APMG-International office directly to us within 5 days. We will notify you of your results within 24 hours from the time we receive your results from APMG. 


</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
				  
				    <div id="faqPanel3_7">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_7" class="collapsed">
                      <h3>When will I receive my ITIL  Foundation certificate?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>If the student has taken the ITIL  Foundation exam with us, then the certificates will be dispatched to you as soon as we receive it from APMG. The whole process will take approximately 3 weeks. Please note that if you have taken your examinations via an ATO, certificates are dispatched to ATOs. In case if you have not received your certificate within 3 weeks please contact us at <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com</a></p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
				  
				   <div id="faqPanel3_8">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_8" class="collapsed">
                      <h3>Am I allowed to write the exam again if I fail in the first attempt?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Yes, you can take the exam again.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                 
                       
                <script type="text/JavaScript" language="JavaScript">
	//start this accordion
	faqAccordionInit("faqContainer3");
	</script>
	 
                 
                 
                  <% If Session("CountryOrigin") = "India" Or Session("CountryOrigin") = "United Kingdom" or Session("CountryOrigin") = "US" then%>  
                 
                 
              
	            <p class="Header">About ITIL Intermediate Course and Exam:</p>
                <div style="border-bottom: 1px solid rgb(107, 121, 165);" id="faqContainer4" class="panel">
                  <div id="faqPanel4_1">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_1" class="collapsed">
                      <h3>Are there any pre-requisites (eligibility criteria) for taking the ITIL Intermediate exam?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel4_1" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Candidates wishing to be trained and examined for this qualification must already hold the ITIL Foundation Certificate in IT Service Management.</p>
                          
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  
				       <div id="faqPanel4_11">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3> When will I get the access to online course material?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>ITILstudy aims to ensure that students are aware of ITIL Intermediate concepts and terminology before they join the classes. To facilitate this, ITILstudy enables access to an online preparatory course as soon as they make the required payment.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                
                  <div id="faqPanel4_2">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>What is the format for ITIL Intermediate Exam?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                          
                            <p class="btext">              Multiple choice, scenario-based, gradient scored questions. </p>
                          
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel4_3">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>What is the syllabus for the ITIL Intermediate CSI Course?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
						  <p>For details of the ITIL Intermediate CSI course syllabus please  <a href="http://itilstudy.com/course-syllabus-CSI.asp">click here</a></p>
                          
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel4_4">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>What is the syllabus for the ITIL Intermediate OSA Course?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                          <p>For details of the ITIL Intermediate OSA course syllabus please  <a href="http://itilstudy.com/course-syllabus-OSA.asp">click here</a></p>                       
                        </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  
                  
                  <div id="faqPanel4_4">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>What is the pre-work required for ITILstudy Classroom course?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                          <p>Though it is not mandatory, we suggest you to go through the prep-course for which the access is given to you as soon as you enrol for the classroom course and pay the mentioned fee.</p>                       
                        </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  
				   <div id="faqPanel4_5">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>Where can I take the exam?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>We would be providing you the exam vouchers for the Intermediate exam (provided only with classroom training courses). On completing the training you can use the exam voucher to schedule your exam at you preferred date at nearest CSME exam centre.
</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel4_6">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>When can I expect the results of my ITIL Intermediate examinations?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>ITIL foundation examinations are marked on location with provisional results provided immediately after marking. Intermediate answer sheets are marked at APMG-International offices and results released soon after.<br/>If you have taken your exam via an ATO, intermediate results are sent by the relevant APMG-International office directly to ATOs within 48 hours.

</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
				  
				    <div id="faqPanel4_7">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>When will I receive my ITIL Intermediate certificate?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Certificate will be dispatched to you approximately 2 weeks after we have received your exam paper back into our offices, if you only took the foundation exam. Please note that if you have taken your examinations via an ATO, certificates are dispatched to ATOs. Therefore if you have not received your certificate shortly after the above time frames please contact your ATO directly.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>	  
				   
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                  <% End If  %>  
                 
                 
                 
                         
                <script type="text/JavaScript" language="JavaScript">
	//start this accordion
	faqAccordionInit("faqContainer4");
	
	
	</script>
    
    
                <p class="Header">Payment and Related Issues</p>
                <div style="border-bottom: 1px solid rgb(107, 121, 165);" id="faqContainer5" class="panel">
             
                  <!--<div id="faqPanel3_2">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_2" class="collapsed">
                      <h3> What are the acceptable modes of payment?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                          <p>A wide range of easy payment options are available.</p>
                          <p>Payment can be done through the following means:</p>
						  <ul>
						  <li>Cheque or Demand Draft favoring "Edusys Services Pvt Limited."<br />This should be couriered to the following address:<br />Edusys Services Pvt Limited,<br />#27, 2nd Floor, Santosh Towers,<br />4th Main,100 Ft. Ring Road,<br />J.P. Nagar 4th Phase,<br />Bangalore - 560078<br /> India</li>
						  <li>Bank Transfer: Payee Name: EDUSYS SERVICES PVT LIMITED <br />Bank Name : ICICI Bank Limited<br />Account Number : ICICI Bank A/c No : 0401 0500 0128<br />Branch Name : ICICI Bank, J.P. Nagar Branch, Bangalore</li>
						  <li>Alternate Payment Mechanism: If you have problems in making payments through Cheque or Demand Draft, please email us at <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com</a>; we will suggest alternate payment options to you.</li>
						  </ul>

                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>-->
                  <div id="faqPanel3_3">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_2" class="collapsed">
                      <h3>Can I make the payment at the venue?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>You are advised to pay in advance to avoid disappointment at the venue since we restrict class size and seats are invariably taken up in advance. Additionally, the ITIL  Foundation exams have to be booked in advance and the exam papers are limited to the fully-paid enrolled students. Students desirous of paying at the venue may find their seat being rejected due to non-availability of exam papers.<br /><br />Paying early also has the advantage of early online access to our pre-course work which helps you to be better prepared for the training program.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel3_4">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_2" class="collapsed">
                      <h3>Do you confirm the receipt of the payment made towards training along with information on the venue and dates for the training session? </h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>The student will receive a printable invoice after enrolment.</p>
							<p>Payment receipt is sent to the students once the payment is received.</p>
							<p>Dates of training will be emailed along with the invoice.</p>
							<p>Venue information will be communicated at least 7 days before the commencement of the program.</p>
							<p>Information on venue and dates of training will also be made available on our website.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel3_5">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_2" class="collapsed">
                      <h3> Do you provide discount on the training fee?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>At times, we provide early bird discounts to students. For details of current course fee and available discounts, please <a href="/ITIL-Courses.asp">click here</a>.<br /><br />
                                <%If Session("CountryOrigin") = "India" Then %>
                                We also provide a discount of 5% for two enrolments and the discount may vary depending on the number of students. For details please contact us at <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@itilstudy.com</a>, 9008748005</p>
                                <%Else %>
                                We also provide a discount of 5% for bulk nominations with more than five participants joining the course at the same time. For details, please email us at <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com</a>.</p>
                              <%End if %>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel3_6">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_3" class="collapsed">
                      <h3>Is the ITIL Foundation examination fee included in the training fee?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_3" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Yes, our training fee is inclusive of the ITIL Foundation certification exam fee. </p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel3_7">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_3" class="collapsed">
                      <h3>What else is included (or excluded) in the ITIL Foundation classroom training fee?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_3" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
								
                            <p>Additionally, classroom training fee is inclusive of the cost of study material, trainer fees and refreshments during breaks for the <% If Session("CountryOrigin") = "Singapore" Or Session("CountryOrigin") = "United Kingdom" then %>3<%Else%>2<% End If %> days of training.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  
                  
                  
                   <% If Session("CountryOrigin") = "India" Or Session("CountryOrigin") = "United Kingdom" or Session("CountryOrigin") = "US" then %>  
                 
                  <div id="faqPanel3_8">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_3" class="collapsed">
                       <h3>Is the ITIL Intermediate examination fee included in the training fee?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_3" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
								
                           <p>Yes, the ITIL Intermediate examination fee is included in the training fee. </p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <% End If%>
                  
                  
                  
                  
                  
                 
                <script type="text/JavaScript" language="JavaScript">
	//start this accordion
	faqAccordionInit("faqContainer5");
	</script>
                <div style="height: 20px;"> &nbsp; </div>
                <!-- Content End From Here-->
                <!--#include virtual="/includes/connectionClose.asp"-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
