<%
If Session("USBUserId") = "" Then
	Response.Redirect("/USBackoffice/login.asp")
Else
%>

<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/inneraboutusbanner.html"-->
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><h1 class="PageTitle">THE PROCESS OF BECOMING AN ITIL FACULTY WITH ITILSTUDY</h1>
              <table border="0" width="100%" cellspacing="0" cellpadding="2">
                <tr>
                  <td class="Header" colspan="2">The process of becoming an ITIL faculty with ITILstudy:</td>
                </tr>
				<tr>
				<td>
				<p><b>Note:</b> To be an ITIL Foundation Instructor, the Instructor should have earned at least 9 credits. That can be earned by clearing the Foundation exam and 2 Intermediate exams one of capability module and one of Lifecycle module.<br /><br /><b>Step 1: </b> Access to the ITIL Foundation Blended Course will be provided by ITILstudy once a prospective faculty requests to become an ITIL instructor. (Approximate time to complete-2 weeks)<br /><br /><b>Blended Course: </b>ITILstudy Blended course comprises of ITIL Foundation Online course (E- learning Course) for 90 days. The delegates can allocate days of study depending upon their individual aptitude, skill sets, experience, and levels of comprehension.<br /><br /><b>Step 2: </b>Once a delegate completes the course and decides to appear for the ITIL Foundation Exam, he/she can generate and print the exam voucher from the online access given to him/her and contact the APMG office to book the exam at the nearest exam centre at his/her preferred date and location.<br /><br /><b>Step 3: </b> Once the prospective faculty clears the ITIL Foundation exam, ITILstudy should be informed. ITILstudy will provide the prospective faculty access to the ITILstudy Intermediate CSI online course. Along with the CSI online course, exam voucher is also provided, through which the exam can be booked by the prospective faculty at the nearest exam centre by contacting APMG office. (Approximate time to complete the course and exam- 2 weeks)<br /><br /><b>Step 4: </b> Once the prospective faculty clears the ITIL Intermediate CSI exam and informs ITILstudy, access to OSA online course will be provided by ITILstudy and the exam can be booked as explained in Step 2.<br /><br /><b>Step 5: </b> Once the prospective faculty clears both the CSI and OSA intermediate exams, the next step is submitting relevant documents (ITIL Instructor application form, certificates of ITIL Foundation, CSI & OSA and updated CV showing minimum 10 days of experience in training and 3 years in IT service management) to ITILstudy which in turn will submit the same to CSME<br /><br /><b>Step 6: </b> CSME takes around one working day to inform the status of the trainer application<br /><br /><b>Please Note: </b> CSME is also an Examination Institute which can accredit trainers for ITIL Foundation training programs and going forward all our US faculties will be accredited through CSME.</p>
</td></tr>

              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
  </table>
</div>
  
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
<% End If %>