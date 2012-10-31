<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>

<%
   If Session("UserId") = "" Then
     Response.Redirect("/login.asp")
   Else
%>
<%
'======================================================='
 'Written By : Mahima'
 'Last UpaDated: 22/11/2011'
 'Description :'
 'Purpose : Feedback form from the students'
'======================================================='
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title>Competitors</title>
<link href="/India/css/pagestyle.css" rel="stylesheet" type="text/css">
 </head>
<!--#include virtual="/india/connection.asp"-->
<script language ="javascript">
function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}
}
function Form_Validator(theform)
 {
 with (theform)
    {

		//Check If The Price With Tax Field Is Blank
			
        if (validate_required(Competitor,"Competitor Required")==false)
			  {Competitor.focus();return false}
    }

}

</script>

 <%
 Dim strEmpDet,arrAllcompetitors,objRs1,cnt,rowcounter,competitors
 Dim firstRow,lastRow, numRows,strQuery,arrAllQueries
 Dim rqType,Id
 Dim rqEnrollPage,rqEnrollRow,enrolllastRow,enrollfirstRow,enrollnumRows
 Dim Page,rqPage,allNumRows,iPageCurrent,arrAllRecords,rqCompetitors,prev,nextPage
 Dim lastpage, lpm1,pagination,counter,ps
 Dim strQuery1,Rs1,rqEdit
 
 
 Dim message1
 message1 = Session("message1")
 Session("message1") = ""
 
 Dim message
 message = Session("message")
 Session("message") = ""
 
 
 
 Set Rs = Server.CreateObject("ADODB.Recordset")
  Rs.ActiveConnection = conn
 Set Rs1 = Server.CreateObject("ADODB.Recordset")  
 
 rqType = Request.Querystring("type")

'Query to retirve values from database
 strQuery = "SELECT * FROM ITIL_competitors where country = '"& Session("country") &"'"
'Response.write(strQuery )
 Rs.Open strQuery,Conn
 
  If Not Rs.EOF Then
  arrAllQueries = Rs.getrows
  Session("arrAllQueries") = arrAllQueries
   
        firstRow = 0
		lastRow = 9
		numRows = Ubound(arrAllQueries ,2)
		If lastRow > numRows Then
		   lastRow = numRows
		End If
		
		allNumRows = numRows
		
		cnt = 1
		
	End If

'Pagination code'

If cnt = 1 Then

 If Request.QueryString("page") = "" Then
	
	iPageCurrent = 1
	
	'arrAllRecords = Session("arrAllRecords")	
	numRows = Ubound(arrAllQueries,2)
	
	 firstRow = 0 
	 
	 If numRows > 9 Then
	    lastRow = 9  
	 Else
	 	lastRow = numRows
	 End If 
  Else
	
	arrAllRecords = Session("arrAllRecords")	
	numRows = Ubound(arrAllQueries,2)
	
	iPageCurrent = Request.QueryString("page") 
    firstRow = ((10 * iPageCurrent)-10) 
     lastRow = firstRow + 9 

    If lastRow > numRows Then
    lastRow = numRows
   End If

    If firstRow < 0 Then
       firstRow = 0
    End If

 End if
 
End If

'Query to Retrive value for editing using Id 

rqEdit = Request.Querystring("Id")
strQuery1  = "SELECT * FROM ITIL_competitors WHERE Id = '" &rqEdit& "'"

 Rs1.Open strQuery1,Conn
	%>
    
 <body>
 <div id="htMap">
 
<table border="1" width="1000" height="300" cellpadding="8" cellspacing="0" class="dbborder" >
 <tr>
   <td colspan="9" height="35" class="HeaderLarge"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% =Session("country") %></span> ITILstudy Back Office</font></div></td>
 </tr>
 
    <tr>
      <td width="100px" valign="top" rowspan="22"><!--#include file="leftMenu.html"-->
      </td>
    </tr>
    <tr>
   <td height="25"><a href="Competitors.asp?type=add">Add Competitor</a></td></tr>
 
   <!-- If You Click Add User In This Page That Will Come Here -->
   <% if rqType = "add"  Then %>
 
   <tr>
	  <td>
	   <form action="addEditDeletecompetitors.asp" method="post" onSubmit="return Form_Validator(this)">
	   <table border="0" align="center" cellpadding="5" cellspacing="5" class="dbborder" >
     <tr>
       <td align="center" colspan="4" height="40" class="h3">Add Competitor</td>
     </tr>
	     <tr>
	      <td>Competitor:</td>
	      <td><input type="text" name="Competitor" size="30" /></tr>
	
		   <tr>
           <tr>
	      <td>Country:</td>
	      <td><input type="text" name="country" size="30" /></tr>
	
		   <tr>
		  <td colspan="2" align="center" class="Error"><%=message1%></td>
		 </tr>
	     <tr>
	       <td colspan="2" align="center">
	       <input type="submit" name="createCompetitor" class="buttonc" value="Create Competitor">	       </td>
	     </tr>
	    </table>
	    </form>
	   </td>
  </tr>
  <% End If %>
  
  <% If rqType = "Edit"  Then %>
      <tr>
         <td>
	       <form action="addEditDeletecompetitors.asp" method="post" onSubmit="return Form_Validator(this)">
	       <table border="0" align="center" cellpadding="8" cellspacing="5" class="dbborder">
     <tr>
       <td align="center" colspan="4" height="40" class="h3">Edit Competitor</td>
     </tr>
	        <% do until Rs1.EOF %>
	        <input type="hidden" name="Id" value="<% = Rs1("id") %>">
	        <tr>
	         <td width="30%">Competitor:</td>
	         <td width="60%"><input type="text" name="competitor" size="30" value="<% = Rs1("competitor") %>">
	        </tr>
            <tr>
	         <td width="30%">Country:</td>
	         <td width="60%"><input type="text" name="country" size="30" value="<% = Rs1("country") %>">
	        </tr>
	  	      <% Rs1.Movenext
	          Loop %>
              <tr>
        	         <td colspan="2" align="center">
	            <input type="submit" name="save" class="buttonc" value="Save">
	         </td>
	        </tr>
	       </table>
	       </form>
      </td>
    </tr>
    <% End If %>
       <tr height="500">
      <td valign="top">
      <table border="1" align="center" width="500px" cellspacing="0" cellpadding="8" >
       <tr height="25" class="title" >
        <td bgcolor="#A7DBFB" align="center"><b>ID</b></td>
        <td bgcolor="#A7DBFB" align="center"><b>Competitor</b></td>	 
        <td bgcolor="#A7DBFB" align="center"><b>Country</b></td>	 
        <td bgcolor="#A7DBFB" align="center"><b>Edit</b></td>
        <td bgcolor="#A7DBFB" align="center"><b>Delete</b></td>
      </tr>
         <% If IsArray(arrAllQueries) Then

         FOR rowcounter = firstRow TO lastRow
       %>
     <tr>
     <% Id = arrAllQueries(0,rowcounter) %>
       <td><% = rowcounter + 1
	    %></td>
       <td><% = arrAllQueries(1,rowcounter) %></td>
        <td><% = arrAllQueries(2,rowcounter) %></td>
    	   	   
       <td align="center"><a href="competitors.asp?type=Edit&Id=<% =Id %>">Edit</a></td>
       <td align="center"><a href="addEditDeletecompetitors.asp?deleteId=<% =Id %>">Delete</a></td>
    </tr>
     <%
      Next
      %>
     <% End If %>
          <tr id="htMap">
              <td colspan="8"><!--#include file="pagination.asp"-->
               <% 
			    ps = getPaginationString(page, (numRows + 1), 10, 2, "competitors.asp?competitors="& rqCompetitors &"")
				  Response.Write(ps)
	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
          </td>
       </tr> <tr>
       <td colspan="6" class="Error"><%=message%></td>
     </tr>
        
     </table>
   
     
     </td></tr></table>
     </div>
     </body>    

 <% End If%>
    

 