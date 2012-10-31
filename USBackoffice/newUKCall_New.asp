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
Dim strState, objRs

'Creatting the record set'
Set objRs = Server.CreateObject("ADODB.Recordset")

'Retrive the states'
strState = "SELECT states FROM ps_us_states WHERE country = 'United Kingdom' ORDER BY states"

objRs.Open strState,ConnObj
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>New Call</title>
<script language="javascript">

/*Phone number validation*/
function validate_number(field,alerttxt)
  {
  	var iChars = "0123456789-()";

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


function Form_Validator(theform)
{


  if (theform.callername.value == "")
  {
     alert("Please enter the name.");
     theform.callername.focus();
     return (false);
  }

  if (theform.phoneno.value == "")
  {
     alert("Please enter the phone number.");
     theform.phoneno.focus();
     return (false);
  }
 if (theform.state.value == "")
  {
     alert("Please select State.");
     theform.state.focus();
     return (false);
  }

  with (theform)
  {
 	    if (validate_number(phoneno,"Phone number1 is not a numeral")==false)
 	         {phoneno.focus();return false}
  
  }
  
 


  
  if (theform.question.value == "")
  {
     alert("Please enter the question.");
     theform.question.focus();
     return (false);
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
      <h2><a href="home.asp">Home</a> &raquo; <a href="MarketingB2C_New.asp?action=noFollowUp" class="active">Marketing B2C</a> &raquo; New Call</h2>
      <div id="main">
        <p>
        <h3>Add New Call</h3>
        </p>
        <fieldset>
        <table border="1" cellpadding="5" cellspacing="0" align="left" width="45%" class="table2">
          <tr>
            <td><form name="addcalls" action="addNewUKCall_New.asp" method="post" onsubmit="return Form_Validator(this)">
                <table border="0" cellpadding="5" cellspacing="0" width="100%">
                  <tr>
                    <td width="20%"><b>For :</b></td>
                    <td width="60%"><input type="radio" name="callfor" value="Classroom" checked="checked" />
                      Classroom&nbsp;
                      <input type="radio" name="callfor" value="Online" />
                      Online &nbsp;
                      <input type="radio" name="callfor" value="Corporate" />
                      Corporate </td>
                  </tr>
                  <tr>
                    <td><b>Name :</b></td>
                    <td><input type="text" name="callername" /></td>
                  </tr>
                  <tr>
                    <td><b>Phone Number :</b></td>
                    <td><input type="text" name="phoneno" /></td>
                  </tr>
           <tr>
              <td><b>County:</b></td>
              <td><select name="county">
                  <option value="">--Select--</option>
                  <option value="Scotland">Scotland - All Counties</option>
                  <option value="Wales">Wales  - All Counties</option>
				  <option value="Northern Ireland">Northern Ireland  - All Counties</option>
				    
                  <optgroup label="England">
                  <% Do Until objRs.EOF %>
                  <% If objRs("states") <> "Scotland" AND objRs("states") <> "Wales" Then %>
                  <option value="<% = objRs("states") %>">
                  <% = objRs("states") %>
                  </option>
                  <% End If %>
                  <% objRs.Movenext
	      Loop
		  objRs.Close %>
                  </optgroup>
                </select></td>
            </tr>
                  <tr>
                    <td><b>City :</b></td>
                    <td><input type="text" name="city" />
                    </td>
                  </tr>
                  <tr>
                    <td><b>EmailId :</b></td>
                    <td><input type="text" name="emailid" /></td>
                  </tr>
                  <tr>
                    <td valign="top"><b>Question Asked :</b></td>
                    <td><textarea name="question" rows="7" cols="30"></textarea></td>
                  </tr>
                  <tr>
                    <td valign="top"><b>Comment :</b></td>
                    <td><textarea name="comment" rows="7" cols="30"></textarea></td>
                  </tr>					  
                  <tr>
                    <td>&nbsp;</td>
                    <td><input type="submit" name="Submit" value="Submit" />
                      &nbsp;
                      <input type="reset" name="reset" value="Reset" /></td>
                  </tr>
                </table>
              </form></td>
          </tr>
        </table>
        </form>
        </td>
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
