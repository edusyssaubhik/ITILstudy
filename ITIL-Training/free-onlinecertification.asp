<!--#include virtual="/metatags/better-than-competitors_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/quality-study-aids-banner.asp"-->
<!-- Body Starts -->

<% If  Session("CountryOrigin") = "India"  Then 
 
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
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; WHY US &raquo; Free Risk Management Course </td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px; width:97%;">
                <!-- Content Start From Here-->
                <h1 class="PageTitle"><br />
   
                ABOUT RISK MANAGEMENT COURSE  </h1>
                 
                          <ul>
                         <li>The Risk Management (online certification) course, priced at 
                         <% If  Session("CountryOrigin") = "United Kingdom"  Then %>
 
 								£195 
  						<% ElseIf  Session("CountryOrigin") <> "United Kingdom"  Then %>
                           
                               $300
                        
                        <% End If %>


                        , is provided FREE as part of the ITILstudy training program.</li>
<li>The Risk Management certification offered by <a href="http://www.rmstudy.com" target="_blank">www.RMstudy.com</a> is approved for PDUs by Project Management Institute (PMI)<sup>&reg;</sup>. The course will help the students understand and apply the concepts of Risk Management in their workplace. Risk Management is one of the most prominent Decision Making and Planning Philosophies in the corporate world today.</li>
<li>Upon completion of the course the student will be awarded the Risk Management certificate with 20 PMI PDUs (which are valid for continuing education requirements of PMI).</li>
<li>The Risk Management course offered by <a href="http://www.rmstudy.com" target="_blank">www.RMstudy.com</a> is "100% Online" and can be taken  anywhere in the world (the only pre-requisite is having internet access).</li></ul>


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
