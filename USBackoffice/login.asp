
<%
'======================================================='
'Written By : Savita'
'Created UpDated : 11/08/2011'
'Last Updated Date: 11/08/2011'
'Description :'
'This Page is Login Page'
'======================================================='

'Declare The Variables'
'If You Given Wrong Username And Password Then Display One Error Message In This Page'

 Dim errorMessage
 errorMessage = Session("errorMessage")
 Session("errorMessage") = ""
%>
<html>
<head>
<title>Login</title>
<script language="javascript">
function focus() {

	loginform.emailid.focus();

}
</script>
</head>
<body onLoad="focus()">
<center>
<table width="280px" cellpadding=2 cellspacing=0 border=0>
  <tr>
    <td bgcolor="#0099FF"><table cellpadding=0 cellspacing=0 border=0 width=100%>
        <tr>
          <td bgcolor="#0099FF" align=center style="padding:2;padding-bottom:4"><b><font face="verdana,arial" size=-1 color="white">Enter your email id and password</font></b>
            </td>
        </tr>
        <tr>
          <td bgcolor="white" style="padding:5"><br>
            <form method="post" action="validUser.asp" name="loginform">
               <center>
                <table>
				  <tr>
 					<!--Displaying Error Message-->
  					<td align="center" colspan="2"><font face="verdana,arial" size=-1 color="red"><% = errorMessage %></font></td>
				  </tr>
                  <tr>
                    <td><font face="verdana,arial" size=-1>Email Id:</font></td>
                    <td><input type="text" name="emailid"></td>
                  </tr>
                  <tr>
                    <td><font face="verdana,arial" size=-1>Password:</font></td>
                    <td><input type="password" name="pwd"></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td><font face="verdana,arial" size=-1>
                      <input type="submit" value="Submit"></font></td>
                  </tr>
                  <tr>
                    <td colspan=2>&nbsp;</td>
                  </tr>
                  <!--<tr>
                    <td colspan=2><font face="verdana,arial" size=-1>Lost your password? Find it <a href="forgotPwd.asp">here</a>!</font></td>
                  </tr>-->
                </table>
              </center>
            </form></td>
        </tr>
      </table></td>
  </tr>
</table>
</center>
</body>
</html>