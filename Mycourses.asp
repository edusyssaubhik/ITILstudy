<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerloginbanner.html"-->
<!--#include virtual="/metatags/memberlogin_metatag.html"-->
<!--#include virtual="/includes/connection.asp"-->
 <!-- Body Starts --> 
  <div>
 <style type="text/css">
 .courseheader{
 background-color: lightblue;
 padding: 5px;
 }
 </style>
  	<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="235" align="left" valign="top" bgcolor="#FFFFFF">
				<table width="100%" border="0" cellspacing="0" cellpadding="8">

                  <tr>
                    <td width="2%">&nbsp;</td>
                    <td width="25%">&nbsp;</td>
                   <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; My Courses</td>
                  </tr>
                  <tr>
				   <%
				  'code by chandan to remove session of state in mycourses page
				  newstate=Session("State")
				  Session.Contents.Remove("State")
				  %>
					<!--#include virtual="/includes/innerLeftMenu.asp"-->
					<%   Session("State") =newstate %>
                    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
					<div style="margin-top:-12px; width:95%;">	
					<!--my code start here-->
               <table>
                <tbody>
				<!--<tr>
                  <td id="imageHover"><img src="/images/buttons/New.jpg" border="0"></td>
                  <td><br>
                    ITILstudy course has been updated in December, 2011 to the new format as per 2011 Syllabus and is approved by APMG.<br>
                    <br><br></td>
                </tr>-->
				<tr>
				<td>
				</BR>
				 <div><span class="Header">Welcome <%=Session("FirstName")%>&nbsp;<%=Session("LastName")%></span></div>
				</td>
				</tr>
				
              </tbody>
			  </table>
			 
<table id="myTable0" width="97%" cellspacing="0" cellpadding="0" border="0" onmouseout="javascript:highlightTableRowVersionA(0);">
<tbody>
<tr><td colspan="4"><div align="right"><a target="_blank" href="/ITIL-Online-Courses.asp">Other Online Courses</a></div></td></tr>
<tr onmouseover="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                  <!--<td width="60%" class="TableRowEven" style="cursor: default;"><a name="edu"></a><img src="/images/buttons/edu.png"></td>
				      <td width="60%" class="TableRowEven" style="cursor: default;">Following are the course (s) you have/had enrolled with us: </br></br></td>
                  <td colspan="3" class="TableRowEven" style="cursor: default;"><div align="center"><a href="/ITIL-Online-Courses.asp" ><span class="Header" style="float:right"> Other Online Courses</span></a></div></td>
                </tr>-->				
                     <%
					  Set objRs2 = Server.CreateObject("ADODB.Recordset")
					strQuery1 = "SELECT * FROM Customer_Accounts WHERE Id='"&session("current_user_id")&"'"
					objRs2.Open strQuery1,ConnObj
					if  objRs2.eof = false then
					  if IsNull(objRs2("custom")) or IsNull(objRs2("Phone")) or IsNull(objRs2("address_city")) then
					   session("IsProfileCompleted")=false
					   else
					    session("IsProfileCompleted")=true
					  end if
					end if
					objRs2.close()
					
					 ' query for facebook user					
                        Set objRs1 = Server.CreateObject("ADODB.Recordset")
						dim strEmailID						
						strEmailID = "SELECT payer_email, first_name, last_name,rollno, item_name, date_valid, paypal_address_id, pass FROM PaypalDb WHERE customer_id ='"&session("current_user_id")&"' ORDER BY date_valid desc"
						'strEmailID = "SELECT payer_email, first_name, last_name,rollno, item_name, date_valid, paypal_address_id, pass FROM PaypalDb WHERE customer_id ='"&session("current_user_id")&"'And date_valid>='"&Date&"'  ORDER BY date_valid desc"
						objRs1.open strEmailID,ConnObj
						'response.write "eof: " & objRs1.eof & "<br/>"						
						
					if objRs1.eof = false then
					%>
					<td width="60%" class="TableRowEven" style="cursor: default;">Following are the course (s) you have/had enrolled with us:</td>
                  <td colspan="3" class="TableRowEven" style="cursor: default;"></td>
                </tr>
				<tr>
				<th class="courseheader">Course name</th>
				<th class="courseheader">Status</th>
				</tr>
				<%
                        Do While NOT objRs1.Eof
						%>
						
						<tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">                       					
						<td height="108" class="TableRowOdd" style="cursor: default;">		
               <a style="cursor: cursor;" href="/Coursedetails.asp?roll=<%= objRs1("rollno") %>">							
						<!--<span class="TableCopyName"><% = objRs1("first_name") %></span>
						<span class="TableCopyName"><% = objRs1("last_name")%></span>
                        <span class="TableCopyName"><% = objRs1("payer_email")%></span>-->
						<span class="TableCopyDetails" style="text-decoration:underline;color:blue;"><% = objRs1("item_name")%></span>
						</a>
						</td>
						<td class="TableRowOdd" style="cursor: default;">
						 <a style="cursor: cursor;" href="/Coursedetails.asp?roll=<%= objRs1("rollno") %>">	
						<%
						'response.write(objRs1("date_valid")&"a    :"& Date)
						if CDate(objRs1("date_valid"))>=Date then
						%>
						<span class="TableCopyDetails" > Active</span>
						<%
						else
						%>
						<span class="TableCopyDetails" >Access expired</span>
						<%
						end if
						%>		
						</a>
                        </td>						
						
							   							  
							   </tr>
							   <%
                              objRs1.MoveNext
                    Loop
					Else 'if no courses available
					%>
					<td width="60%" class="TableRowEven" style="cursor: default;">You have not enrolled for any course: </br></br></td>
                  <td colspan="3" class="TableRowEven" style="cursor: default;"><div align="center"><a href="/ITIL-Online-Courses.asp" ><span class="Header" style="float:right"> Other Online Courses</span></a></div></td>
				  <tr onmouseover="javascript:highlightTableRowVersionA(this, '#FFFFCC');">						
						<td height="108" class="TableRowOdd" style="cursor: default;">
						<a href="/ITIL-Online-Courses.asp">
						<span class="TableCopyName">Click here to Enroll</span>
						</a>
						</td>
                </tr>
					<%
                   End If
						
						%>
						
						<!--<tr>
						<td>
              <br/>						
			<a href="/changepassword.asp?changepass=one" >
       Change Password &nbsp; &nbsp;</a>
						</td>
						</tr>
						<tr>
						<td>	
                            <br/>							
							<a href="/logoff.asp">Sign Out</a>
						</td>
						</tr>-->
						<tr>
						<td class="TableRowEven" colspan="2">&nbsp;</td></tr>
						<tr>
						<td>					
						  <span><a href="/ChooseEmail.asp">sync with other Enrolled Account</a></span>
						</td>
						</tr>
						<tr>
<td colspan="3">
</br> Please refer your friend for Online courses. by <a href="/refer-friends.asp" target="_Blank">clicking here</a></br></br></td>
</tr>
						</tbody>
		</table>
						
		          <!-- eof my code-->			 
</div>
			</div>		</td>
                    </tr>


                </table>
          </td>
		</tr>
	</table>
  </div>
  <!-- Body Ends -->
  <!--#include virtual="/includes/connectionClose.asp"-->
<!--#include virtual="/includes/footer.html"-->