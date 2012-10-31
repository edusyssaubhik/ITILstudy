<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/innerbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->

<%


Dim message
message = Session("message")
Session("message") = ""



%>
  <script type="text/javascript">
					<!--
					//Validating The Email

					function echeck(str) {

							var str1 = str.value
							var at="@"
							var dot="."
							var lat=str1.indexOf(at)
							var lstr=str1.length
							var ldot=str1.indexOf(dot)
							if (str1.indexOf(at)==-1){
							   alert("Invalid E-mail ID")
							   return false
							}

							if (str1.indexOf(at)==-1 || str1.indexOf(at)==0 || str1.indexOf(at)==lstr){
							   alert("Invalid E-mail ID")
							   return false
							}

							if (str1.indexOf(dot)==-1 || str1.indexOf(dot)==0 || str1.indexOf(dot)==lstr){
								alert("Invalid E-mail ID")
								return false
							}

							if (str1.indexOf(at,(lat+1))!=-1){
								alert("Invalid E-mail ID")
								return false
							}

							if (str1.substring(lat-1,lat)==dot || str1.substring(lat+1,lat+2)==dot){
								alert("Invalid E-mail ID")
								return false
							}

							if (str1.indexOf(dot,(lat+2))==-1){
								alert("Invalid E-mail ID")
								return false
							}

							if (str1.indexOf(" ")!=-1){
								alert("Invalid E-mail ID")
								return false
							}
							
							if (str1.indexOf(",")!=-1){
								alert("Invalid E-mail ID")
								return false
							}    

							return true
						}

					function validate_required(field,alerttxt)
					{
						with (field)

						{
							if (field.value=="")
							  {alert(alerttxt);return false}
							else {return true}
						}
					}

					function validate_special(field,alerttxt)
					{
						var iChars = "!#$%^&*@()+=-[]\\\';,{}|\":<>?./";

						with (field)
						{
							for (var i = 0; i < value.length; i++) {
								if (iChars.indexOf(value.charAt(i)) != -1) {
								alert (alerttxt);
								return false;
								}
							}
						}
					}

					function validate_specialcharacters(field,alerttxt)
					{
						var iChars = "!#$%^&*@()+=[]\\\';{}|\":<>?";

						with (field)
						{
							for (var i = 0; i < value.length; i++) {
								if (iChars.indexOf(value.charAt(i)) != -1) {
								alert (alerttxt);
								return false;
								}
							}
						}
					}


					function validate_number(field,alerttxt)
					{
						var iChars = "0123456789-/,";

						with (field)
						{
							for (var i = 0; i < value.length; i++) {
								if (!(iChars.indexOf(value.charAt(i)) != -1)) {
								alert (alerttxt);
								return false;
								}
							}
						}
					}
					
					function password_check(passwordfield,passwordalerttxt)
						{
							with(passwordfield)
							{
								if(passwordfield.value.length > 10 )
								{alert(passwordalerttxt);return false}
								else {return true}
							}
						}


					function validate_noNumber(field,alerttxt)
					{
						var iChars = "0123456789";

						with (field)
						{
							for (var i = 0; i < value.length; i++) {
								if ((iChars.indexOf(value.charAt(i)) != -1)) {
								alert (alerttxt);
								return false;
								}
							}
						}
					}



					function validate_form(thisform)
					{
						with (thisform)
						{

						// Check The First Name Field Empty Or Not

						if (validate_required(payer_email,"Please Enter Your Email id")==false)
							  {payer_email.focus();return false}
							  
							  
					   // Check The Eamil Validation

						if (echeck(payer_email)==false)
							  {payer_email.focus();return false}
								  

						
						// Check The Last Name Field Empty Or Not

						if (validate_required(passold,"Please Enter Your old password")==false)
							  {passold.focus();return false}

						
						
						// Check The Name of Employer/Business Field Empty Or Not

						if (validate_required(passnew1,"Please Enter new password")==false)
							  {passnew1.focus();return false}
								  
					  
								  
						// Check The Phone number Field Empty Or Not

						if (validate_required(passnew2,"Please re-enter password")==false)
							  {passnew2.focus();return false}
							  

					 //Check To See If The Password Have Mininmum Ten Characters Or Not    
						   
							if (password_check(passnew1,"Password length is maximum 10 characters!")==false)
								  {passnew1.focus();return false}
								  
								  
					//Check To See If The Password Have Mininmum Ten Characters Or Not    
						   
							if (password_check(passnew2,"Password length is maximum 10 characters!")==false)
								  {passnew2.focus();return false}
								  			
					
					 }
						
						 if (thisform.passnew1.value != thisform.passnew2.value)
							  {
								alert("New password and confirm password are not equal");
								thisform.passnew2.focus();
								return(false);	
							  }
  
					
					  
					}



					-->
					</script>
  
  
	<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="235" align="left" valign="top" bgcolor="#FFFFFF">
				<table width="100%" border="0" cellspacing="0" cellpadding="8">

                  <tr>
			      <td></td>
         </tr>  <tr>
					<!--#include virtual="/includes/innerLeftMenu.asp"-->
                    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
					<div style="margin-top:-12px; width:95%;">
					<br />

						<div>
                <table width="95%" border="0" cellspacing="0" cellpadding="3" class="general-body">

            <form method="POST" action="/ChangePwdRef.asp" onSubmit="return validate_form(this)">
              <tr>
              <td colspan="2"><h1 class="PageTitle">Change your password</h1></td>
              </tr>
              <tr>
              <td colspan="2">&nbsp;</td>
            </tr>
            <% If message <> "" Then %>
                  <tr>
                    <td class="text1" colspan="2" align="center"><p class="general-bodyBold"><% = message %></p><br /><br /></td>
                  </tr>
				  <% End If %>
                  
              <tr valign="top">
                      <td><span class="general-bodyBold">Email/UserID:</span><span class="Required">*</span></td>
                      <td align="left" valign="middle" height="14"><input type="text" name="payer_email" value="" size="50" style="width:200px;" class="TeXtField"></td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Existing Password:</span><span class="Required">*</span></td>
                      <td align="left" valign="middle" height="14"><input type="password" name="passold" value="" size="10" class="TeXtField"></td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Enter New Password:</span><span class="Required">*</span></td>
                      <td align="left" valign="middle" height="14"><input type="password" name="passnew1" value="" size="10" class="TeXtField">
                        &nbsp;Maximum length: 10, Only alphanumerics allowed</td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Confirm Password:</span><span class="Required">*</span></td>
                      <td align="left" valign="middle" height="14"><input type="password" name="passnew2" value="" class="TeXtField"  size="10"></td>
                    </tr>
              <tr>
                
                <td colspan="2">
				<div align="center"><input type="submit" value="Submit" class="button" style="width:60px;"></div>
				</td>
              </tr>
            </form>
			
</table>
                <br>
                <div>
                  <p class="general-body"> For additional clarifications or information, please <a href="/contactus.asp">contact ITILstudy.com</a> </p>
               
                <!-- Content End From Here-->
                <!--#include virtual="/includes/connectionClose.asp"-->
             </td>
          </tr>
        </table>
        </div>
        
</div>
</div>
 </td>
          </tr>
        </table>
        </td>
          </tr>
        </table>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->


