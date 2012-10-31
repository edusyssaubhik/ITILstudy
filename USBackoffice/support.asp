<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 'OPTION EXPLICIT %>
<% 
If Session("USBUserId") = "" Then 
	Response.Redirect("login.asp")
Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
'Written By : Bharath'
'Create Date : 16/11/2009'
'Last UpDated : 16/11/2009'
'Description :'
'This page is for Supporting System'
'Adding New Queries and Viewing the Queries'
'US BackOffice'
'======================================================='

'Declare the local variables'
Dim rqAction
Dim strViewAllTickets, strViewTicket, strViewAns
Dim objRs, objRs1
Dim userEmailId
Dim arrViewAllTickets, firstRow, lastRow, rowCounter, numRows
Dim rqPage
Dim rqTicketNo
Dim Ticket_Status


'Creating the Record Objects'
Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")

Function QueryType(querytypeno)

	Select Case querytypeno
	
		Case 1
			Response.Write("Technical")
		Case 2
			Response.Write("Hotel")
		Case 3
			Response.Write("Logistics - Gifts/Study Materails")
		Case 4
			Response.Write("Student Issues - Payments")
		Case 5
			Response.Write("Student Issues - Reschedule/Cancel") 
		Case 6
			Response.Write("Student - Online")
		Case 7
			Response.Write("Student Issues - Moneyback")
		Case 8
			Response.Write("Student Other Issues")
		Case 9
			Response.Write("Student Feedback")
		Case 10
			Response.Write("Acadamic Questions")
		Case 11
			Response.Write("Miscellaneous Issues")
		Case 12
			Response.Write("Senior Management - Tridibesh")
		Case 13
			Response.Write("Faculty Reimbursement")
		Case 14
			Response.Write("Faculty Payments/Bonus")
		
	End Select

End Function

Function QueryStatus(querystatusno)

	Select Case querystatusno

		Case 1
			Response.Write("Open")

		Case 2
			Response.Write("Process")
			
		Case 3
			Response.Write("Closed")
			
	End Select
						
End Function
				  
				  
'Retrive the action'
'User clicks on the particular task'
If Request.QueryString("action") <> "" Then
	rqAction     =  Request.QueryString("action")
Else 
	rqAction     =  Request.Form("action")
End If

'Retrive the queryNo From View Details OR Reply'
If Request.QueryString("queryNo") <> "" Then
	rqTicketNo  =  Request.QueryString("queryNo")
Else
	rqTicketNo  =  Request.Form("queryNo")
End If

rqRow = Request.QueryString("row")
rqPage = Request.QueryString("page")
rqEmailId   =  Request.Form("emailid")
rqQueryTopic = Request.Form("queryTopic")

userEmailId  =  Session("USBUserId")
If rqAction = "" Then

If Session("TypeOfUser") = "Admin" Then

strViewAllTickets = "SELECT query_no, query_topic, department, importance, query_status, lastupdate_on, emailid FROM ITIL_support_query ORDER BY query_no desc"

Else

strViewAllTickets = "SELECT query_no, query_topic, department, importance, query_status, lastupdate_on, emailid FROM ITIL_support_query WHERE emailid = '"& userEmailId &"' ORDER BY query_no desc"

End If

objRs.Open strViewAllTickets,ConnObj

	If Not objRs.EOF Then
		arrViewAllTickets = objRs.getrows
		firstRow = 0
		lastRow = 9
		numRows = Ubound(arrViewAllTickets,2)
		If lastRow > numRows Then
		   lastRow = numRows
		End If
	End If
	 
	objRs.Close
	  
	If rqPage = "next" Then
	
	   numRows = Ubound(arrViewAllTickets,2)
	
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
	
	   numRows = Ubound(arrViewAllTickets,2)
	
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

ElseIf rqAction = "viewTicket" Then

strViewTicket = "SELECT * FROM ITIL_support_query WHERE query_no = '"& rqTicketNo &"'"

objRs.Open strViewTicket, ConnObj

Do Until objRs.EOF 
		   
   TicketNo = objRs("query_no")
   QueryTopic = objRs("query_topic")
   QueryDetails = objRs("query_details")
   Department = objRs("department")
   Importance = objRs("importance")
   Created_On = objRs("created_on")
   Lastupdate_On = objRs("lastupdate_on")
   Ticket_Status = objRs("query_status")
		   
objRs.Movenext
Loop
objRs.Close
			   
strViewAns = "SELECT * FROM ITIL_support_answer WHERE query_no = '"& rqTicketNo &"' ORDER BY id DESC"

objRs1.Open strViewAns, ConnObj

End If

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Support Center</title>
<script language="javascript">
function Form_Validator(theform)
{

  
  if (theform.department.value == "")
  {
    alert("Please select department");
    theform.department.focus();
	return(false);
  }

   
  if (theform.query_topic.value == "")
  {
    alert("Please enter the subject");
    theform.query_topic.focus();
	return(false);
  }

    
  if (theform.query.value == "")
  {
    alert("Please enter the query");
    theform.query.focus();
	return(false);
  }
  
   
  if (theform.importance.value == "")
  {
    alert("Please select the importance");
    theform.importance.focus();
	return(false);
  }    
 
}
</script>
<!-- CSS -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<!--[if IE 6]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie6.css" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie7.css" /><![endif]-->
<!-- JavaScripts-->
<script type="text/javascript" src="js/richtext.js"></script>
<script language="JavaScript" type="text/javascript">
<!--
function submitForm() {
	//make sure hidden and iframe values are in sync before submitting form
	//to sync only 1 rte, use updateRTE(rte)
	//to sync all rtes, use updateRTEs
	updateRTE('rte1');
	//updateRTEs();                        
	alert("rte1 = " + document.RTEForm.rte1.value);
	
	//change the following line to true to submit form
	return false;
}

//Usage: initRTE(imagesPath, includesPath, cssFile)
initRTE("img/", "", "");
//-->
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
      <h2><a href="home.asp">Home</a> &raquo; <a href="support.asp" class="active">Support Center</a>
        <% If rqAction = "newTicket" Then %>
        &raquo; Submit a Ticket
        <% End If %>
      </h2>
      <div id="topbar" style="margin-left:31px;">
        <ul class="topNav">
          <li><a href="support.asp?action=newTicket">Submit a Ticket</a></li>
        </ul>
      </div>
      <div id="main">
        <% If rqAction = "newTicket" Then %>
        <h3>Submit a Ticket</h3>
        <% Else %>
        <h3>View Tickets</h3>
        <% End If %>
        <fieldset>
        <% If rqAction = "newTicket" Then %>
        <form name="RTEForm" action="addSupport.asp" method="post" onSubmit="return Form_Validator(this)">
          <noscript>
          <p><b>Javascript must be enabled to use this form.</b></p>
          </noscript>
          <table border="0" cellpadding="3" cellspacing="5" width="70%" class="table2">
            <tr>
              <td width="10%">Department: </td>
              <td width="60%"><select name="department">
                  <option value="">--Select--</option>
                  <option value="1">Technical</option>
                  <option value="2">Hotel</option>
                  <option value="3">Logistics - Gifts/Study Materails</option>
                  <option value="4">Student Issues - Payments</option>
                  <option value="5">Student Issues - Reschedule/Cancel </option>
                  <option value="6">Student - Online</option>
                  <option value="7">Student Issues - Moneyback</option>
                  <option value="8">Student Other Issues</option>
                  <option value="9">Student Feedback</option>
                  <option value="10">Acadamic Questions</option>
                  <option value="11">Miscellaneous Issues</option>
                  <option value="12">Senior Management - Tridibesh</option>
                  <option value="13">Faculty Reimbursement</option>
                  <option value="14">Faculty Payments/Bonus</option>
                </select>
              </td>
            </tr>
            <tr>
              <td>Subject: </td>
              <td><input type="text" name="query_topic" size="64" /></td>
            </tr>
            <tr>
              <td>Query: </td>
              <td>
			 <!-- <script language="JavaScript" type="text/javascript">
				
				<%
				'sContent = "rtytry"
				'sContent = RTESafe(sContent)
				%>//Usage: writeRichText(fieldname, html, width, height, buttons, readOnly)
				writeRichText('rte1', '<%'=sContent%>', 520, 200, true, false);
				
			  </script>-->
			  <textarea rows="15" cols="50" name="query"></textarea>
			  </td>
            </tr>
            <tr>
              <td>Query Type:</td>
              <td>Confidential
                <input type="radio" name="query_type" value="No" checked="checked" />
                No &nbsp;
                <input type="radio" name="query_type" value="Yes" />
                Yes</td>
            </tr>
            <tr>
              <td>Answer within: </td>
              <td><select name="importance">
                  <option value="">--Select--</option>
                  <option value="1 Hour">1 Hour</option>
                  <option value="4 Hours">4 Hours</option>
                  <option value="12 Hours">12 Hours</option>
                  <option value="24 Hours">24 Hours</option>
                  <option value="1 Week">1 Week</option>
                </select>
              </td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td align="center"><input name="addNewQuery" type="submit" value="Submit" />
                &nbsp;
                <input type="reset" value="Reset" /></td>
            </tr>
          </table>
        </form>
        <% ElseIf rqAction = "reply" Then %>
        <form action="addSupport.asp" method="post">
          <input type="hidden" name="queryNo" value="<% = rqTicketNo %>" />
		  <input type="hidden" name="queryTopic" value="<% = rqQueryTopic %>" />
		  <input type="hidden" name="user" value="STAFF" />
		  <input type="hidden" name="emailid" value="<% = rqEmailId %>" />
          <table border="0" class="table2">
            <tr>
              <td><b>Answer:</b> </td>
              <td><textarea name="answer" rows="15" cols="50"></textarea></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td align="right"><input type="submit" name="reply" value="Submit" /></td>
            </tr>
          </table>
        </form>
        <% ElseIf rqAction = "viewTicket" Then %>
        <table border="0" width="80%" class="table2">
          <tr>
            <td colspan="4"><h5>Ticket Details</h5></td>
          </tr>
          <tr>
            <td width="8%"><b>Ticket ID:</b> </td>
            <td  width="25%"><% = TicketNo %></td>
            <td  width="8%"><b>Department:</b> </td>
            <td  width="35%"><% Call QueryType(Department) %></td>
          </tr>
          <tr>
            <td><b>Status:</b> </td>
            <td><% Call QueryStatus(Ticket_Status) %></td>
            <td><b>Importance:</b></td>
            <td><% = Importance %></td>
          </tr>
          <tr>
            <td><b>Created On:</b></td>
            <td><% = FormatDateTime(Created_On,1) %></td>
            <% If Lastupdate_On <> "" Then %>
            <td><b>Last Update:</b></td>
            <td><% = FormatDateTime(Lastupdate_On,1) %></td>
            <% End If %>
          </tr>
        </table>
		<% If Ticket_Status <> "3" Then %>
		<br />
		<form action="addSupport.asp" method="post">
		<input type="hidden" name="queryNo" value="<% = rqTicketNo %>" />
		<table class="table1" width="60%">
		  <tr>
			<td><b>Status:</b>&nbsp;&nbsp;
				<select name="status">
					<option value="3">Closed</option>
				</select>&nbsp;&nbsp;
				<input type="submit" name="Close" value="Update" />
			</td>
		  </tr>
		</table>
		</form>
		<% End If %>
        <br />
        <h5>Conversation</h5>
        <br />
        <table border="0" class="table1" width="60%">
          <% Do Until objRs1.EOF %>
          <tr>
            <td>
			 <table width="100%" class="table2" cellpadding="0">
			  <tr>
			   <td>Posted On: <% = FormatDateTime(objRs1("replied_on"),1) %>&nbsp;<% = FormatDateTime(objRs1("replied_on"),4) %></td>
			   <td><% = objRs1("added_by") %></td>
			  </tr>
			  <tr>
			    <td colspan="2"><hr /><% = objRs1("answer") %><br /><br /></td>
			  </tr>
			 </table>
            </td>
          </tr>
          <%   objRs1.Movenext
			   Loop
			   objRs1.Close %>
          <tr>
            <td>
			 <table width="100%" class="table2"  cellpadding="0">
			  <tr>
			   <td>Posted On:<% = FormatDateTime(Created_On,1) %>&nbsp;<% = FormatDateTime(Created_On,4) %> </td>
			   <td>USER</td>
			  </tr>
			  <tr>
			  	<td colspan="2"><hr /><% = QueryDetails %><br /><br /></td>
			  </tr>
			 </table>
			 
                 
            </td>
          </tr>
		  <% If Session("TypeOfUser") <> "Admin" And Ticket_Status <> 3 Then %>
		  <tr>
		  	<td>
			<form action="addSupport.asp" method="post">
			  <input type="hidden" name="queryNo" value="<% = rqTicketNo %>" />
			  <input type="hidden" name="user" value="USER" />
			  <input type="hidden" name="emailid" value="<% = rqEmailId %>" />
			  <table border="0" class="table2">
				<tr>
				  <td><b>Reply:</b> </td>
				  <td><textarea name="answer" rows="15" cols="50"></textarea></td>
				</tr>
				<tr>
				  <td>&nbsp;</td>
				  <td align="right"><input type="submit" name="reply" value="Submit" /></td>
				</tr>
			  </table>
			</form>
		   </td>
		  </tr>
		  <% End If %>
        </table>
        <% Else %>
        <table border="0" width="100%" cellpadding="3" cellpadding="5" class="table1">
        <tr>
          <td width="8%"><b>Ticket No</b></td>
          <td width="45%"><b>Subject</b></td>
          <td width="20%"><b>Department</b></td>
          <td width="5%"><b>Importance</b></td>
		  <td width="5%"><b>Posted</b></td>
          <td width="5%"><b>Status</b></td>
          <td width="8%"><b>View Details</b></td>
          <% If Session("TypeOfUser") = "Admin" Then %>
          <td width="5%"><b>Reply</b></td>
          <% End If %>
        </tr>
        <% If IsArray(arrViewAllTickets) Then
		   For rowCounter = firstRow To lastRow  
		   
		   strName = "SELECT firstname, lastname FROM ITIL_instructor WHERE emailid1 = '"& arrViewAllTickets(6,rowCounter) &"'"
		   
		   objRs1.Open strName, ConnObj
		   
		   Do Until objRs1.EOF
		   		FirstName = objRs1("firstname")
				LastName  = objRs1("lastname")
		   objRs1.Movenext
		   Loop
		   objRs1.Close
		   %>
        <tr>
          <td><% = arrViewAllTickets(0,rowCounter) %></td>
          <td><% = arrViewAllTickets(1,rowCounter) %></td>
          <td><% Call QueryType(arrViewAllTickets(2,rowCounter)) %></td>
          <td><% = arrViewAllTickets(3,rowCounter) %></td>
		  <td><% = FirstName %>&nbsp;<% = LastName %></td>
          <td><% Call QueryStatus(arrViewAllTickets(4,rowCounter)) %></td>
          <form action="support.asp" method="post">
            <input type="hidden" name="queryNo" value="<% = arrViewAllTickets(0,rowCounter) %>" />
            <input type="hidden" name="action" value="viewTicket" />
            <td><input type="submit" value="View Details" /></td>
          </form>
		  <% If Session("TypeOfUser") = "Admin" And arrViewAllTickets(4,rowCounter) <> 3 Then %>		  
          <form action="support.asp" method="post">
            <input type="hidden" name="queryNo" value="<% = arrViewAllTickets(0,rowCounter) %>" />
			<input type="hidden" name="emailid" value="<% = arrViewAllTickets(6,rowCounter) %>" />
			<input type="hidden" name="queryTopic" value="<% = arrViewAllTickets(1,rowCounter) %>" />
            <input type="hidden" name="action" value="reply" />
            <td><input type="submit" value="Reply" /></td>
          </form>
		  <% End If %>
        </tr>
        <% Next %>
        <tr>
          <td colspan="9"><% If Not firstRow = 0 Then %>
            <a href="support.asp?action=<% = rqAction %>&page=previous&row=<% = firstRow %>"> &lt;&lt;Previous</a>
            <% End If %>
            <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
            <% If Not numRows = lastRow Then %>
            <a href="support.asp?action=<% = rqAction %>&page=next&row=<% = lastRow %>"> &gt;&gt;Next</a>
            <% End If %>
          </td>
        </tr>
        <% End If %>
        </table>
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
<!--#include virtual="/includes/connectionClose.asp"-->
<% End If %>
