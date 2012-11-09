
<script language="javascript" runat="server" src="json2.asp"></script>
<!-- #INCLUDE FILE="fb_app.asp" -->
<!--#include virtual="/includes/connection.asp"-->
<%
'' JSON 2 Library from: 
''

'declaring global variable
dim finalurl

main

function main
	dim app_id
	dim app_secret
	dim my_url
	dim dialog_url
	dim token_url
	dim resp
	dim token
	dim expires
	dim graph_url
	dim json_str
	dim user
	dim code
	dim strLocation 
	dim strEducation
	dim strEmail
	dim strFirstName
	dim strLastName
	dim strID
    dim gender
	dim username
	dim userlink
	token = cookie("token")

	if token = "" then 
		response.write "Facebook login error"	
		exit function
	end if

	graph_url = "https://graph.facebook.com/me?access_token=" & token

	json_str = get_page_contents( graph_url )


	set user = JSON.parse( json_str )

	'' These properties should always be there provided
	'' we ask the right questions user.id & user.name
	strFirstName = user.first_name
	strLastName = user.last_name
	strID = user.id
	
	'' Handling properties that might not be there
	on error resume next
	strLocation = user.location.name	
	If UBound(user.location.name)>0 Then
Else  
    strLocation = user.location.get(0).name
End If
	
	strEducation = user.education.get(0).school.name
	strEMail = user.email
	strEmail = replace( strEmail, "\u0040", "@")
	userlink = user.link
	userlink = replace( userlink, "\u0040", "@")
    gender= user.gender
	username=user.username
	on error goto 0

	'code start for save data to db
	
 
						'Declare The Local Variables'						
						dim strEmailID
						session("fbuser")=true
						session("loggedinEmail")=strEMail
						session("fbuserlocation")=strLocation
						
						Set objRs = Server.CreateObject("ADODB.Recordset")		
						strQuery = "SELECT Id,email,account_type_id FROM Customer_Accounts WHERE email='"&strEMail&"'"
						objRs.open strQuery,ConnObj							
							
						if objRs.eof = false then				
						session("current_user_id")=objRs("Id")
						'response.write "" & objRs("email") &" already exists in db"& "<br/>"
						'to show the name of logged in user.
						Session("FirstName")=strFirstName	
						Session("LastName")=strLastName
						session("account_type_id")=objRs("account_type_id")
						
							if session("returnUrl")=true then 'this condition will be true only when user was requested to login then redirect to custumerdetails page.
							finalurl="/custumerdetails.asp"
							end if
						   'end of code added later
						Set objRs1 = Server.CreateObject("ADODB.Recordset")
						
						strEmailID = "SELECT Top 1 payer_email, first_name, last_name, item_name, date_valid, paypal_address_id, pass FROM PaypalDb WHERE customer_id = '"&objRs("Id")&"' and date_valid >='"&Date&"' ORDER BY id desc"
						objRs1.open strEmailID,ConnObj
						
							if objRs1.eof = false then		
							
							session("fbuser_paypalpass")=	objRs1("pass")			
							finalurl="/Mycourses.asp"
							else						
							finalurl="/ITIL-Online-Courses.asp"
							end if
						objRs1.Close
						
						else    ' when custumer account is having no data
						

						Set objCm = Server.CreateObject("ADODB.Recordset")
						
						strEmailID = "SELECT * FROM related_customer_accounts WHERE other_site_email = '"&strEMail&"' And account_type_id=2" '2 for facebook
						objCm.open strEmailID,ConnObj
						
						if objCm.eof = false then	'means user already synced
	                     findlinks(objCm("customer_id"))						
						
						else ' user is registering via facebook

	dim R
	dim account_typeid
	account_typeid=2  'two for those user who will login using facebook 	
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
							   
					ConnObj.Execute "INSERT INTO Customer_Accounts (first_name, last_name,account_type_id,email,gender,date_of_birth,other_site_user_id,other_site_user_name,other_site_link,password)VALUES('"&strFirstName&"', '"&strLastName&"','"&account_typeid&"','"&strEMail&"','"&gender&"','"&user.birthday&"','"&strId&"','"&user.username&"','"&userlink&"','"&pass1&"')"
					Set objRs2 = Server.CreateObject("ADODB.Recordset")
					objRs2.Open strQuery,ConnObj	
					if objRs2.eof = false then
					
					                       
						session("current_user_id")=objRs2("Id")
						session("account_type_id")=objRs2("account_type_id")
						'finalurl="/ITIL-Online-Courses.asp"
						finalurl="/Mycourses.asp"
						   'added later these 3 lines
							if session("returnUrl")=true then 'this condition will be true only when user was requested to login then redirect to custumerdetails page.							
							finalurl="/custumerdetails.asp"
							end if
						   'end of code added later
						
					end if
						objRs2.Close  
					   
						Session("FirstName")=strFirstName	
						Session("LastName")=strLastName	
						session("loggedinEmail")=strEMail					
					   
						'start ==========================						
						Set objRs3 = Server.CreateObject("ADODB.Recordset")
						
						strEmailID = "SELECT ID, payer_email, date_valid FROM PaypalDb WHERE payer_email = '"&strEMail&"' ORDER BY id desc"
						objRs3.open strEmailID,ConnObj           'get all paypal value using email
						if objRs3.eof = false then
                        Do While NOT objRs3.Eof	
						
						if objRs3("date_valid")>=Date then 'if courses are valid from this account
						finalurl="/Mycourses.asp"
						end if   'end of valid course check from this account
						
						ConnObj.Execute "UPDATE PaypalDB SET  customer_id = '"&session("current_user_id")&"' WHERE ID ='"&objRs3("ID")&"'"
                              objRs3.MoveNext
                    Loop					   
					
					end if		                    					
						'end ===============
						
						' start code for enabling free online courses
						dim newdate
						Dim first_name, last_name, payer_email,payer_payment_email
						Dim pass, cpass, verify_sign, item_number, item_name
						Dim date_entered, date_valid, kno_passed, dateVal
						Dim rsQues, rsQues1,strString,rqAction,addresscountry
					    kno=0
						'kno,receiver_email,payment_status,mc_currency,payment_date,address_street,address_zip,address_city,address_state,payment_fee,payment_gross
						'mc_gross,payer_id,address_status,payer_status,mc_fee,business,quantity,verify_sign,address_name,payment_type,txn_id,payer_business_name
						'receiver_id,ebay_address_id,txn_type,tax,notify_version
							newdate=Date() + 2
						item_name="Understand ITIL Exam"
						item_number="0051"
						
						payer_email=strEMail
						first_name=strFirstName
						last_name=strLastName
						
						'custom 'not available
						address_country=Session("CountryOrigin")
						SIPAddress1=Request.ServerVariables("HTTP_X_FORWARDED_FOR")		
                        					
						'ebay_address_id 'not available					
						pass=pass1
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
						
					  Set objRsCM = Server.CreateObject("ADODB.Recordset")
						dim strquerycm						
						strquerycm = "SELECT Top 1 payer_email, first_name, last_name,rollno, item_name, date_valid, paypal_address_id, pass FROM PaypalDb WHERE customer_id = '"&session("current_user_id")&"' and item_number=0051 ORDER BY id desc"
						objRsCM.open strquerycm,ConnObj											
						
					if objRsCM.eof = false then 'means already enrolled for course
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
					ConnObj.Execute "INSERT INTO PaypalDB (paypal_address_id, kno_passed,item_name,item_number,receiver_email,payment_status,mc_currency,payer_email,first_name,last_name,payment_date,address_street,address_zip,custom,address_country,address_city,address_state,payment_fee,payment_gross,mc_gross,payer_id,address_status,payer_status,mc_fee,business,quantity,verify_sign,address_name,payment_type,txn_id,payer_business_name,address_owner,receiver_id,ebay_address_id,txn_type,tax,notify_version, pass, date_entered, date_valid,rollno,customer_id) VALUES('"&APMG&"','"&kno&"','"&item_name&"','"&item_number&"','"&receiver_email&"','"&payment_status&"','"&mc_currency&"','"&payer_email&"','"&first_name&"','"&last_name&"','"&payment_date&"','"&address_street&"','"&address_zip&"','"&custom&"','"&address_country&"','"&address_city&"','"&address_state&"','"&payment_fee&"','"&payment_gross&"','"&mc_gross&"','"&payer_id&"','"&address_status&"','"&payer_status&"','"&mc_fee&"','"&business&"','"&quantity&"','"&verify_sign&"','"&address_name&"','"&payment_type&"','"&txn_id&"','"&payer_business_name&"','"&SIPAddress1&"','"&receiver_id&"','"&ebay_address_id&"','"&txn_type&"','"&tax&"','"&notify_version&"','"&pass&"','"&date_entered&"','"&date_valid&"','"&R&"','"&session("current_user_id")&"')"
						
					ConnObj.Execute "INSERT INTO ITIL_callsreceived_new (callfor, callername, phoneno, emailid, callerstate, city, question, call_status1, addeddate, country, website) VALUES ('Free Enrolment','"&first_name&""&last_name&"','"& ebay_address_id &"','"& payer_email &"','"& rqState &"','"& rqCity &"','"&item_name &"','4','"& Now() &"','"&Session("countryorigin") &"', 'ITILstudy')"

						
					end if 
					objRsCM.close
					
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
					'end of enabling free online courses
							end if	
						end if
						%>
						<%
				'Response.Redirect("/test.asp") 		
if session("returnUrl")=true then
	%>
<script langauge="text/javascript">   
var url="/customerdetails.asp";
opener.location.href=url;
self.close();
</script>
	<%
	else
	%>
<script langauge="text/javascript">    
self.close();
opener.location.href='<%=finalurl%>';
</script>
<%
	end if
	%>
<%

						objRs.Close  
						
	'end of code
end function    


%>
<%
Function findlinks(Cid)
			dim strEmailID			
   Set objRs = Server.CreateObject("ADODB.Recordset")		
						strQuery = "SELECT * FROM Customer_Accounts WHERE Id='"&Cid&"'"
						objRs.open strQuery,ConnObj	
					 if objRs.eof = false then				
						session("current_user_id")=objRs("Id")
						session("account_type_id")=objRs("account_type_id")
						
						Session("FirstName")=objRs("first_name")	
						Session("LastName")=objRs("last_name")	
						session("loggedinEmail")=objRs("email")
						
						Set objRs1 = Server.CreateObject("ADODB.Recordset")						
						strEmailID = "SELECT payer_email, first_name, last_name, item_name, date_valid, paypal_address_id, pass FROM PaypalDb WHERE customer_id = '"&objRs("Id")&"' and date_valid >='"&Date&"' ORDER BY id desc"
						
						objRs1.open strEmailID,ConnObj
						
						 if objRs1.eof = false then					
						
						finalurl="/Mycourses.asp"
						else						
						finalurl="/ITIL-Online-Courses.asp"
						 end if
					end if
End Function
%>
