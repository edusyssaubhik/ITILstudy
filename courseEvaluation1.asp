<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% Option Explicit %>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 23/09/2010'
'Description :'
'This is home Page'
'======================================================='%
%>
<% 
 If not Session("UserId") = "" Then %>

<!--#include virtual="/includes/header.asp"-->
<link rel="stylesheet" type="text/css" href="/css/faq.css">
<!--#include virtual="/includes/innerwhyusbanner.html"-->

<!-- Body Starts -->
<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; Course Evaluation <div align="right"><a href="/logOut.asp">Log Out</a></div></td>
            

          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
			  <span class="Header">Foundation Classroom</span><br /><br />
              <!-- Content Start From Here-->
              <script language="javascript">
<!--
function openit() {
newWindow = window.open('emailus.asp', 'myWindow', 'toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=0,minimizable=0,resizable=0,width=500,height=315');
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
               
                <div style="border-bottom: 1px solid rgb(107, 121, 165);" id="faqContainer1" class="panel">
                   <div id="faqPanel1_1">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_1" class="collapsed">
                      <h3>Methodology</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_1" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                         <img src="/images/buttons/Online-Foundation-Methodoloy.jpg" width="600" border="0" ><br><br>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
               
                  <div id="faqPanel1_2">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_1" class="collapsed">
                      <h3>Classroom Training</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_1" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                          <ul type="disc">
                          <li><a href="/Docs/ClassroomTimesheet.pdf" target="_blank">Timesheet for classroom</a></li>
						  <li><a href="/Docs/NewSyllabusDetails.pdf" target="_blank">New Syllabus Details</a></li>
                          <li><a href="/Docs/ITILFaculty.pdf" target="_blank">Workbook for faculty including trainer note</a></li>
                          <li><a href="/Docs/ITILmocktest.pdf" target="_blank">Mock test</a></li>
                           
                            <li><a href="/Docs/ChapterTest.pdf" target="_blank">Chapter Test </a></li>
							
                            <li><a href="/Docs/apmgsamplepapers.zip" target="_blank">APMG Sample Test</a></li>
                            </ul>
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
    
  
               
                </div>
                </td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<%Else
 Response.Redirect("/access.asp")
 End If	%>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
