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
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; Methodology &raquo; Foundation Classroom Training </td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
			 <h1 class="PageTitle"><a href="/ITIL-Foundation-Course.asp" >CLICK HERE</a> to know more about ITIL<Sup>&reg;</sup> Foundation Course </h1>
            <div >
			
			<p><span class="Header">Classroom Foundation Methodology</span></p>
            <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then %>
			  <img src="/images/buttons/Online-Foundation-Methodoloy.jpg" width="600" border="0" ><br><br>
			  <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
              <img src="/images/banners/Online-Foundation-Methodoloy.jpg" width="600" border="0" ><br><br>
              <% Else %>
              <img src="/images/buttons/Online-Foundation-Methodoloy.jpg" width="600" border="0" ><br><br>
			  <%End if%>
			 
			  
            
            <p > <ol type="1"><li>
            Enroll for ITILstudy’s ITIL Foundation classroom program and make the payment.</li>
              <%If Session("CountryOrigin") <> "Canada" Then %>
<li>	Get immediate access to Online ITIL Foundation course materials offering 6 hours of pre-course study.</li>
<% End If %>
<li>	Attend the <%if Session("CountryOrigin")= "United Kingdom" Then %>3-day<%Else%>2-day <%End If%> <%if Session("CountryOrigin")= "United Kingdom" Then %>classroom training with real-life role-play exercises.<%ElseIf Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then%>classroom training which includes an ITIL Simulation.<%Else%>classroom training.<%End If%> </li>
<li><%if Session("CountryOrigin")= "United Kingdom" Then %>Prepare for the ITIL Foundation exam for the first 2.5 days and take the exam at the end of the 3rd day. <%Else%>Prepare for the ITIL Foundation exam for the first 2 days and take the exam at the end of the 2nd day.<%End If%></li>
<li>Exam result and certificates will be mailed to the successful candidates.</li></ol>

<BR>
</p>
<br /><a href="/course-syllabus.asp">Classroom Course Syllabus and Time Table</a>
    <br><br>
            
				</td>
                
          </tr>
        </table></td>
    </tr>
  </table>
</div>

<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
