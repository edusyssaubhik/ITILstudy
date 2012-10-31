<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<!--#include virtual="/india/connection.asp"-->
<% 
   If Session("UserId") = "" Then
     Response.Redirect("../login.asp")
	 
	 Else
%>
<%

'======================================================='
'Written By : savita'
'Last UpDated : 05/04/2011'
'Description :'
'This page show all the payment decline records'
'======================================================='

'Declare the local variables'
Dim strCity, objRs,strPayDec
Dim firstRow,lastRow,numRows
Dim firstPageRow,lastPageRow,numPageRows
Dim objRsCity,rowcounter,ID,counter
Dim rqRow,searchName,searchCity,strQuery5
Dim rqAction,rqId,rqType,rqPage,ps
Dim strPayment,objRs1,arrAllpay1,rqEnrollUserId
Dim rqCity,rqName,rqState,arrAllpay,strPay,SrNo, arrAllRecords, allNumRows
Dim rqpayRow,payrowcounter, payfirstRow,paylastRow,paynumRows,rqpayPage,rqCourse
Dim iPageCurrent, pagenum, page, prev, nextPage, lastpage, lpm1, pagination, cnt

'Creating the record set'
Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
Set Rs = Server.CreateObject("ADODB.Recordset")
Set objRsCity = Server.CreateObject("ADODB.Recordset")

'Retrive the action'
rqAction = Request.QueryString("action")
rqId = Request.QueryString("ID")
rqType = Request.Form("type")
rqPage = Request.QueryString("page")
rqRow = Request.QueryString("row")
rqAction = Request.QueryString("action")
rqCourse = Request.Form("Course")

 rqPage =  Request.QueryString("page")
 rqRow  =  Request.QueryString("row")

If Request.Form("city") <> "" Then
	rqCity = Request.Form("city")
Else
	rqCity = Request.QueryString("city")
End If

If Request.Form("Name") <> "" Then
	rqName = Request.Form("Name")
Else
	rqName = Request.QueryString("Name")
End If

If Request.Form("Course") <> "" Then
	rqCourse = Request.Form("Course")
Else
	rqCourse = Request.QueryString("Course")
End If


strCity = "SELECT city FROM ITIL_city ORDER BY city"

objRsCity.Open strCity,Conn


'If rqAction = "noFollowUp" OR rqAction = "" OR rqAction = "followUp" OR rqAction = "" OR rqAction = "closed" OR rqAction = "notInterested" Then

If rqAction <> "PORec" Then

If rqAction = "noFollowUp" OR rqAction = "" Then

	'If user select city in the city dropdown of No Follow Up that will come here'
	If rqCity <> "" Then

	'Retrive the not follow up details based on city search'
	strPayDec = "SELECT ID, TypeofCourse, Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,datePayment_rec,Status , contactNo,Currency_type, OrderNo FROM paymentDecline WHERE Status = '1' And city = '"& rqCity &"' ORDER BY ID desc"

	'If user entered name in the serach of No Follow Up that will come here'
	ElseIf rqName <> "" Then

	'Retrive the not follow up details based on lastname'
	strPayDec = "SELECT ID,TypeofCourse, Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,datePayment_rec,Status , contactNo, Currency_type, OrderNo FROM paymentDecline WHERE Status = '1' And (Name Like '%"& rqName &"%' OR EmailID Like '%"& rqName &"%') ORDER BY ID desc"
	
	ElseIf rqCourse <> "" Then

	'Retrive the not follow up details based on lastname'
	strPayDec = "SELECT ID,TypeofCourse, Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,datePayment_rec,Status , contactNo, Currency_type, OrderNo FROM paymentDecline WHERE Status = '1' And TypeofCourse Like '%"& rqCourse &"%' ORDER BY ID desc"
	
	'If user as a admin, i am showing all the cities'
	Else 
	
	'Retrive the not follow up details for all the cities (ADMIN)'
	strPayDec ="SELECT ID,TypeofCourse, Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,datePayment_rec,Status, contactNo, Currency_type, OrderNo  FROM paymentDecline WHERE Status = '1' ORDER BY ID desc"
	
	'Response.Write(strPayDec)
	End If

ElseIf rqAction = "followUp" Then

	'If user select city in the city dropdown of Follow Up that will come here'
	If rqCity <> "" Then
	
	'Retrive the not follow up details based on city search'
	strPayDec = "SELECT ID,TypeofCourse, Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,datePayment_rec,Status , contactNo, Currency_type, OrderNo FROM paymentDecline WHERE Status = '2' And city = '"& rqCity &"' ORDER BY ID desc"

	'If user entered name in the serach of Follow Up calls that will come here'
	ElseIf rqName <> "" Then

	'Retrive the follow up details based on lastname'
	strPayDec = "SELECT ID,TypeofCourse, Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,datePayment_rec,Status,contactNo, Currency_type, OrderNo  FROM paymentDecline WHERE Status = '2' And (Name Like '%"& rqName &"%' OR EmailID Like '%"& rqName &"%') ORDER BY ID desc"
	
	ElseIf rqCourse <> "" Then

	'Retrive the not follow up details based on lastname'
	strPayDec = "SELECT ID,TypeofCourse, Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,datePayment_rec,Status  , contactNo, Currency_type, OrderNo FROM paymentDecline WHERE Status = '2' And TypeofCourse Like '%"& rqCourse &"%' ORDER BY ID desc"
	

	'If user as a admin, i am showing all the cities'
	Else 

	'Retrive the follow up details for all the cities (ADMIN)'
	strPayDec = "SELECT ID,TypeofCourse, Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,datePayment_rec,Status, contactNo, Currency_type, OrderNo  FROM paymentDecline WHERE Status = '2' ORDER BY ID desc"

	End If

ElseIf rqAction = "closed" Then

	'If user select city in the city dropdown of Closed that will come here'
	If rqCity <> "" Then

	'Retrive the closed details based on city search'
	strPayDec = "SELECT ID,TypeofCourse, Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,datePayment_rec,Status,contactNo, Currency_type, OrderNo FROM paymentDecline WHERE Status = '3' And city = '"& rqCity &"' ORDER BY ID desc"
	'If user entered name in the serach of Closed calls that will come here'
	ElseIf rqName <> "" Then

	'Retrive the Closed details based on lastname'
	strPayDec ="SELECT ID,TypeofCourse, Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,datePayment_rec,Status, contactNo, Currency_type, OrderNo FROM paymentDecline WHERE Status = '3' And (Name Like '%"& rqName &"%' OR EmailID Like '%"& rqName &"%') ORDER BY ID desc"
	
	ElseIf rqCourse <> "" Then

	'Retrive the not follow up details based on lastname'
	strPayDec = "SELECT ID,TypeofCourse, Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,datePayment_rec,Status , contactNo, Currency_type, OrderNo FROM paymentDecline WHERE Status = '3' And TypeofCourse Like '%"& rqCourse &"%' ORDER BY ID desc"
	
	
	'If user as a admin, i am showing all the cities'
	Else 

	'Retrive the Closed details for all the cities (ADMIN)'
	strPayDec = "SELECT ID,TypeofCourse, Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,datePayment_rec,Status , contactNo, Currency_type, OrderNo FROM paymentDecline WHERE Status = '3' ORDER BY ID desc"
	
	End If

ElseIf rqAction = "notInterested" Then

	'If user select city in the city dropdown of Closed that will come here'
	If rqCity <> "" Then

	'Retrive the closed details based on city search'
	strPayDec = "SELECT ID,TypeofCourse, Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,datePayment_rec,Status, contactNo, Currency_type, OrderNo  FROM paymentDecline WHERE Status = '4' And city = '"& rqCity &"' ORDER BY ID desc"
	'If user entered name in the serach of Closed calls that will come here'
	ElseIf rqName <> "" Then

	'Retrive the Closed details based on lastname'
	strPayDec ="SELECT ID,TypeofCourse, Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,datePayment_rec,Status , contactNo, Currency_type, OrderNo FROM paymentDecline WHERE Status = '4' And (Name Like '%"& rqName &"%' OR EmailID Like '%"& rqName &"%') ORDER BY ID desc"
	'If user as a admin, i am showing all the cities'
	
	ElseIf rqCourse <> "" Then

	'Retrive the not follow up details based on lastname'
	strPayDec = "SELECT ID,TypeofCourse, Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,datePayment_rec,Status , contactNo, Currency_type, OrderNo FROM paymentDecline WHERE Status = '4' And TypeofCourse Like '%"& rqCourse &"%' ORDER BY ID desc"
	
	
	Else 

	'Retrive the Closed payment details for all the cities (ADMIN)'
	strPayDec = "SELECT ID,TypeofCourse, Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,datePayment_rec,Status, contactNo, Currency_type, OrderNo FROM paymentDecline WHERE Status = '4' ORDER BY ID desc"
	
	End If
	
ElseIf rqAction = "PayDummy" Then
	
	'If user select city in the city dropdown of Follow Up that will come here'
	If rqCity <> "" Then
	
	'Retrive the not follow up details based on city search'
	strPayDec = "SELECT ID,TypeofCourse, Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,datePayment_rec,Status , contactNo, Currency_type, OrderNo FROM paymentDecline WHERE Status = '5' And city = '"& rqCity &"' ORDER BY ID desc"

	'If user entered name in the serach of Follow Up calls that will come here'
	ElseIf rqName <> "" Then

	'Retrive the follow up details based on lastname'
	strPayDec = "SELECT ID,TypeofCourse, Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,datePayment_rec,Status,contactNo, Currency_type, OrderNo  FROM paymentDecline WHERE Status = '5' And (Name Like '%"& rqName &"%' OR EmailID Like '%"& rqName &"%') ORDER BY ID desc"
	
	ElseIf rqCourse <> "" Then

	'Retrive the not follow up details based on lastname'
	strPayDec = "SELECT ID,TypeofCourse, Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,datePayment_rec,Status  , contactNo, Currency_type, OrderNo FROM paymentDecline WHERE Status = '5' And TypeofCourse Like '%"& rqCourse &"%' ORDER BY ID desc"
	

	'If user as a admin, i am showing all the cities'
	Else 

	'Retrive the follow up details for all the cities (ADMIN)'
	strPayDec = "SELECT ID,TypeofCourse, Name,EmailID, city, Country, InvoiceDate, datePayment_dec,FailureReason,Amount,Addedby,AddedDate,PayProcess_name,datePayment_rec,Status, contactNo, Currency_type, OrderNo  FROM paymentDecline WHERE Status = '5' ORDER BY ID desc"
	
		'response.Write(strPayDec)

	End If
	
End If	


objRs.Open strPayDec, Conn
	  If Not objRs.EOF Then
		arrAllRecords = objRs.getrows
		Session("arrAllRecords") = arrAllRecords
		
		cnt = 1
		
		'firstRow = 0
		'lastRow = 9
		'numRows = Ubound(arrAllRecords,2)
		'If lastRow > numRows Then
		'   lastRow = numRows
		'End If
		'allNumRows = numRows
		
	  End If
	  objRs.close
	 
'Pagination code'

If cnt = 1 Then

 If (Request.QueryString("page") = "") Then
	
	iPageCurrent = 1

	numPageRows = Ubound(arrAllRecords,2)
	
	firstPageRow = 0  
	 
	If numPageRows > 9 Then
	
	    lastPageRow = 9
	
	Else 
		
		lastPageRow = numPageRows
		
	End If
	
Else
	
	'arrAllQueries = Session("arrAllQueries")	
	numPageRows = Ubound(arrAllRecords,2)
	
	iPageCurrent = Request.QueryString("page") 
    firstPageRow = ((10 * iPageCurrent)-10) 
     lastPageRow = firstPageRow + 9 

    If lastPageRow > numPageRows Then
    lastPageRow = numPageRows
   End If

    If firstPageRow < 0 Then
       firstPageRow = 0
    End If

 End if

End If




ElseIf rqAction = "PORec" Then

strPayDec	 = "SELECT * FROM ITIL_enrolledusers WHERE us_status = 'P.O Received' AND (checkreceived Is Null OR checkreceived <> 'Yes') And (status = 'Active' OR status = 'Re-Schedule Not Confirmed') ORDER BY id desc"

objRs1.Open strPayDec, Conn

If Not objRs1.EOF Then
	arrAllpay1 = objRs1.getrows
	firstRow = 0
	lastRow = 9
	numRows = Ubound(arrAllpay1,2)
	If lastRow > numRows Then
	   lastRow = numRows
	End If
End If

objRs1.Close

If rqPage = "next" Then

   numRows = Ubound(arrAllpay1,2)

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

   numRows = Ubound(arrAllpay1,2)

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

End If

 rqEnrollUserId = Request.Querystring("enrollUserId")

 strQuery5 = "SELECT comment FROM ITIL_enrolledusercomments where enrolluserid =  '" & rqEnrollUserId & "'"

 Rs.Open strQuery5,Conn

End If


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Payment decline</title>
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

function Form_Validator2(theform)
{


 if (theform.city.value == "")
  {
     alert("Please select city.");
     theform.city.focus();
     return (false);
  }
  }
  function Form_Validator3(theform)
{


 if (theform.Name.value == "")
  {
     alert("Please enter name to search.");
     theform.Name.focus();
     return (false);
  }
  }
  function Form_Validator4(theform)
{


 if (theform.Course.value == "")
  {
     alert("Please select Course.");
     theform.Course.focus();
     return (false);
  }
  }

</script>
</head>
<body>
<div>
<table border="1" cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td align="center"><b>Payment Decline Details</b></td>
</tr>
<tr>
  <td align="left"><table border="0" cellpadding="5" cellspacing="0" width="35%">
      <tr>
        <td><form action="newQuery.asp?action=newQuery" method="post">
            <input type="submit" value="Add New Query" />
          </form></td>
        <td><form action="PayDecline.asp?action=noFollowUp" method="post">
            <input type="submit" value="Payment Declined" />
          </form></td>
        <td><form action="PayDecline.asp?action=followUp" method="post">
            <input type="submit" value="Payment In Process" />
          </form></td>
        <td><form action="PayDecline.asp?action=closed" method="post">
            <input type="submit" value="Payment Received " />
          </form></td>
        <td><form action="PayDecline.asp?action=notInterested" method="post">
            <input type="submit" value="Not Interested " />
          </form></td>
        <td><form action="PayDecline.asp?action=PORec" method="post">
            <input type="submit" value="P.O Received " />
          </form></td>
        <td><form action="payReport.asp" method="post" target="_blank">
            <input type="submit" value="Payment Send Mail " />
          </form></td>
		<td><form action="PayDecline.asp?action=PayDummy" method="post">
            <input type="submit" value="Dummy Payment " />
          </form></td>
      </tr>
    </table></td>
</tr>
<tr>
  <td align="left"><table border="0" cellpadding="5" cellspacing="0" width="60%">
      <tr>
        <form action="PayDecline.asp?action=<% = rqAction %>" method="post" onsubmit="return Form_Validator2(this)">
          <td>City:
            <select name="city">
              <option value="">-Select-</option>
              <% Do Until objRsCity.EOF %>
              <option <% If rqCity = objRsCity("city") Then %> selected="selected" <% End If %> value="<% = objRsCity("city") %>">
              <% = objRsCity("city") %>
              </option>
              <% objRsCity.Movenext
				   Loop
				   objRsCity.Close %>
            </select>
            <input type="submit" name="search" value="Search">
          </td>
        </form>
        <form action="PayDecline.asp?action=<% = rqAction %>" method="post" onsubmit="return Form_Validator3(this)">
          <td>Name:
            <input type="text" name="Name" size="15" value="<% = rqName %>" />
            <input type="submit" name="search" value="Search" />
          </td>
        </form>
        <form action="PayDecline.asp?action=<% = rqAction %>" method="post" onsubmit="return Form_Validator4(this)">
          <td> Type of course:
            <select name="Course">
              <option value="">--Select--</option>
              <option <% If rqCourse = "Online" Then %> selected="selected" <% End If %> value= "Online" >Online</option>
              <option <% If rqCourse = "Classroom" Then %> selected="selected" <% End If %> value= "Classroom" >Classroom</option>
            </select>
            <input type="submit" name="search" value="Search" />
          </td>
        </form>
      </tr>
      <tr>
        <td><a href="PayDecline.asp">Home</a> &raquo;
          <% If rqAction = "noFollowUp" Then %>
          Payment Declined
          <% ElseIf rqAction = "followUp" Then %>
          Payment In Process
          <% ElseIf rqAction = "closed" Then %>
          Payment Received
          <% ElseIf rqAction = "notInterested" Then %>
          Not Interested
          <% ElseIf rqAction = "PORec" Then %>
          P.O Received
		   <% ElseIf rqAction = "PayDummy" Then %>
          Dummy Payment
          <% End If %>
        </td>
      </tr>
    </table></td>
</tr>
<tr>
  <td><% If rqAction = "PORec" Then %>
    <table border="1" cellpadding="5" cellspacing="2"  width="100%">
      <tr>
        <td bgcolor="#A7DBFB" align="center"><b>SrNo</b></td>
        <td bgcolor="#A7DBFB" align="center"><b>First Name</b></td>
        <td bgcolor="#A7DBFB" align="center"><b>Last Name</b></td>
        <td bgcolor="#A7DBFB" align="center"><b>Email</b></td>
        <td bgcolor="#A7DBFB" align="center"><b>Name Of Employeer</b></td>
        <td bgcolor="#A7DBFB" align="center"><b>Phone Number</b></td>
        <td bgcolor="#A7DBFB" align="center"><b>Course Details</b></td>
        <td bgcolor="#A7DBFB" align="center"><b>Amount</b></td>
        <td bgcolor="#A7DBFB" align="center" colspan="2" ><b>comment</b></td>
        <td bgcolor="#A7DBFB" align="center"><b>status</b></td>
      </tr>
      <%
		  	 SrNo = 1
			 If IsArray(arrAllpay1) Then 
			 For rowcounter = firstRow To lastRow
			 %>
      <tr>
        <td><% = SrNo %></td>
        <td><% = arrAllpay1(1,rowcounter) %></td>
        <td><% = arrAllpay1(2,rowcounter) %></td>
        <td><% = arrAllpay1(3,rowcounter) %></td>
        <td><% = arrAllpay1(4,rowcounter) %></td>
        <td><% = arrAllpay1(5,rowcounter) %></td>
        <td><% = arrAllpay1(6,rowcounter) %></td>
        <td><% = arrAllpay1(8,rowcounter) %></td>
        <form name="comment" action="addPayCom.asp" method="post" onsubmit="return Form_Validator3(this)">
          <input type="hidden" name="enrollUserId" onChange="myPopup2()" value="<% = arrAllpay1(0,rowcounter) %>">
          <input type="hidden" name="CourseDetails" value="<% = arrAllpay1(6,rowcounter) %>" />
          <input type="hidden" name="enrolldate" value="<% = arrAllpay1(7,rowcounter) %>">
          <input type="hidden" name="courseId" value="<% = arrAllpay1(20,rowcounter	) %>">
          <td align="center"><Textarea name="notes" rows="5" cols="25" ></Textarea>
            <input type="submit"  name="type" class="buttonc" value="Save Comment">
          </td>
        </form>
        <td><iframe src="enrollUserComments.asp?enrollUserId=<% = arrAllpay1(0,rowcounter) %>&us_status=<% = arrAllpay1(24,rowcounter) %>" frameborder="0" height="100" scrolling="yes" width="250"> </iframe></td>
        <td><% = arrAllpay1(24,rowcounter) %></td>
      </tr>
      <% SrNo = SrNo+1 %>
      <% Next %>
      <tr>
        <td colspan="16"><% If Not firstRow = 0 Then %>
          <a href="PayDecline.asp?action=<% = rqAction %>&<% If rqCity <> "" Then %>city=<% = rqCity %>&<% End If %><% If rqName <> "" Then %>name=<% = rqName %>&<% End If %>page=previous&row=<% = firstRow %>"> &lt;&lt;Previous</a>
          <% End If %>
          <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
          <% If Not numRows = lastRow Then %>
          <a href="PayDecline.asp?action=<% = rqAction %>&<% If rqCity <> "" Then %>city=<% = rqCity %>&<% End If %><% If rqName <> "" Then %>name=<% = rqName %>&<% End If %>page=next&row=<% = lastRow %>"> &gt;&gt;Next</a>
          <% End If %>
        </td>
      </tr>
      <% End If %>
    </table></td>
</tr>
<tr>
  <td>
  <% ElseIf rqAction = "noFollowUp" OR  rqAction = "" OR  rqAction = "followUp" OR  rqAction = "closed" OR rqAction = "notInterested" OR rqAction = "PayDummy" Then %>
    <table border="1" cellpadding="5" cellspacing="2"  width="100%">
    <tr>
      <td bgcolor="#A7DBFB" align="center"><b>SrNo</b></td>
      <td bgcolor="#A7DBFB" align="center"><b>Order No</b></td>
      <td bgcolor="#A7DBFB" align="center"><b>Course Type</b></td>
      <td bgcolor="#A7DBFB" align="center"><b>Name</b></td>
      <td bgcolor="#A7DBFB" align="center"><b>EmailID</b></td>
      <td bgcolor="#A7DBFB" align="center"><b>Contact No</b></td>
      <td bgcolor="#A7DBFB" align="center"><b>City</b></td>
      <td bgcolor="#A7DBFB" align="center"><b>Country</b></td>
      <td bgcolor="#A7DBFB" align="center"><b>Invoice Date</b></td>
      <td bgcolor="#A7DBFB" align="center"><b>Payment Decline Date</b></td>
      <td bgcolor="#A7DBFB" align="center"><b>Failure Reason</b></td>
      <td bgcolor="#A7DBFB" align="center"><b>Amount</b></td>
      <td bgcolor="#A7DBFB" align="center"><b>Added By</b></td>
      <td bgcolor="#A7DBFB" align="center"><b>Added Date</b></td>
      <td bgcolor="#A7DBFB" align="center"><b>Payment Process</b></td>
      <td bgcolor="#A7DBFB" align="center"><b>Comments</b></td>
      <% 'If rqAction <> "noFollowUp" Then %>
      <td bgcolor="#A7DBFB" align="center"><b>History</b></td>
      <%' End If %>
      <% If rqAction = "closed" Then %>
      <td bgcolor="#A7DBFB" align="center"><b>Payment Received On</b></td>
      <% End If %>
      <td bgcolor="#A7DBFB" align="center"><b>Status</b></td>
    </tr>
    <%
			 SrNo = firstPageRow	
			 
			 If IsArray(arrAllRecords) Then
		
			  FOR rowcounter = firstPageRow TO lastPageRow

			 %>
    <tr id="htMap">
    <td><% = SrNo + 1  %>
      <%' = arrAllRecords(0,rowcounter) %></td>
    <td><% = arrAllRecords(17,rowcounter) %></td>
    <td><% = arrAllRecords(1,rowcounter) %></td>
    <td><% = arrAllRecords(2,rowcounter) %></td>
    <td><% = arrAllRecords(3,rowcounter) %></td>
    <td><% = arrAllRecords(15,rowcounter) %></td>
    <td><% = arrAllRecords(4,rowcounter) %></td>
    <td><% = arrAllRecords(5,rowcounter) %></td>
    <td><% = arrAllRecords(6,rowcounter) %></td>
    <td><% = arrAllRecords(7,rowcounter) %></td>
    <td><% = arrAllRecords(8,rowcounter) %></td>
    <td><% = arrAllRecords(16,rowcounter) %>
      &nbsp;
      <% = arrAllRecords(9,rowcounter) %></td>
    <td><% = arrAllRecords(10,rowcounter) %></td>
    <td><% = arrAllRecords(11,rowcounter) %></td>
    <td><% = arrAllRecords(12,rowcounter) %></td>
    <td><table border="0" width="75%" cellpadding="5">
        <tr>
        
        <form name="comment" action="addPayCom.asp" method="post" onsubmit="return Form_Validator(this)">
          <td colspan="3"><input type="hidden" name="ID" value="<% = arrAllRecords(0,rowcounter) %>">
            <Textarea name="comment" rows="5" cols="28" ></Textarea>
            <BR />
            <input type="hidden" name="action" value="<% = rqAction %>" />
            <input type="hidden" name="page" value="<% = rqPage %>" />
            <input type="hidden" name="row" value="<% = rqRow %>" />
            <input type="hidden" name="city" value="<% = rqCity %>" />
          </td>
          </tr>
          
          <tr>
            <td><input type="submit" name="type" value="Save"  onclick="var i=confirm('Are you sure you want to save the comment?'); if(i==false){return false;}">
            </td>
            <% If rqAction = "noFollowUp" Then %>
            <td><input type="submit" name="type" value="Not Interested"  onclick="var i=confirm('Are you sure you want to save the comment?'); if(i==false){return false;}"></td>
            <td><input type="submit" name="type" value="In Process"  onclick="var i =confirm('Are you sure you want to save the comments to payment in process?'); if(i==false){return false;}">
            </td>
            <% End If %>
            <% If rqAction = "followUp" Then %>
            <td><input type="submit" name="type" value="Not Interested"  onclick="var i=confirm('Are you sure you want to save the comment?'); if(i==false){return false;}"></td>
            <% End If %>
            <% If rqAction <> "closed"  Then %>
            <% If rqAction <> "notInterested"  Then %>
			<% If rqAction <> "PayDummy"  Then %>
            <td><input type="submit" name="type" value="Received"  onclick= "var i =confirm('Are you sure you want to save the comments to payment received?'); if(i==false){return false;}"></td>
            <% End If %>
			<% End If %>
            <% End If %>
        </form>
        </tr>
        
      </table></td>
    <% 'If rqAction <> "noFollowUp" Then %>
    <td><iframe src="PayHistory.asp?ID=<% = arrAllRecords(0,rowcounter) %>" frameborder="0" height="100" scrolling="yes" width="200"></iframe></td>
      <%' End If %>
      <% If rqAction = "closed" Then %>
      <td><% = arrAllRecords(13,rowcounter) %></td>
      <% End If %>
      <td><% If arrAllRecords(14,rowcounter) = 1 Then %>
        Payment Declined
        <% ElseIf arrAllRecords(14,rowcounter) = 2 Then %>
        Payment In Process
        <% ElseIf arrAllRecords(14,rowcounter) = 3 Then %>
        Payment Received
        <% ElseIf arrAllRecords(14,rowcounter) = 4 Then %>
        Not Interested
		 <% ElseIf arrAllRecords(14,rowcounter) = 5 Then %>
        Dummy Payment
        <% End If %>
		<br />
		<% If arrAllRecords(14,rowcounter) = 1 Then %>
		<form action="addPayCom.asp" method="post">
		<input type="hidden" name="ID" value="<% = arrAllRecords(0,rowcounter) %>">
		 <input type="hidden" name="action" value="<% = rqAction %>" />
            <input type="submit" name="type" value="Dummy" onclick="var i=confirm('This record will get saved in dummy payment.'); if(i==false){return false;}">
          </form>
		  <% End If %>

      </td>
    </tr>
    <% SrNo = SrNo + 1 %>
    <% Next %>
    <tr id="htMap">
      <td colspan="17"><!--#include virtual="/includes/pagination.asp"-->

<% 
			    ps = getPaginationString(page, (numPageRows + 1), 10, 2, "PayDecline.asp?action="&rqAction&"")
				  Response.Write(ps)
	           %>
<% = ((firstPageRow + 1) & " - " & (lastPageRow + 1) & " of " & (numPageRows + 1)) %>
</td>
</tr>
<% End If %>
</table>
<% End If %>
</td>
</tr>
</table>
</div>
</body>
</html>
