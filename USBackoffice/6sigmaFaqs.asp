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
<title>6sigma FAQs</title>
<!-- CSS -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/faqs.css">
<!--[if IE 6]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie6.css" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie7.css" /><![endif]-->
<!-- JavaScripts-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jNice.js"></script>
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
      <h2><a href="home.asp">Home</a> &raquo; <a href="fin.asp" class="active">6sigma FAQs</a></h2>
      <div id="main">
        <h3>6sigma FAQs</h3>
        <fieldset>
        <!-- FAQs start here -->
        <div id="outerFormContainer">
        <div id="mainContent" class="faqGroup">
        <h3></h3>
        <div style="border-bottom: 1px solid;" id="faqContainer1" class="panel">
        <div id="faqPanel1_1">
          <div id="faqHeader1_1" class="collapsed"> Do you provide any online study material that can be downloaded & printed for reading at leisure or whether the material can only be read online? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_1" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> The courses offered by 6sigmastudy.com are 100 %  online & self paced and can be taken from anywhere in the world, as long as the students have access to internet. All the study materials (i.e. Guides, Chapter Tests, and Case Studies) are available on the website and access to the same is provided, within 6 hours of enrollment after receipt of payment for the selected course.  You will be able to download the study guides for your offline reference. <br />
                  <br />
                  Note: As of now, we do not conduct any class room training/web based virtual classes and no hard copy/CD of study materials will be sent to the candidate. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_2">
          <div id="faqHeader1_2" class="collapsed"> Is it necessary to be a Six Sigma Green Belt certified before taking  the Black Belt course or can I directly enroll for the Black Belt course? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_2" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> Yes, it is mandatory that you have to be a Six Sigma Green Belt before enrolling for the Black Belt course. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_3">
          <div id="faqHeader1_3" class="collapsed"> Does Green Belt/Black Belt have a certification validity period?  If so, how many years? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_3" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> The 'Six Sigma Green/Black Belt Certificates' issued by 6sigmastudy.com is a one-time certification. You do not have to renew it. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_4">
          <div id="faqHeader1_4" class="collapsed"> Can you provide me a telephone number where I can reach you? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_4" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> The best way to contact us is through email -adminsupport@6sigmastudy.com. So, we request you  to email your detailed query. We will respond to it immediately on                receipt of the same. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_5">
          <div id="faqHeader1_5" class="collapsed"> When will  I get the certificate - both physical and soft copy versions- after completion of the course? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_5" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> The online certificate will be sent to the student within 5 days of completing the course.  However, the physical certificate will be sent to the student's mailing address within 7 weeks of completing the course. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_6">
          <div id="faqHeader1_6" class="collapsed"> Does the Six Sigma Black course syllabus include the Green Belt course syllabus also? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> The Six Sigma Black Belt course syllabus is different from the Green Belt course syllabus.  Some of the topics covered in the Green Belt course are elaborated with examples and  some new concepts and tools and techniques are included (e.g. Correlation & Regression Analysis) in the Black Belt course. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_7">
          <div id="faqHeader1_7" class="collapsed"> What are the Bulk/Corporate discounts for the Six Sigma courses offered by 6sigmastudy.com? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> Bulk/Corporate discounts are available if more than 3 persons join 6sigmastudy.com course together. For details, please email us at adminsupport@6sigmastudy.com. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_8">
          <div id="faqHeader1_8" class="collapsed"> What are the eligibility criteria for taking up the  Six Sigma Black Belt Course? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> It is mandatory to be Six Sigma Green Belt certified for taking the Black Belt course. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_9">
          <div id="faqHeader1_9" class="collapsed"> Will there be a faculty assigned to me to clarify my doubts? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> There will  be no faculty assigned to a student. If you have any queries, you can please email adminsupport@6sigmastudy.com. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_10">
          <div id="faqHeader1_10" class="collapsed"> Can I complete the course before the prescribed period? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> Yes, you can. <br />
                  <br />
                  The prescribed period should be sufficient to complete the course. In case you need to extend the course, you can do so by paying a nominal fee. The course extension fee is $60/month. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_11">
          <div id="faqHeader1_11" class="collapsed"> As an former student,  if I enroll for a Six Sigma course, am I entitled to any discounts on the course fee? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> If you are a former student, please email adminsupport@6sigmastudy.com for details. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_12">
          <div id="faqHeader1_12" class="collapsed"> Since I cannot use my credit card, what alternative methods are available for making the payment? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> If you cannot make payment using your credit card, please email  adminsupport@6sigmastudy.com and we will advise you on alternative methods for making payment. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_13">
          <div id="faqHeader1_13" class="collapsed"> Will any assistance, including technical assistance, be provided if I have any query or need clarification? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> Yes. You can contact us by filling the contact us/feedback form at http://6sigmastudy.com/contactus.asp.
                  Also, you can e-mail  adminsupport@6sigmastudy.com for any query. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_14">
          <div id="faqHeader1_14" class="collapsed"> Shall I get any discount, if I register for two or more  of your online courses? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> Yes. For details, email adminsupport@6sigmastudy.com </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_15">
          <div id="faqHeader1_15" class="collapsed"> Is there any limit in the number of attempts I can take before passing the evaluation test after each chapter? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> Yes. You can take the evaluation test any number of times till you pass.
                  For Black Belt / Lean Black Belt courses, there are chapter tests that you can practice as many times as you want. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_16">
          <div id="faqHeader1_16" class="collapsed"> Will I definitely get 25 PDUs after completing the Green Belt course? Are there any hidden clauses? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> You will be awarded with 25 PDUs on successfully completing the Green Belt certification course. There are no hidden clauses. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_17">
          <div id="faqHeader1_17" class="collapsed"> What is your office address? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> Our office address is 4539 Metropolitan Ct, Frederick, MD 21704. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_18">
          <div id="faqHeader1_18" class="collapsed"> Can I make payment for the course using a US bank debit
            card? I do not have a credit card. </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> Please note that we accept payments through credit card. However, If you do not have a credit card or cannot use your credit card for making payment, and in case you wish to use the credit card of a colleague, friend or relative, then, email adminsupport@6sigmastudy.com with the payment details and your personal information (name, address, and preferred email address for correspondence). We will set-up an account to reflect your personal details, so that you can take the course in your name. We would be able to provide you access to the course as soon as we receive the payment. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_19">
          <div id="faqHeader1_19" class="collapsed"> There may be a change in my address from the US to the UK within the next two months. In such a case, can you send the certificate to my address in the UK, given the fact that I originally registered with my US address at the time of enrollment? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> Normally, the certificate (hard copy) will be mailed to the address registered at the time of enrolling for the course. However, in some special cases, upon prior request, we can send it to the new address as well. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_20">
          <div id="faqHeader1_20" class="collapsed"> Does the certificate issued by 6Sigmastudy.com enjoy recognition by industry  and organizations like ASQ? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> The course has been approved by PMI and HRCI for the purpose of award of PDUs. However, our course material is aligned to ASQ Body of Knowledge. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_21">
          <div id="faqHeader1_21" class="collapsed"> Will I be eligible to take the Black Belt certification course from ASQ, on completing the Six Sigma Green Belt certificate course from 6sigmastudy.com? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> Yes. You can go for Black Belt Certification from any other provider after completing the Green Belt course from 6sigmastudy.com, subject to fulfillment of the concerned provider's rules and regulations. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_22">
          <div id="faqHeader1_22" class="collapsed"> Is your training format fully online? Can I log in anytime to read study material online or to take the tests etc online? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> Yes. The courses offered by 6sigmastudy.com are 100 %  online and you can login at any time. All the study materials (i.e. Guides, Chapter Tests, and Case Studies) are available on the website and access to the same is provided, within 6 hours of enrollment after receipt of payment for the selected course.  You will be able to download the study guides for your offline reference. However, the test has to be taken online only. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_23">
          <div id="faqHeader1_23" class="collapsed"> Is submission of project work mandatory for obtaining Green Belt/ Black Belt certifications from 6sigmastudy.com? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> No. It is not mandatory. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_24">
          <div id="faqHeader1_24" class="collapsed"> For how many months do I have access to 6Sigma course? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> You will get access for 3 months for the Green Belt course and for 6 months for the Black Belt/ Lean Black Belt course. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_25">
          <div id="faqHeader1_25" class="collapsed"> Are there any additional charges over and above the stipulated course fee for receiving the physical certificate? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> No. There are no additional charges. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_26">
          <div id="faqHeader1_26" class="collapsed"> Do you provide any names of successful candidates as reference? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> Yes. For more information, please click <a href="http://6sigmastudy.com/reference.asp" target="_blank">http://6sigmastudy.com/reference.asp</a>. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_27">
          <div id="faqHeader1_27" class="collapsed"> Is there any prerequisite for taking the Six Sigma Green Belt certification course? Do you have any branch in Toronto, Canada or authorized representative to whom I can talk? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> There are no prerequisites for taking our Green Belt certification course. Our Six Sigma course is completely online. <br />
                  <br />
                  The best way to contact us is through email -adminsupport@6sigmastudy.com. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_28">
          <div id="faqHeader1_28" class="collapsed"> What is the eligibility criterion for taking the Lean Six Sigma Black Belt certification course? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> You have to be Green Belt certified to take our Lean Six Sigma Black Belt certification course.  To enroll for our Green Belt certification course, please refer to <a href="http://wwww.6sigmastudy.com/enroll.asp" target="_blank">http://www.6sigmastudy.com/enroll.asp</a> </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_29">
          <div id="faqHeader1_29" class="collapsed"> What is the difference between the Black Belt and the Lean Black Belt course? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> The Lean Six Sigma Black Belt certification is an advanced certification course that comprises Lean and Six Sigma Black Belt concepts. </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_30">
          <div id="faqHeader1_30" class="collapsed"> What details do I require to register the PDUs with PMI? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer">
                  <ul type="1">
                    <li>1. For Green Belt:</li>
                  </ul>
                  <br />
                  <ul>
                    Name of Institute : VMedu Inc.
                  </ul>
                  <ul>
                    Provider Number : 2053
                  </ul>
                  <ul>
                    Activity Number: PM6SIGMA
                  </ul>
                  <ul>
                    Activity Name: Six Sigma Green Belt
                  </ul>
                  <br />
                  <br />
                  <ul type="2">
                    <li>2. For Lean Black Belt/Black Belt:</li>
                  </ul>
                  <br />
                  <ul>
                    Name of Institute : VMedu Inc.
                  </ul>
                  <ul>
                    Provider Number : 2053
                  </ul>
                  <ul>
                    Activity Number: PMSSBB
                  </ul>
                  <ul>
                    Activity Name: Six Sigma Black Belt
                  </ul>
                </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_31">
          <div id="faqHeader1_31" class="collapsed"> Do I have to appear for any examination/ test at the end of completion of the course to get Green Belt/ Black Belt/ Lean Black Belt certified? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> Yes. You will have to take a test after studying each chapter. <br />
                  <br />
                  For Green Belt: Click <a href="http://6sigmastudy.com/Green_Belt/GBCourseContent.asp" target="_blank">http://6sigmastudy.com/Green_Belt/GBCourseContent.asp</a> <br />
                  <br />
                  For Black Belt: Click <a href="http://6sigmastudy.com/Black_Belt/BBCourseContent.asp" target="_blank">http://6sigmastudy.com/Black_Belt/BBCourseContent.asp</a> <br />
                  <br />
                  For Lean Black Belt: Click <a href="http://6sigmastudy.com/LeanBlack_Belt/LBBCourseContent.asp" target="_blank">http://6sigmastudy.com/LeanBlack_Belt/LBBCourseContent.asp</a> </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_32">
          <div id="faqHeader1_32" class="collapsed"> I am Six Sigma Yellow Belt certified. Am I eligible to take the Lean Six Sigma Black Belt course? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> No. You have to be Green Belt certified to take our Lean Six Sigma Black Belt certification course.  To enroll for our Green Belt certification course, please refer to <a href="http://wwww.6sigmastudy.com/enroll.asp" target="_blank">http://www.6sigmastudy.com/enroll.asp</a> </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_33">
          <div id="faqHeader1_33" class="collapsed"> On completing your course, do I get a course completion certificate or do I become Six Sigma  Green Belt/ Black Belt and Lean Black Belt Professional certified? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> You will be awarded 3 certificates: <br />
                  <br />
                  <ul type="1">
                    <li>1. The  Six Sigma  Green Belt/ Black Belt and Lean Black Belt Professional certificate</li><br />
                    <li>2. The PMI approved PDUs  certificate</li><br />
                    <li>3. HRCI approved Recertification Credit Hours  certificate </li>
                  </ul>
                  <br />
                  <br />
                  For details, click <a href="http://6sigmastudy.com/whyus/getcertified.asp" target="_blank">http://6sigmastudy.com/whyus/getcertified.asp</a> </div>
              </div>
              <div class="outerFAQContainerBottom">&nbsp;</div>
            </div>
          </div>
        </div>
        <div id="faqPanel1_34">
        <div id="faqHeader1_34" class="collapsed"> I have enrolled for the Six Sigma Lean Black Belt online course. I want to know: a) What is the passing score?  b) How do I get the Black Belt/Lean Black Belt certificate? c) What is the criterion for obtaining the 55 PMI PDUs?" </div>
        <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
        <div class="faqItemContent">
        <div class="outerFAQContainer">
        <div class="innerFAQContainer">
        <ul>
        <li>a) The passing score is 80% for each evaluation test.</li>
        <br />
        <br />
        <li>b) You have to pass the evaluation tests for all the chapters as well as the case studies to earn the Black Belt/Lean Black Belt certificate. If you have opted for an online certificate, you will receive the certificate by email within 5 days. If  you have opted for a physical certificate,  the certificate will be mailed to your mailing address within 7 weeks of passing the exam. </li>
        <br />
        <br />
        <li>c) 55 PDUs will be awarded after successful completion of the course.</li>
        </div>
        </div>
        <div class="outerFAQContainerBottom">&nbsp;</div>
        </div>
        </div>
        </div>
        <div id="faqPanel1_35">
          <div id="faqHeader1_35" class="collapsed"> Does your course material include podcasts or only PowerPoint files? </div>
          <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_6" class="answer">
            <div class="faqItemContent">
              <div class="outerFAQContainer">
                <div class="innerFAQContainer"> Our study materials include podcasts and study guides in pdf format. </div>
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
