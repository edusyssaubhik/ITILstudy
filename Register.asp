<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerloginbanner.html"-->
<!--#include virtual="/metatags/memberlogin_metatag.html"-->
<!--#include virtual="/includes/connection.asp"-->
<%

       first_name    =  Session("first_name")     
	   last_name     =  Session("last_name")    
	   payer_email   =  Session("payer_email")    
	   phone         =  Session("phone") 	    
	   
	   
      
	   Session("first_name")   =   ""
	   Session("last_name")    =   ""
	   Session("payer_email")  =   ""
	   Session("phone") 	   =   ""
	  
	   ErrorFirstName = Session("ErrorFirstName") 
	   ErrorLastName  = Session("ErrorLastName")
	   ErrorEmail     = Session("ErrorEmail")
	   ErrorPhone     = Session("ErrorPhone") 
	  
	   Session("ErrorFirstName") = ""
	   Session("ErrorLastName")  = ""
	   Session("ErrorEmail")     = ""
	   Session("ErrorPhone")     = ""	  
	  
%>

<script type="text/javascript">
<!--
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
  
  //Check To See If The Current Password Field Is Blank    
  if (theform.phone.value == "Please Enter Your Phone Number" || theform.phone.value =="" || theform.phone.value.length <2)
  {
    alert("Please enter phone number");
    theform.phone.focus();
	return(false);
  }  
  										  
}
-->
</script>
 <!-- Body Starts --> 
  <div> 
  <%
  ' dim msg
 ' msg = Request.querystring("msg") 
 msg=session("errormsg")
session("errormsg")=""
  %>
  <br/>
  <div> <span class="Error"><% =msg%></span>
  	<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="235" align="left" valign="top" bgcolor="#FFFFFF">
				<table width="100%" border="0" cellspacing="0" cellpadding="8">

                  <tr>
                    <td width="2%">&nbsp;</td>
                    <td width="25%">&nbsp;</td>
                   <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; Register</td>
                  </tr>
                  <tr>
					<!--#include virtual="/includes/innerLeftMenu.asp"-->
                    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
					<div style="margin-top:-12px; width:95%;">
					<br />

						<div>
						  <table border="0" cellpadding="4" cellspacing="0" width="">
						   <form method="POST" action="/verifyregister.asp" name="form2" onSubmit="return Form_reg_Validator(this)">
                          <!--  <form method="POST" action="/Registeremail.asp" name="form2" onSubmit="return Form_reg_Validator(this)">-->
						      <tr>
						        <!--<td colspan="2"><h1 class="PageTitle">Please Register <span style=""> | </span><a href="/fbApp/fb.asp"><img src="/flogin.gif"/> </a> </h1></td>-->
								 <td colspan="2"><h1 class="PageTitle">Register and get free courses </h1></td>
								 <td><a href="javascript:void(0);" onclick="openWindow()" title="Login using facebook account" style="display: block;margin-top: -4px;"><img src="/images/flogin.gif"/> </a> </td>
						      </tr>						     
							  <tr>
						        <td><span class="general-bodyBold">firstname:</span><span class="Required">*</span>:</td>
						        <td>
								 <input type="text" name="first_name" value="<%=first_name%>" class="TeXtField">&nbsp;<span class="Required"><%= ErrorFirstName %></span></td>
						      </tr>
							  <tr>
						        <td><span class="general-bodyBold">Last Name</span><span class="Required">*</span>:</td>
						        <td>
								<input type="text" name="last_name" value="<%=last_name%>" class="TeXtField">&nbsp;<span class="Required"><%= ErrorLastName %></span></td>
						      </tr>
						      <tr>
						        <td><span class="general-bodyBold">Email</span><span class="Required">*</span>:</td>
						        <td>
								<input id="mail" style="color: rgb(161, 161, 161);width:200px;" size="50"  class="TeXtField" name="payer_email" value="Enter your email address" onfocus='myObj = document.getElementById("mail");if(this.value=="Enter your email address") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("mail");if(myObj.value == "") myObj.value="Enter your email address";myObj.style.color = "#a1a1a1";if(myObj.value!="Enter your email address") myObj.style.color="#000000";' size="30" type="text" />&nbsp;<span class="Required"><%= ErrorEmail %></span>
								</td>
                               <!-- <td>
                                <a href="/fbApp/fb.asp"><img src="/flogin.gif"/> </a>
                                </td>-->
						      </tr>
						      <tr>
						        <td><span class="general-bodyBold">Password</span><span class="Required">*</span>:</td>
						        <td>
								<input id="pwd" style="color: rgb(161, 161, 161);" size="20" maxlength="10" class="TeXtField" name="pass" value="********" onfocus='myObj = document.getElementById("pwd");if(this.value=="********") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("pwd");if(myObj.value == "") myObj.value="********";myObj.style.color = "#a1a1a1";if(myObj.value!="********") myObj.style.color="#000000";' size="30" type="password" />
						          &nbsp;&nbsp;Maximum length: 10 characters</td>
						      </tr>	
                                <tr>
						        <td><span class="general-bodyBold">Re-Password</span><span class="Required">*</span>:</td>
						        <td>
								<input id="repwd" style="color: rgb(161, 161, 161);" size="20" maxlength="10" class="TeXtField" name="repass" value="********" onfocus='myObj = document.getElementById("repwd");if(this.value=="********") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("repwd");if(myObj.value == "") myObj.value="********";myObj.style.color = "#a1a1a1";if(myObj.value!="********") myObj.style.color="#000000";' size="30" type="password" />
						          &nbsp;&nbsp;Maximum length: 10 characters</td>
						      </tr>
              <tr>
						        <td><span class="general-bodyBold">Phone Number</span><span class="Required">*</span>:</td>
						        <td>
								 <input type="text" name="phone" class="TeXtField">&nbsp;<span class="Required"><%= ErrorPhone %></span></td>
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
							<script type="text/javascript">
function openWindow(url) 
{
var url="/FbApp/Fb.asp";
    popupWin = window.open(url,'popup','width=850,height=490,title="facebook Login"')
}
</script>
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
<!--#include virtual="/includes/footer.html"-->