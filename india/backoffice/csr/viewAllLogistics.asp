<%@ Language = "VBScript" %>
<% 'OPTION EXPLICIT %>
<% If Not  Session("UserId") = "" Then %>
<!--#include virtual="/india/connection.asp"-->
<%
'Written By : Bharath'
'Created Date: 26/08/2009'
'Last Updated Date: 26/08/2009'
'Description :'
'Purpose : Show all the logistic details'

'Declare The Variables'
Dim rqAction
Dim strStudyMat, strGifts
Dim objRs, objRs1
Dim arrAllStudyMat
Dim studyMatFirstRow, studyMatLastRow, studyMatNumRows
Dim arrAllGiftMat
Dim giftMatFirstRow, giftMatLastRow, giftMatNumRows
Dim rqStudyMatPage, rqGiftMatPage
Dim rqStudyMatRow, rqGiftMatRow
Dim rowStudyMatCounter, rowGiftMatCounter
Dim rqUser, rqType, rqStudyPage, rqGiftsPage, rqRow

rqUser = Request.QueryString("User")

Session("User") = rqUser
rqType = Request.QueryString("type")

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
Set objRs2 = Server.CreateObject("ADODB.Recordset")

rqAction = Request.QueryString("action")
rqStudyPage = Request.QueryString("studypage")
rqGiftsPage = Request.QueryString("giftspage")
rqRow = Request.QueryString("row")

If rqType = "StudyMat" Then 

strStudyMat = "SELECT * FROM ps_studymaterial WHERE added_by = '"&rqUser&"' ORDER BY id desc"

objRs.Open strStudyMat, Conn

	If Not objRs.EOF Then
		arrAllStudyMat = objRs.getrows
		studyMatFirstRow = 0
		studyMatLastRow = 9
		studyMatNumRows = Ubound(arrAllStudyMat,2)
		If studyMatLastRow > studyMatNumRows Then
		   studyMatLastRow = studyMatNumRows
		End If
		   
		Session("studyMatNumRows") = studyMatNumRows

	End If
	 
	objRs.Close
	  
	If rqStudyPage = "next" Then
	
	   studyMatNumRows = Session("studyMatNumRows")
	   
	   
	
	   studyMatFirstRow = rqRow + 1
	   studyMatLastRow = studyMatFirstRow + 9

	   If studyMatFirstRow >= studyMatNumRows Then
		  studyMatFirstRow = rqStudyMatRow + 1
		  studyMatLastRow = studyMatFirstRow + 9
	   
	   End If
	
	   If studyMatFirstRow < 0 Then
		  studyMatFirstRow = 0
	   End If
	
	   If studyMatLastRow > studyMatNumRows Then
		  studyMatLastRow = studyMatNumRows
	   End If
	
	End If
	
	If rqStudyPage = "previous" Then
	
	   studyMatNumRows = Ubound(arrAllStudyMat,2)
	
	   studyMatLastRow = rqRow - 1
	   studyMatFirstRow = studyMatLastRow - 9
	
	   If studyMatFirstRow =< 0 Then
		  studyMatFirstRow = 0
		  studyMatLastRow = studyMatFirstRow + 9
	   End If
	
	   If studyMatLastRow > studyMatNumRows Then
		  studyMatLastRow = studyMatNumRows
	   End If
	
	End If	

ElseIf rqType = "Gifts" Then

strGifts = "SELECT * FROM ps_gifts WHERE added_by = '"&Session("User")&"'  ORDER BY id desc"

objRs1.Open strGifts, Conn

	If Not objRs1.EOF Then
		arrAllGiftMat = objRs1.getrows
		giftMatFirstRow = 0
		giftMatLastRow = 9
		giftMatNumRows = Ubound(arrAllGiftMat,2)
		If giftMatLastRow > giftMatNumRows Then
		   giftMatLastRow = giftMatNumRows
		End If
	End If
	 
	objRs1.Close
	  
	If rqGiftsPage = "next" Then
	
	   giftMatNumRows = Ubound(arrAllGiftMat,2)
	
	   giftMatFirstRow = rqRow + 1
	   giftMatLastRow = giftMatFirstRow + 9
	
	   If giftMatFirstRow >= giftMatNumRows Then
		  giftMatFirstRow = rqGiftMatRow + 1
		  giftMatLastRow = giftMatFirstRow + 9
	   End If
	
	   If giftMatFirstRow < 0 Then
		  giftMatFirstRow = 0
	   End If
	
	   If giftMatLastRow > giftMatNumRows Then
		  giftMatLastRow = giftMatNumRows
	   End If
	
	End If
	
	If rqGiftsPage = "previous" Then
	
	   giftMatNumRows = Ubound(arrAllGiftMat,2)
	
	   giftMatLastRow = rqRow - 1
	   giftMatFirstRow = giftMatLastRow - 9
	
	   If giftMatFirstRow =< 0 Then
		  giftMatFirstRow = 0
		  giftMatLastRow = giftMatFirstRow + 9
	   End If
	
	   If giftMatLastRow > giftMatNumRows Then
		  giftMatLastRow = giftMatNumRows
	   End If
	
	End If	
	
ElseIf rqType = "Miscellaneous" Then

strMis = "SELECT * FROM ps_miscellaneous WHERE added_by = '"&Session("User")&"'  ORDER BY id desc"

objRs2.Open strMis, Conn

	If Not objRs2.EOF Then
		arrAllMis = objRs2.getrows
		misFirstRow = 0
		misLastRow = 9
		misNumRows = Ubound(arrAllMis,2)
		If misLastRow > misNumRows Then
		   misLastRow = misNumRows
		End If
	End If
	 
	objRs2.Close
	  
	If rqMisPage = "next" Then
	
	   misNumRows = Ubound(arrAllMis,2)
	
	   misFirstRow = rqRow + 1
	   misLastRow = misFirstRow + 9
	
	   If misFirstRow >= giftMatNumRows Then
		  misFirstRow = rqMisRow + 1
		  misLastRow = misFirstRow + 9
	   End If
	
	   If misFirstRow < 0 Then
		  misFirstRow = 0
	   End If
	
	   If misLastRow > misNumRows Then
		  misLastRow = misNumRows
	   End If
	
	End If
	
	If rqMisPage = "previous" Then
	
	   misNumRows = Ubound(arrAllMis,2)
	
	   misLastRow = rqRow - 1
	   misFirstRow = misLastRow - 9
	
	   If misFirstRow =< 0 Then
		  misFirstRow = 0
		  misLastRow = misFirstRow + 9
	   End If
	
	   If misLastRow > misNumRows Then
		  misLastRow = misNumRows
	   End If
	
	End If		
End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title>Logistics</title>
 <link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
</head>
<body><div id="htMap">
<table border="0" cellspacing="0" class="dbborder" width="1000px">
 <tr><td><ul><li><b><% = rqUser %></b></li></ul></td></tr>
 <% If rqType = "StudyMat" OR rqStudyPage <> "" Then %>
 <tr><td><ul><li><b>Study Material</b></li></ul></td></tr>
 <tr>
  <td valign="top">
   <table border="1" align="center" width="90%" cellspacing="0" cellpadding="2">
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
	</tr>
	<!--All Cities Puttin into Arraya And Dispalying-->
	<% If IsArray(arrAllStudyMat) Then
	   FOR rowStudyMatCounter = studyMatFirstRow to studyMatLastRow %>
	<tr>
	 <td><% = arrAllStudyMat(1,rowStudyMatCounter) %></td>
	 <td><% = arrAllStudyMat(2,rowStudyMatCounter) %></td>
	 <td><% = arrAllStudyMat(3,rowStudyMatCounter) %></td>
	 <td><% = arrAllStudyMat(4,rowStudyMatCounter) %></td>
	 <td><% = arrAllStudyMat(5,rowStudyMatCounter) %></td>
	 <td><% = arrAllStudyMat(6,rowStudyMatCounter) %></td>
	 <td><% = arrAllStudyMat(7,rowStudyMatCounter) %></td>
	 <td><% = arrAllStudyMat(8,rowStudyMatCounter) %></td>
	 <td><% = arrAllStudyMat(9,rowStudyMatCounter) %></td>
	 <td><% = arrAllStudyMat(10,rowStudyMatCounter) %></td>
	 <td><% = arrAllStudyMat(13,rowStudyMatCounter) %></td>
	 <td><% = arrAllStudyMat(14,rowStudyMatCounter) %></td>
	 <td><% = arrAllStudyMat(15,rowStudyMatCounter) %></td>
	 <td><% = arrAllStudyMat(16,rowStudyMatCounter) %></td>
	 <td><% = arrAllStudyMat(11,rowStudyMatCounter) %></td>
	 <td><% = arrAllStudyMat(12,rowStudyMatCounter) %></td>	 
	</tr>
	<% Next %>
	<tr>
	 <td colspan="17">
	   <% If Not studyMatFirstRow = 0 Then %>
		<a href="viewAllLogistics.asp?User=<% = rqUser %>&type=StudyMat&studypage=previous&row=<% = studyMatFirstRow %>"> &lt;&lt;Previous</a>
	   <% End If %>
	   <% = ((studyMatFirstRow + 1) & " - " & (studyMatLastRow + 1) & " of " & (studyMatNumRows + 1)) %>
	   <% If Not studyMatNumRows = studyMatLastRow Then %>
		<a href="viewAllLogistics.asp?User=<% = rqUser %>&type=StudyMat&studypage=next&row=<% = studyMatLastRow %>"> &gt;&gt;Next</a>
	   <% End If %>
	 </td>
	</tr>
	<% End If %>
  </table>
  </td>
 </tr>
 <% ElseIf rqType = "Gifts" Then %>
 <tr><td><ul><li><b>Gifts</b></li></ul></td></tr>
  <tr>
  <td valign="top">
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
	 <td bgcolor="#A7DBFB" align="center"><b>Post It Notes </b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Added By</b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Added Date</b></td>	 	  	 
	</tr>
	<!--All Cities Puttin into Arraya And Dispalying-->
	<% If IsArray(arrAllGiftMat) Then
	   FOR rowGiftMatCounter = giftMatFirstRow to giftMatLastRow %>
	<tr>
	 <td><% = arrAllGiftMat(1,rowGiftMatCounter) %></td>
	 <td><% = arrAllGiftMat(2,rowGiftMatCounter) %></td>
	 <td><% = arrAllGiftMat(3,rowGiftMatCounter) %></td>
	 <td><% = arrAllGiftMat(4,rowGiftMatCounter) %></td>
	 <td><% = arrAllGiftMat(5,rowGiftMatCounter) %></td>
	 <td><% = arrAllGiftMat(6,rowGiftMatCounter) %></td>
	 <td><% = arrAllGiftMat(7,rowGiftMatCounter) %></td>
	 <td><% = arrAllGiftMat(8,rowGiftMatCounter) %></td>
	 <td><% = arrAllGiftMat(9,rowGiftMatCounter) %></td>
	 <td><% = arrAllGiftMat(10,rowGiftMatCounter) %></td>
	 <td><% = arrAllGiftMat(13,rowGiftMatCounter) %></td>
	 <td><% = arrAllGiftMat(11,rowGiftMatCounter) %></td>
	 <td><% = arrAllGiftMat(12,rowGiftMatCounter) %></td>	 
	</tr>
	<% Next %>
	<tr>
	 <td colspan="17">
	   <% If Not giftMatFirstRow = 0 Then %>
		<a href="viewAllLogistics.asp?User=<% = rqUser %>&type=Gifts&giftspage=previous&row=<% = giftMatFirstRow %>"> &lt;&lt;Previous</a>
	   <% End If %>
	   <% = ((giftMatFirstRow + 1) & " - " & (giftMatLastRow + 1) & " of " & (giftMatNumRows + 1)) %>
	   <% If Not giftMatNumRows = giftMatLastRow Then %>
		<a href="viewAllLogistics.asp?User=<% = rqUser %>&type=Gifts&giftspage=next&row=<% = giftMatLastRow %>"> &gt;&gt;Next</a>
	   <% End If %>
	 </td>
	</tr>
	<% End If %>
  </table>  
 </td>
</tr>
 <% ElseIf rqType = "Miscellaneous" Then %>
 <tr><td><ul><li><b>Miscellaneous</b></li></ul></td></tr>
  <tr>
  <td valign="top">
   <table border="1" align="center" width="90%" cellspacing="0" cellpadding="2">
	<tr height="25">
	 <td bgcolor="#A7DBFB" align="center"><b>Visiting Cards </b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Trifold Brochure  </b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Onepage Flyer</b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Added By</b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Added Date</b></td>	 	  	 
	</tr>
	<!--All Cities Puttin into Arraya And Dispalying-->
	<% If IsArray(arrAllMis) Then
	   FOR rowMisCounter = misFirstRow to misLastRow %>
	<tr>
	 <td><% = arrAllMis(1,rowMisCounter) %></td>
	 <td><% = arrAllMis(2,rowMisCounter) %></td>
	 <td><% = arrAllMis(3,rowMisCounter) %></td>
	 <td><% = arrAllMis(4,rowMisCounter) %></td>
	 <td><% = arrAllMis(5,rowMisCounter) %></td>	 
	</tr>
	<% Next %>
	<tr>
	 <td colspan="17">
	   <% If Not misFirstRow = 0 Then %>
		<a href="viewAllLogistics.asp?User=<% = rqUser %>&type=Gifts&giftspage=previous&row=<% = misFirstRow %>"> &lt;&lt;Previous</a>
	   <% End If %>
	   <% = ((misFirstRow + 1) & " - " & (misLastRow + 1) & " of " & (misNumRows + 1)) %>
	   <% If Not giftMatNumRows = giftMatLastRow Then %>
		<a href="viewAllLogistics.asp?User=<% = rqUser %>&type=Gifts&giftspage=next&row=<% = misLastRow %>"> &gt;&gt;Next</a>
	   <% End If %>
	 </td>
	</tr>
	<% End If %>
  </table>  
 </td>
</tr>
<% End If %>
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