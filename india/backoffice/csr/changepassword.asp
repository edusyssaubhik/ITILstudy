<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 'Written By : Savita'
 'Last UpaDated: 11/08/2011'
 'Description :'
 'Purpose : Change Password'
%>
<!--#include virtual="/india/connection.asp"-->
<% If not  Session("UserId") = "" Then %>


<!-- Body Starts -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Users</title>
<link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
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
</head>
<body><div id="htMap">
  <table border="1" width="1000" height="500" cellpadding="2" cellspacing="0" class="dbborder" >
 <tr>
   <td colspan="9" height="35"><div align="center"><strong>WELCOME TO ITILSTUDY BACKOFFICE OPERATIONS</strong></div>
 </tr>
 <tr>
   <td width="100px" valign="top" rowspan="22">
    <!--#include file="leftMenu.html"-->
   </td>
   <td height="25"><a href="user.asp?type=add">Add User</a></td></tr>
         
                <!-- Content Start From Here-->
                <br />
                <table width="95%" border="0" cellspacing="0" cellpadding="3" class="general-body">
                  <%If(Request.form("changepass")="one") Then %>
                  <form method="POST" action="changepassword.asp" onSubmit="return Form_Validator(this)">
                    <input type="hidden" name="changepass" value="two">
                    <tr>
                      <td colspan=2><span class="Header">Change Password Screen : </span></td>
                    </tr>
                    <tr>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr valign="top">
                      <td><span class="general-bodyBold">Email/UserID :</span><span class="Required">*</span></td>
                      <td align="left" valign="middle" height="14"><input type="text" name="payer_email" value="" size="50" style="width:200px;" class="TeXtField"></td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Existing Password :</span><span class="Required">*</span></td>
                      <td align="left" valign="middle" height="14"><input type="password" name="passold" maxlength="10" size="10" class="TeXtField"></td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Enter New Password :</span><span class="Required">*</span></td>
                      <td align="left" valign="middle" height="14"><input type="password" name="passnew1" maxlength="10" size="10" class="TeXtField">
                        &nbsp;length : 10, Only Numbers and Characters allowed</td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Re-Enter New Password :</span><span class="Required">*</span></td>
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

Dim rsQues,tmp_payer_email,tmp_passold,tmp_passnew

Set rsQues = Server.CreateObject("ADODB.Recordset")
rsQues.ActiveConnection = Conn
tmp_payer_email=Request.Form("payer_email")
tmp_passold=Request.Form("passold")
tmp_passnew=Request.Form("passnew1")
rsQues.Open "SELECT payer_email, pass from PaypalDB WHERE PaypalDB.payer_email='"&tmp_payer_email&"' and PaypalDB.pass='"&tmp_passold&"'"

If Not rsQues.BOF Then
	Conn.Execute "UPDATE PaypalDB SET pass='"&tmp_passnew&"' WHERE payer_email='"&tmp_payer_email&"'"%>
                  <tr>
                    <td colspan="2"><p class="general-bodyBold">Your password has been updated. <a href="./memberlogin.asp">Please login again to continue </a></p></td>
                  </tr>
                  <%Else%>
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
                      <td ><span class="general-bodyBold">Email/UserID :</span><span class="Required">*</span></td>
                      <td align="left" valign="middle" height="14"><input type="text" name="payer_email" value="<%=Request.Form("payer_email")%>" size="50" style="width:200px;" class="TeXtField"></td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Existing Password :</span><span class="Required">*</span></td>
                      <td align="left" valign="middle" height="14"><input type="password" name="passold" value="<%=Request.form("passold")%>" maxlength="10" class="TeXtField"></td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Enter New Password :</span><span class="Required">*</span></td>
                      <td align="left" valign="middle" height="14"><input type="password" name="passnew1" maxlength="10" class="TeXtField"  size="10">
                        &nbsp;length : 10, Only Numbers and Characters allowed</td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Re-Enter New Password :</span><span class="Required">*</span></td>
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
                      <td ><span class="general-bodyBold">Email/UserID :</span><span class="Required">*</span></td>
                      <td align="left" valign="middle" height="14"><input type="text" name="payer_email" value="<%=Request.Form("payer_email")%>" size="50" style="width:200px;" class="TeXtField"></td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Existing Password :</span><span class="Required">*</span></td>
                      <td align="left" valign="middle" height="14"><input type="password" name="passold" value="<%=Request.form("passold")%>" size="10"  class="TeXtField"></td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Enter New Password :</span><span class="Required">*</span></td>
                      <td align="left" valign="middle" height="14"><input type="password" name="passnew1" maxlength="10" class="TeXtField" size="10">
                        &nbsp;length : 10, Only Numbers and Characters allowed</td>
                    </tr>
                    <tr valign="top">
                      <td ><span class="general-bodyBold">Re-Enter New Password :</span><span class="Required">*</span></td>
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
				   End if
 				  %>
                </table>
                <br>
                <div>
                  <p class="general-body"> For additional clarifications or issues, please <a href="/contactus.asp">Contact PMstudy.com</a> </p>
                </div>
                <!-- Content End From Here-->
               
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->

