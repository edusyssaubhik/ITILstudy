<!--#include virtual="/metatags/ITILOnlineFoundation_metetag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<script language="JavaScript" type="text/javascript" src="/js/tableH.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/jquery-1.7.2.js"></script> 
 
<!--#include virtual="/includes/innerindustryrecognizedbanner.html"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<!--#include virtual="/includes/connection.asp"-->
<!-- Body Starts -->
<style type="text/css">
<!--
TableCopyName, TableCopyDetails, TableCopyCost, general-bodyBold a:link {
	text-decoration: none;
	color: #000000;
}
TableCopyName, TableCopyDetails, TableCopyCost, general-bodyBold a:visited {
	text-decoration: none;
	color: #999999;
}
TableCopyName, TableCopyDetails, TableCopyCost, general-bodyBold a:hover {
	text-decoration: none;
}
TableCopyName, TableCopyDetails, TableCopyCost, general-bodyBold a:active {
	text-decoration: none;
}
body,td,th {
	color: #000000;
}
body {
	background-color: #E5E5E5;
}

-->
</style>

<%
'Cheking the IP Address'


sIPAddress = Request.ServerVariables("HTTP_X_FORWARDED_FOR")

If sIPAddress="" Then
sIPAddress = Request.ServerVariables("REMOTE_ADDR")


strQuery11 = "http://geoip.maxmind.com/b?l=4tAUhyTgUD6d" & _
	"&i=" & sipaddress
set objHtp = Server.CreateObject("Msxml2.ServerXMLHTTP")
objHtp.open "GET", strQuery11, false
objHtp.send
sipAddress = sipAddress + ";" + objHtp.ResponseText

End If

'Capturing the Country code for CCAvenue purpose'
ITILcountry1=split(sipAddress,";")
ITILcountry=split(ITILcountry1(1),",")
ITIL_country = ITILcountry(0)

rqAction  =  Request.Form("action")
rqType    =  Request.Form("type")

%>
<% 

  'Price Format Display Functions'
	
					 Currency_Format_Front = CurrencyFormat_Front(Session("CountryOrigin"))
	
					 Currency_Format_Back = CurrencyFormat_Back(Session("CountryOrigin"))
%>
<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
      <table width="100%" border="0" cellspacing="0" cellpadding="8">
        <tr>
          <td width="2%" >&nbsp;</td>
          <td width="25%" >&nbsp;</td>
          <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; COURSES/
            <% If Session("CountryOrigin") = "United Kingdom" Then %>
            ENROL
            <% Else %>
            ENROLL
            <% End If %>
            &raquo;
            <% If Session("CountryOrigin") = "United Kingdom" Then %>
            Enrol
            <% Else %>
            Enroll
            <% End If %></td>
        </tr>
        <tr>
		 <%
				  'code by chandan to remove session of state in mycourses page
				  newstate=Session("State")
				  Session.Contents.Remove("State")
	   %>
          <!--#include virtual="/includes/innerLeftMenu.asp"-->
		  <%   Session("State") =newstate %>
          <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
          <div  >
            <div>
              <script type="text/javascript">			 
function popitup(url) {
	newwindow=window.open(url,'name','toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=0,minimizable=0,resizable=0,height=170,width=420,top=250,left=400');
	if (window.focus) {newwindow.focus()}
	newwindow.document.write
	return false;
}

function openwindow()
{
window.open("","newwindow",'toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=0,minimizable=0,resizable=0,height=150,width=250,top=250,left=400')
}
-->
</script>
              <h1 class="PageTitle">ITILstudy Online courses  </h1>	 
			 

			   <table>
                <tbody><tr>
                  <td id="imageHover"><img border="0" src="/images/buttons/New.jpg"/></td>
                  <td><br/>
                    ITILstudy course has been updated in December, 2011 to the new format as per 2011 Syllabus and is approved by APMG.<br/>
                    <br/></br></td>

                </tr>
				
              </tbody></table>
              <table width="97%" onMouseOut="javascript:highlightTableRowVersionA(0);" id="myTable0" border="0" cellpadding="0" cellspacing="0">
			  <tr><td colspan="4" ><div align="right"><a href="/online-termsandcond.asp" target="_blank">Terms and conditions</a></div></td></tr>
			 
                <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                  <td class="TableRowEven" width="60%"><a name="edu"></a><img src="/images/buttons/edu.png" ></td>
                  <td class="TableRowEven" colspan="3" ><div align="center"><span class="Header">Online Courses</span></div></td>
                </tr>		
			
			<script type="text/javascript">
			$(function(){
			   $('.cm').click(function(){
				var islogin="<%= session("FirstName") %>";			
				if  (islogin=="" || islogin==null)    // this part will only call when user not logged in will show a pop up to user.
				{
				
				var item_number=$(this).parents('tr:first').find('input:hidden:[name=item_number]').val();
				var url="/Signin.asp?n="+item_number;
                  //window.location.href = "?n=" + name;
				   popupWin = window.open(url,item_number,'width=800,height=490,title="Login Page"')
				   return false;
				}
				else //when user is logged submit directly it will go to custumedetails drectly
				{
				this.form.submit();
				return true;
				}
			})
			$.fn.Passval = function(name){       
		//console.log("opener :",name)
		window.location.href='/customerdetails.asp';

             }

		})
			</script>
		<%  if syncWithFb=true then 'added later
		session("fbRedirectUrl")="http://www.itilstudy.com/fbApp/fb-sync.asp" 'session for fblogin redirecturl
		%>
		<script type="text/javascript">
		function openfbWindow(url) 
		{
		var url="/FbApp/Fb-Sync.asp";
			popupWin = window.open(url,'popup','width=850,height=490,title="facebook Login"')
		}
		</script>
         <% end if%>
		 
<!--#include virtual="/ItilFunctions/ITIL-OnlineCoursesShow.asp"-->
			 </table>
            </div>
             </div>
			 <div style="width:97%">
                <p class="general-body">To know the system requirement for accessing ITILstudy online courses, please <a href="http://www.itilstudy.com/systemRequirement.asp" target="_blank">click here</a> </p>
              </div>
			<div style="width:97%"><br />
                <table border="0" width="100%">
				
                  <tr>
                    <td class="SubHeader">Terms and conditions (Please Note) :</td>
                    <td><div align="right"><a href="/online-termsandcond.asp" target="_blank">Printable Version</a></div></td>
                  </tr>
                </table>
				
              <ul type="disc">
                <li>The payment to ITILstudy.com will be made through <a href="https://www.paypal.co.uk/">www.paypal.com</a> - a global leader in online payment solutions (accepts Visa, MasterCard, American Express etc.) with payments accepted from 45 countries worldwide.</li>
                <li>The enrolment in ITILstudy.com is Completely Online (if payment through PayPal) - so, as soon as you
                  <% If Session("CountryOrigin") = "United Kingdom" Then %>
                  enrol
                  <% Else %>
                  enroll
                  <% End If %>
                  in ITILstudy.com and make your payment, you will be provided with a receipt of payment from PayPal. Your User ID and Password for ITILstudy.com will be provided in the enrolment screen of ITILstudy.com and through an email sent to your email address. Online Enrolment process takes up to 4 hours, after which you will have access to your course in ITILstudy.com.</li>
                <li>If you cannot pay using a credit card, please email us at <a href="mailto:adminsupport@ITILstudy.com"/>adminsupport@ITILstudy.com;
                  </a>
and we will arrange for an alternate payment mechanism for you.                   <br />
                  <br/>
                  Please Note: If you do not have a credit card or cannot use your credit card for making payment, please use the credit card of a colleague, friend or relative. Then, send an email to <a href="mailto:adminsupport@ITILstudy.com"/>adminsupport@ITILstudy.com;
                  </a>
with the payment details and your personal information (name, address, and preferred email address for correspondence). We will set-up the account to reflect your personal details, so that you can take the course in your name.                   </li>
                <li>Please Note : Sometimes, enrolment emails sent from ITILstudy.com may go to your Bulk/Junk Email folder. So, you are requested to look up emails in that folder if you expect an enrolment email from ITILstudy.</li>
                <li>Bulk/Corporate Discounts are available if more than 3 people would like to join ITILstudy.com course at one time. For details, please email us at <a href="mailto:marketing@ITILstudy.com"/>marketing@ITILstudy.com
                  </a></li>
                <li>Course Extension cost
                  <% If Session("CountryOrigin") = "United Kingdom"  Then %>
                  &#163; 30 / week or &#163; 110 / month
				  <% ElseIf Session("CountryOrigin") = "Australia"  Then %>
                  40 USD/ week or 140 USD / month
                  <% Else %>
                  $ 40 / week or $ 140 / month
                  <% End If %>
                  . So, if you think you may need a longer time duration for study, it is recommended to take the longer duration course when you sign up initially.</li>
                <li>Course Cancellation costs
                  <% If Session("CountryOrigin") = "United Kingdom"  Then %>
                  &#163; 40
				  <% ElseIf Session("CountryOrigin") = "Australia"  Then %>
                  50 USD
                  <% Else %>
                  $ 50
                  <% End If%>
                  after initial enrolment (if course is cancelled within 2 days of access provided by ITILstudy.com). Also, no course cancellation request is allowed 2 days after the course access provided by ITILstudy.com.</li>
                <li>Course Upgradation or Course change requests: Any changes to the course including course upgradation should be requested within 3 days of making the initial payment. However, no money can be refunded after initial payment is made.</li>
                <li>If you enrol in a ITILstudy.com course and pass the ITIL Foundation Exam, your name will be added to the success list of ITIL Foundation delegates using ITILstudy.com.</li>
                <li>Information about your enrollment may be provided to co-workers in your company who may ask for reference about our course.</li>
                <li>ITILstudy.com will not distribute your personal information to any third party marketing database or disclose the personal details to anyone EXCEPT on a case to case basis after proper verification of the person requesting for the information or in case of legal requirements. Your personal information could be used for informing you regarding other courses being provided by ITILstudy.com.</li>
              </ul>
            </div>
            <div>
              <p align="right">
              </p>
            </div>
          </div>
          </td>
        </tr>
      </table>
      </td>
    </tr>
  </table>
</div>



<% If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") Then %>

<!-- Google Code for ITILstudy USA Online - DL Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "2";
var google_conversion_color = "ffffff";
var google_conversion_label = "U01ZCOu41QIQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?value=0&amp;label=U01ZCOu41QIQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


<% ElseIf Session("CountryOrigin") = "Australia" Then %>

<!-- Google Code for ITILstudy AUS Online - DL (P.M.5) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1001931809;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "kinZCLf-yRIQoYjh3QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1001931809/?value=0&amp;label=kinZCLf-yRIQoYjh3QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>



<% ElseIf Session("CountryOrigin") = "India" Then %>

<!-- Google Code for ITILstudy IND - Online DL (P.M.6) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1000044564;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "n6sKCKTO1QMQlPDt3AM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1000044564/?value=0&amp;label=n6sKCKTO1QMQlPDt3AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


 <% ElseIf Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" Then %>
 <!-- Google Code for ITILstudy UAE, Singapore - Online DL (P.M.6) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1000044564;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "uOyNCJzP1QMQlPDt3AM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1000044564/?value=0&amp;label=uOyNCJzP1QMQlPDt3AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


<%  ElseIf Session("CountryOrigin") = "Germany" Then  %>
<!-- Google Code for ITILstudy Germany - Eng- Online DL (P.M.2) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "m-vMCOuQlgMQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?value=0&amp;label=m-vMCOuQlgMQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>

<% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
<!-- Google Code for ITILstudy - Online DL for UK (P.M.3) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1017900619;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "ZTclCKWGlAMQy9yv5QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1017900619/?value=0&amp;label=ZTclCKWGlAMQy9yv5QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


<!-- Google Code for ITILstudy UK - Online DL (P.M.6) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1000044564;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "AQp_CIzR1QMQlPDt3AM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1000044564/?value=0&amp;label=AQp_CIzR1QMQlPDt3AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>



<% Else %>

<!-- Google Code for ITILstudy Online - DL Conversion Page -->

<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "P0hECMuzyQIQx8Kz6QM";

var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?label=P0hECMuzyQIQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
<% End If %>

<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
