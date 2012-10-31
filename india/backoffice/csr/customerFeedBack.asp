<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
 'Written By : Bharath'
 'Last UpaDated: 01/11/2007'
 'Description :'
 'Purpose : Customer FeedBack Mail Page'
'======================================================='
%>
<% If not  Session("UserId") = "" Then %>
<!--#include virtual="/india/connection.asp"-->
<%
'======================================================='
 'Declare The Variables'
'======================================================='
Dim strQuery
Dim custFeedBackId
Dim arrAllQueries
Dim firstRow
Dim lastRow
Dim numRows
Dim rqRow
Dim rqPage
Dim rowcounter

 rqPage = Request.QueryString("page")
 rqRow = Request.QueryString("row")

strQuery = "SELECT * FROM ITIL_custfeedback WHERE country = '"& session("country") & "' ORDER BY querydate"

Rs.Open strQuery,Conn

   If Not Rs.EOF Then
     arrAllQueries = Rs.getrows
     Session("arrAllQueries") = arrAllQueries
     firstRow = 0
     lastRow = 9
     numRows = Ubound(arrAllQueries,2)
     If lastRow > numRows Then
        lastRow = numRows
     End If
   End If
 If rqPage = "next" Then

    arrAllQueries = Session("arrAllQueries")
    numRows = Ubound(arrAllQueries,2)

    firstRow = rqRow + 1
    lastRow = firstRow + 9

    If firstRow >= numRows Then
       firstRow = rqRow + 1
       lastRow = firstRow + 9
    End If

    If firstRow < 0 Then
       firstRow = 0
    End If

    If lastRow > numRows Then
       lastRow = numRows
    End If

 End If

 If rqPage = "previous" Then

    arrAllQueries = Session("arrAllQueries")
    numRows = Ubound(arrAllQueries,2)

    lastRow = rqRow - 1
    firstRow = lastRow - 9

    If firstRow =< 0 Then
       firstRow = 0
       lastRow = firstRow + 9
    End If

    If lastRow > numRows Then
       lastRow = numRows
    End If

End If


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title>CustomerFeedBack</title>
 <link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
</head>
<body><div id="htMap">
<table border="1" height="550" cellspacing="0" class="dbborder" width="1000px">
 <tr>
   <td colspan="3" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% =Session("country") %></span> ITILstudy Back Office</font></div></td>
 </tr>
 <tr>
  <td width="100px" valign="top" rowspan="22">
    <!--#include file="leftMenu.html"-->
  </td>
 </tr>
 <tr height="490">
  <td valign="top">
   <table border="1"  cellspacing="0" cellpadding="3" width="100%">
     <tr height="25px">
       <td bgcolor="#A7DBFB" align="center"><b>Customer Name</b></td>
       <td bgcolor="#A7DBFB" align="center"><b>Customer Email ID</b></td>
       <td bgcolor="#A7DBFB" align="center"><b>Query</b></td>
       <td bgcolor="#A7DBFB" align="center"><b>Query Date</b></td>
       <td bgcolor="#A7DBFB" align="center"><b>Reply</b></td>
       <td bgcolor="#A7DBFB" align="center"><b>ReplyByDate</b></td>
	 </tr>
     <% If IsArray(arrAllQueries) Then
        FOR rowcounter = firstrow to lastrow %>
     <form action="customerFeedBackMail.asp" method="post">
	 <tr>
      <input type="hidden" name="feedbackid" value="<% = arrAllQueries(0,rowcounter) %>" />
      <td><% = arrAllQueries(1,rowcounter) %></td>
	  <td><% = arrAllQueries(2,rowcounter) %></td>
	  <td><% = arrAllQueries(3,rowcounter) %></td>
	  <td><% = FormatDateTime(arrAllQueries(4,rowcounter),1) %></td>
	  <td>
	  <% If arrAllQueries(5,rowcounter) <> "" Then %>
	  <% = arrAllQueries(5,rowcounter) %>
	  <% Else %>
      <input type="submit" name="reply" value="Reply" class="buttonc" />
  <!-- <a href="javascript:void(0)" onClick="window.open('custFeedBackMail.asp?feedbackid=<% = custFeedBackId %>')">Reply</a>-->
	  <% End If %>
	  <td>
	  </form>
	  <% If arrAllQueries(5,rowcounter) <> "" Then %>
	  <% = FormatDateTime(arrAllQueries(7,rowcounter),1) %> By <% = arrAllQueries(6,rowcounter) %>
	  <% End If %>
	  </td>
	 </tr>
     <% Next %>
     <tr>
       <td colspan="8">
  	    <% If Not firstRow = 0 Then %>
        <a href="customerFeedBack.asp?page=previous&row=<% = firstRow %>"> &lt;&lt;Previous</a>
        <% End If %>
        <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
        <% If Not numRows = lastRow Then %>
        <a href="customerFeedBack.asp?page=next&row=<% = lastRow %>"> &gt;&gt;Next</a>
        <% End If %>
       </td>
     </tr>
	 <% End If %>
    </table>
  </td>
 </tr>
</table>
</div>
</body>
</html>
<%
 Else
 Response.Redirect("../login.asp")
 End If
%>