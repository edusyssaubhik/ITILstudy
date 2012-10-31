<!--#include virtual="/metatags/momeyback_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/get-your-money-worth-banner.asp"-->
<!-- Body Starts -->
<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" >&nbsp;</td>
            <td width="25%" >&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; WHY US &raquo;Classroom - Moneyback Guarantee </td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px; width:97%;">
                <!-- Content Start From Here-->
				
				 <% If (Session("CountryOrigin") = "India")  Then %>
              <p class="Header"> Please Note:</p>
              Moneyback Guarantee is not applicable in India .
			  <% ElseIf ( Session("CountryOrigin") = "Other") Then %>
              <p class="Header"> Please Note:</p>
              Moneyback Guarantee is not applicable in our country .
             
			  <% Else %>
               
                <h1 class="PageTitle">100% Moneyback Guarantee </h1>
                <p>Our confidence in our quality is reflected by the fact that we are the only ITIL Foundation Training provider in the industry to offer a 100% Money Back Guarantee.</p>
                <p>We guarantee that you will be successful in your ITIL<sup>&reg;</sup> Foundation exam after attending the classroom training program offered by us or we will pay for your exam retake. If you fail again, we will refund back your money.</p>
                     
                <p class="Header"> Policy</p>
                 <p>The ITIL Foundation Exam will be conducted on the last day (<%If Session("CountryOrigin") = "United Kingdom" Then%>3rd day<%Else%>2nd day<%End If%>) of the training by ITILstudy at the training center. As per our moneyback policy, if you fail in the first attempt, you are allowed to retake the ITIL Foundation exam within 3 months of failing the exam for the first time. In case you fail for a second time after taking our course, we will refund the course fee paid by you.
</p>

             
         
                
                <p class="Header">Terms and conditions</p>
                <ul>
                <li>Moneyback Guarantee is applicable only to those students who complete the course work modules, classroom assignments and have 100% attendance.</li>
                <li>The student should retake the exam within 3 months from the date of the first attempt and should intimate ITILstudy about his/her decision to retake the exam, at least 2 weeks prior to the commencement of the scheduled program.</li>
              <li>ITILstudy will refund only those students who have remitted the full payment towards the program fee.</li>
                <li>ITILstudy will take up to 30 days to refund any payments payable to you from the date of receipt of all the required documents. </li>
                <li>By default, we will refund you using the same mode of payment by which you had remitted the payment towards the program fee. For example, if you paid using a credit card, we will refund the amount to your credit card. If you want to be refunded through other method, please email us at <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com</a> with the mode of refund.</li>
               
               
                </ul>
                
                 <p class="Header">Our 100% Moneyback Guarantee will not apply if the student:</p>
                 <ul>
<li>Comes to the class late or leaves early on any of the prescribed days of the training program.</li>
<li>Does not follow the instructions of the faculty and does not complete the exercises and home work as required by the program (both during and after class hours).</li>
<li>Disturbs others, asks irrelevant questions, causes wastage of program time, and creates a non-conducive study environment of any other kind.</li>

                </ul>
              No relaxations to this 100% Moneyback Guarantee policy will be made under any circumstances.<br />
			   <% If (Session("CountryOrigin") <> "India" And Session("CountryOrigin") <> "Netherlands" ) Then %>
              <p class="Header"> Please Note:</p>
			   <% If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "United Kingdom" ) Then %>
             <ul><li> This is applicable only for US / Canada, Germany and UK.</li></ul>
				<% Else %>
             <ul><li> This is applicable only for <% = Session("CountryOrigin") %>.</li></ul>
                <% End If %>
				 <% End If %>
				 <% End If %>
                <!-- Content End From Here-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
