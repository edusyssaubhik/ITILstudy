<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<% 
If Session("USBUserId") = "" Then 
	Response.Redirect("login.asp")
Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
'Written By : Bharath'
'Last UpDated : 18/08/2009'
'Description :'
'This page is adding calls to the database'
'US BackOffice'
'======================================================='

'Declare the local variables'
Dim strQuery
Dim message
Dim objRs
Dim InstId

message = Session("message")
Session("message") = ""

Set objRs = server.CreateObject("ADODB.Recordset")

'===================================='
'Retrive The sections from Database'
'===================================='
strQuery = "SELECT instid FROM ITIL_instructor WHERE emailid1 = '" & Session("USBUserId") & "'"

objRs.Open strQuery,ConnObj

Do Until objRs.EOF

 InstId = objRs("instid")

objRs.Movenext
Loop 
objRs.Close
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Change Password</title>
<script language="javascript">
function Form_Validator(theform)
{

  //Check To See If The Current Password Field Is Blank
   
  if (theform.pwd.value == "")
  {
    alert("Please enter current password");
    theform.pwd.focus();
	return(false);
  }

  //Check To See If The New Password Field Is Blank
    
  if (theform.newPwd.value == "")
  {
    alert("Please enter new password");
    theform.newPwd.focus();
	return(false);
  }

  //Check To See If The Confirm New Password Field Is Blank
    
  if (theform.confPwd.value == "")
  {
    alert("Please enter confirm password");
    theform.confPwd.focus();
	return(false);
  }    
 
  if (theform.newPwd.value != theform.confPwd.value)
  {
    alert("New password and confirm password are not equal");
    theform.confPwd.focus();
	return(false);	
  }

}
</script>
<!-- CSS -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<!--[if IE 6]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie6.css" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie7.css" /><![endif]-->
<!-- JavaScripts-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jNice.js"></script>
</head>
<body>
<div id="wrapper">
  <!--#include file="includes/topMenu.asp"-->
  <!-- // #end mainNav -->
  <div id="containerHolder">
    <div id="container">
      <div id="sidebar">
        <!--#include file="includes/leftMenu.asp"-->
        <!-- // .sideNav -->
      </div>
      <!-- // #sidebar -->
      <!-- h2 stays for breadcrumbs -->
      <h2><a href="home.asp">Home</a> &raquo; <a href="changePwd.asp" class="active">Change Password</a></h2>
      <div id="main">
        <p>
        <h3>Change Password</h3>
        </p>
        <fieldset>
        <table border="1" cellpadding="5" cellspacing="0" align="left" width="45%" class="table2">
          <tr>
            <td><form name="addcalls" action="changePwddb.asp" method="post" onSubmit="return Form_Validator(this)">
                <input type="hidden" name="instId" value="<% = InstId %>" />
                <table border="0" cellpadding="5" cellspacing="0" width="100%">
				<% If message <> "" Then %>
                  <tr>
                    <td class="text1" colspan="2" align="center"><% = message %></td>
                  </tr>
				  <% End If %>
                  <tr>
                    <td width="10%"><b>Current Password :</b></td>
                    <td width="20%"><input type="password" name="pwd" /></td>
                  </tr>
                  <tr>
                    <td><b>New Password :</b></td>
                    <td><input type="password" name="newPwd" /></td>
                  </tr>
                  <tr>
                    <td><b>Confirm Password :</b></td>
                    <td><input type="password" name="confPwd" /></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td><input type="submit" name="Submit" value="Submit" />
                  </tr>
                </table>
              </form></td>
          </tr>
        </table>
        </fieldset>
      </div>
      <!-- // #main -->
      <div class="clear"></div>
    </div>
    <!-- // #container -->
  </div>
  <!-- // #containerHolder -->
  <p id="footer">&nbsp;</p>
</div>
<!-- // #wrapper -->
</body>
</html>
<!--#include virtual="/includes/connectionClose.asp"-->
<% End If %>
