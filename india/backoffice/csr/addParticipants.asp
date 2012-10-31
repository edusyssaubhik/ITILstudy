<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
 'Written By : Bharath'
 'Last UpaDated: 01/11/2007'
 'Description :'
 'Purpose : Add/Edit/Delete Participants Page'
'======================================================='
%>
<% If not  Session("UserId") = "" Then %>
<!--#include virtual="/india/connection.asp"-->
<%
'======================================================='
 'Declare The Variables'
'======================================================='
Dim Sql,Sql1,firstRow,lastRow,arrAllSessions,numRows
Dim Rs1
Dim rqType,rowCounter,ID,rqID,parID,rqParID,rqCity

Set Rs1 = Server.CreateObject("ADODB.Recordset")
Sql = "SELECT id,city,startsession,endsession FROM ITIL_images WHERE country = '" & session("country") & "' order by city.startsession"

Rs.Open Sql,Conn

If Not Rs.EOF Then
  arrAllSessions = Rs.getrows
  firstRow = 0
  lastRow = 9
  numRows = UBound(arrAllSessions,2)
  If lastRow > numRows Then
     lastRow = numRows
  End If
End If

rqType  =  Request.QueryString("type")
rqID    =  Request.QueryString("ID")
rqCity  =  Request.QueryString("City")

If rqType = "add" Then
   
   Sql1 = "SELECT id FROM ITIL_images"
   
   Rs1.Open Sql1,Conn
   
End If

If rqType = "view/edit" Then
  
  Sql1 = "SELECT * FROM ITIL_participants WHERE sessionid = '" & rqID & "'"
  
  Rs1.Open Sql1,Conn
  
End If

rqParID = Request.QueryString("parID")

If rqType = "edit" Then

   Sql1 = "SELECT * FROM ITIL_participants WHERE id = '"& rqParID &"'"
   
   Rs1.Open Sql1,Conn
   
End If
   

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
<title>Participants</title>
<link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
<script language="javascript">
function Form_Validator(theform)
{

 if (theform.participantname.value == "")
 {
    alert("Please Enter the Participantname");
    theform.participantname.focus();
    return(false);
 }
 
 if (theform.companyname.value == "")
 {
   alert("Please Enter the Companyname");
   theform.companyname.focus();
   return(false);
 }

}
</script>
</head>
<body><div id="htMap">
<table border="1" height="550" cellspacing="0" class="dbborder" width="1000px">
 <tr>
   <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% =Session("country") %></span> ITILstudy Back Office</font></div>
 </tr>
 <tr>
  <td width="100px" valign="top" rowspan="22">
    <!--#include file="leftMenu.html"-->
  </td>
 </tr>
 <% If rqType = "add" Then %>
  <tr>
   <td>
     <form action="addEditDeleteParticipants.asp" method="post" onsubmit="return Form_Validator(this)">
     <table border="0" align="center" cellpadding="5" cellspacing="2" bgcolor="#e7f2f7">
	 <input type="hidden" name="ID" value="<% = rqID %>" />
	  <tr bgcolor="#FFFFFF">
       <td align="center" colspan="4" height="40" class="h3">Add Participant</td>
      </tr>
	  <tr bgcolor="#FFFFFF">
	   <td>City</td><td>&nbsp;&nbsp;&nbsp;<% = rqCity %></td>
	  </tr>
	  <tr bgcolor="#FFFFFF">
	    <td>Name : </td><td><input type="text" name="participantname" /></td>
	  </tr>
	  <tr bgcolor="#FFFFFF">
		<td>Company : </td><td><input type="text" name="companyname" /></td>
	  </tr>
      <tr bgcolor="#FFFFFF">
       <td colspan="2">&nbsp;</td>
      </tr>	  
      <tr bgcolor="#FFFFFF">
       <td colspan="2" align="right">
         <input type="submit" name="addParticipant" value="Add Participant" class="buttonc">
       </td>
      </tr>	  
	 </table>
	 </form>
   </td>
 </tr>
 <% End If %>
 <% If rqType = "edit" Then%>
 <tr>
   <td>
     <form action="addEditDeleteParticipants.asp" method="post" onsubmit="return Form_Validator(this)">
     <table border="0" align="center" cellpadding="5" cellspacing="2" bgcolor="#e7f2f7">
	  <% Do Until Rs1.EOF %>
	  <tr bgcolor="#FFFFFF">
       <td align="center" colspan="4" height="40" class="h3">Edit Participant</td>
      </tr>
	  <tr bgcolor="#FFFFFF">
	   <td>Country : </td><td>&nbsp;&nbsp;&nbsp;India</td>
	  </tr>
	  <tr bgcolor="#FFFFFF">
	   <td>City</td><td>&nbsp;&nbsp;&nbsp;Bangalore</td>
	  </tr>
	  <input type="hidden" name="ID" value="<% = rqID %>"  />
	  <input type="hidden" name="parID" value="<% = Rs1("id") %>"  />
	  <tr bgcolor="#FFFFFF">
	    <td>Name : </td><td><input type="text" name="participantname" value="<% = Rs1("name")%>" /></td>
	  </tr>
	  <tr bgcolor="#FFFFFF">
		<td>Company : </td><td><input type="text" name="companyname" value="<% = Rs1("company")%>" /></td>
	  </tr>
	  <% Rs1.Movenext
	     Loop %>
      <tr bgcolor="#FFFFFF">
       <td colspan="2">&nbsp;</td>
      </tr>	  
      <tr bgcolor="#FFFFFF">
       <td align="right">
         <input type="submit" name="eidtParticipant" value="Edit Participant" class="buttonc">
       </td>
	   </form>
	   <form action="addParticipants.asp?type=view/edit&ID=<% = rqID %>" method="post">
	    <td>
		 <input type="submit" name="cancel" value="Cancel" class="buttonc" />
		</td>
	   </form>
      </tr>	  
	 </table>
   </td>  
 </tr>
 <% End If %>
 <% If rqType = "view/edit" Then %>
 <tr>
  <td>
   <table border="1" align="center" width="500px" cellspacing="0" cellpadding="3">
     <tr>
	  <td align="center" bgcolor="#A7DBFB">Name</td>
	  <td align="center" bgcolor="#A7DBFB">Company</td>
	  <td align="center" bgcolor="#A7DBFB">Edit</td>
	  <td align="center" bgcolor="#A7DBFB">Delete</td>
	 </tr>
	 <% Do Until Rs1.EOF %>
	 <tr>
	  <% parID = Rs1("id") %>
	  <td><% = Rs1("name")%></td>
	  <td><% = Rs1("company")%></td>
	  <td align="center"><a href="addParticipants.asp?type=edit&ID=<% = rqID %>&ParID=<% = parID %>">Edit</a></td>
	  <td align="center"><a href="addEditDeleteParticipants.asp?type=delete&ID=<% = rqID %>&parID=<% = parID %>">Delete</a></td>
	 </tr>
	 <% Rs1.Movenext
	    Loop %>
   </table>
  </td>
 </tr>
 <% End If %>
 <tr>
  <td valign="top">
    <table border="1" align="center" width="500px" cellspacing="0" cellpadding="3">
	 <tr height="25px">
   	  <td width="" align="center" bgcolor="#A7DBFB">City</td>
	  <td align="center" bgcolor="#A7DBFB">Session</td>
	  <td align="center" bgcolor="#A7DBFB">Add</td>
	  <td align="center" bgcolor="#A7DBFB">View/Edit</td>
	 </tr>
	 <% If IsArray(arrAllSessions) Then 
    	For rowCounter = firstRow to lastRow %>
	 <tr>
	  <% ID = arrAllSessions(0,rowCounter) %>
	  <td><% = arrAllSessions(1,rowCounter)%></td>
	  <td><% = FormatDateTime(arrAllSessions(2,rowCounter),1) %> to <% = FormatDateTime(arrAllSessions(3,rowCounter),1) %></td>
	  <td align="center"><a href="addParticipants.asp?type=add&City=<% = arrAllSessions(1,rowCounter) %>&ID=<% = ID %>">Add</a></td>
	  <td align="center"><a href="addParticipants.asp?type=view/edit&ID=<% = ID %>">View/Edit</a></td>
	 </tr>
     <% Next
      End If %>
	</table>
   </td>
  </tr>
</table>
</div>
</body>
</html>
<%
 Rs.Close
 Set Rs = Nothing
 Conn.Close
 Set Conn = Nothing
 Else
 Response.Redirect("../login.asp")
 End If
%>