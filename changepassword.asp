<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerloginbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!-- Body Starts -->

<script type="text/javascript">


//Validating The Email

function echeck(str) {

		var str1 = str.value
		//document.write(str1)
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
		 

function Form_Validator(theform)
{

 //Check To See If The Current Password Field Is Blank
   
  if (theform.payer_email.value == "")
  {
    alert("Please enter email id");
    theform.payer_email.focus();
	return(false);
  }
	
  with(theform)
  {
  	// Check The Eamil Validation
	if (echeck(payer_email)==false)
		  {payer_email.focus();return false}
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

  if (theform.passnew1.value != theform.passnew2.value)
  {
    alert("New password and Re-Enter new password are not equal");
    theform.passnew2.focus();
	return(false);	
  }
  
}

</script>
<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header"></td>
            <td width="25%" class="PageTitle"></td>
            <td width="73%" class="PageTitle">Change your password</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px;">
                <!-- Content Start From Here-->
                <br />
                <table width="95%" border="0" cellspacing="0" cellpadding="3" class="general-body">
                  <%If(Request.form("changepass")="one" OR Request.QueryString("changepass")="one") Then




%>
                  <form method="POST" action="changepassword.asp" onSubmit="return Form_Validator(this)">
                    <input type="hidden" name="changepass" value="two">
                    <tr>
                      <td colspan=2><span class="Header">Change Password Screen : </span></td>
                    </tr>
                    <tr>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr valign="top">
                      <td><span class="general-bodyBold">Email / UserID :</span></td>
                      <td align="left" valign="middle" height="14"><input type="text" name="payer_email" value="" size="50" style="width:200px;" class="TeXtField"></td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Existing Password :</span></td>
                      <td align="left" valign="middle" height="14"><input type="password" name="passold" maxlength="10" size="10" class="TeXtField"></td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Enter New Password :</span></td>
                      <td align="left" valign="middle" height="14"><input type="password" name="passnew1" maxlength="10" size="10" class="TeXtField">
                        &nbsp;length : 10, Only Numbers and Characters allowed</td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Re-Enter New Password :</span></td>
                      <td align="left" valign="middle" height="14"><input type="password" name="passnew2" maxlength="10" class="TeXtField"  size="10">
                        &nbsp;length : 10, Only Numbers and Characters allowed</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td><input type=submit value="Submit" class="ButtonGeneral" style="width:60px;">
                        <input type="reset" value="Reset" class="ButtonGeneral" style="width:60px;"></td>
                    </tr>
                  </form>
                  <tr>
                    <td></td>
                  </tr>
                  <%Else

If(Request.form("passnew1")= Request.form("passnew2")) Then

Set rsQues = Server.CreateObject("ADODB.Recordset")
rsQues.ActiveConnection = ConnObj
tmp_payer_email=Request.Form("payer_email")
tmp_passold=Request.Form("passold")
tmp_passnew=Request.Form("passnew1")
rsQues.Open "SELECT payer_email, pass from PaypalDB WHERE PaypalDB.payer_email='"&tmp_payer_email&"' and PaypalDB.pass='"&tmp_passold&"'"

If Not rsQues.BOF Then
	ConnObj.Execute "UPDATE PaypalDB SET pass='"&tmp_passnew&"' WHERE payer_email='"&tmp_payer_email&"'"%>
                  <tr>
                    <td colspan="2"><p class="general-bodyBold">Your password has been updated. <a href="./memberlogin.asp">Please login again to continue </a></p></td>
                  </tr>
                  <%Else%>
				  <%
				  'code added by chandan for set password of Custumer_accounts ================
				  Set RsQuery = Server.CreateObject("ADODB.Recordset")
                  RsQuery.ActiveConnection = ConnObj

				  RsQuery.Open "SELECT account_type_id,email, password from Customer_Accounts WHERE Customer_Accounts.email='"&tmp_payer_email&"'"
If Not RsQuery.BOF Then
if RsQuery("account_type_id")=1 then 'means user have registered througth our site
if RsQuery("password")= tmp_passold then
	ConnObj.Execute "UPDATE Customer_Accounts SET password='"&tmp_passnew&"' WHERE email='"&tmp_payer_email&"'"
	'success msg
	%>
<tr>
 <td colspan="2">
   <p class="general-bodyBold">Your password has been updated. <a href="./memberlogin.asp">Please login again to continue </a></p>
 </td>
</tr>
<%
	else	
' either Password donot match with old password
%>
<tr>
   <td colspan=2><span class="Error">Sorry, your UserID and Password are not valid. Please enter again :</span></td>
</tr><%
End if
else
'login using facebook
%>
<tr>
 <td colspan="2">
   <p class="general-bodyBold">You are registered througth facebook. Go to Login and click on Flogin button</p>
 </td>
</tr>
<%
End if
else
'Sorry, your UserID and Password are not valid. Please enter again.
%>
<tr>
  <td colspan=2><span class="Error">Sorry, your UserID and Password are not valid. Please enter again :</span></td>
</tr><%
End if
'end of code=============================
				  %>
                  <form method="POST" action="changepassword.asp" onSubmit="return Form_Validator(this)">
                    <input type="hidden" name="changepass" value="two">
                    <tr>
                      <td colspan="2" ><span class="Header">Forgot Password</span></td>
                    </tr>
                    <tr>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                      <td colspan=2><span class="Error">Sorry, your UserID and Password are not valid. Please enter again :</span></td>
                    </tr>
                    <tr>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Email / UserID :</span></td>
                      <td align="left" valign="middle" height="14"><input type="text" name="payer_email" value="<%=Request.Form("payer_email")%>" size="50" style="width:200px;" class="TeXtField"></td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Existing Password :</span></td>
                      <td align="left" valign="middle" height="14"><input type="password" name="passold" value="<%=Request.form("passold")%>" maxlength="10" class="TeXtField"></td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Enter New Password :</span></td>
                      <td align="left" valign="middle" height="14"><input type="password" name="passnew1" maxlength="10" class="TeXtField"  size="10">
                        &nbsp;length : 10, Only Numbers and Characters allowed</td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Re-Enter New Password :</span></td>
                      <td align="left" valign="middle" height="14"><input type="password" name="passnew2" maxlength="10" class="TeXtField"  size="10">
                        &nbsp;length : 10, Only Numbers and Characters allowed</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>                    
                      <td><input type=submit value="Submit" class="ButtonGeneral" style="width:60px;">
                        <input type="reset" value="Reset" class="ButtonGeneral" style="width:60px;"></td>
                    </tr>
                  </form>
                  <tr>
                    <td></td>
                  </tr>
                  <%
set rsQues=Nothing

End If

Else
%>
                  <form method="POST" action="changepassword.asp" onSubmit="return Form_Validator(this)">
                    <input type="hidden" name="changepass" value="two">
                    <tr valign="top">
                      <td colspan="2" ><span class="Header">Forgot Password</span></td>
                    </tr>
                    <tr>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                      <td colspan=2><span class="Error">Sorry, your new and old password do not match, please enter again :</span> </td>
                    </tr>
                    <tr>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                      <td ><span class="general-bodyBold">Email / UserID :</span></td>
                      <td align="left" valign="middle" height="14"><input type="text" name="payer_email" value="<%=Request.Form("payer_email")%>" size="50" style="width:200px;" class="TeXtField"></td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Existing Password :</span></td>
                      <td align="left" valign="middle" height="14"><input type="password" name="passold" value="<%=Request.form("passold")%>" size="10"  class="TeXtField"></td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Enter New Password :</span></td>
                      <td align="left" valign="middle" height="14"><input type="password" name="passnew1" maxlength="10" class="TeXtField" size="10">
                        &nbsp;length : 10, Only Numbers and Characters allowed</td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Re-Enter New Password :</span></td>
                      <td align="left" valign="middle" height="14"><input type="password" name="passnew2" maxlength="10" class="TeXtField" size="10">
                        &nbsp;length : 10, Only Numbers and Characters allowed</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>                    
                      <td><input type=submit value="Submit" class="ButtonGeneral" style="width:60px;">
                        <input type="reset" value="Reset" class="ButtonGeneral" style="width:60px;"></td>
                    </tr>
                  </form>
                  <tr>
                    <td></td>
                  </tr>
                  <%
				   End If
				   End if
 				  %>
                </table>
                <br>
                <div>
                  <p class="general-body"> For additional clarifications or issues, please Contact<a href="/contactus.asp"> ITILstudy.com</a> </p>
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
