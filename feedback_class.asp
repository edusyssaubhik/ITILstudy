<!--#include virtual="/metatags/index_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/students-speak-banner.asp"-->
<!--#include virtual="/includes/connection.asp"-->
 <!--#include virtual="/india/backoffice/csr/pagination.asp"-->
<!-- Body Starts -->
<% If Session("CountryOrigin") <> "India" AND Session("CountryOrigin") <> "United Kingdom" AND Session("CountryOrigin") <> "US" AND Session("CountryOrigin") <> "Canada" AND Session("CountryOrigin") <> "Germany" AND Session("CountryOrigin") <> "Netherlands" AND Session("CountryOrigin") <> "Australia" Then  
 
 Response.Redirect("/index.asp")
 
 Else

Dim strQuery, objRs,iPageCurrent

Set objRs = Server.CreateObject("ADODB.Recordset")

rqPage =  Request.QueryString("page")
rqRow  = Request.QueryString("row")


'If Session("CountryOrigin") = "India" OR Session("CountryOrigin") ="United Kingdom" Then 
If Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" Then
strQuery = "SELECT * FROM classroom_feedback where country = 'United Kingdom'  order by dateofpassing DESC"
Else
strQuery = "SELECT * FROM classroom_feedback where country = '"&Session("CountryOrigin")&"'  order by dateofpassing DESC"
End If
'Else
'
'strQuery = "SELECT * FROM classroom_feedback order by dateofpassing DESC"

'End If

'response.write strQuery
objRs.Open strQuery,ConnObj

'Paging'
If Not objRs.EOF Then
	arrAllFeedBacks = objRs.getrows
	firstRow = 0
	lastRow = 14
	numRows = Ubound(arrAllFeedBacks,2)
	If lastRow > numRows Then
	   lastRow = numRows
	End If
End If

objRs.Close

 If Request.QueryString("page") = "" Then
	 iPageCurrent = 1
	numRows = Ubound(arrAllFeedBacks,2)
	
	 firstRow = 0  
    lastRow = firstRow + 14 
	
	Else
	
	numRows = Ubound(arrAllFeedBacks,2)
	
	iPageCurrent = Request.QueryString("page") 
    firstRow = ((15 * iPageCurrent)-15) 
     lastRow = firstRow + 14 

    If lastRow > numRows Then
    lastRow = numRows
   End If

    If firstRow < 0 Then
       firstRow = 0
    End If

 End if


%>
<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" >&nbsp;</td>
            <td width="25%" >&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; WHY US &raquo; Classroom - ITILstudy Testimonials</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><h1 class="PageTitle">Some Testimonials For Our ITIL<sup>&reg;</sup> Exam prep Classes</h1>
			
                
              <div>
                <p class="Header">Feedback from some successful ITIL<sup>&reg;</sup> certified professionals enrolled with ITILstudy.com </p>
                <ul>
				<% If IsArray(arrAllFeedBacks) Then 
              
			 For rowcounter = firstRow To lastRow 
			 
		  %>
				  <li><% =  arrAllFeedBacks(4,rowcounter) %><br/>
                    <br/>
                    <span class="general-bodyBold"><%  =  arrAllFeedBacks(1,rowcounter) %><br>
					<% If Trim(arrAllFeedBacks(2,rowcounter)) <> "N/A" Then %>
                    Company: <% =  arrAllFeedBacks(2,rowcounter)%><br />
					<% End If %>
                    Date of passing: <%  =  Day(arrAllFeedBacks(3,rowcounter)) &"-"& Monthname(Month(arrAllFeedBacks(3,rowcounter)),3) &"-"& Year(arrAllFeedBacks(3,rowcounter)) %></span> </li>
                    <% Next %>
                </ul>
               <% 
			    ps = getPaginationString(page, (numRows + 1), 15, 2, "feedback_class.asp?name="&num&"")
				Response.Write(ps)
	           %>
                <% End If %>
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<% End If %>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->

