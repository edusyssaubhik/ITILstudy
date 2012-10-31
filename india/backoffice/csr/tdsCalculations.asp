<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 'Written By : BbojaRaju'
 'Last UpaDated: 29/04/2008'
 'Description :'
 'Purpose : TDS Calculations'
%>
<%
   If Session("UserId")  = "" Then
     Response.Redirect("../login.asp")
   Else
   
   'TDS QUEIRES
   'update ps_enrolledusers  set discountpercentage='0'   
   'update ps_enrolledusers  set pmbokprice ='0' where pmbok='no'
   'select * from ps_enrolledusers  
%>

<!--#include virtual="/india/connection.asp"-->

<%
 
 Dim rqTDSMonth,rqTDSYear,rqDate,rqDate1,rqDate2,Sql,firstName,lastName,courseDate,checkReceivedDate,PMBOK,rqTDSMonthNo,Sql1,Rs1,arrAllQueries,firstRow,lastRow,numRows,rowcounter,rqCourseId,arrAllQueries1,firstRow1,lastRow1,numRows1,rowcounter1,Sql2,Rs2,rqType,rqPage,rqRow,arrAllRecords,subAmountBeforeTax,subAmountBeforeTax1,totalRows,first
 
 rqTDSMonth  = Request.Querystring("tdsMonth")
 Session("rqTDSMonth") = rqTDSMonth
 rqTDSYear   = Request.Querystring("tdsYear")
  Session("rqTDSYear") = rqTDSYear
  
  Set Rs1 = Server.CreateObject("ADODB.Recordset")
  Set Rs2 = Server.CreateObject("ADODB.Recordset")
 
 if rqTDSMonth = "January" then
 	rqTDSMonthNo = 1
 elseif rqTDSMonth = "February" then
 	rqTDSMonthNo = 2
 elseif rqTDSMonth = "March" then
 	rqTDSMonthNo = 3
 elseif rqTDSMonth = "April" then
 	rqTDSMonthNo = 4
 elseif rqTDSMonth = "May" then
 	rqTDSMonthNo = 5
 elseif rqTDSMonth = "June" then
 	rqTDSMonthNo = 6
 elseif rqTDSMonth = "July" then
 	rqTDSMonthNo = 7
 elseif rqTDSMonth = "August" then
 	rqTDSMonthNo = 8
 elseif rqTDSMonth = "September" then
 	rqTDSMonthNo = 9
 elseif rqTDSMonth = "October" then
 	rqTDSMonthNo = 10
 elseif rqTDSMonth = "November" then
 	rqTDSMonthNo = 11
 elseif rqTDSMonth = "December" then
 	rqTDSMonthNo = 12
 end if
  
 
 rqDate1 = rqTDSMonthNo&"/"
 rqDate2 = "/"&rqTDSYear
 rqDate = rqDate1&"%"&rqDate2&"%"
 
 
 'Retrive The Types.It Means Tasks'

 rqType =  Request.Querystring("type")

'Retrive The Below Two are Pagination Purpose'

 rqPage =  Request.QueryString("page")
 rqRow  =  Request.QueryString("row")
  
 Sql = "select firstname,lastname,coursedate,checkreceiveddate,pmbok,courseid,amount,id,discountpercentage,pmbokprice from ITIL_enrolledusers where coursedate like '"& rqDate &"' and status = 'Active' and country = 'India'"
 
 Rs.open Sql,conn
 
 If Not Rs.EOF Then
     arrAllQueries = Rs.getrows
     Session("arrAllQueries") = arrAllQueries
     firstRow = 0
     lastRow  = 9
	 totalRows = Ubound(arrAllQueries,2)
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
 <title>TDS</title>
 <link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
 
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
 	<td valign="middle" height="100px">
		<table border="0" align="center" height=""  bgcolor="#e7f2f7" cellpadding="5" >
			<tr bgcolor="#ffffff">
				<td colspan="2" align="center"><b>T D S Calculations</b></td>
			</tr>
			<form name="tsdMonth" action="tdsCalculations.asp" method="get">
			<tr >
				<td>T D S for the Month of : <select name="tdsYear">
					<option value="">-Year-</option>
					<option value="2007" <% if rqTDSYear = "2007" then %> selected="selected" <% end if %> >2007</option>
					<option value="2008" <% if rqTDSYear = "2008" then %> selected="selected" <% end if %> >2008</option>
					<option value="2009" <% if rqTDSYear = "2009" then %> selected="selected" <% end if %> >2009</option>
					<option value="2010" <% if rqTDSYear = "2010" then %> selected="selected" <% end if %> >2010</option>
					<option value="2011" <% if rqTDSYear = "2011" then %> selected="selected" <% end if %> >2011</option>
					<option value="2012" <% if rqTDSYear = "2012" then %> selected="selected" <% end if %> >2012</option>
					<option value="2013" <% if rqTDSYear = "2013" then %> selected="selected" <% end if %> >2013</option>
					<option value="2014" <% if rqTDSYear = "2014" then %> selected="selected" <% end if %> >2014</option>
					<option value="2015" <% if rqTDSYear = "2015" then %> selected="selected" <% end if %> >2015</option>
											</select>
											 
											<select name="tdsMonth">
					<option value="">-Month-</option>
					<option value="January" <% if rqTDSMonth = "January" then %> selected="selected" <% end if %> >January</option>
					<option value="February" <% if rqTDSMonth = "February" then %> selected="selected" <% end if %> >February</option>
					<option value="March" <% if rqTDSMonth = "March" then %> selected="selected" <% end if %> >March</option>
					<option value="April" <% if rqTDSMonth = "April" then %> selected="selected" <% end if %> >April</option>
					<option value="May" <% if rqTDSMonth = "May" then %> selected="selected" <% end if %>>May</option>
					<option value="June" <% if rqTDSMonth = "June" then %> selected="selected" <% end if %>>June</option>
					<option value="July" <% if rqTDSMonth = "July" then %> selected="selected" <% end if %>>July</option>
					<option value="August" <% if rqTDSMonth = "August" then %> selected="selected" <% end if %>>August</option>
					<option value="September" <% if rqTDSMonth = "September" then %> selected="selected" <% end if %>>September</option>
					<option value="October" <% if rqTDSMonth = "October" then %> selected="selected" <% end if %>>October</option>
					<option value="November" <% if rqTDSMonth = "November" then %> selected="selected" <% end if %>>November</option>
					<option value="December" <% if rqTDSMonth = "December" then %> selected="selected" <% end if %>>December</option>
											</select>
											</td>
				<td><input type="submit" value="Submit" class="buttonc"/></td>
			</tr>
			</form>
			 
		</table>
		</td>
	</tr>
	<tr>
		<td>
			<table border="0" cellpadding="3" cellspacing="2" bgcolor="#e7f2f7">
				<tr id="htMap" bgcolor="#ffffff">
				  <td colspan="10">
				  <% first = 0  %>
					 <a href="tdsCalculations.asp?page=previous&row=<% = first %>&tdsYear=<% = rqTDSYear %>&tdsMonth=<% = rqTDSMonth %>"> First </a>
				  <% If Not firstRow = 0 Then %>
					 <a href="tdsCalculations.asp?page=previous&row=<% = firstRow %>&tdsYear=<% = rqTDSYear %>&tdsMonth=<% = rqTDSMonth %>"> &lt;&lt;Previous</a>
				  <% End If %>
				  <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
				  <% If Not numRows = lastRow Then %>
					 <a href="tdsCalculations.asp?page=next&row=<% = lastRow %>&tdsYear=<% = rqTDSYear %>&tdsMonth=<% = rqTDSMonth %>"> &gt;&gt;Next</a>
				  <% End If %>
				  </td>
				 </tr>
				<tr align="center" bgcolor="#ffffff">
					<td>Id</td>
					<td>Name</td>
					<td>Check Received Date</td>
					<td>Amount Before Tax</td> 
					<td>PMBOK Amount Paid</td>
					<td>Amount Excluding PMBOK</td>
					<td>Tax Paid</td>
					<td>Amount After Tax</td>
					<td>Amount After Tax Including PMBOK</td>
					<td>Comments</td>
				</tr>
				
				
				<% If IsArray(arrAllQueries) Then
	   					FOR rowcounter = firstrow to lastrow  %>	
				<tr align="center" bgcolor="#ffffff">
					<td><% = arrAllQueries(7,rowcounter) %></td>
					<td ><% = arrAllQueries(0,rowcounter)&" "&arrAllQueries(1,rowcounter) %></td>
					<td><% = arrAllQueries(3,rowcounter) %></td>
					
					
					<% 
						rqCourseId  		= arrAllQueries(5,rowcounter)
					   	
						Sql1 = "select pricewithouttax,tax,pricewithtax from ITIL_course where courseid = '"& rqCourseId &"'"
							
						Rs1.open Sql1,conn
						
						Dim amountWithOutTaxPlusPMBOKPrice,totalAmountPaid
						Dim amountBeforeTax,PMBOKAmountPaid,amountExcludingPMBOK,taxPaid,amountAfterTax,amountAfterTaxIncludingPMBOK
						
						if (NOT Rs1.BOF) and (NOT Rs1.EOF) then
						
							amountBeforeTax = Rs1("pricewithouttax") - (Rs1("pricewithouttax") * arrAllQueries(8,rowcounter)/100)
							 						
							if arrAllQueries(9,rowcounter) <> "" then
								amountWithOutTaxPlusPMBOKPrice  = amountBeforeTax + arrAllQueries(9,rowcounter)
							else
								amountWithOutTaxPlusPMBOKPrice  = amountBeforeTax  
							end if
							
							if arrAllQueries(9,rowcounter) <> "" then
								totalAmountPaid = Rs1("pricewithtax") + arrAllQueries(9,rowcounter)
							else
								totalAmountPaid = Rs1("pricewithtax")
							end if
						
							taxPaid = amountBeforeTax*Rs1("tax")/100
						 	amountAfterTax = amountBeforeTax + taxPaid
						   amountAfterTaxIncludingPMBOK = arrAllQueries(6,rowcounter)
						
					%>	
					
					<td><% if arrAllQueries(9,rowcounter) <> "" then %><% = "Rs."&amountWithOutTaxPlusPMBOKPrice  %><% else %><% = arrAllQueries(9,rowcounter) %><% end if %></td>
					<td><% if arrAllQueries(9,rowcounter) <> "" then %><% = "Rs."&arrAllQueries(9,rowcounter)  %><% else %><% = arrAllQueries(9,rowcounter) %><% end if %></td>
					<td><% = "Rs."&amountBeforeTax  %></td>
					<td><% = Rs1("tax")&" % "&"&nbsp;"&" / "&"Rs."&taxPaid %></td>
					<td><% = "Rs."&amountAfterTax  %></td>
					<td><% = "Rs."&amountAfterTaxIncludingPMBOK %></td>
					
					
					
					<%  else %>
					<td >&nbsp;</td><td >&nbsp;</td><td >&nbsp;</td><td >&nbsp;</td><td >&nbsp;</td><td >&nbsp;</td>
					<%
						end if 
						Rs1.close
						
					%>  
					<td><iframe src="enrollUserComments.asp?enrollUserId=<% = arrAllQueries(7,rowcounter) %>" frameborder="0" height="100" scrolling="yes" width="250">
	</iframe></td>
				</tr>
					<%
						next
						end if 
					%>
					
					
				<tr id="htMap" bgcolor="#ffffff">
				  <td colspan="10">
				  <% first = 0  %>
					 <a href="tdsCalculations.asp?page=previous&row=<% = first %>&tdsYear=<% = rqTDSYear %>&tdsMonth=<% = rqTDSMonth %>"> First </a>
				  <% If Not firstRow = 0 Then %>
					 <a href="tdsCalculations.asp?page=previous&row=<% = firstRow %>&tdsYear=<% = rqTDSYear %>&tdsMonth=<% = rqTDSMonth %>"> &lt;&lt;Previous</a>
				  <% End If %>
				  <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
				  <% If Not numRows = lastRow Then %>
					 <a href="tdsCalculations.asp?page=next&row=<% = lastRow %>&tdsYear=<% = rqTDSYear %>&tdsMonth=<% = rqTDSMonth %>"> &gt;&gt;Next</a>
				  <% End If %>
				  </td>
				 </tr>
				
				<% if firstrow = 0  then
					If IsArray(arrAllQueries) Then
	   					FOR rowcounter = firstrow to totalRows 
						Dim  amountWithOutTaxPlusPMBOKPriceTotal,PMBOKAmountPaidTotal,AmountExcludingPMBOKTotal,TaxPaidTotal,AmountAfterTaxTotal,AmountAfterTaxIncludingPMBOKTotal  
					  	
						amountWithOutTaxPlusPMBOKPriceTotal = amountWithOutTaxPlusPMBOKPriceTotal + amountWithOutTaxPlusPMBOKPrice
						PMBOKAmountPaidTotal = PMBOKAmountPaidTotal + Int(arrAllQueries(9,rowcounter))
						AmountExcludingPMBOKTotal = AmountExcludingPMBOKTotal + amountBeforeTax
						TaxPaidTotal = TaxPaidTotal + taxPaid
						AmountAfterTaxTotal =  AmountAfterTaxTotal + amountAfterTax
						AmountAfterTaxIncludingPMBOKTotal = AmountAfterTaxIncludingPMBOKTotal + Int(arrAllQueries(6,rowcounter))
						
					    Next
					  End If 											
							%>
					<tr align="center" bgcolor="#ffffff">
						<td colspan="3"> Grand Totals</td>
						<td>Rs.<% = amountWithOutTaxPlusPMBOKPriceTotal %></td>
						<td>Rs.<% = PMBOKAmountPaidTotal %></td>
						<td>Rs.<% = AmountExcludingPMBOKTotal %></td>
						<td>Rs.<% = TaxPaidTotal %></td>
						<td>Rs.<% = AmountAfterTaxTotal %></td>
						<td>Rs.<% = AmountAfterTaxIncludingPMBOKTotal %></td>
						<td >&nbsp;</td>
					</tr>
				<% end if %>
				 
			</table>
		</td>
	</tr>	
	
</table>
</div>
</body>
</html>


<%
 End If
%>