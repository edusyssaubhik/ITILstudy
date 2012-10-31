<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
If Session("USBUserId") = "" Then
	Response.Redirect("login.asp")
Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================'
'Written By : Priyanka'
'Created Date: 14/07/2010'
'Description :'
'Purpose : Show all the calls received details'
'======================================================'

'Declare The Variables'
Dim strCallDet, strUSstate, strCanadastate
Dim objRs, objRsUSState, objRsCID, objRsCanadaState
Dim arrAllCallDet
Dim firstRow, lastRow, numRows
Dim rqPage, rqRow, rowcounter
Dim CallID, rqPaymentNotRec
Dim arrAllPayNotRec
Dim payNotRecFirstRow, payNotRecLastRow, payNotRecNumRows
Dim rqAction, rqPayNotRecRow, payNotRecRowcounter
Dim enrollId
Dim strPayment1, strPayment2, strPayment3, strPayment4
Dim disp, strPayNotRec
Dim rqState, rqName, searchName, searchLastName, searchstate
Dim rqLastName, strCourseIds
Dim strPayNotRec1, strPayNotRec2, strPayNotRec3, strPayNotRec4


Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRsStates = Server.CreateObject("ADODB.Recordset")
Set objRsUSState = Server.CreateObject("ADODB.Recordset")
Set  objRsCanadaState = Server.CreateObject("ADODB.Recordset")
Set objRsCID = Server.CreateObject("ADODB.Recordset")



'Displaying all the Call Received and Enrolled Users code start here'

rqPage = Request.QueryString("page")
rqRow = Request.QueryString("row")
rqAction = Request.QueryString("action")

'Retrive the values from serach option in this page'
If Request.Form("state") <> "" Then
	rqState = Request.Form("state")
Else
	rqState = Request.QueryString("state")
End If

If Request.Form("name") <> "" Then
	rqName = Request.Form("name")
Else
	rqName = Request.QueryString("name")
End If

If Request.Form("lastname") <> "" Then
	rqLastName = Request.Form("lastname")
Else
	rqLastName = Request.QueryString("lastname")
End If

searchName = rqName & "%"

searchLastName = rqLastName & "%"

searchstate = rqState & "%"

strUSState = "SELECT Distinct(state) FROM sixsigma_us_states WHERE country = 'US' ORDER BY state"

objRsUSState.Open strUSState,ConnObj

strCanadaState = "SELECT Distinct(state) FROM sixsigma_us_states WHERE country = 'Canada' ORDER BY state"

objRsCanadaState.Open strCanadaState,ConnObj

strState = "SELECT state FROM sixsigma_us_states WHERE (fac1_emailid = '"& Session("USBUserId") &"' OR fac2_emailid = '"& Session("USBUserId") &"')"

objRsStates.Open strState, ConnObj

rec_count = 0

If Not objRsStates.EOF Then

Do Until objRsStates.EOF

	states = objRsStates("state")

	If rec_count > 0 Then

		allStates = allStates & ","

	End If

	allStates = allStates & "'" & states & "'"
	rec_count = rec_count + 1

objRsStates.Movenext
Loop
objRsStates.Close
End If

If rqAction = "noFollowUp" Then

	'If user select state in the state dropdown of No Follow Up calls that will come here'

	If rqState <> "" Then

	'Retrive the not follow up calls details based on state search'
	strCallDet = "SELECT callid, calls_state, callername, phoneno, emailid, question, call_status, addeddate FROM sixsigma_callsreceived WHERE status = '1'  And calls_state = '"&rqState&"' And (call_status Is Null OR call_status <> 'Dummy') ORDER BY callid desc"

	'If user entered name in the serach of No Follow Up calls that will come here'
	ElseIf rqName <> "" Then

	'Retrive the not follow up calls details based on lastname'
	strCallDet = "SELECT callid, calls_state, callername, phoneno, emailid, question, call_status, addeddate FROM sixsigma_callsreceived WHERE status = '1' And callername like '"&searchName&"'  And (call_status Is Null OR call_status <> 'Dummy') ORDER BY callid desc"

	'If user as a admin, i am showing all the states'
	ElseIf Session("TypeOfUser") = "Admin" Then

	'Retrive the not follow up calls details for all the states (ADMIN)'
	strCallDet = "SELECT callid, calls_state, callername, phoneno, emailid, question, call_status, addeddate FROM sixsigma_callsreceived WHERE status = '1'  ORDER BY callid desc"

	ElseIf Session("City1") <> "All" And rqState = "" Then

	'Retrive the not follow up calls details based on city'
	strCallDet = "SELECT callid, calls_state, callername, phoneno, emailid, question, call_status, addeddate FROM sixsigma_callsreceived WHERE status = '1' And  (calls_state in ("& allStates &") OR addedby = '"& Session("USBUserId") &"') And (call_status Is Null OR call_status <> 'Dummy')  ORDER BY callid desc"

	End If

ElseIf rqAction = "followUp" Then

	'If user select state in the state dropdown of Follow Up calls that will come here'
	If rqState <> "" Then

	'Retrive the not follow up calls details based on state search'
	strCallDet = "SELECT callid, calls_state, callername, phoneno, emailid, question, call_status, addeddate FROM sixsigma_callsreceived WHERE status = '2' And calls_state = '"&rqState&"' And (call_status Is Null OR call_status <> 'Dummy') ORDER BY callid desc"

	'If user entered name in the serach of Follow Up calls that will come here'
	ElseIf rqName <> "" Then

	'Retrive the follow up calls details based on lastname'
	strCallDet = "SELECT callid, calls_state, callername, phoneno, emailid, question, call_status, addeddate FROM sixsigma_callsreceived WHERE status = '2' And callername like '"&searchName&"' And (call_status Is Null OR call_status <> 'Dummy') ORDER BY callid desc"

	'If user as a admin, i am showing all the cities'
	ElseIf Session("TypeOfUser") = "Admin" Then

	'Retrive the follow up calls details for all the cities (ADMIN)'
	strCallDet = "SELECT callid, calls_state, callername, phoneno, emailid, question, call_status, addeddate FROM sixsigma_callsreceived WHERE status = '2' ORDER BY callid desc"

	ElseIf Session("City1") <> "All" And rqState = "" Then

	'Retrive the follow up calls details based on city'
	strCallDet = "SELECT callid, calls_state, callername, phoneno, emailid, question, call_status, addeddate FROM sixsigma_callsreceived WHERE status = '2' And  (calls_state in ("& allStates &") OR addedby = '"& Session("USBUserId") &"') And (call_status Is Null OR call_status <> 'Dummy')  ORDER BY callid desc"


	End If

ElseIf rqAction = "closed" Then

	'If user select state in the state dropdown of Closed calls that will come here'
	If rqState <> "" Then

	'Retrive the closed calls details based on state search'
	strCallDet = "SELECT callid, calls_state, callername, phoneno, emailid, question, call_status, addeddate FROM sixsigma_callsreceived WHERE status = '3' And calls_state = '"&rqState&"' And (call_status Is Null OR call_status <> 'Dummy') ORDER BY callid desc"

	'If user entered name in the serach of Closed calls that will come here'
	ElseIf rqName <> "" Then

	'Retrive the Closed calls details based on lastname'
	strCallDet = "SELECT callid, calls_state, callername, phoneno, emailid, question, call_status, addeddate FROM sixsigma_callsreceived WHERE status = '3' And callername like '"&searchName&"' And (call_status Is Null OR call_status <> 'Dummy') ORDER BY callid desc"

	'If user as a admin, i am showing all the cities'

	ElseIf Session("TypeOfUser") = "Admin" Then

	'Retrive the Closed calls details for all the cities (ADMIN)'
	strCallDet = "SELECT callid, calls_state, callername, phoneno, emailid, question, call_status, addeddate FROM sixsigma_callsreceived WHERE status = '3' ORDER BY callid desc"

	ElseIf Session("City1") <> "All" And rqState = "" Then

	'Retrive the Closed calls details based on state'
	strCallDet = "SELECT callid, calls_state, callername, phoneno, emailid, question, call_status, addeddate FROM sixsigma_callsreceived WHERE status = '3' And  (calls_state in ("& allStates &") OR addedby = '"& Session("USBUserId") &"') And (call_status Is Null OR call_status <> 'Dummy')  ORDER BY callid desc"
	End If

End If

objRs.Open strCallDet, ConnObj

If Not objRs.EOF Then
	arrAllCallDet = objRs.getrows
	firstRow = 0
	lastRow = 9
	numRows = Ubound(arrAllCallDet,2)
	If lastRow > numRows Then
	   lastRow = numRows
	End If
End If

objRs.Close

If rqPage = "next" Then

   numRows = Ubound(arrAllCallDet,2)

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

   numRows = Ubound(arrAllCallDet,2)

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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>6sigma Marketing B2C</title>
<!-- CSS -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<!--[if IE 6]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie6.css" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie7.css" /><![endif]-->
<!-- JavaScripts-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jNice.js"></script>
<script language="javascript">
function Form_Validator(theform)
{

	if (theform.comment.value == "")
	{
	 alert("Please enter the comment");
	 theform.comment.focus();
	 return (false);
	}

}

function Form_Validator1(theform)
{

	if (theform.status.value == "")
	{
	 alert("Please select the status");
	 theform.status.focus();
	 return (false);
	}

}

</script>
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
      <h2><a href="home.asp">Home</a> &raquo; <a href="6sigmamarketingB2C.asp?action=noFollowUp" class="active">6sigma Marketing B2C</a> &raquo;
        <% If rqAction = "noFollowUp" Then %>
        Calls to be made
        <% ElseIf rqAction = "followUp" Then %>
        Calls to be followed up
        <% ElseIf rqAction = "closed" Then %>
        Closed calls
        <% End If %>
      </h2>
      <div>&nbsp;</div>
      <div style="margin-left:211px;">
        <table width="100%">
          <tr><br />
            <td width="17%"><form action="new6sigmaCall.asp" method="post">
                <input type="submit" value="Add New B2C Prospect" />
              </form></td>
          </tr>
        </table>
      </div>
      <div>&nbsp;</div>
      <div id="topbar" style="margin-left:31px;">
        <ul class="topNav">
          <li><a href="6sigmamarketingB2C.asp?action=noFollowUp">Calls to be made</a></li>
        </ul>
      </div>
      <div id="topbar" style="margin-left:- 30px;">
        <ul class="topNav">
          <li><a href="6sigmamarketingB2C.asp?action=followUp">Calls to be followed up</a></li>
        </ul>
      </div>
      <div id="topbar" style="margin-left:5px;">
        <ul class="topNav">
          <li><a href="6sigmamarketingB2C.asp?action=closed">Closed calls</a></li>
        </ul>
      </div>
      <div id="main">
        <% If rqAction = "noFollowUp" OR rqAction = "followUp" OR rqAction = "closed" Then %>
        <table width="100%">
          <tr>
            <td width="20%"><% If rqAction = "noFollowUp" Then %>
              <h3>No Follow Up Calls</h3>
              <% ElseIf rqAction = "followUp" Then %>
              <h3>Follow Up Calls</h3>
              <% ElseIf rqAction = "closed" Then %>
              <h3>Closed Calls</h3>
              <% End If %>
            </td>
           <form action="6sigmamarketingB2C.asp?action=<% = rqAction %>" method="post">
            <td width="35%">State:
              <select name="state">
                <option value="">-Select-</option>
				<optgroup label="US">
                <% Do Until objRsUSState.EOF %>
                <option <% If rqState = objRsUSState("state") Then %> selected="selected" <% End If %> value="<% = objRsUSState("state") %>">
                <% = objRsUSState("state") %>
                </option>
                <% objRsUSState.Movenext
				   Loop
				   objRsUSState.Close %>
				</optgroup>
				<optgroup label="Canada">
				<% Do Until objRsCanadaState.EOF %>
                <option <% If rqState = objRsCanadaState("state") Then %> selected="selected" <% End If %> value="<% = objRsCanadaState("state") %>">
                <% = objRsCanadaState("state") %>
                </option>
                <% objRsCanadaState.Movenext
				   Loop
				   objRsCanadaState.Close %>
				</optgroup>
              </select>
              <input type="submit" name="search" value="Search" />
            </td>
            </form>
            <form action="6sigmamarketingB2C.asp?action=<% = rqAction %>" method="post">
            <td>Name :
              <input type="text" name="name" size="15" value="<% = rqName %>" />
              <input type="submit" name="search" value="Search" />
            </td>
            </form>
          </tr>
        </table>
        <fieldset>
        <table border="2" cellpadding="0" cellspacing="0" class="table1" width="900px">
          <tr>
            <td bgcolor="#A7DBFB" align="center"><b>State</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Name</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Phone Number</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Email Id</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Question</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Comments</b></td>
            <% If rqAction <> "noFollowUp" Then %>
            <td bgcolor="#A7DBFB" align="center"><b>History</b></td>
            <% End If %>
            <td bgcolor="#A7DBFB" align="center"><b>Email</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Status</b></td>
          </tr>
          <% If IsArray(arrAllCallDet) Then
						      For rowcounter = firstRow To lastRow
							  CallID = arrAllCallDet(0,rowcounter) %>
          <tr>
            <td><% = arrAllCallDet(1,rowcounter) %></td>
            <td><% = arrAllCallDet(2,rowcounter) %></td>
            <td><% = arrAllCallDet(3,rowcounter) %></td>
            <td><% = arrAllCallDet(4,rowcounter) %></td>
            <td><% = arrAllCallDet(5,rowcounter) %><br />Added date: <% = arrAllCallDet(7,rowcounter) %></td>
            <td>
			<form name="comment" action="6sigmaAddComments.asp" method="post" onsubmit="return Form_Validator(this)">
              <input type="hidden" name="callid" value="<% = CallID %>">
              <Textarea name="comment" rows="5" cols="20" ></Textarea>
                <BR />
                <input type="hidden" name="action" value="<% = rqAction %>" />
				<input type="hidden" name="page" value="<% = rqPage %>" />
				<input type="hidden" name="row" value="<% = rqRow %>" />
				<input type="hidden" name="state" value="<% = rqState %>" />
                <input type="submit" name="type" value="Save">
                <% If rqAction <> "closed" Then %>
                <input type="submit" name="type" value="Close" />
                <% End If %>
            </form>
            </td>
            <% If rqAction <> "noFollowUp" Then %>
            <td><iframe src="6sigma_fac_comments.asp?callid=<% = CallId %>" frameborder="0" height="100" scrolling="yes" width="200"></iframe></td>
            <% End If %>
            <td class="action" width="75px"><% If arrAllCallDet(4,rowcounter) <> "" Then %>
              <a href="sendmail.asp?callid=<% = CallID %>" class="addcomments" target="_blank">Send Email</a>
              <% Else %>
              &nbsp;
              <% End If %>
            </td>
            <form name="comment" action="6sigmaAddComments.asp" method="post" onsubmit="return Form_Validator1(this)">
              <input type="hidden" name="callId" value="<% = CallId %>">
              <input type="hidden" name="action" value="<% = rqAction %>" />
			  <input type="hidden" name="page" value="<% = rqPage %>" />
			  <input type="hidden" name="row" value="<% = rqRow %>" />
		      <input type="hidden" name="state" value="<% = rqState %>" />
              <td><br />
                <% If IsNull(arrAllCallDet(6,rowcounter)) Then %>
                <select name="status">
                  <option value="">--Select--</option>
                  <option value="Dummy">Dummy</option>
                  <option value="No follow up required">No follow up required</option>
                </select>
                <br />
                <br />
                <input type="submit" name="type" value="Submit" />
                <% Else %>
                <% = arrAllCallDet(6,rowcounter) %>
                <% End If %>
              </td>
            </form>
          </tr>
          <% Next %>
          <tr>
            <td colspan="9"><% If Not firstRow = 0 Then %>
              <a href="6sigmamarketingB2C.asp?action=<% = rqAction %>&<% If rqState <> "" Then %>state=<% = rqState %>&<% End If %><% If rqName <> "" Then %>name=<% = rqName %>&<% End If %>page=previous&row=<% = firstRow %>"> &lt;&lt;Previous</a>
              <% End If %>
              <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
              <% If Not numRows = lastRow Then %>
              <a href="6sigmamarketingB2C.asp?action=<% = rqAction %>&<% If rqState <> "" Then %>state=<% = rqState %>&<% End If %><% If rqName <> "" Then %>name=<% = rqName %>&<% End If %>page=next&row=<% = lastRow %>"> &gt;&gt;Next</a>
              <% End If %>
            </td>
          </tr>
          <% End If %>
        </table>
        </fieldset>
        <% End If %>
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