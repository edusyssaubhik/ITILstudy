<!--#include virtual="/includes/connection.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ITILstudy IP Information</title>

</head>

<body>
<%
'Declare Local Variables'
Dim rqType
Dim strQuery,strQuery1,strQuery2
Dim Rs1,Rs2,iCount,objRs1
Dim IPAddress,createdDate
	
'Recordset	
Set objRs1 = Server.CreateObject("ADODB.Recordset") 

'Retrive The Type Within this page'
rqType = Request.QueryString("type")
rqFromDate        =  Request.Form("fromDate")
rqFromDate2       =  Request.Form("toDate")


'databases fetching from main database
Session.Timeout = 1000
response.Flush()
%>

<div >
	<table width="500" height="80" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#00B0EC"  class="dbborder" >
	  <tr>
		<td width="547" valign="top"><table width="100%" cellspacing="0" cellpadding="2">
		<tr>
			<td colspan="2" bgcolor="#00B0EC" align="center"><span class="HeaderLarge">VIEW IP-ADDRESS<span class="HeaderLarge"></td>
			</tr>
 		<form id="form1" name="form1" method="post" action="viewIPS.asp?type=preview" onSubmit="return validate_form(this)">  
		  <tr class="rowEven">
		   <td class="btext">From Date:  </td>
		   <td class="btext"><input type="text" name="fromDate" size="20" value="<% = rqFromDate %>">(mm-dd-yyyy)</td>
		  </tr>
          <tr class="rowEven">
		   <td class="btext">To Date:  </td>
		   <td class="btext"><input type="text" name="toDate" size="20" value="<% = rqFromDate2 %>">(mm-dd-yyyy)</td>
		  </tr>
		 
		  <tr class="rowEven">
			<td colspan="3" align="center">
			  <input name="Submit3" type="Submit"  value="Submit" />
			</td>
		  </tr>
	</form>
		  <tr class="rowEven">
			<td colspan="2">&nbsp;</td>
		  </tr>
		</table></td>
	
	  </tr>
	  
	</table></div><br /><br />
    <div>
    <%


 	
	If rqType = "preview" then
	   
	'strQuery = "SELECT * FROM countrydetails WHERE created_date BETWEEN  '"&rqFromDate&"' AND '"&rqFromDate2&"'"
	
	strQuery = "SELECT Distinct(other),source_from FROM countrydetails WHERE created_date >= '" & rqFromDate & "' AND created_date <= '" & DateAdd("d", +1,CDate(rqFromDate2)) & "'"
	'response.Write(strQuery)
	objRs1.Open strQuery, ConnObj
					
	
	%>
	  
      <table width="700" height="80" border="1" align="center" cellpadding="5" cellspacing="0" bordercolor="#00B0EC"  class="dbborder" >
                    <tr bgcolor="#00B0EC">
                      <td>Sr No </td>
                      <td  class="btext" width="100px" align="center">IPAddress (From: <% = rqFromDate %> to <% = rqFromDate2 %></td>
                      <!--<td  class="btext" width="180px" align="center">Created Date</td>-->
                      <td  class="btext" width="180px" align="center">Country</td>
                    </tr>
                    
                 <% 
					 SrNo = 1
					 Do Until objRs1.EOF	
				 %>
                    <tr class="rowEven">
                     <td><% = SrNo %>
                     <td  class="btext" width="60%"><% = objRs1("other") %></td>
                      <!--<td  class="btext" width="100%" align="center"><%' = objRs1("created_date")  %></td>-->
                      <td  class="btext" width="100%" align="center"><% = objRs1("source_from")  %></td>
                    </tr> 
                    <% 
					  SrNo = SrNo + 1
					  objRs1.Movenext
					  Loop
					  objRs1.Close	
				   %>
                    </table>
	   </div>
<%End If %>

</body>
</html>
