<!--#include virtual="/metatags/ITILOnlineFoundation_metetag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<script language="JavaScript" type="text/javascript" src="/js/tableH.js"></script>
<!--#include virtual="/includes/innerindustryrecognizedbanner.html"-->
<!--#include virtual="/includes/displayFormat.asp"-->
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
          <!--#include virtual="/includes/innerLeftMenu.asp"-->
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
              <h1 class="PageTitle">ITILstudy Online courses </h1>
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
			<!--15 question Free Online test to understand ITIL exam -->
                <form action="/customerdetails.asp" method="post">
                  <input type="hidden" name="item_number" value="0051">
                  <input type="hidden" name="APMG" value="APMG">
                  <input type="hidden" name="item_name" value="Understand ITIL Exam">
                  <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                    <td height="108" class="TableRowOdd"><a href="/test15ques.html" target="_blank"> <span class="TableCopyName"> Free 15 question test </span> <span class="TableCopyDetails">(Understand ITIL<sup>&reg;</sup> exam format in 15 minutes). This test includes all the final Foundation Exam features including Marking Questions, Countdown timer and more.</a></span></td>
                    <td class="TableRowOdd" colspan="3"><div align="center">
                        <% If Session("CountryOrigin") = "United Kingdom" Then %>
                        <input name="submit" type="submit" class="ButtonBuyNow1" value="Enrol for FREE test">
                        <% Else %>
                        <input name="submit" type="submit" class="ButtonBuyNow1" value="Enroll for FREE test">
                        <% End If %>
                      </div></td>
                  </tr>
                </form>
						<!--40 question Free Online test to understand ITIL exam -->
                <form action="/customerdetails.asp" method="post">
                  <input type="hidden" name="item_number" value="112">
                  <input type="hidden" name="APMG" value="APMG">
                  <input type="hidden" name="item_name" value="Free Simulated Test">
                  <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                    <td height="108" class="TableRowEven"><a href="/test40ques.html" target="_blank"> <span class="TableCopyName"> Completely Free Simulated Practice Test (Test 1)!!! </span><br /><span class="TableCopyDetails">Best way to understand ITIL<sup>&reg;</sup> Foundation Exam format.<br />(40 Questions, 1 hour - available for 2 days)</a></span></td>
                    <td class="TableRowEven" colspan="3"><div align="center">
                        <% If Session("CountryOrigin") = "United Kingdom" Then %>
                        <input name="submit" type="submit" class="ButtonBuyNow1" value="Enrol for FREE test">
                        <% Else %>
                        <input name="submit" type="submit" class="ButtonBuyNow1" value="Enroll for FREE test">
                        <% End If %>
                      </div></td>
                  </tr>
                </form>
				<!-- ITIL Foundation Online Course -->
               
                <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                  <td height="108" class="TableRowOdd"><a href="/ITILonline.asp?action=180days" target="_blank"><span class="TableCopyName">ITILstudy ITIL Foundation (Online Course) :</span> <span class="TableCopyDetails">Priced at
                    <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India"  OR Session("CountryOrigin") = "Other" Then %>
                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front %>
                    $ 300
                    <%' = Currency_Format_Back %>
                    </span>
                    <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                    200
                    <% = Currency_Format_Back %>
                    </span>
					<% ElseIf Session("CountryOrigin") = "Australia" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                    285 
                    <% = Currency_Format_Back %>
                    </span>
                    <% End If %>
                    for 180 Days (This includes E-learning through Study Guides, Chapter Test and podcasts for all chapters along with 18 PMI PDU Certificate) </span></a></td>
                  <% If Session("CountryOrigin") = "India" Then %>
                  <form method="post" action="http://mycatstudy.com/itilstudy_ccavenue.asp" onSubmit="return validate_form(this)">
                    <input type="hidden" name="item_name" value="ITIL Foundation Online Course">
                    <input type="hidden" name="item_number" value="104">
                    <td class="TableRowOdd" colspan="2"><div align="center">
                      <input type="submit" class="ButtonBuyNow" value="Buy - CCAvenue" />
                   </div>
                </td></form>
                  <% Else
				  If Session("CountryOrigin") = "Other" Then   %>
				 
                  <td class="TableRowOdd"><form method="post" action="http://www.pmstudy.com/itilOnline_ccavenue.asp">
                      <input type=hidden name=Merchant_Id value="t_satpat1848">
                    
                      <input type="hidden" name="Currency" value="USD">
                      <input type="hidden" name="ITIL_country" value="<% = ITIL_country %>">
                      <input type="hidden" name="Order_Id" value="<%=Order_Id%>">
                      <input type="hidden" name="TxnType" value="A">
                      <input type="hidden" name="actionID" value="txn">
                      <input type="hidden" name="item_number" value="104" />
                      <input type="hidden" name="item_name" value="ITILstudy Classroom Training - <% = Session("CountryOrigin") %>">
                    
                      <input type="hidden" name="amount" value="300">
                     
					  <input type="hidden" name="Redirect_Url" value="http://www.itilstudy.com/payment-success.asp">
                      <input name="submit" type="submit" class="ButtonBuyNow" value="Buy - CCAvenue" size="20">
                    </form></td>
					<% End If %>
                  <td class="TableRowOdd" colspan="2"><div align="center"><form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                      <input type="hidden" name="cmd" value="_xclick">
                      <input type="hidden" name="business" value="adminsupport@projstudy.com">
                      <input type="hidden" name="item_name" value="ITIL Foundation Online Course">
                      <input type="hidden" name="item_number" value="104">
                      <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Other"  Then %>
                      <input type="hidden" name="amount" value="300">
                      <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                      <input type="hidden" name="amount" value="200">
					  <% ElseIf Session("CountryOrigin") = "Australia" Then %>
                      <input type="hidden" name="amount" value="285">
                      <% End If%>
                      <input type="hidden" name="return" value="http://www.itilstudy.com/customerdetails.asp">
                      <input type="hidden" name="rm" value="2">
                      <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Other" Then %>
                      <input type="hidden" name="currency_code" value="USD">
                      <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                      <input type="hidden" name="currency_code" value="GBP">
					   <% ElseIf Session("CountryOrigin") = "Australia" Then %>
                      <input type="hidden" name="currency_code" value="AUD">
                      <% End If%>
                      <input name="submit" type="submit" class="ButtonBuyNow" value="Buy - Paypal">
                    </form></div></td>
                  <% End If%>
                </tr>
				
				<!--Intermediate OSA online course -->
				
				  <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                  <td height="108" class="TableRowEven"><a href="/ITILOSA.asp" target="_blank"><span class="TableCopyName">ITILstudy ITIL Intermediate OSA (Online Course) :</span> <span class="TableCopyDetails"> Priced at
                    <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "Other" OR Session("CountryOrigin") = "India"   Then %>
                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front %>
                    $ 665 
                    <%' = Currency_Format_Back %>
                    </span>
                    <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                   425 
                    <% = Currency_Format_Back %>
                    </span>
					<% ElseIf Session("CountryOrigin") = "Australia" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                   625 
                    <% = Currency_Format_Back %>
                    </span>
					<% ElseIf Session("CountryOrigin") = "UAE" Then %>
                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front %>
                   $ 665  
                    <%' = Currency_Format_Back %>
                    </span>
					<% ElseIf Session("CountryOrigin") = "Singapore" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                   838  
                    <% = Currency_Format_Back %>
                    </span>
                    <% End If %>
                    for 60 Days (This includes E-learning through Study Guides, Chapter Test and podcasts for all chapters along with 18 PMI PDU Certificate)</span></a></td>
                  <% If Session("CountryOrigin") = "India" Then %>
                 <form method="post" action="http://mycatstudy.com/itilstudy_ccavenue.asp" onSubmit="return validate_form(this)">
                    <input type="hidden" name="item_name" value="ITIL Intermediate OSA Online Course">
                    <input type="hidden" name="item_number" value="111">
                    <td class="TableRowEven" colspan="2"><div align="center">
                      <input type="submit" class="ButtonBuyNow" value="Buy - CCAvenue" />
                   </div>
                </td></form>
                
                <% Else 
				If Session("CountryOrigin") = "Other" Then  
				%>
              <td class="TableRowEven"><form method="post" action="http://www.pmstudy.com/itilOnline_ccavenue.asp">
                      <input type=hidden name=Merchant_Id value="t_satpat1848">
                     <input type="hidden" name="ITIL_country" value="<% = ITIL_country %>">
                      <input type="hidden" name="Currency" value="USD">
                     <input type="hidden" name="Order_Id" value="<%=Order_Id%>">
                      <input type="hidden" name="TxnType" value="A">
                      <input type="hidden" name="actionID" value="txn">
                      <input type="hidden" name="item_number" value="111" />
                      <input type="hidden" name="item_name" value="ITIL Intermediate OSA Online Course">
                     
                      <input type="hidden" name="amount" value="665">
                    
					  <input type="hidden" name="Redirect_Url" value="http://www.itilstudy.com/payment-success.asp">
                      <input name="submit" type="submit" class="ButtonBuyNow" value="Buy - CCAvenue" size="20">
                    </form></td>
					<% End If %>
                  <td class="TableRowEven" colspan="2"><div align="center"><form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                      <input type="hidden" name="cmd" value="_xclick">
                      <input type="hidden" name="business" value="adminsupport@projstudy.com">
                      <input type="hidden" name="item_name" value="ITIL Intermediate OSA Online Course">
                      <input type="hidden" name="item_number" value="111">
                      <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "Other" OR Session("CountryOrigin") = "India"   Then %>
                      <input type="hidden" name="amount" value="665">
                      <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                      <input type="hidden" name="amount" value="425">
					   <% ElseIf Session("CountryOrigin") = "Australia" Then %>
                      <input type="hidden" name="amount" value="625">
					  <% ElseIf Session("CountryOrigin") = "UAE" Then %>
                      <input type="hidden" name="amount" value="665">
					  <% ElseIf Session("CountryOrigin") = "Singapore" Then %>
                      <input type="hidden" name="amount" value="838">
                      <% End If%>
                      <input type="hidden" name="return" value="http://www.itilstudy.com/customerdetails.asp">
                      <input type="hidden" name="rm" value="2">
                      <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Other" OR Session("CountryOrigin") = "India"   Then %>
                      <input type="hidden" name="currency_code" value="USD">
                      <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                      <input type="hidden" name="currency_code" value="GBP">
					   <% ElseIf Session("CountryOrigin") = "Australia" Then %>
                      <input type="hidden" name="currency_code" value="AUD">
					  <% ElseIf Session("CountryOrigin") = "Singapore" Then %>
                      <input type="hidden" name="currency_code" value="SGD">
                      <% End If%>
                      <input name="submit" type="submit" class="ButtonBuyNow" value="Buy - Paypal">
                    </form></div></td>
                  <% End If%>
                </tr>
				
                
                		<!--Intermediate CSI online course -->
				
				  <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                  <td height="108" class="TableRowOdd"><a href="/ITILCSI.asp" target="_blank"><span class="TableCopyName">ITILstudy ITIL Intermediate CSI (Online Course) :</span> <span class="TableCopyDetails"> Priced at
                    <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "Other" OR Session("CountryOrigin") = "India"   Then %>
                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front %>
                    $ 665 
                    <%' = Currency_Format_Back %>
                    </span>
                    <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                   425 
                    <% = Currency_Format_Back %>
                    </span>
					<% ElseIf Session("CountryOrigin") = "Australia" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                   625 
                    <% = Currency_Format_Back %>
                    </span>
					<% ElseIf Session("CountryOrigin") = "UAE" Then %>
                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front %>
                   $ 665  
                    <%' = Currency_Format_Back %>
                    </span>
					<% ElseIf Session("CountryOrigin") = "Singapore" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                   838  
                    <% = Currency_Format_Back %>
                    </span>
                    <% End If %>
                    for 60 Days (This includes E-learning through Study Guides, Chapter Test and podcasts for all chapters along with 18 PMI PDU Certificate)</span></a></td>
                  <% If Session("CountryOrigin") = "India" Then %>
                 <form method="post" action="http://mycatstudy.com/itilstudy_ccavenue.asp" onSubmit="return validate_form(this)">
                    <input type="hidden" name="item_name" value="ITIL Intermediate CSI Online Course">
                    <input type="hidden" name="item_number" value="109">
                    <td class="TableRowOdd" colspan="2"><div align="center">
                      <input type="submit" class="ButtonBuyNow" value="Buy - CCAvenue" />
                   </div>
                </td></form>
                
                <% Else 
				If Session("CountryOrigin") = "Other" Then  
				%>
              <td class="TableRowOdd"><form method="post" action="http://www.pmstudy.com/itilOnline_ccavenue.asp">
                      <input type=hidden name=Merchant_Id value="t_satpat1848">
                     <input type="hidden" name="ITIL_country" value="<% = ITIL_country %>">
                      <input type="hidden" name="Currency" value="USD">
                     <input type="hidden" name="Order_Id" value="<%=Order_Id%>">
                      <input type="hidden" name="TxnType" value="A">
                      <input type="hidden" name="actionID" value="txn">
                      <input type="hidden" name="item_number" value="109" />
                      <input type="hidden" name="item_name" value="ITIL Intermediate CSI Online Course">
                     
                      <input type="hidden" name="amount" value="665">
                    
					  <input type="hidden" name="Redirect_Url" value="http://www.itilstudy.com/payment-success.asp">
                      <input name="submit" type="submit" class="ButtonBuyNow" value="Buy - CCAvenue" size="20">
                    </form></td>
					<% End If %>
                  <td class="TableRowOdd" colspan="2"><div align="center"><form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                      <input type="hidden" name="cmd" value="_xclick">
                      <input type="hidden" name="business" value="adminsupport@projstudy.com">
                      <input type="hidden" name="item_name" value="ITIL Intermediate CSI Online Course">
                      <input type="hidden" name="item_number" value="109">
                      <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "Other" OR Session("CountryOrigin") = "India"   Then %>
                      <input type="hidden" name="amount" value="665">
                      <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                      <input type="hidden" name="amount" value="425">
					   <% ElseIf Session("CountryOrigin") = "Australia" Then %>
                      <input type="hidden" name="amount" value="625">
					  <% ElseIf Session("CountryOrigin") = "UAE" Then %>
                      <input type="hidden" name="amount" value="665">
					  <% ElseIf Session("CountryOrigin") = "Singapore" Then %>
                      <input type="hidden" name="amount" value="838">
                      <% End If%>
                      <input type="hidden" name="return" value="http://www.itilstudy.com/customerdetails.asp">
                      <input type="hidden" name="rm" value="2">
                      <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Other" OR Session("CountryOrigin") = "India"   Then %>
                      <input type="hidden" name="currency_code" value="USD">
                      <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                      <input type="hidden" name="currency_code" value="GBP">
					   <% ElseIf Session("CountryOrigin") = "Australia" Then %>
                      <input type="hidden" name="currency_code" value="AUD">
					  <% ElseIf Session("CountryOrigin") = "Singapore" Then %>
                      <input type="hidden" name="currency_code" value="SGD">
                      <% End If%>
                      <input name="submit" type="submit" class="ButtonBuyNow" value="Buy - Paypal">
                    </form></div></td>
                  <% End If%>
                </tr>
                
                
                  <!--Service Transition online course -->
				
				  <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                  <td height="108" class="TableRowEven"><a href="/ITILTransition.asp" target="_blank"><span class="TableCopyName">ITILstudy ITIL Intermediate Service Transition (Online Course) :</span> <span class="TableCopyDetails"> Priced at
                    <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "Other" OR Session("CountryOrigin") = "India"   Then %>
                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front %>
                    $ 665 
                    <%' = Currency_Format_Back %>
                    </span>
                    <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                   425 
                    <% = Currency_Format_Back %>
                    </span>
					<% ElseIf Session("CountryOrigin") = "Australia" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                   625 
                    <% = Currency_Format_Back %>
                    </span>
					<% ElseIf Session("CountryOrigin") = "UAE" Then %>
                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front %>
                   $ 665  
                    <%' = Currency_Format_Back %>
                    </span>
					<% ElseIf Session("CountryOrigin") = "Singapore" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                   838  
                    <% = Currency_Format_Back %>
                    </span>
                    <% End If %>
                    for 60 Days (This includes E-learning through Study Guides, Chapter Test and podcasts for all chapters along with 18 PMI PDU Certificate)</span></a></td>
                  <% If Session("CountryOrigin") = "India" Then %>
                 <form method="post" action="http://mycatstudy.com/itilstudy_ccavenue.asp" onSubmit="return validate_form(this)">
                    <input type="hidden" name="item_name" value="ITIL Service Transition Online Course">
                    <input type="hidden" name="item_number" value="115">
                    <td class="TableRowEven" colspan="2"><div align="center">
                      <input type="submit" class="ButtonBuyNow" value="Buy - CCAvenue" />
                   </div>
                </td></form>
                
                <% Else 
				If Session("CountryOrigin") = "Other" Then  
				%>
              <td class="TableRowEven"><form method="post" action="http://www.pmstudy.com/itilOnline_ccavenue.asp">
                      <input type=hidden name=Merchant_Id value="t_satpat1848">
                     <input type="hidden" name="ITIL_country" value="<% = ITIL_country %>">
                      <input type="hidden" name="Currency" value="USD">
                     <input type="hidden" name="Order_Id" value="<%=Order_Id%>">
                      <input type="hidden" name="TxnType" value="A">
                      <input type="hidden" name="actionID" value="txn">
                      <input type="hidden" name="item_number" value="115" />
                      <input type="hidden" name="item_name" value="ITIL Intermediate Service Transition Online Course">
                     
                      <input type="hidden" name="amount" value="665">
                    
					  <input type="hidden" name="Redirect_Url" value="http://www.itilstudy.com/payment-success.asp">
                      <input name="submit" type="submit" class="ButtonBuyNow" value="Buy - CCAvenue" size="20">
                    </form></td>
					<% End If %>
                  <td class="TableRowEven" colspan="2"><div align="center"><form action="https://www.paypal.com/cgi-bin/webscr" method="post">

                      <input type="hidden" name="cmd" value="_xclick">
                      <input type="hidden" name="business" value="adminsupport@projstudy.com">
                      <input type="hidden" name="item_name" value="ITIL Intermediate Service Transition Online Course">
                      <input type="hidden" name="item_number" value="115">
                      <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "Other" OR Session("CountryOrigin") = "India"   Then %>
                      <input type="hidden" name="amount" value="665">
                      <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                      <input type="hidden" name="amount" value="425">
					   <% ElseIf Session("CountryOrigin") = "Australia" Then %>
                      <input type="hidden" name="amount" value="625">
					  <% ElseIf Session("CountryOrigin") = "UAE" Then %>
                      <input type="hidden" name="amount" value="665">
					  <% ElseIf Session("CountryOrigin") = "Singapore" Then %>
                      <input type="hidden" name="amount" value="838">
                      <% End If%>
                      <input type="hidden" name="return" value="http://www.itilstudy.com/customerdetails.asp">
                      <input type="hidden" name="rm" value="2">
                      <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Other" OR Session("CountryOrigin") = "India"   Then %>
                      <input type="hidden" name="currency_code" value="USD">
                      <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                      <input type="hidden" name="currency_code" value="GBP">
					   <% ElseIf Session("CountryOrigin") = "Australia" Then %>
                      <input type="hidden" name="currency_code" value="AUD">
					  <% ElseIf Session("CountryOrigin") = "Singapore" Then %>
                      <input type="hidden" name="currency_code" value="SGD">
                      <% End If%>
                      <input name="submit" type="submit" class="ButtonBuyNow" value="Buy - Paypal">
                    </form></div></td>
                  <% End If%>
                </tr>
                
                
                
                
                <tr>
                  <td colspan="4" class="TableRowOdd">&nbsp;</td>
                </tr>
				
				
                <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                  <td class="TableRowEven" width="60%"><a name="Blend"></a><img src="/images/buttons/Blended.png" ></td>
                  <td class="TableRowEven" colspan="3" ><div align="center"><span class="Header">Blended Course</span></div></td>
                </tr>
                <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                  <td height="108" class="TableRowOdd"><span class="TableCopyName"><a href="/ITILblend.asp" target="_blank"> ITILstudy ITIL Foundation (Online Course + Exam Voucher) :</span> <span class="TableCopyDetails">Priced at
                    <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Other" Then %>
                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front %>
                    $ 450
                    <%' = Currency_Format_Back %>
                    </span>
                    <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                    400
                    <% = Currency_Format_Back %>
                    </span>
					<% ElseIf Session("CountryOrigin") = "Australia" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                    560
                    <% = Currency_Format_Back %>
                    </span>
                    <% End If %>
                    for 90 Days (This includes E-learning through Study Guides, Chapter Test and podcasts for all chapters along with 18 PMI PDU Certificate) &nbsp;
                    <%'If Session("CountryOrigin") = "United Kingdom" Then %>
                    <!--<b> One Exam Retake</b>-->
                    <%'End If%>
                    </span></a><br />
                    <br />
                    <!--30% discount on ITIL blend course -->
                    <% 'If Session("CountryOrigin") = "United Kingdom" Then %>
                    <!--If you have an ITIL discount code, please enter it here:
                    <form action="/blendPrice.asp?type=submit" method="get" id="discount" target="newwindow">
                      <br />
                      Email Id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <input type="text" name="Email" />
                      <br />
                      (Please provide the email id which you used in order to
                      <% 'If Session("CountryOrigin") = "United Kingdom" Then %>
                      enrol
                      <% 'Else %>
                      enroll
                      <% 'End If %>
                      for the PROJstudy classroom course.)<br />
                      Discount Code:&nbsp;&nbsp;
                      <input type="text" name="discountCode" />
                      <input name="submit" type="submit" class="ButtonBuyNow" value="Validate" onClick="return openwindow()">
                    </form>-->
                    <!-- Ends here - 30% discount on ITIL blend course -->
                    <%' End If %>
                  </td>
				 <% If Session("CountryOrigin") = "Other" Then   %>
                  <td class="TableRowOdd"><form method="post" action="http://www.pmstudy.com/itilOnline_ccavenue.asp">
                      <input type=hidden name=Merchant_Id value="t_satpat1848">
                     
                      <input type="hidden" name="Currency" value="USD">
                    <input type="hidden" name="ITIL_country" value="<% = ITIL_country %>">
                      <input type="hidden" name="Order_Id" value="<%=Order_Id%>">
                      <input type="hidden" name="TxnType" value="A">
                      <input type="hidden" name="actionID" value="txn">
                      <input type="hidden" name="item_number" value="106" />
                      <input type="hidden" name="item_name" value="ITILstudy Classroom Training - <% = Session("CountryOrigin") %>">
                    
                      <input type="hidden" name="amount" value="450">
                     
					  <input type="hidden" name="Redirect_Url" value="http://www.itilstudy.com/payment-success.asp">
                      <input name="submit" type="submit" class="ButtonBuyNow" value="Buy - CCAvenue" size="20">
                    </form></td>
					<% End If %>
                  <td class="TableRowOdd" colspan="2"><div align="center"><form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                      <input type="hidden" name="cmd" value="_xclick">
                      <input type="hidden" name="business" value="adminsupport@projstudy.com">
                      <input type="hidden" name="item_name" value="ITILstuyd Blend Course">
                      <input type="hidden" name="item_number" value="106">
                      <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Other" Then %>
                      <input type="hidden" name="amount" value="450">
                      <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                      <input type="hidden" name="amount" value="400">
					  <% ElseIf Session("CountryOrigin") = "Australia" Then %>
                      <input type="hidden" name="amount" value="560">
                      <% End If%>
                      <input type="hidden" name="return" value="http://www.itilstudy.com/customerdetails.asp">
                      <input type="hidden" name="rm" value="2">
                      <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Other"  Then %>
                      <input type="hidden" name="currency_code" value="USD">
                      <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                      <input type="hidden" name="currency_code" value="GBP">
					   <% ElseIf Session("CountryOrigin") = "Australia" Then %>
                      <input type="hidden" name="currency_code" value="AUD">
                      <% End If%>
                      <input name="submit" type="submit" class="ButtonBuyNow" value="Buy - Paypal">
                    </form></div></td>
                </tr>
                </form>
                
                <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');"></tr>
                <tr>
                  <td colspan="4" class="TableRowEven">&nbsp;</td>
                </tr>
                <!-- <td class="TableRowOdd"><%
				
				hour1=hour(now)
				
				Select Case hour1
				
				  Case 1
					'Application("enable")="No"
					'Application("int2")=0
				
				  Case 3
					Application("enable")="No"
					'Application("int1")=Application("int2")+1
				
				  Case 5
					Application("enable")="No"
					'Application("int1")=Application("int2")+1
					
				  Case 7
					Application("enable")="Yes"
					'Application("int1")=Application("int2")+1
					
				  Case 9
					Application("enable")="No"
					'Application("int1")=Application("int2")+1
					
				  Case 11
					Application("enable")="No"
					'Application("int1")=Application("int2")+1
					
				  Case 13
					Application("enable")="No"
					'Application("int1")=Application("int2")+1
					
				  Case 15
					Application("enable")="No"
					'Application("int1")=Application("int2")+1
					
				  Case 17
					'Application("enable")="Yes"
					int1=int1+1
				
				  Case 19
					Application("enable")="No"
					'Application("int1")=Application("int2")+1
					
				  Case 21
					Application("enable")="No"
					'Application("int1")=Application("int2")+1
					
				  Case 23
					Application("enable")="No"
					'Application("int1")=Application("int2")+1
					
				  Case Else
					Application("enable")="No"
					Application("count")=0
						
				  End Select
				
				
				'If(Application("enable")="Yes" and Application("count")<10) Then
				'If(Application("enable")<>"No") Then
				'If(0<>0) Then
				If Application("int2") < 50  Then 
				
			%>
               
			   
			    <input type=hidden name="SPHRPHR" value="PHR">
                <div align="center">
                  <input name="Submit23" type="submit" class="ButtonGeneral" value="Enroll for FREE test">
                </div>
                <% Else %>
                <div align="left"> Test reached maximum limit; please try again after sometime, or enroll in other tests below </div>
                <% End If %>
              </td>
            </tr>
          </form>
       
 -->
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
