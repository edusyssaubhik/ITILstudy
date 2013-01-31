
<!--#include virtual="/includes/connection.asp"-->
<%
                        first_name = Request.Form("first_name")
						last_name = Request.Form("last_name")
						payer_email = Request.Form("payer_email")						
						pass = Request.Form("pass")
						cpass = Request.Form("cpass")
						phone = Request.Form("phone")
						Company = Request.Form("Company")
						'session("fbuser")=true
						'session("loggedinEmail")=	strEMail
						
						Set objRs = Server.CreateObject("ADODB.Recordset")		
						strQuery = "SELECT TOP 1 Id,email,account_type_id FROM Customer_Accounts WHERE email='"&payer_email&"' ORDER BY Id DESC"
						objRs.open strQuery,ConnObj								
						
						
						'response.write "eof: " & objRs.eof & "<br/>"	
												
					 if objRs.eof = false then						
					 session("errormsg")="Email already registered"
					 Response.Redirect("/Register.asp")
					 
					 else
					 
						'added these 3 lines
							if session("returnUrl")=true then 'this condition will be true only when user was requested to login then redirect to custumerdetails page.
							finalurl ="/Dutch/custumerdetails.asp"				
						   else
							finalurl ="/Mycourses.asp"
							end if
						 'end of code added later

	dim R
	dim account_typeid
	account_typeid=1  'one for those user who will register through our site 		
					ConnObj.Execute "INSERT INTO Customer_Accounts (first_name, last_name,account_type_id, email,password,phone,custom)VALUES('"&first_name&"', '"&last_name&"','"&account_typeid&"','"&payer_email&"','"&pass&"','"&phone&"','"&Company&"')"
					Set objRs2 = Server.CreateObject("ADODB.Recordset")
					ebay_address_id=phone
					custom=Company
					objRs2.Open strQuery,ConnObj	
					dim id
					    if objRs2.eof = false then
					    id=objRs2("Id")
					                       
						session("current_user_id")=id
						session("account_type_id")=account_typeid
						end if
						objRs2.Close
					
						Session("FirstName")=first_name	
						Session("LastName")=last_name	
						session("loggedinEmail")=payer_email

						' if phone<>"" and Company<>""
						' session("IsProfileCompleted")=true
						' end if
						
						Set objRs1 = Server.CreateObject("ADODB.Recordset")
						dim strEmailID
						strEmailID = "SELECT ID, payer_email FROM PaypalDb WHERE payer_email = '"&payer_email&"' ORDER BY id desc"
						objRs1.open strEmailID,ConnObj
						if objRs1.eof = false then
                        Do While NOT objRs1.Eof	
						ConnObj.Execute "UPDATE PaypalDB SET  customer_id = '"&session("current_user_id")&"' WHERE id ='"&objRs1("ID")&"'"
                              objRs1.MoveNext
                    Loop				
						
                  
				     					 
				 End If
				 ' start code for enabling free online courses
						dim newdate
						Dim first_name, last_name, payer_email,payer_payment_email
						Dim pass, cpass, verify_sign, item_number, item_name
						Dim date_entered, date_valid, kno_passed, dateVal
						Dim rsQues, rsQues1,strString,rqAction,addresscountry
					    kno=0
						
							newdate=Date() + 2
						item_name="Understand ITIL Exam"
						item_number="0051"
						
						'payer_email=payer_email
						'first_name=first_name
						'last_name=last_name
						
						address_country=Session("CountryOrigin")
						SIPAddress1=Request.ServerVariables("HTTP_X_FORWARDED_FOR")						
						pass=pass
						date_entered=Date()
						date_valid=newdate
					    APMG="APMG"						

						If sIPAddress1="" Then sIPAddress1 = Request.ServerVariables("REMOTE_ADDR")
						strQuerygoogle = "http://geoip1.maxmind.com/b?l=4tAUhyTgUD6d" & _
							"&i=" & SIPAddress1
						set objHtp1 = Server.CreateObject("Msxml2.ServerXMLHTTP")
						objHtp1.open "GET", strQuerygoogle, false
						objHtp1.send
						SIPAddress1 = SIPAddress1 + ";" + objHtp1.ResponseText	
						'======= strating of "Understand ITIL Exam"
					  Set objRsCM = Server.CreateObject("ADODB.Recordset")
						dim strquerycm						
						strquerycm = "SELECT Top 1 payer_email, first_name, last_name,rollno, item_name, date_valid, paypal_address_id, pass FROM PaypalDb WHERE customer_id = '"&session("current_user_id")&"' and item_number=0051 ORDER BY id desc"
						objRsCM.open strquerycm,ConnObj	
						
					if objRsCM.eof = false then 'means already enrolled for course
						if objRsCM("date_valid")<Date then ' course has been expired
						ConnObj.Execute "UPDATE PaypalDB SET date_valid='"&newdate&"' WHERE id ='"&objRsCM("Id")&"'"						
						end if
					else 'not enrolled ever for this 0051 course
					'=========start==========
				    'This is to retrive the max rollno from database and incrementing the rollno'		
									
		           set objRoll = server.CreateObject("ADODB.recordset")		
															
                    strQuery2= "select max(rollno) as rollno from PaypalDB"
					
					objRoll.open strQuery2, ConnObj
					
					if objRoll.EOF=false then
	
						rollNo = objRoll("rollno")

	                    R = CInt(rollNo) + 1

                   end if
					objRoll.close
					'===============end=========
					ConnObj.Execute "INSERT INTO PaypalDB (paypal_address_id, kno_passed,item_name,item_number,receiver_email,payment_status,mc_currency,payer_email,first_name,last_name,payment_date,address_street,address_zip,custom,address_country,address_city,address_state,payment_fee,payment_gross,mc_gross,payer_id,address_status,payer_status,mc_fee,business,quantity,verify_sign,address_name,payment_type,txn_id,payer_business_name,address_owner,receiver_id,ebay_address_id,txn_type,tax,notify_version, pass, date_entered, date_valid,rollno,customer_id) VALUES('"&APMG&"','"&kno&"','"&item_name&"','"&item_number&"','"&receiver_email&"','"&payment_status&"','"&mc_currency&"','"&payer_email&"','"&first_name&"','"&last_name&"','"&payment_date&"','"&address_street&"','"&address_zip&"','"&custom&"','"&address_country&"','"&address_city&"','"&address_state&"','"&payment_fee&"','"&payment_gross&"','"&mc_gross&"','"&payer_id&"','"&address_status&"','"&payer_status&"','"&mc_fee&"','"&business&"','"&quantity&"','"&verify_sign&"','"&address_name&"','"&payment_type&"','"&txn_id&"','"&payer_business_name&"','"&SIPAddress1&"','"&receiver_id&"','"&ebay_address_id&"','"&txn_type&"','"&tax&"','"&notify_version&"','"&pass&"','"&date_entered&"','"&date_valid&"','"&R&"','"&session("current_user_id")&"')"
											
					ConnObj.Execute "INSERT INTO ITIL_callsreceived_new (callfor, callername, phoneno, emailid, callerstate, city, question, call_status1, addeddate, country, website) VALUES ('Free Enrolment','"&first_name&""&last_name&"','"& ebay_address_id &"','"& payer_email &"','"& rqState &"','"& rqCity &"','"&item_name &"','4','"& Now() &"','"&Session("countryorigin") &"', 'ITILstudy')"

					end if 
					objRsCM.close
					'======= end of "Understand ITIL Exam"
					
					'======= strating of "Free Simulated Test" 
					strquerycm = "SELECT payer_email, first_name, last_name,rollno, item_name, date_valid, paypal_address_id, pass FROM PaypalDb WHERE customer_id = '"&session("current_user_id")&"' and item_number=112 ORDER BY id desc"
						objRsCM.open strquerycm,ConnObj											
						
					if objRsCM.eof = false then 'already enrolled 
					if objRsCM("date_valid")<Date then ' course has been expired
						ConnObj.Execute "UPDATE PaypalDB SET date_valid='"&newdate&"' WHERE id ='"&objRsCM("Id")&"'"						
						end if
					else 'not enrolled ever
					'=========start==========
				    'This is to retrive the max rollno from database and incrementing the rollno'		
									
		           set objRoll = server.CreateObject("ADODB.recordset")		
															
                    strQuery2= "select max(rollno) as rollno from PaypalDB"
					
					objRoll.open strQuery2, ConnObj
					
					if objRoll.EOF=false then
	
						rollNo = objRoll("rollno")

	                    R = CInt(rollNo) + 1

                   end if
					objRoll.close
					'===============end=========
					item_name="Free Simulated Test"
					item_number="112"
					'APMG = "Free Simulated Test"
					ConnObj.Execute "INSERT INTO PaypalDB (paypal_address_id, kno_passed,item_name,item_number,receiver_email,payment_status,mc_currency,payer_email,first_name,last_name,payment_date,address_street,address_zip,custom,address_country,address_city,address_state,payment_fee,payment_gross,mc_gross,payer_id,address_status,payer_status,mc_fee,business,quantity,verify_sign,address_name,payment_type,txn_id,payer_business_name,address_owner,receiver_id,ebay_address_id,txn_type,tax,notify_version, pass, date_entered, date_valid,rollno,customer_id) VALUES('"&APMG&"','"&kno&"','"&item_name&"','"&item_number&"','"&receiver_email&"','"&payment_status&"','"&mc_currency&"','"&payer_email&"','"&first_name&"','"&last_name&"','"&payment_date&"','"&address_street&"','"&address_zip&"','"&custom&"','"&address_country&"','"&address_city&"','"&address_state&"','"&payment_fee&"','"&payment_gross&"','"&mc_gross&"','"&payer_id&"','"&address_status&"','"&payer_status&"','"&mc_fee&"','"&business&"','"&quantity&"','"&verify_sign&"','"&address_name&"','"&payment_type&"','"&txn_id&"','"&payer_business_name&"','"&SIPAddress1&"','"&receiver_id&"','"&ebay_address_id&"','"&txn_type&"','"&tax&"','"&notify_version&"','"&pass&"','"&date_entered&"','"&date_valid&"','"&R&"','"&session("current_user_id")&"')"						
										
					ConnObj.Execute "INSERT INTO ITIL_callsreceived_new (callfor, callername, phoneno, emailid, callerstate, city, question, call_status1, addeddate, country, website) VALUES ('Free Enrolment','"&first_name&""&last_name&"','"& ebay_address_id &"','"& payer_email &"','"& rqState &"','"& rqCity &"','"&item_name &"','4','"& Now() &"','"&Session("countryorigin") &"', 'ITILstudy')"

					end if 
					
					objRsCM.close
					'======= end of "Free Simulated Test" 
					'end of enabling free online courses
						end if
						
						objRs.Close  %>
						
<% if session("returnUrl")=true then  %>

<script langauge="text/javascript">    
//var item=window.name;  
//var url="/customerdetails.asp?n="+item;
var url="/Dutch/customerdetails.asp";
opener.location.href=url;
self.close();
</script>
	<%
	else
	%>
<script langauge="text/javascript">    
 window.location.href='<%=finalurl%>';
</script>
<%
	end if
	%>
	

