<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<% If Not  Session("UserId") = "" Then %>
<!--#include virtual="/india/connection.asp"-->
<%
'Written By : Bharath'
'Created Date: 26/08/2009'
'Last Updated Date: 26/08/2009'
'Description :'
'Purpose : Show the logistic details'

'Declare The Variables'
Dim rqAction
Dim strStudyMat, strGifts, strUsers, strMis
Dim objRs, objRs1, objRs2, User
Dim allUsers, usersNumRows, usersFirstRoww, usersLastRow,rowUsersCounter
Dim bgColor

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
Set objRs2 = Server.CreateObject("ADODB.Recordset")

rqAction = Request.QueryString("action")

strUsers = "SELECT distinct(added_by) FROM ps_studymaterial"

objRs2.Open strUsers, Conn

If Not objRs2.EOF Then
	allUsers = objRs2.getrows
	usersNumRows = Ubound(allUsers,2)
	usersFirstRoww = 0
	usersLastRow = usersNumRows
End If

objRs2.Close


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
<title>Logistics</title>
<link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript">
<!--
function popitup(url) {
	newwindow=window.open(url,'name','toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=1,minimizable=0,resizable=0,height=600,width=950,top=250,left=400');
	if (window.focus) {newwindow.focus()}
	return false;
}
//-->
</script>
</head>
<body>
<div id="htMap">
  <table border="1" height="550" cellspacing="0" class="dbborder" width="1000px">
    <tr>
      <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300">
          <% =Session("country") %>
          </span> PMstudy Back Office</font></div>
    </tr>
    <tr>
      <td width="100px" valign="top" rowspan="22"><!--#include file="leftMenu.html"-->
      </td>
    </tr>
    <tr height="490">
      <td valign="top"><table border="1" align="center" width="90%" cellspacing="0" cellpadding="2">
          <tr height="25">
            <td bgcolor="#A7DBFB" align="center"><b>Workbook</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Process Chart </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Certificate Folder</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Blank Process sheet</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>PMP Chapter Test</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>PMP Final Test</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>PMP Certificate</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>CAPM Chapter Test</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>CAPM Final Test</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>CAPM Certificate</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Day 3 Testbook </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Day 4 Evaluation Test</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Guidelines for PMP exam</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Feedback forms</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Added By</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Added Date</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>View All</b></td>
          </tr>
          <!--All Cities Puttin into Arraya And Dispalying-->
          <% 
	   If IsArray(allUsers) Then
	   FOR rowUsersCounter = usersFirstRoww to usersLastRow
	   
	   User = allUsers(0,rowUsersCounter)
	   
	   
	   strStudyMat = "SELECT top 1 * FROM ps_studymaterial WHERE added_by = '"&User&"' ORDER BY id desc"
		
	   objRs.Open strStudyMat, Conn	
	   
	   Do Until objRs.EOF %>
          <tr>
            <% If objRs("workbook") <= 15 Then 
	 		bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
	 	End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("workbook") %>
              </b></td>
            <% If objRs("processchart") <= 15 Then 
	 		bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
	 	End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("processchart") %>
              </b></td>
            <% If objRs("certfolder") <= 15 Then 
	 		bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
	 	End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("certfolder") %>
              </b></td>
            <% If objRs("blankprocesssheet") <= 15 Then 
	 		bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
	 	End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("blankprocesssheet") %>
              </b></td>
            <% If objRs("pmp_chaptertest") <= 15 Then 
	 		bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
	 	End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("pmp_chaptertest") %>
              </b></td>
            <% If objRs("pmp_finaltest") <= 15 Then 
	 		bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
	 	End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("pmp_finaltest") %>
              </b></td>
            <% If objRs("pmp_certificate") <= 15 Then 
	 		bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
	 	End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("pmp_certificate") %>
              </b></td>
            <% If objRs("capm_chaptertest") <= 15 Then 
	 		bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
	 	End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("capm_chaptertest") %>
              </b></td>
            <% If objRs("capm_finaltest") <= 15 Then 
	 		bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
	 	End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("capm_finaltest") %>
              </b></td>
            <% If objRs("capm_certificate") <= 15 Then 
	 		bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
	 	End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("capm_certificate") %>
              </b></td>
            <% If objRs("capm_certificate") <= 15 Then 
	 		bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
	 	End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("day3_test") %>
              </b></td>
            <% If objRs("capm_certificate") <= 15 Then 
	 		bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
	 	End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("day4_eval") %>
              </b></td>
            <% If objRs("capm_certificate") <= 15 Then 
	 		bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
	 	End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("guidelinePMP") %>
              </b></td>
            <% If objRs("capm_certificate") <= 15 Then 
	 		bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
	 	End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("feedbackForm") %>
              </b></td>
            <td><% = objRs("added_by") %></td>
            <td><% = objRs("added_date") %></td>
            <td><a href="viewAllLogistcs.asp?User=<% = User %>&type=StudyMat" onClick="return popitup('viewAllLogistics.asp?User=<% = User %>&type=StudyMat')">View All</a></td>
          </tr>
          <% objRs.Movenext 
	   Loop 
	   objRs.Close 
	   
	   Next 
	   End If
	 %>
        </table>
        <br />
        <br />
        <table border="1" align="center" width="90%" cellspacing="0" cellpadding="2">
          <tr height="25">
            <td bgcolor="#A7DBFB" align="center"><b>4 in 1 Pens </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Highlighter Neon Yellow </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Highlighter Neon Green</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Highlighter Neon Pink </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Pencil - Z- Grip </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Quick point Pen Holder </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Robot Series Calculator </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Backpack Travel </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Cap</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Stress Ball </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Post It Notes</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Added By</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Added Date</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>View All</b></td>
          </tr>
          <!--All Cities Puttin into Arraya And Dispalying-->
          <% 
	   If IsArray(allUsers) Then
	   FOR rowUsersCounter = usersFirstRoww to usersLastRow
	   
	   User = allUsers(0,rowUsersCounter)
	
		strGifts = "SELECT top 1 *  FROM ps_gifts WHERE added_by = '"&User&"' ORDER BY added_by, id desc"

		objRs1.Open strGifts, Conn	

		Do Until objRs1.EOF %>
          <tr>
            <% If objRs1("pen") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("pen") %>
              </b></td>
            <% If objRs1("highlighter_yellow") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("highlighter_yellow") %>
              </b></td>
            <% If objRs1("highlighter_green") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("highlighter_green") %>
              </b></td>
            <% If objRs1("highlighter_pink") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("highlighter_pink") %>
              </b></td>
            <% If objRs1("pencil") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("pencil") %>
              </b></td>
            <% If objRs1("pen_holder") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("pen_holder") %>
              </b></td>
            <% If objRs1("calculator") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("calculator") %>
              </b></td>
            <% If objRs1("backpack") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("backpack") %>
              </b></td>
            <% If objRs1("cap") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("cap") %>
              </b></td>
            <% If objRs1("stressball") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("stressball") %>
              </b></td>
            <% If objRs1("postit_notes") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("postit_notes") %>
              </b></td>
            <td><% = objRs1("added_by") %></td>
            <td><% = objRs1("added_date") %></td>
            <td><a href="viewAllLogistcs.asp?User=<% = User %>&type=Gifts" onClick="return popitup('viewAllLogistics.asp?User=<% = User %>&type=Gifts')">View All</a></td>
          </tr>
          <% objRs1.Movenext 
	   Loop 
	   objRs1.Close 
	   
	   Next 
	   End If   
	   %>
        </table>
        <br />
        <br />
        <table border="1" align="center" width="90%" cellspacing="0" cellpadding="2">
          <tr height="25">
            <td bgcolor="#A7DBFB" align="center"><b>Visiting Cards </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Trifold Brochure </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Onepage Flyer</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Added By</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Added Date</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>View All</b></td>
          </tr>
          <!--All Cities Puttin into Arraya And Dispalying-->
          <% 
	   If IsArray(allUsers) Then
	   FOR rowUsersCounter = usersFirstRoww to usersLastRow
	   
	   User = allUsers(0,rowUsersCounter)
	
		strMis = "SELECT top 1 *  FROM ps_miscellaneous WHERE added_by = '"&User&"' ORDER BY added_by, id desc"

		objRs2.Open strMis, Conn	

		Do Until objRs2.EOF %>
          <tr>
            <% If objRs2("visiting_cards") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs2("visiting_cards") %>
              </b></td>
            <% If objRs2("trifold") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs2("trifold") %>
              </b></td>
            <% If objRs2("onepage_flyer") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs2("onepage_flyer") %>
              </b></td>
            <td><% = objRs2("added_by") %></td>
            <td><% = objRs2("added_date") %></td>
            <td><a href="viewAllLogistcs.asp?User=<% = User %>&type=Gifts" onClick="return popitup('viewAllLogistics.asp?User=<% = User %>&type=Miscellaneous')">View All</a></td>
          </tr>
          <% objRs2.Movenext 
	   Loop 
	   objRs2.Close 
	   
	   Next 
	   End If   
	   %>
        </table></td>
    </tr>
  </table>
</div>
</body>
</html>
<%
 Conn.Close
 Set Conn = Nothing
 Else
 Response.Redirect("../login.asp")
 End If
%>
