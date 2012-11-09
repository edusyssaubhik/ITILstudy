 <!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerloginbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->

 <!-- Body Starts --> 
 <div>
 
  	<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="235" align="left" valign="top" bgcolor="#FFFFFF">
				<table width="100%" border="0" cellspacing="0" cellpadding="8">

                  <tr>
                    <td width="2%">&nbsp;</td>
                    <td width="25%">&nbsp;</td>
                   <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; <a href="/MyCourses.asp" title="My Courses">My Courses</a> &raquo; Course Details</td>
                  </tr>
                  <tr>
				   <%
				  'code by chandan to remove session of state in mycourses page
				  'Session.Contents.Remove("State")
				  %>
					
				  <%
dim rollno
 rollno = Request.querystring("roll") 
 
	 If trim(session("current_user_id")) = "" then 'means user not logged in
	 Response.Redirect("/ITIL-Online-Courses.asp")
	 End if
	 if not IsNumeric(rollno) then 'this will check whether value is integer or something else 
	 Response.Redirect("/ITIL-Online-Courses.asp")
	 end if
 
 Set rsQues2 = Server.CreateObject("ADODB.Recordset")
										rsQues2.ActiveConnection = ConnObj
										rsQues2.Open "SELECT paypal_address_id, date_entered,rollno,ID,payer_email, item_number, item_name, date_valid, kno_passed, first_name, last_name FROM PaypalDB WHERE PaypalDB.rollno='"&rollno&"' And PaypalDB.customer_id='"&session("current_user_id")&"'"
										'response.Write("SELECT paypal_address_id, date_entered,rollno,ID, item_number, item_name, date_valid, kno_passed, first_name, last_name FROM PaypalDB WHERE PaypalDB.pass='"&pass&"' and PaypalDB.payer_email='"&payer_email&"' order by ID Desc")
										if rsQues2.eof = false Then
										item_number=rsQues2("item_number")
										item_name=rsQues2("item_name")
										Session("item_number")=item_number
										' Session("FirstName")="Trial"
										' Session("LastName")="Member"
										' Session("FirstName")=rsQues2("first_name")
										' Session("LastName")=rsQues2("last_name")
										Session("ITIL")=rsQues2("paypal_address_id")
										Session("rollNo")=rsQues2("rollno")
										Session("ID")=rsQues2("ID")
										
										Session("DateEntered") = rsQues2("date_entered")
										Session("DateValid")=rsQues2("date_valid")
										Session("KnoPassed")=rsQues2("kno_passed")
									
										Session("PayerEmail")=rsQues2("payer_email") 									
						 				 

										Session("CourseDet1") = CourseDet1
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
%>	
													
                              <!--#include virtual="/includes/innerLeftMenu.asp"-->
                    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
					<div style="margin-top:-12px; width:95%;">      
					  <div><span class="Header">Welcome <%=rsQues2("first_name")%>&nbsp;<%=rsQues2("last_name")%></span></div>
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
						
		<%
		'response.write(Session("CourseDetails")&": :"&item_number)
		%>
							<div><span class="general-bodyBold">Course Duration: </span> <%=Session("CourseDetails")%></div>
							<br/>
							<div><span class="general-bodyBold"></span>To extend online access (only for paid courses), please visit <a href="http://www.itilstudy.com/online-termsandcond.asp">http://www.itilstudy.com/online-termsandcond.asp</a></div>
						
						<!-- <p><span class="general-bodyBold">Duration of access: </span><%' = DateDiff("d",Session("DateEntered"),Session("DateValid")) 
						%> Days</p>
						 
			<p> &nbsp; <a href="/overview.asp">Please click here to access your course</a></p>-->
						 <br />
						 <div> &nbsp; <a href="/Mycourses.asp">Back To My Courses</a></div>
						</br>
						<div> &nbsp; <a href="/ITIL-Online-Courses.asp">Online course list</a></div><br /><br />
						  <%else %>					
                  							
                                   <!--#include virtual="/includes/innerLeftMenu.asp"-->
                    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
					<div style="margin-top:-12px; width:95%;">  
					
					  <div><span class="Header">Welcome <%=rsQues2("first_name")%>&nbsp;<%=rsQues2("last_name")%></span></div>
						  <br />
						  <p>Your membership has expired. You will have to renew your membership to continue accessing paid services
						  at ITILstudy.com </p>
						  <p><a href="/Mycourses.asp">Back To My Courses</a></p>
						  <p><a href="/ITIL-Online-Courses.asp">Online course list</a></p><br /><br />
						  </td>
						</div>
					<%
					end if
					else  'if course not available then show some error msg
					%>			
  


								 <!--#include virtual="/includes/innerLeftMenu.asp"-->
                    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
					<div style="margin-top:-12px; width:95%;">  
                                </br>     
					  <div><span class="Header">The content you sre looking for does not available. </span></div>
						
						  </br> 
						 <div> &nbsp; <a href="/Mycourses.asp">Back To My Courses</a></div>
						</br>
						<div> &nbsp; <a href="/index.asp">Go to Home Page</a></div><br /><br />
						  </div>
						  </td>										
					<%
					end if
					rsQues2.Close
					%>
					  </tr>


                </table>
          </td>
		</tr>
	</table>
  </div>
					 <!--#include virtual="/includes/connectionClose.asp"-->
<!--#include virtual="/includes/footer.html"-->
						