<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'======================================================='
 'Written By : BhojaRaju'
 'Last UpaDated: '
 'Description :'
 'Purpose : Add/Edit/Delete of Participants'
'======================================================='
 
  If not  Session("UserId") = "" Then %>
<!--#include virtual="/india/connection.asp"-->
<%
	Dim Sql,Sql1,Rs1,action,rqId
	action = Request.QueryString("action")
	'if action = "Add" then
	
	'Set Rs = Server.CreateObject("ADODB.RecordSet")
		
	'Sql = "select distinct (city) from ps_city where country = '"& Session("country") &"'"
	'response.Write(sql1)
	'response.Flush()
	'Rs.open Sql,conn

	'end if
	
	'response.Write(action)
	
	if action = "Edit" then
		
		rqId = Request.QueryString("id")
		Set Rs1 = Server.CreateObject("ADODB.RecordSet")
		Sql1 = "select * from ps_participants where id = '"& rqId &"'"
		'response.Write(sql1)
		'response.Flush()
		Rs1.Open Sql1,conn
		
	end if
	


 	'country = request.QueryString("country")
  	city = request.QueryString("city")
  	rqSession = request.QueryString("session")
  	
	
 	if action = "View" then
	Set Rs = Server.CreateObject("ADODB.Recordset")
		if Request.QueryString("city") <> "" then
  Dim country,city,rqSession
  
  
  
  
  Sql = "select id,name,company,city,session,country from ps_participants where country = '"& session("country") &"' and city = '"& city &"' and session = '"& rqSession &"'"
  'response.Write(sql)
  'response.Flush()
  Rs.open Sql,conn
  
  If Not Rs.EOF Then
       arrAllRecords = Rs.getrows
       Session("arrAllRecords") = arrAllRecords
       numRows = Ubound(arrAllRecords,2)
       firstRow = 0
	   lastRow = numRows
   	End If
	
		else
	
	  
  
  Sql = "select startsession,endsession,country,city from ps_images where country = '"& Session("country") &"' order by city "
 'response.Write(sql)
  'response.Flush()
  Rs.open Sql,conn
  
  If Not Rs.EOF Then
       arrAllRecords = Rs.getrows
       Session("arrAllRecords") = arrAllRecords
       numRows = Ubound(arrAllRecords,2)
       firstRow = 0
	   lastRow = numRows
   	End If
	
	Set Rs1 = Server.CreateObject("ADODB.RecordSet")
		Sql1 = "select id from ps_images where country = '"& Session("country") &"'"
		'response.Write(sql1)
		'response.Flush()
		Rs1.Open Sql1,conn
		
		if (not Rs1.BOF) and (not Rs1.EOF) then
			cid = Rs1("id")
		end if
		'response.Write(cid)
	
 end if
 end if  
 
 
 
 	if action = "Delete" then
	
		Dim SqlD,RsD
		rqId = Request.QueryString("id")
		Set RsD = Server.CreateObject("ADODB.RecordSet")
		
		SqlD = "delete from ps_participants where id = '"& rqId &"'"
		RsD.open SqlD,conn
		
		
		Response.Redirect("addEditParticipants.asp?action=View&city="&city&"&session="&rqsession&"&country="&Session("country"))
	end if
 
 
 
  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Participants</title>
 <link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
  <link href="../../css/pmstyle.css" rel="stylesheet" type="text/css">
</head>

<body><div id="htMap">
<table border="1" height="550" cellspacing="0" class="dbborder" width="1000px" >
 <tr>
   <td colspan="3" height="35"><div align="center"><strong>WELCOME TO PMSTUDY BACKOFFICE OPERATIONS</strong></div></td>
 </tr>
 <tr>
  <td width="100px" valign="top" rowspan="22">
    <!--#include file="leftMenu.html"-->
  </td>
 </tr>
 <tr valign="top">
 	<td align="center"  style="margin-top:20cm">
				  
				<fieldset style="width:700px" >
			<legend><span class="citydiv"><% if action = "Add" then %> Add Participants <% end if %>
					<% if action = "Edit" then %>  Edit Participants <% end if %>
					<% if action = "View" then %>  View Participants <% end if %></span>
					</legend>
			 
	 	<% if action = "Add" then %>
		<table border="0" align="center" width="500px" height="350px" cellpadding="5" cellspacing="2" bgcolor="#e7f2f7">
			
			
			
			<form name="Add Participants" action="insertParticipants.asp?action=Add" method="post">
			<tr bgcolor="#ffffff">
				<td width="100px" height="30px">Country : </td><td>&nbsp;&nbsp;&nbsp;<% =session("country") %><input type="hidden" name="country" value="<% =session("country") %>" /> </td>
			</tr>
			<tr bgcolor="#ffffff">
				<td height="30px">City : </td><td>&nbsp;&nbsp;&nbsp;<% =city %><input type="hidden" name="city" value="<% =city %>" /></td>
			</tr>
			<tr bgcolor="#ffffff">
				<td height="30px">Session : </td><td>&nbsp;&nbsp;&nbsp;<% = rqSession %><input type="hidden" name="session" value="<% =rqSession %>" /></td>
			</tr>
			<tr bgcolor="#ffffff">
				<td height="30px">Name : </td><td><input type="text" name="Name" size="36" maxlength="180"/></td>
			</tr>
			<tr bgcolor="#ffffff">
				<td height="30px">Company : </td><td><input type="text" name="company" size="36" maxlength="475"/></td>
			</tr>
			
			<tr bgcolor="#ffffff">
				<td colspan="2" height="30px">
					<table width="100%">
						<tr>
							<td height="30px" colspan="" align="center"><input type="submit" value="Submit" class="buttonc"/></td>																	 							</form>
							<form name="Add Participants" action="addEditParticipants.asp?action=View" method="post">
							<td height="30px" colspan="" align=""><input type="submit" value="Cancel" class="buttonc"/></td>																	 							</form>
						</tr>
					</table>
				</td>
				
			</tr>
			
		</table>
			<% end if  %>
			<% if action = "Edit" then %>
		<table border="0" align="center" width="500px" height="350px" cellpadding="2" cellspacing="2" bgcolor="#e7f2f7">
			
			<form name="Add Participants" action="insertParticipants.asp?action=Edit" method="post">
			<tr bgcolor="#ffffff">
				<td width="100px" height="30px">Country : </td><td>&nbsp;&nbsp;&nbsp;<% =Rs1("country") %><input type="hidden" name="country" value="<% =Rs1("country") %>"/><input type="hidden" name="id" value="<% =Rs1("id") %>"/>  </td>
			</tr>
			<tr bgcolor="#ffffff">
				<td height="30px">City : </td><td>&nbsp;&nbsp;&nbsp;<% =Rs1("city") %><input type="hidden" name="city" value="<% =Rs1("city") %>" /></option>
									</td>
			</tr>
			<tr bgcolor="#ffffff">
				<td height="30px">Session : </td><td>&nbsp;&nbsp;&nbsp;<% =Rs1("session") %><input type="hidden" name="session" value="<% =Rs1("session") %>"/></td>
			</tr>
			<tr bgcolor="#ffffff">
				<td height="30px">Name : </td><td><input type="text" name="Name" value="<% =Rs1("name") %>" size="36" maxlength="180"/></td>
			</tr bgcolor="#ffffff">
			<tr bgcolor="#ffffff">
				<td height="30px">Company : </td><td><input type="text" name="company" value="<% =Rs1("company") %>" maxlength="475" size="36"/></td>
			</tr>
			
			<tr bgcolor="#ffffff">
				<td colspan="2" height="30px">
					<table width="100%">
						<tr>
							<td height="30px" colspan="" align="center"><input type="submit" value="Submit" class="buttonc"/></td>																	 							</form>
							<form name="Add Participants" action="addEditParticipants.asp?action=View" method="post">
							<td height="30px" colspan="" align=""><input type="submit" value="Cancel" class="buttonc"/></td>																	 							</form>
						</tr>
					</table>
				</td>
			</tr>
			
			
			
		</table>
		<% end if  
		  if action = "View" then 
		  		if request.QueryString("city") <> "" then
		  %>
			
				<table border="0" width="650px" align="center" cellpadding="2" cellspacing="2"  bgcolor="#e7f2f7">
					<tr bgcolor="#ffeeee" align="center" height="30px" class="titlediv">
						<td>Name</td>
						<td>Company</td>
						<td colspan="2">Actions</td>
					</tr>
					<%  If IsArray(arrAllRecords) Then
							For rowcounter = firstRow to lastRow %>
					 
					<tr bgcolor="#ffffff">
						<td><% =arrAllRecords(1,rowcounter) %></td>
						<td><% =arrAllRecords(2,rowcounter) %></td>
						<td align="center" width="70px"><a href="addEditParticipants.asp?action=Edit&id=<% =arrAllRecords(0,rowcounter) %>">Edit</a></td>
						<td align="center" width="70px"	><a href="addEditParticipants.asp?action=Delete&id=<% =arrAllRecords(0,rowcounter) %>&city=<% =arrAllRecords(3,rowcounter) %>&Session=<% =arrAllRecords(4,rowcounter) %>&country=<% =arrAllRecords(5,rowcounter) %>">Delete</a></td>
					</tr>
					
					<%		next
						End if %>
						
				</table>
			
			<% else %>
			
				<table border="0" width="650px" align="center"  bgcolor="#e7f2f7" cellpadding="5">
					<tr bgcolor="#ffeeee" align="center" height="30px" class="titlediv">
						<td>Country</td>
						<td>City</td>
						<td >Session</td>
						<td colspan="2">Participants</td>
					</tr>
					<%  If IsArray(arrAllRecords) Then
							For rowcounter = firstRow to lastRow %>
					 
					<tr bgcolor="#ffffff">
						<td><% =arrAllRecords(2,rowcounter) %></td>
						<td><% =arrAllRecords(3,rowcounter) %></td>
						<td><% = FormatDateTime(arrAllRecords(0,rowcounter),1) %> to <% = FormatDateTime(arrAllRecords(1,rowCounter),1)%></td>
						<td align="center" width="60px"><a href="addEditParticipants.asp?action=Add&id=<% = cid %>">Add</a></td>
						<td align="center" width="60px"><a href="addEditParticipants.asp?action=View&id=<% =cid %>&city=<% =arrAllRecords(2,rowcounter) %>&Session=<% =arrAllRecords(0,rowcounter) %>&country=<% =arrAllRecords(1,rowcounter) %>">View</a></td>
						
					</tr>
					
					<%		next
						End if %>
						
				</table>
			
			
			<% end if
				end if %>
		 </fieldset> 
	</td>
 </tr>				
</table>
</div>
 
</body>
</html>
 <%
 
'" create table ps_images (id int identity (1,1) primary key, country varchar(100),city varchar(200),startsession datetime,endsession datetime,image1 varchar(500),image2 varchar(500),description1 varchar(2000),description2 varchar(2000)) "

'"  create table ps_participants (id int identity (1,1) primary key, country varchar(100),city varchar(200),session varchar(500),name varchar(200),company varchar(500)) "

' CREATE TABLE ps_participants (id int identity(1,1) primary key, name varchar(500), company varchar(500),sessionid int)
 
 Else
 Response.Redirect("../login.asp")
 End If
%>
