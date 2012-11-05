<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/includes/connection.asp"-->
<%
Dim strCountryDetails
Dim Rs,rqClasstype


If Request.QueryString("coursetype") <> "" Then
	 
	   rqClasstype = Request.QueryString("coursetype")
	   
	  Else
	  
	    rqClasstype = Request.Form("coursetype")
	  
End IF

Set Rs  = Server.CreateObject("ADODB.Recordset")

strCountryDetails = "SELECT * FROM ITIL_countrydetails WHERE country = '" & Session("CountryOrigin") & "' AND id = (SELECT MAX(id) FROM ITIL_countrydetails WHERE country = '"& Session("CountryOrigin") &"')"
			'response.Write(	strCountryDetails)	
Rs.Open strCountryDetails,ConnObj

Do Until Rs.EOF 
	
	Cancellation1 = Rs("cancellation1")
	Cancellation2 = Rs("cancellation2")
	Cancellation3 = Rs("cancellation3")
	Reschedule1   = Rs("reschedule1")
	Reschedule2   = Rs("reschedule2")
	Reschedule3   = Rs("reschedule3")
	PaymentGateways = Rs("payments")

Rs.Movenext
Loop

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Terms and Conditions</title>
<link rel="shortcut icon" href="/images/buttons/favicon.ico">
<link rel="stylesheet" href="/css/style.css" type="text/css" />
<script language="javascript">
<!--
function openit() {
newWindow = window.open('emailus.asp', 'myWindow', 'toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=0,minimizable=0,resizable=0,width=500,height=315');
}
// -->
</script>
</head>
<body>
<table width="100%">
  <tr>
    <td class="general-body"><ol type="1">
          <OL>
          <% If Session("CountryOrigin") <> "India" And Session("CountryOrigin") <> "Other"  Then%>
          
           <% If  rqClasstype <> "OSA" AND rqClasstype <> "CSI" Then%>
           
            <LI><span class="SubHeader">Money Back Guarantee:</span> Ensures that you pass the ITIL Foundation exam or we refund your fees. <a href="/ITIL-Training/moneyBack.asp" target="_blank">More</a></LI>
            
             <% End If %>
            
            <% End If %>
            <LI> <span class="SubHeader">Payment towards enrolment:</span> Full payment of the enrolment fee is due at the time of registration. Payment can be done through<br /><br />
			<% = PaymentGateways %><br />
           <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then%>
            <br />Or<br /><br />
           Phone: We also accept credit card payments through phone. <a href="/payment-overphone.asp" target="_blank">More</a><br />
           <% End If %>
		</LI>
         
        <li><span class="SubHeader">Course cancellation policy for classroom training program (if the course is cancelled by ITILstudy):</span><br /><br />
		
		  <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada"  Then %>

We may cancel any particular class because of insufficient enrollment, instructor illness or force-majeure events(like floods, earthquakes, political instability, etc.). <br /><br />There are three options available if ITILstudy cancels a class:<br /><br /><ul><li type="square">Transfer to a ITILstudy class in another location but in the same week: Students will have the option to transfer to another confirmed ITILstudy class in the same week but in another location. If they transfer to a class  70 – 250 miles driving distance, they will be refunded $200. If they transfer to a class more than 250  miles away, they will be refunded $350. This will compensate the students for the inconvenience caused and help them for travel and stay related expenses in the new location. ITILstudy will try to inform about class cancellation at least one week in advance so that students can plan to attend the class in another location.</li>

<li>Reschedule to a future class in any location: Students can opt to reschedule to a future class in any location. The amount paid for the ITILstudy class will be applied towards the future class.</li>
<li>Ask for full refund: Students will have the option to ask us for a full refund of their payment in case of course cancellation done by ITILstudy.com Classroom Training. </li>
</ul>
 </li>


<%ElseIf Session("CountryOrigin") =  "Germany" Then %>

Transfer to a ITILstudy class in another location but in the same week: Students will have the option to transfer to another confirmed ITILstudy class in the same week but in another location. If they transfer to a class 70 – 250 km driving distance, they will be refunded € 150. If they transfer to a class more than 250 km away, they will be refunded € 300. This will compensate the students for the inconvenience caused and help them for travel and stay related expenses in the new location. ITILstudy will try to inform about class cancellation at least one week in advance so that students can plan to attend the class in another location.

<li>Reschedule to a future class in any location: Students can opt to reschedule to a future class in any location. The amount paid for the ITILstudy class will be applied towards the future class.</li>
<li>Ask for full refund: Students will have the option to ask us for a full refund of their payment in case of course cancellation done by ITILstudy.com Classroom Training. </li>
</ul>
 </li>
 
 

<% Else %>

We may cancel any particular class because of insufficient enrolments, instructor illness or force-majeure events (like floods, earthquakes, political instability, etc.). We will make all reasonable efforts to reschedule a cancelled class and you may transfer the training fee you have paid to a future class. However, you have the option to ask for a full refund of your payment in case the course is cancelled by ITILstudy. </li>

<% End If %>

  <li><span class="SubHeader">	Course cancellation policy for classroom training program (if the student cancels his enrolment):</span>

          <ul type="square">
            <br />
            <li>Cancellation more than 12 days before the course commencement date: Cancellation fee will be <% = Cancellation1%> (This is the minimum cancellation fee charged).
           </li>
            <li>Cancellation 5 days - 12 days before the course commencement date: Cancellation fee will be <% = Cancellation2%>.
             </li>
            <li>Cancellation within 5 days of the course commencement date: <% = Cancellation3%> will be refunded.</li>
			
          </ul>
         Please note that we charge cancellation fee to compensate for our fixed expenses including hotel bookings, instructor fees, etc. All refunds will be processed and payments will be made to the students within 30 days of receipt of course cancellation request.  </li>
        <li><span class="SubHeader">Course rescheduling:</span> A student may opt to reschedule a course after initial enrolment. Then, a rescheduling fee is charged (provided there is availability in the future course) as mentioned below: 
          <ul type="square">
            <br>
            <li>Rescheduling more than 12 days before the course commencement date: Additional rescheduling fee of <% = Reschedule1 %> will be charged (This is the minimum rescheduling fee charged if any student reschedules).</li>

            <li>Rescheduling 5 days - 12 days before the course commencement date: Additional rescheduling fee of <% = Reschedule2 %> will be charged</li>
			<li>Rescheduling within 5 days of the course commencement date: Additional rescheduling fee of <% = Reschedule3 %> will be charged. </li>
          </ul>
          Please note that the additional rescheduling charges should be paid to  <% If Session("CountryOrigin") = "India" Then%> Edusys Services Pvt. Ltd.  <% ElseIf Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada"  OR Session("CountryOrigin") =  "Germany" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Australia" Then%> VMEdu, Inc.<%End If%> within 7 days of receipt of course rescheduling request. 
         </li>
        <li><span class="SubHeader">Proprietary use of ITILstudy’s study material: </span>We will provide you study guides and other material, which are proprietary property of ITILstudy. Therefore, no part of any course materials may be reproduced, stored in a retrieval system, or transmitted in any form or by any means, electronic, mechanical, photocopying, recording or otherwise, or translated into any language, without our prior written consent. Any such activity constitutes a violation of copyright laws and the APMG code of ethics and will be reported to APMG.</li>
		<% If Session("CountryOrigin") <> "India" And Session("CountryOrigin") <> "United Kingdom" Then %> 
		<li>The classroom training fee is inclusive of expenses toward ITIL<sup>&reg;</sup> 
       <% If  rqClasstype = "OSA" or rqClasstype = "CSI" Then%> 
       Intermediate 
       <% Else%>
		Foundation 
       <% End  If %>

        examination, ITILstudy study material, training<%If Session("CountryOrigin") <> "India" Then%>, lunch<%End If %> and refreshments during breaks for 
        
        <% If  rqClasstype = "OSA" or rqClasstype = "CSI" Then%>
        three 
       <% Else%>
		two 
       <% End  If %>
        days of training.</li>
        
		<% Else %>
		<li>The classroom training fee is inclusive of expenses toward ITIL<sup>&reg;</sup> Foundation examination, ITILstudy study material, training and refreshments during breaks for two days of training.</li>
		<% End If %>
		<li>The classroom training fee does not include cost that the student would have to incur towards hotel stay, travelling,<% If Session("CountryOrigin") = "India" Then%><!--lunch during the 2 days of training ,--><% End if %> etc.</li>
		<li>Information about your enrollment may be provided to co-workers in your company who may ask for reference about our course. <% =rqClasstype %></li>
      
      
      <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then%>
      
      <li>The validity of this referral program is till February 28, 2013. </li>
      <li>The referral program is valid only for those who have completed the classroom training through us. </li>
      <li>To be eligible for the referral program, the referee needs to take the classroom program within six (6) months of being referred. </li>
      <li>The maximum gift voucher that can be issued to a referrer is 10 per month. </li>
      <li>The referral discounts cannot be combined with any other discounts except the Early Bird Discount.</li>
      <li>In case of any dispute, VMEdu's decision is final. </li>
      <li>VMEdu has the discretion to change the terms and conditions without any prior notice. </li>
      
      <% End IF %>
      </ol></td>
  </tr>
</table>

<div align="center"><font size="1px">ITIL<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.</font></div>

</body>
</html>
<!--#include virtual="/includes/connectionClose.asp"-->
