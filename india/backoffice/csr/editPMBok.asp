<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 'Written By : BbojaRaju'
 'Last UpaDated: 29/04/2008'
 'Description :'
 'Purpose : TDS Calculations'
%>
<%
   'If Session("UserId")  = "" Then
     'Response.Redirect("../login.asp")
   'Else
%>

<!--#include virtual="/india/connection.asp"-->

<%
  Dim id,name,course,amount,pmbok,pmbokPrice,rqId,rqcourseId,Sql
  
  rqId = request.QueryString("id")
  rqcourseId = request.QueryString("courseId")
  
  Sql = "select id,firstname,lastname,coursedetails,amount,pmbok,pmbokprice from ps_enrolledusers where id = '"& rqId &"'"
   
  Rs.open Sql,conn
 
 	
				
 
%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title>PMBOK Edit</title>
 <link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
 <script  language="javascript">
  function Form_Validate(theform)
  {
  	var pmprice = theform.pmbokPrice.value;
	 
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
				<td colspan="2" align="center"><b>Edit PMBOK Price</b></td>
			</tr>
			<form name="EditPMBOKPrice" action="editPMBokPrice.asp" method="post" onsubmit="return Form_Validate(this)">
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
				<td>Rs.<% = formatnumber(Rs("amount")) %></td>
			</tr>
			<tr bgcolor="#ffffff">
				<td>PMBOK (Y/N) : <input type="hidden" name="pmbok" value="<% =Rs("pmbok") %>" /></td>
				<td><% =Rs("pmbok") %></td>
			</tr>
			
			<tr bgcolor="#ffffff">
				<td>PMBOK Price : <input type="hidden" name="pmbokPriceOLd" value="<% =Rs("pmbokprice") %>" /></td>
				<td>Rs.<input type="text" name="pmbokPrice" maxlength="5" value="<% =Rs("pmbokprice") %>" /></td>
			</tr>
			 
			<tr bgcolor="#ffffff">
				<td colspan="2" align="center">
					<table>
						<tr>
							<td colspan="" align="right"><input type="submit" value="Submit" class="buttonc" /></td></form>
							<form action="courses.asp?CourseId=<% = rqCourseId %>" method="post">
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
 'End If
%>