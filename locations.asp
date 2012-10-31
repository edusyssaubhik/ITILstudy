<!--#include virtual="/metatags/index_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/classroombanner.html"-->
<!--#include virtual="/includes/connection.asp"-->


<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
	  <table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="25%" >&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo;Locations</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
			 <h1 class="PageTitle">LUXURIOUS & CONVENIENT LOCATIONS ACROSS THE US</h1>
            <div >
            <p>  ITILstudy conducts several programmes at almost all major cities in the US. Several luxurious and convenient locations where we conduct these 2 Day ITIL<sup>&reg;</sup> Foundation Programmes are listed below.<br />
                <br />Please click on the city to know the available venues in that area.<br /><br /></p>
				        <%
				'Local variables'
				Dim strLocation, objRs, rqLocation
				Dim strLoc, objRsLoc
				
				Set objRs = Server.CreateObject("ADODB.Recordset")
				Set objRsLoc = Server.CreateObject("ADODB.Recordset")
				
				strLocation = "SELECT Distinct(location) FROM ITIL_Courselocations order by location"
				
				objRs.Open strLocation, ConnObj
				
				'Retriving location'
				rqLocation = Request.QueryString("location")
				
				If rqLocation <> "" Then
				
					strLoc = "SELECT imageName, locationaddress FROM ITIL_Courselocations WHERE location = '"& rqLocation &"'"
					
					objRsLoc.Open strLoc, ConnObj
				
				End If 
		
				%>
                         <table border="0" cellpadding="7">
					<tr>
    					<td>         
                        <table border="0">   	
						<% Do Until objRs.EOF %>  
                        <tr rowspan="50">
                            <td><a href="locations.asp?location=<% = objRs("location") %>"><% = objRs("location") %></a></td>
                        </tr>
                        <% objRs.Movenext 
                           Loop 
                           objRs.Close%>
                        </table>
                        </td>
                        <% If rqLocation <> "" Then %>
                        <td>
                        <table border="0" cellpadding="0" cellspacing="5">
                        	<% Do Until objRsLoc.EOF %>
                        	<tr>
                            	<td><img src="/images/Locations/<% = objRsLoc("imageName") %>" width="264" /></td>
                                <td ><% = objRsLoc("locationaddress") %></td>
                            </tr>
                            <% objRsLoc.Movenext
							   Loop
							   objRsLoc.Close %>
                        </table>
                        </td>
                        <% Else %>
                         <td>
                        <table border="0" cellpadding="0" cellspacing="7">
                        	<tr>
                            	<td><a href="/locations.asp?location=Boise"><img src="/images/Locations/Holiday Inn Boise.jpg" width="250" /></a></td>
                                <td ><a href="/locations.asp?location=Cincinnati/Blue Ash"><img src="/images/Locations/HILTON GARDEN INN - CINCINNATI BLUE ASH.jpg" width="250" /></a></td>
                            </tr>
                            <tr>
                            	<td><a href="/locations.asp?location=Frederick"><img src="/images/Locations/Hampton Inn & Suites Frederick - Frederick.jpg" width="250" /></td>
                                <td><a href="/locations.asp?location=Sacramento"><img src="/images/Locations/Hampton Inn and Suites Roseville - Sacramento.jpg" width="250" /></td>
                            </tr>
                        </table>
                        </td>
                        <% End If %>
                       </tr>
                      </table>
                         
				</td>
                
          </tr>
        </table></td>
    </tr>
  </table>
</div>

<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->                     
                   