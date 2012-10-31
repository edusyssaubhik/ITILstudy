<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/inneraboutusbanner.html"-->
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><h1 class="PageTitle">Please use this link to make payment for ITILstudy Classroom Training</h1>
              <table border="0" width="100%" cellspacing="0" cellpadding="2">
                <tr>
                  <td class="Header" colspan="2">(Payment can be done using Paypal)</td>
                </tr>
				<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
					<input type="hidden" name="cmd" value="_xclick">
					<input type="hidden" name="business" value="edusysaus@gmail.com">
					<input type="hidden" name="item_name" value="ITILstudy Classroom Training  - <% = Session("CountryOrigin") %>">
					<input type="hidden" name="cancel_return" value="http://www.ITILstudy.com">
					<input type="hidden" name="return"  value="http://www.ITILstudy.com/payment-success.asp">
					<input type="hidden" name="currency_code"  value="AUD">  
					
		<!--<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                      <input type="hidden" name="cmd" value="_cart"> 
                      <input type="hidden" name="upload" value="1"> 
                      <input type="hidden" name="business" value="edusysservices@gmail.com">    
                      <input type="hidden" name="item_name_1" value="ITILstudy Classroom Training  - <% = Session("CountryOrigin") %>">
                      <input type="hidden" name="currency_code" value="AUD">  
					  <input type="hidden" name="cancel_return" value="http://www.ITILstudy.com">
                      <input type="hidden" name="return" value="http://www.ITILstudy.com/payment-success.asp">-->
					 
  <td><Br>
    <span class="Header">Pay using Paypal:</span><BR>
    <span class="subHeader">(accepts all leading credit cards including Visa, Mastercard, Amex etc.)</span><BR>
    <BR>
    Description of item bought: <font color="red"><I>
    <input name="item_name" type="text" size="40"/>
    <BR>
    (e.g. Payment for 3 people PMstudy class, Payment for PMstudy class etc.)</I></font><BR>
    <BR></td>
  <td></td>
  </tr>
   <tr>
    <td>Amount to be paid (AUD): <input type="text" name="amount" size="7" /> 
      
      <BR><BR></td>
  </tr>
  </tr>
  <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
    <td colspan="2" align="center">  <input type="submit" value="Buy Now"></td>

                    </form></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
