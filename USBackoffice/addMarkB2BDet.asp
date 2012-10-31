<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<% 
If Session("USBUserId") = "" Then 
	Response.Redirect("login.asp")
Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'Written By : Bharath'
'Created Date: 11/09/2009'
'Last Updated Date: 15/09/2009'
'Description :'
'Purpose : Adding Details Of Matketing Business to Business'

'Declare The Variables'
Dim rqAction
Dim rqType
Dim rqCompany

rqCompany = Request.Form("company")
rqType    = Request.Form("type")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MarketingB2B</title>

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
                <h2><a href="home.asp">Home</a> &raquo; <a href="marketingB2B.asp" class="active">Marketing B2B</a></h2>
                  <div id="topbar" style="margin-left:31px;">
                    <ul class="topNav">
                      <li><a href="marketingB2B.asp?action=addComp">Add Company</a></li>
                    </ul>
                  </div>
                  <div id="topbar" style="margin-left:-30px;">
                    <ul class="topNav">
                      <li><a href="marketingB2B.asp?action=viewAlerts">View Alerts</a></li>
                    </ul>
                  </div>
                <div id="main">
				<h3></h3>
                <fieldset>
                <% If rqType = "Add New Contact for same company" Then %>
                <form method="post" action="addMarB2B.asp">
                <input type="hidden" name="company" value="<% = rqCompany %>">
                <table>
                  <tr>
                    <td colspan="2"><B>Contact for <% = rqCompany %></B></td>
                  </tr>
                  <tr>
                    <td>Contact Name:</td><td><input type="text"  name="contName"></td>
                  </tr>
                  <tr>
                    <td>Designation:</td><td><input type="text" name="designation"></td>
                  </tr>
                  <tr>
                    <td>Phone Number1:</td><td><input type="text" name="phoneNo1"></td>
                  </tr>
                  <tr>
                    <td>Phone Number2:</td><td><input type="text" name="phoneNo2"></td>
                  </tr>
                  <tr>
                    <td>Phone Number3:</td><td><input type="text" name="phoneNo3"></td>
                  </tr>
                  <tr>
                    <td>Email Address:</td><td><input type="text" name="email"></td>
                  </tr>
                  <tr>
                    <td>Fax:</td><td><input type="text" name="fax"></td>
                  </tr>
                  <tr>
                    <td>Physical Address:</td>
                    <td><textarea name="address" rows="8" cols="23"></textarea></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td><td><input type="submit" name="type" Value="Add Contact"></td>
                  </tr>
                 </table>
                </form>
                <% ElseIf rqType = "Update Status for same company" Then %>
                
                <form method="post" action="addMarB2B.asp">
				<table>
                 <tr><td>Company Name : <% = Request.Form("company") %></td></tr>
                 <tr>
                  <td>Add/Update Status : &nbsp;&nbsp;&nbsp;
                <select NAME="message">
                    <Option VALUE="1. Contacts Identified"> 1. Contacts Identified</Option>
                    <Option VALUE="2. Introductory Email/Material Sent"> 2. Introductory Email/Material Sent</Option>
                    <Option VALUE="3. 1st Meeting completed"> 3. 1st Meeting completed</Option>
                    <Option VALUE="4. Follow Up Meetings/Communication"> 4. Follow Up Meetings/Communication</Option>
                    <Option VALUE="5.1 Deal Successful finalized"> 5.1 Deal Successful finalized</Option>
                    <Option VALUE="5.2 Deal on Hold for future"> 5.2 Deal on Hold for future</Option>
                    <Option VALUE="5.3 Deal cancelled"> 5.3 Deal cancelled</Option>
                    <Option VALUE="6. Managing And Growing Accounts"> 6. Managing And Growing Accounts</Option>
                </select>
                <input type="hidden" name="oldStatus" Value="<%=Request.Form("oldStatus")%>">
                <input type="hidden" name="company" Value="<%=Request.Form("company")%>">
                <BR><BR><input type="submit" name="type" Value="Add / Update Status for company"><BR><BR>
                </td>
                </tr>
                </table>
                </form>
				<% ElseIf rqType = "Add New Alerts for same company" Then %>
                <form method="post" action="addMarB2B.asp">
                <input type="hidden" name="company" value="<% = Request.Form("company") %>">
                <table>
                  <tr>
                   <td colspan="2"><B>Alert for <% = rqCompany %></B></td>
                  </tr>
                  <tr>
                    <td>Follow up person:</td><td><input type="text" name="name"></td>
                  </tr>
                  <tr>
                    <td>Designation:</td><td><input type="text" name="designation"></td>
                  </tr>
                  <tr>
                    <td>Phone Number1:</td><td><input type="text" name="phoneNo1"></td>
                  </tr>
                  <tr>
                    <td>Email Address:</td><td><input type="text" name="email"></td>
                  </tr>
                  <tr>
                    <td>Follow Up Date:</td><td><input type="text" name="followupdate"><font color="red"><B><I>( Important: This is in mm/dd/yyyy format always )</I></B></font></td>
                  </tr>
                  <tr>
                    <td>Alerts Instructions:</td><td><input type="text" name="followup"></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td><td><input type="submit" name="type" Value="Add New Alert for Follow Up"></td>
                  </tr>
				</table>
                </form>                
                <% End If %>         

                
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
<% End If %>