<!--#include virtual="/metatags/enroll_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<script language="JavaScript" type="text/javascript" src="/js/tableH.js"></script>
<!--#include virtual="/includes/innerindustryrecognizedbanner.html"-->
<!--#include virtual="/includes/displayFormat-Online.asp"-->

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

Dim orderid 

'Generating unique order id'
orderid = 402962812342

randomno1=int(Year(Date()))

randomno2=int(Month(Date()))

randomno3=int(Weekday(Date()))

randomno4=int((Second(Now())))

randomno5 = (randomno1 + randomno2 + randomno3 + randomno4)

Order_ID = orderid + randomno5

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
      <td width="2%" class="Header">&nbsp;</td>
      <td width="25%" class="PageTitle">&nbsp;</td>
     <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; COURSES/ENROLL  &raquo; Enroll</td>
    </tr>
    <tr>
    
    <!--#include virtual="/includes/innerLeftMenu.asp"-->
    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div  >
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
window.open("","newwindow",'toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=0,minimizable=0,resizable=0,height=100,width=250,top=250,left=400')
}
//function discount(a)
//{
//if(a != "")
//{
//document.getElementById('discount').submit()
//}

//}
-->
</script>

        <p> <span class="Header">ITILstudy Online courses </span> <br />
</p>
        <table width="97%" onMouseOut="javascript:highlightTableRowVersionA(0);" id="myTable0" border="0" cellpadding="0" cellspacing="0">
        
        <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
            <td class="TableRowEven" width="60%"><a name="edu"></a><img src="/images/buttons/edu.jpg" ></td>
          
           <td class="TableRowEven" ><div align="center"><span class="Header">Online Courses</span></div></td>
          </tr>
          
             <form action="/customerdetails.asp" method="post">
                      <input type="hidden" name="item_number" value="0051">
                      <input type="hidden" name="APMG" value="APMG">
                      <input type="hidden" name="item_name" value="Understand ITIL Exam">
                      <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                        <td height="108" class="TableRowOdd"><a href="/test15ques.html" target="_blank"> <span class="TableCopyName"> Free 15 question test  </span> <span class="TableCopyDetails">(Understand ITIL exam format in 15 minutes). This test includes all the final Foundation Exam features including Marking Questions, Countdown timer and more.</a></span></td>
                        <td class="TableRowOdd" colspan="2"><div align="center">
                            <input name="submit" type="submit" class="ButtonBuyNow1" value="Enroll for FREE test">
                          </div></td>
                      </tr>
                    </form>

  			    
				<tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                        <td height="108" class="TableRowEven"><a href="/ITILonline.asp?action=30days" target="_blank"><span class="TableCopyName"> ITILstudy ITIL Foundation (Online Course) :</span> <span class="TableCopyDetails"> Priced at
                          <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India"  Then %>
                       <span class="TableCopyCost"> <% = Currency_Format_Front %> 100 <% = Currency_Format_Back %></span>
					     <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
						  <span class="TableCopyCost"> <% = Currency_Format_Front %> 75 <% = Currency_Format_Back %></span>
						  <% End If %>
						for 30 Days (This includes E-learning through Study Guides, Chapter Test and podcasts for all chapters)
                        </span></a></td>
						 <% If Session("CountryOrigin") = "India" Then %>
                    <form method="post" action="http://mycatstudy.com/itilstudy_ccavenue.asp" onSubmit="return validate_form(this)">
                      <input type="hidden" name="item_name" value="ITIL Online Course">
                      <input type="hidden" name="item_number" value="102">
					   <td class="TableRowEven"><div align="center">
                      <input type="submit" class="ButtonBuyNow" value="Buy - CCAvenue" />
                    </form></td>          
                      <% Else %>
                     <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                      <input type="hidden" name="cmd" value="_xclick">
                      <input type="hidden" name="business" value="adminsupport@projstudy.com">
                      <input type="hidden" name="item_name" value="ITIL Online Course">
                      <input type="hidden" name="item_number" value="102">
                       <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India"  Then %>
                       <input type="hidden" name="amount" value="100">
                       <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                          <input type="hidden" name="amount" value="75">
                        <% End If%>
                      <input type="hidden" name="return" value="http://www.itilstudy.com/payment-success.asp">
                      <input type="hidden" name="rm" value="2">
                      <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India"  Then %>
                                              <input type="hidden" name="currency_code" value="USD">

                         <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                                              <input type="hidden" name="currency_code" value="GBP">

                        <% End If%>
                     
					  <td class="TableRowEven"><div align="center">
                            <input name="submit" type="submit" class="ButtonBuyNow" value="Buy - Paypal">
                          </div></td>
                      </tr>
                    </form>
                     <% End If%>
                    
                    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                    <td height="108" class="TableRowOdd"><a href="/ITILonline.asp?action=60days" target="_blank"><span class="TableCopyName">ITILstudy ITIL Foundation (Online Course) :</span> <span class="TableCopyDetails">  Priced at
                         <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India"  Then %>
                       <span class="TableCopyCost"> <% = Currency_Format_Front %> 175 <% = Currency_Format_Back %></span>
					     <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
						  <span class="TableCopyCost"> <% = Currency_Format_Front %> 150 <% = Currency_Format_Back %></span>
						  <% End If %>
                        for 60 Days (This includes E-learning through Study Guides, Chapter Test and podcasts for all chapters)</span></a></td>
						
						<% If Session("CountryOrigin") = "India" Then %>
                    <form method="post" action="http://mycatstudy.com/itilstudy_ccavenue.asp" onSubmit="return validate_form(this)">
                      <input type="hidden" name="item_name" value="ITIL Online Course">
                      <input type="hidden" name="item_number" value="102">
					   <td class="TableRowOdd"><div align="center">
                      <input type="submit" class="ButtonBuyNow" value="Buy - CCAvenue" />
                    </form></td>          
                      <% Else %>
                      <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                      <input type="hidden" name="cmd" value="_xclick">
                      <input type="hidden" name="business" value="adminsupport@projstudy.com">
                      <input type="hidden" name="item_name" value="ITIL Online Course">
                      <input type="hidden" name="item_number" value="102">
                       <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India"  Then %>
                       <input type="hidden" name="amount" value="175">
                       <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                          <input type="hidden" name="amount" value="150">
                        <% End If%>
                      <input type="hidden" name="return" value="http://www.itilstudy.com/payment-success.asp">
                      <input type="hidden" name="rm" value="2">
                      <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India"  Then %>
                                              <input type="hidden" name="currency_code" value="USD">

                         <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                                              <input type="hidden" name="currency_code" value="GBP">

                        <% End If%>
                      
					  <td class="TableRowOdd"><div align="center">
                            <input name="submit" type="submit" class="ButtonBuyNow" value="Buy - Paypal">
                          </div></td>
                      </tr>
                    </form>
                      <% End If%>
                    
                    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                        <td height="108" class="TableRowEven"><a href="/ITILonline.asp?action=90days" target="_blank"><span class="TableCopyName">ITILstudy ITIL Foundation (Online Course) :</span> <span class="TableCopyDetails">Priced at
                        <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India"  Then %>
                       <span class="TableCopyCost"> <% = Currency_Format_Front %> 225 <% = Currency_Format_Back %></span>
					     <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
						  <span class="TableCopyCost"> <% = Currency_Format_Front %> 200 <% = Currency_Format_Back %></span>
						  <% End If %>
                        for 90 Days (This includes E-learning through Study Guides, Chapter Test and podcasts for all chapters) </span></a></td>
						
						  <% If Session("CountryOrigin") = "India" Then %>
                   <form method="post" action="http://mycatstudy.com/itilstudy_ccavenue.asp" onSubmit="return validate_form(this)">
                      <input type="hidden" name="item_name" value="ITIL Online Course">
                      <input type="hidden" name="item_number" value="102	">
					   <td class="TableRowEven"><div align="center">
                      <input type="submit" class="ButtonBuyNow" value="Buy - CCAvenue" />
                    </form></td>          
                      <% Else %>
                      <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                      <input type="hidden" name="cmd" value="_xclick">
                      <input type="hidden" name="business" value="adminsupport@projstudy.com">
                      <input type="hidden" name="item_name" value="ITIL Online Course">
                      <input type="hidden" name="item_number" value="102">
                      <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India"  Then %>
                       <input type="hidden" name="amount" value="225">
                       <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                          <input type="hidden" name="amount" value="200">
                        <% End If%>
                     <input type="hidden" name="return" value="http://www.itilstudy.com/payment-success.asp">
                      <input type="hidden" name="rm" value="2">
                      <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India"  Then %>
                                              <input type="hidden" name="currency_code" value="USD">

                         <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                                              <input type="hidden" name="currency_code" value="GBP">

                        <% End If%>
                       
					    <td class="TableRowEven"><div align="center">
                            <input name="submit" type="submit" class="ButtonBuyNow" value="Buy - Paypal">
                          </div></td>
                      </tr>
                    </form>
 						 <% End If%>
		 				   <tr>
				<td colspan="4" class="TableRowOdd">&nbsp;</td>
			</tr>
			
			  <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
            <td class="TableRowEven" width="60%"><img src="/images/buttons/Blended.jpg" ></td>
          
           <td class="TableRowEven" ><div align="center"><span class="Header">Blended Course</span></div></td>
          </tr>
             <!-- <form action="/customerdetails.asp" method="post">
                      <input type="hidden" name="item_number" value="0051">
                      <input type="hidden" name="APMG" value="APMG">
                      <input type="hidden" name="item_name" value="Understand ITIL Exam">
                      <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                        <td height="108" class="TableRowOdd"><a href="/test15ques.html" target="_blank"> <span class="TableCopyName"> Free 15 question test  </span> <span class="TableCopyDetails">(Understand ITIL exam format in 15 minutes). This test includes all the final Foundation Exam features including Marking Questions, Countdown timer and more.</a></span></td>
                        <td class="TableRowOdd" colspan="2"><div align="center">
                            <input name="submit" type="submit" class="ButtonBuyNow1" value="Enrol for FREE test">
                          </div></td>
                      </tr>
                    </form>-->
  
  			 <!--   <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                        <td height="108" class="TableRowOdd"><span class="TableCopyName"> ITILstudy ITIL Blend Course </span> <span class="TableCopyDetails">:
                        <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Other" Then %>Priced at
                        <span class="TableCopyCost"><% = Currency_Format_Front %> 100 <% = Currency_Format_Back %></span>
                        <% End If%>
						for 30 Days (This includes E-learning through Study Guides, Sample Case Studies and podcasts for all chapters)
                        </span></td>
                     <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                      <input type="hidden" name="cmd" value="_xclick">
                      <input type="hidden" name="business" value="adminsupport@projstudy.com">
                      <input type="hidden" name="item_name" value="ITILstudy Blend Course">
                      <input type="hidden" name="item_number" value="101">
                      <input type="hidden" name="amount" value="100.00">
                      <input type="hidden" name="return" value="http://www.itilstudy.com/payment-success.asp">
                      <input type="hidden" name="rm" value="2">
                      <input type="hidden" name="currency_code" value="USD">
                     
					  <td class="TableRowOdd"><div align="center">
                            <input name="submit" type="submit" class="ButtonBuyNow" value="Buy - Paypal">
                          </div></td>
                      </tr>
                    </form>
                    
                    
                    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                    <td height="108" class="TableRowEven"><span class="TableCopyName">ITILstudy ITIL Blend Course :</span> <span class="TableCopyDetails">  Priced at
                       <span class="TableCopyCost"><% = Currency_Format_Front %> 175.00 <% = Currency_Format_Back %></span>
                        for 60 Days (This includes E-learning through Study Guides, Sample Case Studies and podcasts for all chapters)</span></td>
                      <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                      <input type="hidden" name="cmd" value="_xclick">
                      <input type="hidden" name="business" value="adminsupport@projstudy.com">
                      <input type="hidden" name="item_name" value="ITILstudy Blend Course">
                      <input type="hidden" name="item_number" value="105">
                       <input type="hidden" name="amount" value="175.00">
                      <input type="hidden" name="return" value="http://www.itilstudy.com/payment-success.asp">
                      <input type="hidden" name="rm" value="2">
                      <input type="hidden" name="currency_code" value="USD">
                      
					  <td class="TableRowEven"><div align="center">
                            <input name="submit" type="submit" class="ButtonBuyNow" value="Buy - Paypal">
                          </div></td>
                      </tr>
                    </form>
                    -->
                    
                    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                        <td height="108" class="TableRowOdd"><span class="TableCopyName"><a href="/ITILblend.asp" target="_blank"> ITILstudy ITIL Foundation (Online Course + Exam Voucher) :</span> <span class="TableCopyDetails">Priced at
						  <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India"  Then %>
                       <span class="TableCopyCost"> <% = Currency_Format_Front %> 450 <% = Currency_Format_Back %></span>
					     <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
						  <span class="TableCopyCost"> <% = Currency_Format_Front %> 350 <% = Currency_Format_Back %></span>
						  <% End If %>
                        for 90 Days (This includes E-learning through Study Guides, Chapter Test and podcasts for all chapters) &nbsp;<%If Session("CountryOrigin") = "United Kingdom" Then %><b> One Exam Retake</b><%End If%> </span></a><br /><br />
                        If you have an ITIL discount code, please enter it here:
                        
                        
                         <form action="/blendPrice.asp?type=submit" method="get" id="discount" target="newwindow">
                    <br />Email Id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="Email" />
                          (Please provide the email id which is been entered while enrolling for PROJstudy classroom course)<br />
                           Discount Code:&nbsp;&nbsp;<input type="text" name="discountCode" />
                            
                              <input name="submit" type="submit" class="ButtonBuyNow" value="Validate" onClick="return openwindow()">
                           </form>
                        </td>
						 <% If Session("CountryOrigin") <> "India" Then %>
                           <form action="https://www.paypal.com/cgi-bin/webscr" method="post" id="paypal">

                     <input type="hidden" name="cmd" value="_xclick">
                      <input type="hidden" name="business" value="adminsupport@projstudy.com">
                      <input type="hidden" name="item_name" value="ITILstuyd Blend Course">
                      <input type="hidden" name="item_number" value="106">
                        <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India"  Then %>
                       <input type="hidden" name="amount" value="450">
                       <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                          <input type="hidden" name="amount" value="350">
                        <% End If%>
                     <input type="hidden" name="return" value="http://www.itilstudy.com/payment-success.asp">
                      <input type="hidden" name="rm" value="2">
					  
                      <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India"  Then %>
                                              <input type="hidden" name="currency_code" value="USD">

                         <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                                              <input type="hidden" name="currency_code" value="GBP">

                        <% End If%>
                       
					    <td class="TableRowOdd"><div align="center">
                            <input name="submit" type="submit" class="ButtonBuyNow" value="Buy - Paypal" id="paypal">
                          </div></td>
                          </form>
                          <% Else %>
                            <form method="post" action="http://mycatstudy.com/itilstudy_ccavenue.asp" onSubmit="return validate_form(this)">
                      <input type="hidden" name="item_name" value="ITILstuyd Blend Course">
                      <input type="hidden" name="item_number" value="106">
					   <td class="TableRowOdd"><div align="center">
                      <input type="submit" class="ButtonBuyNow" value="Buy - CCAvenue" />
                    </form></td>          
                      
                          
                      </tr>
                    
 <% End If%>
		  <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');"></tr>         
 
          <tr>
				<td colspan="4" class="TableRowEven">&nbsp;</td>
			</tr>
          <!-- <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
            <td class="TableRowEven"><a name="Black"></a> <img src="/images/buttons/courses_plus.jpg" width="166" height="43"></td>
            <td class="TableRowEven"><div align="left"><span class="Header">PHR Exam Preparation</span></div></td>
          </tr>
          <form action="/customerdetails.asp" method="post">
            <input type="hidden" name="item_number" value="605">
            <input type="hidden" name="item_name" value="Free Trial - Test 1">
            <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
              <td class="TableRowOdd"><U class="TableCopyName">Completely Free Simulated Practice Test (Test 1)</U> - 225 questions, 4 hours. <br>
                This is the closest you can get to the actual PHR exam format!
Please note that access is granted to as many as 100 candidates in any given block of 24 hours. This number is slated to go up progressively.

                </td>-->
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
     
    
      <div style="width:97%">
  
      
       <p>To know the system requirement for accessing ITILstudy online courses, please <a href="http://www.itilstudy.com/systemRequirement.asp" target="_blank">click here</a></p>
       <p class="Header">Terms and conditions:</p>
       <a href="/online-termsandcond.asp" target="_blank">Printable Version</a></span>
       <ul type="disc">
        <li>The payment to ITILstudy.com will be made through <a href="https://www.paypal.co.uk/">www.paypal.com</a> - a global leader in online payment solutions (accepts Visa, MasterCard, American Express etc.) with payments accepted from 45 countries worldwide.</li>
        
        <li>The enrolment in ITILstudy.com is Completely Online (if payment through PayPal) - so, as soon as you enroll in ITILstudy.com and make your payment, you will be provided with a receipt of payment from PayPal. Your User ID and Password for ITILstudy.com will be provided in the enrolment screen of ITILstudy.com and through an email sent to your email address. Online Enrolment process takes up to 4 hours, after which you will have access to your course in ITILstudy.com.</li>
        
        <li>If you cannot pay using a credit card, please email us at <a href="mailto:adminsupport@itilstudy.com"/>adminsupport@ITILstudy.com;</a> and we will arrange for an alternate payment mechanism for you.<br /><br/>Please Note: If you do not have a credit card or cannot use your credit card for making payment, please use the credit card of a colleague, friend or relative. Then, send an email to <a href="mailto:adminsupport@itilstudy.com"/>adminsupport@ITILstudy.com;</a> with the payment details and your personal information (name, address, and preferred email address for correspondence). We will set-up the account to reflect your personal details, so that you can take the course in your name.
</li>
        
       <li>Please Note : Sometimes, enrolment emails sent from ITILstudy.com may go to your Bulk/Junk Email folder. So, you are requested to look up emails in that folder if you expect an enrolment email from ITILstudy.</li>

       <li>Bulk/Corporate Discounts are available if more than 3 people would like to join ITILstudy.com course at one time. For details, please email us at <a href="mailto:marketing@itilstudy.com"/>marketing@ITILstudy.com</a></li>
    
       <li>Course Extension cost $ 40 / week or $ 140 / month. So, if you think you may need a longer time duration for study, it is recommended to take the longer duration course when you sign up initially.</li>
       <li>Course Cancellation costs $ 50 after initial enrolment (if course is cancelled within 2 days of access provided by ITILstudy.com). Also, no course cancellation request is allowed 2 days after the course access provided by ITILstudy.com.</li>

<li>Course Upgradation or Course change requests: Any changes to the course including course upgradation should be requested within 3 days of making the initial payment. However, no money can be refunded after initial payment is made.</li>

<li>If you enrol in a ITILstudy.com course and pass the ITIL Foundation Exam, your name will be added to the success list of ITIL Foundation delegates using ITILstudy.com.</li>
<li>Information about your enrollment may be provided to co-workers in your company who may ask for reference about our course.</li>

<li>ITILstudy.com will not distribute your personal information to any third party marketing database or disclose the personal details to anyone EXCEPT on a case to case basis after proper verification of the person requesting for the information or in case of legal requirements. Your personal information could be used for informing you regarding other courses being provided by ITILstudy.com.</li></ul>


      </div>
      <div>
        <p align="right">
         <!-- Google Code for Enrol.asp (PROJstudy) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "2";
var google_conversion_color = "ffffff";
var google_conversion_label = "U-eoCIOU9AEQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?label=U-eoCIOU9AEQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
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
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
