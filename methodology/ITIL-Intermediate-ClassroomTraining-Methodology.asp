<!--#include virtual="/metatags/classroomTraining_metetag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/classroombanner.html"-->
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="25%" >&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; Methodology &raquo; Intermediate Classroom Training </td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><!--<h1 class="PageTitle"><a href="/ITIL-Foundation-Course.asp" >CLICK HERE</a> to know more about ITIL<Sup>&reg;</sup> Foundation Course </h1>-->
              <div >
              <p><span class="Header">Classroom Intermediate Methodology</span></p>
              <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "India"  Then %>
              <img src="/images/buttons/Intermediate-Classroom-Methodoloy-US-India.jpg" width="600" border="0" ><br>
              <br>
              <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
              <img src="/images/buttons/Intermediate-Classroom-Methodoloy-UK.jpg" width="600" border="0" ><br>
              <br>
              <%End if%>
              <p >
              <ol type="1">
                <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "India"  Then %>
                <li>Enroll for ITILstudy's ITIL Intermediate classroom program and make the payment</li>
                <li>Get immediate access to Online ITIL Intermediate course materials offering 12 hours of pre-course study.</li>
                <li>Attend the 3-day classroom training</li>
                <li>Prepare for the ITIL Intermediate exam with our efficient training methodology and experienced trainers</li>
                <li>Delegates will be provided with exam voucher at the end of 3rd day</li>
                <li>After training book your Intermediate exam with CSME anytime</li>
                <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                <li>Enroll for ITILstudy's ITIL Intermediate classroom program and make the payment</li>
                <li>Get immediate access to Online ITIL Intermediate course materials offering 12 hours of pre-course study.</li>
                <li>Attend the classroom training</li>
                <li>Prepare for the ITIL Intermediate exam with our efficient training methodology and experienced trainers</li>
                <li>Delegates will be provided with exam voucher at the end of 3rd day</li>
                <li>After training book your Intermediate exam with CSME anytime</li>
              </ol>
              <% End If %>
              <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "United Kingdom"  Then %>
              <br/>
              To know more about the course syllabus for the CSI classroom training program, click <a href="/course-syllabus-CSI.asp" target="_blank"> ITIL CSI  Classroom Training</a><br/>
              To know more about the course syllabus for the OSA classroom training program, click <a href="/course-syllabus-OSA.asp" target="_blank">ITIL OSA  Classroom Training</a>
              <% End If %>
              <BR>
              </p>
              <br />
              <!-- <a href="/course-syllabus.asp">Classroom Course Syllabus and Time Table</a> <br>
              <br>--></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
