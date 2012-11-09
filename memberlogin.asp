<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerloginbanner.html"-->
<!--#include virtual="/metatags/memberlogin_metatag.html"-->
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
  <div>
  <%
  If not trim(session("current_user_id")) = "" then 'this means user is logged in so no need to come to memberlogin page
   response.redirect("/index.asp") 
  end if
  dim country
  country=Session("CountryOrigin")
  Session.Contents.RemoveAll()
  Session("CountryOrigin")=country 
  session("fbRedirectUrl")="http://www.itilstudy.com/fbApp/fb.asp" 'session for fblogin redirecturl
 
  %>
  	<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="235" align="left" valign="top" bgcolor="#FFFFFF">
				<table width="100%" border="0" cellspacing="0" cellpadding="8">

                  <tr>
                    <td width="2%">&nbsp;</td>
                    <td width="25%">&nbsp;</td>
                   <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; Login</td>
                  </tr>
                  <tr>
					<!--#include virtual="/includes/innerLeftMenu.asp"-->
                    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
					<div style="margin-top:-12px; width:95%;">
					<br />

						<div>
						  <table border="0" cellpadding="4" cellspacing="0" width="">
						    <form method="POST" action="/verifyLogin1.asp" name="form2" onSubmit="return Form_Validator(this)">
                            
						      <tr>
						        <td colspan="3"><h1 class="PageTitle">User ID (Email)  and Password for Member Login</h1></td>
						      </tr>
						      <tr>
						        <td colspan="3">&nbsp;</td>
						      </tr>
						      <tr>
						        <td width="20%" valign="middle"><span class="general-bodyBold">User ID (Email)</span><span class="Required">*</span>:</td>
						        <td width="30%">
								<input id="mail" style="color: rgb(161, 161, 161);width:200px;" size="50"  class="TeXtField" name="payer_email" value="Enter your email address" onfocus='myObj = document.getElementById("mail");if(this.value=="Enter your email address") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("mail");if(myObj.value == "") myObj.value="Enter your email address";myObj.style.color = "#a1a1a1";if(myObj.value!="Enter your email address") myObj.style.color="#000000";' size="30" type="text" />
								</td>
								<% if Isfblogin=true then%>
                                <td  width="25%"  valign="middle" style="float:left" >								
								<!--<a href="/fbApp/fb.asp" style="display: block;margin-top: -4px;"><img src="/images/flogin.gif"/> </a>-->
								<a href="javascript:void(0);" onclick="openWindow()" title="Login using facebook account" style="display: block;margin-top: -4px;"><img src="/images/flogin.gif"/> </a>                               
								</td>
								 <% end if%>
						      </tr>
						      <tr>
						        <td><span class="general-bodyBold">Password</span><span class="Required">*</span>:</td>
						        <td colspan="2" valign="middle">
								<input id="pwd" style="color: rgb(161, 161, 161);" size="20" maxlength="10" class="TeXtField" name="pass" value="********" onfocus='myObj = document.getElementById("pwd");if(this.value=="********") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("pwd");if(myObj.value == "") myObj.value="********";myObj.style.color = "#a1a1a1";if(myObj.value!="********") myObj.style.color="#000000";' size="30" type="password" />
						          &nbsp;&nbsp;Maximum length: 10, Only alphanumeric characters allowed</td>
						      </tr>
						      <tr>
						        <td>&nbsp;</td><td colspan="2"><input type="submit" class="ButtonGeneral" value="Submit" style="width:60px;" >
								
						          <input type="reset" value="Reset" class="ButtonGeneral" style="width:60px;">
                                  
                             <a href="ForgotPassword.asp">Forgot Password?</a>&nbsp;&nbsp;
							  <a href="Register.asp">New Sign up</a>
                             
						        </td>
						      </tr>
						    </form>
						  </table>
						</div>
						<div>
						  <p><span class="general-bodyBold">Please note</span>: If you have not reset your User ID and password while enrolling in ITILstudy.com,  your</p>
						  <ul>
						    <li>Default User ID (Email): This is your <span class="general-bodyBold">Email ID</span> with which you had enrolled.</li>
						   <li>If you have not enrolled please <a href="/ITIL-Courses.asp">Click here</a>.</span></li>
						  </ul>
						</div>
						<div class="button">
                     
                        
						  <form method="POST" action="/changepassword.asp">
						    <input type="hidden" name="changepass" value="one">
						    <input type="submit" class="ButtonGeneral" style="width:300px;" value="Click here if you want to change your password">
						  </form>
<script type="text/javascript">
function openWindow() 
{
var url="/FbApp/Fb.asp";
    popupWin = window.open(url,'popup','width=850,height=490,title="facebook Login"')
}
</script>
						
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
