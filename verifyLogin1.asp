<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerloginbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<script type="text/javascript">

function Form_Validator(theform)
{

  //Check To See If The Current Password Field Is Blank
   
  if (theform.payer_email.value == "Enter your email address")
  {
    alert("Please enter email id");
    theform.payer_email.focus();
	return(false);
  }

  //Check To See If The New Password Field Is Blank
    
  if (theform.pass.value == "********")
  {
    alert("Please enter password");
    theform.pass.focus();
	return(false);
  }

}
function Form_Validator1(Theform) {
    //Check To See If The Current Password Field Is Blank

    if (Theform.payer_email.value == "Enter your email address") {
        alert("Please enter email id");
        Theform.payer_email.focus();
        return false;
    }
    /*var email = Theform.payer_email.value;
    var pattern = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
    if (!email.match(pattern)) {
        alert("Please enter proper email id");
        Theform.payer_email.focus();
        return false;
    }*/

    //Check To See If The New Password Field Is Blank

    if (Theform.pass.value == "********") {
        alert("Please enter password");
        Theform.pass.focus();
        return false;
    }
    return true;
}
</script>
 <!-- Body Starts -->
  <div>
  	<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="235" align="left" valign="top" bgcolor="#FFFFFF">
				<table width="100%" border="0" cellspacing="0" cellpadding="8">

                  <tr>
                    <td width="2%" class="Header">&nbsp;</td>
                    <td width="25%" class="PageTitle">&nbsp;</td>
                    <td width="73%" class="PageTitle">Member Login </td>
                  </tr>
                  <tr>
					<!--#include virtual="/includes/innerLeftMenu.asp"-->
                    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
					<div style="margin-top:-12px;"><br />
					<!-- Content Start From Here-->
		  				  <%' assign posted variables to local variables

						payer_email = Request.Form("payer_email")
						pass = Request.Form("pass")
						if Trim(payer_email) = "" Then
                            Response.redirect "/memberlogin.asp"
                        End IF
						
						'To retrive the end date from enrolled user so that we can take it in left menu
								Dim objRs, rqVdate
								Set objRs = Server.CreateObject("ADODB.Recordset")
								strQuery = "SELECT top 1 coursedate ,email FROM itil_enrolledusers WHERE email='"&payer_email&"' ORDER BY id DESC"
												'Response.Write(strQuery)
												objRs.open strQuery,ConnObj
												
												If Not objRs.EOF Then
													email = objRs("email")
													Session("coursedate") = objRs("coursedate")
													coursedate = Session("coursedate") 
												'Response.Write("Test" &coursedate)
													rqVdate = Split(coursedate, "to")
													'rqcoursedate = Split(coursedate, "to")
													'Response.write(rqVdate(1))
													
													Session("enddate")  = CDate(rqVdate(1)) 
													
													'Response.Write(Session("enddate"))
													
												End If
												
												objRs.Close

										

						Set rsQues = Server.CreateObject("ADODB.Recordset")
						rsQues.ActiveConnection = ConnObj
						rsQues.Open "SELECT payer_email from PaypalDB WHERE payer_email='"&payer_email&"' order by ID Desc"

							If Not rsQues.BOF Then
								Set rsQues = Nothing
								Set rsQues1 = Server.CreateObject("ADODB.Recordset")
								rsQues1.ActiveConnection = ConnObj
								rsQues1.Open "SELECT pass from PaypalDB where payer_email='"&payer_email&"' order by ID Desc"
									If Not rsQues1.BOF and pass=rsQues1("pass")Then
										set rsQues1 = Nothing
										Set rsQues2 = Server.CreateObject("ADODB.Recordset")
										rsQues2.ActiveConnection = ConnObj
										rsQues2.Open "SELECT paypal_address_id, date_entered,rollno,ID, item_number, item_name, date_valid, kno_passed, first_name, last_name,customer_id FROM PaypalDB WHERE PaypalDB.pass='"&pass&"' and PaypalDB.payer_email='"&payer_email&"' order by ID Desc"
										'response.Write "SELECT paypal_address_id, date_entered,rollno,ID, item_number, item_name, date_valid, kno_passed, first_name, last_name,customer_id FROM PaypalDB WHERE PaypalDB.pass='"&pass&"' and PaypalDB.payer_email='"&payer_email&"' order by ID Desc"
										If Not rsQues2.BOF Then
										
                       'code by chandan for doc req pt 4b					   
					   if isNull(rsQues2("customer_id")) then
					      'response.write("inside"& rsQues2("customer_id"))
						    Set objRs4 = Server.CreateObject("ADODB.Recordset")		
						    strQuery1 = "SELECT TOP 1 Id,email,account_type_id FROM Customer_Accounts WHERE email='"&payer_email&"' ORDER BY Id DESC"
						    objRs4.open strQuery1,ConnObj
						    if not objRs4.eof = false then	'no values in customer_accounts
						        dim R
	                            dim account_typeid
	                            account_typeid=1  'one for those user who will register through our site 	

					            ConnObj.Execute "INSERT INTO Customer_Accounts (first_name, last_name,account_type_id, email,password)VALUES('"&rsQues2("first_name")&"', '"&rsQues2("last_name")&"','"&account_typeid&"','"&payer_email&"','"&pass&"')"
                                                                						
					            Set objRs2 = Server.CreateObject("ADODB.Recordset")
					            strQuery1 = "SELECT TOP 1 Id,email,account_type_id FROM Customer_Accounts WHERE email='"&payer_email&"' ORDER BY Id DESC"

					            objRs2.Open strQuery1,ConnObj	 
					            dim cid
					            if objRs2.eof = false then
					                cid=objRs2("Id")				 'get the newly inserted id  
					                session("current_user_id")=cid
					                session("account_type_id")=objRs2("account_type_id")
					                session("loggedinEmail")=payer_email
						            'response.write("cid :"& cid)
						        end if

						        objRs2.Close
						        Set objRs3 = Server.CreateObject("ADODB.Recordset")
						        dim strEmailID
						        strEmailID = "SELECT ID, payer_email FROM PaypalDb WHERE payer_email = '"&payer_email&"' ORDER BY id desc"
						        objRs3.open strEmailID,ConnObj           'get all paypal value using email
						        if objRs3.eof = false then
                                    Do While NOT objRs3.Eof	
						                    ConnObj.Execute "UPDATE PaypalDB SET  customer_id = '"&cid&"' WHERE ID ='"&objRs3("ID")&"'"
                                          objRs3.MoveNext
                                    Loop
					            end if	
                                

						    end if
                                
                                 '/*** If user has no customer_Id                         
                                Set objRscheck = Server.CreateObject("ADODB.Recordset")
                                Set objCust = Server.CreateObject("ADODB.Recordset")
                                 
                                strEmailID = "SELECT paypal_address_id, date_entered,rollno,ID, item_number, item_name, date_valid, kno_passed, first_name, last_name,customer_id FROM PaypalDB WHERE PaypalDB.pass='"&pass&"' and PaypalDB.payer_email='"&payer_email&"' order by ID Desc"
                               
                                objRscheck.open strEmailID,ConnObj

                                IF IsNull(objRscheck("customer_id")) Then
                                                             
                                    strEmailID ="SELECT TOP 1 Id,email,account_type_id FROM Customer_Accounts WHERE email='"&payer_email&"' ORDER BY Id DESC"
                                    objCust.open strEmailID,ConnObj
                                    If Not objCust.Eof Then
                                        session("current_user_id") = objCust("Id")
                                    End If
                                    'response.write "UPDATE PaypalDB SET  customer_id = '"&session("current_user_id")&"' WHERE ID ='"&objRscheck("ID")&"'"
                                    ConnObj.Execute "UPDATE PaypalDB SET  customer_id = '"&session("current_user_id")&"' WHERE ID ='"&objRscheck("ID")&"'"
                                'response.write "hi"
                                    Set objRs2 = Server.CreateObject("ADODB.Recordset")
					                strQuery1 = "SELECT Id,email,account_type_id FROM Customer_Accounts WHERE Id='"&session("current_user_id")&"'"
					                objRs2.Open strQuery1,ConnObj
					                session("account_type_id")=objRs2("account_type_id")
					                set objRs2=nothing
					                session("loggedinEmail")=payer_email
                                   
                                End If
                                 '/*** If user has no customer_Id  Ends 
						else		                   
					  session("current_user_id")=rsQues2("customer_id")   
					  Set objRs2 = Server.CreateObject("ADODB.Recordset")
					  strQuery1 = "SELECT Id,email,account_type_id FROM Customer_Accounts WHERE Id='"&session("current_user_id")&"'"
					  objRs2.Open strQuery1,ConnObj
					  session("account_type_id")=objRs2("account_type_id")
					  set objRs2=nothing
					  session("loggedinEmail")=payer_email
				end if
										'end of code by chandan
										item_number=rsQues2("item_number")
										item_name=rsQues2("item_name")
										Session("item_number")=item_number
										'Session("FirstName")="Trial"
										'Session("LastName")="Member"
										Session("FirstName")=rsQues2("first_name")
										Session("LastName")=rsQues2("last_name")
										Session("ITIL")=rsQues2("paypal_address_id")
										Session("rollNo")=rsQues2("rollno")
										Session("ID")=rsQues2("ID")
										Session("DateValid")=rsQues2("date_valid")
										'----------------------------------------------------------------
										'Putting Two courses into session for using this in other pages
										'----------------------------------------------------------------
										If (item_number = 110) Then
											Session("ITIL")="Pre-Work course"
											Session("courseDuration") = Session("DateValid")		
										
										ElseIf (item_number = 101) Then
											Session("ITIL")="ITILstudy Blend Course"
											Session("courseDuration") = "30 Days"
											
										ElseIf (item_number = 102) Then
											Session("ITIL")="ITILstudy Online Course"
											Session("courseDuration") = "30 Days"
											
										ElseIf (item_number = 103) Then
											Session("ITIL")="ITILstudy Online Course"
											Session("courseDuration") = "60 Days"
											
										ElseIf (item_number = 104) Then
											Session("ITIL")="ITILstudy Online Course"
											Session("courseDuration") = "180 Days"
											
									    ElseIf (item_number = 105) Then
											Session("ITIL")="ITILstudy Blend Course"
											Session("courseDuration") = "60 Days"
											
										ElseIf (item_number = 106) Then
											Session("ITIL")="ITILstudy Blend Course"
											Session("courseDuration") = "90 Days"
											
										ElseIf (item_number = 109) Then
											Session("ITIL")="ITIL Intermediate (CSI) Online course"
											Session("courseDuration") = "60 Days"
											
										ElseIf (item_number = 111) Then
											Session("ITIL")="ITIL Intermediate (OSA) Online course"
											Session("courseDuration") = "60 Days"
											
										ElseIf (item_number = 0051) Then
											Session("ITIL")="15 Questions to Understand ITIL Foundation Exam format"
											Session("courseDuration") = "2 Days"
											
										ElseIf (item_number = 112) Then
											Session("ITIL")="Free Simulated Test"
											Session("courseDuration") = "2 Days"
											
										ElseIf (item_number = 113) Then
											Session("ITIL")="ITILstudy Online Course"
											Session("courseDuration") = "30 Days"
											
										ElseIf (item_number = 114) Then
											Session("ITIL")="ITILstudy Service Strategy Online Course"
											Session("courseDuration") = "90 Days"
											
										ElseIf (item_number = 115) Then
											Session("ITIL")="ITILstudy Service Transition Online Course"
											Session("courseDuration") = "90 Days"
											
										ElseIf (item_number = 116) Then
											Session("ITIL")="ITILstudy Service Design Online Course"
											Session("courseDuration") = "90 Days"
											
										ElseIf (item_number = 117) Then
											Session("ITIL")="ITILstudy Service Operation"
											Session("courseDuration") = "90 Days"
											
										ElseIf (item_number = 118) Then
											Session("ITIL")="ITIL Intermediate (PPO) Online course"
											Session("courseDuration") = "90 Days"	
											
										ElseIf (item_number = 119) Then
											Session("ITIL")="ITIL Intermediate (SOA) Online course"
											Session("courseDuration") = "90 Days"	
											
										ElseIf (item_number = 120) Then
											Session("ITIL")="ITIL Intermediate (RCV) Online course"
											Session("courseDuration") = "90 Days"
											
										ElseIf (item_number = 121) Then
											Session("ITIL")="ITIL Intermediate (MALC) Online course"
											Session("courseDuration") = "90 Days"	
																					
																																
										End If																										
										
										
										Session("DateEntered") = rsQues2("date_entered")
										Session("DateValid")=rsQues2("date_valid")
										Session("KnoPassed")=rsQues2("kno_passed")
										Session("PayerEmail")=payer_email 									
						 				 

										Session("CourseDet1") = CourseDet1

										if(CDate(Session("DateValid"))-Date()>=0) then
										Dim str
										Select Case item_number
												
											Case 110
												Session("State")="verified4"
												str="Your membership allows you access to <a href=""/prepcourse.asp"">Preparatory Program</a> which is a pre-requisite for the ITILstudy Prep Classroom Course till "&Session("DateValid")&". (This has to be completed before you attend ITILstudy Classroom Course)"
												Session("Item")="Physical Cert"												
									
											
											Case 101
												Session("State")="verified1"
												str="Your membership allows you access to <a href=""/methodology/tour3.asp"">all sections of ITIL Foundation Blend course </a> for "&Session("courseDuration")&""
												Session("Item")="Online Cert"	
												
											Case 102
												Session("State")="verified2"
												str="Your membership allows you access to <a href=""/methodology/tour3.asp"">all sections of ITIL Foundation Online course </a> for "&Session("courseDuration")&""
												Session("Item")="Online Cert"
												
											Case 103
												Session("State")="verified3"
												str="Your membership allows you access to <a href=""/methodology/tour3.asp"">All sections of ITIL Foundation Online course </a> for "&Session("courseDuration")&""
												Session("Item")="Online Cert"	
												
											Case 104
												Session("State")="verified5"
												str="Your membership allows you access to <a href=""/methodology/tour3.asp"">All sections of ITIL Foundation Online course </a> "
												Session("Item")="Online Cert"	
												
											Case 105
												Session("State")="verified6"
												str="Your membership allows you access to <a href=""/methodology/tour3.asp"">All sections of ITIL Foundation Blend course </a> for "&Session("courseDuration")&""
												Session("Item")="Online Cert"	
												
											Case 106
												Session("State")="verified7"
												str="Your membership allows you access to <a href=""/methodology/tour3.asp"">All sections of ITIL Foundation Blend course </a> for "&Session("courseDuration")&""
												Session("Item")="Online Cert"	
												
										   	Case 109
												Session("State")="verified9"
												str="Your membership allows you access to <a href=""/methodology/tour4.asp"">all sections of ITIL Intermediate (CSI) Online course</a> for "&DateDiff("d",Session("DateEntered"),Session("DateValid"))&" Days"
												Session("Item")="Online Cert"	
												
											Case 111
												Session("State")="verified11"
												str="Your membership allows you access to <a href=""/methodology/tour5.asp"">all sections of ITIL Intermediate (OSA) Online course</a> for "&DateDiff("d",Session("DateEntered"),Session("DateValid"))&" Days"
												Session("Item")="Online Cert"
																							
											Case 0051
												Session("State")="verified8"
												str="Your membership allows you access to <a href=""/practiceTestsIndex.asp"">15 Questions to Understand ITIL Foundation Exam format</a> for 2 days"
												Session("Item")="Physical Cert"	
												
											Case 112
												Session("State")="verified12"
												str="Your membership allows you access to <a href=""/practiceTestsIndex.asp"">Free Simulated Test</a> for 2 days"
												Session("Item")="Physical Cert"	
												
										   Case 113
												Session("State")="verified13"
												str="Your membership allows you access to <a href=""/methodology/tour3.asp"">all sections of ITIL Foundation Online course </a> for "&Session("courseDuration")&""
												
										   Case 114
												Session("State")="verified14"
												str="Your membership allows you access to <a href=""/methodology/tour6.asp"">all sections of Service Strategy Online course</a> for "&DateDiff("d",Session("DateEntered"),Session("DateValid"))&" Days"
												Session("Item")="Online Cert"
												
											Case 115
												Session("State")="verified15"
												str="Your membership allows you access to <a href=""/methodology/tour7.asp"">all sections of Service Transition Online course</a> for "&DateDiff("d",Session("DateEntered"),Session("DateValid"))&" Days"
												Session("Item")="Online Cert"
												
											Case 116
												Session("State")="verified16"
												str="Your membership allows you access to <a href=""/methodology/tour8.asp"">all sections of Service Design Online course</a> for "&DateDiff("d",Session("DateEntered"),Session("DateValid"))&" Days"
												Session("Item")="Online Cert"
												
											Case 117
												Session("State")="verified17"
												str="Your membership allows you access to <a href=""/methodology/tour9.asp"">all sections of Service Operation</a> for "&DateDiff("d",Session("DateEntered"),Session("DateValid"))&" Days"
												Session("Item")="Online Cert"
												
											'*************PPO********
										   	Case 118
												Session("State")="verified18"
												str="Your membership allows you access to <a href=""/methodology/ITIL-Intermediate-PPO-ClassroomTraining.asp"">all sections of ITIL Intermediate (PPO) Online course</a> for "&DateDiff("d",Session("DateEntered"),Session("DateValid"))&" Days"
												Session("Item")="Online Cert"
											'*********ppo*************	
											'*************SOA********
										   	Case 119
												Session("State")="verified19"
												str="Your membership allows you access to <a href=""/methodology/ITIL-Intermediate-SOA-ClassroomTraining.asp"">all sections of ITIL Intermediate (SOA) Online course</a> for "&DateDiff("d",Session("DateEntered"),Session("DateValid"))&" Days"
												Session("Item")="Online Cert"
											'*********SOA*************	
											'*************RCV********
										   	Case 120
												Session("State")="verified20"
												str="Your membership allows you access to <a href=""/methodology/ITIL-Intermediate-RCV-ClassroomTraining.asp"">all sections of ITIL Intermediate (RCV) Online course</a> for "&DateDiff("d",Session("DateEntered"),Session("DateValid"))&" Days"
												Session("Item")="Online Cert"
											'*********RCV*************	
											'*************MALC********
										   	Case 121
												Session("State")="verified21"
												str="Your membership allows you access to <a href=""/methodology/ITIL-Intermediate-MALC-ClassroomTraining.asp"">all sections of ITIL Intermediate (MALC) Online course</a> for "&DateDiff("d",Session("DateEntered"),Session("DateValid"))&" Days"
												Session("Item")="Online Cert"
											'*********MALC*************
											
										   Case Else
										
										
											Session("State")=""

									End Select
									
											'Restrict the simulators to all'
										
										Select Case item_number
										
											Case 102, 103, 104, 106
											
												Session("ITILSim") = "Sim1"
										
										    Case 109
												
												Session("ITILCSI") = "CSISample"
												
											Case 111
												
												Session("ITILOSA") = "OSASample"
											
											Case 112
											
												Session("ITIL40Sim") = "40Ques"
												
											Case 114
											
												Session("ServiceStrategy-sim") = "ServiceStrategySim"
												
											Case 115
											
												Session("ServiceStrategy-sim") = "ServiceTransitionSim"
												
											Case 116
											
												Session("ServiceStrategy-sim") = "ServiceDesignSim"
											
											
											Case 0051
											
												Session("ITIL15Sim") = "15Ques"
											
											Case 118
												
												Session("ITILPPO") = "PPOSample"
												
											Case 119
												
												Session("ITILSOA") = "SOASample"
												
											Case 120
												
												Session("ITILRCV") = "RCVSample"
												
											Case 121
												
												Session("ITILMALC") = "MALCSample"
																								
											Case Else
											 
										End Select
										
									
										Session("CourseDetails") = str
										'code for checking and redirection
										  Set objRs1 = Server.CreateObject("ADODB.Recordset")
						dim query1
                                 mydate = month(date())&"-"&day(date())&"-"&year(date())
						query1 = "SELECT Top 1 payer_email FROM PaypalDb WHERE customer_id = '"&session("current_user_id")&"' and convert(date,date_valid) >='"&mydate&"' ORDER BY id desc"
						'response.write query1
                                objRs1.open query1,ConnObj						
						if Not objRs1.eof  then						
								
						Response.Redirect("/Mycourses.asp")
						
						else
					
						Response.Redirect("/ITIL-Online-Courses.asp")
						
						end if
						 Set objRs1 = nothing
										'end of code
								
									%>                                 
                                    
                                    
					  <div><span class="Header">Welcome <%=Session("FirstName")%>&nbsp;<%=Session("LastName")%></span></div>
						  <p><span class="SubHeader">Your membership and access details: </span></p>
						  <table width = "60%" border="0" cellpadding="0" cellspacing="0" class="TableGeneral">
						    <tr>
						      <td class="TableRowOdd"><span class="TableCopyDetails">Date of enrollment :</span></td>
						      <td class="TableRowOdd"><span class="TableCopyName"><%=rsQues2("date_entered")%></span></td>
						    </tr>
						    <tr >
						      <td class="Tablefooter"><span class="TableCopyDetails">Date of expiry :</span></td>
						      <td class="Tablefooter"><span class="TableCopyName"><%=Session("DateValid")%></span></td>
						    </tr>
							
						  </table>
						  <br />
						  <span class="general-bodyBold">(All dates in MM/DD/YYYY format)</span></div>
						<br />
						
		
							<div><span class="general-bodyBold">Course Duration: </span> <%=Session("CourseDetails")%></div>
							
						
						<!-- <p><span class="general-bodyBold">Duration of access: </span><%' = DateDiff("d",Session("DateEntered"),Session("DateValid")) 
						%> Days</p>
						 
			<p> &nbsp; <a href="/overview.asp">Please click here to access your course</a></p>-->
						 <br />
						<div> &nbsp; <a href="http://www.ITILstudy.com/index.asp">Go to Home Page</a></div><br /><br />
						  <%else 
						   Set objRs1 = Server.CreateObject("ADODB.Recordset")
                              mydate = month(date())&"-"&day(date())&"-"&year(date())
						  query1 = "SELECT Top 1 payer_email FROM PaypalDb WHERE customer_id = '"&session("current_user_id")&"' and convert(date,date_valid) >='"&mydate&"' ORDER BY id desc"
						objRs1.open query1,ConnObj						
						if objRs1.eof = false then						
								
						Response.Redirect("/Mycourses.asp")
						
						else
					
						Response.Redirect("/ITIL-Online-Courses.asp")
						
						end if
						  %>
						 <div><span class="Header">Welcome <%=Session("FirstName")%>&nbsp;<%=Session("LastName")%>.</span>
						  <br />
						  <p>Your membership has expired. You will have to renew your membership to continue accessing paid services
						  at ITILstudy.com </p>
						  <p><a href="http://www.ITILstudy.com/index.asp">Click here to continue...</a></p><br /><br />
						  </td>
						</div>
						<%end if%>
						<%Else
										End If
									Else%>
									<% 'code by me
									'response.write("abc")
						Set objRs = Server.CreateObject("ADODB.Recordset")		
						strQuery = "SELECT TOP 1 Id,email,account_type_id,first_name,last_name FROM Customer_Accounts WHERE email='"&payer_email&"' AND Password='"&pass&"' ORDER BY Id DESC"
						objRs.open strQuery,ConnObj						
						
												
					 if objRs.eof = false then
					 session("current_user_id")=objRs("Id")
					 session("account_type_id")=objRs("account_type_id")
					  
					 Session("FirstName")=objRs("first_name")	
						Session("LastName")=objRs("last_name")
						session("loggedinEmail")=objRs("email")
						Set objRs1 = Server.CreateObject("ADODB.Recordset")
						'dim strEmailID
                        mydate = month(date())&"-"&day(date())&"-"&year(date())
						strEmailID = "SELECT ID, payer_email FROM PaypalDb WHERE customer_id = '"&objRs("Id")&"' and convert(date,date_valid) >='"&mydate&"' ORDER BY id desc"
						objRs1.open strEmailID,ConnObj
						if objRs1.eof = false then                       
					Response.Redirect("/Mycourses.asp")
                  else
				  Response.Redirect("/ITIL-Online-Courses.asp")		
						 End If
					 end if
						%>
						<div> <span class="Error">The password is incorrect - please enter password again.</span>
						  <table border="0" cellpadding="4" cellspacing="0">
						    <form method="POST" action="/verifyLogin1.asp" name="form2" onSubmit="return Form_Validator1(this)">
						      <tr valign="top" bgcolor="#FFFFFF">
						        <td colspan="2" align="left" valign="middle" height="30"><span class="SubHeader">Provide Email ID 
								and password to access different services in ITILstudy.com.</span> </td>
						      </tr>
						      <tr valign="top">
						        <td><span class="general-bodyBold">Email</span><span class="Required">*</span> :</td>
						        <td>
								<input id="mail" style="color: rgb(161, 161, 161);width:200px;" size="50"  class="TeXtField" name="payer_email" value="Enter your email address" onfocus='myObj = document.getElementById("mail");if(this.value=="Enter your email address") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("mail");if(myObj.value == "") myObj.value="Enter your email address";myObj.style.color = "#a1a1a1";if(myObj.value!="Enter your email address") myObj.style.color="#000000";' size="30" type="text">
								</td>
						      </tr>
						      <tr valign="top">
						        <td ><span class="general-bodyBold">Password</span><span class="Required">*</span> :</td>
						        <td >
								<input id="pwd" style="color: rgb(161, 161, 161);" size="20" maxlength="10" class="TeXtField" name="pass" value="********" onfocus='myObj = document.getElementById("pwd");if(this.value=="********") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("pwd");if(myObj.value == "") myObj.value="********";myObj.style.color = "#a1a1a1";if(myObj.value!="********") myObj.style.color="#000000";' size="30" type="password" />
						          Maximum length:10, Only Numbers and Characters allowed</td>
						      </tr>
						      <tr>
						        <td colspan="2">&nbsp;</td>
						      </tr>
						      <tr>
						        <td>&nbsp;</td>
						        <td><input type="submit" value="Submit" class="ButtonGeneral" style="width:60px;">
						          &nbsp; &nbsp;
						          <input type="reset" value="Reset" class="ButtonGeneral" style="width:60px;"></td>
						      </tr>
						    </form>
						  </table>
						</div>
						<br />
						<%End If%>
						<%Else%>
						<% 'code by me
						Set objRs = Server.CreateObject("ADODB.Recordset")		
						strQuery = "SELECT TOP 1 Id,email,account_type_id,first_name,last_name FROM Customer_Accounts WHERE email='"&payer_email&"' AND Password='"&pass&"' ORDER BY Id DESC"
						objRs.open strQuery,ConnObj						
						
												
					 if objRs.eof = false then
					 session("current_user_id")=objRs("Id")
					 session("account_type_id")=objRs("account_type_id")
					 
					 Session("FirstName")=objRs("first_name")	
						Session("LastName")=objRs("last_name")
						session("loggedinEmail")=objRs("email")
						Set objRs1 = Server.CreateObject("ADODB.Recordset")
						'dim strEmailID
                            mydate = month(date())&"-"&day(date())&"-"&year(date())
						strEmailID = "SELECT ID, payer_email FROM PaypalDb WHERE customer_id = '"&objRs("Id")&"' and convert(date,date_valid) >='"&mydate&"' ORDER BY id desc"
						objRs1.open strEmailID,ConnObj
						if objRs1.eof = false then                       
					Response.Redirect("/Mycourses.asp")
                  else
				  Response.Redirect("/ITIL-Online-Courses.asp")		
						 End If
					 end if
						%>
						<div><span class="Error">The email ID is incorrect - please enter again.</span>
						  <table border="0" cellpadding="4" cellspacing="0">
						    <form method="POST" action="/verifyLogin1.asp" name="form2" onSubmit="return Form_Validator1(this)">
						      <tr >
						        <td colspan="2" align="left" valign="middle" height="30"><span class="SubHeader">Provide Email ID 
								and password to access different services in ITILstudy.com.</span> </td>
						      </tr>
						      <tr valign="top">
						        <td><span class="general-bodyBold">Email</span><span class="Required">*</span> :</td>
						        <td>
								<input id="mail" style="color: rgb(161, 161, 161);width:200px;" size="50"  class="TeXtField" name="payer_email" value="Enter your email address" onfocus='myObj = document.getElementById("mail");if(this.value=="Enter your email address") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("mail");if(myObj.value == "") myObj.value="Enter your email address";myObj.style.color = "#a1a1a1";if(myObj.value!="Enter your email address") myObj.style.color="#000000";' size="30" type="text">
								</td>
						      </tr>
						      <tr valign="top">
						        <td ><span class="general-bodyBold">Password</span><span class="Required">*</span> :</td>
						        <td >
								<input id="pwd" style="color: rgb(161, 161, 161);" size="20" maxlength="10" class="TeXtField" name="pass" value="********" onfocus='myObj = document.getElementById("pwd");if(this.value=="********") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("pwd");if(myObj.value == "") myObj.value="********";myObj.style.color = "#a1a1a1";if(myObj.value!="********") myObj.style.color="#000000";' size="30" type="password" />
						          Maximum length:10, Only Numbers and Characters allowed</td>
						      </tr>
						      <tr>
						        <td colspan="2">&nbsp;</td>
						      </tr>
						      <tr>
						        <td>&nbsp;</td>
						        <td><input type="submit" value="Submit" class="ButtonGeneral" style="width:60px;">
						          &nbsp; &nbsp;
						          <input type="reset" value="Reset" class="ButtonGeneral" style="width:60px;"></td>
						      </tr>
						    </form>
						  </table>
						</div>
						<%


	End if%>
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
