<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerindustryrecognizedbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/metatags/index_metatag.html"-->
 <!-- Body Starts -->
  <div>
  	<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="235" align="left" valign="top" bgcolor="#FFFFFF">
				<table width="100%" border="0" cellspacing="0" cellpadding="8">

                  <tr>
                    <td width="2%" class="Header">&nbsp;</td>
                    <td width="25%" class="PageTitle">&nbsp;</td>
                    <td width="73%" class="PageTitle">Student Enrollment</td>
                  </tr>
                  <tr>
					<!--#include virtual="/includes/innerLeftMenu.asp"-->
                    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
					<div style="margin-top:-12px;">
					<!-- Content Start From Here-->
		  				<%

		  				Dim sIPAddress1

						sIPAddress1 = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
						If sIPAddress1="" Then sIPAddress1 = Request.ServerVariables("REMOTE_ADDR")%>
						<%
						Dim first_name, last_name, payer_email
						Dim pass, cpass, verify_sign, item_number, item_name
						Dim date_entered, date_valid, kno_passed, dateVal
						Dim rsQues, rsQues1,strString,rqAction

						' assign posted variables to local variables
						first_name = Request.Form("first_name")
						last_name = Request.Form("last_name")
						payer_email = Request.Form("payer_email")
						Audio = Request.Form("audio")
						Dietary = Request.Form("dietary")
						Mobility = Request.Form("mobility")
						ReaORWrit = Request.Form("reaORwrit")
						Other =Replace(Request.Form("other"),"'","''")
						pass = Request.Form("pass")
						cpass = Request.Form("cpass")
						verify_sign = Request.Form("verify_sign")
						item_name = Request.Form("item_name")
						item_number = Request.Form("item_number")
						custom = Request.Form("custom")
						ebay_address_id = Request.Form("ebay_address_id")
						course_proc = Request.Form("course_proc")
						course_desc = Request.Form("course_desc")
						APMG=Request.Form("APMG")
						rqAction = request.QueryString("action")
						Country = trim(Request.Form("address_country"))
						dateVal = request.Form("date_Val")
						
						'Country retrived from customerdetails page'
						If Request.Form("address_country") <> "" Then
						Session("CountryOrigin") = Request.Form("address_country")
						Else
						Session("CountryOrigin") = Session("CountryOrigin")
						End If
						
						'response.Write(Session("CountryOrigin"))
						
					'	If APMG = "Foundation" Then
'							PMIPDU = "25"
'							beltType = "Foundation"
'						ElseIf APMG = "Practitioner" Then
'							PMIPDU = "55"
'							beltType = "Practitioner"
'					
'						End If
'						
						
						'If item_number = "101" Then
'						
'							strPre = "Pre-requisites for PRINCE2<sup>&reg;</sup> Foundation Exam: General Project Management training is ideal before attempting the Foundation Exam."
'							
'						ElseIf item_number = "102" Then
'							
'							strPre = "Pre-requisites for PRINCE2<sup>&reg;</sup> Practitioner Exam: Students should pass the Prince2 Foundation exam before they can take the Practitoner course."
'							
'						
'						ElseIf item_number = "103" Then
'						
'							strPre = "Pre-requisites for PRINCE2<sup>&reg;</sup> Exam: General Project Management training is ideal before attempting the Foundation Exam. <br><br> Students should pass the Prince2 Foundation exam before they can take the Practitoner course."
						
						If item_number = "110" Then
						
							strPre = "You are expected to read through the study guides provided and follow the simple steps to complete the Pre-preparatory course. This will ensure that you are fully prepared for the PRINCE2 Classroom Course. For details on what will be covered during the 5 day comprehensive Classroom Course, please <a href=""http://www.projstudy.com/course-syllabus.asp"" target=""_blank"">click here</a>."
							
						End If
						
						Set objRs = Server.CreateObject("ADODB.Recordset")
			
						strQuery = "SELECT TOP 1 id FROM PaypalDB WHERE payer_email='"&payer_email&"' ORDER BY id DESC"
						objRs.open strQuery,ConnObj
						
						If Not objRs.EOF Then
							payer_id = objRs("id")
						End If
						
						objRs.Close
						
						
							   

						Select Case item_name
							Case "Free Trial - Test 1"
			'Response.Write("I am in 005")
			                  
							    'Generating default/random password for logged in users'
							  Dim pChar, pCount
							   
							 ' Here you can add other characters such as lowercase or special.
							   pChar = "ABCDEFGHIJKLMNPQRSTUVWXYZ@#$&0123456789"
							   
							   pCount = Len(pChar) 
							   
							   Dim psw
							   psw = "APMG"
							   
							   Randomize
							   For i = 1 To 6 ' password length
								  psw = psw & Mid( pChar, 1 + Int(Rnd * pCount), 1 )
								  pass=psw
							   Next
							   
							   
								date_entered=Date()
								date_valid=Date()+2
								Application("usersfree")=Application("usersfree")+1
								Application("count")=Application("count")+1
								
								strEmailID = "SELECT top 1 payer_email, first_name, last_name, item_name, date_valid, paypal_address_id FROM PaypalDb WHERE payer_email = '"&payer_email&"' ORDER BY id desc"

						objRs.Open strEmailID,ConnObj
						
						Do Until objRs.EOF 
						
							dateValid = objRs("date_valid")
							firstName = objRs("first_name")
							lastName  = objRs("last_name")
							Course    = objRs("paypal_address_id")
							itemName  = objRs("item_name")
							pEmail    = objRs("payer_email")
						
						objRs.Movenext
						Loop
						objRs.Close
						
						If(CDate(dateValid)-(Date())>=0) then
						
						Session("First_Name") = first_name
						Session("Last_Name") = last_name
						Session("Custom") = custom
						Session("PhoneNo") = ebay_address_id
						Session("ItemName") =  item_name
						Session("ItemNumber") = item_number
						Session("APMG") = APMG
						
						%>
						<br>Dear <% = firstName %>&nbsp;<% = lastName %><br />
						Email ID: <% = pEmail %><br /><br />
						You are already enrolled in "<% = Course %> &nbsp; <% = itemName %>" which is valid till "<% = FormatDateTime(dateValid,1) %>"<br /><br />
						So, please use another email address to enroll in the understand <% = APMG %> test.<br /><br />
						<a href="PRINCE2-Online-Courses.asp">Please click here to enroll in understand <% = APMG %> test</a>
						
						<%
						Else

								
							MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>  Welcome to ITILstudy.com - the Comprehensive, Effective and Economical courses for PRINCE2<sup>&reg;</sup> Certification. We are glad to have you as a Student in our course. <BR><BR> You will have access to - PROJstudy.com PRINCE2 Foundation Simulated test 1 (75 questions) for 2 days<BR><BR> Please use these details to log into PROJstudy.com (<a href=http://www.PROJstudy.com/memberlogin.asp>http://www.PROJstudy.com/memberlogin.asp</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br><b>Important Links:</b><br><br><b>PROJstudy Free Resources:</b> PROJstudy offers many free resources like Foundation Simulated Practice test, chapter test, study guides and Podcasts to enable the delegates to get a feel for the PROJstudy course content. For more details about our free resources , please visit <a href=""http://www.PROJstudy.com/freeresources/freeSimulatedTest.asp""(http://projstudy.com/freeresources/freeSimulatedTest.asp)</a><BR><BR><b>Understanding PROJstudy.com Foundation Simulated Tests:</b> please read before taking the test -Details: <a href=""http://www.PROJstudy.com/freeresources/practicetest1.asp"" target =""_blank"" >(http://www.PROJstudy.com/freeresources/practicetest1.asp)</a><br><br><b>Next Steps after PROJstudy.com Free Foundation Simulated Test:</b> Based on your score in the Free Foundation Simulated Test, here are some recommended next steps ( http://www.PROJstudy.com/nextsteps.asp ). <br><br><b>Please Note:</b> PROJstudy.com is the Most Economical and Most Effective <a href=""http://www.apmg-international.com/AccreditedOrganisations/EdusysServices-UK.asp"" target=""_blank"">Accredited Training Organizations (ATO)</a> accredited by APM Group, UK to prepare you for your PRINCE2 Certification Exams.<br><br><b>You can choose from the list of courses available in PROJstudy.com:</b><a href=""http://www.PROJstudy.com/PRINCE2-Online-Courses.asp"" target =""_blank"" >(http://www.PROJstudy.com/PRINCE2-Online-Courses.asp)</a><br><br>If you require additional guidance you can always attend our PRINCE2 classroom programs at a location near you. For more details <a href=http://www.PROJstudy.com/dates_location.asp>click here</a><br><br>We hope you will enjoy your experience with PROJstudy.com.<br><br>For queries, please email us at adminsupport@projstudy.com we always look forward to your feedback and suggestions.<br><br>Best Regards, <br><br>Customer Support,<BR>www.PROJstudy.com<BR>Email: <a href=""mailto: adminsupport@projstudy.com"">adminsupport@projstudy.com</a>"
								MessageSubject="Welcome to www.PROJstudy.com ( "&first_name&" "&last_name&" )"	
								
								
								Dim objHtp1, strQuery2
								strQuery2 = "http://geoip1.maxmind.com/b?l=4tAUhyTgUD6d" & _
									"&i=" & sipaddress1
								set objHtp1 = Server.CreateObject("Msxml2.ServerXMLHTTP")
								objHtp1.open "GET", strQuery2, false
								objHtp1.send
								sipAddress1 = sipAddress1 + ";" + objHtp1.ResponseText


								ConnObj.Execute "INSERT INTO PaypalDB (paypal_address_id, item_name,item_number, payer_email,first_name, last_name, date_entered, date_valid, pass, custom, ebay_address_id, address_owner, audio, dietary, other, mobility, readingORwriting,address_country) VALUES( '"&APMG&"','"&item_name&"','"&item_number&"','"&payer_email&"','"&first_name&"','"&last_name&"','"&date_entered&"','"&date_valid&"','"&pass&"','"&custom&"','"&ebay_address_id&"', '"&sIPAddress1&"','"&Audio&"', '"&Dietary&"', '"&Other&"', '"&Mobility&"', '"&ReaORWrit&"','"&Session("countryorigin")&"')"

								Set objHtp1 = Nothing
								
							
					%>
					<BR>
					Please use these details to log into PROJstudy.com (<a href="/memberlogin.asp"> member login</a>)<BR><BR> <b>UserId:</b> <%=payer_email%><BR><b>Password:</b><%=pass%><br>
				
					
                     <%End If
							
						%>
                          <%   Case "Understand PRINCE2 Exam"
								
								 'Generating default/random password for logged in users'
							  Dim pChar1, pCount1
							   
							 ' Here you can add other characters such as lowercase or special.
							   pChar1 = "ABCDEFGHIJKLMNPQRSTUVWXYZ@#$&0123456789"
							   
							   pCount1 = Len(pChar1) 
							   
							   Dim psw1
							   psw1 = "APMG"
							   
							   Randomize
							   For i = 1 To 6 ' password length
								  psw1 = psw1 & Mid( pChar1, 1 + Int(Rnd * pCount1), 1 )
								  pass1=psw1
							   Next
							   
							    
						date_entered=Date()
						date_valid=Date()+2
						Application("usersfree")=Application("usersfree")+1

						strEmailID = "SELECT top 1 payer_email, first_name, last_name, item_name, date_valid, paypal_address_id FROM PaypalDb WHERE payer_email = '"&payer_email&"' ORDER BY id desc"

						objRs.Open strEmailID,ConnObj
						
						Do Until objRs.EOF 
						
							dateValid = objRs("date_valid")
							firstName = objRs("first_name")
							lastName  = objRs("last_name")
							Course    = objRs("paypal_address_id")
							itemName  = objRs("item_name")
							pEmail    = objRs("payer_email")
						
						objRs.Movenext
						Loop
						objRs.Close
						
						If(CDate(dateValid)-(Date())>=0) then
						
						Session("First_Name") = first_name
						Session("Last_Name") = last_name
						Session("Custom") = custom
						Session("PhoneNo") = ebay_address_id
						Session("ItemName") =  item_name
						Session("ItemNumber") = item_number
						Session("APMG") = APMG
						
						%>
						<br>Dear <% = firstName %>&nbsp;<% = lastName %><br /><br />
						Email ID: <% = pEmail %><br /><br />
						You are already enrolled in "<% = Course %> &nbsp; <% = itemName %>" which is valid till "<% = FormatDateTime(dateValid,1) %>"<br /><br />
						So, please use another email address to enroll in the understand <% = APMG %> test.<br /><br />
						<a href="PRINCE2-Online-Courses.asp">Please click here to enroll in understand <% = APMG %> test</a>
						
						<%
						Else
	
								
								MessageBody = "Dear "&first_name&" "&last_name&", <BR><BR>Welcome to PROJstudy.com - the Comprehensive, Effective and Economical courses for PRINCE2<sup>&reg;</sup> Certification. We are glad to have you as a Student in our course.<br><br>You will have access to - PROJstudy.com PRINCE2 Foundation Exam Prep: (15 questions) for 2 days<br><br>Please use these details to log into PROJstudy.com <a href=""http://www.PROJstudy.com/memberlogin.asp"">(http://www.PROJstudy.com/memberlogin.asp)</a><br><br>UserId: "&payer_email&"<br>Password: "&pass1&"<br><br><b>Important Links :</b><br><br><b>PROJstudy Free Resources:</b> PROJstudy offers many free resources like Foundation Simulated Practice test, chapter test, study guides and Podcasts to enable the delegates to get a feel for the PROJstudy course content. For more details about our free resources , please visit <a href=""http://www.PROJstudy.com/freeresources/freeSimulatedTest.asp""(http://projstudy.com/freeresources/freeSimulatedTest.asp)</a><BR><BR><b>Understanding PROJstudy.com Foundation Simulated Tests:</b> please read before taking the test - Details: <a href=""http://www.PROJstudy.com/freeresources/practicetest1.asp"">http://www.PROJstudy.com/freeresources/practicetest1.asp</a> <BR><BR>- Additional Tips on preparing for and appearing in PRINCE2 Certification Exams<BR><BR>- <b>Next Steps after PROJstudy.com Free Simulated Practice Test :</b> Based on your score in the FreeFoundation Simulated Test, here are some recommended next steps( <a href=""http://www.PROJstudy.com/nextsteps.asp"">http://www.PROJstudy.com/nextsteps.asp</a> ). <BR><BR><b>Please Note: </b>PROJstudy.com is the Most Economical and Most Effective<a href=""http://www.apmg-international.com/AccreditedOrganisations/EdusysServices-UK.asp"" target=""_blank""> Accredited Training Organizations (ATO)</a> accredited by APM Group, UK to prepare you for your PRINCE2 Certification Exams.<BR><BR><b>You can choose from the list of courses available in PROJstudy.com:</b> <a href=""http://www.PROJstudy.com/PRINCE2-Online-Courses.asp"" target =""_blank"">(http://www.PROJstudy.com/PRINCE2-Online-Courses.asp)</a><br><br>If you require additional guidance you can always attend our PRINCE2 classroom programs at a location near you. For more details <a href=http://www.PROJstudy.com/dates_location.asp>click here</a><BR><BR>We hope you will enjoy your experience with PROJstudy.com.<BR><BR>For queries, please email us at  <a href=""mailto: adminsupport@projstudy.com"">adminsupport@projstudy.com</a> we always look forward to your feedback and suggestions.<BR><BR>Best Regards.<BR>Customer Support<BR><a href=""http://www.PROJstudy.com"">www.PROJstudy.com</a><BR><a href=""mailto: adminsupport@projstudy.com"">adminsupport@projstudy.com</a><BR><BR>"


						MessageSubject = "PROJstudy.com Understanding Simulated Test (15 questions) for 2 days"
								
								Application("count")=Application("count")+1

					
					strQuery2 = "http://geoip1.maxmind.com/b?l=4tAUhyTgUD6d" & _
						"&i=" & sipaddress1
					set objHtp1 = Server.CreateObject("Msxml2.ServerXMLHTTP")
					objHtp1.open "GET", strQuery2, false
					objHtp1.send
					sipAddress1 = sipAddress1 + ";" + objHtp1.ResponseText


					ConnObj.Execute "INSERT INTO PaypalDB (paypal_address_id, item_name, item_number, payer_email, first_name, last_name, date_entered, date_valid, pass, custom, ebay_address_id, address_owner,address_country ) VALUES( '"&APMG&"','"&item_name&"','"&item_number&"','"&payer_email&"','"&first_name&"','"&last_name&"','"&date_entered&"','"&date_valid&"','"&pass1&"','"&custom&"','"&ebay_address_id&"', '"&sIPAddress1&"', '"&Session("countryorigin")&"')"

					Set objHtp1 = Nothing
					%>
					<BR>
					Please use these details to log into PROJstudy.com (<a href="/memberlogin.asp"> member login</a>)<BR><BR> <b>UserId:</b> <%=payer_email%><BR><b>Password:</b><%=pass1%><br>
				
					
                     <%End If%>
                  
						<%
							Case "Overview of PROJstudy"
							
								
 
 								ConnObj.Execute "UPDATE PaypalDB SET first_name = '"&first_name&"', last_name = '"&last_name&"', custom='"&custom&"', ebay_address_id='"&ebay_address_id&"', audio = '"&Audio&"', dietary = '"&Dietary&"', other = '"&Other&"' WHERE id ='"&payer_id&"'"
									
									
MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to <a href=""http://www.PROJstudy.com"">PROJstudy.com</a> - your partner in learning for securing APMG Foundation and Practitioner Certification. We are glad to have you as our student. We are happy to inform you that you will earn 3 free PDUs on completion of our “Overview of APMG study” course.<BR><BR>You now have access to: “Overview of APMG study” – 2 weeks course<BR><BR>Please use the following details to log on to <a href=""http://www.PROJstudy.com"">PROJstudy.com</a> <a href=""http://www.PROJstudy.com/memberlogin.asp""> member login</a>:<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<BR><BR>DETAILED PROCEDURE FOR STUDYING OVERVIEW OF APMG STUDY COURSE:<BR><BR>The procedure that you should ideally follow while studying for this course is mentioned below: <BR><ol><li>Read the comprehensive study guide. </li><li>Answer the Evaluation Test (there will be 25 questions, which will stimulate your understanding of the concepts in this section) and pass. </li><li>Earn 3 PDUs.</li></ol>We trust that you will find your association with us fruitful and rewarding.  <BR><BR>If you have any queries, please email us at <a href=""mailto: adminsupport@projstudy.com"">adminsupport@projstudy.com</a>. We look forward to your feedback and suggestions.<BR><BR>Best Regards.<BR>Customer Support<BR><a href=""http://www.PROJstudy.com"">www.PROJstudy.com</a><BR><a href=""mailto: adminsupport@projstudy.com"">adminsupport@projstudy.com</a><BR><BR>"
								
								MessageSubject="Welcome to www.PROJstudy.com ( "&first_name&" "&last_name&" )"
									
							Case else
					'Response.Write("I am in 006")
								


								ConnObj.Execute "UPDATE PaypalDB SET first_name = '"&first_name&"', last_name = '"&last_name&"', custom='"&custom&"', ebay_address_id='"&ebay_address_id&"',audio = '"&Audio&"', dietary = '"&Dietary&"', other = '"&Other&"', mobility = '"&Mobility&"', readingORwriting = '"&ReaORWrit&"' WHERE id ='"&payer_id&"'"
									
							'If item_number = "101"  Then
'							
'								MessageBody="Dear "&first_name&" "&last_name&", <BR><BR> Welcome to PROJstudy.com - the Most Economical and Most Effective Accredited Training Organisation for your PRINCE2<sup>&reg;</sup> Foundation Certification. We are glad to have you as a delegate in our course. <BR><BR> You will have access "
'								If dateVal <> "" Then 
'								MessageBody=MessageBody & " to PROJstudy Foundation (Online) till "&formatdatetime(dateVal,1)&""
'								Else
'								MessageBody=MessageBody & " to "&course_desc&""
'								End iF
'								MessageBody=MessageBody & " <BR><BR> Please use these details to log into PROJstudy.com (<a href=http://www.PROJstudy.com/memberlogin.asp>http://www.PROJstudy.com/memberlogin.asp</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br><b>DETAILED PROCEDURE OF STUDYING FOR PROJSTUDY.COM PRINCE2 FOUNDATION COURSE:</b><br><br>The whole <a href=""http://www.projstudy.com"" target=""_blank"">PROJstudy.com</a> course is divided into 19 chapters.<br><a href=""http://projstudy.com/course-syllabus.asp"" target=""_blank"">(http://projstudy.com/course-syllabus.asp)</a> - PROJstudy will help you become an expert in each of the chapters followed by full length simulated practice tests.<br><br>The procedure that you should ideally follow while studying for PROJstudy PRINCE2 Foundation courses is mentioned below:<a href=""http://projstudy.com/methodology/tour.asp"" target=""_blank"">(http://projstudy.com/methodology/tour.asp )</a>.<ul type=""1""><li><b>Study the PRINCE2 Manual:</b> Before you start the PROJstudy PRINCE2 online course, it is strongly recommended to go through the PRINCE2 Manual and understand the basic themes, processes and Principles used as per the PRINCE2 methodology.</li><li><b>Study the Chapter guides available at PROJstudy.com:</b> For a thorough understanding of the PRINCE2 concepts, themes, processes and principles, study exclusive PROJstudy study guides <a href=""http://www.projstudy.com/Foundation/guidesIndex.asp"" target=""_blank"">(http://www.projstudy.com/Foundation/guidesIndex.asp)</a></li><li><b>Complete the exercises at the end of each chapter:</b> For helping the delegates to practice what they have studied through the PROJstudy study guides and PRINCE2 Manual, our course includes various exercises such as evaluation tests, simulation tests, etc. </li><li><b>Take the Chapter Tests for each chapter:</b> Our online courses include Chapter tests which examine the delegate’s understanding of PRINCE2 concepts and reinforce the same through extensive justifications. <a href=""http://www.projstudy.com/Foundation/chapterTestsIndex.asp"" target=""_blank"">(http://www.projstudy.com/Foundation/chapterTestsIndex.asp)</a></li><li><b>Take a full length sample test from APMG:</b> To get a feel of the actual PRINCE2 Foundation exam, take the APMG's full length sample tests as part of our online courses and assess your responses with the provided answers to the same. <a href=""http://www.projstudy.com/practiceQues-Found.asp"" target=""_blank"">(http://www.projstudy.com/practiceQues-Found.asp)</a></li><li>You are ready to take the PRINCE2 Foundation Certification Exam.</li></ul><br>Please Note: Additional Tips on preparing for and appearing in PRINCE2 Certification Exams : <a href=""http://www.projstudy.com/nextSteps.asp"" target=""_blank"">http://www.projstudy.com/nextSteps.asp</a>.<br><br>If you require additional guidance you can always attend our PRINCE2 classroom programs at a location near you. For more details <a href=http://www.PROJstudy.com/dates_location.asp>click here</a><br><br>We hope you will enjoy your experience with PROJstudy.com. <br>For queries, please email us at <a href=""mailto:adminsupport@PROJstudy.com"">adminsupport@PROJstudy.com</a> : we always look forward to your feedback and suggestions.<BR><BR>Best Regards,<br><a href = ""http://www.PROJstudy.com/"" target=""_blank"">www.PROJstudy.com</a><BR>(APMG Approved ATO)<br>Email: <a href=""mailto: adminsupport@projstudy.com"">adminsupport@projstudy.com</a>"
'								MessageSubject="Welcome to www.PROJstudy.com ( "&first_name&" "&last_name&" )"
'								
'								ElseIf item_number = "102" Then
'								
'								MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to PROJstudy.com - the Best Priced and the Most Effective Education Provider to get you prepared for PRINCE2<sup>&reg;</sup> Practitioner Certification. We are glad to have you as a delegate in our course.<BR><BR> You will have access "
'								If dateVal <> "" Then 
'								MessageBody=MessageBody & " to PROJstudy Practitioner (Online) till "&formatdatetime(dateVal,1)&""
'								Else
'								MessageBody=MessageBody & " to "&course_desc&""
'								End iF
'								MessageBody=MessageBody & " <BR><BR> Please use these details to log into PROJstudy.com (<a href=http://www.PROJstudy.com/memberlogin.asp>http://www.PROJstudy.com/memberlogin.asp</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br><b>DETAILED PROCEDURE OF STUDYING FOR PROJSTUDY.COM PRINCE2 PRACTITIONER COURSE:</b><br><br>The whole <a href=""http://www.projstudy.com"" target=""_blank"">PROJstudy.com</a> course is divided into 19 chapters.<br><a href=""http://projstudy.com/course-syllabus.asp"" target=""_blank"">(http://projstudy.com/course-syllabus.asp)</a> - PROJstudy will help you become an expert in each of the chapters followed by full length simulated practice tests.<br><br>The procedure that you should ideally follow while studying for PROJstudy PRINCE2 Practitioner courses is mentioned below:<a href=""http://projstudy.com/methodology/tour1.asp"" target=""_blank"">(http://projstudy.com/methodology/tour1.asp)</a>.<ul type=""1""><li><b>Study the PRINCE2 Manual:</b> PROJstudy strongly recommended that the delegates go through the PRINCE2 Manual and understand the basic themes, processes and Principles used as per the PRINCE2 methodology before they listen to the PROJstudy podcasts.</li><li><b>Study the Chapter guides available at PROJstudy.com:</b>For a thorough understanding of the PRINCE2 concepts, themes, processes and principles, study exclusive PROJstudy study guides and read the Appendices A, C and E thoroughly.</li><li><b>Answer the APMG Case Study 1:</b> Students should answer the 'APMG Case Study I-Calendar Project' using the PRINCE2 Manual and the course material provided by PROJstudy.</li><li><b>Answer the APMG Case Study 2:</b>Students should answer the ‘APMG Case Study II-Restructuring Project' using the PRINCE2 Manual only.</li><li>You are ready to take the PRINCE2 Practitioner Certification Exam.</li></ul><br>Please Note: Additional Tips on preparing for and appearing in PRINCE2 Certification Exams : <a href=""http://www.projstudy.com/nextSteps.asp"" target=""_blank"">http://www.projstudy.com/nextSteps.asp</a>.<br><br>If you require additional guidance you can always attend our PRINCE2 classroom programs at a location near you. For more details <a href=http://www.PROJstudy.com/dates_location.asp>click here</a><br><br>We hope you will enjoy your experience with PROJstudy.com. <br>For queries, please email us at <a href=""mailto:adminsupport@PROJstudy.com"">adminsupport@PROJstudy.com</a> : we always look forward to your feedback and suggestions.<BR><BR>Best Regards, <br><a href = ""http://www.PROJstudy.com/"" target=""_blank"">www.PROJstudy.com</a><BR>(APMG Approved ATO)<br>Email: <a href=""mailto: adminsupport@projstudy.com"">adminsupport@projstudy.com</a>"
'								MessageSubject="Welcome to www.PROJstudy.com ( "&first_name&" "&last_name&" )"
'								
'								ElseIf item_number = "103" Then
'								
'									MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>  Welcome to PROJstudy.com - the Most Economical and Most Effective Education Provider to get you prepared for PRINCE2 Foundation Certification. We are glad to have you as a student in our course. <BR><BR> You will have access  "
'								If dateVal <> "" Then 
'								MessageBody=MessageBody & " to PROJstudy Foundation and Practitioner (Online) till "&formatdatetime(dateVal,1)&""
'								Else
'								MessageBody=MessageBody & " to "&course_desc&""
'								End iF
'								MessageBody=MessageBody & "<BR><BR> Please use these details to log into PROJstudy.com (<a href=http://www.PROJstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>We hope you will enjoy your experience with PROJstudy.com. For queries, please email us at <a href=""mailto:adminsupport@PROJstudy.com"">adminsupport@PROJstudy.com</a> : we always look forward to your feedback and suggestions.<br><br>If you require additional guidance you can always attend our PRINCE2 classroom programs at a location near you. For more details <a href=http://www.PROJstudy.com/dates_location.asp>click here</a><br><br>Note:- Kindly note that by enrolling to our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details <a href=""http://www.projstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.PROJstudy.com/"" target=""_blank"">www.PROJstudy.com</a><BR>Email: <a href=""mailto: adminsupport@projstudy.com"">adminsupport@projstudy.com</a>"
'								MessageSubject="Welcome to www.PROJstudy.com ( "&first_name&" "&last_name&" )"
'								
								If item_number = "110" Then
								
									MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to PROJstudy.com - the Most Reliable and Cost Effective Education Provider to get you prepared for the PRINCE2<sup>&reg;</sup> Foundation Certification. We are glad to have you as a delegate in our course. <BR><BR>You will have access to: PROJstudy Foundation Pre-Prep Course which is a one Month Course.<BR><BR> Please use these details to log into PROJstudy.com (<a href=http://www.PROJstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>For your convenience we have also provided the study guides in PDF, Flash and Podcast, so that you can listen to them through your I-Phone or I-Pad at your leisure.<br><br>We hope you will enjoy your experience with PROJstudy.com. For queries, please email us at <a href=""mailto:adminsupport@PROJstudy.com"">adminsupport@PROJstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling to our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.projstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.PROJstudy.com/"" target=""_blank"">www.PROJstudy.com</a><BR>Email: <a href=""mailto: adminsupport@projstudy.com"">adminsupport@projstudy.com</a>"
								MessageSubject="Welcome to www.PROJstudy.com ( "&first_name&" "&last_name&" )"
								
								
								ElseIf item_number = "006" OR item_number = "007" OR item_number = "008" OR item_number = "009" Then
								'response.Write("006")
								MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>  Welcome to PROJstudy.com - the Comprehensive, Effective and Economical courses for PRINCE2<sup>&reg;</sup> Certification. We are glad to have you as a Student in our course. <BR><BR> You will have access to - "&course_desc&" <BR><BR> Please use these details to log into PROJstudy.com (<a href=http://www.PROJstudy.com/memberlogin.asp>http://www.PROJstudy.com/memberlogin.asp</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br><b>Important Links:</b><br><br><b>PROJstudy Free Resources:</b> PROJstudy offers many free resources like Foundation Simulated Practice test, chapter test, study guides and Podcasts to enable the delegates to get a feel for the PROJstudy course content. For more details about our free resources , please visit <a href=""http://www.PROJstudy.com/freeresources/freeSimulatedTest.asp""(http://projstudy.com/freeresources/freeSimulatedTest.asp)</a><BR><BR><b>Understanding PROJstudy.com Foundation Simulated Tests:</b> please read before taking the test -Details: <a href=""http://www.PROJstudy.com/freeresources/practicetest1.asp"" target =""_blank"" >(http://www.PROJstudy.com/freeresources/practicetest1.asp)</a><br><br><b>Next Steps after PROJstudy.com Free Foundation Simulated Test:</b> Based on your score in the Free Foundation Simulated Test, here are some recommended next steps ( http://www.PROJstudy.com/nextsteps.asp ). <br><br><b>Please Note:</b> PROJstudy.com is the Most Economical and Most Effective <a href=""http://www.apmg-international.com/AccreditedOrganisations/EdusysServices-UK.asp"" target=""_blank"">Accredited Training Organizations (ATO)</a> accredited by APM Group, UK to prepare you for your PRINCE2 Certification Exams.<br><br><b>You can choose from the list of courses available in PROJstudy.com:</b><a href=""http://www.PROJstudy.com/PRINCE2-Online-Courses.asp"" target =""_blank"" >(http://www.PROJstudy.com/PRINCE2-Online-Courses.asp)</a><br><br>If you require additional guidance you can always attend our PRINCE2 classroom programs at a location near you. For more details <a href=http://www.PROJstudy.com/dates_location.asp>click here</a><br><br>We hope you will enjoy your experience with PROJstudy.com.<br><br>For queries, please email us at adminsupport@projstudy.com we always look forward to your feedback and suggestions.<br><br>Best Regards, <br><br>Customer Support,<BR>www.PROJstudy.com<BR>Email: <a href=""mailto: adminsupport@projstudy.com"">adminsupport@projstudy.com</a>"
								MessageSubject="Welcome to www.PROJstudy.com ( "&first_name&" "&last_name&" )"	
								
							'	ElseIf item_number = "107"  Then
'							
'								MessageBody="Dear "&first_name&" "&last_name&", <BR><BR> Welcome to PROJstudy.com - the Most Economical and Most Effective Accredited Training Organisation for your PRINCE2<sup>&reg;</sup> Foundation & Practitioner Certification (Blended Course). We are glad to have you as a delegate in our course. <BR><BR> You will have access"
'								If dateVal <> "" Then 
'								MessageBody=MessageBody & " till "&formatdatetime(dateVal,1)&"."
'								Else
'								MessageBody=MessageBody & " to "&course_desc&"."
'								End iF
'								MessageBody=MessageBody & " Within the 3 months, the delegate will have to appear in the Foundation Exam with PROJstudy. Please intimate PROJstudy at least 2 weeks before your scheduled exam date. <br><br> The next two days after the Foundation Exam will be for Practitioner classroom Training. At the end of the second day, the delegate will have to take the Practitioner Exam.<br><br> Please use these details to log into PROJstudy.com (<a href=http://www.PROJstudy.com/memberlogin.asp>http://www.PROJstudy.com/memberlogin.asp</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><b>DETAILED PROCEDURE OF STUDYING FOR PROJSTUDY.COM PRINCE2 FOUNDATION COURSE:</b><br><br>The whole <a href=""http://www.projstudy.com"" target=""_blank"">PROJstudy.com</a> course is divided into 19 chapters.<br><a href=""http://projstudy.com/course-syllabus.asp"" target=""_blank"">(http://projstudy.com/course-syllabus.asp)</a> - PROJstudy will help you become an expert in each of the chapters followed by full length simulated practice tests.<br><br>The procedure that you should ideally follow while studying for PROJstudy PRINCE2 Foundation courses is mentioned below:<a href=""http://projstudy.com/methodology/tour.asp"" target=""_blank"">(http://projstudy.com/methodology/tour2.asp )</a>.<ul type=""1""><li><b>Study the PRINCE2 Manual:</b> Before you start the PROJstudy PRINCE2 online course, it is strongly recommended to go through the PRINCE2 Manual and understand the basic themes, processes and Principles used as per the PRINCE2 methodology.</li><li><b>Study the Chapter guides available at PROJstudy.com:</b> For a thorough understanding of the PRINCE2 concepts, themes, processes and principles, study exclusive PROJstudy study guides <a href=""http://www.projstudy.com/Foundation/guidesIndex.asp"" target=""_blank"">(http://www.projstudy.com/Foundation/guidesIndex.asp)</a></li><li><b>Complete the exercises at the end of each chapter:</b> For helping the delegates to practice what they have studied through the PROJstudy study guides and PRINCE2 Manual, our course includes various exercises such as evaluation tests, simulation tests, etc. </li><li><b>Take the Chapter Tests for each chapter:</b> Our online courses include Chapter tests which examine the delegate’s understanding of PRINCE2 concepts and reinforce the same through extensive justifications. <a href=""http://www.projstudy.com/Foundation/chapterTestsIndex.asp"" target=""_blank"">(http://www.projstudy.com/Foundation/chapterTestsIndex.asp)</a></li><li><b>Take a full length sample test from APMG:</b> To get a feel of the actual PRINCE2 Foundation exam, take the APMG's full length sample tests as part of our online courses and assess your responses with the provided answers to the same. <a href=""http://www.projstudy.com/practiceQues-Found.asp"" target=""_blank"">(http://www.projstudy.com/practiceQues-Found.asp)</a></li><li>You are ready to take the PRINCE2 Foundation Certification Exam.</li></ul><br>Please Note: Additional Tips on preparing for and appearing in PRINCE2 Certification Exams : <a href=""http://www.projstudy.com/nextSteps.asp"" target=""_blank"">http://www.projstudy.com/nextSteps.asp</a>.<br><br>To check the Foundation Exam Dates, at a location near you, <a href=""http://www.projstudy.com/dates_location.asp"" target=""_blank"">Click Here</a><br><br>We hope you will enjoy your experience with PROJstudy.com. <br>For queries, please email us at <a href=""mailto:adminsupport@PROJstudy.com"">adminsupport@PROJstudy.com</a> : we always look forward to your feedback and suggestions.<BR><BR>Best Regards,<br><a href = ""http://www.PROJstudy.com/"" target=""_blank"">www.PROJstudy.com</a><BR>(APMG Approved ATO)<br>Email: <a href=""mailto: adminsupport@projstudy.com"">adminsupport@projstudy.com</a>"
'								
									
								ElseIf item_number = "101"  Then
							
								MessageBody="Dear "&first_name&" "&last_name&", <BR><BR> Welcome to ITILstudy.com - the Most Economical and Most Effective Accredited Training Organisation for your ITIL v3 Foundation Course. Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp>http://www.ITILstudy.com/memberlogin.asp</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>We hope you will enjoy your experience with ITILstudy.com. <br>For queries, please email us at <a href=""mailto:adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a> : we always look forward to your feedback and suggestions.<BR><BR>Best Regards,<br><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><br>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								
								End If
						
						 'response.Write(MessageBody)
						  'response.Write(MessageSubject)
						   
						End Select
						%>
                 <% If  MessageBody <> "" Then %>
						<BR>
						Your profile has been entered - <a href="/memberlogin.asp">Please log in to continue...</A> <BR>
						<BR>
						<B>IMPORTANT (PLEASE NOTE):</B> A welcome email with your member login details and Study Procedure has been sent to your Email ID; <BR>
						At times, the email may go to your
						"Bulk Email" or "Junk Email" folder depending on your Email Service Provider - so you are requested to look at emails in these folders also.<BR>
						<BR>
                       
						<P align="Center"><b>Copy of Email Sent to you</b><BR>
						  <BR>
						  </B></P>
						<B>Subject:</B> <%=MessageSubject%> <BR><BR><B>Email Description:</B> <%=MessageBody%>
   
				<% End If%>
						<%
						 Body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF"">" 
						'IF Session("CountryOrigin") = "India" Then
'						Body= Body & "<span><img src=""http://www.PROJstudy.com/images/banners/email_headerIN.jpg"" alt=""PROJstudy"" /></span>" 
'						ElseIf Session("CountryOrigin")="United Kingdom" Then 
'						Body= Body &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerUK.jpg"" alt=""PROJstudy"" /></span>"
'						ElseIf Session("CountryOrigin")="Australia" Then 
'						Body= Body &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerAUS.jpg"" alt=""PROJstudy"" /></span>"
'						ElseIf Session("CountryOrigin")="Other" Then
						Body= Body &"<span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" /></span>"
						'End if
						Body= Body &"</td></tr><tr><td colspan=""2"" width=""540px""><table border=""0"" width=""520px"" align=""center""><tr height=""30px""><td><p><font face=""Arial, Helvetica, sans-serif"" size=""2"">"&MessageBody&"</font></p></td></tr></table></td></tr><tr><td align=""center""><hr><font size=""1px"">ITIL<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.<br>The Swirl logo™ is a trade mark of the Cabinet Office.</font></td></tr></table></td></tr><tr><td width=""45px"">&nbsp;</td></tr></table>"
						'response.Write(Body)
						'
						 Dim objCDOMail
						'Holds the CDONTS NewMail Object
						'Create the e-mail server object
						Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
						'Who the e-mail is from
						objCDOMail.From = "marketing@itilstudy.com"
						'Who the e-mail is sent to
						objCDOMail.To = ""&payer_email&""
						'Who the CC are sent to
						objCDOMail.Cc = "marketing@itilstudy.com"
						'Who the blind copies are sent to
						objCDOMail.Bcc = "marketing@itilstudy.com"
						'Set the subject of the e-mail
						objCDOMail.Subject = "Welcome to www.ITILstudy.com ( "&first_name&" "&last_name&" ) - "&course_desc&""
						objCDOMail.Subject = ""&MessageSubject&""
						'Set the e-mail body format (0=HTML 1=Text)
						objCDOMail.BodyFormat = 0
						'Set the mail format (0=MIME 1=Text)
						objCDOMail.MailFormat = 0
						'Set the main body of the e-mail
						 If  MessageBody <> "" Then 
  					    objCDOMail.Body =  ""&Body&""
							'response.Write(strString)
						 
						End If
'						'Importance of the e-mail (0=Low, 1=Normal, 2=High)
						objCDOMail.Importance = 2
'						'Send the e-mail
						objCDOMail.Send
'						'Close the server object
						Set objCDOMail = Nothing 
				 

						%>

  <!-- Content End From Here-->
  <!--#include virtual="/includes/connectionClose.asp"-->
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