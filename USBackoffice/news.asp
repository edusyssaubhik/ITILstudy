<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%' OPTION EXPLICIT %>
<!--#include virtual="/includes/connection.asp"-->
<% 
If Session("USBUserId") = "" Then 
	Response.Redirect("login.asp")
Else

Dim objRs
Dim strNews
Dim rqPage
Dim rqRow

rqPage = Request.QueryString("page")
rqRow = Request.QueryString("row")	

Set objRs = Server.CreateObject("ADODB.Recordset")

strNews = "SELECT news, added_date FROM ps_news WHERE country='US' ORDER BY id desc"

objRs.Open strNews,ConnObj	

If Not objRs.EOF Then
	arrAllNews = objRs.getrows
	firstRow = 0
	lastRow = 9
	numRows = Ubound(arrAllNews,2)
	If lastRow > numRows Then
	   lastRow = numRows
	End If
End If
 
objRs.Close
  
If rqPage = "next" Then

   numRows = Ubound(arrAllNews,2)

   firstRow = rqRow + 1
   lastRow = firstRow + 9

   If firstRow >= numRows Then
	  firstRow = rqRow + 1
	  lastRow = firstRow + 9
   End If

   If firstRow < 0 Then
	  firstRow = 0
   End If

   If lastRow > numRows Then
	  lastRow = numRows
   End If

End If

If rqPage = "previous" Then

   numRows = Ubound(arrAllNews,2)

   lastRow = rqRow - 1
   firstRow = lastRow - 9

   If firstRow =< 0 Then
	  firstRow = 0
	  lastRow = firstRow + 9
   End If

   If lastRow > numRows Then
	  lastRow = numRows
   End If

End If	
	
%>
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
      <h2>Home &raquo; <a href="news.asp" class="active">PMstudy News</a></h2>
      <div id="main">
        <p>
        <h3>PMstudy news</h3>
        </p>
        <fieldset>
        <table cellpadding="10" width="60%" cellspacing="10" class="table2">
          <% If IsArray(arrAllNews) Then
			 For rowcounter = firstRow To lastRow %>
          <tr>
            <td><ul>
                <li>
				 <% = arrAllNews(1,rowcounter) %><br />
                 <% = arrAllNews(0,rowcounter) %>
                </li>
				<li>&nbsp;</li>
              </ul>
          </tr>
          <% Next %>
		   <tr>
			 <td colspan="9">
			 <% If Not firstRow = 0 Then %>
			  <a href="news.asp?page=previous&row=<% = firstRow %>"> &lt;&lt;Previous</a>
			 <% End If %>
			 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
			 <% If Not numRows = lastRow Then %>
			  <a href="news.asp?page=next&row=<% = lastRow %>"> &gt;&gt;Next</a>
			 <% End If %>
			 </td>
			</tr>
			<% End If %>		  
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
<% End If %>
