<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<% 
	If Session("USBUserId") = "" Then 
		Response.Redirect("login.asp")
	Else
%>
<!--#include file="includes/connection.asp"-->
<%
'======================================================='
'Written By : Bharath'
'Last UpDated : 14/08/2009'
'Description :'
'This page is add and view comments page'
'======================================================='

'Declare The Variables'
Dim rqAction
Dim strComments, strCallDet
Dim objRs
Dim arrAllComments
Dim firstRow, lastRow, numRows
Dim rowcounter
Dim rqCallId
Dim City, CallerName
Dim rqPage

Set objRs = Server.CreateObject("ADODB.Recordset")

'Retrive action through querystring from this page'
rqAction = Request.QueryString("action")
rqCallId = Request.QueryString("callId")
rqPage = Request.QueryString("page")

If rqAction = "addComments" OR rqAction = "viewComments" Or rqAction = "viewAdminComments" Then

	strCallDet = "SELECT city, callername FROM ps_callsreceived WHERE callid = '" & rqCallId & "'"

	objRs.Open strCallDet, ConnObj
	
	Do Until objRs.Eof 
	
		City = objRs("city")
		CallerName = objRs("callername")
	
	objRs.Movenext
	Loop
	
	objRs.Close
End If

If rqAction = "viewComments" OR rqAction = "viewAdminComments" Then

If rqAction = "viewComments" Then 

	strComments = "SELECT f_comment, comm_addedby, comm_date FROM ps_fac_comments WHERE callid = '" & rqCallId & "' And typeofuser = 'Instructor'"

Else 

strComments = "SELECT f_comment, comm_addedby, comm_date FROM ps_fac_comments WHERE callid = '" & rqCallId & "' And typeofuser <> 'Instructor'"

End If

objRs.Open strComments,ConnObj

If Not objRs.EOF Then
	arrAllComments = objRs.getrows
	numRows = Ubound(arrAllComments,2)	
	firstRow = 0
	lastRow = numRows
End If

objRs.Close

End If	
  


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Comments</title>
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
				<% If rqPage = "SC" Then %>
                <h2><a href="home.asp">Home</a> &raquo; <a href="scheClasses.asp" class="active">Classes Scheduled</a> &raquo; <% If rqAction = "addComments" Then %>Add Comments<% Else %>View Comments<% End If %></h2>
				<% ElseIf rqPage = "B2C" Then %>
				<h2><a href="home.asp">Home</a> &raquo; <a href="marketingB2C.asp" class="active">Marketing B2C</a> &raquo; <% If rqAction = "addComments" Then %>Add Comments<% Else %>View Comments<% End If %></h2>
				<% End If %>

                <div id="main">
				
				<% If rqAction = "addComments" Then %>
				<h3>Add Comments</h3>
						<fieldset>
						<form action="addComments.asp" method="post">
						<input type="hidden" name="callId" value="<% = rqCallId %>" />
						<input type="hidden" name="page" value="<% = rqPage %>" />
						<table width="400px" border="0" cellpadding="5" cellspacing="3" class="table2">
						 <tr>
						  <td>City:</td>
						  <td><% = City %></td>
						 </tr>
					     <tr>						
						 <tr>
						  <td>Name:</td>
						  <td><% = CallerName %></td>
						 </tr>
						 <tr>
						  <td colspan="4"><textarea name="comment" rows="5" cols="5"></textarea></td>
						 </tr>
						 <tr><td>&nbsp;</td></tr>
						 <tr>
						  <td colspan="2">&nbsp;</td>
						  <td><input type="submit" name="type" value="Add Comments" /></td>
						 </tr>					 					 
						</table>
	                    </form>
						</fieldset>
				  <% Else %>
					<h3>View Comments</h3>
					<fieldset>
                    	<table width="400px" border="0" cellpadding="0" cellspacing="0" class="table2">
						 <tr>
							<td>City:</td>
							<td><% = City %></td>
						 </tr>
						 <tr>
							<td>Name:</td>
						    <td><% = EName %></td>
						 </tr>
						 <tr>
							<td>Enrollment Date:</td>
							<td><% = FormatDateTime(StartDate,1) %>&nbsp;<% = FormatDateTime(EndDate,1) %></td>
						</tr>
						<tr>
							<td>Comments:</td>
						</tr>
						<tr class="table1">
							<td colspan="2" class="table1">
								<table width="600px" border="0" cellpadding="0" cellspacing="0" class="table1">
								 <tr class="table1">
								  <td width="400px">Comment</td>
								  <td width="200px">Comment Added by</td>
								 </tr>
								 </table>
						   		 <% If IsArray(arrAllComments) Then
						     		 For rowcounter = firstRow To lastRow %>
									 <table width="600px" border="0" cellpadding="0" cellspacing="0" class="table1">							
								 <tr class="table1">
								  <td width="400px"><% = arrAllComments(0,rowcounter) %></td>
								  <td width="200px"><% = arrAllComments(1,rowcounter) %> &nbsp;<% = arrAllComments(2,rowcounter) %></td>
								 </tr>
								 </table>
								 <% Next 
								    End If %>
							</td>
                        </tr> 
						<% End If %>						                          
                        </table>
						</fieldset>
						<p>&nbsp;</p>				  				  
				  <% 'End If %>
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