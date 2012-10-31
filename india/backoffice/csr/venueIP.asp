<% If not  Session("UserId") = "" Then %>
<!--#include virtual="/india/connection.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Hits on venue details</title>
<link href="../../css/pagestyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="htMap">
<table border="1" height="550" cellspacing="0" class="dbborder" width="1000px">
<tr>
  <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300">
      <% =Session("country") %>
      </span> ITILstudy Back Office</font></div></td>
</tr>
<tr>
  <td width="100px" valign="top" rowspan="22"><!--#include file="leftMenu.html"-->
  </td>
</tr>
<tr>
  <td><table width="500" height="80" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#00B0EC"  class="dbborder" >
      <tr>
        <td width="547" valign="top"><table width="100%" cellspacing="0" cellpadding="2">
            <tr>
              <td colspan="2" bgcolor="#00B0EC" align="center"><span class="HeaderLarge">Hits on Venue detail</span></td>
            </tr>
            <form id="form1" name="form1" method="post" action="venueIP.asp?type=showIP" onSubmit="return validate_form(this)">
              <tr class="rowEven">
                <td class="btext">From Date: </td>
                <td class="btext"><input type="text" name="fromDate" size="20" value="<% = rqfromDate %>">
                  (yyyy-mm-dd)</td>
              </tr>
              <tr class="rowEven">
                <td class="btext">To Date: </td>
                <td class="btext"><input type="text" name="toDate" size="20" value="<% = rqtoDate %>">
                  (yyyy-mm-dd)</td>
              </tr>
              <tr class="rowEven">
                <td class="btext">Country:</td>
                <td class="btext">&nbsp;&nbsp;
                  <select name="countryOrigin">
                    <option value="">--Select--</option>
                    <option value="Australia">Australia</option>
                    <option value="Canada">Canada</option>
                    <option value="India">India</option>
                    <option value="Singapore">Singapore</option>
                    <option value="UAE">UAE</option>
                    <option value="United Kingdom">United Kingdom</option>
                    <option value="US">US</option>
                    <option value="Other">Other</option>
                  </select></td>
              </tr>
              <tr class="rowEven">
                <td colspan="3" align="center"><input name="Submit3" type="Submit"  value="Submit" class="buttonc"/>
                </td>
              </tr>
            </form>
            <tr class="rowEven">
              <td colspan="2">&nbsp;</td>
            </tr>
          </table></td>
      </tr>
    </table>
    <br />
    <br />
    <div>
    <%
'Declare Local Variables'

Dim strQuery,strQuery1,strQuery2
Dim iCount,objRs1
Dim rqCity,str,rqType
Dim rqfromDate,rqtoDate,rqStatus1,iPageCurrent

	
'Recordset	
Set objRs1 = Server.CreateObject("ADODB.Recordset") 
Set objRs = Server.CreateObject("ADODB.Recordset") 
Set Rs = Server.CreateObject("ADODB.Recordset") 


'Retrive The Type Within this page'
rqPage = Request.QueryString("page")
rqRow  = Request.QueryString("row")
rqType = Request.Querystring("type")


'databases fetching from main database



response.Flush()
	
	   if Request.form("fromDate") <> "" then
	       rqfromDate = Request.form("fromDate")
	 Elseif Request.Querystring("fromDate") <> ""then
	       rqfromDate=  Request.Querystring("fromDate")
	    End if
	   if Request.form("toDate") <> "" then
	       rqtoDate = Request.form("toDate")
	 Elseif Request.Querystring("toDate") <> ""then
	       rqtoDate=  Request.Querystring("toDate")
	    End if
		
		  if Request.Form("countryOrigin") <> "" then
	       rqCountryOrigin = Request.form("countryOrigin")
	 Elseif Request.Querystring("countryOrigin") <> ""then
	       rqCountryOrigin=  Request.Querystring("countryOrigin")
	    End if


'Retriving the values'

	strQuery = "SELECT ID,city,country,IPaddress FROM Venue_Reviewed WHERE country = '"& rqCountryOrigin &"' and  TimeOfEntry between '"&rqfromDate&"' And '"&rqtoDate&"'  ORDER BY TimeOfEntry desc"
	

'Response.Write(strQuery)

objRs1.Open strQuery, Conn
'response.Write(strQuery)
		
	 If Not objRs1.EOF Then
	 
	   rqcity = objRs1("city")
     arrAllQueries = objRs1.getrows
     firstRow = 0
     lastRow = 9
     numRows = Ubound(arrAllQueries,2)
     If lastRow > numRows Then
        lastRow = numRows
     End If
	 allNumRows = numRows
		
		cnt = 1
   End If
   
   'End If

	
	%>
	
	<%
	
	 
Dim Array1, Array2,Rs3,Rs4,strcity2,strcity1,strcity,strQuery3,strQuery4
	
'Dim Ubound(Array1,2)

Set Rs3 = Server.CreateObject("ADODB.Recordset")
Set Rs4 = Server.CreateObject("ADODB.Recordset")


dim  providersNumRows,arrAllproviders,providersFirstRow,providersLastRow ,ArrayRecords,ArrayRecords1,ArrayRecords2,providersRowCounters

strQuery3 = "SELECT city FROM ITIL_city WHERE country = '"&rqCountryOrigin&"' Order By city "
'Response.write("test1"&strQuery3)
 
  Rs3.Open strQuery3,Conn
  
 If Not Rs3.EOF THen

   arrAllproviders = Rs3.getrows
   providersNumRows = Ubound(arrAllproviders,2)  
  providersFirstRow = 0
  providersLastRow  = providersNumRows
 End If
Rs3.close
' Response.write("test2"& providersNumRows)
'getting array values from competetors
If IsArray(arrAllproviders) Then
For providersRowCounter = providersFirstRow to providersLastRow 
 'Response.write("test3")
ArrayRecords = arrAllproviders(0,providersRowCounter) 
ArrayRecords1 = ArrayRecords&","
ArrayRecords2 = ArrayRecords2 + ArrayRecords1
'Response.Write("test4"&ArrayRecords2)

Next
End If
'Response.Write("test5"&ArrayRecords2)

dim  providersNumRows1,arrAllproviders1,providersFirstRow1,providersLastRow1 ,Arrayvenue,Arrayvenue1,Arrayvenue2
Dim MyArray,strArray


'Response.write( providersLastRow)
'getting array values from competetors
If IsArray(arrAllQueries) Then
For numRows = firstRow to lastRow 
Arrayvenue = arrAllQueries(1,numRows) 
Arrayvenue1 = Arrayvenue&","
Arrayvenue2 = Arrayvenue2 + Arrayvenue1


Next
End If
If rqType = "showIP" Then
%>

  <table width="550" height="80" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#00B0EC"  class="dbborder" >
    <tr>
      <td colspan="10"><table border="1" cellpadding="5" cellspacing="2"  width="100%">
        <tr bgcolor="#00B0EC">
 		  <td   align="center">SrNo</td>
          <td   align="center">City</td>
          <td align="center" >No. of Hits</td>
        </tr>
		<%

SrNo = 1

 MyArray = Split(ArrayRecords2,",")
'Response.write( MyArray(0))


strArray = Split(Arrayvenue2,",")

'no1 = providersNumRows - 1
 

Dim No()
ReDim No(providersNumRows - 1)


For l = 0 To providersNumRows - 1

For k = 0 To numRows - 1
 	
 Select Case MyArray(l)

	Case MyArray(l)
	
	    'comparing two array values
		If MyArray(l) = Trim(strArray(k)) Then
			
		    'if word from array are equal add the count to the variable
			'sResponse.write(strArray(k))
			No(l) = No(l) + 1

		End If

End Select

Next 
'Response.write( MyArray(l)&"" &Int(No(l)) )

%>
		  

        <tr class="rowEven">
		<td align="center" ><% = SrNo %></td>
          <td align="center" ><% = MyArray(l) %></td>
          <td align="center" ><% =Int(No(l)) %></td>
        </tr>
        <% 
		SrNo = SrNo + 1
		 Next 
		End If 
		%>
     

</table>
</td>
</tr>
</table>

</div>
<%

 Else
 Response.Redirect("../login.asp")
 End If
%>
</body>
</html>
