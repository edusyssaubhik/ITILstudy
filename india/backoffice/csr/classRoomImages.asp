 <%@ Language = "VBScript" %>
 <%
'======================================================='
 'Written By : Bharath '
 'Last UpaDated: 21/04/2008'
 'Description : Displaying Class Room Images'
'======================================================='
%>
<!--#include virtual="/india/connection.asp"-->
<%
'***********************Images****************************
Dim rqCountry

rqCountry = request.QueryString("country")
Session("countryPart") = rqCountry

	Sql = "select  image1,image2,city,startsession,endsession,description1,description2,id  from ps_images where country = '"& Session("countryPart") &"' order by city,startsession desc"

	Rs.open Sql,conn
	
If Not Rs.EOF Then
   arrAllRecords = Rs.getrows
   Session("arrAllRecords") = arrAllRecords
   numRows = Ubound(arrAllRecords,2)
   firstRow = 0
   lastRow = numRows
End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Previous Class Room Sessions</title>
<link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
<!-- Begin
function popUp(URL) {
day = new Date();
id = day.getTime();
eval("page" + id + " = window.open(URL, '" + id + "', 'toolbars=0,left=1,top=1,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=1,width=600,height=500');");
}
// End -->
</script>
</head>
<body>
<table width="800px" height="163" border="0" align="center" cellpadding="5" cellspacing="0">
 <tr class="h3">
 	<td colspan="2" align="center" >Previous Class Room Sessions<div><hr /></div></td>
 </tr>
 <%  If IsArray(arrAllRecords) Then
     For rowcounter = firstRow to lastRow %>
 <tr>
	<td colspan="2" class="citydiv"><% = arrAllRecords(2,rowcounter) %><div><hr /></div></td>
 </tr>
 <tr>
	<td colspan="2" ><label class="titlediv">Session : </label><label class="text"><% = FormatDateTime(arrAllRecords(3,rowcounter),1) %> to <% = FormatDateTime(arrAllRecords(4,rowcounter),1) %></label></td>
 </tr>
 <tr>
   <td colspan="2">			
	<a href="javascript:popUp('./participants.asp?ID=<% = arrAllRecords(7,rowCounter)%>')" ><span class="paticipantsdiv">Participants of this Session</span></a>
   </td>
 </tr>
 <tr>		
   <td width="200px"><a href ="../../classRoomImages/<%=arrAllRecords(0,rowCounter)%>" target="_blank"  ><img width="250px" src="../../classRoomImages/<% = arrAllRecords(0,rowCounter) %>" border="0"/> </a><br /><br />
   </td>
   <td width="200px"><a href ="../../classRoomImages/<%=arrAllRecords(1,rowCounter)%>" target="_blank"  ><img width="250px" src="../../classRoomImages/<% = arrAllRecords(1,rowCounter) %>" border="0"/> </a><br /><br />
   </td>
  </tr>
  <tr>
	<td><label class="descdiv">Description : </label><label class="text"><% = arrAllRecords(5,rowCounter) %></label></td>
	<td><label class="descdiv">Description : </label><label class="text"><% = arrAllRecords(6,rowCounter) %></label></td>	
  </tr>
  <tr><td colspan="2"><hr /></td></tr>
  <% Next
     End If %>	
</table>
</body>
</html>
 