<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<% 
	If Session("USBUserId") = "" Then 
		Response.Redirect("login.asp")
	Else
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>FAQs</title>
<!-- CSS -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/faqs.css">
<!--[if IE 6]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie6.css" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie7.css" /><![endif]-->
<!-- JavaScripts-->
<script src="/js/prototype.js" type="text/javascript"></script>
<script src="/js/ricoCommon.js" type="text/javascript"></script>
<script src="/js/ricoEffects.js" type="text/javascript"></script>
<script src="/js/ricoAccordion.js" type="text/javascript"></script>
<script type="text/JavaScript" language="JavaScript">
function faqAccordionInit(elementId){

	var accordion_options={
		panelHeight:"auto",
		tabLocation:"inline",
		mode:"free",
		onLoadShowTab: -1,
		collapsedTextColor:"#333",
		expandedTextColor:"#333",
		transitionColor: "#CCCCCC",
		duration:50
	};
   
	new Rico.Accordion($(elementId),accordion_options);
  }

</script>
</head>
<body>
<div id="wrapper">
<!--#include file="includes/topMenu.asp"-->
<!-- // #end mainNav -->
<div id="containerHolder">
<div id="container">
<div id="sidebar">
  <!--#include file="includes/leftMenu.asp"-->
  <!-- // .sideNav -->
</div>
<!-- // #sidebar -->
<!-- h2 stays for breadcrumbs -->
<h2><a href="home.asp">Home</a> &raquo; <a href="fin.asp" class="active">FAQs</a></h2>
<div id="main">
  <h3>FAQs</h3>
  <fieldset>
  <!-- FAQs start here -->
  <div id="outerFormContainer">
    <div id="mainContent" class="faqGroup">
      <h3>Marketing:</h3>
      <div style="border-bottom: 1px solid;" id="faqContainer1" class="panel">
        <div id="faqPanel1_1">
          <div id="faqHeader1_1" class="collapsed">
            What are the Corporate rates that we offer?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_1" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
                  <table width="100%" class="table1">
				  	<tr>
						<td>Course price per student</td>
						<td>Corporate pricing for the first 2 classes (Evaluation pricing - onsite/offsite)</td>
						<td>Final Corporate pricing (Onsite – in the company’s Facility)</td>
						<td>Final Corporate pricing (Offsite – PMstudy’s Facility)</td>
					</tr>
                    <% If (Session("CountryOrigin") <> "Germany") Then %>
              <tr>
                <td>Less than 5 students </td>
                <td>&nbsp; </td>
                <td> $ 1,800 *</td>
                <td> $ 1,850 *</td>
              </tr>
              <tr>
                <td>5 - 9 students</td>
                <td>&nbsp; </td>
                <td> $ 1,700 *</td>
                <td> $ 1,800 *</td>
              </tr>
              <tr>
                <td>10 - 14 students</td>
                <td> $ 1,600</td>
                <td> $ 1,650 </td>
                <td> $ 1,750 </td>
              </tr>
              <tr>
                <td>15 - 19 students</td>
                <td> $ 1,450 </td>
                <td> $ 1,500 </td>
                <td> $ 1,600 </td>
              </tr>
              <tr>
                <td>20 - 25 students</td>
                <td> $ 1,300</td>
                <td> $ 1,400 </td>
                <td> $ 1,500 </td>
              </tr>
              <% Else %>
                <tr>
                <td>Less than 5 students </td>
                <td>&nbsp; </td>
                <td> &#8364; 1,850 *</td>
                <td> &#8364; 1,950 *</td>
              </tr>
              <tr>
                <td>5 - 9 students</td>
                <td>&nbsp; </td>
                <td> &#8364; 1,800 *</td>
                <td> &#8364; 1,900 *</td>
              </tr>
              <tr>
                <td>10 - 14 students</td>
                <td> &#8364; 1,600</td>
                <td> &#8364; 1,700 </td>
                <td> &#8364; 1,850 </td>
              </tr>
              <tr>
                <td>15 - 19 students</td>
                <td> &#8364; 1,500 </td>
                <td> &#8364; 1,600 </td>
                <td> &#8364; 1,750 </td>
              </tr>
              <tr>
                <td>20 - 25 students</td>
                <td> &#8364; 1,400</td>
                <td> &#8364; 1,500 </td>
                <td> &#8364; 1,650 </td>
              </tr>
              <% End If %>
				  </table>
				  <label><br />* Classes may not always be feasible and approval is required before confirming to the client. Please email marketing@PMstudy.com and t_satpathy@pmstudy.com for approval.</label>
				  <label><br />Please note: Additional discounts would be available for larger corporates. Please email marketing@PMstudy.com and t_satpathy@pmstudy.com for additional discounts.</label>				  
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

        <div id="faqPanel1_2">
          <div id="faqHeader1_2" class="collapsed">
            How do corporate clients remit the course fee to us for training their employees?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_2" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>There are different ways by which companies have made payments to us. Some examples are:</label>
				  <label>
				    <ol>
					  <li>a) Student enrolls, gets a proforma invoice (online) from us and the company sends us a check</li>
					  <li>b) Company asks us for a proforma invoice, we send it to them, they send us a Purchase Order, and once we submit the purchase order, they send us a check.</li>
					  <li>c) Student enrolls, company asks us for an invoice. We send them an invoice and then they want to us to register in their system to become approved vendors. We register and become approved vendors. Then the company makes the payment through bank transfer.</li>
					</ol>
					</label>
					<label>Broadly - there is no one way by which we receive payments from a company. We pretty much work with the company the way they want and we accept all modes the payment. Usually the company tells us how they want to pay us and we follow their procedures.</label>
					<label>So, just ascertain the mode of payment from the company and we will work through the related matters.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div> 
		</div>
		
        <div id="faqPanel1_3">
          <div id="faqHeader1_3" class="collapsed">
            Do we provide lunch to our corporate students? 
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_3" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>No, we do not provide lunch to our corporate students for onsite training. However, for offsite training, we provide lunch.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div> 
		</div>		

        <div id="faqPanel1_4">
          <div id="faqHeader1_4" class="collapsed">
            What all do we provide to our corporate students? 
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_4" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>Access to PMstudy prep course and one month PMstudy online course, study materials, certificates, and gifts will be provided to our students.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div> 
		</div>

        <div id="faqPanel1_5">
          <div id="faqHeader1_5" class="collapsed">
            How do we enroll the corporate students, who attend our offsite classes?  
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_5" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label><h3>For offsite students:</h3></label>
				  <label>As soon as the program is confirmed, please ask the company to send an email to marketing@PMstudy.com with the following information on the participants for enrollment:</label>
				  <label>
				  	<ol type="a">
						<li>a) Full Name</li>
						<li>b) Email Address</li>
						<li>c) Physical Address</li>
						<li>d) Phone Number</li>
					</ol>
				  </label>
				  <label>Our back office team will enroll them within 12 hours and send emails to all the participants with their login details to access our online preparatory course.</label>
				  <label><h3>For onsite students:</h3></label>
				  <label>As soon as the program is confirmed, please ask the company to send an email to marketing@PMstudy.com with the following information on the participants for enrollment:</label>
				  <label>
				  	<ol type="a">
						<li>a) Full Name</li>
						<li>b) Email Address</li>
						<li>c) Physical Address</li>
						<li>d) Phone Number</li>
					</ol>				  
				  </label>
				  <label>Our back office team will enroll them within 12 hours and send emails to all the participants with their login details to access our online preparatory course.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div> 
		</div>


        <div id="faqPanel1_6">
          <div id="faqHeader1_6" class="collapsed">
            <% If Session("CRM_Country") <> "Germany" Then %>Do we have to sign the W9 form?<% End If %> Do we ask for 100% of the course fee upfront or is it 50% before the program and 50% after the program?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <% If Session("CRM_Country") <> "Germany" Then %><label>Usually we do not need to sign a company’s W-9 form. However, if the client insists, the faculty can sign it.</label><% End If %>
				  <label>We prefer 100% payment upfront. The objective is to receive the payment promptly (we know from past experience that some companies and government departments have delayed making payments). There is no fixed policy in this regard and usually we deal with this on a case to case basis.</label>
				  <label>By the way, some companies may be fine with making 100% payment in advance, which is the best option. So, just suggest this to them.  If they are not fine with it, we can ask for a 50% advance and 50% at the end of the program. If this is also not acceptable to the company, they have to make the full payment at the end of the program.</label>
				  <label>As in the case of non-corporate classes, the faculty will receive the remuneration after the course fee is realized.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div> 
		</div>

	  <script type="text/JavaScript" language="JavaScript">
		//start this accordion
		faqAccordionInit("faqContainer1");
	  </script>		
	  </div>
	  
	  <!-- Second tab faqs -->
	  <h3><br />Back office:</h3>
      <div style="border-bottom: 1px solid;" id="faqContainer2" class="panel">
        <div id="faqPanel12_1">
          <div id="faqHeader12_1" class="collapsed">
            How do you access the back office system?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel12_1" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>You can access the US back office by going to <a href="http://www.pmstudy.com/usbackoffice/login.asp" target="_blank">www.pmstudy.com/usbackoffice/login.asp</a></label>				  
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>
        <% If Session("CRM_Country") <> "Germany" Then %>
        <div id="faqPanel12_2">
          <div id="faqHeader12_2" class="collapsed">
            What is the process to be followed for making calls to students? 
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel12_2" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>
				  	<ol type="a">
						<li>a) When a prospect enrolls/calls our receptionist, emails will be sent out to both the primary faculty and the alternate faculty, who are responsible for following up enrollments/calls for that city assigned to them. </li>
						<li>b) Log into the back office system -->Check B2C calls --> 
							<ul>
								<li>i) If there are no entries in the ‘Comments’ section, please call the prospect. After the call, enter comments in the back office. </li>
								<li>ii) If there are entries in the ‘Comments’ section, it implies that the prospect has already been contacted by one of the faculty. So, the other faculty need not contact again.</li>
							</ul>
						</li>
						<li>c) If the same prospect is contacted by more than one faculty, the faculty who contacted first gets the marketing incentive.</li>
					</ol>
				  </label>				  
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>



        <div id="faqPanel12_3">
          <div id="faqHeader12_3" class="collapsed">
            Will the notification go to both primary and alternate faculty at the same time?  How can duplication of calls be avoided?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel12_3" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>Emails will be sent out to both the primary and the alternate faculty at the same time. This is done to improve promptness of response.</label>	
				  <label>After receiving the email, the faculty should login to the back office online system before they contact the prospect, to ensure that duplication of calls by both the faculty is avoided.</label>
				  <label>As soon as the call is completed, the faculty who has contacted the prospect should update the online system, with their comments regarding the follow up, so that the alternate faculty will know that the prospect has been contacted.</label>		  
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>		
         <% End If %>
        
        <div id="faqPanel12_4">
          <div id="faqHeader12_4" class="collapsed">
           From where can you download the documents required for Day 3 and Day 4?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel12_4" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>All the documents required for Day 3/Day 4 of the class are available in the PMstudy US back office: Log into the back office system --> Overview --> Classroom course related documents.</label>	
				  <label>So, you can download and take the required number of printouts.</label>		  
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>	
		

        <div id="faqPanel12_5">
          <div id="faqHeader12_5" class="collapsed">
           From where can you download the reimbursement form?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel12_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>The reimbursement form is available in the PMstudy US back office: Log into the back office system --> Overview --> Understanding the back office system.</label>		  
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>	
						
	  <script type="text/JavaScript" language="JavaScript">
		//start this accordion
		faqAccordionInit("faqContainer2");
	  </script>		
	  </div>

	  <!-- Third tab faqs -->
	  <h3><br />Finance:</h3>
      <div style="border-bottom: 1px solid;" id="faqContainer3" class="panel">
        <div id="faqPanel13_1">
          <div id="faqHeader13_1" class="collapsed">
            <% If Session("CRM_Country") <> "Germany" Then %>How<% Else %>When<% End IF %> is the faculty remuneration remitted?   
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel13_1" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label><% If Session("CRM_Country") <> "Germany" Then %>The payment is made by check drawn on Bank of America and the check is mailed to faculty directly.<% Else %>The payment is remitted by 5th of every month.<% End IF %></label>	
                 </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

        <div id="faqPanel13_2">
          <div id="faqHeader13_2" class="collapsed">
            How do I submit the hotel bills after the classroom program is completed?  
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel13_2" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>Once the classroom program is completed, you can send the hotel bills to the back office staff by:</label>
				  <label>Email: instructors@pmstudy.com</label>
				  <label>Fax: 240-238-2987</label>
				  <label>Mail: VMEdu, Inc., 4539 Metropolitan Ct., Frederick, MD 21704. Ph: 888 507 6872</label>
				</div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>


        <div id="faqPanel13_3">
          <div id="faqHeader13_3" class="collapsed">
            What payment options are available to our students (B2C), if they cannot remit through <% If Session("CRM_Country") <> "Germany" Then %>Google checkout<% Else %>PayPal<% End If %>?  
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel13_3" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
                 <% If Session("CRM_Country") <> "Germany" Then %>
				  <label>In case payments cannot be made though our primary credit card processor - Google Checkout, payments can be made through PayPal, a leading credit card processor for online merchants. They accept Visa, MasterCard and Amex.</label>
				  <label>If payment is made by check, the check should be made favoring "VMedu Inc" and sent to VMedu Inc, 4539 Metropolitan Ct, Frederick, MD 21704. Ph: 888 507 6872.</label>
				  <label>If payments have to be made for more than one (1) student at a time or for making corporate/ discount payments, they can be made using either Google Checkout or PayPal by following the link www.pmstudy.com/payforclass.asp. </label>
                  <% Else %>
                   <label>In case payments cannot be made through our primary credit card processor - PayPal, payments can be made through check favoring "Edusys Services Pvt. Ltd" and sent to Edusys Services Pvt. Ltd, 1-3 Floor, 124 Baker Street, London W1U6TY, England.</label>
                   <label>Or alternatively through Wire Transfer: Please use the following details to make payment through wire transfer</label>
                    <label>Bank Name: HSBC<br>
Type of Account: UK Business Account<br>
Account Name: Edusys Services Pvt Ltd<br>
Account Number: 01671855<br>
Branch Sort Code: 40-05-26. </label>
                     <label>If payments have to be made for more than one (1) student at a time or for making corporate/ discount payments, they can be made using PayPal by following the link www.pmstudy.com/payforclass.asp.</label>
                  <% End If %>
                  
				</div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>


        <div id="faqPanel13_4">
          <div id="faqHeader13_4" class="collapsed">
            If the student (B2C) wants to make the payments on the first day of the class, what do we advise? 
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel13_4" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>Generally, we do not entertain such requests. Please ask the students to enroll and make the payment at the earliest, so that they can have the benefit of early access to our online preparatory course. This will help them to be better prepared for the class. They will also earn the required number of PDUs and can start early on the PMP exam application process.</label>
				</div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>


        <div id="faqPanel13_5">
          <div id="faqHeader13_5" class="collapsed">
            What is the procedure to be followed if a student does not pass in the first attempt and wants to invoke the money back guarantee? 
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel13_5" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>On coming to know that the student has failed in the first attempt, the back office team would extend the student’s one month online access. Then they will send the following email:</label>
				  <label>“We are sorry to hear that you did not pass PMP exam. Please find the details of PMstudy.com’s money-back policy for classroom training listed below. You can also click <a href="http://www.pmstudy.com/PMP-Classes/moneyBack.asp" target="_blank">PMstudy's Money Back Guarantee</a> for more details.</label>
				  <label>* If you do not pass the PMP exam in the first attempt, PMstudy.com will reimburse you $275* for retaking the exam. Also, you will be given access to PMstudy.com online course for additional 40 days. However, you should retake the exam within 30 calendar days of your first attempt. </label>
				  <label>* For reimbursement of your re-examination fee, we need a scanned/soft copy of your exam result and a scanned-copy of proof of payment made to PMI for retaking the exam. We will reimburse you within 30 days of receiving the same. </label>
				  <label>* Please send the above cited documents to marketing@pmstudy.com and to your faculty so we can process the refund and course extensions. </label>
				  <label>However, please note that we have already extended your access to PMstudy.com online course for an additional 40 days.</label>
				  <label>We wish you all the best for the PMP exam.” </label>
				</div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>
				
        <% If Session("CRM_Country") <> "Germany" Then %>

        <div id="faqPanel13_6">
          <div id="faqHeader13_6" class="collapsed">
           What is VMEdu’s Tax Id number? In whose name the company should the check be drawn and to which address should it be sent? 
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel13_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>VMEdu EIN is: 26-3869262. </label>
				  <label>The check has to be made in the name of VMEdu, Inc. and the check has to be sent to our Frederick, MD address: </label>
				  <label>VMEdu, Inc., <br />4539 Metropolitan Ct.<br />Frederick, MD 21704 </label>
				</div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>
       <% End  If%>

        <div id="faqPanel13_7">
          <div id="faqHeader13_7" class="collapsed">
           Can we invoice the prospect’s company for the PMP course? Do we have to wait for the payment for providing access to the online preparatory program?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel13_7" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>We can invoice the prospect’s company for the PMP classroom training fee. </label>
				  <label>However, we can provide access to the online preparatory program as soon as we get either a confirmation email or a Purchase Order from the approval authority of the company.</label>
				</div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>
			

        <div id="faqPanel13_8">
          <div id="faqHeader13_8" class="collapsed">
           Do we accept purchase order, voucher etc? 
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel13_8" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>Yes, we do accept purchase order and corporate vouchers.</label>
				</div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>
			
							

        <div id="faqPanel13_9">
          <div id="faqHeader13_9" class="collapsed">
           <% If Session("CRM_Country") = "Germany" Then %>How do <% Else %> Do <% End If %> we send the payment voucher/ purchase order to <% If Session("CRM_Country") <> "Germany" Then %>Sandra/Devina or to<% End If %> anyone else in our organization?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel13_9" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
                <% If Session("CRM_Country") <> "Germany" Then %>
				  <label>You need to send emails to marketing@pmstudy.com and Devina (devina.mahapatra@mybusinessassistant.com) or Sandra (sandra.s@pmstudy.com). </label>
				  <label>Devina or Sandra will follow up for the payment.</label>
                  <% Else %>
                  <label>You can scan the payment voucher/ purchase order and fax it to 240-238-2987 or email to marketing@pmstudy.com</label>
                  <% End If %>
				</div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>
			
							

        <div id="faqPanel13_10">
          <div id="faqHeader13_10" class="collapsed">
           If the payment made by the student (B2C) is not processed initially by <% If Session("CRM_Country") <> "Germany" Then %>Google Checkout<% Else %>PayPal<% End If %>, what should be done?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel13_10" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label><% If Session("CRM_Country") <> "Germany" Then %>The student has to remit the payment again as Google Checkout will not reprocess the payment automatically.<% Else %>The student has to contact Pay Pal.<% End If %></label>
				</div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>
			

        <div id="faqPanel13_11">
          <div id="faqHeader13_11" class="collapsed">
           How can a student remit the discounted program fee?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel13_11" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				
				  <label>
				  	The payment can be made towards the course fee through <a href="http://www.pmstudy.com/payforclass.asp">http://www.pmstudy.com/payforclass.asp</a> . The back-office team will generate a revised proforma invoice reflecting the discounted course fee.Once we receive the payment the payment receipt reflecting the discounted course fee will be sent to the student.
				  </label>
				</div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>
			

        <div id="faqPanel13_12">
          <div id="faqHeader13_12" class="collapsed">
           Can the prospect pay the PMstudy course fee by means of a voucher made in favor of PMI?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel13_12" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>As PMI and PMstudy <% If Session("CRM_Country") <> "Germany" Then %>(VMEdu, Inc.)<% Else %>(Edusys Services Pvt. Ltd)<% End If%> are different entities, the prospect has to remit the payment for PMP exam training to PMstudy <% If Session("CRM_Country") <> "Germany" Then %>(VMEdu, Inc.)<% Else %>(Edusys Services Pvt. Ltd)<% End If%> and the voucher has to be made in favor of <% If Session("CRM_Country") <> "Germany" Then %>VMEdu, Inc.)<% Else %>Edusys Services Pvt. Ltd)<% End If%>.</label>
                  
				</div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>
	    
         <div id="faqPanel13_12">
          <div id="faqHeader13_12" class="collapsed">
          How do I respond to request of waiving of the rescheduling fee from students?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel13_12" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label> If students want to reschedule and the faculty recommends that we should reschedule the students for free (because of potential of bigger corporate relationships), we allow the students to reschedule for free. </label>
                  <label>For such exception requirements, please email marketing@PMstudy.com and they would be able to approve these waivers/exceptions.</label>
				</div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>			
        
        
        
         <div id="faqPanel13_12">
          <div id="faqHeader13_12" class="collapsed">
         How do I respond to a student, who wants to us to provide the early bird discount of $100, even when she is not eligible?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel13_12" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label> In case a student asks us to extend the EBD discount, and the faculty recommends that student to us, we will continue to provide the <% If Session("CRM_Country") <> "Germany" Then %>$<% Else %>&#8364;<% End If%> 100 EBD.</label>
                  <label>For such exception requirements, please email marketing@PMstudy.com and they would be able to approve these waivers/exceptions.</label>
				</div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>			
			
							
	  <script type="text/JavaScript" language="JavaScript">
		//start this accordion
		faqAccordionInit("faqContainer3");
	  </script>		
	  </div>
	  
	  <!-- Fourth tab faqs -->
	  <h3><br />Logistics:</h3>
      <div style="border-bottom: 1px solid;" id="faqContainer6" class="panel">	
	  		
		
        <div id="faqPanel16_1">
          <div id="faqHeader16_1" class="collapsed">
           When to update the logistic details in back-office?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel16_1" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>Once a program is over, the faculty has to go to the 'Logistic' tab in the back-office and update the number of study materials/ gifts that they currently have.</label>
 <label>Remember, this tab should be updated at least within 2 days after the end of a program.</label>		  
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>	
		
		 <div id="faqPanel16_2">
          <div id="faqHeader16_2" class="collapsed">
           Why is it necessary to update the logistic details in back-office?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel16_2" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>The logistic team will use this data to determine the required number of materials for each faculty. Hence, it is very important for the faculty to update the correct number of materials available with them in the logistic tab.</label>	  
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>	
	  <script type="text/JavaScript" language="JavaScript">
		//start this accordion
		faqAccordionInit("faqContainer6");
	  </script>		  
	  </div>
	  
	  <!-- Fourth tab faqs -->
	  <h3><br />PMstudy classroom training and online supplementary programs:</h3>
      <div style="border-bottom: 1px solid;" id="faqContainer4" class="panel">
        <div id="faqPanel14_1">
          <div id="faqHeader14_1" class="collapsed">
            What are benefits of making early payments?   
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_1" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>Apart from the EBD (Early Bird Discount), the two other main benefits the students can avail by making early payment are: </label>
				  <label>
				  	<ol type="a">
						<li>a) Once they pay the course fee the students get access to our online preparatory course. This is a simple 100% online preparatory course which can be completed with a few hours of study and provides contact hours/PDUs needed to apply to PMI for the PMP exam.</li>
						<li>b) PMI’s review of the PMP exam application process takes time - 1 week to 3 weeks (it takes longer if an application is selected for audit). So, if the students pay early for the PMstudy boot camp, they get the contact hours and also have enough time to apply for the PMP exam. They can also schedule their exam in such a way that they can take the exam soon after they complete the PMstudy boot camp.</li>
					</ol>
				  </label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

        <div id="faqPanel14_2">
          <div id="faqHeader14_2" class="collapsed">
            How does the faculty get to know whether online access has been provided to students (B2C) who have paid for the class?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_2" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>We send automated emails to those students (B2C) who have paid for the classroom program. These emails are also copied to the faculty who are responsible for marketing. This will help the faculty know that the students have paid the course fee and that online access has been provided to them. This will also help the faculty to contact students to clarify queries, if any.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>


        <div id="faqPanel14_3">
          <div id="faqHeader14_3" class="collapsed">
            A student’s application has been selected for audit. She wants to know whether she can schedule the exam for the 5th day of the boot camp.
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_3" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>Our advice to students to take the exam on the 5th day of the boot camp is only a recommendation. However, our money back guarantee will remain valid if the student takes the PMP exam within 30 days of taking the course. So, the student can attend the class even while the application is being audited by PMI.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>


        <div id="faqPanel14_4">
          <div id="faqHeader14_4" class="collapsed">
            Do we provide the one month access to PMstudy online course to all our students before they come for the classroom program? 
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_4" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>No. We follow a standard process. We provide access to all students to our 100% online preparatory course, as soon as we receive payment, and one month access to PMstudy online course on day 1 of the classroom program. </label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

								
        <div id="faqPanel14_5">
          <div id="faqHeader14_5" class="collapsed">
            How do you respond when students comment that the questions are repetitive? 
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_5" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>Always let them know that repetition is not bad; it is good because it reinforces their understanding of important concepts. We repeat important concepts and the questions are framed to ensure that the students really understand the concepts. Anyway, they can practice several questions from PMstudy online course, if they have time.</label>
				  <label>Please take notes about where you got stuck during the classroom training - so that you will not face similar issues in the next training.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

								
        <div id="faqPanel14_6">
          <div id="faqHeader14_6" class="collapsed">
           Do we discuss competitor study material, if a student wants to discuss it?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>This is a very important matter and we want you to be cautious about it when you teach your classes.</label>
				  <label>We will not discuss competitors study material (e.g. Rita/Kim Heldman, Joseph Heller etc.) in the PMstudy class. Let the students know in the beginning that we have a different and better way of teaching than our competitors and we do not want students to get confused with other study material.</label>
				  <label>If you try to answer the questions that were raised by that person who has studied Rita, other students must be getting left out and confused because they have not read Rita. Moreover, it gives the class a general impression that Rita is a more reliable source than PMstudy, which is not true.</label>
				  <label>So, the general rule is:  We will not discuss competitor's study material in our class. If a student is very persistent (and you are confident that you can explain competitor books like Rita/Kim/Joseph etc and you have read those books), you can take it offline and discuss those books with that student. But definitely do not discuss competitor study material in the class which will leave the whole class confused and take us away from teaching our study material.

</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

								
        <div id="faqPanel14_7">
          <div id="faqHeader14_7" class="collapsed">
           How do you deal with unnecessary student requests/ queries?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_7" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>Our objective in the class is not to make all students experts in all aspects of project management or to answer all questions asked by all students in the class, which is anyways impossible in a really big class. Our objective is to provide enough inputs to help students pass the PMP exam.</label>
				  <label>Do not deviate from the planned PMstudy study methodology because although you may be answering questions from a few students, there are others who will be getting dissatisfied and time management will become an issue. Take control of your class and if somebody is persistent, ask her to take it offline.</label>
				  <label>Faculty should stick to teaching what is there as part of the PMstudy PMP-training process (stick to the planned script). Several hundred hours of effort has gone into fine-tuning the PMstudy study method with inputs from the best experts in the industry. The method includes several examples, case studies, and questions etc. which are important for PMP exam preparation. At the same time, irrelevant information has been omitted.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

								
        <div id="faqPanel14_8">
          <div id="faqHeader14_8" class="collapsed">
           Do we need to collect the Day 3 - 52 question evaluation test document?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_8" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>Students can keep the Day 3 52 question Evaluation Test document with them - we do not collect it back.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

								
        <div id="faqPanel14_9">
          <div id="faqHeader14_9" class="collapsed">
           What are the documents for which printouts need to be taken for day 4? 
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_9" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>Following are three documents that you need to print for day 4: </label>
				  <label>
				  	<ol type="a">
						<li>a) Day 4 Answer Sheets: These answer sheets is used by students to answer the questions</li>
						<li>b) Guidelines for Day 4 Review Session: On Day 4, all students review the concepts they have learned during the past 3 days - this is a 3 hour review session which simulates the Prometric center environment. Students need to access only the workbook and chapter tests (green book) for the review.</li>
						<li>c) Feedback form: This is given at the end of the program to all the students for providing feedback.</li>
					</ol>
				  </label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

								
        <div id="faqPanel14_10">
          <div id="faqHeader14_10" class="collapsed">
           Should the student bring a hard copy of the PMBOK to the classroom?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_10" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>No - hard copy of the PMBOK is not required.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>


								
        <div id="faqPanel14_11">
          <div id="faqHeader14_11" class="collapsed">
           When students complain that some concepts mentioned in Chapter test are not found in the workbook: 
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_11" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>Inform the student that the Chapter test questions are the nearest to those appearing in the actual PMP exam and cover concepts that might not have been covered in the work book. They might get 5% - 8% questions in the PMP exam for which they do not know right answers. This is because PMstudy workbook only covers 90% of the most important concepts. So, we advise the students to use the ‘elimination techniques’ and ‘past work experience’ to handle those questions they see for the first time in the PMP exam.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

								
        <div id="faqPanel14_12">
          <div id="faqHeader14_12" class="collapsed">
           When students request the faculty to summarize concepts at the end of each chapter/class: 
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_12" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>Inform the students that instead of the faculty summarizing, it is better that the students do their own reviews. Some students may feel comfortable with certain concepts, which might be felt as difficult by some other students. Example a student who is good in mathematical concepts will be spending less time in Cost chapter. You have already been discussing the important concepts required for the exam. So, you would now like them to study and do the review on their own.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>
          <% If Session("CRM_Country") <> "Germany" Then %>
								
        <div id="faqPanel14_13">
          <div id="faqHeader14_13" class="collapsed">
           When student informs that they have smelly cap OR smelly workbook OR smelly stress-balls: 
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_13" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>You should give that student another cap OR another workbook Or another stress-ball - downplay this issue and do not allow it to blow-up. We are not using second-hand gifts/supplies or workbooks, and our supplier, Branders.com, is the leading, most successful (and one of the more expensive) branded gifts stores, patronized by almost all Fortune 500 companies.</label>
				  <label>A lot of these issues will go away if students are enjoying and learning in the class, and if you are ready to empathize. So, keep some extra supplies and study material with you for the class.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>
             <% End If %>
								
        <div id="faqPanel14_14">
          <div id="faqHeader14_14" class="collapsed">
           What do you do if you notice a student is late for the program? 
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_14" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>Just email marketing@PMstudy.com if any student comes late or if there are any other issues related to the class.</label>
				  <label>Right now, we are not taking this issue that seriously as a disqualification for our money back guarantee. However, we will just keep a note of it for now. Right now, our priority is to build our presence in the PMP-training market. </label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

								
        <div id="faqPanel14_15">
          <div id="faqHeader14_15" class="collapsed">
          How do I send the feedback received from participants after the classroom training program is completed?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_15" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  
				  <label>After each classroom training program, it is mandatory to send the feedback given by students to PMstudy. This can be done in any of the following ways: </label>
				  <label>
				  	<ol type="a">
						<li>a) Scan and send to instructors@PMstudy.com</li>
						<li>b) Fax to 240-238-2987</li>
						 <% If Session("CRM_Country") <> "Germany" Then %><li>c) Ship to our Frederick office address: <br />VMEdu, Inc.<br />4539 Metropolitan Ct.<br />Frederick, MD 21704</li><% End If %>
					</ol>
				  </label>
				  <label>Please note: The feedback will not be shared with other faculty without the permission of the instructor, who took the particular class. This is only for PMstudy’s use.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

								
        <div id="faqPanel14_16">
          <div id="faqHeader14_16" class="collapsed">
           Does PMstudy conduct CAPM classes? If yes, why it is not listed in the website?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_16" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>We do not conduct open classes for CAPM (like we do for PMP) and that is why, we do not have CAPM classroom programs listed in our website. However, we do conduct 3-day CAPM classroom programs for corporates as per their requirements. 100% money back guarantee and all the other benefits as applicable to PMP classes are also applicable to CAPM classes. </label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

								
        <div id="faqPanel14_17">
          <div id="faqHeader14_17" class="collapsed">
           What is the pricing structure for CAPM class?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_17" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				   <label>The enrollment fee would be approximately 82% of the fee applicable for the PMP classroom program. So, if we are charging <% If (Session("CountryOrigin") <> "Germany") Then %>$<% Else %>&#8364;<% End If %> 1,600 for the PMP class, we charge <% If (Session("CountryOrigin") <> "Germany") Then %>$<% Else %>&#8364;<% End If %> 1,300 for the CAPM class.</label>
				  <label>Special discounted pricing for the first 2 classes:</label>
				  <label>
				  	<!--<ol type="i">
						<li>a) 20-25* students - $1,000 per student</li>
						<li>b) 15-19 students - $1,150 per student</li>
						<li>c) 10-14 students - $1,300</li>
					</ol>-->
            <table width="100%" class="table1"  cellpadding="5" border="1">
              <tr>
                <td>Price per student</td>
                <td><b>Corporate pricing for the first 2 classes <br>
                  (Evaluation pricing - onsite/in PMstudy facility)</b></td>
                <td><b>Final Corporate pricing <br>
                  (Onsite in company)</b></td>
                <td><b>Final Corporate pricing <br>
                  (Facility by PMstudy)</b></td>
              </tr>
               <% If (Session("CountryOrigin") <> "Germany") Then %>
              <tr>
                <td>Less than 5 students </td>
                <td>&nbsp; </td>
                <td> $ 1,450 *</td>
                <td> $ 1,550 *</td>
              </tr>
              <tr>
                <td>5 - 9 students</td>
                <td>&nbsp; </td>
                <td> $ 1,400 *</td>
                <td> $ 1,500 *</td>
              </tr>
              <tr>
                <td>10 - 14 students</td>
                <td> $ 1,250</td>
                <td> $ 1,300 </td>
                <td> $ 1,400 </td>
              </tr>
              <tr>
                <td>15 - 19 students</td>
                <td> $ 1,150 </td>
                <td> $ 1,200 </td>
                <td> $ 1,300 </td>
              </tr>
              <tr>
                <td>20 - 25 students</td>
                <td> $ 1,000</td>
                <td> $ 1,100 </td>
                <td> $ 1,200 </td>
              </tr>
              <% Else %>
               <tr>
                <td>Less than 5 students </td>
                <td>&nbsp; </td>
                <td>&#8364; 1,500 *</td>
                <td> &#8364; 1,650 *</td>
              </tr>
              <tr>
                <td>5 - 9 students</td>
                <td>&nbsp; </td>
                <td> &#8364; 1,450 *</td>
                <td> &#8364; 1,600 *</td>
              </tr>
              <tr>
                <td>10 - 14 students</td>
                <td> &#8364; 1,250</td>
                <td> &#8364; 1,350 </td>
                <td> &#8364; 1,500 </td>
              </tr>
              <tr>
                <td>15 - 19 students</td>
                <td> &#8364; 1,200 </td>
                <td> &#8364; 1,300 </td>
                <td> &#8364; 1,450 </td>
              </tr>
              <tr>
                <td>20 - 25 students</td>
                <td> &#8364; 1,100</td>
                <td> &#8364; 1,200 </td>
                <td> &#8364; 1,350 </td>
              </tr>
              <% End If %>
               
            </table>
             <BR>
            <BR>
            *:  Classes may not always be feasible and approval is required before confirming to the client. Please email marketing@PMstudy.com and t_satpathy@pmstudy.com for approval. <BR>
            <BR>
            Please note: Additional discounts would be available for larger corporates. Please email marketing@PMstudy.com and t_satpathy@pmstudy.com for additional discounts.<BR>                    
				  </label>
				  <label><br />*Maximum 25 students per class</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>


								
        <div id="faqPanel14_18">
          <div id="faqHeader14_18" class="collapsed">
           What is the faculty remuneration for a CAPM class?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_18" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>The faculty remuneration for a CAPM class would be 80% of the fees applicable for the PMP classes; this is because the CAPM class duration is 3 days where as it is 4 days for PMP class.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>


								
        <div id="faqPanel14_19">
          <div id="faqHeader14_19" class="collapsed">
           Do we conduct weekend classes?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_19" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>We can conduct weekend corporate classes, if required, provided we have a faculty who is willing to teach during weekends.</label>
				  <label>For the B2C classes, we should stick to the classes on weekdays for the time being as this is the industry standard. But we are flexible with corporate classes.   </label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

								
								
        <div id="faqPanel14_20">
          <div id="faqHeader14_20" class="collapsed">
           Prior to the commencement of the classroom training, do we have to send emails to the students?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_20" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>Three emails are sent out to the students before the commencement of the class: </label>
				  <label>
				  	<ol>
						<li>1) An introductory email which is sent within 12 hours of receipt of payment from a student. It provides access details for our online preparatory course.</li>
						<li>2) An email that is sent 1 week prior to the class providing the location details.
</li>
						<li>3) A personalized email from the faculty to the students informing them that they would be teaching the class. This is optional.</li>
					</ol>
				  </label>
				  <label>Please note: If anyone inquires about classroom training locations etc. before receiving our email, you could ask them to check our website for details.</label>
				  <label>In addition to the above, the following 2 emails go out to students:</label>
				  <label>
				  	<ol type="a">
						<li>a) Enrollment email (Invoice)</li>
						<li>b) Payment receipt email</li>
					</ol>
				  </label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>


  <div id="faqPanel14_21">
          <div id="faqHeader14_21" class="collapsed">
           Is it possible for our failed student to retake our course?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_20" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>As a practice, we would not like our past students to attend existing classes. You could inform the student that he/she already knows all the concepts required from the classroom training. So, attending another class would not be very helpful.</label>
				  <label>
				  	Please ask the student to take the PMstudy online course (maybe for 1 or 2 months to practice more questions), and buy a few additional books on PMP-Prep to work on more questions. That would be good preparation for the exam.
				  </label>
			  </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

  <div id="faqPanel14_21">
          <div id="faqHeader14_21" class="collapsed">
          How can a student pay for the rescheduling / cancellation / any discounted course fee to PMstudy?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel14_20" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>Student can pay the rescheduling / cancellation / any discounted course fee to PMstudy by using the link: <a href="/payforclass.asp" target="_blank">www.PMstudy.com/payforclass.asp</a>
				  </label>
			  </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>
        							
	  <script type="text/JavaScript" language="JavaScript">
		//start this accordion
		faqAccordionInit("faqContainer4");
	  </script>		
	  </div>
	  
								
	  <!-- Fourth tab faqs -->
	  <h3><br />Miscellaneous:</h3>
      <div style="border-bottom: 1px solid;" id="faqContainer5" class="panel">								
        <div id="faqPanel15_1">
          <div id="faqHeader15_1" class="collapsed">
           How can we assure a prospective student that we are indeed recognized as a REP by PMI?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel15_1" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>We have this information in our ‘About us’ page - <a href="http://www.pmstudy.com/aboutus.asp" target="_blank">www.pmstudy.com/aboutus.asp</a>. We have the "REP Code Number" and also a phone number for the students to call up PMI and verify.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

        <div id="faqPanel15_2">
          <div id="faqHeader15_2" class="collapsed">
           Do we provide money back guarantee for online PMP/CAPM courses? 
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel15_2" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>We provide money back guarantee only for the PMP/CAPM online course which is of 6 months duration. </label>
				  <label>We do not provide any money back guarantee for the rest of PMP/ CAPM online courses. </label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

        <div id="faqPanel15_3">
          <div id="faqHeader15_3" class="collapsed">
           How do we deal with requests from students regarding our online courses?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel15_3" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>If the query is regarding login or password issues, just email the request to our back office team at adminsupport@pmstudy.com - they will take care of online queries.</label>
				  <label>However, if the students have any queries about online course, try to convert the prospect to attend our classroom program. If they are not willing to join classroom course, please request them to email to adminsupport@pmstudy.com.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>


        <div id="faqPanel15_4">
          <div id="faqHeader15_4" class="collapsed">
           I tried to log in to my PMstudy Google group account and it says I am not a member?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel15_4" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>Please retry after some time. Make sure that you use proper membership account only. If the problem persists, send a mail to instructors@pmstudy.com / marketing@pmstudy.com</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

				
        <div id="faqPanel15_5">
          <div id="faqHeader15_5" class="collapsed">
           How do I change the email id, phone number and address for receiving e-mails, calls and documents respectively?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel15_5" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>Send a mail to instructors@pmstudy.com with the details. We would make the changes as soon as possible.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

				
        <div id="faqPanel15_6">
          <div id="faqHeader15_6" class="collapsed">
          How PMP certified professionals get PDUs to maintain their certification?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel15_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>If PMP certified professionals want PDUs after PMP certification to maintain their certification, then they have the option to take 100% online courses offered by PMstudy and its associates (Details: www.PMstudy.com/enroll.asp ). Other than the PDUs, the courses also provide certifications in Six Sigma, Human Resource Development, Program Management, etc.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

				
				
        <div id="faqPanel15_7">
          <div id="faqHeader15_7" class="collapsed">
          How can a prospect enroll?
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel15_7" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>There are two options:</label>
				  <label>
				  	<ol>
						<li>a) Ask the prospect to go to <a href="http://www.pmstudy.com/enrollclass.asp" target="_blank">www.pmstudy.com/enrollclass.asp</a> - and enroll. After enrollment, the prospect makes the payment. The details of the enrolled prospect will be emailed to you. </li>
						<li>b) If you know the prospect’s name, email address and phone number, you can do the following:
							<ul>
								<li>- Log in to your account in <a href="http://www.pmstudy.com/usbackoffice/login.asp" target="_blank">http://www.pmstudy.com/usbackoffice/login.asp</a></li>
								<li>- Click on ‘Marketing B2C’</li>
								<li>- Click on ‘Add New Enrollment’ and add the details of the prospect. An automated email will be sent to the prospect and a copy will be marked to you with enrollment details. The email will also have information about how payment can be remitted.</li>
							</ul>
						</li>
					</ol>
				  </label>
				  <label>You can then go to US back office and enter your comments against this enrollment, so, we can track this enrollment.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

        <div id="faqPanel15_8">
          <div id="faqHeader15_8" class="collapsed">
          Details regarding CAPM course
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel15_8" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>The CAPM stands for Certified Associate in Project Management and is one level down from the PMP.  PMI doesn’t refer to it as that nor does any other trainer, but it is intended for people just starting out in project management who probably don’t have the experience and/or education to qualify for the PMP.  The CAPM certification is a 3-hour exam as compared to the 4-hour exam of the PMP.</label>
				  <label>As for the courses, they are based on the PMBOK just like the PMP training, so PMBOK is the official reference book for project management.  The CAPM tends to focus more attention on definitions, formulas, network diagrams and stuff like that while the PMP gets into more situational exam questions.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

        <div id="faqPanel15_9">
          <div id="faqHeader15_9" class="collapsed">
          One of the prospects could not view the PMstudy’s  <% If Session("CRM_Country") <> "Germany" Then %>US<% Else %>Germany<% End If %> boot camp training details:
          </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel15_9" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
				  <label>PMstudy website looks different in different countries. We have a web service which tracks from which country the person is accessing the website and then show the website that is relevant to them - something similar to what Google does. So if the person is not in <% If Session("CRM_Country") <> "Germany" Then %>US<% Else %>Germany<% End If %> but would like to view the <% If Session("CRM_Country") <> "Germany" Then %>US<% Else %>Germany<% End If %> boot camp details, please advise the person to refer to the link - <% If Session("CRM_Country") <> "Germany" Then %><a href="http://www.pmstudy.com/indexus.asp" target="_blank">www.PMstudy.com/indexus.asp</a><% Else %><a href="http://www.PMstudy.com/indexger.asp" target="_blank">www.PMstudy.com/indexger.asp</a>><% End If %>.</label>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
		</div>

												
												
				
				
											
	  <script type="text/JavaScript" language="JavaScript">
		//start this accordion
		faqAccordionInit("faqContainer5");
	  </script>		
	  </div>

	  
	</div>	  		  
   </div>

        <!-- FAQs end here -->
		</fieldset>
      </div>
      <!-- // #main -->
      <div class="clear"></div>
    </div>
    <!-- // #container -->
  </div>
  <!-- // #containerHolder -->
  <p id="footer">&nbsp;</p>
</div>
<!-- // #wrapper -->
</body>
</html>
<% End If %>