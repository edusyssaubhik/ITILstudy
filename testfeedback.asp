<!--#include virtual="/metatags/testfeedback_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/innerwhyusbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/pagination.asp"-->
<!-- Body Starts -->

<%
Dim strQuery, objRs,iPageCurrent

Set objRs = Server.CreateObject("ADODB.Recordset")

rqPage =  Request.QueryString("page")
rqRow  = Request.QueryString("row")

strQuery = "SELECT * FROM online_feedback order by id DESC"

objRs.Open strQuery,ConnObj

'Paging'
If Not objRs.EOF Then
	arrAllFeedBacks = objRs.getrows
	firstRow = 0
	lastRow = 19
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
    lastRow = firstRow + 19 
	
	Else
	
	numRows = Ubound(arrAllFeedBacks,2)
	
	iPageCurrent = Request.QueryString("page") 
    firstRow = ((20 * iPageCurrent)-20) 
     lastRow = firstRow + 19 

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
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; WHY US &raquo; Online - ITILstudy Testimonials</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
                <h1 class="PageTitle">Testimonials</h1>
                  <p class="Header">Sample Feedback from some successful ITIL<sup>&reg;</sup> certified professionals enrolled with ITILstudy.com </p>
                  <ul>
                  <% If IsArray(arrAllFeedBacks) Then 
              
			 For rowcounter = firstRow To lastRow 
			 
		  %>
				  <li><% =  arrAllFeedBacks(2,rowcounter) %><br/>
                    <br/>
                    <span class="general-bodyBold"><%  =  arrAllFeedBacks(1,rowcounter) %>
                    </span> </li>
                    <% Next %>
                </ul>
               <% 
			    ps = getPaginationString(page, (numRows + 1), 20, 2, "testfeedback.asp?name="&num&"")
				Response.Write(ps)
	           %>
                <% End If %>
              
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
