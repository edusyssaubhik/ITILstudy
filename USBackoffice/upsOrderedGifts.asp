<% 
'Written By : Bharath'
'Created Date: 17/02/2010'
'Last Updated Date: 04/03/2010'
'Description :'
'Purpose : UPS System page (Adding/Editing gift orders, Shipping Details)'

'If Session("USBUserId") equals to nothing it will be redirect to login page other wise showing the UPS page'
If Session("USBUserId") = "" Then 
	Response.Redirect("login.asp")
Else
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Gifts Order</title>
<!-- CSS -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<!--[if IE 6]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie6.css" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie7.css" /><![endif]-->
<!-- JavaScripts-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jNice.js"></script>
<script type="text/javascript" src="/india/backoffice/csr/calendar/zapatec.js"></script>
<script type="text/javascript" src="/india/backoffice/csr/calendar/calendar.js"></script>
<script type="text/javascript" src="/india/backoffice/csr/calendar/calendar-en.js"></script>
<link href="/india/backoffice/csr/calendar/template.css" rel="stylesheet" type="text/css">
<link href="/india/backoffice/csr/calendar/system.css" rel="stylesheet" type="text/css">

</head>
<body>
<!--#include virtual="/includes/connection.asp"-->
<%
'Declare the local variable'
Dim rqAction
Dim objRs
Dim rqShippingId

'Create recordobject'
Set objRs = SERVER.CreateObject("ADODB.Recordset")
Set objRs1 = SERVER.CreateObject("ADODB.Recordset")

'Retrivng the user selected action'
rqAction = Request.QueryString("action")

%>
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
      <h2><a href="home.asp">Home</a> &raquo; <a href="upsOrderedGifts.asp" class="active">UPS</a> &raquo;
	  <% If rqAction = "addOrderGifts" Then %>
		Add Ordered Gifts
		<% ElseIf rqAction = "editOrderGifts" Then %>
		Edit Ordered Gifts
		<% ElseIf rqAction = "viewRecGifts" Then %>
		UPS Received Gifts
		<% ElseIf rqAction = "shippingGifts" Then %>
		Shipping
		<% ElseIf rqAction = "allshippingDet" Then %>
		All Shipping Details
        <% Else %>
		Order Gifts
		<% End If %>
	  
	   </h2>
	  
	  <div id="topbar" style="margin-left:30px;"><ul class="topNav"><li><a href="upsOrderedGifts.asp?action=addOrderGifts">Add Ordered Gifts</a></li></ul></div>
	  <div id="topbar" style="margin-left:12px;"><ul class="topNav"><li><a href="upsOrderedGifts.asp?action=editOrderGifts">Edit Ordered Gifts</a></li></ul></div>	 
	  <div id="topbar" style="margin-left:10px;"><ul class="topNav"><li><a href="upsOrderedGifts.asp?action=viewRecGifts">UPS Received Gifts</a></li></ul></div> 
	  <div id="topbar" style="margin-left:12px;"><ul class="topNav"><li><a href="upsOrderedGifts.asp?action=shippingGifts">Shipping</a></li></ul></div>
	  <div id="topbar" style="margin-left:-15px;"><ul class="topNav"><li><a href="upsOrderedGifts.asp?action=allshippingDet">All Shipping Details</a></li></ul></div>
	  
				
      <div id="main">
	  	<% If rqAction = "addOrderGifts" Then %>
		<h3>Add Ordered Gifts</h3>
		<% ElseIf rqAction = "editOrderGifts" Then %>
		<h3>Edit Ordered Gifts</h3>
		<% ElseIf rqAction = "viewRecGifts" Then %>
		<h3>UPS Received Gifts</h3>
		<% ElseIf rqAction = "shippingGifts" Then %>
		<h3>Shipping</h3>
		<% ElseIf rqAction = "allshippingDet" Then %>
		<h3>All Shipping Details</h3>
        <% Else %>
		<h3>Order Gifts</h3>
		<% End If %>
		
        <fieldset>
		<% 
			'If user selects Add Ordered Gifts tab, that will come here and showing the form'
			If rqAction = "addOrderGifts" Then %>
		<form action="addEditOrderedGifts.asp" method="post">
        <table border="0" cellpadding="15" cellspacing="10" width="70%">
			<tr>
				<td><b>Gifts Names</b></td>
				<td><b>No of Gifts</b></td>
				<td><b>Price/Unit</b></td>
				<td><b>Expected Date</b></td>
			</tr>
			<tr>
				<td width="18%">4 in 1 Pens :</td><td width="5%"><input type="text" name="pens" size="2" /></td>
				<td width="8%"><input type="text" name="pen_price" size="5" /></td>
				<td  width="35%"><input autocomplete="off" name="pens_expdate" readonly id="checkIn1_date" type="text" size="10">
            	<input value=" ... " id="button8a" class="buttonc" type="reset"></td>
			</tr>
			<tr>				
				<td>Highlighter Neon Yellow :</td><td><input type="text" name="neon_yellow" size="2" /></td>
				<td><input type="text" name="neon_yellow_price" size="5" /></td>
				<td><input autocomplete="off" name="neon_yellow_expdate" readonly id="checkIn2_date" type="text" size="10">
            		<input value=" ... " id="button8b" class="buttonc" type="reset">
			</td>
			</tr>
			<tr>
				<td>Highlighter Neon Green :</td><td><input type="text" name="neon_green" size="2" /></td>
				<td><input type="text" name="neon_green_price" size="5" /></td>
				<td><input autocomplete="off" name="neon_green_expdate" readonly id="checkIn3_date" type="text" size="10">
            		<input value=" ... " id="button8c" class="buttonc" type="reset">
				</td>
			</tr>
			<tr>
				<td>Pencil - Z- Grip :</td><td><input type="text" name="pencil" size="2" /></td>
				<td><input type="text" name="pencil_price" size="5" /></td>
				<td><input autocomplete="off" name="pencil_expdate" readonly id="checkIn4_date" type="text" size="10">
            		<input value=" ... " id="button8d" class="buttonc" type="reset">
				</td>
			</tr>
			<tr>
				<td>Quick point Pen Holder :</td><td><input type="text" name="pen_holder" size="2" /></td>
				<td><input type="text" name="pen_holder_price" size="5" /></td>
				<td><input autocomplete="off" name="pen_holder_expdate" readonly id="checkIn5_date" type="text" size="10">
            		<input value=" ... " id="button8e" class="buttonc" type="reset">
				</td>
			</tr>
			<tr>
				<td>Robot Series Calculator :</td><td><input type="text" name="calculator" size="2" /></td>
				<td><input type="text" name="calculator_price" size="5" /></td>
				<td><input autocomplete="off" name="calculator_expdate" readonly id="checkIn6_date" type="text" size="10">
            		<input value=" ... " id="button8f" class="buttonc" type="reset">
				</td>
			</tr>
			<tr>
				<td>Backpack Travel :</td><td><input type="text" name="backpack" size="2" /></td>
				<td><input type="text" name="backpack_price" size="5" /></td>
				<td><input autocomplete="off" name="backpack_expdate" readonly id="checkIn7_date" type="text" size="10">
            		<input value=" ... " id="button8g" class="buttonc" type="reset">
				</td>
			</tr>
			<tr>
				<td>Cap :</td><td><input type="text" name="cap" size="2" /></td>
				<td><input type="text" name="cap_price" size="5" /></td>
				<td><input autocomplete="off" name="cap_expdate" readonly id="checkIn8_date" type="text" size="10">
            		<input value=" ... " id="button8h" class="buttonc" type="reset">
				</td>
			</tr>
			<tr>
				<td>Stress Ball :</td><td><input type="text" name="ball" size="2" /></td>
				<td><input type="text" name="ball_price" size="5" /></td>
				<td><input autocomplete="off" name="ball_expdate" readonly id="checkIn9_date" type="text" size="10">
            		<input value=" ... " id="button8i" class="buttonc" type="reset">
				</td>
			</tr>
			<tr>
				<td>Post It Notes :</td><td><input type="text" name="notes" size="2" /></td>
				<td><input type="text" name="notes_price" size="5" /></td>
				<td><input autocomplete="off" name="notes_expdate" readonly id="checkIn10_date" type="text" size="10">
            		<input value=" ... " id="button8j" class="buttonc" type="reset">
				</td>
			</tr>
			<tr>
				<td>Comments :</td>
				<td colspan="3"><textarea rows="10" cols="50" name="comments"></textarea>
			</tr>
          	<tr>
				<td colspan="3"><div align="right"><input type="submit" name="type" value="Order Gifts" />&nbsp;&nbsp;<input type="reset" value="Reset" /></div></td>
			</tr>
        </table>
		</form>
		<% 
			
			'If user slects Edit Ordered Gifts tab, that will come here and showing the maximum oreder number details'
			ElseIf rqAction = "editOrderGifts" Then 

			strQuery = "SELECT * FROM ps_ordered_gifts WHERE order_no = (SELECT MAX(order_no) FROM ps_ordered_gifts)"
			
			objRs.Open strQuery,ConnObj
		
		
		%>
		<form action="addEditOrderedGifts.asp" method="post">
        <table border="0" cellpadding="15" cellspacing="10" width="70%">
			<tr>
				<td><b>Gifts Names</b></td>
				<td><b>No of Gifts</b></td>
				<td><b>Price/Unit</b></td>
				<td><b>Expected Date</b></td>
			</tr>
			<% If Not objRs.EOF Then %>
			<tr>
				<td width="18%">4 in 1 Pens :</td><td width="5%"><input type="text" name="pens" value="<% = objRs("number_of_ordered") %>" size="2" /></td>
				<td width="8%"><input type="text" name="pen_price" value="<% = objRs("price_per_unit") %>" size="5" /></td>
				<td  width="35%"><input autocomplete="off" name="pens_expdate" readonly id="checkIn1_date" value="<% = objRs("expected_date") %>" type="text" size="10">
            	<input value=" ... " id="button8a" class="buttonc" type="reset"></td>
				<input type="hidden" name="order_id1" value="<% = objRs("ordered_id") %>" />
				<input type="hidden" name="order_no" value="<% = objRs("order_no") %>" />
			</tr>
			<% objRs.Movenext %>
			<tr>				
				<td>Highlighter Neon Yellow :</td><td><input type="text" name="neon_yellow" value="<% = objRs("number_of_ordered") %>" size="2" /></td>
				<td><input type="text" name="neon_yellow_price" value="<% = objRs("price_per_unit") %>" size="5" /></td>
				<td><input autocomplete="off" name="neon_yellow_expdate" readonly id="checkIn2_date" value="<% = objRs("expected_date") %>" type="text" size="10">
            		<input value=" ... " id="button8b" class="buttonc" type="reset"></td>
					<input type="hidden" name="order_id2" value="<% = objRs("ordered_id") %>" />
			</tr>
			<% objRs.Movenext %>
			<tr>
				<td>Highlighter Neon Green :</td><td><input type="text" name="neon_green" value="<% = objRs("number_of_ordered") %>" size="2" /></td>
				<td><input type="text" name="neon_green_price" value="<% = objRs("price_per_unit") %>" size="5" /></td>
				<td><input autocomplete="off" name="neon_green_expdate" readonly id="checkIn3_date" value="<% = objRs("expected_date") %>" type="text" size="10">
            		<input value=" ... " id="button8c" class="buttonc" type="reset">
				</td>
				<input type="hidden" name="order_id3" value="<% = objRs("ordered_id") %>" />
			</tr>
			<% objRs.Movenext %>
			<tr>
				<td>Pencil - Z- Grip :</td><td><input type="text" name="pencil" value="<% = objRs("number_of_ordered") %>" size="2" /></td>
				<td><input type="text" name="pencil_price" value="<% = objRs("price_per_unit") %>" size="5" /></td>
				<td><input autocomplete="off" name="pencil_expdate" readonly id="checkIn4_date" value="<% = objRs("expected_date") %>" type="text" size="10">
            		<input value=" ... " id="button8d" class="buttonc" type="reset">
				</td>
				<input type="hidden" name="order_id4" value="<% = objRs("ordered_id") %>" />
			</tr>
			<% objRs.Movenext %>
			<tr>
				<td>Quick point Pen Holder :</td><td><input type="text" name="pen_holder" value="<% = objRs("number_of_ordered") %>" size="2" /></td>
				<td><input type="text" name="pen_holder_price" value="<% = objRs("price_per_unit") %>" size="5" /></td>
				<td><input autocomplete="off" name="pen_holder_expdate" readonly id="checkIn5_date" value="<% = objRs("expected_date") %>" type="text" size="10">
            		<input value=" ... " id="button8e" class="buttonc" type="reset">
				</td>
				<input type="hidden" name="order_id5" value="<% = objRs("ordered_id") %>" />
			</tr>
			<% objRs.Movenext %>
			<tr>
				<td>Robot Series Calculator :</td><td><input type="text" name="calculator" value="<% = objRs("number_of_ordered") %>" size="2" /></td>
				<td><input type="text" name="calculator_price" value="<% = objRs("price_per_unit") %>" size="5" /></td>
				<td><input autocomplete="off" name="calculator_expdate" readonly id="checkIn6_date" value="<% = objRs("expected_date") %>" type="text" size="10">
            		<input value=" ... " id="button8f" class="buttonc" type="reset">
				</td>
				<input type="hidden" name="order_id6" value="<% = objRs("ordered_id") %>" />
			</tr>
			<% objRs.Movenext %>
			<tr>
				<td>Backpack Travel :</td><td><input type="text" name="backpack" value="<% = objRs("number_of_ordered") %>" size="2" /></td>
				<td><input type="text" name="backpack_price" value="<% = objRs("price_per_unit") %>" size="5" /></td>
				<td><input autocomplete="off" name="backpack_expdate" readonly id="checkIn7_date" value="<% = objRs("expected_date") %>" type="text" size="10">
            		<input value=" ... " id="button8g" class="buttonc" type="reset">
				</td>
				<input type="hidden" name="order_id7" value="<% = objRs("ordered_id") %>" />
			</tr>
			<% objRs.Movenext %>
			<tr>
				<td>Cap :</td><td><input type="text" name="cap" value="<% = objRs("number_of_ordered") %>" size="2" /></td>
				<td><input type="text" name="cap_price" value="<% = objRs("price_per_unit") %>" size="5" /></td>
				<td><input autocomplete="off" name="cap_expdate" readonly id="checkIn8_date" value="<% = objRs("expected_date") %>" type="text" size="10">
            		<input value=" ... " id="button8h" class="buttonc" type="reset">
				</td>
				<input type="hidden" name="order_id8" value="<% = objRs("ordered_id") %>" />
			</tr>
			<% objRs.Movenext %>
			<tr>
				<td>Stress Ball :</td><td><input type="text" name="ball" value="<% = objRs("number_of_ordered") %>" size="2" /></td>
				<td><input type="text" name="ball_price" value="<% = objRs("price_per_unit") %>" size="5" /></td>
				<td><input autocomplete="off" name="ball_expdate" readonly id="checkIn9_date" value="<% = objRs("expected_date") %>" type="text" size="10">
            		<input value=" ... " id="button8i" class="buttonc" type="reset">
				</td>
				<input type="hidden" name="order_id9" value="<% = objRs("ordered_id") %>" />
			</tr>
			<% objRs.Movenext %>
			<tr>
				<td>Post It Notes :</td><td><input type="text" name="notes" value="<% = objRs("number_of_ordered") %>" size="2" /></td>
				<td><input type="text" name="notes_price" value="<% = objRs("price_per_unit") %>" size="5" /></td>
				<td><input autocomplete="off" name="notes_expdate" readonly id="checkIn10_date" value="<% = objRs("expected_date") %>" type="text" size="10">
            		<input value=" ... " id="button8j" class="buttonc" type="reset">
				</td>
				<input type="hidden" name="order_id10" value="<% = objRs("ordered_id") %>" />
			</tr>
			<% objRs.Movenext 
			   End If %>
			<tr>
				<td>Comments :</td>
				<td colspan="3"><textarea rows="10" cols="50" name="comments"></textarea>
			</tr>
          	<tr>
				<td colspan="3"><div align="right"><input type="submit" name="type" value="Edit Ordered Gifts" />&nbsp;&nbsp;<input type="reset" value="Reset" /></div></td>
			</tr>
        </table>
		</form>
		<% 
			
			'If user selects Shipping tab, that will come here and in the drop down showing all the faculty'
			'Based on faculty we are adding shipping details(gifts)'
			ElseIf rqAction = "shippingGifts" Then
			
			strQuery = "SELECT firstname, lastname, emailid1 FROM ps_us_instructors WHERE typeofuser = 'Faculty' ORDER BY firstname"
			
			objRs.Open strQuery,ConnObj
		%>
		<form action="addEditOrderedGifts.asp" method="post">
        <table border="0" cellpadding="15" cellspacing="10" width="70%">
			<tr>
				<td>Faculty: </td>
				<td colspan="3">
					<select name="faculty">
						<option value="Select">--Select--</option>
						<% Do Until objRs.EOF 
					       facName = objRs("firstname") &" "& objRs("lastname")
						%>
						<option value="<% = objRs("emailid1") %>"><% = facName %></option>
						<% objRs.Movenext
						   Loop 
						   objRs.Close %>
					</select>
				</td>
			</tr>
			<tr>
				<td width="15%">4 in 1 Pens :</td><td width="15%"><input type="text" name="pens" size="2" /></td>
				<td width="15%">Highlighter Neon Yellow :</td><td width="15%"><input type="text" name="neon_yellow" size="2" /></td>
			</td>
			</tr>
			<tr>
				<td>Highlighter Neon Green :</td><td><input type="text" name="neon_green" size="2" /></td>
				<td>Pencil - Z- Grip :</td><td><input type="text" name="pencil" size="2" /></td>
			</tr>
			<tr>
				<td>Quick point Pen Holder :</td><td><input type="text" name="pen_holder" size="2" /></td>
				<td>Robot Series Calculator :</td><td><input type="text" name="calculator" size="2" /></td>
			</tr>
			<tr>
				<td>Backpack Travel :</td><td><input type="text" name="backpack" size="2" /></td>
				<td>Cap :</td><td><input type="text" name="cap" size="2" /></td>
			</tr>
			<tr>
				<td>Stress Ball :</td><td><input type="text" name="ball" size="2" /></td>
				<td>Post It Notes :</td><td><input type="text" name="notes" size="2" /></td>
			</tr>
			<tr>
				<td>Comments :</td>
				<td colspan="3"><textarea rows="5" cols="30" name="comments"></textarea>
			</tr>
          	<tr>
				<td colspan="3"><div align="right"><input type="submit" name="type" value="Shipment" />&nbsp;&nbsp;<input type="reset" value="Reset" /></div></td>
			</tr>
        </table>
		</form>
		<% 
		   'If user selects UPS Received Gifts tab, that will come here'
		   'Here i am showing last ordered gifts (maximum oreder number)'
		   'And displaying the last ordered gifts comments'
		   ElseIf rqAction = "viewRecGifts" Then 
		
		   strQuery = "SELECT * FROM ps_ordered_gifts WHERE order_no = (SELECT MAX(order_no) FROM ps_ordered_gifts)"
			
     	   objRs.Open strQuery,ConnObj
		   
		   strComments = "SELECT * FROM ps_ordered_gifts_comments WHERE order_no = (SELECT MAX(order_no) FROM ps_ordered_gifts_comments)"
			
		   objRs1.Open strComments, ConnObj
		
		%>
        <table border="0" cellpadding="15" cellspacing="10" width="70%">
			<tr>
				<td><b>Gifts Names</b></td>
				<td><b>No of Gifts</b></td>
				<td><b>Received Date</b></td>
			</tr>
			<% If Not objRs.EOF Then %>
			<tr>
				<td width="18%">4 in 1 Pens :</td><td width="5%"><% = objRs("qty_received") %></td>
				<td  width="35%"><% = objRs("received_date") %></td>
			</tr>
			<% objRs.Movenext %>
			<tr>				
				<td>Highlighter Neon Yellow :</td><td><% = objRs("qty_received") %></td>
				<td><% = objRs("received_date") %>
			</td>
			</tr>
			<% objRs.Movenext %>
			<tr>
				<td>Highlighter Neon Green :</td><td><% = objRs("qty_received") %></td>
				<td><% = objRs("received_date") %>
				</td>
			</tr>
			<% objRs.Movenext %>
			<tr>
				<td>Pencil - Z- Grip :</td><td><% = objRs("qty_received") %></td>
				<td><% = objRs("received_date") %>
				</td>
			</tr>
			<% objRs.Movenext %>
			<tr>
				<td>Quick point Pen Holder :</td><td><% = objRs("qty_received") %></td>
				<td><% = objRs("received_date") %>
				</td>
			</tr>
			<% objRs.Movenext %>
			<tr>
				<td>Robot Series Calculator :</td><td><% = objRs("qty_received") %></td>
				<td><% = objRs("received_date") %>
				</td>
			</tr>
			<% objRs.Movenext %>
			<tr>
				<td>Backpack Travel :</td><td><% = objRs("qty_received") %></td>
				<td><% = objRs("received_date") %>
				</td>
			</tr>
			<% objRs.Movenext %>
			<tr>
				<td>Cap :</td><td><% = objRs("qty_received") %></td>
				<td><% = objRs("received_date") %>
				</td>
			</tr>
			<% objRs.Movenext %>
			<tr>
				<td>Stress Ball :</td><td><% = objRs("qty_received") %></td>
				<td><% = objRs("received_date") %>
				</td>
			</tr>
			<% objRs.Movenext %>
			<tr>
				<td>Post It Notes :</td><td><% = objRs("qty_received") %></td>
				<td><% = objRs("received_date") %>
				</td>
			</tr>
			<% objRs.Movenext 
			   End If %>
			<tr>
				<td>Comments :</td>
				<td colspan="3">
				<ol>
				    <% Do Until objRs1.EOF %>
					<li><% = objRs1("comment") %>&nbsp;---><% = objRs1("comm_addedby") %>&nbsp;<% = objRs1("comm_addeddate") %></li>
					<% objRs1.Movenext
					   Loop
					   objRs1.Close %>
				</ol>
				</td>
			</tr>
        </table>	
		<% 
			'If user selects All Shipping Details tab, that will come here'
			'In the strFaculty query i am retriving all the faculty details'
			'In the strOrderedGifts query based faculty email id i am retriving the recent shipping details or last shippment details of the faculty'
			'I am runnig the loop'
			ElseIf rqAction = "allshippingDet" Then 
		
			strFaculty = "SELECT firstname, lastname, emailid1, address1, phoneno1 FROM ps_us_instructors WHERE typeofuser = 'Faculty' ORDER BY firstname"
			
			objRs.Open strFaculty, ConnObj
			
		%>
       <table border="0" width="100%" cellpadding="1" cellspacing="0" class="table1">
			<tr>
				<td><b>Faculty</b></td>
				<td><b>4 in 1 Pens</b></td>
				<td><b>Highlighter Neon Yellow</b></td>
				<td><b>Highlighter Neon Green</b></td>
				<td><b>Pencil - Z- Grip</b></td>
				<td><b>Quick point Pen Holder</b></td>
				<td><b>Robot Series Calculator</b></td>
				<td><b>Backpack Travel</b></td>
				<td><b>Cap</b></td>
				<td><b>Stress Ball</b></td>
				<td><b>Post It Notes</b></td>
				<td><b>Comments</b></td>
				<td><b>Tracking Number</b></td>
				<td><b>Status</b></td>
				<td><b>Edit</b></td>
			</tr>
			<% 
				Do Until objRs.Eof
				
				strOrderedGifts = "SELECT top 1 * FROM faculty_shipping_gifts WHERE fac_emailid = '"& objRs("emailid1") &"' ORDER BY shipping_id desc" 
				
				objRs1.Open strOrderedGifts, ConnObj
				
				Do Until objRs1.EOF 
				
				Shipping_Id = objRs1("shipping_id")
				FirstName = objRs("firstname")
				LastName  = objRs("lastname") 
				Pens = objRs1("pens") 
				Yellow = objRs1("highlighter_yellow")
				Green = objRs1("highlighter_green") 
				Pencil = objRs1("pencil") 
				PenHolder = objRs1("pen_holder") 
				Calc = objRs1("calculator") 
				BackPack = objRs1("backpack") 
				Cap = objRs1("cap")
				StressBall = objRs1("stressball")
				Notes = objRs1("postit_notes") 
			%>
			<tr>
				<td width="400px"><% = FirstName %>&nbsp;<% = LastName %><br /><% = objRs("address1") %><br />Ph: <% = objRs("phoneno1") %></td>
				<td><% = Pens %></td>
				<td><% = Yellow %></td>
				<td><% = Green %></td>
				<td><% = Pencil %></td>
				<td><% = PenHolder %></td>
				<td><% = Calc %></td>
				<td><% = BackPack %></td>
				<td><% = Cap %></td>
				<td><% = StressBall %></td>
				<td><% = Notes %></td>
				<td><% = objRs1("comment") %></td>
				<td>
				<% If IsNull(objRs1("tracking_no")) Then %>
				&nbsp;
				<% Else %>
				<% = objRs1("tracking_no") %>
				<% End If %>
				</td>
				</form>
				<td>
				<% If IsNull(objRs1("Gifts_Status")) Then %>
				Pending
				<% Else %>
				Received
				<% End If %>
				</td>
				<td>
				<% If IsNull(objRs1("Gifts_Status")) Then %>
				<a href="upsOrderedGifts.asp?action=editShipDet&ShipId=<% = Shipping_Id %>">Edit</a>
				<% Else %>
				&nbsp;
				<% End If %>
				</td>
			</tr>			
			<%
				objRs1.Movenext
				Loop
				objRs1.Close
			
				objRs.Movenext
				Loop
				objRs.Close
			%>
        </table>
		</form>	
		<% 
			'If user selects Edit option in the All Shipping Details, it will come here'
			'Here i am retriving the shipping id and based on the shipping id retrive all the values and display the editable format'
			ElseIf rqAction = "editShipDet" Then 
			
			rqShippingId = Request.QueryString("ShipId")
			
			strQuery = "SELECT * FROM faculty_shipping_gifts WHERE shipping_id = '"& rqShippingId &"'"
			
			objRs.Open strQuery, ConnObj
			
		%>
		<form action="addEditOrderedGifts.asp" method="post">
		<% Do Until objRs.EOF %>
		<input type="hidden" name="shipping_id" value="<% = objRs("shipping_id") %>" />
		<input type="hidden" name="comment" value="<% = objRs("comment") %>" />
        <table border="0" cellpadding="15" cellspacing="10" width="70%">
			<tr>
				<td width="15%">4 in 1 Pens :</td><td width="15%"><input type="text" name="pens" size="2" value="<% = objRs("pens") %>" /></td>
				<td width="15%">Highlighter Neon Yellow :</td><td width="15%"><input type="text" name="neon_yellow" size="2" value="<% = objRs("highlighter_yellow") %>" /></td>
			</td>
			</tr>
			<tr>
				<td>Highlighter Neon Green :</td><td><input type="text" name="neon_green" size="2" value="<% = objRs("highlighter_green") %>" /></td>
				<td>Pencil - Z- Grip :</td><td><input type="text" name="pencil" size="2" value="<% = objRs("pencil") %>" /></td>
			</tr>
			<tr>
				<td>Quick point Pen Holder :</td><td><input type="text" name="pen_holder" size="2" value="<% = objRs("pen_holder") %>" /></td>
				<td>Robot Series Calculator :</td><td><input type="text" name="calculator" size="2" value="<% = objRs("calculator") %>" /></td>
			</tr>
			<tr>
				<td>Backpack Travel :</td><td><input type="text" name="backpack" size="2" value="<% = objRs("backpack") %>" /></td>
				<td>Cap :</td><td><input type="text" name="cap" size="2" value="<% = objRs("cap") %>" /></td>
			</tr>
			<tr>
				<td>Stress Ball :</td><td><input type="text" name="ball" size="2" value="<% = objRs("stressball") %>" /></td>
				<td>Post It Notes :</td><td><input type="text" name="notes" size="2" value="<% = objRs("postit_notes") %>" /></td>
			</tr>
			<tr>
				<td>Comments :</td>
				<td colspan="3"><% = objRs("comment") %></td>
			</tr>			
			<tr>
				<td>Add Comments :</td>
				<td colspan="3"><textarea rows="5" cols="30" name="addcomments"></textarea>
			</tr>
			<% objRs.Movenext
			   Loop
			   objRs.Close %>
          	<tr>
				<td colspan="3"><div align="right"><input type="submit" name="type" value="Edit Shipment" />&nbsp;&nbsp;<input type="reset" value="Reset" /></div></td>
			</tr>
        </table>
		</form>
		<% 
			'When user clicking the UPS link in the left side that will come here'
			'In the strQuery i am retriving latest ordered details'
			'In the strComments i am retriving comments of latest ordered gifts'
			ElseIf rqAction = "" Then 
			
			strQuery = "SELECT * FROM ps_ordered_gifts WHERE order_no = (SELECT MAX(order_no) FROM ps_ordered_gifts)"
			
			objRs.Open strQuery, ConnObj

		%>
		
		
        <table border="0" cellpadding="15" cellspacing="10" width="70%">
			<tr>
				<td><b>Gifts Names</b></td>
				<td><b>No of Gifts</b></td>
				<td><b>Price/Unit</b></td>
				<td><b>Expected Date</b></td>
			</tr>
			<% 	Do Until objRs.EOF 
				
				Dim Order_No
				
				Order_No = objRs("order_no") 
			%>
			<tr>
				<td width="18%"><% = objRs("gift_name") %></td><td width="5%"><% = objRs("number_of_ordered") %></td>
				<td width="8%"><% = objRs("price_per_unit") %></td>
				<td  width="35%"><% = FormatDateTime(objRs("expected_date"),1) %></td>
			</tr>
			<% objRs.Movenext
			   Loop 
			   objRs.Close %>			
			<tr>
				<td>Comments :</td>
				<td colspan="3">
				<ol>
				    <%
					
						strComments = "SELECT *	 FROM ps_ordered_gifts_comments WHERE order_no = '"& Order_No &"'"
			
						objRs1.Open strComments, ConnObj
					
						 Do Until objRs1.EOF 
						 %>
						 
					<li><% = objRs1("comment") %>&nbsp;---><% = objRs1("comm_addedby") %>&nbsp;<% = FormatDateTime(objRs1("comm_addeddate"),1) %></li>
					<% objRs1.Movenext
					   Loop
					   objRs1.Close %>
				</ol>
				</td>
			</tr>
        </table>	
	
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
<!-- This Script For Calendar -->
<script type="text/javascript">
   			<!--  to hide script contents from old browsers
   			var startDate;
   			var endDate;

   			function filterDates1(cal) {
   				startDate = new Date(cal.date)
   				startDate.setHours(0,0,0,0)	
   			}

   			function filterDates2(cal) {
   				var date = cal.date;
   				endDate = new Date(cal.date)
   				endDate.setHours(0,0,0,0)	// used for compares without TIME
   			}
			
			function filterDates3(cal) {
   				var date = cal.date;
   				endDate = new Date(cal.date)
   				endDate.setHours(0,0,0,0)	// used for compares without TIME
   			}
			
			function filterDates4(cal) {
   				var date = cal.date;
   				endDate = new Date(cal.date)
   				endDate.setHours(0,0,0,0)	// used for compares without TIME
   			}			
			
			function filterDates5(cal) {
   				var date = cal.date;
   				endDate = new Date(cal.date)
   				endDate.setHours(0,0,0,0)	// used for compares without TIME
   			}			
			
			function filterDates6(cal) {
   				var date = cal.date;
   				endDate = new Date(cal.date)
   				endDate.setHours(0,0,0,0)	// used for compares without TIME
   			}			
			
			function filterDates7(cal) {
   				var date = cal.date;
   				endDate = new Date(cal.date)
   				endDate.setHours(0,0,0,0)	// used for compares without TIME
   			}			
			
			function filterDates8(cal) {
   				var date = cal.date;
   				endDate = new Date(cal.date)
   				endDate.setHours(0,0,0,0)	// used for compares without TIME
   			}			
			
			function filterDates9(cal) {
   				var date = cal.date;
   				endDate = new Date(cal.date)
   				endDate.setHours(0,0,0,0)	// used for compares without TIME
   			}			
			
			function filterDates10(cal) {
   				var date = cal.date;
   				endDate = new Date(cal.date)
   				endDate.setHours(0,0,0,0)	// used for compares without TIME
   			}			
   			// end hiding contents from old browsers  -->
   		</script>
		<script type="text/javascript">

   			var cal = new Zapatec.Calendar.setup({

   	         inputField     :    "checkIn1_date",   // id of the input field
   	         button         :    "button8a",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         onUpdate       :    filterDates1

   			});

   	      Zapatec.Calendar.setup({
   	         inputField     :    "checkIn2_date",
   	         button         :    "button8b",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         onUpdate       :    filterDates2
   	      });

   	      Zapatec.Calendar.setup({
   	         inputField     :    "checkIn3_date",
   	         button         :    "button8c",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         onUpdate       :    filterDates3
   	      });

   	      Zapatec.Calendar.setup({
   	         inputField     :    "checkIn4_date",
   	         button         :    "button8d",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         onUpdate       :    filterDates4
   	      });
		  
   	      Zapatec.Calendar.setup({
   	         inputField     :    "checkIn5_date",
   	         button         :    "button8e",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         onUpdate       :    filterDates5
   	      });
		  
   	      Zapatec.Calendar.setup({
   	         inputField     :    "checkIn6_date",
   	         button         :    "button8f",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         onUpdate       :    filterDates6
   	      });
		  
   	      Zapatec.Calendar.setup({
   	         inputField     :    "checkIn7_date",
   	         button         :    "button8g",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         onUpdate       :    filterDates7
   	      });
		  
   	      Zapatec.Calendar.setup({
   	         inputField     :    "checkIn8_date",
   	         button         :    "button8h",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         onUpdate       :    filterDates8
   	      });
		  
   	      Zapatec.Calendar.setup({
   	         inputField     :    "checkIn9_date",
   	         button         :    "button8i",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         onUpdate       :    filterDates9
   	      });
		  
   	      Zapatec.Calendar.setup({
   	         inputField     :    "checkIn10_date",
   	         button         :    "button8j",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         onUpdate       :    filterDates10
   	      });		  		  		  		  		  		  
   		</script>
<!-- // #wrapper -->
</body>
</html>
<% End If %>
