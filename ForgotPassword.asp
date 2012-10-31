<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerloginbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->


<script type="text/javascript">

	 

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
    
  if (theform.passold.value == "")
  {
    alert("Please enter old password");
    theform.passold.focus();
	return(false);
  }

  if (theform.passnew1.value == "")
  {
    alert("Please enter new password");
    theform.passnew1.focus();
	return(false);
  }
  
  if (theform.passnew2.value == "")
  {
    alert("Please re-enter new password");
    theform.passnew2.focus();
	return(false);
  }

}

</script>
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header"></td>
            <td width="25%" class="PageTitle"></td>
            <td width="73%" class="PageTitle">Forgot Password</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px;">
                <!-- Content Start From Here-->
                <br />
                <table width="95%" border="0" cellspacing="0" cellpadding="3" class="general-body">
                  <p>Please enter your Email ID to start the password recovery process.</p>
                  

                  <form action="forgotpwd.asp" method="post" style="margin-left:35px;" onSubmit="return validate_form(this)">
                    <b>Email ID:</b>
                    <input type="text" name="UserID" style="margin-left:10px;"/>
                    <input type="submit" name="submit" value="submit"/>
                  </form>
                  <tr>
                    <td></td>
                  </tr>
                 
                </table>
                <br>
                <div>
                  <p class="general-body"> For additional clarifications or information, please contact <a href="/contactus.asp"> ITILstudy.com</a> </p>
                </div>
                <!-- Content End From Here-->
                <!--#include virtual="/includes/connectionClose.asp"-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
