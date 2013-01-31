<!-- virtual="/includes/header.asp"-->
<!-- virtual="/includes/innerloginbanner.html"-->
<!-- virtual="/metatags/memberlogin_metatag.html"-->
<!--#include virtual="/includes/connection.asp"-->
 <link rel="shortcut icon" href="/images/buttons/favicon.ico">

<link rel="stylesheet" type="text/css" href="/css/chromestyle.css">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script type="text/javascript" src="/js/chrome.js"></script>
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

function Form_reg_Validator(theform)
{
  //Check To See If The Current Password Field Is Blank    
  if (theform.first_name.value == "Please Enter Your First Name" || theform.first_name.value =="" || theform.first_name.value.length <2)
  {
    alert("Please enter first name");
    theform.first_name.focus();
	return(false);
  }
   if (theform.last_name.value == "Please Enter Your Last Name" || theform.last_name.value =="" || theform.last_name.value.length<1)
  {
    alert("Please enter last name");
    theform.last_name.focus();
	return(false);
  }				
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
  if (theform.pass.value.length<6)
  {
    alert("Password length must be 6 or greater");
    theform.pass.focus();
	return(false);
  }  
  if (theform.repass.value !=theform.pass.value )
  {
    alert("Password mismatch");
    theform.repass.focus();
	return(false);
  }
  if (isNaN(theform.phone.value))
  {
    alert("Please enter numeric only");
    theform.last_name.focus();
	return(false);
  }
  										  
}

</script>

 <!-- Body Starts --> 
  <div>
  <%
  if request.Querystring("n")<>"" then ' 'n' refer to the item no like n=112 means item no=112
session("Newitem_number")=request.Querystring("n")
end if
 
  session("fbRedirectUrl")="http://www.itilstudy.com/fbApp/fb.asp" 'session for fblogin redirecturl
  session("returnUrl")=true   ' initialized here for the first time(need in case of pop up)
 
  %>
  	<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
	<tbody>
	<tr>	
	 
       <td id="imageHover">	   
	   <div id="imageHover" style="position:relative;border-bottom:1px dashed #cfcfcf">
	   <img border="0" id="imageHover" usemap="#MapLogo" alt="ITILstudy" src="/images/buttons/logo_top.jpg"/>
	  
          <map id="MapLogo" name="MapLogo">
    <area href="/index.asp" coords="12,0,236,67" shape="rect">
  </map>
  </div>
      </td>
      
    </tr>
	</tbody>
		<tr>
			<td height="235" align="left" valign="top" bgcolor="#FFFFFF">
				<table width="100%" border="0" cellspacing="0" cellpadding="8">                
                  <tr>
					<!--virtual="/includes/innerLeftMenu.asp"-->
					<td>
					 <table border="0" cellpadding="4" cellspacing="0" width="">
						    <form method="POST" action="/verifySignin.asp" name="form2" onSubmit="return Form_Validator(this)">
                            
						      <tr>
						        <td colspan="3"><h1 class="PageTitle">Log in or use facebook login</h1></td>
						      </tr>
						      <tr>
						        <td colspan="3"></td>
						      </tr>
						      <tr>
						        <td width="20%" valign="middle"><span class="general-bodyBold">User ID </span><span class="Required">*</span>:</td>
						        <td width="30%">
								<input id="mail" style="color: rgb(161, 161, 161);width:200px;" size="50"  class="TeXtField" name="payer_email" value="Enter your email address" onfocus='myObj = document.getElementById("mail");if(this.value=="Enter your email address") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("mail");if(myObj.value == "") myObj.value="Enter your email address";myObj.style.color = "#a1a1a1";if(myObj.value!="Enter your email address") myObj.style.color="#000000";' size="30" type="text" />
								</td>
                                <%
                                Isfblogin=true 'make it false if facebook login not required
								if Isfblogin=true then%>
                                <td  width="25%"  valign="middle" style="float:left" >								
								<a href="/fbApp/fb.asp" style="display: block;margin-top: -4px;" title="Login through facebook account"><img src="/images/flogin.gif"/> </a>
								<!--<a href="javascript:void(0);" onclick="openWindow()" title="Login using facebook account" style="display: block;margin-top: -4px;"><img src="/images/flogin.gif"/> </a>-->                               
								</td>
								 <% end if%>
								 
						      </tr>
						      <tr>
						        <td><span class="general-bodyBold">Password</span><span class="Required">*</span>:</td>
						        <td colspan="2" valign="middle">
								<input id="pwd" style="color: rgb(161, 161, 161);" size="20" maxlength="10" class="TeXtField" name="pass" value="********" onfocus='myObj = document.getElementById("pwd");if(this.value=="********") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("pwd");if(myObj.value == "") myObj.value="********";myObj.style.color = "#a1a1a1";if(myObj.value!="********") myObj.style.color="#000000";' size="30" type="password" />
						          </td>
						      </tr>
						      <tr>
						        <td>&nbsp;</td><td colspan="2"><input type="submit" class="ButtonGeneral" value="Submit" style="width:60px;" >
								
						          <input type="reset" value="Reset" class="ButtonGeneral" style="width:60px;"> 
						        </td>								
						      </tr>
							  <tr>
							  <td>&nbsp;</td>
							  <td>
								 <a href="/Dutch/ForgotPassword-nl.asp">Forgot Password?</a>
								</td>
							  </tr>
						    </form>
						  </table>
					
					</td>
                    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
					<div style="margin-top:-12px; width:95%;">
					<br />

						<div>
						 <table border="0" cellpadding="4" cellspacing="0" width="">
						   <form method="POST" action="/Dutch/verifyregister.asp" name="form2" onSubmit="return Form_reg_Validator(this)">
                          <!--  <form method="POST" action="/Registeremail.asp" name="form2" onSubmit="return Form_reg_Validator(this)">-->
						      <tr>
						        <!--<td colspan="2"><h1 class="PageTitle">Please Register <span style=""> | </span><a href="/fbApp/fb.asp"><img src="/images/flogin.gif"/> </a> </h1></td>-->
								 <td colspan="2"><h1 class="PageTitle">Have a Account</h1></td>
								 <!--<td><a href="/fbApp/fb.asp"><img src="/images/flogin.gif"/> </a> </td>-->
						      </tr>						     
							  <tr>
						        <td><span class="general-bodyBold">firstname:</span><span class="Required">*</span>:</td>
						        <td>
								 <input type="text" name="first_name" value="<%=first_name%>" class="TeXtField"></td>
						      </tr>
							  <tr>
						        <td><span class="general-bodyBold">Last Name</span><span class="Required">*</span>:</td>
						        <td>
								<input type="text" name="last_name" value="<%=last_name%>" class="TeXtField"></td>
						      </tr>
						      <tr>
						        <td><span class="general-bodyBold">User ID (Email)</span><span class="Required">*</span>:</td>
						        <td>
								<input id="email" style="color: rgb(161, 161, 161);width:200px;" size="50"  class="TeXtField" name="payer_email" value="Enter your email address" onfocus='myObj = document.getElementById("email");if(this.value=="Enter your email address") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("email");if(myObj.value == "") myObj.value="Enter your email address";myObj.style.color = "#a1a1a1";if(myObj.value!="Enter your email address") myObj.style.color="#000000";' size="30" type="text" />
								</td>
                               <!-- <td>
                                <a href="/fbApp/fb.asp"><img src="/images/flogin.gif"/> </a>
                                </td>-->
						      </tr>
						      <tr>
						        <td><span class="general-bodyBold">Password</span><span class="Required">*</span>:</td>
						        <td>
								<input id="newpwd" style="color: rgb(161, 161, 161);" size="20" maxlength="10" class="TeXtField" name="pass" value="********" onfocus='myObj = document.getElementById("newpwd");if(this.value=="********") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("newpwd");if(myObj.value == "") myObj.value="********";myObj.style.color = "#a1a1a1";if(myObj.value!="********") myObj.style.color="#000000";' size="30" type="password" />
						          &nbsp;&nbsp;Maximum length: 10</td>
						      </tr>	
 <tr>
						        <td><span class="general-bodyBold">Re-Password</span><span class="Required">*</span>:</td>
						        <td>
								<input id="renewpwd" style="color: rgb(161, 161, 161);" size="20" maxlength="10" class="TeXtField" name="repass" value="********" onfocus='myObj = document.getElementById("renewpwd");if(this.value=="********") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("renewpwd");if(myObj.value == "") myObj.value="********";myObj.style.color = "#a1a1a1";if(myObj.value!="********") myObj.style.color="#000000";' size="30" type="password" />
						          &nbsp;&nbsp;Maximum length: 10</td>
						      </tr>	
          <tr>
						        <td><span class="general-bodyBold">Contact-no</span>:</td>
						        <td>
								 <input type="text" name="phone" class="TeXtField"></td>
						      </tr>
                             <tr>
						        <td><span class="general-bodyBold">Company</span>:</td>
						        <td>
								 <input type="text" name="Company" class="TeXtField"></td>
		   </tr>							  
						      <tr>
						        <td>&nbsp;</td><td><input type="submit" class="ButtonGeneral" value="Submit" style="width:60px;" >
								
						          <input type="reset" value="Reset" class="ButtonGeneral" style="width:60px;">                                  
                          
                             
						        </td>
						      </tr>
						    </form>
						  </table>
						</div>
						
					
			</div>		</td>
                    </tr>


                </table>
          </td>
		</tr>
	</table>
  </div>
  <!-- Body Ends -->
<!-- virtual="/includes/footer.html"-->
