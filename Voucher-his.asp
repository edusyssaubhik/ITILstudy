<html>
<head>
<title>Voucher History</title>
<script language="javascript">
function validate_form(thisform)
{
     //validations for faculty selected or not
	 if (thisform.faculty.selectedIndex =="")
	   {
		 alert("Please Select the Faculty");
		 thisform.faculty.focus();
		 return (false);
	   }
}	   
</script>	
<script language="javascript" type="text/javascript">
<!--

function popitup(url) {
	newwindow=window.open(url,'name','toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=0,minimizable=0,resizable=0,height=300,width=300,top=250,left=400');
	if (window.focus) {newwindow.focus()}
	return false;
}

// -->
<!--  PROJstudy -->
</script>   
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
</body>

<!--#include virtual="/includes/connectionRef.asp"-->
<!--#include virtual="/includes/connection.asp"-->
<% 
'Written By : Praveen'
'Created Date: 19/04/2010'
'Last Updated Date: 20/04/2010'
'Description : creating a page to display payment history'
'Purpose : To keep the history of all the records'

'Declring the variables
Dim strQuery, objRs, objRs1, strQuery2
Dim rqfaculty, objRs4, facName, PayId

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
Set objRs2 = Server.CreateObject("ADODB.Recordset")
Set objRs4 = Server.CreateObject("ADODB.Recordset")



	rqRefID = Request.QueryString("RefID")


strQuery = "SELECT Name, RefID, Points FROM Ref_Account WHERE RefID = '"&rqRefID&"'"
			
objRs1.Open strQuery,ConnObjRef

If NOT objRs1.EOF Then

RqName = objRs1("Name")
RqPoints = objRs1("Points")

End If

'Retrive the faculty email id'

 strQuery="select * from Ref_Enrollments WHERE RefID = '"&rqRefID&"'"

objRs.open strQuery ,ConnObjRef


%>

<div align="left" style="margin-left:20px;">
<h2>Points gained history</h2>

<table border="1" class="table1" width="95%" cellpadding="3" cellspacing="0">
  <tr>
    <td><b>Refrral Name</b></td>
    <td><b>Referred Name</b></td>
    <td><b>Referred Email</b></td>
    <td><b>Status</b></td>
    <td><b>Course Type</b></td>
    <td><b>Amount Paid</b></td>
    <td><b>Points</b></td>
  </tr>
  <% Do Until objRs.EOF %>
  <tr>
    <td><% = RqName %></td>
    <td><% = objRs("ReferredName") %></td>
    <td><% = objRs("ReferredEmail") %></td>
    <% 
		If objRs("EnrollStatus") = 1 Then
		
		RqStatus = "Enrolled"
		
		ElseIf objRs("EnrollStatus") = 2 Then
		
		RqStatus = "Enrolled and Paid"
		
		End If
	 %>
    <td><% = RqStatus %></td>
    <td><% =  objRs("CourseType") %></td> 
    
    <% If objRs("EnrollStatus") = 2 Then
	
		strQuery2="select amount from ITIL_enrolledusers WHERE id = '"& objRs("EnrollId") &"'"
		
		objRs2.open strQuery2 ,ConnObj
		If NOT objRs2.EOF Then
		RqAmount = objRs2("amount")
		End If
		objRs2.Close
	Else
	RqAmount = "Not paid"
	End If	
	
	 %>
    <td><% = RqAmount %></td>
    <td><% = objRs("Points") %></td>
   </tr>
  <% objRs.Movenext
	 Loop
	 objRs.Close  %>
</table>
</div>




<div align="left" style="margin-left:20px;">
<h2>Points used history </h2>

<table border="1" class="table1" width="95%" cellpadding="3" cellspacing="0">
  <tr>
    <td><b>Refrral Name</b></td>
    <td><b>Voucher</b></td>
    <td><b>Used Points</b></td>
    <td><b>Used On </b></td>
  </tr>
  <%
  
  
strQuery="select * from Ref_Voucher WHERE RefID = '"&rqRefID&"'"
'response.Write(strQuery)
objRs4.open strQuery ,ConnObjRef
  
   Do Until objRs4.EOF %>
  <tr>
    <td><% = RqName %></td>
    <td><% = objRs4("Voucher") %></td>
    <td><% = objRs4("UsedPoints") %></td>
    <td><% = objRs4("VUsedDate") %></td>
    
   </tr>
  <% objRs4.Movenext
	 Loop
	 objRs4.Close %>
</table>
</div>


<pre>



</pre>
</html>
