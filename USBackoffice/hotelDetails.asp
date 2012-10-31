<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 'OPTION EXPLICIT %>
<!-- #include virtual="/india/backoffice/csr/imageUpload.asp" -->
<% 
	If Session("USBUserId") = "" Then 
		Response.Redirect("login.asp")
	Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
'Written By : savita'
'Written Date : 13/12/2011'
'Last UpDated : 13/12/2011'
'Description :'
'This page is Hotel Bookings Details for Classes in US'
'======================================================='

'Declare The Variables'
Dim strCity, strHotelDet
Dim rqAction
Dim objRs, objRs1
Dim rqId
Dim arrAllHotelDet, firstRow, lastRow, numRows, rqRow, rqPage
Dim rqCity, strCountry

'Creating the Recordset objects'
SET objRs = Server.CreateObject("ADODB.Recordset")
SET objRs1 = Server.CreateObject("ADODB.Recordset")
SET objRs2 = Server.CreateObject("ADODB.Recordset")
SET objRs3 = Server.CreateObject("ADODB.Recordset")
SET objRs = Server.CreateObject("ADODB.Recordset")

'Retrive the values from this page'
rqAction = Request.QueryString("action")
rqRow  = Request.QueryString("row")
rqPage = Request.QueryString("page")

If Request.Form("city") <> "" Then
	rqCity = Request.Form("city")
Else
	rqCity = Request.QueryString("city")
End If 

'Display the queries country wise'
If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then
	strCountry = "(country = 'US' OR country = 'Canada')"
ElseIf Session("CRM_Country") = "United Kingdom" Then
	strCountry = "(country = 'United Kingdom')"
ElseIf Session("CRM_Country") = "UAE" Then
	strCountry = "(country = 'UAE')"
ElseIf Session("CRM_Country") = "India" Then
	strCountry = "(country = 'India')"
ElseIf Session("CRM_Country") = "Singapore" Then
	strCountry = "(country = 'Singapore')"		
ElseIf Session("CRM_Country") = "Germany" Then
	strCountry = "(country = 'Germany')"
ElseIf Session("CRM_Country") = "Netherlands" Then
	strCountry = "(course.country = 'Netherlands')"		
ElseIf (Session("CRM_Country") = "Australia") Then
	strCountry = "(country = 'Australia')"	
ElseIf Session("CRM_Country") = "Global" Then	
	strCountry = "(country = 'US' OR country = 'Canada')"
	Session("CRM_Country") = "US"	
End If

'Response.write("Test"&strCountry)

If rqCity <> "" Then

'Retrive the hoteldetails based on city searchand dispaly'
strHotelDet = "SELECT id, city, dateofclass, hotel, noofstudents, payment1, payment2, payment3, payment4, payment5, addeddate, addedby FROM ITIL_hoteldetails WHERE city = '"& rqCity &"' ORDER BY id DESC"


Else 
'Retrive the hoteldetails and dispaly'
strHotelDet = "SELECT id, city, dateofclass, hotel, noofstudents, payment1, payment2, payment3, payment4, payment5, addeddate, addedby FROM ITIL_hoteldetails WHERE "& strCountry &" ORDER BY id DESC"

End If

'Response.Write(strHotelDet)

objRs1.Open strHotelDet, ConnObj

If Not objRs1.EOF Then
	arrAllHotelDet = objRs1.getrows
	firstRow = 0
	lastRow = 19
	numRows = Ubound(arrAllHotelDet,2)
	If lastRow > numRows Then
	   lastRow = numRows
	End If
End If

objRs1.Close

If rqPage = "next" Then

   numRows = Ubound(arrAllHotelDet,2)

   firstRow = rqRow + 1
   lastRow = firstRow + 19

   If firstRow >= numRows Then
      firstRow = rqRow + 1
      lastRow = firstRow + 19
   End If

   If firstRow < 0 Then
      firstRow = 0
   End If

   If lastRow > numRows Then
      lastRow = numRows
   End If

End If

If rqPage = "previous" Then

   numRows = Ubound(arrAllHotelDet,2)

   lastRow = rqRow - 1
   firstRow = lastRow - 19

   If firstRow =< 0 Then
      firstRow = 0
      lastRow = firstRow + 19
   End If

   If lastRow > numRows Then
      lastRow = numRows
   End If

End If

'If rqAction = "editHotDet" OR rqAction = "viewHotDet" OR rqAction = "addHotDet" OR rqAction = "hotelContracts" OR rqAction = "addHotelCont" Then

If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then

	'Retrive the Cities in US'
	strCity = "SELECT city,state_code FROM ITIL_city WHERE country = 'US'  ORDER BY city"
	
	objRs.Open strCity, ConnObj
	
	'Retrive the Cities in Canada'
	strCity2 = "SELECT city,state_code FROM ITIL_city WHERE country = 'Canada' ORDER BY city"
	
	objRs3.Open strCity2, ConnObj
	
ElseIf (Session("CRM_Country") = "Australia") Then

	'Retrive the Cities in US'
	strCity = "SELECT city, state_code FROM ITIL_city WHERE country = 'Australia'  ORDER BY city"
	
	objRs.Open strCity, ConnObj


Else
	
	'Retrive the Cities in other countries'
	strCity = "SELECT city,state_code FROM ITIL_city WHERE country = '" & Session("CRM_Country") & "' ORDER BY city"
	
	objRs.Open strCity, ConnObj

End If

'Retrive the edit id for retrive the hotel details'
rqId = Request.QueryString("id")

strHotDet = "SELECT * FROM ITIL_hoteldetails WHERE id = '"& rqId &"'"

objRs1.Open strHotDet, ConnObj

'End If




'If user selects hotel contracts'
If rqAction = "hotelContracts" Then

If rqCity <> "" Then

strHotelContarcts = "SELECT courseid, city, startdate, enddate, hotelContracts FROM ITIL_course WHERE city = '"& rqCity &"' And "& strCountry &"  And hotelContracts Is Not Null And status <> 'Cancelled' AND status <> 'Completed' ORDER BY startdate desc"

Else 

strHotelContarcts = "SELECT courseid, city, startdate, enddate, hotelContracts FROM ITIL_course WHERE "& strCountry &"  And hotelContracts Is Not Null And status <> 'Cancelled' AND status <> 'Completed' ORDER BY startdate desc"

End If

objRs2.Open strHotelContarcts, ConnObj

If Not objRs2.EOF Then
	arrAllHotelCon = objRs2.getrows
	firstRow = 0
	lastRow = 19
	numRows = Ubound(arrAllHotelCon,2)
	If lastRow > numRows Then
	   lastRow = numRows
	End If
End If

objRs2.Close

If rqPage = "next" Then

   numRows = Ubound(arrAllHotelCon,2)

   firstRow = rqRow + 1
   lastRow = firstRow + 19

   If firstRow >= numRows Then
      firstRow = rqRow + 1
      lastRow = firstRow + 19
   End If

   If firstRow < 0 Then
      firstRow = 0
   End If

   If lastRow > numRows Then
      lastRow = numRows
   End If

End If

If rqPage = "previous" Then

   numRows = Ubound(arrAllHotelCon,2)

   lastRow = rqRow - 1
   firstRow = lastRow - 19

   If firstRow =< 0 Then
      firstRow = 0
      lastRow = firstRow + 19
   End If

   If lastRow > numRows Then
      lastRow = numRows
   End If

End If

ElseIf rqAction = "addHotelCont" Then

strHotelContarcts = "SELECT courseid, city, startdate, enddate, hotelContracts FROM ITIL_course WHERE "& strCountry &"  And status <> 'Cancelled' AND status <> 'Completed' And startdate >= '"&Now() - 1&"'  ORDER BY startdate"

objRs2.Open strHotelContarcts, ConnObj

If Not objRs2.EOF Then
	arrAllHotelCon = objRs2.getrows
	numRows = Ubound(arrAllHotelCon,2)
	firstRow = 0
	lastRow = numRows
	
	If lastRow > numRows Then
	   lastRow = numRows
	End If
End If

objRs2.Close

ElseIf rqAction = "editHotelCont" Then

rqCourseId = Request.QueryString("id")

strHotelContarcts = "SELECT courseid, city, startdate, enddate, hotelContracts FROM ITIL_course WHERE courseid = '"& rqCourseId &"'"

objRs2.Open strHotelContarcts, ConnObj

If Not objRs2.EOF Then
	arrAllHotelCon = objRs2.getrows
	firstRow = 0
	lastRow = 19
	numRows = Ubound(arrAllHotelCon,2)
	If lastRow > numRows Then
	   lastRow = numRows
	End If
End If

objRs2.Close

End If


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Hotel Details</title>
<!-- CSS -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<!--[if IE 6]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie6.css" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie7.css" /><![endif]-->
<!-- JavaScripts-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jNice.js"></script>
<script type="text/javascript" src="/js/upload.js"></script>
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
      <h2><a href="home.asp">Home</a> &raquo; <a href="hotelDetails.asp" class="active">Hotel Details</a><% If rqAction = "addHotDet" Then %>  &raquo; Add hotel details<% ElseIf rqAction = "editHotDet" Then %>  &raquo; Edit hotel details<% ElseIf rqAction = "viewHotDet" Then %> &raquo;  View hotel details<% ElseIf rqAction = "hotelContracts" OR rqAction = "addHotelCont" OR rqAction = "editHotelCont" Then %> &raquo;  Hotel Contracts<% End If %></h2>
      <div id="topbar" style="margin-left:31px;">
        <ul class="topNav">
          <li><a href="hotelDetails.asp?action=addHotDet">Add Hotel Details</a></li>
        </ul>
      </div>
	  <div id="topbar" style="margin-left:1px;">
        <ul class="topNav">
          <li><a href="hotelDetails.asp?action=hotelContracts">Hotel Contracts</a></li>
        </ul>
      </div>
      <div id="main">
		<% If rqAction = "hotelContracts" OR rqAction = "" Then %>
        <table width="60%" >
          <tr>
            <td width="10%"><h3>Hotel Details</h3></td>
			<% If rqAction = "hotelContracts" Then %>
            <form action="hotelDetails.asp?action=hotelContracts" method="post">
			<% Else %>
			<form action="hotelDetails.asp" method="post">
			<% End If %>
              <td width="10%">City :
                <select name="city">
                  <option value="">-Select-</option>
				  <% If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then %>
                  <optgroup label="US">
                  <% Do Until objRs.EOF %>
                  <option <% If rqCity = objRs("city") Then %> selected="selected" <% End If %> value="<% = objRs("city") %>">
                  <% = objRs("city") %>, <% = objRs("state_code") %>
                  </option>
                  <% objRs.Movenext
				   Loop
				   objRs.Close %>
                  </optgroup>
                  <optgroup label="Canada">
                  <% Do Until objRs3.EOF %>
                  <option <% If rqCity = objRs3("city") Then %> selected="selected" <% End If %> value="<% = objRs3("city") %>">
                  <% = objRs3("city") %>, <% = objRs3("state_code") %>
                  </option>
                  <% objRs3.Movenext
				   Loop
				   objRs3.Close %>
                  </optgroup>
				  <% ElseIf Session("country") = "Australia" Then %>
                
                  <% Do Until objRs.EOF %>
                  <option <% If rqCity = objRs("city") Then %> selected="selected" <% End If %> value="<% = objRs("city") %>">
                  <% = objRs("city") %>
                  </option>
                  <% objRs.Movenext
				   Loop
				   objRs.Close %>
                

				  <% Else %>
                  <% Do Until objRs.EOF %>
                  <option <% If rqCity = objRs("city") Then %> selected="selected" <% End If %> value="<% = objRs("city") %>">
                  <% = objRs("city") %>                  </option>
                  <% objRs.Movenext
				   Loop
				   objRs.Close %>				  
				  <% End If %>
                </select>
                <input type="submit" name="search" value="Search" />
              </td>
            </form>
		  </tr>
		 </table>
		 <% Else %>
		 <p>
        <h3>Hotel Details</h3>
        </p>
		 <% End If %>
        <fieldset>
		<% 'Adding New Hote Details'
		   If rqAction = "addHotDet" Then %>
		<form name="frmSend" action="addEditHotDet.asp"  method="POST">
		<table border="0" class="table2">
			<tr>
				<td>City:</td>
				<td>
					<select name="city">
						<option value="">--Select--</option>
                        <% If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then %>
						<optgroup label="US">
						<% Do Until objRs.Eof %>
						<option value="<% = objRs("city") %>"><% = objRs("city") %>, <% = objRs("state_code") %></option>
						<% objRs.Movenext
						   Loop 
						   objRs.Close %>
						</optgroup>
						<optgroup label="Canada">
						<% Do Until objRs3.Eof %>
						<option value="<% = objRs3("city") %>"><% = objRs3("city") %>, <% = objRs3("state_code") %></option>
						<% objRs3.Movenext
						   Loop 
						   objRs3.Close %>
						</optgroup>
                        <% ElseIf (Session("country") = "Australia" ) Then %>
						<% Do Until objRs.Eof %>
						<option value="<% = objRs("city") %>"><% = objRs("city") %>, <% = objRs("state_code") %></option>
						<% objRs.Movenext
						   Loop 
						   objRs.Close %>
						
                        <% Else %>
                        <% Do Until objRs.EOF %>
                        <option <% If rqCity = objRs("city") Then %> selected="selected" <% End If %> value="<% = objRs("city") %>">
                        <% = objRs("city") %>                  </option>
                        <% objRs.Movenext
                           Loop
                           objRs.Close %>	
                        <% End If %>
					</select>
				</td>
			</tr>
			<tr>
				<td>Date of class:</td>
				<td><input type="text" name="dateofclass" /></td>
				<td>Hotel:</td>
				<td><input type="text" name="hotel" /></td>
			</tr>
			<tr>
				<td>No of students:</td>
				<td><input type="text" name="noofstudents" /></td>
				<td>Hotel cost projected:</td>
				<td><input type="text" name="hotelcostprojected" /></td>
			</tr>	
			<tr>
				<td>Agreement file:</td>
				<td><input type="text" name="agreementfile" /></td>
				<td>BEO Details:</td>
				<td><input type="text" name="beodetails" /></td>
			</tr>	
			<tr>
				<td>Deposit:</td>
				<td><input type="text" name="deposit" /></td>
				<td>Deposit Date :</td>
				<td><input type="text" name="depositdate" /> &nbsp;(mm/dd/yyyy)</td>
			</tr>			
			<tr>
				<td>Payment1:</td>
				<td><input type="text" name="payment1" /></td>
				<td>Date1:</td>
				<td><input type="text" name="date1" /> &nbsp;(mm/dd/yyyy)</td>
			</tr>	
			<tr>
				<td>Payment2:</td>
				<td><input type="text" name="payment2" /></td>
				<td>Date2:</td>
				<td><input type="text" name="date2" />&nbsp;(mm/dd/yyyy)</td>
			</tr>
			<tr>
				<td>Payment3:</td>
				<td><input type="text" name="payment3" /></td>
				<td>Date3:</td>
				<td><input type="text" name="date3" />&nbsp;(mm/dd/yyyy)</td>
			</tr>	
			<tr>
				<td>Payment4:</td>
				<td><input type="text" name="payment4" /></td>
				<td>Date4:</td>
				<td><input type="text" name="date4" />&nbsp;(mm/dd/yyyy)</td>
			</tr>														
			<tr>
				<td>Payment5:</td>
				<td><input type="text" name="payment5" /></td>
				<td>Date5:</td>
				<td><input type="text" name="date5" />&nbsp;(mm/dd/yyyy)</td>
			</tr>	
			<tr>
				<td>Rescheduling Policy:</td>
				<td><textarea rows="10" cols="35" name="reschepolicy"></textarea></td>
			</tr>
			<tr>
				<td>Cancellation clause:</td>
				<td><textarea rows="10" cols="35" name="cancelclause"></textarea></td>
			</tr>				
			<tr>
			    <td>&nbsp;</td>
				<td><br /><input type="submit" name="type" value="Add Hotel Details" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="Reset" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<% If rqPage <> "" Then %>
					<a href="hotelDetails.asp?page=<% = rqPage %>&row=<% = rqRow %>">Back to details</a>
				<% Else %>
					<a href="hotelDetails.asp">Back to details</a>
				<% End If %>
				</td>
			</tr>		
		</table>
		</form>
		<% ElseIf rqAction = "editHotDet" Then %>
		<form name="frmSend" action="addEditHotDet.asp"  method="POST">
		<% Do until objRs1.EOF %>
		<input type="hidden" name="id" value="<% = objRs1("id") %>" />
		<table border="0" class="table2">
			<tr>
				<td>City:</td>
				<td>
						<select name="city">
						<option value="">--Select--</option>
                        <% If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then %>
						<optgroup label="US">
						<% Do Until objRs.Eof %>
						<option value="<% = objRs("city") %>"><% = objRs("city") %>, <% = objRs("state_code") %></option>
						<% objRs.Movenext
						   Loop 
						   objRs.Close %>
						</optgroup>
						<optgroup label="Canada">
						<% Do Until objRs3.Eof %>
						<option value="<% = objRs3("city") %>"><% = objRs3("city") %>, <% = objRs3("state_code") %></option>
						<% objRs3.Movenext
						   Loop 
						   objRs3.Close %>
						</optgroup>
                        <% ElseIf (Session("country") = "Australia" ) Then %>
						<% Do Until objRs.Eof %>
						<option value="<% = objRs("city") %>"><% = objRs("city") %>, <% = objRs("state_code") %></option>
						<% objRs.Movenext
						   Loop 
						   objRs.Close %>
						
                        <% Else %>
                        <% Do Until objRs.EOF %>
                        <option <% If rqCity = objRs("city") Then %> selected="selected" <% End If %> value="<% = objRs("city") %>">
                        <% = objRs("city") %>                  </option>
                        <% objRs.Movenext
                           Loop
                           objRs.Close %>	
                        <% End If %>
					</select>
				</td>
			</tr>
			<tr>
				<td>Date of class:</td>
				<td><input type="text" value="<% = objRs1("dateofclass") %>" name="dateofclass" /></td>
				<td>Hotel:</td>
				<td><input type="text" value="<% = objRs1("hotel") %>" name="hotel" /></td>
			</tr>
			<tr>
				<td>No of students:</td>
				<td><input type="text" value="<% = objRs1("noofstudents") %>" name="noofstudents" /></td>
				<td>Hotel cost projected:</td>
				<td><input type="text" value="<% = objRs1("hotelcostprojected") %>" name="hotelcostprojected" /></td>
			</tr>	
			<tr>
				<td>Agreement file:</td>
				<td><input type="text" value="<% = objRs1("agreementfile") %>" name="agreementfile" /></td>
				<td>BEO Details:</td>
				<td><input type="text" value="<% = objRs1("beodetails") %>" name="beodetails" /></td>
			</tr>	
			<tr>
				<td>Deposit:</td>
				<td><input type="text" value="<% = objRs1("deposit") %>" name="deposit" /></td>
				<td>Deposit Date :</td>
				<td><input type="text" value="<% = objRs1("depositdate") %>" name="depositdate" /> &nbsp;(mm/dd/yyyy)</td>
			</tr>			
			<tr>
				<td>Payment1:</td>
				<td><input type="text" value="<% = objRs1("payment1") %>" name="payment1" /></td>
				<td>Date1:</td>
				<td><input type="text" value="<% = objRs1("date1") %>" name="date1" />&nbsp;(mm/dd/yyyy)</td>
			</tr>	
			<tr>
				<td>Payment2:</td>
				<td><input type="text" value="<% = objRs1("payment2") %>" name="payment2" /></td>
				<td>Date2:</td>
				<td><input type="text" value="<% = objRs1("date2") %>" name="date2" />&nbsp;(mm/dd/yyyy)</td>
			</tr>
			<tr>
				<td>Payment3:</td>
				<td><input type="text" value="<% = objRs1("payment3") %>" name="payment3" /></td>
				<td>Date3:</td>
				<td><input type="text" value="<% = objRs1("date3") %>" name="date3" />&nbsp;(mm/dd/yyyy)</td>
			</tr>	
			<tr>
				<td>Payment4:</td>
				<td><input type="text" value="<% = objRs1("payment4") %>" name="payment4" /></td>
				<td>Date4:</td>
				<td><input type="text" value="<% = objRs1("date4") %>" name="date4" />&nbsp;(mm/dd/yyyy)</td>
			</tr>														
			<tr>
				<td>Payment5:</td>
				<td><input type="text" value="<% = objRs1("payment5") %>" name="payment5" /></td>
				<td>Date5:</td>
				<td><input type="text" value="<% = objRs1("date5") %>" name="date5" />&nbsp;(mm/dd/yyyy)</td>
			</tr>	
			<tr>
				<td>Rescheduling Policy:</td>
				<td><textarea rows="10" cols="35" name="reschepolicy"><% = objRs1("reschedulepolicy") %></textarea></td>
			</tr>
			<tr>
				<td>Cancellation clause:</td>
				<td><textarea rows="10" cols="35" name="cancelclause"><% = objRs1("cancellationpolicy") %></textarea></td>
			</tr>				
			<tr>
				<td>&nbsp;</td>
				<td><br /><input type="submit" name="type" value="Edit Hotel Details" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="Reset" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<% If rqPage <> "" Then %>
					<a href="hotelDetails.asp?page=<% = rqPage %>&row=<% = rqRow %>">Back to details</a>
				<% Else %>
					<a href="hotelDetails.asp">Back to details</a>
				<% End If %>				
				</td>
			</tr>		
		</table>
		<% objRs1.Movenext
		   Loop
		   objRs1.Close %>
		</form>
		<% ElseIf rqAction = "viewHotDet" Then %>
		<% Do until objRs1.EOF 
		   Total = objRs1("payment1") + objRs1("payment2") + objRs1("payment3") + objRs1("payment4") + objRs1("payment5") %>
		<input type="hidden" name="id" value="<% = objRs1("id") %>" />
		<table border="0"  class="table2" width="85%">
			<tr>
				<td>City:</td>
				<td colspan="3"><% = objRs1("city") %></td>
			</tr>
			<tr>
				<td>Date of class:</td>
				<td><% = objRs1("dateofclass") %></td>
				<td>Hotel:</td>
				<td><% = objRs1("hotel") %></td>
			</tr>
			<tr>
				<td>No of students:</td>
				<td><% = objRs1("noofstudents") %></td>
				<td>Hotel cost projected:</td>
				<td><% = objRs1("hotelcostprojected") %></td>
			</tr>	
			<!--<tr>
				<td>Agreement file:</td>
				<td><a href="http://www.pmstudy.info/HotelDocs/<% = objRs1("agreementfile") %>" target="_blank"><% = objRs1("agreementfile") %></a></td>
				<td>BEO Details:</td>
				<td><a href="http://www.pmstudy.info/HotelDocs/<% = objRs1("beodetails") %>" target="_blank"><% = objRs1("beodetails") %></a></td>
			</tr>	-->
			<tr>
				<td>Deposit:</td>
				<td><% = objRs1("deposit") %></td>
				<td>Deposit Date :</td>
				<td><% = objRs1("depositdate") %></td>
			</tr>				
			<tr>
				<td>Payment1:</td>
				<td><% = objRs1("payment1") %></td>
				<td>Date1:</td>
				<td><% = objRs1("date1") %></td>
			</tr>	
			<tr>
				<td>Payment2:</td>
				<td><% = objRs1("payment2") %></td>
				<td>Date2:</td>
				<td><% = objRs1("date2") %></td>
			</tr>
			<tr>
				<td>Payment3:</td>
				<td><% = objRs1("payment3") %></td>
				<td>Date3:</td>
				<td><% = objRs1("date3") %></td>
			</tr>	
			<tr>
				<td>Payment4:</td>
				<td><% = objRs1("payment4") %></td>
				<td>Date4:</td>
				<td><% = objRs1("date4") %></td>
			</tr>														
			<tr>
				<td>Payment5:</td>
				<td><% = objRs1("payment5") %></td>
				<td>Date5:</td>
				<td><% = objRs1("date5") %></td>
			</tr>	
			<tr>
				<td>Rescheduling Policy:</td>
				<td colspan="3"><% = objRs1("reschedulepolicy") %></td>
			</tr>
			<tr>
				<td>Cancellation clause:</td>
				<td colspan="3"><% = objRs1("cancellationpolicy") %></td>
			</tr>	
			<tr>
				<td>Total:</td>
				<td><b><% = Total %></b></td>
			</tr>			
			<tr>
				<td>
				<% If rqPage <> "" Then %>
					<a href="hotelDetails.asp?page=<% = rqPage %>&row=<% = rqRow %>">Back to details</a>
				<% Else %>
					<A HREF="javascript:javascript:history.go(-1)">Back to details</a>
				<% End If %>				
				</td>
			</tr>
		</table>
		<% objRs1.Movenext
		   Loop
		   objRs1.Close %>
		<% ElseIf rqAction = "hotelContracts" Then %> 
		<label><a href="hotelDetails.asp?action=addHotelCont">Add hotel contarcts</a></label>
		<% If IsArray(arrAllHotelCon) Then %>
        <table border="0" class="table1" width="80%">
          <tr>
            <td width="50%"><b>Course</b></td>
			<td width="30%"><b>Contract Document</b></td>
	        <td width="5%"><b>Edit</b></td>
          </tr>		
		  <% For rowcounter = firstRow To lastRow %>
          <tr>
            <td><% = arrAllHotelCon(1,rowcounter) %>: <% = FormatDateTime(arrAllHotelCon(2,rowcounter),1) %> to <% = FormatDateTime(arrAllHotelCon(3,rowcounter),1) %></td>
			<td><a href="http://www.PMstudy.info/itildocs/<% = arrAllHotelCon(4,rowcounter) %>"><% = arrAllHotelCon(4,rowcounter) %></a></td>
			<td><a href="hotelDetails.asp?action=editHotelCont&id=<% = arrAllHotelCon(0,rowcounter) %>"> Edit </a>
          </tr>
		  <% Next %>
          <tr>
            <td colspan="25">
			  <% If Not firstRow = 0 Then %>
              <a href="hotelDetails.asp??action=<% = rqAction %>&<% If rqCity <> "" Then %>city=<% = rqCity %>&<% End If %>page=previous&row=<% = firstRow %>"> &lt;&lt;Previous</a>
              <% End If %>
              <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
              <% If Not numRows = lastRow Then %>
              <a href="hotelDetails.asp??action=<% = rqAction %>&<% If rqCity <> "" Then %>city=<% = rqCity %>&<% End If %>page=next&row=<% = lastRow %>"> &gt;&gt;Next</a>
              <% End If %>
            </td>
          </tr>
        </table>
	    <% Else %>
		<table border="50%">
		  <tr><td colspan="3" align="center"><br /><b>No Documents in the <% = rqCity %> city</b></td></tr>
		</table>
		  <% End If %>
		<% ElseIf rqAction = "addHotelCont" Then %>
		<form action="addEditHotDet.asp" method="post">
		<table border="0" width="30%">
          <tr>
		  	<td>Course: </td>
			<td>
				<select name="courseid">
					<option value="">--Select--</option>
					<% If IsArray(arrAllHotelCon) Then
					   For rowcounter = firstRow To lastRow %>
					<option  value="<% = arrAllHotelCon(0,rowcounter) %>"><% = arrAllHotelCon(1,rowcounter) %>: <% = FormatDateTime(arrAllHotelCon(2,rowcounter),1) %> to <% = FormatDateTime(arrAllHotelCon(3,rowcounter),1) %></option>
					<% Next
					   End If %>
				</select>
			</td>
		  </tr>
		  <tr>
		  	<td>Document: </td>
			<td><input type="text" name="hotelContractName" size="50" /></td>
		  </tr>
		  <tr><td>&nbsp;</td><td><input type="submit" name="type" value="Add Hotel Contract" /></td></tr>
		</table>
		</form>
		<% ElseIf rqAction = "editHotelCont" Then %>
		<form action="addEditHotDet.asp" method="post">	
		<input type="hidden" name="courseid" value="<% = arrAllHotelCon(0,rowcounter) %>" />
		<table border="0" width="60%">
          <tr>
		  	<td>Course: </td>
			<td>
			<% If IsArray(arrAllHotelCon) Then
			   For rowcounter = firstRow To lastRow %>
			<% = arrAllHotelCon(1,rowcounter) %>: <% = FormatDateTime(arrAllHotelCon(2,rowcounter),1) %> to <% = FormatDateTime(arrAllHotelCon(3,rowcounter),1) %>
			</td>
		  </tr>
		  <tr>
		  	<td>Document: </td>
			<td><input type="text" name="hotelContractName" value="<% = arrAllHotelCon(4,rowcounter) %>" size="50" /></td>
		  </tr>
		  <% Next
			 End If %>
		  <tr><td>&nbsp;</td><td><input type="submit" name="type" value="Edit Hotel Contract" /></td></tr>
		</table>
		</form>		
		<% Else %>
		<% If IsArray(arrAllHotelDet) Then %>
        <table border="0" class="table1" width="100%">
          <tr>
            <td><b>City</b></td>
            <td><b>Date of class</b></td>
            <td><b>Hotel</b></td>
            <td><b>No of students</b></td>
			<td><b>Total</b></td>
			<td><b>Added Date</b></td>
			<td><b>Added By</b></td>
            <td><b>Edit</b></td>
			<td><b>View</b></td>
          </tr>
		  <% 
			 For rowcounter = firstRow To lastRow 
			 Total = (arrAllHotelDet(5,rowcounter) + arrAllHotelDet(6,rowcounter) + arrAllHotelDet(7,rowcounter) + arrAllHotelDet(8,rowcounter) + arrAllHotelDet(9,rowcounter)) 
			 
			 GrandTotal = GrandTotal + Total
		  %>
          <tr>
            <td><% = arrAllHotelDet(1,rowcounter) %></td>
            <td><% = arrAllHotelDet(2,rowcounter) %></td>
            <td><% = arrAllHotelDet(3,rowcounter) %></td>
            <td><% = arrAllHotelDet(4,rowcounter) %></td>
			<td><% = Total %></td>
            <td><% = arrAllHotelDet(10,rowcounter) %></td>
            <td><% = arrAllHotelDet(11,rowcounter) %></td>
			<td><a href="hotelDetails.asp?action=editHotDet&id=<% = arrAllHotelDet(0,rowcounter) %>"> Edit </a>
			<td><a href="hotelDetails.asp?action=viewHotDet&id=<% = arrAllHotelDet(0,rowcounter) %>"> View </a>
          </tr>
		  <% Next %>
          <tr>
            <td colspan="25"><% If Not firstRow = 0 Then %>
              <a href="hotelDetails.asp?<% If rqCity <> "" Then %>city=<% = rqCity %>&<% End If %>page=previous&row=<% = firstRow %>"> &lt;&lt;Previous</a>
              <% End If %>
              <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
              <% If Not numRows = lastRow Then %>
              <a href="hotelDetails.asp?<% If rqCity <> "" Then %>city=<% = rqCity %>&<% End If %>page=next&row=<% = lastRow %>"> &gt;&gt;Next</a>
              <% End If %>
            </td>
          </tr>
		  <tr>
		  	<td colspan="10" align="right"><b>Grand Total: <% = GrandTotal %></b></td>
		  </tr>
        </table>
		 <% Else %>
		<table border="50%">
		  <tr><td colspan="3" align="center"><br /><b>No Documents in the <% = rqCity %> city</b></td></tr>
		</table>
		  <% End If %>		
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

