<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Home</title>
<!-- CSS -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<!--[if IE 6]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie6.css" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie7.css" /><![endif]-->
<!-- JavaScripts-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jNice.js"></script>
</head>
<body>
<!--#include virtual="/includes/connection.asp"-->
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
      <h2><a href="home.asp">Home</a> &raquo; <a href="marketingB2B.asp" class="active">Marketing B2B : Corporate database</a> </h2>
      <div id="main">
        <h3>B2B Marketing (follow-up with corporates)</h3>
        <fieldset>
        <table border="0">
          <form name="two" action="/admintempmarkuserpm1.asp" method="post" target="_blank">
            <tr>
              <td colspan="3"><B>View person's details by Last Name:</B></td>
            </tr>
            <tr>
              <td colspan="3">Last Name: <input type="text" size="20" name="last_name"> <input type="submit" Value="View person details"></td>
            </tr>
          </form>
		  <tr><td>&nbsp;</td></tr>
          <form name="two" action="/admintempmarkuserpm4.asp" method="post" target="_blank">
            <tr>
              <td colspan="3"><B>View person's details by Company Name:</B></td>
            </tr>
            <tr>
              <td>Company Name: (e.g. dg, dollar general)</td>
              <td><input type="text" size="20" name="company_name">
                OR
                <input type="text" size="20" name="company_name1"></td>
              <td><input type="submit" Name="Person" Value="View persons from the company"></td>
            </tr>
          </form>
		  <tr><td>&nbsp;</td></tr>		  
          <form name="two" action="/admintempmarkuserpm2.asp" method="post" target="_blank">
            <tr>
              <td colspan="3"><B>View person's details by Location:</B></td>
            </tr>
            <tr>
              <td>Location (e.g. city, 2 digit State Code etc.):</td>
              <td><input type="text" size="20" name="location1">
                OR
                <input type="text" size="20" name="location2"></td>
              <td><input type="submit" Name="Person" Value="View persons from the city"></td>
            </tr>
          </form>
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
