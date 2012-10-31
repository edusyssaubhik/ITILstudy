<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<!--#include virtual="/includes/connection.asp"-->
<% 
	If Session("USBUserId") = "" Then 
	   Response.Redirect("/USBackoffice/login.asp")
	Else
	
Dim rqCountry

rqCountry = request.Form("countryOrigin")
rqDate       =  Request.Form("Date")
%>


	<table width="350" height="80" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#00B0EC"  class="dbborder" >
   
	  <tr>
		<td width="547" valign="top"><table width="100%" cellspacing="0" cellpadding="2">
		<tr>
			<td colspan="2" bgcolor="#00B0EC" align="center"><span class="HeaderLarge">No. of Enrollments</span></td>
			</tr>
 		<form id="form1" name="form1" method="post" action="NoOfEnrollment.asp?type=preview" onSubmit="return validate_form(this)">  
		  <tr >
		   <td >Date:  </td>
		   <td ><input type="text" name="Date" size="20" value="<% = rqDate %>" >(mm-dd-yyyy)</td>
		  </tr>
           <tr>
		   <td>Country:</td>
		   <td > &nbsp;&nbsp; <select name="countryOrigin">
                  <option value="">--Select--</option>
                  <option  value="Australia" <% If rqCountry = "Australia"  then%> selected="selected" <% End If%> >Australia</option>
                  <option value="Canada" <% If rqCountry= "Canada"  then%> selected="selected" <% End If%>>Canada</option>
				  <option value="India" <% If rqCountry = "India"  then%> selected="selected" <% End If%>>India</option>
				  <option value="Singapore"<% If rqCountry = "Singapore"  then%> selected="selected" <% End If%>>Singapore</option>
				  <option value="UAE" <% If rqCountry = "UAE"  then%> selected="selected" <% End If%>>UAE</option>
                  <option value="United Kingdom" <% If rqCountry = "United Kingdom"  then%> selected="selected" <% End If%>>United Kingdom</option>
				  <option value="US" <% If rqCountry = "US"  then%> selected="selected" <% End If%>>US</option>
                 
                   </select></td>
		  </tr>
		 <tr><td></td></tr>
		  <tr >
			<td colspan="3" align="center">
			  <input name="Submit3" type="Submit"  value="Submit" class="buttonc"/>
			</td>
		  </tr>
	</form>
		  <tr class="rowEven">
			<td colspan="2">&nbsp;</td>
		  </tr>
		</table></td>
	
	  </tr>
	  
	</table>
   
    <br /><br />
    
    <div>
    <%
'Declare Local Variables'
Dim rqType,rqPage,rqRow,rqName,rqEmailid
Dim strQuery,rqEmail,cnt
Dim iCount,objRs1,numRows, allNumRows,rowcounter
Dim firstRow,lastRow,message
Dim rqFirstName,rqLastName
Dim rqEnrollUserId
Dim rqEnrollDate
Dim Rs,rqCountryOrigin
Dim rqCourseDetails,rqCity,str,i
Dim rqCourseId,rqDate,iPageCurrent,rqdateofenrollment
Dim rqcourse,rqPhoneno,SrNo,arrAllQueries,rqID
	
'Recordset	
Set objRs1 = Server.CreateObject("ADODB.Recordset") 



'Retrive The Type Within this page'
rqType = Request.QueryString("type")
rqPage = Request.QueryString("page")
rqRow  = Request.QueryString("row")
rqCourseDetails = Request.Form("CourseDetails")
rqID = Request.Form("id")
rqName = Request.Form("Name")
rqEmailid = Request.Form("Emailid")
rqcourse = Request.Form("course")
rqPhoneno = Request.Form("phoneno")
rqEnrollUserId = Request.form("enrollUserId")
rqEnrollDate = Request.Form("enrolldate")
rqCourseId = Request.Form("courseId")


%>

<%
'databases fetching from main database

response.Flush()

 	'If (rqPage = "next" AND rqPage <> "previous") then

	
	   If Request.form("Date") <> "" then
	       rqDate = Request.form("Date")
	 ElseIf Request.Querystring("Date") <> ""then
	       rqDate=  Request.Querystring("Date")
	    End If
	  
		  If Request.Form("countryOrigin") <> "" then
	       rqCountryOrigin = Request.form("countryOrigin")
	 ElseIf Request.Querystring("countryOrigin") <> ""then
	       rqCountryOrigin=  Request.Querystring("countryOrigin")
	    End If



	strQuery = "SELECT * FROM ITIL_enrolledusers WHERE country =  '"&rqCountryOrigin&"' and dateofenrollment between '" & CDate(rqDate) & "' AND '" & DateAdd("d", +1,CDate(rqDate)) & "'  ORDER BY dateofenrollment desc"
	
'Response.Write(strQuery)


objRs1.Open strQuery, ConnObj
'response.Write(strQuery)

If Not objRs1.EOF Then
	arrAllQueries = objRs1.getrows
	Session("arrAllQueries") = arrAllQueries
	numRows = Ubound(arrAllQueries,2)
	firstRow = 0
	lastRow = numRows
Else
    message = "No enrollment on this date "
End If
	
	%>
    
    
	   <%	If rqType = "preview" then
 %>
     <table border="1" cellpadding="5" cellspacing="0" width="100%"  bordercolor="#00B0EC"  class="dbborder">
      
                    <tr >
					
					<td ><b>SrNo</b></td>
                      <td><b>Enrolled ID</b></td>
                      <td><b>Name</b></td>
                      <td><b>EmailId</b></td>
					  <td><b>Company Name</b></td>
					  <td><b>Phone No</b></td>
                       <td><b>Course Detail</b></td>
					   <td><b>Amount</b></td>
					   <td><b>Check received</b></td>
                        <td><b>Enrollment Date</b></td>
                        <td ><b>Country</b></td>
                           <!--<td  class="btext" width="180px" align="center" colspan="2">Comment</td>-->
                    </tr>
                 <% 
					 SrNo = 1
					If IsArray(arrAllQueries) Then
	For rowCounter = firstRow to lastRow	
				 %>
				  <tr >
					 <td  ><% = SrNo %></td>
                     <td ><% = arrAllQueries(0,rowcounter) %></td>
                      <td  ><% = arrAllQueries(1,rowcounter) &""& arrAllQueries(2,rowcounter) %></td>
                      <td ><% = arrAllQueries(3,rowcounter)  %></td>
					   <% If ISNULL(arrAllQueries(4,rowcounter)) or arrAllQueries(4,rowcounter) = "NULL" or arrAllQueries(4,rowcounter) = "" Then  %>
                         <td > N/A </td>
                         <% Else %>
					   <td ><% = arrAllQueries(4,rowcounter)  %></td>
                         <% End If %>
                       <td ><% = arrAllQueries(5,rowcounter)  %></td>
                       <td ><% = arrAllQueries(6,rowcounter)  %></td>
                        <td  ><% = arrAllQueries(8,rowcounter) %></td>
						<% If ISNULL(arrAllQueries(11,rowcounter)) or arrAllQueries(11,rowcounter) = "" or arrAllQueries(11,rowcounter) = "NULL"   Then %>
						<td>No</td>
						<% Else %>
                         <td ><% = arrAllQueries(11,rowcounter) %></td>
						 <% End If %>
						  <td  ><% = arrAllQueries(9,rowcounter) %></td>
                          <td ><% = arrAllQueries(23,rowcounter)  %></td>
                     
                      </tr> 
                  
                    <%
					 
					  SrNo = SrNo + 1
					  Next
	End If	
	
	If message <> "" Then
		Response.Write("<tr onMouseOver=""javascript:highlightTableRowVersionA(this, '#FFFFCC');"" height=""50px""><td colspan=""11"" class=""TableRowEven""><div align=""center""><b>"&message&"</b></div></td></tr>")
	End If
				   %>
   
                    </table>
                     </td></tr></table><% End If %>
	   </div>

 </div>
</body>
</html>
<% End If %>