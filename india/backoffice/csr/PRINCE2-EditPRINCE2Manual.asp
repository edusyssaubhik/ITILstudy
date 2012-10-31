<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Bharath'
'Created Date : 17/02/2012'
'Modified By : Bharath'
'Modified Date : 17/02/2012'
'Description :'
'Purpose : TDS Calculations'
'=======================================================' 
%>
<%
   If Session("UserId")  = "" Then
     Response.Redirect("/India/backoffice/login.asp")
   Else
%>

<!--#include virtual="/India/connection_global.asp"-->

<%
  Dim id,name,course,amount,pmbok,pmbokPrice,rqId,rqcourseId,Sql,Rs
  Dim CurrencyFormat_Front, CurrencyFormat_Back
  
  Set Rs = server.CreateObject("ADODB.recordset")
  
  rqId = request.QueryString("id")
  rqcourseId = request.QueryString("courseId")
  
  Sql = "select id,firstname,lastname,coursedetails,amount,PRINCE2Manual,PRINCE2price from prince2_enrolledusers where id = '"& rqId &"'"
   
  Rs.open Sql,ConnObj
 
 	
				
 
%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title>PRINCE2 MANUAL Edit</title>
<link href="/India/css/pagestyle.css" rel="stylesheet" type="text/css">
 <script  language="javascript">
  function Form_Validate(theform)
  {
  	var pmprice = theform.PRINCE2price.value;
	 
	if(pmprice == "")
		{
		alert("Please Enter PMBOK Price.")
		theform.pmbokPrice.focus();
		return(false);
		}
	}
 
 </script>
</head>
<body><div id="htMap">
<table border="1" height="550" cellspacing="0" class="dbborder" width="1000px">
 <tr>
   <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% =Session("country") %></span> PMstudy Back Office</font></div>
 </tr>
 <tr>
  <td width="100px" valign="top" rowspan="22">
    <!--#include file="leftMenu.html"-->
  </td>
 </tr>
 <tr>
 	<td valign="middle" height="100px">
		<table border="0" align="center" height="500"  bgcolor="#e7f2f7" cellpadding="5" >
			<tr bgcolor="#ffffff">
				<td colspan="2" align="center"><b>Edit PRINCE2Manual Price</b></td>
			</tr>
			<form name="PRINCE2-EditPRINCE2ManualPrice" action="PRINCE2-EditPRINCE2ManualPrice.asp" method="post" onsubmit="return Form_Validate(this)">
			<% do until Rs.EOF %>
			<tr bgcolor="#ffffff">
				<td>ID : <input type="hidden" name="Id" value="<% =Rs("id") %>" /><input type="hidden" name="courseId" value="<% =rqcourseId %>" /></td>
			    <td><% =Rs("id") %></td>
			</tr>
			<tr bgcolor="#ffffff">
				<td>Name : </td>
				<td><% =Rs("firstname") %> <% =Rs("lastname") %></td>
			</tr>
			<tr bgcolor="#ffffff">
				<td>Course : </td>
				<td><% =Rs("courseDetails") %></td>
			</tr>
			<tr bgcolor="#ffffff">
				<td>Amount : <input type="hidden" name="amount" value="<% =Rs("amount") %>" /></td>
				<td>
               <%
	
		If Session("Country") = "India" Then
			CurrencyFormat_Front = " Rs. "

		ElseIf Session("Country") =  "United Kingdom" Then
			 CurrencyFormat_Front = "&#163;"
			 
        ElseIf Session("Country") =  "United Kingdom" Then
			CurrencyFormat_Back =  "AUD"
		End IF	 
		
		%> 
                <% = CurrencyFormat_Front %><%  = formatnumber(Rs("amount")) %><% = CurrencyFormat_Back %></td>
			</tr>
			<tr bgcolor="#ffffff">
				<td>PRINCE2 Manual (Y/N) : <input type="hidden" name="PRINCE2Manual" value="<% =Rs("PRINCE2Manual") %>" /></td>
				<td><% =Rs("PRINCE2Manual") %></td>
			</tr>
			
			<tr bgcolor="#ffffff">
				<td>PRINCE2 Manual Price : <input type="hidden" name="PRINCE2PriceOld" value="<% =Rs("PRINCE2price") %>" /></td>
				<td><% = CurrencyFormat_Front %><input type="text" name="PRINCE2price" maxlength="5" value="<% =Rs("PRINCE2price") %>" /> <% = CurrencyFormat_Back %></td>
			</tr>
			 
			<tr bgcolor="#ffffff">
				<td colspan="2" align="center">
					<table>
						<tr>
							<td colspan="" align="right"><input type="submit" value="Submit" class="buttonc" /></td></form>
							<form action="PRINCE2-BCourses.asp?CourseId=<% = rqCourseId %>" method="post">
							<td colspan="" align="center"><input type="submit" value="Cancel" class="buttonc" /></td></form>
						</tr>
					</table>
				</td>
			</tr>
			<% Rs.movenext 
			loop
			%>
			
			
			</table>
		</td>
	</tr>	
	
</table>
</div>
</body>
</html>


<%
 End If
%>