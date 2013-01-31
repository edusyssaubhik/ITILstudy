<!--#include virtual="/metatags/ITILOnlineFoundation_metetag.html"-->
<!--#include virtual="/includes/headermetaDutch.asp"-->
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
          <td width="73%" class="breadcrumb">Home &raquo; OPLEIDINGEN / INSCHRIJVEN &raquo; Inschrijven
            </td>
        </tr>
        <tr>
		 <%
				  'code by chandan to remove session of state in mycourses page
				  newstate=Session("State")
				  Session.Contents.Remove("State")
	   %>
          <!--#include virtual="/includes/innerLeftMenu-Dutch.asp"-->
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
              <h1 class="PageTitle">ONLINE ITILSTUDY OPLEIDINGEN</h1>	 
			 

			   <table>
                <tbody><tr>
                  <td id="imageHover"><img border="0" src="/images/buttons/New.jpg"/></td>
                  <td><br/>
                    De ITILstudy opleiding is in december 2011 bijgewerkt naar de nieuwe samenstelling volgens de syllabus van 2011 en is goedgekeurd door APMG.<br/>
                    <br/></br></td>

                </tr>
				
              </tbody></table>
              <table width="97%" onMouseOut="javascript:highlightTableRowVersionA(0);" id="myTable0" border="0" cellpadding="0" cellspacing="0">
			  <tr><td colspan="4" ><div align="right"><a href="/online-termsandcond.asp" target="_blank">Algemene voorwaarden</a></div></td></tr>
			 
                <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                  <td class="TableRowEven" width="60%"><a name="edu"></a><img src="/images/buttons/edu.png" ></td>
                  <td class="TableRowEven" colspan="3" ><div align="center"><span class="Header">Online opleidingen</span></div></td>
                </tr>		
			
			<script type="text/javascript">
			$(function(){
			   $('.cm').click(function(){
				var islogin="<%= session("FirstName") %>";			
				if  (islogin=="" || islogin==null)    // this part will only call when user not logged in will show a pop up to user.
				{
				
				var item_number=$(this).parents('tr:first').find('input:hidden:[name=item_number]').val();
				var url="/Dutch/Signin.asp?n="+item_number;
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
		 
<!--#include virtual="/Dutch/ITIL-OnlineCoursesShow.asp"-->
			 </table>
            </div>
             </div>
			 <div style="width:97%">
                <p class="general-body"><a href="/Dutch/systemRequirement.asp" target="_blank">Klik hier</a> Om de eisen van het systeem te bekijken voor toegang tot de online opleidingen van ITILstudy.</p>
              </div>
			<div style="width:97%"><br />
                <table border="0" width="100%">
				
                  <tr>
                    <td class="SubHeader">Algemene voorwaarden (let op) :</td>
                    <td><div align="right"><a href="/online-termsandcond.asp" target="_blank">Versie geschikt voor afdrukken</a></div></td>
                  </tr>
                </table>
				
              <ul type="disc">
                <li>De betaling aan ITILstudy.com wordt gedaan via <a href="https://www.paypal.com/uk/webapps/mpp/home" target="_blank">www.paypal.com</a> - een wereldleider op het gebied van betaaloplossingen (accepteert Visa, MasterCard, American Express etc.) die betalingen uit 45 landen wereldwijd accepteert.</li>
<li>De inschrijving voor ITILstudy.com vindt geheel online plaats (indien betaald via PayPal). Als u zich dus heeft ingeschreven bij ITILstudy.com en uw betaling heeft verricht, zult u een betaalbewijs ontvangen van PayPal. Uw gebruikersID en wachtwoord voor ITILstudy.com zullen worden gegeven in het scherm voor inschrijving op ITILstudy.com en in een e-mail die naar uw e-mailadres zal worden gestuurd. Het online inschrijvingsproces duurt tot 4 uur, waarna u via ITILstudy.com toegang zult hebben tot uw online opleiding.</li>
<li>Indien u geen betalingen kunt verrichten met creditcard, kunt u een e-mail sturen naar <a href="mailto:adminsupport@ITILstudy.com">adminsupport@ITILstudy.com</a>;  en zullen wij proberen een alternatieve betaalmethode voor u te regelen. <br /><br />

Let op: Indien u geen creditcard heeft of uw creditcard niet kunt gebruiken voor het verrichten van betalingen, kunt u wellicht de creditcard van een collega, vriend of familielid gebruiken. Daarna stuurt u een e-mail naar  <a href="mailto:adminsupport@ITILstudy.com">adminsupport@ITILstudy.com</a>; met de betaalgegevens en uw persoonsgegevens (naam, adres en primaire e-mailadres voor correspondentie). We zullen voor u een account aanmaken met uw persoonsgegevens zodat u de opleiding in eigen naam kunt genieten.</li>

<li>Let op : Het komt soms voor dat e-mails omtrent uw inschrijving van ITILstudy.com in uw map ongewenste e-mail/prullenbak belanden. Bekijk de e-mails in deze mappen dus goed als u een e-mail omtrent uw inschrijving bij ITILstudy verwacht.</li>
<li>Er zijn groeps-/bedrijfskortingen verkrijgbaar indien meer dan 3 personen zich tegelijkertijd inschrijven bij ITILstudy.com. Stuur voor gegevens een e-mail naar <a href="mailto:marketing@ITILstudy.com">marketing@ITILstudy.com</a></li>
<li>Een verlenging van de opleiding kost $ 40 / week of $ 140 / maand. Als u denkt dat u wellicht meer tijd nodig heeft voor de opleiding, wordt u aangeraden om de opleiding over een langere tijd te verspreiden dan waar u zich in eerste instantie voor zou inschrijven.</li>
<li>	Een annulering van de opleiding kost na een eerste inschrijving $ 50 (indien de opleiding binnen 2 dagen na aanvang van de toegang tot ITILstudy.com wordt geannuleerd). Annulering van de opleiding wordt na deze 2 dagen na aanvang van de toegang tot ITILstudy.com niet meer toegestaan.</li>
<li>De omvang van de opleiding vergroten of veranderen: Eventuele veranderingen van de opleiding, waaronder vergroting van de omvang daarvan, kan binnen 3 dagen na de eerste betaling worden aangevraagd. Nadat de eerste betaling is verricht is het echter niet meer mogelijk om geld te retourneren.</li>
<li>Indien u zich inschrijft voor een ITILstudy.com opleiding en het ITIL Foundation examen behaalt, zal uw naam worden toegevoegd aan de lijst succesvolle ITIL Foundation afgevaardigden op ITILstudy.com.</li>
<li>Informatie over uw inschrijving kan aan collega's van uw bedrijf worden verstrekt die wellicht meer informatie nodig hebben over onze opleiding.</li>
<li>ITILstudy.com zal uw persoonsgegevens niet aan derden verstrekken voor opname in marketingdatabases of uw persoonsgegevens aan anderen bekendmaken, BEHALVE in individuele gevallen waarin de persoon die de informatie opvraagt zorgvuldig is gecontroleerd of in het geval van gerechtelijke verzoeken. Uw persoonsgegevens kan worden gebruikt om u te informeren over andere opleidingen die ITILstudy.com aanbiedt.</li>

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
<!--#include virtual="/includes/footer-Dutch.html"-->
