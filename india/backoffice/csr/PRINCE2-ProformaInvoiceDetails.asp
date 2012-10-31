<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Bharath'
'Created Date : 17/02/2012'
'Modified By : Bharath'
'Modified Date : 17/02/2012'
'Description :'
'Purpose : Add/Edit/proformaInvoice Page'
'======================================================='
%>
<% If not  Session("UserId") = "" Then %>
<!--#include virtual="/India/connection_global.asp"-->
<%
'======================================================='
 'Declare The Variables'
'======================================================='

 Dim arrAllQueries,str, Rs
 Dim rqCourseName,rqEnddate ,rqCity
 Dim rqType,rqPage,rqRow
 Dim firstRow,lastRow,numRows,rowcounter
 Dim strQuery,viewQuestionNo,i
 Dim rqEnrollUserId,enrollUserId,PICourse
 Dim strQuery1,Rs1,priceAfterDiscount,priceWithTax,total
 Dim rqDicounttext,rqDiscountType,rqStartDate

 Dim message
 message = Session("message")
 Session("message") = ""

Set Rs1 = Server.CreateObject("ADODB.Recordset")
Set Rs = Server.CreateObject("ADODB.Recordset")
'======================================================='
'Retrive The Types in This Page'
 
'======================================================='

 rqType = Request.Querystring("type")
 rqEnrollUserId = Request.Querystring("enrollUserId")

'======================================================='
'Sql Query For Retrive The CityId and City For Displaying'
'And Put Into Array'
'And Do The Paginavigation'
'======================================================='

  strQuery = "select * from prince2_enrolledusers where id =  '" & rqEnrollUserId & "'"
  Rs.Open strQuery,ConnObj

   If Not Rs.EOF Then
     arrAllQueries = Rs.getrows
   End If
    
	 If IsArray(arrAllQueries) Then
	   'FOR rowcounter = firstrow to lastrow 
   rqCourseId  		= arrAllQueries(20,rowcounter)
   'next
	end if  
   
   strQuery1 = "select startdate,enddate,city,courseName,pricewithouttax,tax,startdate from prince2_course where courseid =  '" & rqCourseId & "'"

   Rs1.Open strQuery1,ConnObj
   
   Dim rqTax,rqPriceWithOutTax
   do while not Rs1.EOF
		   rqStartdate = Rs1("startdate")
		   rqEnddate = Rs1("enddate")
		   rqCity = Rs1("city")
		   rqCourseName = Rs1("courseName")
		   rqTax = Rs1("tax")
		   rqPriceWithOutTax = Rs1("pricewithouttax")
		   rqStartDate = Rs1("startdate")
	Rs1.movenext
	loop
'======================================================='
'If You Click Edit In city.asp Page That Particular City Dispalyed and You Can Edit That City '
'======================================================='

 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title>Proforma Invoice</title>
<link href="/India/css/pagestyle.css" rel="stylesheet" type="text/css">
 <script language ="javascript">
 
  function Form_Validate()
  {
  	var dt = document.proformaInvoiceDetails.iddiscountText.value;
	if (dt == "" )
		{
		alert("Please Enter Discount.")
		document.proformaInvoiceDetails.iddiscountText.focus();
		return (false);
		}
	
	var tot = document.proformaInvoiceDetails.total.value;
	if (tot == "" )
		{
		alert("Please Select Discount Type or PMBOK.")
		document.proformaInvoiceDetails.total.focus();
		return (false);
		}
		
	var discounttype = document.proformaInvoiceDetails.discountType.value;
	if (discounttype == "Lumpsum")
	{
		var discounttypeLumpsum =  document.proformaInvoiceDetails.discountText.value;
		var piamount = document.proformaInvoiceDetails.PIAmount.value;
		//document.write(piamount)
		//document.write(discounttypeLumpsum)
		
		if (discounttypeLumpsum >= parseInt(piamount)) 
		{
			alert("Lumpsum must be lessthan or equal to Amount");


			document.proformaInvoiceDetails.discountText.focus();
			return(false);
		}
	}
	else if (discounttype == "Percentage")
	{
		var per = document.proformaInvoiceDetails.discountText.value;
		if (per > 100) 
		{
			alert("Percentage must be lessthan or equal to 100");
			document.proformaInvoiceDetails.discountText.focus();
			return(false);
		}
	}
	
	}

//Calculating The Taxes And Dicounts


function calculate() { 

    var piamount = document.proformaInvoiceDetails.PIAmount.value;
	var discounttype = document.proformaInvoiceDetails.discountType.value;
	var rqtax = document.proformaInvoiceDetails.rqTax.value ;
		
	if (discounttype == "Lumpsum")
	{
		var discounttypeLumpsum =  document.proformaInvoiceDetails.discountText.value;
		//document.write(discounttypeLumpsum)
		//document.write(piamount)
		if (discounttypeLumpsum < 0)  
		{
			alert("Lumpsum must be a positive number");
			document.proformaInvoiceDetails.discountText.focus();
			return(false);
		}
		if (discounttypeLumpsum > parseInt(piamount))  
		{
			alert("Lumpsum must be lessthan or equal to Amount");
			document.proformaInvoiceDetails.discountText.focus();
			return(false);
		}
				
		
		var priceafterdiscount = Math.ceil(piamount) - Math.ceil(discounttypeLumpsum)
		
		var z = Math.ceil(( priceafterdiscount / 100) * rqtax )

		var pricewithtax = Math.ceil(priceafterdiscount) + Math.ceil(z) 
	}
	else if (discounttype == "Percentage")
	{
		var pipercentage =  document.proformaInvoiceDetails.discountText.value / 100   ;
		var per = document.proformaInvoiceDetails.discountText.value;
		
		if (per < 0) 
		{
			alert("Percentage must be a positive number.");
			document.proformaInvoiceDetails.discountText.focus();
			return(false);
		}
		if (per > 100) 
		{
			alert("Percentage must be lessthan or equal to 100");
			document.proformaInvoiceDetails.discountText.focus();
			return(false);
		}	
		
		var x = (piamount * pipercentage);
		var priceafterdiscount = Math.ceil(piamount) - Math.ceil(x)
	
		var z = ( priceafterdiscount / 100) * rqtax 
		var pricewithtax = Math.ceil(priceafterdiscount) +  Math.ceil(z) 
	}
 
	var pmbok = document.proformaInvoiceDetails.PIPMBOK.value;
    var Country = 'United Kingdom';
	var Country1 = 'India'
	var Country2 = 'Australia'
	
   if (!isNaN(priceafterdiscount) &&
        (priceafterdiscount != Number.POSITIVE_INFINITY) &&
        (priceafterdiscount != Number.NEGATIVE_INFINITY)) {

        document.proformaInvoiceDetails.priceAfterDiscount.value = Math.ceil(priceafterdiscount);

    }

    else {
        document.proformaInvoiceDetails.priceAfterDiscount.value = "";
       }

    if (!isNaN(pricewithtax) &&
        (pricewithtax != Number.POSITIVE_INFINITY) &&
        (pricewithtax != Number.NEGATIVE_INFINITY)) {

        document.proformaInvoiceDetails.priceWithTax.value = Math.ceil(pricewithtax);

    }

    else {
        document.proformaInvoiceDetails.priceWithTax.value = "";
       }

	if (pmbok == "Yes")
		{
		 if (document.proformaInvoiceDetails.PIPMBOKValue.value == 0 )
		 {
		  
		  if (Country == "<% = Session("country") %>")
		  {
			document.proformaInvoiceDetails.PIPMBOKValue.value = 55;
		  }
		  
		  else if (Country1 == "<% = Session("country") %>")
		  {
		 	document.proformaInvoiceDetails.PIPMBOKValue.value = 5000;
          }
		  
		  else if (Country2 == "<% = Session("country") %>")
		  {
		 	document.proformaInvoiceDetails.PIPMBOKValue.value = 0;
          }
		  
		 }
		 else if (document.proformaInvoiceDetails.PIPMBOKValue.value >= 0)
		 {
			var PMBOKprice = document.proformaInvoiceDetails.PIPMBOKValue.value;
		 }
		}
	else if (pmbok == "No") 
		{
	
			document.proformaInvoiceDetails.PIPMBOKValue.value = 0;
		}	 
		 
		 var pmbok = document.proformaInvoiceDetails.PIPMBOK.value;
        var Country = 'United Kingdom';
	    var Country1 = 'India'
	    var Country2 = 'Australia'
		 
		 if (Country == "<% = Session("country") %>")
		 {
	if (pmbok == "Yes")
		{
		    var pmbokvalue = document.proformaInvoiceDetails.PIPMBOKValue.value;
			var b = Math.ceil(priceafterdiscount) + Math.ceil(pmbokvalue)
			var c = Math.ceil(( b / 100) * rqtax )

		var e = Math.ceil(b) + Math.ceil(c)
		 
			document.proformaInvoiceDetails.total.value = round(e);
		}
	else if (pmbok == "No") 
		{
		    var pmbokvalue = document.proformaInvoiceDetails.PIPMBOKValue.value;
			var b = parseInt(pricewithtax)
			document.proformaInvoiceDetails.total.value = Math.ceil(b);
		}
		
		}
		else if (Country1 = "<% = Session("country") %>")
		 {
	if (pmbok == "Yes")
		{
		    var pmbokvalue = document.proformaInvoiceDetails.PIPMBOKValue.value;
			var b = parseInt(priceafterdiscount) + parseInt(pmbokvalue)
			var c = Math.ceil(( b / 100) * rqtax )

		var e = Math.ceil(b) + Math.ceil(c)
		 
			document.proformaInvoiceDetails.total.value = Math.ceil(e);
		}
	else if (pmbok == "No") 
		{
		    var pmbokvalue = document.proformaInvoiceDetails.PIPMBOKValue.value;
			var b = parseInt(pricewithtax)
			document.proformaInvoiceDetails.total.value = Math.ceil(b);
		}
				
		
		}
		
		else if (Country2 = "<% = Session("country") %>")
		 {
	if (pmbok == "Yes")
		{
		    var pmbokvalue = document.proformaInvoiceDetails.PIPMBOKValue.value;
			var b = Math.ceil(pricewithtax) + Math.ceil(pmbokvalue)
			document.proformaInvoiceDetails.total.value = round(b);
		}
	else if (pmbok == "No") 
		{
		    var pmbokvalue = document.proformaInvoiceDetails.PIPMBOKValue.value;
			var b = parseInt(pricewithtax)
			document.proformaInvoiceDetails.total.value = Math.ceil(b);
		}
		
		}
}




// This simple method rounds a number to two decimal places.
function round(x) {
  return Math.ceil(x*100)/100;
}

function round(b) {
  return Math.ceil(b*100)/100;
}
 function round(pricewithtax) {
  return Math.ceil(pricewithtax*100)/100;
}
function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
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

 function validate_number(field,alerttxt)
 {
 	var iChars = "0123456789";

 	with (field)
 	{
 		for (var i = 0; i < value.length; i++) {
 		  	if (!(iChars.indexOf(value.charAt(i)) != -1)) {
 		  	alert (alerttxt);
 		  	return false;
 		  	}
 		}
 	}
 }

 function validate_number1(field,alerttxt)
 {
 	var iChars = "0123456789.";

 	with (field)
 	{
 		for (var i = 0; i < value.length; i++) {
 		  	if (!(iChars.indexOf(value.charAt(i)) != -1)) {
 		  	alert (alerttxt);
 		  	return false;
 		  	}
 		}
 	}
 }
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
</script>
</head>
<body><div id="htMap">
<table border="1" height="550" cellspacing="0" class="dbborder" width="1000px">
 <tr>
   <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% =Session("country") %></span> PMstudy Back Office</font></div>
 </tr>
 <tr>
  <td width="100px" valign="top" rowspan="22">
    <!--#include file="leftMenu.html"-->
  </td>
 </tr>
 
 <% if rqType = "" then %>
 
 <tr>
 	<td>
		<form name="proformaInvoiceDetails" action="PRINCE2-ProformaInvoiceDetails.asp?Type=New" 
		method="post" onsubmit="return Form_Validate(this)">
		<table border="0" align="center" bgcolor="#e7f2f7" height="400px">
			<tr bgcolor="#ffffff">
 				<td class="h3" colspan="2" align="center">Proforma Invoice Details </td>
			</tr>
			<% If IsArray(arrAllQueries) Then
	   'FOR rowcounter = firstrow to lastrow 
	   
	   		Dim rqEmailId,rqCourseId,Location,Course
			rqEmailId  = arrAllQueries(3,rowcounter)
			rqCourseId = arrAllQueries(20,rowcounter)
			 
						'str = arrAllQueries(6,rowcounter)
'						 
'						str = split(str)
'						 If str(2) = "Practitioner" Then
'						Course = str(0)&""& str(1)&""& str(2)
'						 Else
'						Course =  str(0)
'						End If
'						
'					 If str(2) = "Practitioner" Then 
'				     Location = str(3) 
'                    Else
'				    Location = str(4) 
'				    End If  
						
						Session("Coursedetails") = 	rqCourseName & "-" & rqCity & " : " & FormatDateTime(rqStartdate,1) & " to " & FormatDateTime(rqEnddate,1) 
					%> 
				<input type="hidden" name="emailId" value="<% =rqEmailId %>" />
				<input type="hidden" name="courseId" value="<% =rqCourseId %>" />
				<input type="hidden" name="proformaInvoiceCode" value="<% = arrAllQueries(0,rowcounter) %>" />
				<input type="hidden" name="PINameFirst" value="<% =arrAllQueries(1,rowcounter)  %>" />
				<input type="hidden" name="PINameLast" value="<% = arrAllQueries(2,rowcounter) %>" />
				<input type="hidden" name="PICompany" value="<% =arrAllQueries(4,rowcounter)  %>" />
				<input type="hidden" name="PITelephone" value="<% =arrAllQueries(5,rowcounter)  %>" />
                <input type="hidden" name="PICourse" value="<% = Course %>" />							
				<input type="hidden" name="PIPlace" value="<% = Location %>" />

				<input type="hidden" name="PIDate" value="<% = arrAllQueries(7,rowcounter) %>" />
				<input type="hidden" name="PIPrice" value="<% =arrAllQueries(8,rowcounter)  %>" />
				<input type="hidden" name="tax" value="<% =rqTax %>" /> 
				<input type="hidden" name="startDate" value="<% = rqStartDate %>" />
			 
			<tr bgcolor="#ffffff">
				<td colspan="2" align="center">Proforma Invoice Code : <% = arrAllQueries(0,rowcounter)%></td>
			</tr>
			<tr bgcolor="#ffffff">
				<td colspan="2"><b>Personal Details</b></td>
			</tr>
			<tr>
				<td colspan="2">
					<table width="100%">
						<tr bgcolor="#ffffff" align="center">
							<td>Name </td><td>Company</td><td>Telephone</td>
						</tr>
						<tr bgcolor="#ffffff">
							<td><% = arrAllQueries(1,rowcounter)%>  &nbsp;  <% = arrAllQueries(2,rowcounter)%> </td>
							<td> <% = arrAllQueries(4,rowcounter)%> </td>
							<td> <% = arrAllQueries(5,rowcounter)%> </td>
						</tr>
					</table>
				</td>
			</tr>
			<tr bgcolor="#ffffff">
				<td colspan="3"><b>Enrollment Details</b></td>
			</tr>
			<tr  >
				<td colspan="2">
					<table width="100%">
					
						<tr bgcolor="#ffffff">
                       
							<td>
                           
                            Course Name :  <% = rqCourseName %>
						
							
                             </td>
                            <td>Place:  
							
							<% = rqCity %> 
							
							  </td>
							<td>Date :  <% = arrAllQueries(7,rowcounter)%>   </td>
						</tr  >
						<tr bgcolor="#ffffff">
							<td colspan="2">Price&nbsp; :  <% = arrAllQueries(8,rowcounter)%> </td>
						</tr>
					</table>
				</td>
			</tr>
			<tr bgcolor="#ffffff">
				<td colspan="2"><b>Discount Details</b></td>
			</tr>
			<tr>
				<td colspan="2">
					<table width="100%" cellpadding="1">
						<tr bgcolor="#ffffff">
							 
							<td align="right"	>Amount : <input type="text" size="10" name="PIAmount" value="<% =rqPriceWithOutTax %>" onchange="calculate();"/><input type="hidden" name="rqTax" value="<% =rqTax %>"  onchange="calculate();"/></td>
							<td align="right" colspan="2">
							Discount Type : &nbsp;&nbsp;&nbsp;
							   <select name="discountType" id="discountType" onchange="calculate();">
							     <option value="Lumpsum">Lumpsum</option>
								 <option value="Percentage">Percentage</option>
							   </select>
							  
							  <input type="text" name="discountText" size="7" value="0" id="iddiscountText" onchange="calculate();"/> 
							   PRINCE2Manual : &nbsp;&nbsp;&nbsp;
							   <select  name="PIPMBOK" id="PIPMBOK" onchange="calculate();">
							     <option disabled="disabled" value="">Select</option>
								 <option <% If arrAllQueries(16,rowcounter) = "Yes" Then %> selected="selected" <% End If%> value="Yes">Yes</option>
								 <option <% If arrAllQueries(16,rowcounter) = "No" Then %> selected="selected" <% End If%> value="No">No</option></select></td>
							
						</tr>
						<tr bgcolor="#ffffff">
							<td >Price After<br />Discount : <input type="text" size="10" readonly="true" name="priceAfterDiscount"  /></td>
							<td >Price With Tax : <input type="text" size="10" readonly="true" name="priceWithTax"  /></td>
							
                            
                            
							<td align="right">PRINCE2Manual Price : <input type="text" size="7" name="PIPMBOKValue" id="PIPMBOKValue" 
							<% If arrAllQueries(16,rowcounter) = "Yes" Then %>
                          
                            <% If Session("Country") = "India" Then %>
                            value="5000"
                            <% ElseIf Session("Country") = "United Kingdom" Then %>
                            value="55"
                            <% ElseIf Session("Country") = "Australia" Then %> 
                            value="0"
                           <% End If %>
							<% Else %> 
                            value="0" 
							<% End If %> maxlength="6" onchange="calculate();" /></td>
                            
                            
                            
							
						</tr>
						<tr bgcolor="#ffffff">
							 
							<td colspan="3" align="right">Total : <input type="text" size="10" name="total" readonly="true"   /></td>
						</tr>
						
					</table>
				</td>
			</tr>
			<% End If %>
			<tr bgcolor="#ffffff">
				<td colspan="" align="center" ><input type="submit" value="Submit" class="buttonc"/></td>
				</form>
					<form action="PRINCE2-BCourses.asp?CourseId=<% = rqCourseId %>" method="post">
					<td colspan="" align="center" ><input type="submit" value="Cancel" class="buttonc"/></td>
					</form>
			</tr>
		</table>
		
	</td>
	</tr>
				
	<% elseif rqType = "New" then 
	
	Dim PICode,PINameFirst,PINameLast,PICompany,PITelephone,PIPlace,PIDate,PIPrice,PIAmount,PIPercentage,PIPMBOK,PIPMBOKValue
 
	
	PICode 				=  Request.Form("proformaInvoiceCode")
	PINameFirst 		=  Request.Form("PINameFirst")
	PINameLast 			=  Request.Form("PINameLast")
	PICompany 			=  Request.Form("PICompany")
	PITelephone 		=  Request.Form("PITelephone")
	PIPlace 			=  Request.Form("PIPlace")
	PIDate 				=  Request.Form("PIDate")
	PICourse 			=  Request.Form("PICourse")
	PIPrice 			=  Request.Form("PIPrice")
	PIAmount 			=  Request.Form("PIAmount")
	PIPercentage 		=  Request.Form("PIPercentage")
	PIPMBOK 			=  Request.Form("PIPMBOK")
	PIPMBOKValue 		=  Request.Form("PIPMBOKValue")
	rqEmailId   		=  Request.Form("emailId")
	rqCourseId   		=  Request.Form("courseId")
	priceAfterDiscount 	=  Request.Form("priceAfterDiscount")
	priceWithTax   		=  Request.Form("priceWithTax")
	total   		    =  Request.Form("total")
	rqTax				=  Request.Form("tax") 
	rqDiscountType      =  Request.Form("discountType")
	rqDicounttext       =  Request.Form("discountText")
	rqStartDate         =  Request.Form("startDate")
	'response.Write(PICourse)
'	response.Write(PINameFirst)
'	response.Write(PIPlace)
'	response.Write(PITelephone)
'	response.Write(PINameFirst)
	
	%>
	<tr>
		<td>
			<table align="center" width="500px" height="400px" border="0">
				<tr>
					<td colspan="2" align="center" class="h3">New Proforma Invoice <hr /></td>
				</tr>
				<form action="PRINCE2-NewProformaInvoiceMail.asp" method="post">
				
				<input type="hidden" name="emailId" value="<% =rqEmailId %>" />
				<input type="hidden" name="courseId" value="<% =rqCourseId %>" />
				<input type="hidden" name="PICode" value="<% = PICode %>" />
				<input type="hidden" name="PINameFirst" value="<% =PINameFirst  %>" />
				<input type="hidden" name="PINameLast" value="<% = PINameLast %>" />
				<input type="hidden" name="PICompany" value="<% =PICompany  %>" />
				<input type="hidden" name="PITelephone" value="<% =PITelephone  %>" />
				<input type="hidden" name="PIPlace" value="<% = PIPlace %>" />
				<input type="hidden" name="PIDate" value="<% = PIDate %>" />
				<input type="hidden" name="PIPrice" value="<% =PIPrice  %>" />
				<input type="hidden" name="PIAmount" value="<% = PIAmount %>" />
				<input type="hidden" name="PIPercentage" value="<% =PIPercentage  %>" />
				<input type="hidden" name="PIPMBOK" value="<% = PIPMBOK %>" />
				<input type="hidden" name="PIPMBOKValue" value="<% =PIPMBOKValue  %>" />
				<input type="hidden" name="priceAfterDiscount" value="<% =priceAfterDiscount  %>" />
				<input type="hidden" name="priceWithTax" value="<% = priceWithTax %>" />
				<input type="hidden" name="total" value="<% =total  %>" />
				<input type="hidden" name="tax" value="<% =rqTax %>" />  
				<input type="hidden" name="startDate" value="<% = rqStartDate %>" />
				<tr bgcolor="#ffffff">
					<td colspan="2" align="center">Proforma Invoice Code : <% = PICode %></td>
				</tr>
				<tr bgcolor="#ffffff">
					<td colspan="2"><b>Personal Details</b></td>
				</tr>
				<tr>
					<td colspan="2">
						<table  border="0" width="100%" >
							<tr bgcolor="#ffffff" align="">
								<td width="40%">Name : </td><td width="35%">Company :</td><td width="25%">Telephone :</td>
							</tr>
							<tr bgcolor="#ffffff">
								<td ><% = PINameFirst %>&nbsp;<% = PINameLast %></td>
								<td><% = PICompany %> </td>
								<td><% = PITelephone %> </td>
							</tr>
						</table>
					</td>
				</tr>
				<tr bgcolor="#ffffff">
					<td colspan="3"><b>Enrollment Details</b></td>
				</tr>
				<tr  >
					<td colspan="2">
						<table width="100%" border="0">
						 
							<tr bgcolor="#ffffff">
								<td width="40%">Place : <% = PIPlace %></td>
								<td>Date :  <% = PIDate %>   </td>
							</tr  >
						</table>
					</td>
				</tr>
				<tr bgcolor="#ffffff">
					<td colspan="2"><b>Discount Details</b></td>
				</tr>
				<tr>
					<td colspan="2">
						<table width="100%" border="0">
							<tr bgcolor="#ffffff">
								
								<td width="40%">Amount : <% = PIAmount %></td>
								<td><% = rqDiscountType %> : <% = rqDicounttext %></td>
								<td>PRINCE2Manual : <% = PIPMBOK %></td>
							</tr>
							
							<tr bgcolor="#ffffff">
								<td>Price After Discount : <% = priceAfterDiscount %></td>
								<td>Price With Tax : <% = priceWithTax %>
								<% if PIPMBOK = "Yes" then %>
								<td colspan="2" align=" ">PMOK Value : <% = PIPMBOKValue %></td>
								<% end if %>
							</tr>
						    <tr>
								<td colspan="2" align=" "></td>
								<td colspan="2" align=" ">Total : <b><% = FormatNumber(total) %></b></td>
							</tr>
							<tr><td colspan="4" ><hr /></td></tr>
							
						</table>
					</td>
				</tr>
				 
				<tr bgcolor="#ffffff">
					<td colspan="" align="center" ><input type="submit" value="Confirm" class="buttonc"/></td>
					</form>
					<form action="PRINCE2-BCourses.asp?CourseId=<% = rqCourseId %>" method="post">
					<td colspan="" align="center" ><input type="submit" value="Cancel" class="buttonc"/></td>
					</form>
				</tr>
			</table>
				 
		</td>
	</tr>
			 
	 			
					
   
  	<% end if %>
  
  
	<tr>
	  <td colspan="4" align="center"><font face="Arial" size="2" color="orangered"><%=message%></font></td>
	</tr>
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
 ConnObj.Close
 Set ConnObj = Nothing
 Else
 Response.Redirect("/India/backoffice/login.asp")
 End If
%>