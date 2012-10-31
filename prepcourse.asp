<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="PageTitle">PREPARATORY PROGRAM FOR THE ITILstudy CLASSROOM TRAINING COURSE</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px;">
                <!-- Content Start From Here-->
                <p align="left">
                  <% if (Session("State")="verified4") then	%>
                  <%Dim Step
Step=Request.Form("Step")%>
                  <%Select Case Step%>
                  <%Case "Step1"%>
                  <span class="Header">Step 1: Know more about ITIL<sup>&reg;</sup></span><BR>
                  <BR>
                  Review all the links mentioned below. This will provide you a good overview of the ITIL Foundation Exam.<BR>
                  <BR>
                <OL type="1">
                  <LI><a href="http://www.apmg-international.com/home/Home.asp" target="_blank">APMG website</a></LI>
                  <BR>
                  <LI><a href="/freeresources/aboutITIL.asp" target="_blank">About ITIL<sup>&reg;</sup>, APMG, and ITILstudy</a><BR>
                    <BR>
                  </LI>
                  <LI>Understanding the <a href="/course-syllabus.asp">syllabus</a> and <a href="/classroomTraining.asp">study methodology</a> for ITILstudy classroom course</LI>
                  <BR>
                
                 
                  <li>Understanding the <a href="/understanding-itilcert-exam.asp" target="_blank">exam pattern</a> for ITIL Foundation certification
                   
                  </li>
                 
                </OL>
                <BR>
                
                
                <%'Case "Step2"%>
             <!--   <span class="Header">Step 2: Complete the worksheets and get familiarized with the key syllabus areas</span><BR>
                <BR>
               Given below are a few worksheets which highlight important concepts for ITIL<sup>&reg;</sup> exam.
                <OL>
                  <LI>Please take a print-out of these worksheets which contains several fill-in-the-blanks. </LI>
                  <LI>Compare your answers with the ones provided in the answer key.</LI>
                  <LI>Revise the worksheets. (Please note that detailed study and memorization is not required, you should just get a high level understanding of the concepts which will be discussed in detail and clarified during the class)</LI>
                </OL>
                <BR>
                The worksheets for the different chapters can be downloaded here:
                <UL type="disc">
                  <LI><A href="/ITILdocs/FIB/Introduction.pdf" target=_blank>Chapter 1 - Introduction</A> </LI>
                  <LI><A href="/ITILdocs/FIB/Service Strategy.pdf" target=_blank>Chapter 2 -  Service Strategy</A> </LI>
                  <LI><A href="/ITILdocs/FIB/Service Design.pdf" target=_blank>Chapter 3 - Service Design</A></LI>
                  <LI><A href="/ITILdocs/FIB/Service Transition.pdf" target=_blank>Chapter 4 - Service Transition	</A> </LI>
                  <LI><A href="/ITILdocs/FIB/Service Operation.pdf" target=_blank>Chapter 5 -  Service Operation </A> </LI>
                  <LI><A href="/ITILdocs/FIB/Continual Service Improvement.pdf" target=_blank>Chapter 6 - Continual Service Improvement</A> </LI>
          
                </UL>
                <BR>
               After completing the worksheets, if you come across any term which you do not understand, then you can enter the term in the search box provided in the left menu. <BR>
                <BR>
               This process allows you to get familiarized with the key concepts of the course, ensuring your readiness for the ITILstudy Classroom Training Course.<BR>
                <BR>
                <BR />-->
                
                
                
                <%Case "Step2"%>
                <span class="PageTitle">Step 2: Attend the ITILstudy Classroom Training and Exam</span><BR>
                <br />
                <span class="Header">Attend the Classroom Training:</span> <br />
                <BR>
                <ul type="disc">
                  <li> The ITILstudy course content adequately covers all ITIL<sup>&reg;</sup> concepts. With an emphasis on real time examples, the classroom training is designed in such a way that a student can pass ITIL exam in the very first attempt. </li>
                  <BR>
                  <li>All our trainers are APMG accredited  having several years of ITSM experience. They are rigorously trained in ITILstudy training methods.</li>
                  <BR>
                  <li>Since this is a rigorous and time-sensitive program, you should be totally committed to learn for the given period of time during the classroom sessions.</li>
                  <br />
                  <li> During the class, you are requested to keep your cell phones switched off and not to take any unscheduled breaks unless permitted by the trainer.</li>
                  <br />
                  <li>Unacceptable behaviour (disturbing others, asking irrelevant questions, creating a non-conducive study environment) on your part during classroom sessions will attract disciplinary action.</li>
                  <br />
                </ul>
                <span class="Header">Attend the Exam:</span><br />
                <br />
                <ul type="disc">
                 
                  <li>Candidate Checks – Proof of Identification:<br />
                    <br />
                   You will also be asked to show photo ID such as passport/driver’s licence/national ID card before taking the exam. <br />
                   If you do not have any form of photo ID, any two of the following should be produced so that the details given may be verified with those entered on the candidate form:<br />
                    <br />
                    <ul type="circle">
                      <li>Property rental/ownership agreements</li>
                      <li>Utility phone bill</li>
                      <li>Bank statement</li>
                      <li>Credit card bill</li>
                    </ul>
                  </li>
                 If you have any objections to show your face due to religious reasons, you will be asked if you are willing to show your face to a person of the same sex in a private room. If you still object, you will be asked to provide the documents listed above to conduct non-visual identification.
                </ul>
                <br />
                <br />
                
             
                
           
             
                
                <%Case Else%>
                
                <span class="Header">Name: <%=Session("FirstName")%>&nbsp;<%=Session("LastName")%></span>
                <p><span class="SubHeader">Member Profile:</span></p>
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
                
                 <br /> <br />
                 
                <span class="general-bodyBold">Course of study:</span> Your membership allows you access to the <a href="/prepcourse.asp">Preparatory Program</a> which is a pre-requisite for the ITILstudy Classroom Course till <% = Session("DateValid") %>. (This has to be completed before you attend ITILstudy Classroom Course) 
               
                <br /> <br />
                
             <!--   <span class="general-bodyBold">Duration of access:</span> <%=Session("DateValid")%>
                
                <br /> <br />
               
                <a href="/prepcourse.asp" target="_blank">http://www.itilstudy.com/prepcourse.asp</a><br />
                <br> -->
                
                <span class="Header">PREPARATORY PROGRAM FOR ITILstudy CLASSROOM TRAINING COURSE</span>
                
                <br />
                <br />
                
              <!--  <%=Session("FirstName")%>, this Preparatory Program is a prerequisite for the ITILstudy ITIL<sup>&reg;</sup>  Foundation Classroom Course.(This has to be completed before you attend your ITILstudy Classroom Course). <BR>
                <BR>-->
               This preparatory program is a 3-step process:<BR>
                <BR>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Step 1: Learn about APMG, ITIL<sup>&reg;</sup>, and ITILstudy.<BR>
                <BR>
               <!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Step 2: Completing the worksheets and familiarizing yourself with the key syllabus areas.<BR>
                <BR>-->
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Step 2:  Review the ITILstudy Process Chart and Study Guides.   <BR>
                <BR>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Step 3:  Attending ITILstudy classroom training and exam. <BR>
                <BR> 
              <!--  <span class="Header">Please Note:</span> The course mentioned above is a pre-requisite for your ITIL<sup>&reg;</sup>  Foundation Classroom program. It is a very easy, 100% online course which can be completed with a few hours of effort. <BR>
                <BR>-->
               The ITIL Foundation Exam will be conducted at the end of the second day of the training program.<BR>
                <BR>
                If you have any queries, please email us at <a href="mailto:marketing@itilstudy.com">marketing@itilstudy.com</a><BR>
                <BR>
                
                <%End Select%>
                
                
                <form method="Post" action="./prepcourse.asp">
                  <input type="Submit" name="Step"  Value="Overview">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="Submit" name="Step"  Value="Step1">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="Submit"  name="Step" Value="Step2">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <!-- <input type="Submit" name="Step"  Value="Step3">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
                </form>
                
                
                <%else%>
                Sorry - Session time got expired, please login again. <BR>
                <BR>
                Only Students who have enrolled and made payment towards ITILstudy.com classroom program get access to this area.
                <% end if %>
                </p>
                <!-- Content End From Here-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/connectionClose.asp"-->
<!--#include virtual="/includes/footer.html"-->
