<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerwhyusbanner.html"-->
<!--#include virtual="/includes/libfuncs.asp"-->
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="PageTitle">Payment</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
			<div style="margin-top:-12px; width:95%;">
                <div>

				<% If Request.Form("item_number") = "" Then %>
                <div class="general-body"><br /><br />We understand that your payment was not successful. If you are finding difficulty in paying through PayPal, please <a href="/ITIL-Online-Courses.asp">click here</a> to make payment through our alternate payment processor. If you are still not able to make payment, please email adminsupport@itilstudy.com
                <% Else %>
                 <div class="general-body"><br /><br />Your payment is succufully done. </div>
                <% End If %>                 
                </div>
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
