<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerwhyusbanner.html"-->
<!--#include virtual="/metatags/comprehensive_metatag.html"-->
<!-- Body Starts -->
<link href="css/style.css" rel="stylesheet" type="text/css" />
	<%
	Dim item_number 
	'rqAction  =  Request.Form("action")
		rqAction  =  Request.QueryString("action")
	'Response.write("Test	"&rqAction)
	rqType    =  Request.Form("type")
	item_number     =  Request.Form("item_number")
	
	%>
<script type="text/javascript">
function showVideo(){
window.open('/ITILdocs/tour/screen-video.html');
}
</script>

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; ITILstudy Online course</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px; width:97%;">
                <!-- Content Start From Here-->
                <p> Study guides, Chapter Tests and podcasts for all the chapters: <%If rqAction ="30days" Then%>30 days(1 month)<% ElseIf rqAction = "60days" Then%>60 days(2 month)<% ElseIf rqAction ="90days" Then%>90 days(3 month)<%End If%> </p>

<span class="Sub_Header">This will provide you access to the following for <%If rqAction ="30days" Then%>30 days(1 month)<% ElseIf rqAction = "60days" Then%>60 days(2 month)<% ElseIf rqAction ="90days" Then%>90 days(3 month)<%End If%> :</span>
                <ol>
                  <li> Study guides: Explain the goals, objectives, scope and basic concepts of core ITIL<sup>&reg;</sup> processes & functions and other syllabus areas of ITIL. </li>
                  <li> Chapter Tests and Evaluation Tests: These tests assess the delegate's degree of understanding of the respective chapter content.</li>
                 <li> Fill in the blanks: It helps the delegates to focus on the key terms with regards to each chapter. </li>
				 <li> APMG Sample Papers: To get a feel of the actual ITIL Foundation exam, take the APMG's full length sample papers as part of our online course and assess your responses with the provided answers to the same. </li>
				 <li> Mock Test: To further strengthen your preparation and improve on the weaker areas before you attempt the actual exam. This test is accessible only after completing all the chapter tests and evaluation tests.</li>
				 <li> PDU Certificate: 18 PMI PDUs certificate to help to cater to the needs of continuing education units for PMP certified professionals.</li></ol>
				 
				 <p>Please <a href="" onclick="showVideo();">click here</a> for the Tour of ITIL Foundation online course.</p>
				 <p>Please <a href="/Onlinecourse-syllabus.asp">click here</a> for the list of chapters covered in ITILstudy Foundation Online course.</p>
			

                <!-- Content End From Here-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
