<!--#include virtual="/includes/headermetaDutch.asp"-->
<!--#include virtual="/includes/innerloginbanner.html"-->
<!--#include virtual="/metatags/memberlogin_metatag.html"-->
<script type="text/javascript">
function Form_Validator(Theform)
{
    //alert("hi");
  //Check To See If The Current Password Field Is Blank
   
    if (Theform.payer_email.value == "Enter your email address")
  {
    alert("Please enter email id");
    Theform.payer_email.focus();
	return(false);
  }

  //Check To See If The New Password Field Is Blank
    
    if (Theform.pass.value == "********")
  {
    alert("Please enter password");
    Theform.pass.focus();
	return(false);
  }
  return true;
}


function Form_Validator1(Theform) {
    //Check To See If The Current Password Field Is Blank

    if (Theform.payer_email.value == "Enter your email address") {
        alert("Please enter email id");
        Theform.payer_email.focus();
        return false;
    }
   /* var email = Theform.payer_email.value;
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
                   <td width="73%" class="breadcrumb">Home &raquo; Inloggen</td>
                  </tr>
                  <tr>
					<!--#include virtual="/includes/innerLeftMenu-Dutch.asp"-->
                    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
					<div style="margin-top:-12px; width:95%;">
					<br />

						<div>
						  <table border="0" cellpadding="4" cellspacing="0" width="">
						    <form method="POST" action="/Dutch/verifyLogin1.asp" name="form2" onsubmit="return Form_Validator1(this)">
                            
						      <tr>
						        <td colspan="3"><h1 class="PageTitle">Gebruikers-ID (e-mail) en wachtwoord voor Leden</h1></td>
						      </tr>
						      <tr>
						        <td colspan="3">&nbsp;</td>
						      </tr>
						      <tr>
						        <td width="10%" valign="middle"><span class="general-bodyBold">Gebruikers ID (e-mailadres)</span><span class="Required">*</span>:</td>
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
						        <td><span class="general-bodyBold">Wachtwoord</span><span class="Required">*</span>:</td>
						        <td colspan="2" valign="middle">
								<input id="pwd" style="color: rgb(161, 161, 161);" size="20" maxlength="10" class="TeXtField" name="pass" value="********" onfocus='myObj = document.getElementById("pwd");if(this.value=="********") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("pwd");if(myObj.value == "") myObj.value="********";myObj.style.color = "#a1a1a1";if(myObj.value!="********") myObj.style.color="#000000";' size="30" type="password" />
						          &nbsp;&nbsp;Maximale lengte: 10, Alleen alfanumerieke tekens zijn toegestaan</td>
						      </tr>
						      <tr>
						        <td>&nbsp;</td><td colspan="2"><input type="submit" class="ButtonGeneral" value="Submit" style="width:60px;" >
								
						          <input type="reset" value="Reset" class="ButtonGeneral" style="width:60px;">
                                  
                             <a href="/Dutch/ForgotPassword-nl.asp">Wachtwoord vergeten?</a>&nbsp;&nbsp;
							  <a href="/Register.asp">New Sign up</a>
                             
						        </td>
						      </tr>
						    </form>
						  </table>
						</div>
						<div>
						  <p><span class="general-bodyBold">Let op: </span>Als u uw gebruikers ID en wachtwoord niet heeft gereset tijdens uw inschrijving bij ITILstudy.com, dan is uw</p>
						  <ul>
						    <li>Standaard gebruikers ID (e-mailadres): Dit is uw e-mail ID waarmee u zich heeft ingeschreven.</li>
						   <li><a href="/Dutch/ITIL-Courses-nl.asp">Klik hier</a> indien u zich niet heeft ingeschreven.</span></li>
						  </ul>
						</div>
						<div class="button">
                     
                        
						  <form method="POST" action="/Dutch/changepassword-nl.asp">
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
<!--#include virtual="/includes/footer-Dutch.html"-->
