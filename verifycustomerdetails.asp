<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerindustryrecognizedbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/metatags/index_metatag.html"-->
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="PageTitle">Student Enrollment</td>
          </tr>
          <tr>
		  <%
				  'code by chandan to remove session of state in mycourses page
					 newstate=Session("State")
				  Session.Contents.Remove("State")
	   %>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
			<%   Session("State") =newstate %>
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px;">
                <!-- Content Start From Here-->
                <%

		  				Dim sIPAddress1

						sIPAddress1 = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
						If sIPAddress1="" Then sIPAddress1 = Request.ServerVariables("REMOTE_ADDR") %>
                <%
						Dim first_name, last_name, payer_email,payer_payment_email
						Dim pass, cpass, verify_sign, item_number, item_name
						Dim date_entered, date_valid, kno_passed, dateVal
						Dim rsQues, rsQues1,strString,rqAction,addresscountry
						
						Dim alternate_id 'temp variable created by cm

						
						Function StrQuoteReplace(strValue)
   						StrQuoteReplace = Replace(strValue, "'", "''")
						End Function
						
						If Request.Form("item_number") = "0051" OR Request.Form("item_number") = "112" Then
							If Request.Form("ebay_address_id") = "" Then
								Response.Redirect("/customerdetails.asp")
							End If
						End If

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
						'Response.Write(item_number)
						coursedate = request.Form("coursedate")
						email = request.Form("email")
						rqCity        =  Request.Form("city")
                        rqState      =  Request.Form("state")
						rqcountry     =  Request.Form("country")
						
						payer_payment_email=Request.Form("payer_payment_email") 'added by cm to get last inserted row behave of email id and update the same row with newly changed values.
						
					'	Response.write("Test"& coursedate)
						
						'Country retrived from customerdetails page'
						If Request.Form("address_country") <> "" Then
						Session("CountryOrigin") = Request.Form("address_country")
						Else
						Session("CountryOrigin") = Session("CountryOrigin")
						End If
						
						
						'item_number=104
						
						If item_number = "110" Then
						
							strPre = "This is a complimentary course provided by ITILstudy to introduce you to the basic concepts and processes of ITIL Foundation. The prep online course is optional as the subject matter would be dealt in detail during the classroom training program by the instructor.For details on the syllabus of the 2-day comprehensive classroom course, please <a href=""http://www.itilstudy.com/course-syllabus.asp"" target=""_blank"">http://www.itilstudy.com/course-syllabus.asp</a>"
							
						End If
						
						Set objRs = Server.CreateObject("ADODB.Recordset")
			if payer_payment_email<>"" then
			alternate_id=payer_email
			payer_email=payer_payment_email
			end if
						strQuery = "SELECT TOP 1 id,date_valid, address_country FROM PaypalDB WHERE payer_email='"&payer_email&"' ORDER BY id DESC"
						objRs.open strQuery,ConnObj
						
						If Not objRs.EOF Then
							payer_id = objRs("id")
							dateValid = objRs("date_valid")
							addresscountry    = objRs("address_country")
						End If
						
						objRs.Close
						
					
							   'response.write(item_number)

						Select Case item_number
		
                  		      Case "0051" , "112"
								
								 'Generating default/random password for logged in users'
							  Dim pChar1, pCount1
							   
							 ' Here you can add other characters such as lowercase or special.
							   pChar1 = "ABCDEFGHIJKLMNPQRSTUVWXYZ@#$&0123456789"
							   
							   pCount1 = Len(pChar1) 
							   
							   Dim psw1
							   psw1 = "ITIL"
							   
							   Randomize
							   For i = 1 To 6 ' password length
								  psw1 = psw1 & Mid( pChar1, 1 + Int(Rnd * pCount1), 1 )
								  pass1=psw1
							   Next
							   'added later on single password demand
							   Set objRs1 = Server.CreateObject("ADODB.Recordset")		
						strQuery = "SELECT TOP 1 Id,email,Password FROM Customer_Accounts WHERE Id='"&session("current_user_id")&"' ORDER BY Id DESC"
						objRs1.open strQuery,ConnObj	
						if objRs1.eof = false then		
                             pass1= objRs1("Password")			
						end if							 
						objRs1.close
						'end of code single password
							    
						date_entered=Date()
						date_valid=Date()+2
						Application("usersfree")=Application("usersfree")+1

						strEmailID = "SELECT top 1 payer_email, first_name, last_name, item_name, date_valid, paypal_address_id FROM PaypalDb WHERE payer_email = '"&payer_email&"' ORDER BY id desc"
						
						'Response.write(strEmailID)

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
                <br>
                Dear
                <% = firstName %>
                &nbsp;
                <% = lastName %>
                <br />
                <br />
                Email ID:
                <% = pEmail %>
                <br />
                <br />
                You are already enrolled in "
                <% = itemName %>
                " which is valid till "
                <% = FormatDateTime(dateValid,1) %>
                "<br />
                <br />
                <a href="/Mycourses.asp">Please click here to see your courses.</a><br />
                <br />
                <a href="ITIL-Online-Courses.asp">Please click here to enroll in understanding ITIL test</a>
                <%
						Else
	
								
								'MessageBody = "Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com - the Most Economical and Cost Effective Education Provider to prepare yourself  for the ITIL<sup>&reg;</sup> Foundation Certification. We are glad to have you as our student.<BR><BR>You will have access for 2 days to "
								
								MessageBody = "Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com.<BR><BR>You will have access for 2 days to "
								
								 If item_number = "0051" Then
								 MessageBody = MessageBody & "15"
								 ElseIf item_number = "112" Then
								 MessageBody = MessageBody & "40"
								 End If
								 MessageBody = MessageBody & " questions of the ITILstudy ITIL Foundation Exam Prep.<br><br>Please use these details to log on to ITILstudy.com (<a href=""http://www.ITILstudy.com/memberlogin.asp"">http://www.ITILstudy.com/memberlogin.asp</a>)<br><br>UserId: "&payer_email&"<br>Password: "&pass1&"<br><br>"
								
								' If (Session("CountryOrigin") = "India") Then
								' MessageBody = MessageBody & "We are pleased to inform you that we are also conducting our classroom programs in India. Our classroom courses are conducted by experienced faculty, who follow our effective study methodology, which has helped us to have one of the highest success rates in the industry. For more information on our classroom programs, please visit <a href=""http://www.itilstudy.com/ITIL-Courses.asp"">http://www.itilstudy.com/ITIL-Courses.asp</a>. The duration of our classroom programs is of 2 days with the ITIL Foundation exam conducted at the end of the second day of the training program.<br><br>"
								
								' ElseIf (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Singapore") Then
								' MessageBody = MessageBody & " We are pleased to inform you that we are also conducting our classroom programs in "
								' If Session("CountryOrigin") = "US" Then
								' MessageBody = MessageBody & "US"
								' ElseIf Session("CountryOrigin") = "Canada" Then
								' MessageBody = MessageBody & "Canada"
								' ElseIf Session("CountryOrigin") = "UAE" Then
								' MessageBody = MessageBody & "UAE"
								' ElseIf Session("CountryOrigin") = "United Kingdom" Then
								' MessageBody = MessageBody & "United Kingdom"
								' ElseIf Session("CountryOrigin") = "Singapore" Then
								' MessageBody = MessageBody & "Singapore"
								' End If
								' MessageBody = MessageBody & ". Our classroom courses are conducted by experienced faculty, who follow our effective study methodology, which has helped us to have one of the highest success rates in the industry. For more information on our classroom programs, please visit <a href=""http://www.itilstudy.com/ITIL-Courses.asp"">http://www.itilstudy.com/ITIL-Courses.asp</a>. The duration of our classroom programs is of 2 days with the ITIL Foundation exam conducted at the end of the second day of the training program.<br><br>We are so certain about the quality of our study materials that we offer money back guarantee. For more information on our money back guarantee policy, please visit <a href=""http://www.itilstudy.com/ITIL-Training/moneyBack.asp"">http://www.itilstudy.com/ITIL-Training/moneyBack.asp</a>.<br><br>"
								
								' End If
								
								 If (Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Singapore") Then
								MessageBody = MessageBody & "Our classroom courses are conducted by experienced faculty, who follow our effective study methodology, which has helped us to have one of the highest success rates in the industry. To know more about our courses, please visit<a href=""http://www.itilstudy.com/ITIL-Courses.asp"">Online courses </a>.<br><br>"
								End if
								'MessageBody = MessageBody & " For information about the course content, visit <a href=""http://www.itilstudy.com/Onlinecourse-syllabus.asp"">http://www.itilstudy.com/Onlinecourse-syllabus.asp</a><BR><BR>To know more about the benefits of our course, please follow the link: <a href=""http://www.itilstudy.com/ITIL-Training/courseBenefits.asp"">http://www.itilstudy.com/ITIL-Training/courseBenefits.asp</a><BR><BR><b>Please Note: </b>ITILstudy.com is the Most Economical and Most Effective<a < a href=""http://www.apmg-international.com/AccreditedOrganisations/EdusysServices-UK.asp"" target=""_blank""> Accredited Training Organizations (ATO)</a> approved by APM Group, UK to prepare you for your ITIL Certification Exams.<BR><BR>We hope you enjoy your experience with ITILstudy.<BR><BR>If you have any questions, please email us at <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@ITILstudy.com</a>. We look forward to your feedback and suggestions.<BR><BR>Best Regards.<BR>Customer Support<BR><a href=""http://www.ITILstudy.com"">www.ITILstudy.com</a><BR><a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a><BR><BR>"
								
								MessageBody = MessageBody & "<b>Please Note: </b>ITILstudy.com is an<a < a href=""http://www.apmg-international.com/AccreditedOrganisations/EdusysServices-UK.asp"" target=""_blank""> Accredited Training Organizations (ATO)</a> approved by APM Group, UK to prepare you for your ITIL Certification Exams.<BR><BR>We hope you enjoy your experience with ITILstudy.<BR><BR>If you have any questions, please email us at <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@ITILstudy.com</a>. We look forward to your feedback and suggestions.<BR><BR>Best Regards.<BR>Customer Support<BR><a href=""http://www.ITILstudy.com"">www.ITILstudy.com</a><BR><a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a><BR><BR>"
								
								'Response.Write(MessageBody)
			
								If item_number = "0051" Then
								MessageSubject = "ITILstudy.com Understanding Simulated Test (15 questions) for 2 days"
								ElseIf item_number = "112" Then
								MessageSubject = "ITILstudy.com Free Simulated Test for 2 days"	
								End If
								Application("count")=Application("count")+1
			
								'Taking the roll no an d increasing it by 1
								set objRs = server.CreateObject("ADODB.recordset")		
																		
								strQuery2= "select max(rollno) as rollno from PaypalDB"
								
								objRs.open strQuery2, ConnObj
								
								do until objRs.EOF
				
									rollNo = objRs("rollno")
			
									R = CInt(rollNo) + 1
			
								objRs.movenext
								loop
								objRs.close
								
								strQuery2 = "http://geoip1.maxmind.com/b?l=4tAUhyTgUD6d" & _
									"&i=" & sipaddress1
								set objHtp1 = Server.CreateObject("Msxml2.ServerXMLHTTP")
								objHtp1.open "GET", strQuery2, false
								objHtp1.send
								sipAddress1 = sipAddress1 + ";" + objHtp1.ResponseText
							
						
If not trim(session("current_user_id")) = "" then 'this means user is logged in with some custumer id

           if payer_payment_email<>"" then 'this condition is only for payment return people.
			payer_email=alternate_id			
			end if
					ConnObj.Execute "INSERT INTO PaypalDB (rollno, paypal_address_id, item_name, item_number, payer_email, first_name, last_name, date_entered, date_valid, pass, custom, ebay_address_id, address_owner,address_country,customer_id ) VALUES('"&R&"', '"&APMG&"','"&item_name&"','"&item_number&"','"&payer_email&"','"&StrQuoteReplace(first_name)&"','"&StrQuoteReplace(last_name)&"','"&date_entered&"','"&date_valid&"','"&pass1&"','"&custom&"','"&ebay_address_id&"', '"&sIPAddress1&"', '"&Session("countryorigin")&"', '"&session("current_user_id")&"')"
					
			else 'if not logged in then it will come here
			
								'added for  no 4 of req document
           Set objRs1 = Server.CreateObject("ADODB.Recordset")		
						strQuery = "SELECT TOP 1 Id,email,account_type_id FROM Customer_Accounts WHERE email='"&payer_email&"' ORDER BY Id DESC"
						objRs1.open strQuery,ConnObj		
												
						if objRs1.eof = false then	'value in customer account table						
						ConnObj.Execute "INSERT INTO PaypalDB (rollno, paypal_address_id, item_name, item_number, payer_email, first_name, last_name, date_entered, date_valid, pass, custom, ebay_address_id, address_owner,address_country,customer_id ) VALUES('"&R&"', '"&APMG&"','"&item_name&"','"&item_number&"','"&payer_email&"','"&StrQuoteReplace(first_name)&"','"&StrQuoteReplace(last_name)&"','"&date_entered&"','"&date_valid&"','"&pass1&"','"&custom&"','"&ebay_address_id&"', '"&sIPAddress1&"', '"&Session("countryorigin")&"', '"&objRs1("Id")&"')"
					  objRs1.close
					  else 'no values in customer_Accounts
					  dim R
	                dim account_typeid
	                account_typeid=1  'one for those user who will register through our site 	
					ConnObj.Execute "INSERT INTO Customer_Accounts (first_name, last_name,account_type_id, email,password)VALUES('"&first_name&"', '"&last_name&"','"&account_typeid&"','"&payer_email&"','"&pass1&"')"
					Set objRs2 = Server.CreateObject("ADODB.Recordset")
					objRs2.Open strQuery,ConnObj	
					dim cid
					   if objRs2.eof = false then
					   cid=objRs2("Id")				   
						
						end if
						ConnObj.Execute "INSERT INTO PaypalDB (rollno, paypal_address_id, item_name, item_number, payer_email, first_name, last_name, date_entered, date_valid, pass, custom, ebay_address_id, address_owner,address_country,customer_id ) VALUES('"&R&"', '"&APMG&"','"&item_name&"','"&item_number&"','"&payer_email&"','"&StrQuoteReplace(first_name)&"','"&StrQuoteReplace(last_name)&"','"&date_entered&"','"&date_valid&"','"&pass1&"','"&custom&"','"&ebay_address_id&"', '"&sIPAddress1&"', '"&Session("countryorigin")&"', '"&cid&"')"
						objRs2.Close
						Set objRs3 = Server.CreateObject("ADODB.Recordset")
						dim strEmailID
						strEmailID = "SELECT ID, payer_email FROM PaypalDb WHERE payer_email = '"&payer_email&"' ORDER BY id desc"
						objRs3.open strEmailID,ConnObj
						if objRs3.eof = false then
                        Do While NOT objRs3.Eof	
						ConnObj.Execute "UPDATE PaypalDB SET  customer_id = '"&cid&"' WHERE ID ='"&objRs3("ID")&"'"
                              objRs3.MoveNext
                    Loop
		end if
      end if			
			
end if	

					Set objHtp1 = Nothing
					
					'To have a record of free enrolment in CRM'		
					 If item_number = "0051" OR item_number = "112" OR item_name = "Understand ITIL Exam"  Then
					 
				if payer_payment_email<>"" then 'this condition is only for payment return people.
			    payer_email=alternate_id			
			     end if
					 ConnObj.Execute "INSERT INTO ITIL_callsreceived_new (callfor, callername, phoneno, emailid, callerstate, city, question, call_status1, addeddate, country, website) VALUES ('Free Enrolment','"&StrQuoteReplace(first_name) &""& StrQuoteReplace(last_name) &"','"& ebay_address_id &"','"& payer_email &"','"& rqState &"','"& rqCity &"','"&item_name &"','4','"& Now() &"','"&Session("countryorigin") &"', 'ITILstudy')"
					
					
					strBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#fff"" style=""margin:0px;0px;0px;0px;""><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""540px""><table border=""0"" width=""520px"" align=""center""><tr height=""30px""><td><font face=""Arial"" size=2>Hi,<BR><BR>We got the following student enrolled for ""ITIL Free Online Test"". Kindly follow up. <BR><BR>Name: "& first_name &""& last_name &"<BR><BR>Country:  "&rqcountry&"<BR><BR>State:  "&rqState&"<BR><BR>City:  "&rqCity&"<BR><BR>Phone Number: "& ebay_address_id &""
					If payer_email <> "" Then
					strBody = strBody & "<BR><BR>EmailId: "&payer_email
					End If 
					strBody = strBody & "<BR><BR>Time: "&Now()&"<BR><BR> Additional Info: The student enrolled for  "&item_name&"<BR><BR>Please do the needful.<BR><BR>Best Regards, <BR>Customer Support<br>www.ITILstudy.com<BR>Email: marketing@itilstudy.com</font></td></tr></table></td></tr></table></td></tr></table>"
					
					'response.Write(strBody)
					
					Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
					objCDOMail.From = "marketing@itilstudy.com"
					objCDOMail.To =  "marketing@itilstudy.com"
					'objCDOMail.Bcc = "satpathyt@gmail.com"
					objCDOMail.Bcc = "projstudy-leadership@googlegroups.com"
					objCDOMail.Importance = 2
					objCDOMail.Subject = "ITILstudy online student (follow up required - "&rqcountry&" )"
					objCDOMail.BodyFormat = 0
					objCDOMail.MailFormat = 0
					objCDOMail.Body =  strBody
					objCDOMail.Send
					
					Set objCDOMail = Nothing
					
					End If
					
					%>
                <!--<BR>
                Please use these details to log into ITILstudy.com (<a href="/memberlogin.asp"> member login</a>)<BR>
                <BR>
                <b>UserId:</b> <%=payer_email%><BR>
                <b>Password:</b><%=pass1%><br>-->
				
                <%End If%>
                <%
				
				Case else
	

								   if payer_payment_email<>"" then 'this condition is only for payment return people.
									payer_email=alternate_id			
									end if
								ConnObj.Execute "UPDATE PaypalDB SET payer_email='"&payer_email&"', first_name = '"&StrQuoteReplace(first_name)&"', last_name = '"&StrQuoteReplace(last_name)&"', custom='"&custom&"', ebay_address_id='"&ebay_address_id&"',audio = '"&Audio&"', dietary = '"&Dietary&"', other = '"&Other&"', mobility = '"&Mobility&"', readingORwriting = '"&ReaORWrit&"' WHERE id ='"&payer_id&"'"
								
				
								If item_number = "110" Then
								
								'If payer_email = email Then
								
								'rqVdate = Split(coursedate, "to")
								
								'Response.write(dateValid)
								
									'MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com - the Most Reliable and Cost Effective Education Provider to prepare you for the ITIL<sup>&reg;</sup> Foundation Certification. We are glad to have you as our student.<BR><BR>You will have access to the Preparatory Program for the ITILstudy ITIL Foundation Classroom Course till "&dateValid&"<BR><BR> Please use these details to log on to ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp>http://www.ITILstudy.com/memberlogin.asp</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&""
									
									MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com.<BR><BR>You will have access to the Preparatory Program for the ITILstudy ITIL Foundation Classroom Course till "&dateValid&"<BR><BR> Please use these details to log on to ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp>http://www.ITILstudy.com/memberlogin.asp</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&""
									
								If (Session("CountryOrigin") <> "India" ) Then
								MessageBody= MessageBody &"<br><br>	<a href=""https://www.facebook.com/ITILstudy/app_128953167177144"" target=""_blank"">Stay connected to get more from ITILstudy on Facebook</a>."
								End If	
								MessageBody= MessageBody &"	<br><br>"&strPre&"<BR><BR>We hope you enjoy your experience with ITILstudy. If you have any questions, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a> . We look forward to your feedback and suggestions.<br><br>"
									
									If (addresscountry = "India" OR addresscountry = "UAE" OR addresscountry = "Canada" ) Then
									MessageBody= MessageBody &" Note: Once you have enrolled with us, it is assumed that you have read through and accepted the terms and conditions related to the course as listed on the website."
									Else
									MessageBody= MessageBody &" Note: <ul><li>Once you have enrolled with us, it is assumed that you have read through and accepted the terms and conditions related to the course as listed on the website.</li><li>Your ITIL Foundation exam would be registered through CSME on your behalf and you would be notified by CSME regarding the same via email. No further action is required from your end.</li></ul>"
									End If								
									
									MessageBody= MessageBody &" For details, <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">http://www.itilstudy.com/online-termsandcond.asp</a><BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								
									MessageSubject="Welcome to www.ITILstudy.com ( "&first_name&" "&last_name&" ) - Preparatory Course for ITILstudy Classroom Program - "&addresscountry&" "
									
							
							%>
                <!--<br />			
                Dear
                <% '= first_name
				%>
                &nbsp;
                <%' = last_name 
				%>
                <br />
                <br />
                Email ID:
                <%'=payer_email
				%>
                <br />
                <br />
                You have not enrolled in any of our classroom course
               <br />
                <br />
               
                <a href="ITIL-Courses.asp">Please click here to enroll in our classroom course</a>
				-->
                <%' End If 
               %>
                <%
							
					
								ElseIf item_number = "101" OR item_number = "105" OR item_number = "106" Then
							
								'MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com - the Most Reliable and Cost Effective Education Provider to prepare yourself for the ITIL<sup>&reg;</sup> Foundation Certification. We are glad to have you as our student. <BR><BR>You will have access (for 90 days) to the ITILstudy ITIL Foundation Blended Course.<BR><BR> Please use these details to log on to ITILstudy.com (<a href=""http://www.ITILstudy.com/memberlogin.asp"">http://www.ITILstudy.com/memberlogin.asp</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>For information about the course content, visit <a href=""http://www.itilstudy.com/Onlinecourse-syllabus.asp"">http://www.itilstudy.com/Onlinecourse-syllabus.asp</a><br><br>For your convenience we have also provided the worksheets in PDF, so that you can print them and work on them at your leisure.<br><br>We hope you enjoy your experience with ITILstudy.com. If you have any questions, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a> . We look forward to your feedback and suggestions.<br><br>Note: Once you have enrolled with us, it is assumed that you have read through and accepted the terms and conditions related to the course as listed on the website. For details, <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">http://www.itilstudy.com/online-termsandcond.asp</a><BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com.<BR><BR>You will have access (for 90 days) to the ITILstudy ITIL Foundation Blended Course.<BR><BR> Please use these details to log on to ITILstudy.com (<a href=""http://www.ITILstudy.com/memberlogin.asp"">http://www.ITILstudy.com/memberlogin.asp</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>For information about the course content, visit <a href=""http://www.itilstudy.com/Onlinecourse-syllabus.asp"">http://www.itilstudy.com/Onlinecourse-syllabus.asp</a><br><br>For your convenience we have also provided the worksheets in PDF, so that you can print them and work on them at your leisure.<br><br>We hope you enjoy your experience with ITILstudy.com. If you have any questions, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a> . We look forward to your feedback and suggestions.<br><br>Note: Once you have enrolled with us, it is assumed that you have read through and accepted the terms and conditions related to the course as listed on the website. For details, <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">http://www.itilstudy.com/online-termsandcond.asp</a><BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								
								MessageSubject= "Welcome to www.ITILstudy.com ( "&first_name&" "&last_name&" ) - ITIL Blended Course for 90 days  "
								
								
									ElseIf item_number = "102" OR item_number = "103" OR item_number = "104" OR item_number = "113"  Then
							
								'MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com - the Most Reliable and Cost Effective Education Provider to prepare you for the ITIL<sup>&reg;</sup> Foundation Certification. We are glad to have you as our student. <BR><BR>You will have access  "
								MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com.<BR><BR>You will have access  "
								
								If item_number = "102" OR item_number = "113" Then
								MessageBody = MessageBody & "(for 30 days)"
								ElseIf item_number = "103" Then
								MessageBody = MessageBody & "(for 60 days)"
								ElseIf item_number = "104" Then
								MessageBody = MessageBody & "(for 180 days)"
								End If
								
								MessageBody = MessageBody & " to the ITILstudy ITIL Foundation Online Course.<BR><BR> Please use these details to log on to ITILstudy.com (<a href=""http://www.ITILstudy.com/memberlogin.asp"">http://www.ITILstudy.com/memberlogin.asp</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>For information about the course content, visit <a href=""http://www.itilstudy.com/Onlinecourse-syllabus.asp"">http://www.itilstudy.com/Onlinecourse-syllabus.asp</a><br><br>For your convenience we have also provided the worksheets in PDF, so that you can print them and work on them at your leisure.<br><br>We hope you enjoy your experience with ITILstudy.com. If you have any questions, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a> . We look forward to your feedback and suggestions.<br><br>Note: Once you have enrolled with us, it is assumed that you have read through and accepted the terms and conditions related to the course as listed on the website. For details, <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">http://www.itilstudy.com/online-termsandcond.asp</a><BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								If item_number = "102" OR item_number = "113" Then
								MessageSubject="Welcome to www.ITILstudy.com ( "&first_name&" "&last_name&" ) - ITIL Foundation Online Course for 30 days"
								ElseIf item_number = "103" Then
								MessageSubject="Welcome to www.ITILstudy.com ( "&first_name&" "&last_name&" ) - ITIL Foundation Online Course for 60 days"
								ElseIf item_number = "104" Then
								MessageSubject="Welcome to www.ITILstudy.com ( "&first_name&" "&last_name&" ) - ITIL Foundation Online Course for 180 days"
								End If
								
								
								ElseIf item_number = "109"  Then
							
								'MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com - the Most Reliable and Cost Effective Education Provider to prepare yourself  for the ITIL<sup>&reg;</sup> CSI Certification. We are glad to have you as our student. <BR><BR>You will have access to: ITILstudy all sections of ITIL Intermediate (CSI) Online course which is valid for 60 days.<BR><BR> Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&".<br><br>We hope you will enjoy your experience with ITILstudy.com. For queries, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling in our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com.<BR><BR>You will have access to: ITILstudy all sections of ITIL Intermediate (CSI) Online course which is valid for 60 days.<BR><BR> Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&".<br><br>We hope you will enjoy your experience with ITILstudy.com. For queries, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling in our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								
								MessageSubject="Welcome to www.ITILstudy.com ( "&first_name&" "&last_name&" )"
								
								ElseIf item_number = "111"  Then
							
								'MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com - the Most Reliable and Cost Effective Education Provider to prepare yourself  for the ITIL<sup>&reg;</sup> OSA Certification. We are glad to have you as our student. <BR><BR>You will have access to: ITILstudy all sections of ITIL Intermediate (OSA) Online course which is valid for 60 days.<BR><BR> Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>We hope you will enjoy your experience with ITILstudy.com. For queries, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling in our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com.<BR><BR>You will have access to: ITILstudy all sections of ITIL Intermediate (OSA) Online course which is valid for 60 days.<BR><BR> Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>We hope you will enjoy your experience with ITILstudy.com. For queries, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling in our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								
								MessageSubject="Welcome to www.ITILstudy.com ( "&first_name&" "&last_name&" )"
								
								
								ElseIf item_number = "114"  Then
							
								'MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com - the Most Reliable and Cost Effective Education Provider to prepare yourself  for the ITIL<sup>&reg;</sup> Service Strategy Certification. We are glad to have you as our student. <BR><BR>You will have access to: ITILstudy all sections of Service Strategy Online course which is valid for 90 days.<BR><BR> Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>We hope you will enjoy your experience with ITILstudy.com. For queries, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling in our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com.<BR><BR>You will have access to: ITILstudy all sections of Service Strategy Online course which is valid for 90 days.<BR><BR> Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>We hope you will enjoy your experience with ITILstudy.com. For queries, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling in our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								
								MessageSubject="Welcome to www.ITILstudy.com ( "&first_name&" "&last_name&" )"
								
								ElseIf item_number = "115"  Then
							
								'MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com - the Most Reliable and Cost Effective Education Provider to prepare yourself  for the ITIL<sup>&reg;</sup> Service Transition Certification. We are glad to have you as our student. <BR><BR>You will have access to: ITILstudy all sections of Service Transition Online course which is valid for 90 days.<BR><BR> Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>We hope you will enjoy your experience with ITILstudy.com. For queries, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling in our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com.<BR><BR>You will have access to: ITILstudy all sections of Service Transition Online course which is valid for 90 days.<BR><BR> Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>We hope you will enjoy your experience with ITILstudy.com. For queries, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling in our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								
								MessageSubject="Welcome to www.ITILstudy.com ( "&first_name&" "&last_name&" )"
								
								ElseIf item_number = "116"  Then
							
								'MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com - the Most Reliable and Cost Effective Education Provider to prepare yourself  for the ITIL<sup>&reg;</sup> Service Design Certification. We are glad to have you as our student. <BR><BR>You will have access to: ITILstudy all sections of Service Design Online course which is valid for 90 days.<BR><BR> Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>We hope you will enjoy your experience with ITILstudy.com. For queries, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling in our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com.<BR><BR>You will have access to: ITILstudy all sections of Service Design Online course which is valid for 90 days.<BR><BR> Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>We hope you will enjoy your experience with ITILstudy.com. For queries, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling in our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								
								MessageSubject="Welcome to www.ITILstudy.com ( "&first_name&" "&last_name&" )"
								
								Response.Write(MessageBody)
								
								
									
								ElseIf item_number = "117"  Then
							
								'MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com - the Most Reliable and Cost Effective Education Provider to prepare yourself  for the ITIL<sup>&reg;</sup> Service Operation Certification. We are glad to have you as our student. <BR><BR>You will have access to: ITILstudy all sections of Service Operation course which is valid for 90 days.<BR><BR> Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>We hope you will enjoy your experience with ITILstudy.com. For queries, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling in our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com.<BR><BR>You will have access to: ITILstudy all sections of Service Operation course which is valid for 90 days.<BR><BR> Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>We hope you will enjoy your experience with ITILstudy.com. For queries, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling in our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								
								MessageSubject="Welcome to www.ITILstudy.com ( "&first_name&" "&last_name&" )"
								
								Response.Write(MessageBody)
								
									'*********PPO*********
								ElseIf item_number = "118"  Then
							
								'MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com - the Most Reliable and Cost Effective Education Provider to prepare yourself  for the ITIL<sup>&reg;</sup> PPO Certification. We are glad to have you as our student. <BR><BR>You will have access to: ITILstudy all sections of ITIL Intermediate (PPO) Online course which is valid for 90 days.<BR><BR> Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>We hope you will enjoy your experience with ITILstudy.com. For queries, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling in our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com.<BR><BR>You will have access to: ITILstudy all sections of ITIL Intermediate (PPO) Online course which is valid for 90 days.<BR><BR> Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>We hope you will enjoy your experience with ITILstudy.com. For queries, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling in our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								
								MessageSubject="Welcome to www.ITILstudy.com ( "&first_name&" "&last_name&" )"
								
								Response.Write(MessageBody)
								'*****end ppo**********
								
								'*********SOA*********
								ElseIf item_number = "119"  Then
							
								'MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com - the Most Reliable and Cost Effective Education Provider to prepare yourself  for the ITIL<sup>&reg;</sup> SOA Certification. We are glad to have you as our student. <BR><BR>You will have access to: ITILstudy all sections of ITIL Intermediate (SOA) Online course which is valid for 90 days.<BR><BR> Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>We hope you will enjoy your experience with ITILstudy.com. For queries, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling in our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com.<BR><BR>You will have access to: ITILstudy all sections of ITIL Intermediate (SOA) Online course which is valid for 90 days.<BR><BR> Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>We hope you will enjoy your experience with ITILstudy.com. For queries, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling in our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								
								MessageSubject="Welcome to www.ITILstudy.com ( "&first_name&" "&last_name&" )"
								
								Response.Write(MessageBody)
								'*****end SOA**********
								
								'*********RCV*********
								ElseIf item_number = "120"  Then
							
								'MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com - the Most Reliable and Cost Effective Education Provider to prepare yourself  for the ITIL<sup>&reg;</sup> RCV Certification. We are glad to have you as our student. <BR><BR>You will have access to: ITILstudy all sections of ITIL Intermediate (RCV) Online course which is valid for 90 days.<BR><BR> Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>We hope you will enjoy your experience with ITILstudy.com. For queries, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling in our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com.<BR><BR>You will have access to: ITILstudy all sections of ITIL Intermediate (RCV) Online course which is valid for 90 days.<BR><BR> Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>We hope you will enjoy your experience with ITILstudy.com. For queries, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling in our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								
								MessageSubject="Welcome to www.ITILstudy.com ( "&first_name&" "&last_name&" )"
								
								Response.Write(MessageBody)
								'*****end RCV**********
								
									'*********MALC*********
								ElseIf item_number = "121"  Then
							
								'MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com - the Most Reliable and Cost Effective Education Provider to prepare yourself  for the ITIL<sup>&reg;</sup> MALC Certification. We are glad to have you as our student. <BR><BR>You will have access to: ITILstudy all sections of ITIL Intermediate (MALC) Online course which is valid for 90 days.<BR><BR> Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>We hope you will enjoy your experience with ITILstudy.com. For queries, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling in our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com.<BR><BR>You will have access to: ITILstudy all sections of ITIL Intermediate (MALC) Online course which is valid for 90 days.<BR><BR> Please use these details to log into ITILstudy.com (<a href=http://www.ITILstudy.com/memberlogin.asp> member login</a>)<BR><BR> UserId: "&payer_email&"<BR>Password: "&pass&"<br><br>"&strPre&"<br><br>We hope you will enjoy your experience with ITILstudy.com. For queries, please email us at <a href=""mailto:adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a>. We always look forward to your feedback and suggestions.<br><br>Note:- Kindly note that by enrolling in our course it is assumed that you have read through and accepted the Terms and Conditions related to the course as listed on the website, for details  <a href=""http://www.itilstudy.com/online-termsandcond.asp"" target=""_blank"">click here</a>.<BR><BR>Best Regards, <br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
								
								MessageSubject="Welcome to www.ITILstudy.com ( "&first_name&" "&last_name&" )"
								
								Response.Write(MessageBody)
								'*****end MALC**********								
																
								End If
						
						'response.Write(MessageBody)
						 ' response.Write(MessageSubject)
						 
						 
						 ' End If
						  
						End Select
						%>
                <% If  MessageBody <> "" Then %>
                 </BR>
                Thank you for enrolling course with us:       
               </br>
				</BR>
                Please go to my courses page to access your course <a href="/logoff.asp">by clicking here </A>. </BR>
                </BR>
                <B>IMPORTANT (PLEASE NOTE):</B> A welcome email with your member login details and Study Procedure has been sent to your Email ID for future reference; <BR>
                At times, the email may go to your
                "Bulk Email" or "Junk Email" folder depending on your Email Service Provider - so you are requested to look at emails in these folders also.<BR>
                <!--<BR>
                <P align="Center"><b>Copy of Email Sent to you</b><BR>
                  <BR>
                  </B></P>
                <B>Subject:</B> <%=MessageSubject%> <BR>
                <BR>
                <B>Email Description:</B> <%=MessageBody%>-->
                <%
				 Body = "<table width=""100%"" bordrer=""1"" bgcolor=""#fff"" style=""margin:0px;0px;0px;0px;""><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF"">" 
		
						Body= Body &"<span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" /></span>"
					
						Body= Body &"</td></tr><tr><td colspan=""2"" width=""540px""><table border=""0"" width=""520px"" align=""center""><tr height=""30px""><td><p><font face=""Arial, Helvetica, sans-serif"" size=""2"">"&MessageBody&"</font></p></td></tr></table></td></tr><tr><td align=""center""><hr><font size=""1px"">ITIL<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.<br/>The Swirl logo™ is a trade mark of the Cabinet Office.</font></td></tr></table></td></tr><tr><td width=""45px"">&nbsp;</td></tr></table>"
						'response.Write(Body)
						
					    If Body <> "" Then
						
						 Dim objCDOMail
						' Holds the CDONTS NewMail Object
						' Create the e-mail server object
						Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
						' Who the e-mail is from
						objCDOMail.From = "marketing@itilstudy.com"
						' Who the e-mail is sent to
						objCDOMail.To = ""&payer_email&""
						' Who the CC are sent to
						objCDOMail.Cc = "marketing@itilstudy.com"
						' Who the blind copies are sent to
						If item_number = "0051" OR item_number = "112" OR item_name = "Understand ITIL Exam"  Then
						objCDOMail.Bcc = "pmstudysales@gmail.com,projstudy-leadership@googlegroups.com"
						Else
						objCDOMail.Bcc = "satpathyt@gmail.com ,pmstudysales@gmail.com,projstudy-leadership@googlegroups.com"
						End If
						' To send canada prep course mails to Karen
						If Session("CountryOrigin") = "Canada" AND item_number = "110" Then 
						objCDOMail.Bcc = "karen.l@itilstudy.com,projstudy-leadership@googlegroups.com"
						End If
						
						' Set the subject of the e-mail
						objCDOMail.Subject = "Welcome to www.ITILstudy.com ( "&first_name&" "&last_name&" ) - "&course_desc&""
						objCDOMail.Subject = ""&MessageSubject&""
						' Set the e-mail body format (0=HTML 1=Text)
						objCDOMail.BodyFormat = 0
						' Set the mail format (0=MIME 1=Text)
						objCDOMail.MailFormat = 0
						' Set the main body of the e-mail
						 If  MessageBody <> "" Then 
  					    objCDOMail.Body =  ""&Body&""
						' response.Write(strString)
						 
						End If
						'Importance of the e-mail (0=Low, 1=Normal, 2=High)
						objCDOMail.Importance = 2
						'Send the e-mail
						objCDOMail.Send
						'Close the server object
						Set objCDOMail = Nothing 
					End if
								%>
                <% End If%>
                <!-- Content End From Here-->
                <!--#include virtual="/includes/connectionClose.asp"-->
              </div></td>
          </tr>
          
        </table></td>
    </tr>
  </table>
</div>

<% If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") Then %>
<!-- Google Code for ITILstudy USA Online - ES Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "yPA4CNO71QIQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?value=0&amp;label=yPA4CNO71QIQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>

<% ElseIf Session("CountryOrigin") = "Australia" Then %>

<!-- Google Code for ITILstudy AUS Online - ES (P.M.5) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1001931809;
var google_conversion_language = "en";
var google_conversion_format = "2";
var google_conversion_color = "ffffff";
var google_conversion_label = "BA62CKeAyhIQoYjh3QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1001931809/?value=0&amp;label=BA62CKeAyhIQoYjh3QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


<% ElseIf Session("CountryOrigin") = "India" Then %>
<!-- Google Code for ITILstudy IND - Online ES (P.M.6) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1000044564;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "kjxoCOTV1QMQlPDt3AM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1000044564/?value=0&amp;label=kjxoCOTV1QMQlPDt3AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>



 <% ElseIf Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" Then %>
<!-- Google Code for ITILstudy UAE, Singapore - Online ES (P.M.6) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1000044564;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "vag0CNzW1QMQlPDt3AM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1000044564/?value=0&amp;label=vag0CNzW1QMQlPDt3AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


<%  ElseIf Session("CountryOrigin") = "Germany" Then  %>
<!-- Google Code for ITILstudy Germany - Eng- Online ES (P.M.2) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "2";
var google_conversion_color = "ffffff";
var google_conversion_label = "43HWCNuSlgMQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?value=0&amp;label=43HWCNuSlgMQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


<% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
<!-- Google Code for ITILstudy - Online ES for UK (P.M.3) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1017900619;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "YmGrCJWIlAMQy9yv5QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1017900619/?value=0&amp;label=YmGrCJWIlAMQy9yv5QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


<!-- Google Code for ITILstudy UK - Online ES (P.M.6) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1000044564;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "hxQkCMzY1QMQlPDt3AM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1000044564/?value=0&amp;label=hxQkCMzY1QMQlPDt3AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


<% Else %>

<!-- Google Code for ITILstudy Online - ES Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "O771CMO0yQIQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;"> <img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?label=O771CMO0yQIQx8Kz6QM&amp;guid=ON&amp;script=0"/> </div>
</noscript>
<% End If %>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
