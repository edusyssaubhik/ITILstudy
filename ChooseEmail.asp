<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerloginbanner.html"-->
<!--#include virtual="/metatags/memberlogin_metatag.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/MyCourseHeader.asp"-->
<script type="text/javascript">
<!--
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
-->
</script>
 <!-- Body Starts --> 
 <%
 dim syncWithFb
 ' if session("SyncOtherAccount")<>true then
 ' Response.Redirect("/ITIL-Online-Courses.asp")
 ' end if
  If not trim(session("current_user_id")) = "" then
	  if session("account_type_id")=1 then 'user has been registered through our site
	                  Set objCm = Server.CreateObject("ADODB.Recordset")
					
						strEmailID = "SELECT * FROM related_customer_accounts WHERE customer_id = '"&session("current_user_id")&"' And account_type_id=2" '2 for facebook
						objCm.open strEmailID,ConnObj
						
						if not objCm.eof = false then	'means has no any record in table
						syncWithFb=true
						
	            	session("fbRedirectUrl")="http://www.itilstudy.com/fbApp/fb-sync.asp" 'session for fblogin redirecturl
	
	                    end if
	  end if
	  else
 Response.Redirect("/ITIL-Online-Courses.asp")
  end if
  
 payer_email = Request.Form("payer_email")
 
 dim changedEmail , Isexists 
 if payer_email<>"" then
			Set objRs2 = Server.CreateObject("ADODB.Recordset")
						dim strEmailID
						strEmailID = "SELECT top 1 ID, email FROM Customer_Accounts WHERE email = '"&payer_email&"' ORDER BY id desc"
						objRs2.open strEmailID,ConnObj           
			if not objRs2.eof = false then 'means there is no value in recordset
 
				Set objRs3 = Server.CreateObject("ADODB.Recordset")
					
						strEmailID = "SELECT top 1 ID, payer_email,first_name,last_name FROM PaypalDb WHERE payer_email = '"&payer_email&"' ORDER BY id desc"
						objRs3.open strEmailID,ConnObj           'get all paypal value using email
		           if objRs3.eof = false then
						Set objTypeLib	= Server.CreateObject("ScriptLet.TypeLib")
                         guidNew = Left(objTypeLib.GUID, 38)
						 guidother = Left(objTypeLib.GUID, 38)
                        
					  Set objTypeLib	= Nothing
					  guidNew=CStr(guidNew)
					  
					  
						Function StrQuoteReplace(guidNew)
						  guid1 = Replace(guidNew, "{", "") 
                          StrQuoteReplace = Replace(guid1, "}", "") 						  
						End Function

					guidNew = StrQuoteReplace(guidNew)
					
					Set objTypeLib	= Server.CreateObject("ScriptLet.TypeLib")
						 guidother = Left(objTypeLib.GUID, 38)
						 Set objTypeLib	= Nothing
					 guidother=CStr(guidother)
					guidother=StrQuoteReplace(guidother)
						  
						
					  ConnObj.Execute "UPDATE Customer_Accounts SET  emailverification_code = '"&guidNew&"' WHERE Id ='"&session("current_user_id")&"'"
					  
					  ConnObj.Execute "UPDATE PayPalDB SET  EmailVerifycationcode = '"&guidother&"' WHERE Id ='"&objRs3("Id")&"'"
					  
					  dim key
					 
					  key=guidother+","+guidNew
					                  dim  MessageBody			 
					      ' MessageBody="Dear "&first_name&" "&last_name&", <BR><BR>Welcome to ITILstudy.com - <BR>(<a href=http://www.itilstudy.com/EmailVerify.asp?key="&key&"> Click here To verify</a>)<br><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"
						  
						 MessageBody="Dear "&objRs3("first_name")&" "&objRs3("last_name")&", <BR><BR>You have attempted to sync your Enrolled account with your ITILstudy main account.<BR><BR>Please note that this is only a One Time process and need not be repeated. Kindly <a href=http://www.itilstudy.com/EmailVerify.asp?key="&key&"> click here </a> to complete the process.<BR><BR>We would request you to keep your login details safely. If you have any questions, please feel free to email us at adminsupport@ITILstudy.com<br><BR>Thank you. We look forward to having you as our student.<BR><BR>Best Regards,<BR><br>Customer Support,<BR><a href = ""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com</a><BR>Email: <a href=""mailto: adminsupport@itilstudy.com"">adminsupport@itilstudy.com</a>"

								MessageSubject="Welcome to www.ITILstudy.com ( "&Session("FirstName")&" "&Session("LastName")&" )"
				    Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
					objCDOMail.From = "marketing@itilstudy.com"
					objCDOMail.To =  payer_email
					' objCDOMail.Bcc = "projstudy-leadership@googlegroups.com"
					objCDOMail.Importance = 2
					objCDOMail.Subject = "Please Verify the email sync request from ITILStudy.com"
					objCDOMail.BodyFormat = 0
					objCDOMail.MailFormat = 0
					objCDOMail.Body =  MessageBody
					objCDOMail.Send
					
					Set objCDOMail = Nothing
							
							 Set objRs2 = Nothing
							 Set objRs3= Nothing
					changedEmail="true"
					else
					changedEmail="false"
					   end if
					   
					   else
					   Isexists=true
 end if
  end if
 %>
  <div>  
  	<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="235" align="left" valign="top" bgcolor="#FFFFFF">
				<table width="100%" border="0" cellspacing="0" cellpadding="8">

                  <tr>
                    <td width="2%">&nbsp;</td>
                    <td width="25%">&nbsp;</td>
                   <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; choose Email</td>
                  </tr>
                  <tr>
					<%
				  'code by chandan to remove session of state in mycourses page
				  newstate=Session("State")
				  Session.Contents.Remove("State")
	   %>
          <!--#include virtual="/includes/innerLeftMenu.asp"-->
		  <%   Session("State") =newstate %>
         
                    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
					<div style="margin-top:-12px; width:95%;">
					<br />

						<div>
						  <table border="0" cellpadding="4" cellspacing="0" width="">
						   <%						  
						  if Isexists=true then
						  %>
						   <tr>
						        <td colspan="2"><h1 class="PageTitle">This User already have a account with us </h1></td>
						      </tr>						      
							  <tr>
							  <td>
							 <div> <span class="Error">Please enter other email.</span>

							  </td>
							  </tr>
							   <form method="POST" action="/ChooseEmail.asp" name="form2" onSubmit="return Form_Validator(this)">                           
						      
						      <tr>
						        <td><span class="general-bodyBold">Enter Email</span>:</td>
						        <td>
								<input id="mail" style="color: rgb(161, 161, 161);width:200px;" size="50"  class="TeXtField" name="payer_email" value="Enter your email address" onfocus='myObj = document.getElementById("mail");if(this.value=="Enter your email address") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("mail");if(myObj.value == "") myObj.value="Enter your email address";myObj.style.color = "#a1a1a1";if(myObj.value!="Enter your email address") myObj.style.color="#000000";' size="30" type="text" />
								</td>     
                            <% if syncWithFb=true And Isfblogin=true then ' Isfblogin is global varible to show facebook button 
							%>								
								<td>
								<a  style="display: block;margin-top: -4px;" href="javascript:void(0);" onclick="openWindow()" title="Login using facebook account" title="Sync this account with facebook"><img src="/images/Fbsync.png"/></a>
								</td>
                                <% end if %>									
						      </tr>
						    
						      <tr>
						        <td>&nbsp;</td><td><input type="submit" class="ButtonGeneral" value="Submit" style="width:60px;" >
								
						          <input type="reset" value="Reset" class="ButtonGeneral" style="width:60px;">
                                  
                            
						        </td>
						      </tr>
						    </form>
						  <%
						  else
						  %>
						  <%
						  if changedEmail="true" then
						  %>
						   <tr>
						        <td colspan="3"><h1 class="PageTitle">Email sent </h1></td>
						      </tr>
						      <tr>
						        <td colspan="3">&nbsp;</td>
						      </tr>
							  <tr>
							  <td>
							  An Email has been sent to your email id with a verifycation link, Please click on it to verify.
							  </td>
							  </tr>
							  <%
						 ElseIf changedEmail="false" then
						  %>
						   <tr>
						        <td colspan="3"><h1 class="PageTitle">Incorrect Email </h1></td>
						      </tr>						     
							  <tr>
							  <td>
                    <div> <span class="Error">Email Id does not exists.</span>

							  </td>
							  </tr>
							   <form method="POST" action="/ChooseEmail.asp" name="form2" onSubmit="return Form_Validator(this)">                           
						    
						      <tr>
						        <td><span class="general-bodyBold">Enter Email</span>:</td>
						        <td>
								<input id="mail" style="color: rgb(161, 161, 161);width:200px;" size="50"  class="TeXtField" name="payer_email" value="Enter your email address" onfocus='myObj = document.getElementById("mail");if(this.value=="Enter your email address") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("mail");if(myObj.value == "") myObj.value="Enter your email address";myObj.style.color = "#a1a1a1";if(myObj.value!="Enter your email address") myObj.style.color="#000000";' size="30" type="text" />
								</td>   
                              <% if syncWithFb=true And Isfblogin=true then ' Isfblogin is global varible to show facebook button 
							  %>								
								<td>
								<a style="display: block;margin-top: -4px;" href="javascript:void(0);" onclick="openWindow()" title="Login using facebook account" title="Sync this account with facebook"><img src="/images/Fbsync.png"/></a>
								</td>
                                <% end if %>								
						      </tr>
						    
						      <tr>
						        <td>&nbsp;</td><td><input type="submit" class="ButtonGeneral" value="Submit" style="width:60px;" >
								
						          <input type="reset" value="Reset" class="ButtonGeneral" style="width:60px;">
                                  
                            
						        </td>
						      </tr>
						    </form>
						  <%
						else
						dim msg
						msg=session("errormsg")
						session("errormsg")=""
						  %>
						  
						    <form method="POST" action="/ChooseEmail.asp" name="form2" onSubmit="return Form_Validator(this)">
                            
						      <tr>
						        <td colspan="3"><h1 class="PageTitle">Choose Email Id with which you have already enrolled for Courses.</h1></td>
						      </tr>
							    <tr>
								</br>
<td colspan="3"> You can sync all your enrolled accounts with your profile by using the sync feature,on entering your previously enrolled email id.
 <% if syncWithFb=true And Isfblogin=true then ' Isfblogin is global varible to show facebook button 
 %>
</br> And also you can sync with your facebook account by clicking on fbsync button.
<% end if %>
</br/></br>
</td>
</tr>
						      <tr>
						        <td colspan="3"><span class="Error"><%=msg%></span></td>
						      </tr>
						      <tr>
							  
						        <td><span class="general-bodyBold">Enter Email</span>:</td>
						        <td>
								<input id="mail" style="color: rgb(161, 161, 161);width:200px;" size="50"  class="TeXtField" name="payer_email" value="Enter your email address" onfocus='myObj = document.getElementById("mail");if(this.value=="Enter your email address") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("mail");if(myObj.value == "") myObj.value="Enter your email address";myObj.style.color = "#a1a1a1";if(myObj.value!="Enter your email address") myObj.style.color="#000000";' size="30" type="text" />
								</td>    
                       <% if syncWithFb=true And Isfblogin=true then ' Isfblogin is global varible to show facebook button 
							  %>								
								<td>
								<a href="javascript:void(0);" onclick="openWindow()" title="Sync this account with facebook" style="display: block;margin-top: -13px;float: left;"><img src="/images/Fbsync.png"/></a>
								</td>
                                <% end if %>									
						      </tr>
						    
						      <tr>
						        <td>&nbsp;</td><td><input type="submit" class="ButtonGeneral" value="Submit" style="width:60px;" >
								
						          <input type="reset" value="Reset" class="ButtonGeneral" style="width:60px;">
                                  
                            
						        </td>
						      </tr>
						    </form>
							<%
						 end if
						  %>
						  <%
						  end if
						  %>
						  </table>
						  <%  if syncWithFb=true then%>
<script type="text/javascript">
function openWindow(url) 
{
var url="/FbApp/Fb-Sync.asp";
    popupWin = window.open(url,'popup','width=850,height=490,title="facebook Login"')
}
</script>
<% end if%>

						</div>
						
						
			</div>		</td>
                    </tr>


                </table>
          </td>
		</tr>
	</table>
  </div>
  <!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->