<!--#include virtual="/metatags/memberlogin_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/innerloginbanner.html"-->
<script type="text/javascript">
<!--
function Form_Validator(theform)
{

  //Check To See If The Current Password Field Is Blank
   
  if (theform.payer_email.value == "")
  {
    alert("Please enter email id");
    theform.payer_email.focus();
	return(false);
  }

  //Check To See If The New Password Field Is Blank
    
  if (theform.pass.value == "")
  {
    alert("Please enter password");
    theform.pass.focus();
	return(false);
  }

}
-->
</script>

<%


Dim Message
Message = Session("Message")
Session("Message") = ""
%>
 <!-- Body Starts -->
  <div>
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
						<h1 class="PageTitle">Enter Login Information</h1>
						<div>
						  <table border="0" cellpadding="4" cellspacing="0" width="">
                             <form method="POST" action="/verifyRefRewRedim.asp" name="form2" onSubmit="return Form_Validator(this)">
                             <tr>
								<!--Displaying Error Message-->
  								<td align="center" colspan="2"><font face="verdana,arial" size=-1 color="red"><% = Message %></font></td>
							  </tr>
                              <tr>
                              <td colspan="2">If you have opted for ITLstudy’s referral program, please enter your login credentials to access your referral account</td></tr>
						      <tr>
						        <td colspan="2"><span class="Header">User ID(EMail) and Password</span></td>
						      </tr>
						      <tr>
						        <td colspan="2">&nbsp;</td>
						      </tr>
						      <tr>
						        <td><span class="general-bodyBold">User ID(Email)</span><span class="Required">*</span> :</td>
						        <td><input type="text" name="Ref_Email" value="" size="50" style="width:200px;" class="TeXtField"></td>
						      </tr>
						      <tr>
						        <td><span class="general-bodyBold">Password</span><span class="Required">*</span> :</td>
						        <td><input type="password" name="Ref_Pass" value="" size="20" maxlength="10" class="TeXtField">
						          &nbsp;&nbsp;Maximum length : 10, Only Numbers and Characters allowed</td>
						      </tr>
						      <tr>
						        <td>&nbsp;</td><td><input type="submit" class="ButtonGeneral" name="type" value="Submit" style="width:60px;" >
								
						          <input type="reset" value="Reset" class="ButtonGeneral" style="width:60px;">
						        </td>
						      </tr>
						    </form>
						  </table>
                          <br>
						  <form method="POST" action="changepasswordRef.asp">
						    <input type="hidden" name="changepass" value="one">
						    <input type="submit" class="button" style="width:285px;margin-left:60px;" value="Click here if you want to change your password" align="right">
						  </form>
						
			</td>
                    </tr>


                </table>
                </div>
          </td>
		</tr>
	</table>
  </div>
  
  <!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->