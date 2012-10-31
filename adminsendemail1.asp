<html>
<head>
<TITLE>ITILstudy.com</TITLE>
<META http-equiv=Content-type content="text/html; charset=ISO-8859-1">
<META
content="PROJstudy.com offers Online Economical, Effective, Guides on Different Knowledge Areas"
name=description>
<META
content="PROJstudy.com offers Online Economical, Effective, Guides on Different Knowledge Areas"
name=keywords>
</head>
<body>
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/connection_global.asp"-->



<%

Dim Conn, Array, KNo, QuesNo, Ans, payer_email, MailID, subject, body, first_name, last_name, feedback, Location, FromDate, ToDate, feedback1, OneMonthCourse
payer_email=Request.Form("payer_email")
pass="pyramids"
first_name=Request.Form("first_name")
last_name=Request.Form("last_name")
payer_email=Request.Form("payer_email")
MailID=Request.Form("MailID")
feedback1=Request.Form("feedback")
feedback=Replace(feedback1,"'", "''")
body=Request.Form("body")
subject=Request.Form("subject")
submitvalue=Request.Form("submitvalue")
attachvalue=Request.Form("attachvalue")
companyref=Request.Form("companyref")
company=Request.Form("company")
Location=Request.Form("location")
FromDate=Request.Form("fromDate")
ToDate=Request.Form("toDate")
OneMonthCourse = Request.Form("onemonthcourse")

Set objRs = server.CreateObject("ADODB.recordset")

If request.Form("country") <> "" Then
country = request.Form("country")
Else 
country = Session("CRM_Country")
End If

If country = "India" Then 
country = 3
ElseIF country = "US" Then 
country = 2
ElseIF country = "Other" Then
country = 1
End If

'response.Write(country)

'for usbackoffice we are taking this static value
rqUSBackoffice = Request.Form("USBackoffice")
rqCallId = Request.Form("callId")

'USBUserId=Session("USBUserId")

rqBackofficeEmailID = Request.Form("BackofficeEmailID")



%>
<%=attachvalue%>
<%
Response.Write("<br>"& OneMonthCourse & "<br>")

If(Submitvalue="Initialize") Then

			
				body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""10px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td  bgcolor=""#FFFFFF"">" 
						Select Case country
						Case 1
						body= body & "<span><img src=""http://www.PROJstudy.com/images/banners/email_header.jpg"" alt=""PROJstudy"" /></span>" 
						Case 2
						body= body &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerUK.jpg"" alt=""PROJstudy"" /></span>"
						Case 3
						body= body &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerIN.jpg"" alt=""PROJstudy"" /></span>"
						Case 4
						body= body &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerAUS.jpg"" alt=""PROJstudy"" /></span>"
						End select
						body= body &"</td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "&first_name&" "&last_name&",<BR><BR>Greetings from <a href=""http://www.PROJstudy.com/"" target=""_blank"">PROJstudy.com!</a><BR><BR>"
				
				regards = "<br /><br />Best Regards,<br />Customer Support<br><a href=""http://www.ITILstudy.com"" target=""_blank"">www.ITILstudy.com</a><br />Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a><br /><br/><hr><div align=""center"">><font size=""1px"">ITIL<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.<br>The Swirl logo™ is a trade mark of the Cabinet Office.</font></div><br />"
				
				If feedback <> "" Then
				ques = "<b>Feedback from "&first_name&" "&last_name&":</b><BR><BR>"&feedback
				End If
				
				Select Case MailID
				
				Case 1
						subject = "PROJstudy PRINCE2 classroom training information"
						body = body & "We thank you for the < method of contact, e.g. email, call >. We are happy to know that you are interested in pursuing PRINCE2<sup>&reg;</sup> certification with PROJstudy.<br><br><b>About Us:</b> PROJstudy is recognized by APMG, UK as an Accredited Training Organization (ATO) and is a brand of Edusys Services Pvt. Limited. We are the most successful and most popular project management training provider globally. We have trained more than 25,000 successful project managers for various project management courses including PRINCE2<sup>&reg;</sup>, PMP, CAPM etc. We have a presence globally in over 160+ countries with delegates from over 3500 companies. We are well known for our exceptionally high quality training programs which are available at attractive prices. <a href=""http://www.projstudy.com/PRINCE2-Training/exam-success.asp"" target=""_blank"">More</a><br><br><b>Course details:</b>  We have a comprehensive suite of courses which are designed for the specific requirements of different types of delegates. The Foundation course is meant for early starters in PRINCE2 while the Practitioner course is focussed on advanced concepts required by PRINCE2 practitioners. Our courses can be taken either purely online, purely classroom or a combination of classroom and online training.<br><br><b>Course duration and prices:</b> Our < Foundation / Practitioner / Foundation & Practitioner> Classroom programs consists of <2/3/5> days of training. The course fee is <£349/ 399/ 649> respectively.  We provide a discount of £50 to delegates who enrol more than 15 days prior to commencement of the program. <a href=""http://www.projstudy.com/course-syllabus.asp"" target=""_blank"">More</a><br><br><b>Online access:</b> On receipt of your payment towards PROJstudy PRINCE2 classroom training program, we will provide you with access to our online pre-course work. The pre-course work is simple and will provide you the required understanding of the PRINCE2 principles and concepts.<br><br><b>Dates and Location:</b> We conduct several classroom training programs in different locations across United Kingdom. <a href=""http://www.projstudy.com/PRINCE2-Courses.asp"" target=""_blank"">More</a><br><br>For information about the course content, visit <a href=""http://www.projstudy.com/course-syllabus.asp"" target=""_blank"">http://www.projstudy.com/course-syllabus.asp</a><br><br>To know more about the benefits of our classroom course, please follow the link: <a href=""http://www.projstudy.com/PRINCE2-Training/courseBenefits.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/courseBenefits.asp</a><br><br><b>Unique Exam Retake Guarantee:</b> Our high quality study materials, the expertise of our faculty and the best-in-industry course delivery methodology are all designed to enable the delegate pass the PRINCE2 exam in the first attempt. But in the rare event of a delegate not passing, the delegate may retake the exam at no extra cost. Students will also be provided with access to an online course (valued up to £125) that would help them prepare for their next attempt. <a href=""http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp"" target=""_blank"">More</a><br><br><b>Complimentary 6Sigma Green Belt access:</b> 3-month complimentary access to 6Sigma Green Belt course worth £175. <a href=""http://www.projstudy.com/PRINCE2-Training/free-onlinecertification.asp"" target=""_blank"">More</a><br><br><b>Enrolment:</b> Students can enrol for <3-day Foundation/ 2-day Practitioner/ 5-day Foundation & Practitioner> classroom course. To enrol with us, visit <a href=""http://www.projstudy.com/enrolclass.asp"" target=""_blank"">www.PROJstudy.com/enrolclass.asp</a><br><br><b>Payment:</b> To make the payment towards course fees please click on the link <a href=""http://www.projstudy.com/payforclass.asp"" target=""_blank"">http://www.PROJstudy.com/payforclass.asp</a><br><br>For answers to the list of frequently asked questions, we request you to click - <a href=""http://www.projstudy.com/PRINCE2-Training/Faqs.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/Faqs.asp</a><br><br>For any further clarification or additional information please email us at <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com</a><br><br>We look forward to having you as our delegate.<br><br>"&regards
						
						Case 2
						subject = "Benefits of attending PROJstudy PRINCE2 classroom program"
						body = body & "We thank you for the < method of contact, e.g. email, call >. We are happy to know that you are interested in pursuing PRINCE2<sup>&reg;</sup> certification with PROJstudy.<br><br>Given below are a few compelling reasons why you should choose PROJstudy as your partner for the PRINCE2 certification.<ul><li><b>Best faculty:</b> PROJstudy has project management trainers who are APMG Accredited and are the best in the industry. Each has extensive industry / project management experience in diverse fields such as IT, finance, consultancy services, etc. <a href=""http://www.projstudy.com/instructors.asp"" target=""_blank"">More</a></li><li><b>Scientifically designed effective and result-oriented instruction method:</b> PROJstudy PRINCE2 classroom course has been developed, assessed, and evaluated by several PRINCE2 certified project management experts, and approved by APMG. Several interactive methods such as experiential learning, small groups, hands-on practice, repetition, trainee panels, periodic evaluation and case studies are extensively used. <a href=""http://www.projstudy.com/freeresources/chapterTest.asp"" target=""_blank"">More</a></li><li><b>Unique Exam Retake Guarantee policy:</b> The delegate is guaranteed to pass the PRINCE2 certification exam. But in a rare case of the delegate not passing, the delegate will be allowed to re-take the exam at no extra cost. <a href=""http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp"" target=""_blank"">More</a></li><li><b>Best value for money:</b> Fee for PROJstudy PRINCE2 Foundation and Practitioner 5-day classroom training can be as low as £599 only per delegate <a href=""http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp"" target=""_blank"">More</a></li><li><b>£50 early bird discount:</b> We offer £50 early bird discount if enrolment is done 15 days prior to the course commencement date. <a href=""http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp"" target=""_blank"">More</a></li><li><b>Excellent training environment:</b> Our classroom training is normally conducted at premium meeting centers / hotels at convenient locations with all the required study aids. Snacks and coffee / tea are provided during the classroom program.</li><li><b>Free 1 month access to PROJstudy pre-course study material:</b> We offer the delegates one month access to PROJstudy's pre-course study material.</li><li>Completely free and complimentary access to <b>Six Sigma Green Belt online certificate course for three months</b>, offered by <a href=""http://www.6sigmastudy.com/""/>www.6sigmastudy.com</a>, worth £175. Trusted by 1175 companies across 63 countries, this course will not only help you understand and apply the concepts of Six Sigma in your workplace but also will offer you 25 PMI PDUs which can be used for continuing education requirements. <a href=""http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp"" target=""_blank"">More</a></li><li><b>PMI Approved PDUs:</b> PROJstudy provides 45 PDUs with PRINCE2 Foundation and Practitioner Certification courses. These are valid PDUs for continuing education requirements in maintaining PMP Certification Status. <a href=""http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp"" target=""_blank"">More</a></li></ul><br>To know more about the benefits of PROJstudy PRINCE2 classroom program, please follow the link <a href=""http://www.projstudy.com/PRINCE2-Training/courseBenefits.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/courseBenefits.asp</a><br><br>To enrol with us, visit <a href=""http://www.projstudy.com/enrolClass.asp"" target=""_blank"">http://www.projstudy.com/enrolClass.asp</a><br><br>Your access to our preparatory course will be activated only after we receive your payment for the program fee. To make your payment, follow the link <a href=""http://www.projstudy.com/payforclass.asp"" target=""_blank"">www.projstudy.com/payforclass.asp</a><br><br>For answers to the list of frequently asked questions, we request you to click <a href=""http://www.projstudy.com/PRINCE2-Training/Faqs.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/Faqs.asp</a><br><br>For any queries, please email <a href=""mailto:marketing@projstudy.com."" target=""_blank"">marketing@projstudy.com.</a><br><br>We look forward to having you as our delegate.<br><br>"&regards
						
						Case 3
						subject = "PROJstudy: PRINCE2 eligibility criteria"
						body = body & "We thank you for the < method of contact, e.g. email, call > asking for eligibility criteria for PRINCE2<sup>&reg;</sup> courses.<BR><BR>The eligibility criteria are given below:<ul><li><b>PRINCE2 Foundation course:</b> There is no pre-requisite (eligibility criteria) for taking the PRINCE2 Foundation course but, general Project Management training is ideal.</li><li><b>PRINCE2 Practitioner course:</b> Students should pass the PRINCE2 Foundation exam before they can take the PRINCE2 Practitioner exam.</li></ul><br>Now that you know about the eligibility criteria for PRINCE2, you might want to know more about PROJstudy. PROJstudy is recognized by APMG, UK as an Accredited Training Organization (ATO) and is a brand of Edusys Services Pvt. Limited. We are the most successful and most popular globally. We have trained more than 25,000 successful project managers for various project management courses including PRINCE2, PMP, CAPM etc. in over 160 countries. We are well known for our exceptionally high quality training programs which are available at attractive prices. <a href=""http://www.projstudy.com/PRINCE2-Training/exam-success.asp"" target=""_blank"">More</a><br><br>For details regarding the upcoming classroom training sessions in various locations, please <a href=""http://www.projstudy.com/PRINCE2-Courses.asp"" target=""_blank"">click here</a><br><br>For answers to the list of frequently asked questions, we request you to click <a href=""http://www.projstudy.com/PRINCE2-Training/Faqs.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/Faqs.asp</a><BR> "&regards
						
						Case 4
						subject = "PROJstudy – Why Us"
						body = body & "Thank you for narrowing your choice of PRINCE2<sup>&reg;</sup> certification providers to include PROJstudy.<br><br>As a policy, we do not compare ourselves with other providers. We focus on what our delegates need and make sure what we offer is the best. We are well known for our exceptionally high quality training programs which are available at attractive prices. Given our track record, credentials, courses, additional high-value incentives like complimentary 6Sigma Green Belt course and a unique and unmatched exam retake guarantee, we encourage you to make comparisons yourself to see how different and confident PROJstudy is, in ensuring that you get what you covet – the PRINCE2  certification. To learn more about the benefits of taking a classroom program with PROJstudy, please <a href=""http://www.projstudy.com/PRINCE2-Training/courseBenefits.asp"" target=""_blank"">click here</a><br><br>We hope you have enough information to choose PROJstudy.<br><br>For any further clarification or additional information please email us at <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com</a><br><br>"&regards
						
						Case 5
						subject = "Enrolment details for PROJstudy PRINCE2 classroom courses"
						body = body & "Thank you for your interest in PROJstudy classroom training.<BR><BR>Steps involved in enrolling for PRINCE2<sup>&reg;</sup> training with PROJstudy:<BR><BR><b>Step 1:</b> Register online.<BR><BR>Please follow the link below to enrol with PROJstudy for PRINCE2 certification training. <a href=""http://www.projstudy.com/PRINCE2-Courses.asp"" target=""_blank"">www.PROJstudy.com/PRINCE2-Courses.asp</a><BR><BR><b>Step 2:</b> Pay the course fee.<BR><BR>We accept credit card payments made through Google checkout and PayPal.<BR><BR>To make the payment towards the course fee please click the link <a href=""http://www.projstudy.com/payforclass.asp"" target=""_blank"">http://www.PROJstudy.com/payforclass.asp</a><BR><BR><b>Step 3:</b> Online Access<BR><BR>Once we receive your payment, we will provide you with access to our online pre-course work which would give you an understanding of PRINCE2 required before commencement of classroom training.<BR><BR>We have an elaborate FAQ section on our website which can be accessed by clicking on the link <a href=""http://www.projstudy.com/PRINCE2-Training/Faqs.asp"" target=""_blank"">www.projstudy.com/PRINCE2-Training/Faqs.asp</a><BR><BR>For any further clarification or additional information please email us at <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com</a><BR><BR>We look forward to having you as our delegate.<BR> "&regards
						
						Case 6
						subject = "PROJstudy: bulk enrolment for PRINCE2 classroom training"
						body = body & "We thank you for the < method of contact, e.g. email, call >. We are happy to know that you and your colleagues are interested in pursuing PRINCE2<sup>&reg;</sup> certification with PROJstudy.<br><br>You would be delighted to know that PROJstudy offers unbeatable and unmatched bulk discount rates if 5 or more delegates enrol together. We would need the following information to offer you a customized package:<ol type=""1""><li>Number of delegates interested to take the course:</li><li>Date and location of the course preferred:</li><li>Details of the point of contact from your organization:<ol Type=""a""><li>Name:</li><li>Contact Number:</li><li>email ID:</li><li>Preferred time to contact:</li></ol></li><li>Name of the organization (If applicable):</li></ol><br>Once we receive the above information, we’ll revert with our best quote.<br><br>We look forward to having you and your colleagues as our delegates.<br><br>"&regards&""&ques
						
						Case 7
						subject = "PROJstudy: PRINCE2 classroom program fee details"
						body = body & "<b>The classroom program fee includes the following:</b><ul><li>The expenses towards study material, training and refreshments during breaks for the five days of training.</li><li>Cost of the PRINCE2<sup>&reg;</sup> certification examination</li><li>Tuition/trainer fees for the duration of the program</li></ul><b>The classroom training fee does not include the following:</b><ul><li>Cost of the PRINCE2 manual, hotel stay for delegates, travel, lunch and any other expense that the delegate would have to incur.</li></ul><br>To enrol with us, visit <a href=""http://www.projstudy.com/enrolClass.asp"" target=""_blank"">www.projstudy.com/enrolClass.asp</a><br><br>Your access to our preparatory course will be activated only after we receive your payment for the program fee. To make your payment, follow the link <a href=""http://www.projstudy.com/payforclass.asp"" target=""_blank"">www.projstudy.com/payforclass.asp</a><br><br>For answers to frequently asked questions, follow the link <a href=""http://www.projstudy.com/PRINCE2-Training/Faqs.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/Faqs.asp</a><br><br>For any further clarification or additional information please email us at <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com</a><br><br>We look forward to having you on board as our delegate.<br><br>"&regards
						
						Case 8
						subject = "PROJstudy: payment options"
						body = body & "Thank you for contacting PROJstudy.<br><br>You would be happy to note that we offer a wide range of payment options. You can choose to pay by any of the following methods: <br><br><b>Credit Card:</b> Payment can be done online either through Google Checkout or PayPal using the link <a href=""http://www.projstudy.com/payforclass.asp"" target=""_blank"">http://www.PROJstudy.com/payforclass.asp</a><br><br>OR<br><br><b>Bank Transfer:</b> Payment can be made through Bank Transfer: The details of our bank account are as follows:<br><br>Bank Name: HSBC Bank plc<br>Type of Account: Business Current Account<br> Account Name: EDUSYS SERVICES PVT LIMITED<br>Account Number: 01671855<br>Bank Sort Code: 40-05-26<br><br>After making the payment, please do remember to send us name(s) and email ID(s) of the delegate(s) as mentioned in enrolment form. In case of bank transfers, also include the Transaction ID. This will speed up the process of identifying receipts, and providing access to our pre course work.<br><br>For answers to the frequently asked questions, we request you to click - <a href=""http://www.projstudy.com/PRINCE2-Training/Faqs.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/Faqs.asp</a><br><br>For any further clarification or additional information please email us at <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com</a><br><br>We look forward to having you as our delegate.<br><br>"&regards
						
						Case 9
						subject = "PROJstudy: Rescheduling policy"
						body = body & "We have received your request for rescheduling your training program. We normally recommend that a delegate continue with the course as originally scheduled unless there are strong compelling reasons for rescheduling. Please be aware that there are rescheduling charges payable by you, which can be up to 40% of the program fee in some cases.<br><br>If you still wish to reschedule, you should review our rescheduling terms given below:<br><br><b>Course Rescheduling:</b> A delegate may opt to reschedule a course after initial enrolment. A rescheduling fee is charged (provided seat is available) as follows:<ul><li><b>Rescheduling 12 days prior to the course commencement date:</b> A rescheduling fee of 15% of the course fee will be charged. (This is the minimum rescheduling fee charged if any delegate reschedules).</li><br/><li><b>Rescheduling 5 days - 12 days prior to the course commencement date:</b> A rescheduling fee of 30% of the course fee will be charged.</li><br/><li><b>Rescheduling within 5 days of the course commencement date:</b>  A rescheduling fee of 40% of the course fee will be charged.</li></ul><br>You may make the payment of the applicable rescheduling fees by following the link <a href=""http://www.projstudy.com/payforclass.asp"" target=""_blank"">www.projstudy.com/payforclass.asp</a><br><br>Please email us at <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com</a> with your final decision. If you wish to continue with the rescheduling, let us know the location and date of the program that you would like to attend.<br><br>You can get answers to some of the frequently asked questions by following the link <a href=""http://www.projstudy.com/PRINCE2-Training/Faqs.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/Faqs.asp</a><BR>"&regards
						
						Case 10
						subject = "Cancellation of PROJstudy PRINCE2 class from ------- to -------"
						body = body & "This is to announce the cancellation of ------- program that was scheduled from ---------- to ----------. We have had to do this despite our best efforts to conduct the program as scheduled.<br><br>We reproduce below, our <a href=""http://www.projstudy.com/termsAndConditions.asp"" target=""_blank"">cancellation policy</a>, applicable when we cancel a classroom program,<br><br>We may cancel any particular class because of insufficient enrolments, instructor illness or force majeure events (like floods, earthquakes, political instability, etc.).<br><br>We can offer you the following options:<ol type=""1""><li>Reschedule to a future class in any location: You can opt to reschedule to a future class in any location. The amount paid for the present PROJstudy class will be applied towards the future class.</li><li>Ask for full refund: You also have the option to ask us for a full refund of your payment made towards PROJstudy Classroom Training.</li></ol><br>Please let us know whether you would like to reschedule the class or would prefer a full refund of payment made towards classroom training by sending an email to <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com.</a> If you prefer to reschedule, let us know the location and date of the program that you would like to attend.<br><br>We apologize for this change that’s beyond our control. We look forward to having you as our delegate.<br><br>"&regards
						 
						 Case 11
						subject = "PROJstudy – Cancellation Policy"
						body = body & "We are in receipt of your request to cancel your enrolment.<br><br>Please be aware that cancellation attracts cancellation charges up to 100% of the program fee in certain cases. Details of cancellation fee are given later in this email.<br><br>In view of the cancellation charges, we normally encourage our delegates to reschedule rather than cancel. Although rescheduling also attracts charges, it is lower than cancellation fees. Please find below the details of our rescheduling policy for your reference,<br><br>A delegate may opt to reschedule a course after initial enrolment. Then, a rescheduling fee is charged (provided there is availability in the future course) as mentioned below:<ul><li><b>Rescheduling more than 12 days before the course commencement date:</b> Additional rescheduling fee of 15% of the course fee will be charged. (This is the minimum rescheduling fee charged if any delegate reschedules).</li><li><b>Rescheduling 5 days - 12 days before the course commencement date:</b> Additional rescheduling fee of 30% of the course fee will be charged.</li><li><b>Rescheduling within 5 days of the course commencement date:</b> Additional rescheduling fee of 40% of the course fee will be charged.</li></ul><br>You may make the payment of the applicable rescheduling fees by following the link <a href=""http://www.projstudy.com/payforclass.asp"" target=""_blank"">www.projstudy.com/payforclass.asp.</a>  Please let us know the location and date of the program that you would like to attend.<br><br>If you are still willing to cancel your enrolment, the cancellation policy is quoted below:<br><br>Course cancellation policy (if the delegate cancels his enrolment):<ul><li><b>Cancellation more than 12 days before the course commencement date</b> Cancellation fee will be 20% of the total course fee. (This is the minimum cancellation fee charged).</li><li><b>Cancellation 5 days - 12 days before the course commencement date:</b> Cancellation fee will be 40% of the course fee</li><li><b>Cancellation within 5 days of the course commencement date:</b> No money is refundable</li></ul><br>Please note that we charge cancellation fee to compensate for our fixed expenses including hotel bookings, instructor fees, etc. All refunds will be processed and payments will be made to the delegates within 30 days of receipt of a course cancellation request.<br><br>Please email <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com</a> with your final decision.<br><br>"&regards
						
						Case 12
						subject = "PROJstudy: PRINCE2 result for classroom program held from ------ to ------"
						body = body & "Congratulations! You have now joined the elite group of PRINCE2® certified professionals.<br><br>We are delighted to inform you that you have passed the PRINCE2 < Foundation / Practitioner> certification exam conducted on ------ to ------ with a score of ---- out of -----.<br><br>This success was undoubtedly due to your own hard work and perseverance. We are happy that we were also able to play a part in your success story.<br><br>Your PRINCE2 certificate is under process and you would be informed as soon as it is mailed to you.<br><br>As per our records, your mailing address is:<br/>< Address as per records><br><br>Please inform us immediately if this address needs a change.<br><br>We hope you enjoyed your experience with PROJstudy. Now that you have tasted success, you might want to refer your friends for PROJstudy PRINCE2 courses.<br><br>click on the button for ""Refer Friend"".<br><br>"
	body = body & "<form name=""referFriend"" action=""http://www.PROJstudy.com/insertReferFrnd.asp""  method=""post""><input type=""hidden"" name=""refEmailID"" value="&payer_email&"><input type=""hidden"" name=""refName"" value="&first_name&" "&last_name&">Friend`s Email:  <input type=""text"" name=""frndEmailID1"">&nbsp; &nbsp; Name(optional):  <input type=""text"" name=""frndName1""><br /><br>  Friend`s Email:  <input type=""text"" name=""frndEmailID2"">  &nbsp; &nbsp; Name(optional):  <input type=""text"" name=""frndName2"">  <br /><br>  Friend`s Email:  <input type=""text"" name=""frndEmailID3""> &nbsp; &nbsp;  Name(optional):  <input type=""text"" name=""frndName3""><br /><br /><div align=""center""><input type=""submit"" value=""Refer Friend"" /></div></form><br><br>"
	body = body & "We also invite your feedback, which would help us further improve our training program as well as in getting more professionals like yourself gain the coveted PRINCE2 certification.<br><br>Please also let us know if you would like to share your experience with future PRINCE2 aspirants.<br><br>For any further clarification or additional information please email us at <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com</a>.<br><br>"&regards
	
	                  Case 13
						subject = "PROJstudy: PRINCE2 result for classroom program held from ------ to ------"
						body = body & "We are sorry to inform you that you did not pass the PRINCE2<sup>&reg;</sup> < Foundation/Practitioner> exam conducted on ------- in ----------.  You answered ----- out ----- of questions correctly.<br><br>PROJstudy offers an Exam Retake Guarantee for those delegates, who don’t pass their PRINCE2 exam on the first attempt after attending PROJstudy’s PRINCE2 Classroom training. <a href=""http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp"" target=""_blank"">More</a><br><br>You are required to retake the exam within 2 months from the date of the first attempt and should intimate PROJstudy about your decision to retake the exam, at least 2 weeks prior to the commencement of the scheduled program at which you would like to retake < re-take> the exam.<br><br>To be better prepared for your next attempt, we recommend that you commit yourself for the following:<ul><li>go through the course material that was provided to you by PROJstudy and spend at least 3 hours of concentrated study on the subject each day. </li><li>ensure that you cover all the Themes, Principles and Processes thoroughly</li><li>make best use of access to an online course worth up to £125 being specially provided to you to help you prepare for the next attempt.</li></ul><br>Let us know if you require any additional guidance and we can connect you with one of our instructors who will be able to help you.<br><br>For any further clarification or additional information please email us at <a href=""mailto:marketing@projstudy.com"" target=""_Blank"">marketing@projstudy.com</a> or call us at 0800 0337 947.<br><br>We wish you all the best for the PRINCE2 exam!<br><BR>"&regards
						
						Case 14
						subject = "PROJstudy: Action required regarding missing details on your payment / purchase order"
						body = body & "Please note that on < date when payment was received> we received a payment in the amount of ---- through< Google checkout / PayPal / Bank transfer> (Order #< number>)<br><br>We have received a payment of £----- on -----< date> through < Google checkout / PayPal / Bank transfer> (Order #< number>). However, our records indicate that you have not enrolled for our course, nor do we have any information about any other person in respect of whom you may have made this payment. Therefore, we are unable to attach the payment to any person(s) enrolling for a course.<br><br>We urge you to respond to us at <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com</a> as follows.<ol type=""1""><li>If you have made this payment for yourself, then please enrol for our course by visiting the link <a href=""http://www.projstudy.com/PRINCE2-Courses.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Courses.asp</a></li><li>If you have made the payment for someone else who is to attend the course, please provide us with the following information that is required to log the payment correctly:<ol type=""a""><li>First Name</li><li>Last Name</li><li>E-mail Id</li><li>Phone Number</li><li>Company</li><li>Programme Location</li><li>Programme Date</li></ol></li></ol><br>If you do not provide the information requested above, we would not be able to proceed any further with respect to your payment.<br><br>We look forward to your prompt response.<br><br>"&regards
						
						Case 15
						subject = "PROJstudy: Payment declined"
						body = body & "Our records indicate that the payment of < amount> remitted by you on < date> has been declined. As a result we are unable to confirm enrol you as a delegate for the course / program you applied for. <br><br>Please contact Google Checkout and resolve the issue. If you are unable to resolve the issue, you have the following alternatives:<ul><li>Use the link <a href=""http://www.pmstudy.com/payforclass.asp"" target=""_blank"">http://www.pmstudy.com/payforclass.asp</a>  to make the payment through our alternate payment provider - PayPal or using another card.</li><li>You can also make the payment through Bank Transfer.</li><br>The details of our bank account are as follows:<br>Bank Name: HSBC Bank plc<br>Type of Account: Business Current Account<br>Account Name: EDUSYS SERVICES PVT LIMITED<br>Account Number: 01671855<br>Bank Sort Code: 40-05-26</ul><br><br>Once payment is made, please provide us with the payment details so that we can confirm the receipt of the same.<br><br>Please note that we will be able to confirm your participation for the PROJstudy PRINCE2® program only when we receive the payment.<br><br>We thank you for your attention. We look forward to having you as our delegate.<br><br>"&regards
						
						
						Case 16
						subject = "PROJstudy: Thank you for your suggestion / feedback"
						body = body & "We have received your < method of contact, email, call, feedback form>. We thank you for your constructive feedback. We are forwarding your suggestions to the < academic, technical, marketing, finance> team, which evaluates suggestions and feedback and takes relevant and appropriate actions.<br><br>We value such feedback and suggestions. We hope in future also you would reach out to us with your thoughts, suggestions and feedback.<br><br>Meanwhile, we hope you are enjoying your experience with PROJstudy. For any queries, please email us at <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com</a><br><br>"&regards
				

				
					'Case 1
'					
'						subject="About PROJstudy"
'	                    body=body & "We thank you for your enquiry.<BR><BR>Our company provides high quality PRINCE<sup>&reg;</sup> 2 courses.<br><br>PRINCE2<sup>&reg;</sup> certification is the profession’s most globally recognized and respected certification credential. For more details on the PRINCE2<sup>&reg;</sup> certification, <a href=""http://www.PROJstudy.com/freeresources/aboutPrince2.asp"" target=""_blank"">click here</a>.<br><br>Some important links on PROJstudy online courses: <a href=""http://www.projstudy.com/enrol.asp"" target=""_blank"">click here</a><BR><BR><b>Regarding PROJstudy’s online training programs: </b>We provide different packages of PRINCE2<sup>&reg;</sup> online courses for interested candidates. For the list of PRINCE2<sup>&reg;</sup> courses provided by us, we request you to <a href=""http://www.projstudy.com/enrol.asp"" target=""_blank"">click here</a> and select the course that you would like to take.<br><br>We are pleased to inform you that we provide bulk/corporate discounts if more than 5 people would like to join PROJstudy.com course at one time. For details regarding the bulk/ Corporate discounts, please mail us at marketing@PROJstudy.com.<br><br>In addition, some other affiliated courses of PROJstudy.com include:<UL><LI>Six Sigma Certification Course: Six Sigma Black Belt and Green Belt Certification offered by <a href=""http://www.PROJstudy.com/"" target=""_blank"">www.PROJstudy.com</a>.</LI><br><LI>Program Management Course: Program Management course and certification offered by <a href=""http://www.PROGstudy.com/"" target=""_blank"">www.PGMPstudy.com</a>.</LI><br><LI>Human Resource Development Certification Course: Human Resource Development (HRD) certification course offered by <a href=""http://www.hrdstudy.com/"" target=""_blank"">www.HRDstudy.com</a></LI><br><LI>Project Management Professional (PMP) and Certified Associate in Project Management (CAPM) Exam Preparation Course which are certifications offered by  <a href=""http://www.PROJstudy.com/"" target=""_blank""> www.PROJstudy.com</a>.</LI></UL><br><br>We look forward to having you as our student. For any further clarification or additional information please feel free to email adminsupport@projstudy.com."&regards
'
'					Case 2
'						subject="Feedback to PROJstudy.com course ("&first_name&" "&last_name&")"
'	                    body = body & "We thank you for your enquiry.<BR><BR><b>Here are the answers to your questions:</b><br><BR>Ques: "& feedback &" <BR><BR>Ans: _____________________ <BR><br><br>For any queries, please email us at adminsupport@projstudy.com - we look forward to your feedback and suggestions.<BR><br>We hope you are enjoying your experience with PROJstudy.com."&regards &"" &ques
'
'					Case 3
'						subject="Feedback to PROJstudy.com course ("&first_name&" "&last_name&")"
'						body= body & "We thank you for your enquiry.We are happy to know that you are interested in pursuing your PRINCE2<sup>&reg;</sup> certification with us.<br><br>PROJstudy.com is the Most Economical and Most Effective Training institute for PRINCE2<sup>&reg;</sup> Certification.If you want to learn more about the benefits of PRINCE2 classroom course, then follow the link <a href=""http://www.projstudy.com/PRINCE2-Training/courseBenefits.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/courseBenefits.asp</a><br><br><b>Course details:</b> Our Foundation and Practitioner Classroom programs are of 5 days. A discount of"
'						Select Case country
'						Case 1
'						body= body & " Rs. 1000/-" 
'						Case 2
'						body= body &" £ 50 "
'						Case 3
'						body= body & " Rs. 1000/-"
'						End select
'						body= body &" will be provided for students who enrol at least 15 days before the program begins. You can also enrol for 3-day Foundation or 2-day Practitioner classroom course. To know more about PROJstudy PRINCE2 classroom courses, visit <a href=""http://www.projstudy.com/PRINCE2-Courses.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Courses.asp</a><br><br>For information about the course content, visit <a href=""http://www.projstudy.com/course-syllabus.asp"" target=""_blank"">http://www.projstudy.com/course-syllabus.asp</a>.<br><br>"
'						Select Case country
'						Case 2
'						body= body &" We offer a unique Exam Retake Guarantee. For more information, visit <a href=""http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp</a>.<br><br>Avail Free Six Sigma Green Belt Certification and 25 PDUs (course price: £ 250) For more information, visit <a href=""http://www.projstudy.com/PRINCE2-Training/free-onlinecertification.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/free-onlinecertification.asp</a><br><br>"
'						End select
'						body= body &" To enrol with us, visit <a href=""http://www.PROJstudy.com/enrolclass.asp"" target=""_blank"">www.PROJstudy.com/enrolclass.asp</a>.<br><br>For queries, please email us at adminsupport@projstudy.com. Also send us your feedback and suggestions.<BR><br>We look forward to having you as a student with PROJstudy.com."&regards&""&ques
'						
'					Case 4
'						subject="Feedback to PROJstudy.com course - with study procedure"
'						body= body & "We thank you for the enquiry. We are happy to know that you are interested in pursuing your PRINCE2<sup>&reg;</sup> certification with us.<BR><BR>PROJstudy.com is the Most Economical and Most Effective Training institute  for PRINCE2<sup>&reg;</sup> Certification.<BR><BR><b>Here are the answers to your questions:</b><br><BR>Ques: "& feedback &" <BR><BR>Ans: _____________________ <BR><BR>.PROJstudy.com offers several courses of different durations to PRINCE2<sup>&reg;</sup> aspirants. Please visit <a href=""http://www.projstudy.com/enrol.asp"" target=""_blank"">www.PROJstudy.com/enrol.asp</a> for details. <br><br>The PROJstudy.com course is divided into 19 chapters. PROJstudy.com will help you become proficient in each of the chapters, which are followed by a comprehensive simulated exam.<br><br>The procedure that you should ideally follow while studying for  the PRINCE2<sup>&reg;</sup> course offered by PROJstudy.com is mentioned below: <UL type=""1""><LI>Read a particular Chapter from PRINCE2<sup>&reg;</sup> Manual.</LI><br><LI>Read the comprehensive study guides and process sheets (of important terms and concepts) for the particular chapter.</LI><br><LI>Do the chapter tests for that chapter: there will be atleast 12 questions for each Chapter, which will improve your understanding of concepts for that Chapter.<br><br></LI></UL><br><br><b>Please note:</b> The PRINCE2<sup>&reg;</sup> course offered by  <a href=""http://www.projstudy.com/"">www.PROJstudy.com</a> follows a Mastery Program wherein as soon as you complete studying one Chapter and appear for the chapter test, you automatically get access to the next Chapter. Every Chapter builds on ."&regards&""&ques
'					
'					Case 5
'						subject = "Website performance has improved, will provide refund"
'						body = body & "We thank you for your enquiry. <br><br>PROJstudy.com is the Most Economical and Most Effective Training institute for PRINCE2<sup>&reg;</sup> Certification. <br><br><b>Here are the answers to your questions:</b><br><BR>Ques: "& feedback &" <BR><BR>Ans: The PROJstudy.com website was experiencing an unprecedented volume of usage because of which  its performance was unsatisfactory for a couple of hours(i.e. you may have been finding difficulty in accessing PROJstudy.com tests). Our technical team has rectified the issue and the website performance is much better now - we request you to continue with your PROJstudy.com course. We assure you that your course with PROJstudy.com will be very beneficial to you in your PRINCE2<sup>&reg;</sup> Exam preparation. <BR><BR>If you are still unable to continue with the course, please email us at adminsupport@projstudy.com and we will provide an appropriate refund for the amount of the course.<br><br>We regret the inconvenience caused and will ensure that there are no further disruptions."&regards&"" &ques
'						 
'					Case 6
'						subject= "Website performance has improved"
'	                    body=body & "We thank you for your enquiry. <br><br>PROJstudy.com is the Most Economical and Most Effective Training institute for PRINCE2<sup>&reg;</sup> Certification. <BR><BR><b>Here are the answers to your questions:</b><br><BR>Ques: "& feedback &" <BR><BR>Ans: The PROJstudy.com website was experiencing an unprecedented volume of usage because of which its performance was unsatisfactory for a couple of hours(i.e. you may have been finding difficulty in accessing PROJstudy.com tests). Our technical team has rectified the issue and the website performance is much better now - we request you to continue with your PROJstudy.com course. We regret the inconvenience caused and will ensure that there are no further disruptions.<br><br>We assure you that your course with PROJstudy.com will be very beneficial to you in your PRINCE2<sup>&reg;</sup> Exam preparation.<br><br>For any queries, please email us at <a href=""mailto: adminsupport@projstudy.com"">adminsupport@projstudy.com.</a> Also send us your feedback and suggestions. <BR> "&regards&""&ques
'
'					Case 7
'  						subject="Website slow at present, performance will improve shortly"
'	                    body= body & "We thank you for your enquiry.<BR><BR>PROJstudy.com is the Most Economical and Most Effective Training institute for PRINCE2<sup>&reg;</sup> Certification. <BR><BR><b>Here are the answers to your questions:</b><br><BR>Ques: "& feedback &" <BR><BR>Ans: The PROJstudy.com website is experiencing an unprecedented volume of usage because of which its performance is low at present (i.e. you may be finding difficulty in accessing PROJstudy.com tests). Our technical team is working on this issue and the website performance will be much better within the next few hours.<BR><BR>We regret the inconvenience caused and will ensure that there are no further disruptions.<BR><BR>We would like to assure you that your course with PROJstudy.com will be very beneficial to you in your PRINCE2<sup>&reg;</sup> Exam preparation.<br><br>For any queries, please email us at adminsupport@projstudy.com - we always look forward to your feedback and suggestions. <BR> "&regards&""&ques
'
'
'					Case 8 
'						subject = "Website slow at present, will provide refund"
'						body=body & "We thank you for your enquiry.<BR><BR>PROJstudy.com is the Most Economical and Most Effective Training institute for PMI PDUs* and to prepare for PRINCE2<sup>&reg;</sup> Certification Exams.<BR><BR><b>Here are the answers to your questions:</b><br><BR>Ques: "& feedback &" <BR><BR>Ans: The PROJstudy.com website is experiencing an unprecedented volume of usage because of which the website performance is low at present (i.e. you may be finding difficulty in accessing PROJstudy.com tests). Our technical team is working on this issue and the website performance will be much better within the next few hours. <BR><BR>If you are unable to take your tests within the next few hours, please email us at adminsupport@projstudy.com and we will provide an appropriate refund for your course.<br><br>We regret the inconvenience caused and will ensure that there are no further disruptions.<br><br>We assure you that your course with PROJstudy.com will be very beneficial to you in your PRINCE2<sup>&reg;</sup> Exam preparation. For any queries, please email us at adminsupport@projstudy.com - we always look forward to your feedback and suggestions. <BR> "&regards&""&ques
'					
'					Case 9
'						subject = "About PROJstudy's PRINCE2 online course"
'						body = body & "We thank you for your enquiry.<br><br>We are happy to know that you are interested in pursuing our online course to prepare for the PRINCE2<sup>&reg;</sup> certification exam.<br><br>PROJstudy.com is the BEST PARTNER to ensure your success in PRINCE2<sup>&reg;</sup> Certification Exam. <BR><BR>For more information regarding the benefits of choosing PROJstudy for preparing you for the PRINCE2<sup>&reg;</sup> Certification Exam, please click here. <br><br><b>Course Details:</b> Please note that our courses are completely online. They are Most Economical and Most Effective. We provide various courses that suit your time, purpose, and budget.<br><br>The PROJstudy.com course content includes: <br><br><ul type=""1""><li>Comprehensive Guides on all the Processes, Principles and Themes<br><br></li><li>Chapter tests covering every Process and Theme.<br><br> </li><li>Full length Simulated Practice Test <br><br></LI></UL>PROJstudy.com offers the following types of courses for PRINCE2<sup>&reg;</sup> aspirants:<br><br><ul type=""a""><li>Individual Full Length Simulated Practice test<br><br></li><li>A package of Simulated Practice Tests, Guides, Chapter Tests <br><br> </li></UL>For details regarding the duration and fees of the above courses, please click here.<br><br>For details on the education process followed by PROJstudy.com for the online courses, please click here.<br><br><b>Bulk discount:</b><br><br>We are pleased to inform you that if three (3) or more people enrol at the same time as a group, we provide a bulk discount. For details regarding bulk discounts, please click here.<br><br>For more information about PRINCE2<sup>&reg;</sup>, APMG and PROJstudy, please click here.<br><br>For tips on preparing for and appearing for PRINCE2<sup>&reg;</sup> Certification Exam, please click here.<br><br>We look forward to having you as our student. For further queries, please email us at <br><br>adminsupport@projstudy.com. <BR>"&regards&""&ques
'						
'					Case 10
'						subject = "If payment cannot be made through PayPal (for online courses)"
'						body = body & "We thank you for your enquiry.<br><br>We are happy to know that you are interested in pursuing our online course to prepare for the PRINCE2<sup>&reg;</sup> certification exam. <br><br>If you cannot make the payment using PayPal, please use our alternate payment option, CCAvenue. Please use this link to remit the course fee: <a href=""http://www.projstudy.com/enroll_ccavenue.asp"" target=""_blank"">http://www.PROJstudy.com/enroll_ccavenue.asp.</a>. <br><br>You can use all leading credit/debit cards (e.g. Visa, American Express, etc.) to make payments using the above mentioned link. However, CCAvenue  does not accept MasterCard at present. <br><br><b>Please Note:</b> If you are using the credit/debit card of a colleague, friend or relative, then please email the payment details and your personal information (name, address, and preferred email address for correspondence) to adminsupport@projstudy.com, so that we can set up the account in your name.<br><br>We look forward to having you as our student. For further queries, please email us at adminsupport@projstudy.com. <BR>"&regards&""&ques
'						
'					Case 11
'						subject = "PROJstudy: bulk enrolment for PRINCE2 classroom training"
'						body = body & "We thank you for the ----< method of contact, e.g. email, call >. We are happy to know that you and your colleagues are interested in pursuing PRINCE2<sup>&reg;</sup> certification with PROJstudy.<br><br>You would be delighted to know that PROJstudy offers unbeatable and unmatched bulk discount rates if 5 or more delegates enrol together. We would need the following information to offer you a customized package:<ol type=""1""><li>Number of delegates interested to take the course:</li><li>Date and location of the course preferred:</li><li>Details of the point of contact from your organization:<ol Type=""a""><li>Name:</li><li>Contact Number:</li><li>email ID:</li><li>Preferred time to contact:</li></ol></li><li>Name of the organization (If applicable):</li></ol><br>Once we receive the above information, we’ll revert with our best quote.<br><br>We look forward to having you and your colleagues as our delegates.<br><br>"&regards&""&ques
'						
'					Case 12
'						subject = "Require company email address for providing reference"
'						body = body & "We thank you for your enquiry. <br><br>We are happy to know that you are considering PROJstudy.com for your PRINCE2<sup>&reg;</sup> certification exam.<br><br><b>Here is the answers to your questions:</b><br><BR>Ques: You had requested for a reference from a colleague who had enrolled in <a href=""http://www.projstudy.com/"" target=""_blank"">PROJstudy.com </a> course.<BR><BR>Ans: Please note that we can provide the details of the referent only when you provide us your company email address.<br> So, kindly re-submit your request along with your company email address at the earliest. <br><br>For further queries, please email us at adminsupport@projstudy.com."&regards
'						
'					Case 13
'						subject = "Suggestions for PROJstudy.com course"
'						body = body & "We have received your email regarding suggestions for improvement of our course and would like to thank you for your constructive feedback; we will be forwarding your suggestions to our Academic team, who will  evaluate them and make appropriate changes to the course.<br><br>We hope you are enjoying your experience with PROJstudy.com; for queries, please email us at adminsupport@projstudy.com - we always look forward to your feedback and suggestions. <BR> "&regards&""&ques
'						
'					Case 14
'						subject = "Unable to make payment using the credit card (For online courses)"
'						body = body & "We thank you for your enquiry.<BR><BR>Please note that if you are not able to remit the course fee by credit card, you can make the payment through a  cheque in favour of ""Edusys Services Pvt. Limited"". Please mail the cheque to the following address: <BR><BR>EDUSYS SERVICES PVT LIMITED <BR><BR> # 27, 2nd Floor, Santosh Towers, <BR>4th Main,100 Ft. Ring Road,<BR>J.P. Nagar 4th Phase,<BR>Bangalore - 560078 <BR>India.<br><br>After mailing the cheque, please email the payment details, along with the following details of the candidate to adminsupport@projstudy.com: <ul type=""1""><li>Name<br> </li><li>E-mail id<br></li><li>Contact address with phone number<br></li></ul><br>On receipt of the payment, our customer support team will enroll the candidate and email the login details.<br><br>For further queries, please email adminsupport@ PROJstudy.com.<br><br>We look forward to having you as our student. <BR> "&regards&""&ques
'						
'					Case 15
'						subject = "Enrolment details for PROJstudy PRINCE2 classroom courses"
'						body = body & "Thank you for your interest in PROJstudy classroom training.<BR><BR>Steps involved in enrolling for PRINCE2<sup>&reg;</sup> training with PROJstudy:<BR><BR><b>Step 1:</b> Register online.<BR><BR>Please follow the link below to enrol with PROJstudy for PRINCE2 certification training. <a href=""http://www.projstudy.com/PRINCE2-Courses.asp"" target=""_blank"">www.PROJstudy.com/PRINCE2-Courses.asp</a><BR><BR><b>Step 2:</b> Pay the course fee.<BR><BR>We accept credit card payments made through Google checkout and PayPal.<BR><BR>To make the payment towards the course fee please click the link <a href=""http://www.projstudy.com/payforclass.asp"" target=""_blank"">http://www.PROJstudy.com/payforclass.asp</a><BR><BR><b>Step 3:</b> Online Access<BR><BR>Once we receive your payment, we will provide you with access to our online pre-course work which would give you an understanding of PRINCE2 required before commencement of classroom training.<BR><BR>We have an elaborate FAQ section on our website which can be accessed by clicking on the link <a href=""www.projstudy.com/PRINCE2-Training/Faqs.asp"" target=""_blank"">www.projstudy.com/PRINCE2-Training/Faqs.asp</a><BR><BR>For any further clarification or additional information please email us at <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com</a><BR><BR>We look forward to having you as our delegate.<BR> "&regards
'
'
'                	Case 16
'						subject = "Reminder - Payment Declined from Google Checkout"
'						body = body & "We would like to bring to your notice that the payment of _____________ being our fee toward PROJstudy.com PRINCE2 Classroom Course has been declined by Google Checkout.<br><br>Can you please communicate with Google Checkout and get this issue resolved? Alternatively, you can pay the fee using another credit card. We thank you for your attention.<br><br>We look forward to having you as a student in our PROJstudy.com PRINCE2 classroom program.<BR> "&regards
'						
'					Case 17
'						subject = "Class Confirmation"
'						body = body & "The class in the ______________________________ is confirmed.<br><br>We are also copying this email to your faculty for the course, (____________). You can contact the faculty for any information or clarifications pertaining to the program.<br><br>We look forward to having you as a delegate in our PRINCE2 classroom program.<BR> "&regards
'						
'						Case 18
'						subject = "PROJstudy: PRINCE2 eligibility criteria"
'						body = body & "We thank you for the ----<method of contact, e.g. email, call > asking for eligibility criteria for PRINCE2<sup>&reg;</sup> courses.<BR><BR>The eligibility criteria are given below:<ul><li><b>PRINCE2 Foundation course:</b> There is no pre-requisite (eligibility criteria) for taking the PRINCE2 Foundation course but, general Project Management training is ideal.</li><li><b>PRINCE2 Practitioner course:</b> Students should pass the PRINCE2 Foundation exam before they can take the PRINCE2 Practitioner exam.</li></ul><br>Now that you know about the eligibility criteria for PRINCE2, you might want to know more about PROJstudy. PROJstudy is recognized by APMG, UK as an Accredited Training Organization (ATO) and is a brand of Edusys Services Pvt. Limited. We are the most successful and most popular globally. We have trained more than 25,000 successful project managers for various project management courses including PRINCE2, PMP, CAPM etc. in over 160 countries. We are well known for our exceptionally high quality training programs which are available at attractive prices. <a href=""http://www.projstudy.com/PRINCE2-Training/exam-success.asp"" target=""_blank"">More</a><br><br>For details regarding the upcoming classroom training sessions in various locations, please <a href=""http://www.projstudy.com/PRINCE2-Courses.asp"" target=""_blank"">click here</a><br><br>For answers to the list of frequently asked questions, we request you to click <a href=""http://www.projstudy.com/PRINCE2-Training/Faqs.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/Faqs.asp</a><BR> "&regards
'						
'						Case 19
'						subject = "Enrolment Email"
'						body = body & "We provide a 100% Exam Retake Guarantee that you will successfully pass the PRINCE2<sup>&reg;</sup> certification exam if you enrol in our PROJstudy PRINCE2 classroom program. For details regarding the 100% Exam Retake Guarantee offer, please click: <a href=""http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp</a> <br><br>You can enrol for our PRINCE2 Classroom training program by using the following link:<a href=""http://www.projstudy.com/enrolClass.asp"" target=""_blank"">http://www.projstudy.com/enrolClass.asp</a><br><br>Kindly note that enrolment in our classroom training is a three step process, as outlined below:<br><br>Step 1: Provide enrolment information (3 minutes)<br>Step 2: Make payment for the course within 5 days after enrolment <Br>Step 3: PROJstudy confirms your admission to the course after receipt of payment.<br><br>You can get answers to the frequently asked questions at:<a href=""http://www.projstudy.com/PRINCE2-Training/Faqs.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/Faqs.asp</a><BR>"&regards
'					
'					
'						Case 20
'						subject = "Payment received"
'						body = body & "We have received the payment and confirm your admission to the PROJstudy PRINCE2 classroom program.<br><br>You should have also received an email providing you access to our online Preparatory course. Please complete this course and study as much as you can before you attend the PRINCE2 classroom program.<br><br>We look forward to your participation in the PROJstudy PRINCE2 classroom training program.<BR>"&regards
'						
'						Case 21
'						subject = "Preparatory Course"
'						body = body & "PROJstudy offers a preparatory program to its delegates which should be completed before attending the PROJstudy PRINCE2 classroom training course. Access to this course is granted as soon as PROJstudy receives your payment towards the classroom training course.<br><br>This preparatory course provides you:<ul type=""a""><li>An understanding of APMG, PRINCE2 and PROJstudy.com education process.</li><li>Fill in the blanks to understand the concepts covered in each chapter.</li></ul>You can get answers to the frequently asked questions at:<a href=""http://www.projstudy.com/PRINCE2-Training/Faqs.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/Faqs.asp</a><BR>"&regards
'					
'					Case 22
'						subject = "PROJstudy: Rescheduling policy"
'						body = body & "We have received your request for rescheduling your training program. We normally recommend that a delegate continue with the course as originally scheduled unless there are strong compelling reasons for rescheduling. Please be aware that there are rescheduling charges payable by you, which can be up to 40% of the program fee in some cases.<br><br>If you still wish to reschedule, you should review our rescheduling terms given below:<br><br><b>Course Rescheduling:</b> A delegate may opt to reschedule a course after initial enrolment. A rescheduling fee is charged (provided seat is available) as follows:<ul><li><b>Rescheduling 12 days prior to the course commencement date:</b> A rescheduling fee of 15% of the course fee will be charged. (This is the minimum rescheduling fee charged if any delegate reschedules).</li><li><b>Rescheduling 5 days - 12 days prior to the course commencement date:</b> A rescheduling fee of 30% of the course fee will be charged.</li><li><b>Rescheduling within 5 days of the course commencement date:</b>  A rescheduling fee of 40% of the course fee will be charged.</li></ul><br>You may make the payment of the applicable rescheduling fees by following the link <a href=""http://www.projstudy.com/payforclass.asp"" target=""_blank"">www.projstudy.com/payforclass.asp</a><br><br>Please email us at <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com</a> with your final decision. If you wish to continue with the rescheduling, let us know the location and date of the program that you would like to attend.<br><br>You can get answers to some of the frequently asked questions by following the link <a href=""http://www.projstudy.com/PRINCE2-Training/Faqs.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/Faqs.asp</a><BR>"&regards
'					
'					
'					Case 23
'						subject = "PRINCE2 Classroom Training from PROJstudy"
'						body = body & "We thank you for the ----------< method of contact, e.g. email, call >. We are happy to know that you are interested in pursuing PRINCE2<sup>&reg;</sup> certification with PROJstudy.<br><br><b>About Us:</b> PROJstudy is recognized by APMG, UK as an Accredited Training Organization (ATO) and is a brand of Edusys Services Pvt. Limited. We are the most successful and most popular project management training provider globally. We have trained more than 25,000 successful project managers for various project management courses including PRINCE2<sup>&reg;</sup>, PMP, CAPM etc. We have a presence globally in over 160+ countries with delegates from over 3500 companies. We are well known for our exceptionally high quality training programs which are available at attractive prices. <a href=""http://www.projstudy.com/PRINCE2-Training/exam-success.asp"" target=""_blank"">More</a><br><br><b>Course details:</b>  We have a comprehensive suite of courses which are designed for the specific requirements of different types of delegates. The Foundation course is meant for early starters in PRINCE2 while the Practitioner course is focussed on advanced concepts required by PRINCE2 practitioners. Our courses can be taken either purely online, purely classroom or a combination of classroom and online training.<br><br><b>Course duration and prices:</b> Our <Foundation / Practitioner / Foundation & Practitioner> Classroom programs consists of <2/3/5> days of training. The course fee is <£349/ 399/ 649> respectively.  We provide a discount of £50 to delegates who enrol more than 15 days prior to commencement of the program. <a href=""http://www.projstudy.com/course-syllabus.asp"" target=""_blank"">More</a><br><br><b>Online access:</b> On receipt of your payment towards PROJstudy PRINCE2 classroom training program, we will provide you with access to our online pre-course work. The pre-course work is simple and will provide you the required understanding of the PRINCE2 principles and concepts.<br><br><b>Dates and Location:</b> We conduct several classroom training programs in different locations across United Kingdom. <a href=""http://www.projstudy.com/PRINCE2-Courses.asp"" target=""_blank"">More</a><br><br>For information about the course content, visit <a href=""http://www.projstudy.com/course-syllabus.asp"" target=""_blank"">http://www.projstudy.com/course-syllabus.asp</a><br><br>To know more about the benefits of our classroom course, please follow the link: <a href=""http://www.projstudy.com/PRINCE2-Training/courseBenefits.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/courseBenefits.asp</a><br><br><b>Unique Exam Retake Guarantee:</b> Our high quality study materials, the expertise of our faculty and the best-in-industry course delivery methodology are all designed to enable the delegate pass the PRINCE2 exam in the first attempt. But in the rare event of a delegate not passing, the delegate may retake the exam at no extra cost. Students will also be provided with access to an online course (valued up to £125) that would help them prepare for their next attempt. <a href=""http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp"" target=""_blank"">More</a><br><br><b>Complimentary 6Sigma Green Belt access:</b> 3-month complimentary access to 6Sigma Green Belt course worth £175. <a href=""http://www.projstudy.com/PRINCE2-Training/free-onlinecertification.asp"" target=""_blank"">More</a><br><br><b>Enrolment:</b> Students can enrol for <3-day Foundation/ 2-day Practitioner/ 5-day Foundation & Practitioner> classroom course. To enrol with us, visit <a href=""http://www.projstudy.com/enrolclass.asp"" target=""_blank"">www.PROJstudy.com/enrolclass.asp</a><br><br><b>Payment:</b> To make the payment towards course fees please click on the link <a href=""http://www.projstudy.com/payforclass.asp"" target=""_blank"">http://www.PROJstudy.com/payforclass.asp</a><br><br>For answers to the list of frequently asked questions, we request you to click - <a href=""http://www.projstudy.com/PRINCE2-Training/Faqs.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/Faqs.asp</a><br><br>For any further clarification or additional information please email us at <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com</a><br><br>We look forward to having you as our delegate.<br><br>"&regards
'						
'								Case 24
'						subject = "PRINCE2 result for classroom program held from ------ to ------"
'						body = body & "We are sorry to inform you that you did not pass the PRINCE2<sup>&reg;</sup> <Foundation/Practitioner> exam conducted on ------- in ----------.  You answered ----- out ----- of questions correctly.<br><br>PROJstudy offers an Exam Retake Guarantee for those delegates, who don’t pass their PRINCE2 exam on the first attempt after attending PROJstudy’s PRINCE2 Classroom training. <a href=""http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp"" target=""_blank"">More</a><br><br>You are required to retake the exam within 2 months from the date of the first attempt and should intimate PROJstudy about your decision to retake the exam, at least 2 weeks prior to the commencement of the scheduled program at which you would like to retake <re-take> the exam.<br><br>To be better prepared for your next attempt, we recommend that you commit yourself for the following:<ul><li>go through the course material that was provided to you by PROJstudy and spend at least 3 hours of concentrated study on the subject each day. </li><li>ensure that you cover all the Themes, Principles and Processes thoroughly</li><li>make best use of access to an online course worth up to £125 being specially provided to you to help you prepare for the next attempt.</li></ul><br>Let us know if you require any additional guidance and we can connect you with one of our instructors who will be able to help you.<br><br>For any further clarification or additional information please email us at <a href=""mailto:marketing@projstudy.com"" target=""_Blank"">marketing@projstudy.com</a> or call us at 0800 0337 947.<br><br>We wish you all the best for the PRINCE2 exam!<br><BR>"&regards
'					
'					Case 25
'						subject = "Cancellation Policy - If PROJstudy cancels a class"
'						body = body & "We are sorry to inform you that we have to cancel the"
'						 If Location <> "" Then 
'                        body = body & " "&Location&" "
'                        Else
'                         body = body & " ----------"
'						 End If
'                        body = body &" program that was scheduled from"
'						 If Location <> "" Then 
'                        body = body & " "&FromDate&" to "
'                        Else
'                         body = body & " ---------- to"
'						 End If
'						 If Location <> "" Then 
'                        body = body & " "&ToDate&""
'                        Else
'                         body = body & " ----------"
'						 End If
'						 body = body & " because of insufficient enrolments.<br><br>You may want to read our <a href ="" http://www.projstudy.com/termsAndConditions.asp"" target=""_blank"">cancellation policy</a> (in the event we cancel a classroom program), which is also given below: <br><br>""We may cancel any particular class because of insufficient enrolments, instructor illness or force-majeure events (like floods, earthquakes, political instability, etc.)<br><Br>We can offer you the following options:<br><ul type=""1""><li>Reschedule to a future class in the same location: You can opt to reschedule to a future class in the same location. The amount paid for the present PROJstudy class will be applied towards the future class.</li><li>Ask for full refund: You also have the option to ask us for a full refund of your payment made towards PROJstudy.com Classroom Training.</li></ul><br>Please let us know your decision by sending an email to marketing@projstudy.com.<br><br>We apologize for this change that’s beyond our control. We look forward to having you as a student with PROJstudy PRINCE2 Classroom Training.<br><Br>"&regards
'					
'					Case 26
'						subject = "Cancellation Policy - If a delgates cancels his enrolment"
'						body = body & "We are in receipt of your request to cancel your enrolment.<br><Br>As mentioned in our cancellation policy, all cancellations attract a cancellation fee. To see our cancellation and rescheduling policies please follow the link <a href ="" http://www.projstudy.com/termsAndConditions.asp"" target=""_blank""> http://www.projstudy.com/termsAndConditions.asp</a>. For your convenience, cancellation fees charged will be as follows:<br><ul type=""a)""><li><b>Cancellation more than 12 days before the course commencement date:</b> Cancellation fee will be 20% of the total course fee. (This is the minimum cancellation fee charged).</li><li><b>Cancellation 5 days - 12 days before the course commencement date:</b> Cancellation fee will be 40% of the course fee</li><li><b>Cancellation within 5 days of the course commencement date:</b> No money will be refunded.</li></ul>Please note that we charge cancellation fee to compensate for our fixed expenses including hotel bookings, instructor fees, etc. All refunds will be processed and payments will be made to the delegates within 30 days of receipt of a course cancellation request.<br><br>In view of the fees involved, we normally encourage our delegates to reschedule rather than cancel. Although rescheduling also attracts charges, it is lower than cancellation fees. Details of the rescheduling fees are given below:<br><br><b>Rescheduling policy:</b>A delegate may opt to reschedule a course after initial enrolment. A rescheduling fee is charged (provided the required number of seats are available on a subsequent requested date). The fee charged will be:<br><ul type=""a)""><li><b>Rescheduling more than 12 days before the course commencement date: </b> Additional rescheduling fee of 15% of the course fee will be charged. (This is the minimum rescheduling fee charged if any delegate reschedules).</li><li><b>Rescheduling 5 days - 12 days before the course commencement date: </b>Additional rescheduling fee of 30% of the course fee will be charged.</li><li><b>Rescheduling within 5 days of the course commencement date: </b>Additional rescheduling fee of 40% of the course fee will be charged.</li></ul><br>Once you have made up your mind, please email marketing@projstudy.com with your final decision. You may make the payment of the applicable rescheduling fees by following the link <a href ="" http://www.projstudy.com/payforclass.asp"" target=""_blank""> www.projstudy.com/payforclass.asp</a>. Please let us know the location and date of the program that you would like to attend.<br><br>We can reschedule your enrolment only after we receive the rescheduling fee and the location and dates of the program to which you want to reschedule your enrolment.<br><br>"&regards
'						
'						
'							Case 27
'						subject = "Benefits of attending PROJstudy PRINCE2 classroom program"
'						body = body & "We thank you for the ------<method of contact, e.g. email, call >. We are happy to know that you are interested in pursuing PRINCE2<sup>&reg;</sup> certification with PROJstudy.<br><br>Given below are a few compelling reasons why you should choose PROJstudy as your partner for the PRINCE2 certification.<ul><li><b>Best faculty:</b> PROJstudy has project management trainers who are APMG Accredited and are the best in the industry. Each has extensive industry / project management experience in diverse fields such as IT, finance, consultancy services, etc. <a href=""http://www.projstudy.com/instructors.asp"" target=""_blank"">More</a></li><li><b>Scientifically designed effective and result-oriented instruction method:</b> PROJstudy PRINCE2 classroom course has been developed, assessed, and evaluated by several PRINCE2 certified project management experts, and approved by APMG. Several interactive methods such as experiential learning, small groups, hands-on practice, repetition, trainee panels, periodic evaluation and case studies are extensively used. <a href=""http://www.projstudy.com/freeresources/chapterTest.asp"" target=""_blank"">More</a></li><li><b>Unique Exam Retake Guarantee policy:</b> The delegate is guaranteed to pass the PRINCE2 certification exam. But in a rare case of the delegate not passing, the delegate will be allowed to re-take the exam at no extra cost. <a href=""http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp"" target=""_blank"">More</a></li><li><b>Best value for money:</b> Fee for PROJstudy PRINCE2 Foundation and Practitioner 5-day classroom training can be as low as £599 only per delegate <a href=""http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp"" target=""_blank"">More</a></li><li><b>£50 early bird discount:</b> We offer £50 early bird discount if enrolment is done 15 days prior to the course commencement date. <a href=""http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp"" target=""_blank"">More</a></li><li><b>Excellent training environment:</b> Our classroom training is normally conducted at premium meeting centers / hotels at convenient locations with all the required study aids. Snacks and coffee / tea are provided during the classroom program.</li><li><b>Free 1 month access to PROJstudy pre-course study material:</b> We offer the delegates one month access to PROJstudy's pre-course study material.</li><li>Completely free and complimentary access to Six Sigma Green Belt online certificate course for three months, offered by www.6sigmastudy.com , worth £175. Trusted by 1175 companies across 63 countries, this course will not only help you understand and apply the concepts of Six Sigma in your workplace but also will offer you 25 PMI PDUs which can be used for continuing education requirements. <a href=""http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp"" target=""_blank"">More</a></li><li><b>PMI Approved PDUs:</b> PROJstudy provides 45 PDUs with PRINCE2 Foundation and Practitioner Certification courses. These are valid PDUs for continuing education requirements in maintaining PMP Certification Status. <a href=""http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp"" target=""_blank"">More</a></li></ul><br>To know more about the benefits of PROJstudy PRINCE2 classroom program, please follow the link <a href=""http://www.projstudy.com/PRINCE2-Training/courseBenefits.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/courseBenefits.asp</a><br><br>To enrol with us, visit <a href=""http://www.projstudy.com/enrolClass.asp"" target=""_blank"">http://www.projstudy.com/enrolClass.asp</a><br><br>Your access to our preparatory course will be activated only after we receive your payment for the program fee. To make your payment, follow the link <a href=""http://www.projstudy.com/payforclass.asp"" target=""_blank"">www.projstudy.com/payforclass.asp</a><br><br>For answers to the list of frequently asked questions, we request you to click <a href=""http://www.projstudy.com/PRINCE2-Training/Faqs.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/Faqs.asp</a><br><br>For any queries, please email <a href=""mailto:marketing@projstudy.com."" target=""_blank"">marketing@projstudy.com.</a><br><br>We look forward to having you as our delegate.<br><br>"&regards
'						
'						
'							Case 28
'						subject = "Payment query - Credit card"
'						body = body & "You may choose to pay us online by Credit Card either through Google Checkout or PayPal. To make payment using your credit card, please visit - <a href=""http://www.projstudy.com/payforclass.asp"" target=""_blank"">www.projstudy.com/payforclass.asp</a>. If you are remitting the payment for someone else who will attend the program, we would appreciate if you could specify the name of the delegate/s who would be attending the program in the remarks column.<br><br>Check out the elaborate section of FAQs at <a href=""http://www.projstudy.com/PRINCE2-Training/Faqs.asp"" target=""_blank"">www.projstudy.com/PRINCE2-Training/Faqs.asp</a> that has answers to the most common queries.<br><br>For any queries, please email marketing@projstudy.com<br><br>We look forward to having you on board as our delegate.<br><br>"&regards
'						
'						Case 29
'						subject = "PROJstudy: PRINCE2 classroom program fee details"
'						body = body & "<b>The classroom program fee includes the following:</b><ul><li>The expenses towards study material, training and refreshments during breaks for the five days of training.</li><li>Cost of the PRINCE2<sup>&reg;</sup> certification examination</li><li>Tuition/trainer fees for the duration of the program</li></ul><b>The classroom training fee does not include the following:</b><ul><li>Cost of the PRINCE2 manual, hotel stay for delegates, travel, lunch and any other expense that the delegate would have to incur.</li></ul><br>To enrol with us, visit <a href=""http://www.projstudy.com/enrolClass.asp"" target=""_blank"">www.projstudy.com/enrolClass.asp</a><br><br>Your access to our preparatory course will be activated only after we receive your payment for the program fee. To make your payment, follow the link <a href=""http://www.projstudy.com/payforclass.asp"" target=""_blank"">www.projstudy.com/payforclass.asp</a><br><br>For answers to frequently asked questions, follow the link <a href=""http://www.projstudy.com/PRINCE2-Training/Faqs.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/Faqs.asp</a><br><br>For any further clarification or additional information please email us at <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com</a><br><br>We look forward to having you on board as our delegate.<br><br>"&regards
'						
'						
'						
'						Case 30
'						subject = "Successful student"
'						body = body & "Congratulations! You have now joined the elite group of PRINCE2® certified professionals.<br><br>We are delighted to inform you that you have passed the PRINCE2 <Foundation / Practitioner> certification exam conducted on ------ to ------ with a score of ---- out of -----.<br><br>This success was undoubtedly due to your own hard work and perseverance. We are happy that we were also able to play a part in your success story.<br><br>Your PRINCE2 certificate is under process and you would be informed as soon as it is mailed to you.<br><br>As per our records, your mailing address is:----< Address as per records><br><br>Please inform us immediately if this address needs a change.<br><br>We hope you enjoyed your experience with PROJstudy. Now that you have tasted success, you might want to refer your friends for PROJstudy PRINCE2 courses.<br><br>click on the button for ""Refer Friend"".<br><br>"
'	body = body & "<form name=""referFriend"" action=""http://www.PROJstudy.com/insertReferFrnd.asp""  method=""post""><input type=""hidden"" name=""refEmailID"" value=""&Session(""PayerEmail"")&""><input type=""hidden"" name=""refName"" value=""&rqUserName&"">Friend`s Email:  <input type=""text"" name=""frndEmailID1"">&nbsp; &nbsp; Name(optional):  <input type=""text"" name=""frndName1""><br /><br>  Friend`s Email:  <input type=""text"" name=""frndEmailID2"">  &nbsp; &nbsp; Name(optional):  <input type=""text"" name=""frndName2"">  <br /><br>  Friend`s Email:  <input type=""text"" name=""frndEmailID3""> &nbsp; &nbsp;  Name(optional):  <input type=""text"" name=""frndName3""><br /><br /><div align=""center""><input type=""submit"" value=""Refer Friend"" /></div></form><br><br>"
'	body = body & "We also invite your feedback, which would help us further improve our training program as well as in getting more professionals like yourself gain the coveted PRINCE2 certification.<br><br>Please also let us know if you would like to share your experience with future PRINCE2 aspirants.<br><br>For any further clarification or additional information please email us at marketing@projstudy.com.<br><br>"&regards
'						
'						
'						Case 31
'						subject = "PROJstudy – Why Us"
'						body = body & "Thank you for narrowing your choice of PRINCE2<sup>&reg;</sup> certification providers to include PROJstudy.<br><br>As a policy, we do not compare ourselves with other providers. We focus on what our delegates need and make sure what we offer is the best. We are well known for our exceptionally high quality training programs which are available at attractive prices. Given our track record, credentials, courses, additional high-value incentives like complimentary 6Sigma Green Belt course and a unique and unmatched exam retake guarantee, we encourage you to make comparisons yourself to see how different and confident PROJstudy is, in ensuring that you get what you covet – the PRINCE2  certification. To learn more about the benefits of taking a classroom program with PROJstudy, please <a href=""http://www.projstudy.com/PRINCE2-Training/courseBenefits.asp"" target=""_blank"">click here</a><br><br>We hope you have enough information to choose PROJstudy.<br><br>For any further clarification or additional information please email us at <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com</a><br><br>"&regards
'						
'						
'						Case 32
'						subject = "PROJstudy: payment options"
'						body = body & "Thank you for contacting PROJstudy.<br><br>You would be happy to note that we offer a wide range of payment options. You can choose to pay by any of the following methods: <br><br><b>Credit Card:</b> Payment can be done online either through Google Checkout or PayPal using the link <a href=""http://www.projstudy.com/payforclass.asp"" target=""_blank"">http://www.PROJstudy.com/payforclass.asp</a><br><br>OR<br><br><b>Bank Transfer:</b> Payment can be made through Bank Transfer: The details of our bank account are as follows:<br><br>Bank Name: HSBC Bank plc<br>Type of Account: Business Current Account<br> Account Name: EDUSYS SERVICES PVT LIMITED<br>Account Number: 01671855<br>Bank Sort Code: 40-05-26<br><br>After making the payment, please do remember to send us name(s) and email ID(s) of the delegate(s) as mentioned in enrolment form. In case of bank transfers, also include the Transaction ID. This will speed up the process of identifying receipts, and providing access to our pre course work.<br><br>For answers to the frequently asked questions, we request you to click - <a href=""http://www.projstudy.com/PRINCE2-Training/Faqs.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Training/Faqs.asp</a><br><br>For any further clarification or additional information please email us at <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com</a><br><br>We look forward to having you as our delegate.<br><br>"&regards
'						
'						
'						Case 33
'						subject = "Cancellation of PROJstudy PRINCE2 class from ------- to -------"
'						body = body & "This is to announce the cancellation of ------- program that was scheduled from ---------- to ----------. We have had to do this despite our best efforts to conduct the program as scheduled.<br><br>We reproduce below, our <a href=""http://www.projstudy.com/termsAndConditions.asp"" target=""_blank"">cancellation policy</a>, applicable when we cancel a classroom program,<br><br>We may cancel any particular class because of insufficient enrolments, instructor illness or force majeure events (like floods, earthquakes, political instability, etc.).<br><br>We can offer you the following options:<ol type=""1""><li>Reschedule to a future class in any location: You can opt to reschedule to a future class in any location. The amount paid for the present PROJstudy class will be applied towards the future class.</li><li>Ask for full refund: You also have the option to ask us for a full refund of your payment made towards PROJstudy Classroom Training.</li></ol><br>Please let us know whether you would like to reschedule the class or would prefer a full refund of payment made towards classroom training by sending an email to <a href="""" target=""_blank"">marketing@projstudy.com.</a> If you prefer to reschedule, let us know the location and date of the program that you would like to attend.<br><br>We apologize for this change that’s beyond our control. We look forward to having you as our delegate.<br><br>"&regards
'						
'						Case 34
'						subject = "PROJstudy – Cancellation Policy"
'						body = body & "We are in receipt of your request to cancel your enrolment.<br><br>Please be aware that cancellation attracts cancellation charges up to 100% of the program fee in certain cases. Details of cancellation fee are given later in this email.<br><br>In view of the cancellation charges, we normally encourage our delegates to reschedule rather than cancel. Although rescheduling also attracts charges, it is lower than cancellation fees. Please find below the details of our rescheduling policy for your reference,<br><br>A delegate may opt to reschedule a course after initial enrolment. Then, a rescheduling fee is charged (provided there is availability in the future course) as mentioned below:<ul><li><b>Rescheduling more than 12 days before the course commencement date:</b> Additional rescheduling fee of 15% of the course fee will be charged. (This is the minimum rescheduling fee charged if any delegate reschedules).</li><li><b>Rescheduling 5 days - 12 days before the course commencement date:</b> Additional rescheduling fee of 30% of the course fee will be charged.</li><li><b>Rescheduling within 5 days of the course commencement date:</b> Additional rescheduling fee of 40% of the course fee will be charged.</li></ul><br>You may make the payment of the applicable rescheduling fees by following the link <a href=""http://www.projstudy.com/payforclass.asp"" target=""_blank"">www.projstudy.com/payforclass.asp.</a>  Please let us know the location and date of the program that you would like to attend.<br><br>If you are still willing to cancel your enrolment, the cancellation policy is quoted below:<br><br>Course cancellation policy (if the delegate cancels his enrolment):<ul><li><b>Cancellation more than 12 days before the course commencement date</b> Cancellation fee will be 20% of the total course fee. (This is the minimum cancellation fee charged).</li><li><b>Cancellation 5 days - 12 days before the course commencement date:</b> Cancellation fee will be 40% of the course fee</li><li><b>Cancellation within 5 days of the course commencement date:</b> No money is refundable</li></ul><br>Please note that we charge cancellation fee to compensate for our fixed expenses including hotel bookings, instructor fees, etc. All refunds will be processed and payments will be made to the delegates within 30 days of receipt of a course cancellation request.<br><br>Please email <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com</a> with your final decision.<br><br>"&regards
'						
'						
'						Case 35
'						subject = "PROJstudy: Action required regarding missing details on your payment / purchase order"
'						body = body & "Please note that on ---<date when payment was received> we received a payment in the amount of---- through---- <Google checkout / PayPal / Bank transfer> (Order #<number>)<br><br>We have received a payment of £----- on -----<date> through <Google checkout / PayPal / Bank transfer> (Order #<number>). However, our records indicate that you have not enrolled for our course, nor do we have any information about any other person in respect of whom you may have made this payment. Therefore, we are unable to attach the payment to any person(s) enrolling for a course.<br><br>We urge you to respond to us at <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com</a> as follows.<ol type=""1""><li>If you have made this payment for yourself, then please enrol for our course by visiting the link <a href=""http://www.projstudy.com/PRINCE2-Courses.asp"" target=""_blank"">http://www.projstudy.com/PRINCE2-Courses.asp</a></li><li>If you have made the payment for someone else who is to attend the course, please provide us with the following information that is required to log the payment correctly:<ol type=""a""><li>First Name</li><li>Last Name</li><li>E-mail Id</li><li>Phone Number</li><li>Company</li><li>Programme Location</li><li>Programme Date</li></ol></li></ol><br>If you do not provide the information requested above, we would not be able to proceed any further with respect to your payment.<br><br>We look forward to your prompt response.<br><br>"&regards
'						
'						Case 36
'						subject = "PROJstudy: Payment declined"
'						body = body & "Our records indicate that the payment of ----< amount> remitted by you on ---< date> has been declined. As a result we are unable to confirm enrol you as a delegate for the course / program you applied for. <br><br>Please contact Google Checkout and resolve the issue. If you are unable to resolve the issue, you have the following alternatives:<ul><li>Use the link <a href=""http://www.pmstudy.com/payforclass.asp"" target=""_blank"">http://www.pmstudy.com/payforclass.asp</a>  to make the payment through our alternate payment provider - PayPal or using another card.</li><li>You can also make the payment through Bank Transfer.</li><br>The details of our bank account are as follows:<br>Bank Name: HSBC Bank plc<br>Type of Account: Business Current Account<br>Account Name: EDUSYS SERVICES PVT LIMITED<br>Account Number: 01671855<br>Bank Sort Code: 40-05-26</ul><br><br>Once payment is made, please provide us with the payment details so that we can confirm the receipt of the same.<br><br>Please note that we will be able to confirm your participation for the PROJstudy PRINCE2® program only when we receive the payment.<br><br>We thank you for your attention. We look forward to having you as our delegate.<br><br>"&regards
'						
'						
'						Case 37
'						subject = "PROJstudy: Thank you for your suggestion / feedback"
'						body = body & "We have received your ---- < method of contact, email, call, feedback form>. We thank you for your constructive feedback. We are forwarding your suggestions to the ---- < academic, technical, marketing, finance> team, which evaluates suggestions and feedback and takes relevant and appropriate actions.<br><br>We value such feedback and suggestions. We hope in future also you would reach out to us with your thoughts, suggestions and feedback.<br><br>Meanwhile, we hope you are enjoying your experience with PROJstudy. For any queries, please email us at <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com</a><br><br>"&regards
						
						
				'response.Write(body)
				End Select 
				
				body = body & "</font></td></tr></table></td></tr></table></td></tr><tr><td width=""45px"">&nbsp;</td></tr></table>"
				
				
				
				%>
<form name="one" action="./adminsendemail1.asp" method="post">
  <table border="0" cellpadding="3" cellspacing="5" width="100%">
    <tr>
      <td colspan="2">View and Send Email / Preview Again:</td>
    </tr>
    <tr>
      <td width="100px">Email Subject:</td>
      <td><input type="text" name="subject" size="80" value="<%=subject%>"></td>
    </tr>
    <tr>
      <td valign="top">Email Body:</td>
      <td>
         <input type="hidden" name="USBackoffice" value="<% = rqUSBackoffice %>" />
		<input type="hidden" name="BackofficeEmailID" value="<% = rqBackofficeEmailID %>" />
        <input type="hidden" size="50" name="payer_email" value="<%=payer_email%>">
        <input type="hidden" size="30" name="first_name" value="<%=first_name%>">
        <input type="hidden" size="30" name="last_name" value="<%=last_name%>">
        <textarea name="body" rows="30" cols="100"><%=body%></textarea>
        <BR>
        <BR>
        <input type="hidden" size="100" name="attachvalue" value="<%=attachvalue%>">
        <input type="hidden" size="3000" name="feedback" value="<%=feedback%>">
        <input type="hidden" size="50" name="country" value="<%=country%>">
       <input type="hidden" name="onemonthcourse" value="<% = OneMonthCourse %>" />

      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="Submit" Name="submitvalue" Value="SendNow">
        &nbsp;&nbsp;
        <input type="Submit" Name="submitvalue" Value="PreviewAgain"></td>
    </tr>
  </table>
</form>
<table border="0" cellpadding="5">
  <tr>
    <td colspan="2"><hr></td>
  </tr>
  <tr>
    <td colspan="2">Email as it would look when it is sent</td>
  </tr>
  <tr>
    <td width="100px">Email Subject:</td>
    <td><%=subject%></td>
  </tr>
  <tr>
    <td valign="top">Email Body:</td>
    <td><%=body%></td>
  </tr>
</table>
<%
Else If(Submitvalue="SendNow") Then

If rqUSBackoffice = "USBackoffice" Then 

'If feedback <> "" Then
'Retrive the maximum revision level of comment'

strRevLevel = "SELECT call_status1 FROM ps_callsreceived_new WHERE callid =  '" & rqCallId & "'"

	objRs.Open strRevLevel,ConnObj1

	If (Not objRs.BOF) And (Not objRs.EOF) Then 
		
	CallStatus1 = objRs("call_status1")
	
	If CallStatus1 = 1 Then
		ConnObj1.Execute "UPDATE ps_callsreceived_new SET call_status1 = '2' WHERE callid = '"& rqCallId &"'"
	End If

End If

objRs.Close

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function
'Insert the comment '

ConnObj1.Execute "INSERT INTO ps_fac_comments (f_comment, comm_addedby, callid, comm_date) VALUES ('" & StrQuoteReplace(feedback) & "','" & rqBackofficeEmailID & "','" & rqCallId & "', '"& Now() & "')"

'End If

End If


Dim objCDOMail
'Holds the CDONTS NewMail Object
'Create the e-mail server object
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'Who the e-mail is from
If rqBackofficeEmailID <> "" then
objCDOMail.From = ""&rqBackofficeEmailID&""
Else
objCDOMail.From = "adminsupport@projstudy.com"
End If
'Who the e-mail is sent to
objCDOMail.To = ""&payer_email&""
'Who the blind copies are sent to
objCDOMail.Bcc = "adminsupport@projstudy.com"
'Set the subject of the e-mail
objCDOMail.Subject = ""&subject&""
'Set the e-mail body format (0=HTML 1=Text)
objCDOMail.BodyFormat = 0
'Set the mail format (0=MIME 1=Text)
objCDOMail.MailFormat = 0
'Set the main body of the e-mail
objCDOMail.Body = ""&body&""
'Attach docs
'If attachvalue <> "" then
'        objCDOMail.AttachFile(attachvalue)
'End If
'objCDOMail.AttachFile("C:\temp\6sigmacertificate_Ramachandran_Sriram.ppt")
'Importance of the e-mail (0=Low, 1=Normal, 2=High)
objCDOMail.Importance = 2
'Send the e-mail
objCDOMail.Send
'Close the server object
Set objCDOMail = Nothing
Response.Write "Your Email - "&subject&" - has been sent"
 
If Session("UserID") <> "" Then
UserID = Session("UserID")
ElseIf rqBackofficeEmailID <> "" then
UserID = rqBackofficeEmailID
End If
feedback=Request.Form("first_name")&": "&Request.Form("Feedback")

ConnObj.Execute "Insert into queriesans(UserID, TimeofQuery, Feedback) values('"&UserID&"','"&Timeofquery&"','"&feedback&"')"
  
Else If(Submitvalue="PreviewAgain") Then
%>
<form name="one" action="./adminsendemail1.asp" method="post">
  <table border="0" cellpadding="3" cellspacing="5" width="100%">
    <tr>
      <td colspan="2">View and Send Email / Preview Again:</td>
    </tr>
    <tr>
      <td width="100px">Email Subject:</td>
      <td><input type="text" name="subject"  size="80" value="<%=subject%>"></td>
    </tr>
    <tr>
      <td valign="top">Email Body:</td>
      <td>
		 <input type="hidden" name="USBackoffice" value="<% = rqUSBackoffice %>" />
		 <input type="hidden" name="BackofficeEmailID" value="<% = rqBackofficeEmailID %>" />
        <input type="hidden" size="50" name="payer_email" value="<%=payer_email%>">
        <input type="hidden" size="30" name="first_name" value="<%=first_name%>">
        <input type="hidden" size="30" name="last_name" value="<%=last_name%>">
        <textarea name="body" rows="30" cols="100"><%=body%></textarea>
        <BR>
        <BR>
        <input type="hidden" size="100" name="attachvalue" value="<%=attachvalue%>">
        <input type="hidden" size="3000" name="feedback" value="<%=feedback%>">
        <input type="hidden" size="50" name="country" value="<%=country%>">
        <input type="hidden" name="onemonthcourse" value="<% = OneMonthCourse %>" />
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="Submit" Name="submitvalue" Value="SendNow">
        &nbsp;&nbsp;
        <input type="Submit" Name="submitvalue" Value="PreviewAgain"></td>
    </tr>
  </table>
</form>
<table border="0" cellpadding="5">
  <tr>
    <td colspan="2"><hr></td>
  </tr>
  <tr>
    <td colspan="2">Email as it would look when it is sent</td>
  </tr>
  <tr>
    <td width="100px">Email Subject:</td>
    <td><%=subject%></td>
  </tr>
  <tr>
    <td valign="top">Email Body:</td>
    <td><%=body%></td>
  </tr>
</table>
<%End If
End If
End If

%>



<!--#include virtual="/includes/connectionClose.asp"-->
<!--#include virtual="/includes/connectionClose_global.asp"-->

</body>
</html>
