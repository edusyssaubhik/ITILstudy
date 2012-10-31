<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
 'Written By : Bharath'
 'Last UpaDated: 05/01/2009'
 'Description :'
 'Purpose : Add/Edit/Delete Country Details Page'
'======================================================='
%>
<% If not  Session("UserId") = "" Then %>
<!--#include virtual="/india/connection.asp"-->
<%
'======================================================='
 'Declare The Variables'
'======================================================='

 Dim arrAllQueries
 Dim rqType,rqPage,rqRow
 Dim firstRow,lastRow,numRows,rowcounter
 Dim strQuery,viewQuestionNo,i
 Dim rqCityId
 Dim strQuery1,Rs1

 Dim message
 message = Session("message")
 Session("message") = ""

 Set Rs1 = Server.CreateObject("ADODB.Recordset")

'======================================================='
'Retrive The Types in This Page'
'Types Are Add City,Edit City'
'Retrive The page and row Using For Pagination'
'======================================================='

 rqType = Request.Querystring("type")
 rqPage = Request.QueryString("page")
 rqRow  = Request.QueryString("row")

'======================================================='
'Sql Query For Retrive The CityId and City For Displaying'
'And Put Into Array'
'And Do The Paginavigation'
'======================================================='

  strQuery = "SELECT * FROM ITIL_countrydetails WHERE country = '"& Session("country") &"' AND id = (SELECT MAX(id) FROM ITIL_countrydetails WHERE country = '"& Session("country") &"')"

  Rs.Open strQuery,Conn

'======================================================='
'If You Click Edit In city.asp Page That Particular City Dispalyed and You Can Edit That City '
'======================================================='

 If rqtype = "editCountryDetails" Then

   strQuery1 = "SELECT * FROM ITIL_countrydetails WHERE country = '"& Session("country") &"'"

   Rs1.Open strQuery1,Conn

End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title>Country Details</title>
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

//This Validation For Add City

function Form_Validator(theform)
{

var alertsay = "";


 //check to see if the City field is balnk

  if (theform.city.value == "")
  {
     alert("Please Enter The City.");
     theform.city.focus();
     return (false);
  }

  with (theform)
  {

    //check to see if the City field have Numarals

    if (validate_noNumber(city,"Your city Has Numerals")==false)
   	      {city.focus();return false}

    //check to see if the City field have Special Characters

    if (validate_special(city,"City Has Special Characters. \n Please remove them and try again")==false)
 	      {city.focus();return false}

    }
}

//This VAlidation For Edit City

function Form_Validator1(theform)
{

var alertsay = "";


 //check to see if the City field is balnk

  if (theform.editedCity.value == "")
  {
     alert("Please Enter The City.");
     theform.editedCity.focus();
     return (false);
  }

  with (theform)
  {

   //check to see if the City field have Numarals

   if (validate_noNumber(editedCity,"Your city Has Numerals")==false)
   	      {editedCity.focus();return false}

   //check to see if the City field have Special Characters

   if (validate_special(editedCity,"City Has Special Characters. \n Please remove them and try again")==false)
	 	      {editedCity.focus();return false}
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
  <tr>
   <td height="25"><a href="countryDetails.asp?type=addCountryDetails">Add Country Details</a> | <a href="countryDetails.asp?type=editCountryDetails">Edit Country Details</a> </td>
 </tr>
 <!-- If You Click Add Country Details That Comes Here-->
 <% If rqType = "addCountryDetails" Then %>
 <tr>
  <td valign="top">
   <form action="addEditDeleteCountryDetails.asp" method="post" onsubmit="return Form_Validator(this)">
    <table align="center" border="0" width="90%" cellpadding="5">
     <tr>
       <td align="center" colspan="4" height="40" class="h3">Add Country Details</td>
     </tr>
     <tr>
      <td align="right"><b>Country :</b></td>
      <td colspan="3"><input type="hidden" name="<% = Session("country") %>">&nbsp;&nbsp;&nbsp;<% = Session("country") %></td>
     </tr>
	 <tr>
	  <td align="right" width="21%"><b>Phone Number :</b></td>
	  <td width="29%"><input type="text" name="phonenumber"></td>
	  <td align="right"><b>Price Format :</b></td>
	  <td><input type="text" name="currencyformat" /></td>
	 </tr>
	 <tr>
	  <td align="right"><b>ReSchedule1 :</b></td>
	  <td><input type="text" name="reschedule1" /></td>
	  <td align="right"><b>Cancellation1 :</b></td>
	  <td><input type="text" name="cancellation1" /></td>
	 </tr>
	 <tr>
	  <td align="right"><b>ReSchedule2 :</b></td>
	  <td><input type="text" name="reschedule2" /></td>
	  <td align="right"><b>Cancellation2 :</b></td>
	  <td><input type="text" name="cancellation2" /></td>
	 </tr>
	 <tr>
	  <td align="right"><b>ReSchedule3 :</b></td>
	  <td><input type="text" name="reschedule3" /></td>
  	  <td align="right"><b>Cancellation3 :</b></td>
	  <td><input type="text" name="cancellation3" /></td>
	 </tr>
	 <tr>
	  <td align="right"><b>ApplicableDays :</b></td>
	  <td><input type="text" name="applicabledays" /></td>
  	  <td align="right"><b>PMBOK :</b></td>
	  <td><input type="text" name="pmbok" /></td>
	 </tr>
	 <tr>
	  <td align="right"><b>ClassroomCourse Phone Number1 :</b></td>
	  <td><input type="text" name="classphmum1" /></td>
  	  <td align="right"><b>ClassroomCourse Phone Number2 :</b></td>
	  <td><input type="text" name="classphmum2" /></td>
	 </tr>
	 <tr>
	  <td align="right"><b>Payment Option1 :</b></td>
	  <td><input type="text" name="payopt1"></td>
  	  <td align="right"><b>Payment Option2 :</b></td>
	  <td><input type="text" name="payopt2"></td>
	 </tr>
	 <tr>
	  <td align="right"><b>Price :</b></td>
	  <td><input type="text" name="price"></td>
  	  <td align="right"><b>EarlyBird Discount :</b></td>
	  <td><input type="text" name="ebdiscount"></td>
	 </tr>
	 <tr>
	  <td align="right"><b>After EarlyBird Discount Price :</b></td>
	  <td><input type="text" name="afterEBDiscountPrice" /></td>
  	  <td align="right"><b>Tax :</b></td>
	  <td><input type="text" name="tax"></td>
	 </tr>
	 <tr>
	  <td align="right"><b>Start Time :</b></td>
	  <td><input type="text" name="starttime" /></td>
  	  <td align="right"><b>End Time :</b></td>
	  <td><input type="text" name="endtime" /></td>
	 </tr>     
	 <tr>
	  <td align="right"><b>OnlineCourse Phone Number :</b></td>
	  <td colspan="3"><input type="text" name="onlinephnum"</td>
	 </tr>
	 <tr>
      <td align="right" valign="top"><b>Payments :</b></td>
      <td valign="top" colspan="3">&nbsp;&nbsp;&nbsp;<textarea name="payments" rows="6" cols="50"></textarea></td>
     </tr>
	 <tr>
	  <td align="right" valign="top"><b>Payments After Enroll :</b></td>
	  <td valign="top" colspan="3">&nbsp;&nbsp;&nbsp;<textarea name="paymentsafterenroll" rows="6" cols="50"></textarea></td>
	 </tr>
	 <tr>
      <td align="right" valign="top"><b>Address :</b></td>
      <td valign="top" colspan="3">&nbsp;&nbsp;&nbsp;<textarea name="address" rows="6" cols="50"></textarea></td>
     </tr>
    <tr>
     <td>&nbsp;</td>
     <td colspan="3" align="left">
      <input type="submit" name="type" value="Add Country Details" class="buttonc">
     </td>
    </tr>
   </table>
  </form>
  </td>
 </tr>
 <% End If %>
 <!-- Add City IF Condition Closed Here -->
 <!-- If You Click Edit That Comes Here -->
 <% If rqtype = "editCountryDetails" Then %>
    <tr>
     <td>
       <form action="addEditDeleteCountryDetails.asp" method="post" onsubmit="return Form_Validator1(this)">
		<table align="center" border="0">
	     <tr>
		  <td align="center" colspan="4" height="40" class="h3">Edit Country Details</td>
         </tr>
		 <% Do Until Rs1.EOF %>
		 <input type="hidden" name="id" value="<% = Rs1("id") %>">
		 <tr>
		  <td align="right"><b>Country :</b></td>
		  <td colspan="3"><input type="hidden" name="<% = Session("country") %>">&nbsp;&nbsp;&nbsp;<% = Session("country") %></td>
		 </tr>
		 <tr>
		  <td align="right" width="24%"><b>Phone Number :</b></td>
		  <td width="12%"><input type="text" name="phonenumber" value="<% = Rs1("phonenumber") %>"></td>
		  <td align="right" width="21%"><b>Price Format :</b></td>
		  <td width="20%"><input type="text" name="currencyformat" value="<% = Rs1("currencyformat") %>"></td>
		 </tr>
		 <tr>
		  <td align="right"><b>ReSchedule1 :</b></td>
		  <td><input type="text" name="reschedule1" value="<% = Rs1("reschedule1") %>"></td>
		  <td align="right"><b>Cancellation1 :</b></td>
		  <td><input type="text" name="cancellation1" value="<% = Rs1("cancellation1") %>"></td>
		 </tr>
		 <tr>
		  <td align="right"><b>ReSchedule2 :</b></td>
		  <td><input type="text" name="reschedule2" value="<% = Rs1("reschedule2") %>"></td>
		  <td align="right"><b>Cancellation2 :</b></td>
		  <td><input type="text" name="cancellation2" value="<% = Rs1("cancellation2") %>"></td>
		 </tr>
		 <tr>
		  <td align="right"><b>ReSchedule3 :</b></td>
		  <td><input type="text" name="reschedule3" value="<% = Rs1("reschedule3") %>"></td>
		  <td align="right"><b>Cancellation3 :</b></td>
		  <td><input type="text" name="cancellation3" value="<% = Rs1("cancellation3") %>"></td>
		 </tr>
		 <tr>
		  <td align="right"><b>ApplicableDays :</b></td>
		  <td><input type="text" name="applicabledays" value="<% = Rs1("applicabledays") %>"></td>
		  <td align="right"><b>PMBOK :</b></td>
		  <td><input type="text" name="pmbok" value="<% = Rs1("pmbok") %>"></td>
		 </tr>
		 <tr>
		  <td align="right"><b>ClassroomCourse Phone Number1 :</b></td>
		  <td><input type="text" name="classphmum1" value="<% = Rs1("classroomcourse_phno1") %>"></td>
		  <td align="right"><b>ClassroomCourse Phone Number2 :</b></td>
		  <td><input type="text" name="classphmum2" value="<% = Rs1("classroomcourse_phno2") %>"></td>
		 </tr>
		 <tr>
		  <td align="right"><b>OnlineCourse Phone Number :</b></td>
		  <td colspan="3"><input type="text" name="onlinephnum" value="<% = Rs1("onlinecourse_phno") %>"></td>
		 </tr>
		 <tr>
		  <td align="right"><b>Payment Option1 :</b></td>
		  <td><input type="text" name="payopt1" value="<% = Rs1("PayOpt1") %>"></td>
		  <td align="right"><b>Payment Option2 :</b></td>
		  <td><input type="text" name="payopt2" value="<% = Rs1("PayOpt2") %>"></td>
		 </tr>
         <tr>
          <td align="right"><b>Price :</b></td>
          <td><input type="text" name="price" value="<% = Rs1("price") %>" /></td>
          <td align="right"><b>EarlyBird Discount :</b></td>
          <td><input type="text" name="ebdiscount" value="<% = Rs1("ebdiscount") %>" /></td>
         </tr>
         <tr>
          <td align="right"><b>After EarlyBird Discount Price :</b></td>
          <td><input type="text" name="afterEBDiscountPrice" value="<% = Rs1("afterEBDiscountPrice") %>" /></td>
          <td align="right"><b>Tax :</b></td>
          <td><input type="text" name="tax" value="<% = Rs1("tax") %>" /></td>
         </tr>
         <tr>
          <td align="right"><b>Start Time :</b></td>
          <td><input type="text" name="starttime" value="<% = Rs1("starttime") %>" /></td>
          <td align="right"><b>End Time :</b></td>
          <td><input type="text" name="endtime" value="<% = Rs1("endtime") %>" /></td>
         </tr>              
		 <tr>
		  <td align="right" valign="top"><b>Payments :</b></td>
		  <td valign="top" colspan="3">&nbsp;&nbsp;&nbsp;<textarea name="payments" rows="6" cols="50"><% = Rs("payments") %></textarea></td>
		 </tr>
		 <tr>
		  <td align="right" valign="top"><b>Payments After Enroll :</b></td>
		  <td valign="top" colspan="3">&nbsp;&nbsp;&nbsp;<textarea name="paymentsafterenroll" rows="6" cols="50"><% = Rs("paymentsafterenroll") %></textarea></td>
		 </tr>
		 <tr>
		  <td align="right" valign="top"><b>Address :</b></td>
		  <td valign="top" colspan="3">&nbsp;&nbsp;&nbsp;<textarea name="address" rows="6" cols="50"><% = Rs("address") %></textarea></td>
		 </tr>
		<% Rs1.Movenext
		   Loop %>
		  </tr>
		<tr>
		 <td>&nbsp;</td>
		 <td colspan="3" align="left">
		  <input type="submit" name="type" value="Edit Country Details" class="buttonc">
		 </td>
		</tr>
		  <tr>
		    <td>&nbsp;</td>
		  </tr>
         </table>
        </td>
      </tr>
   <% End If %>
 <!-- Edit If Condition Closed Here-->
  <% If rqtype = "" Then %>
 <!-- Displaying The All Cities Here -->
 <tr height="490">
  <td valign="top">
   <table border="0" align="center" width="90%" cellspacing="5" cellpadding="2">
	     <tr>
		  <td align="center" colspan="4" height="40" class="h3">View Country Details</td>
         </tr>
		 <% Do Until Rs.EOF %>
		 <tr>
		  <td align="right"><b>Country :</b></td>
		  <td colspan="3">&nbsp;&nbsp;&nbsp;<% = Session("country") %></td>
		 </tr>
		 <tr>
		  <td align="right" width="24%"><b>Phone Number :</b></td>
		  <td width="29%"><% = Rs("phonenumber") %></td>
		  <td align="right"><b>Price Format :</b></td>
		  <td><% = Rs("currencyformat") %></td>
		 </tr>
		 <tr>
		  <td align="right"><b>ReSchedule1 :</b></td>
		  <td><% = Rs("reschedule1") %></td>
		  <td align="right"><b>Cancellation1 :</b></td>
		  <td><% = Rs("cancellation1") %></td>
		 </tr>
		 <tr>
		  <td align="right"><b>ReSchedule2 :</b></td>
		  <td><% = Rs("reschedule2") %></td>
		  <td align="right"><b>Cancellation2 :</b></td>
		  <td><% = Rs("cancellation2") %></td>
		 </tr>
		 <tr>
		  <td align="right"><b>ReSchedule3 :</b></td>
		  <td><% = Rs("reschedule3") %></td>
		  <td align="right"><b>Cancellation3 :</b></td>
		  <td><% = Rs("cancellation3") %></td>
		 </tr>
		 <tr>
		  <td align="right"><b>ApplicableDays :</b></td>
		  <td><% = Rs("applicabledays") %></td>
		  <td align="right"><b>PMBOK :</b></td>
		  <td><% = Rs("pmbok") %></td>
		 </tr>
		 <tr>
		  <td align="right"><b>ClassroomCourse Phone Number1 :</b></td>
		  <td><% = Rs("classroomcourse_phno1") %></td>
		  <td align="right"><b>ClassroomCourse Phone Number2 :</b></td>
		  <td><% = Rs("classroomcourse_phno2") %></td>
		 </tr>
		 <tr>
		  <td align="right"><b>OnlineCourse Phone Number :</b></td>
		  <td colspan="3"><% = Rs("onlinecourse_phno") %></td>
		 </tr>
		 <tr>
		  <td align="right"><b>Payment Option1 :</b></td>
		  <td><% = Rs("PayOpt1") %></td>
		  <td align="right"><b>Payment Option2 :</b></td>
		  <td><% = Rs("PayOpt2") %></td>
		 </tr>
         <tr>
          <td align="right"><b>Price :</b></td>
          <td><% = Rs("price") %></td>
          <td align="right"><b>EarlyBird Discount :</b></td>
          <td><% = Rs("ebdiscount") %></td>
         </tr>
         <tr>
          <td align="right"><b>After EarlyBird Discount Price :</b></td>
          <td><% = Rs("afterEBDiscountPrice") %></td>
          <td align="right"><b>Tax :</b></td>
          <td><% = Rs("tax") %></td>
         </tr>   
         <tr>
          <td align="right"><b>Start Time :</b></td>
          <td><% = Rs("starttime") %></td>
          <td align="right"><b>End Time :</b></td>
          <td><% = Rs("endtime") %></td>
         </tr>                  
		 <tr>
		  <td align="right" valign="top"><b>Payments :</b></td>
		  <td valign="top" colspan="3"><% = Rs("payments") %></td>
         </tr>
		 <tr>
		  <td align="right" valign="top"><b>Payments After Enroll :</b></td>
		  <td valign="top" colspan="3"><% = Rs("paymentsafterenroll") %></td>
		 </tr>
		 <tr>
		  <td align="right" valign="top"><b>Address :</b></td>
		  <td valign="top" colspan="3"><% = Rs("address") %></td>
		 </tr>
		<% Rs.Movenext
		   Loop %>
  </table>
 </td>
</tr>
<% End If %>
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