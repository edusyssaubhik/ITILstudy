<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 'Written By : Bharath'
 'Last UpaDated: 02/11/2007'
 'Description :'
 'Purpose : Add/Edit/Delete Location Page'
%>
<% If not  Session("UserId") = "" Then %>
<!--#include virtual="/india/connection.asp"-->
<%
'======================================================='
 'Declare The Variables'
'======================================================='

 Dim arrAllQueries
 Dim rqType,rqPage,rqRow,arrAllRecords
 Dim firstRow,lastRow,numRows,rowcounter
 Dim cityfirstRow,citylastRow,citynumRows,cityrowcounter
 Dim strQuery,strQuery1,viewQuestionNo,i

 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs2 = Server.CreateObject("ADODB.Recordset")

'======================================================='
'Retrive The Types in This Page'
'Types Are Add City,Edit City'
'Retrive The page and row Using For Pagination'
'======================================================='

 rqtype = Request.Querystring("type")
 rqPage = Request.QueryString("page")
 rqRow = Request.QueryString("row")

 Dim message
 message = Session("message")
 Session("message") = ""

'======================================================='
'Sql Query For Retrive The City Ids And Cities From City Table'
'And put Into Array'
'And Do The Paginavigation'
'This Retriving Cities Dispaly in the DropDown Box'
'======================================================='

  strQuery = "SELECT cityid,city FROM ITIL_city where country = '"& Session("country") &"'"

  Rs.Open strQuery,Conn

    If Not Rs.EOF Then
       arrAllRecords = Rs.getrows
       Session("arrAllRecords") = arrAllRecords
       numRows = Ubound(arrAllRecords,2)
       cityfirstRow = 0
	   citylastRow = numRows
   End If

	
  strQuery1 = "select locationid,city,location,country from ITIL_location  where country = '"& Session("country") &"' order by locationid desc"
 
  Rs1.Open strQuery1,Conn

   If Not Rs1.EOF Then
     arrAllQueries = Rs1.getrows
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

'======================================================='
'If You Click Edit In location.asp Page this Query run'
'This Query Retrive The locationid,city,location based User Selects that Location'
'And Dipaying In Edit Location'
'======================================================='

 If rqtype = "edit" Then

   Dim rqLocationId
   Dim strQuery2,Rs2,Rs1

   rqLocationId = Request.Querystring("locationId")

   strQuery2 = "SELECT locationid,city,location FROM ITIL_location WHERE locationid = '" & rqLocationId & "'"

   Rs2.Open strQuery2,Conn

End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title>Cities</title>
 <link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
<script language="javascript">
function validate_noNumber(field,alerttxt)
{
	var iChars = "0123456789";

	with (field)
	{
		for (var i = 0; i < value.length; i++) {
		  	if ((iChars.indexOf(value.charAt(i)) != -1)) {
		  	alert (alerttxt);
		  	return false;
		  	}
		}
	}
}

 function validate_special(field,alerttxt)
 {
 	var iChars = "!#$%^&*@()+=-[]\\\';,{}|\":<>?";

 	with (field)
 	{
 		for (var i = 0; i < value.length; i++) {
 		  	if (iChars.indexOf(value.charAt(i)) != -1) {
 		  	alert (alerttxt);
 		  	return false;
 		  	}
 		}
 	}
 }

//This Validation For Add Location

function Form_Validator(theform)
{

var alertsay = "";


 //check to see if the City field is Selected Or Not

  if (theform.city.value == "")
  {
     alert("Please Select The City.");
     theform.city.focus();
     return (false);
  }

 //check to see if the Location field is Blank

  if (theform.location.value == "")
  {
     alert("Please Enter The Location.");
     theform.location.focus();
     return (false);
  }

  with (theform)
  {

  //check to see if the Location field have Numerals

   if (validate_noNumber(location,"Location Has Numerals")==false)
  	      {location.focus();return false}

 //check to see if the Location field have special Characters

   if (validate_special(location,"Location Has Special Characters. \n Please remove them and try again")==false)
   	      {location.focus();return false}

   }
}


//This Validation For Edit Location

function Form_Validator1(theform)
{

var alertsay = "";

//check to see if the City field is Selected Or Not

  if (theform.city.value == "")
  {
     alert("Please Select The City.");
     theform.city.focus();
     return (false);
  }

 //check to see if the Location field is blank

      if (theform.updateLocation.value == "")
      {
         alert("Please Enter The Location.");
         theform.updateLocation.focus();
         return (false);
      }

      with (theform)
      {

      //check to see if the Location field have Numerals

       if (validate_noNumber(updateLocation,"Location Has Numerals")==false)
       	      {updateLocation.focus();return false}

     //check to see if the Location field have Special Characters

       if (validate_special(updateLocation,"Location Has Special Characters. \n Please remove them and try again")==false)
     	      {updateLocation.focus();return false}

      }
}

</script>
</head>
<body><div id="htMap">
<table border="1" height="550" class="dbborder" width="1000px" cellspacing="0">
 <tr>
   <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% =Session("country") %></span> PMstudy Back Office</font></div>
 </tr>
 <tr>
  <td width="100" valign="top" rowspan="22">
    <!--#include file="leftMenu.html"-->
  </td>
 </tr>
  <tr>
   <td height="25"><a href="location.asp?type=addLocation">Add Location</a></td>
 </tr>
 <!--if you click Add Location That Will Come Here -->
 <% If rqType = "addLocation" Then %>
 <tr>
  <td height="200">
   <form action="addEditDeleteLocation.asp" method="post" onsubmit="return Form_Validator(this)">
    <table align="center" border="0" cellspacing="15">
     <tr>
       <td align="center" colspan="4" height="40" class="h3">Add Location</td>
     </tr>
     <tr>
      <td width="80px"><b>City :</b></td>
      <td width="80px">&nbsp;&nbsp;
        <select name="city">
         <option value="">--Select--</option>
         <% If IsArray(arrAllRecords) Then
            For cityrowcounter = cityfirstRow to citylastRow %>
         <option value="<% = arrAllRecords(1,cityrowcounter) %>"><% = arrAllRecords(1,cityrowcounter) %></option>
         <% Next
          End If %>
         </select>
      </td>
     <tr>
      <td width="20px" align="left"><b>Location :</b></td>
      <td width="80px" align="left"><input type="text" name="location"></td>
     </tr>
    <tr>
     <td></td>
     <td align="right">
      <input type="submit" name="addloc" value="Add Location" class="buttonc">
     </td>
    </tr>
    <tr>
	 <td colspan="2" align="center"><font face="Arial" size="2" color="orangered"><%=message%></font></td>
    </tr>
   </table>
  </form>
  </td>
 </tr>
 <% End If %>
 <!-- Add Location If Condition Closed Here -->
 <!--if you click Edit That Will Come Here -->
 <% If rqtype = "edit" Then %>
 <tr>
  <td height="200">
	<form action="addEditDeleteLocation.asp" method="post" onsubmit="return Form_Validator1(this)"	>
	<table align="center" border="0" cellspacing="15">
	 <% do until Rs2.EOF %>
     <tr>
       <td align="center" colspan="4" height="40" class="h3">Edit Location</td>
     </tr>
	 <tr>
	  <td width="80px"><b>City:</b></td>
	  <td width="80px">&nbsp;&nbsp;
		<select name="city">
		 <option value="<% = Rs2("city") %>"><% = Rs2("city") %></option>
		 <option value="" disabled="disabled">--Select--</option>
		 <% If IsArray(arrAllRecords) Then
			For cityrowcounter = cityfirstRow to citylastRow %>
			<option value="<% = arrAllRecords(1,cityrowcounter) %>"><% = arrAllRecords(1,cityrowcounter) %></option>
		 <% Next
			End If %>
		 </select>
	   </td>
	  <tr>
	   <td width="20px" align="left"><b>Location</b></td>
	 	 <input type="hidden" name="updateLocationId" value="<% = Rs2("locationid") %>">
	   <td width="80px"><input type="text" name="updateLocation" value="<% = Rs2("location") %>"></td>
		<% Rs2.Movenext
		   Loop %>
	  </tr>
	  <tr>
		<td colspan="2" align="right">
		  <input type="submit" name="editloc" value="Edit Location" class="buttonc">
		 </td>
		</tr>
	  </table>
	 </td>
	</tr>
     <% End If %>
	<!-- Edit If Condition Closed Here -->
	<!-- Displaying All The Locations Here -->
    <tr>
     <td valign="top" height="490">
      <table border="1" align="center" width="300px" cellspacing="0" cellpadding="2">
        <tr height="25">
         <td bgcolor="#A7DBFB" align="center"><b>Country</b></td>
		 <td bgcolor="#A7DBFB" align="center"><b>City</b></td>
         <td bgcolor="#A7DBFB" align="center"><b>Location</b></td>
         <td bgcolor="#A7DBFB" align="center"><b>Edit</b></td>
         <td bgcolor="#A7DBFB" align="center"><b>Delete</b></td>
        </tr>
        <% If IsArray(arrAllQueries) Then
           FOR rowcounter = firstrow to lastrow %>
        <tr>
         <input type="hidden"  name="locationId"  value="<% = arrAllQueries(0,rowcounter) %>">
         <td><% = arrAllQueries(3,rowcounter) %></td>
		 <td><% = arrAllQueries(1,rowcounter) %></td>
         <td><% = arrAllQueries(2,rowcounter) %></td>
         <td align="center"><a href="location.asp?type=edit&locationid=<% = arrAllQueries(0,rowcounter)%>">Edit</a></td>
         <td align="center"><a href="addEditDeleteLocation.asp?deleteLocation=<% = arrAllQueries(0,rowcounter)%>">Delete</a></td>
        </tr>
        <% Next %>
              <tr>
		       <td colspan="8">
		       <% If Not firstRow = 0 Then %>
		          <a href="location.asp?type=editOrDelete&page=previous&row=<% = firstRow %>"> &lt;&lt;Previous</a>
		       <% End If %>
		       <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
		       <% If Not numRows = lastRow Then %>
		          <a href="location.asp?type=editOrDelete&page=next&row=<% = lastRow %>"> &gt;&gt;Next</a>
		       <% End If %>
		       </td>
		     </tr>
	         <tr>
	          <td colspan="5" align="center"><font face="Arial" size="2" color="orangered"><%=message%></font></td>
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
 Rs.Close
 Set Rs = Nothing
 Rs1.Close
 Conn.Close
 Set Conn = Nothing
 Else
 Response.Redirect("../login.asp")
 End If
%>