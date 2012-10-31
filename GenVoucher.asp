<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerbanner.html"-->
<!--#include virtual="/includes/connectionRef.asp"-->
 <script type="text/javascript">
					<!--
					//Validating The Email

					function echeck(str) {

							var str1 = str.value
							var at="@"
							var dot="."
							var lat=str1.indexOf(at)
							var lstr=str1.length
							var ldot=str1.indexOf(dot)
							if (str1.indexOf(at)==-1){
							   alert("Invalid E-mail ID")
							   return false
							}

							if (str1.indexOf(at)==-1 || str1.indexOf(at)==0 || str1.indexOf(at)==lstr){
							   alert("Invalid E-mail ID")
							   return false
							}

							if (str1.indexOf(dot)==-1 || str1.indexOf(dot)==0 || str1.indexOf(dot)==lstr){
								alert("Invalid E-mail ID")
								return false
							}

							if (str1.indexOf(at,(lat+1))!=-1){
								alert("Invalid E-mail ID")
								return false
							}

							if (str1.substring(lat-1,lat)==dot || str1.substring(lat+1,lat+2)==dot){
								alert("Invalid E-mail ID")
								return false
							}

							if (str1.indexOf(dot,(lat+2))==-1){
								alert("Invalid E-mail ID")
								return false
							}

							if (str1.indexOf(" ")!=-1){
								alert("Invalid E-mail ID")
								return false
							}
							
							if (str1.indexOf(",")!=-1){
								alert("Invalid E-mail ID")
								return false
							}								

							return true
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
						var iChars = "!#$%^&*@()+=-[]\\\';,{}|\":<>?./";

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



					function validate_form(thisform)
					{
						with (thisform)
						{

						// Check The EMail Field Empty Or not

						if (validate_required(points,"Please enter Points to generate voucher")==false)
							  {points.focus();return false}

						// Check The Eamil Validation

						if (validate_special(points,"Please enter integer value")==false)
							  {points.focus();return false}
							  
							  
						}
					}
					</script>
<script language="javascript" type="text/javascript">


function popitup(url) {
	newwindow=window.open(url,'name','toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=0,minimizable=0,resizable=0,height=400,width=600,top=250,left=400');
	if (window.focus) {newwindow.focus()}
	return false;
}

</script>
<% 

If Session("ReferralID") = "" Then

Response.Redirect("/RefRewRedim.asp")

Else

RqType = Request.QueryString("type")



 %>
<!-- Body Starts -->

<div>
<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  
  <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
  
  <table width="100%" border="0" cellspacing="0" cellpadding="8">
    <tr>
      <td width="2%" class="Header">&nbsp;</td>
      <td width="25%" >&nbsp;</td>
      <td width="73%" class="PageTitle"> Referral </td>
    </tr>
    <tr>
      <!--#include virtual="/includes/innerLeftMenu.asp"-->
      <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
          <%
				
				'Declare the local variables'					
				Dim rqEmail, rqPassword
				Dim strQuery, objRs,obj3
				Dim rqGenVoucher, rqRefID, rqRefName, rqRefEmail
				
				Dim Message

				'Retriving the email id annd password from RefRewRedim.asp page'
				rqEmail = Request.Form("Ref_Email")
				rqPassword = Request.Form("Ref_Pass")
				rqGenVoucher = Request.Form("GenVoucher")
				
				'Creating recordsets'
				Set objRs = Server.CreateObject("ADODB.Recordset")
				Set objPoints = Server.CreateObject("ADODB.Recordset")
				Set obj3 = Server.CreateObject("ADODB.Recordset")
				
				
				If Session("ReferralID") <> "" Then
				
				    strQuery = "SELECT RefID, Name, PayStatus, Points, EmailID FROM Ref_Account WHERE RefID = '" & Session("ReferralID") & "' "
					'Response.Write(strQuery)
					objRs.Open strQuery,ConnObjRef
					  
					If (not objRs.BOF) and (not objRs.EOF) Then
						
						RefID = objRs("RefID")
						RefName = objRs("Name")
						RefPayStatus = objRs("PayStatus")
						RqPoints = objRs("Points")
						RefEmailID = objRs("EmailID")
					
					End If
					
					objRs.Close
				
				End If
					
				%>
          <table width="100%" cellpadding="5" cellspacing="0" border="0">
            <tr>
              <td>
			  
			  <% If RqType = "" Then %>
                <form action="verifyRefRewRedim.asp" method="post" onsubmit="return validate_form(this)">
                  <table width="100%"  cellpadding="5" cellspacing="5" border="0">
                    <tr>
                      <td colspan="3">Welcome to your account which contains details regarding your reward points till
                        <% = Now() %></td>
                    </tr>
                    <tr>
                      <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="50%">Total points accumulated:</td>
                      <td width="25%"><% = RqPoints %></td>
                      <td align="25%"><a href="Voucher-his.asp?RefID=<% = RefID %>" onClick="return popitup('Voucher-his.asp?RefID=<% = RefID %>')">Referred History</a></td>
                    </tr>
                    <tr>
                      <td>Enter points to use : </td>
                      <td colspan="2"><input type="text" name="points" size="12"  /></td>
                    </tr>
                    <tr>
                      <td width="110px">To generate a voucher for the reward points that you have accumulated, </td>
                      <% If RqPoints > 0 Then %>
                      <td colspan="2"><input type="hidden" name="RefID" value="<% = RefID %>" />
                        <input type="hidden" name="txtRefName" value="<% = RefName %>" />
                        <input type="hidden" name="txtRefEmail" value="<% = rqEmailId %>" />
                        <input type="hidden" name="txtPoints" value="<% = RqPoints %>" />
                        <input type="submit" name="type" value="Generate Voucher" /></td>
                      <% Else %>
                      <td colspan="2"> You do not have reward points to generate a voucher</td>
                      <% End If %>
                    </tr>
                    <tr>
                      <td colspan="3"><b>Please note:</b> You need not use all the reward points to generate a voucher; you can split the reward points to generate multiple vouchers and avail discounted rates on any of our courses or affiliate's courses.</td>
                    </tr>
                  </table>
                </form>
                <% Elseif RqType <> "" Then 
						
						
					strQuery = "SELECT TOP 1 * FROM Ref_Voucher WHERE RefID = '" & Session("ReferralID") & "' Order By VID DESC "
					'Response.Write(strQuery)
					objRs.Open strQuery,ConnObjRef
					  
					If (not objRs.BOF) and (not objRs.EOF) Then
						
						RqUsedPoints = objRs("UsedPoints")
						RqVoucher = objRs("Voucher")
					
					End If
						
					objRs.Close
					
						strTag = "SELECT Tag  FROM Tag_History WHERE RefID = '"& Session("ReferralID") &"'"
						
						obj3.Open strTag, ConnObjRef
						
						RefTag = obj3("Tag")
								obj3.Close			
						
						%>
                <table  width="100%"  cellpadding="5" cellspacing="5" border="0">
                  <tr>
                    <td width="40%">Points used: </td>
                    <td width="60%"><% = RqUsedPoints %></td>
                  </tr>
                  <tr>
                    <td>Balance Points: </td>
                    <td colspan="2"><% = RqPoints %></td>
                  </tr>
                  <tr>
                    <td width="110px">Voucher code generated:</td>
                    <td colspan="2"><% = RqVoucher %></td>
                  </tr>
                  <tr>
                    <td colspan="2">Please use the voucher code to get discounted rate on any of the courses provided by us and our affiliates: </td>
                  </tr>
                  <tr>
                    <td colspan="2">
                    <a href="http://www.PMstudy.com/" target="_blank">PMstudy</a>&nbsp;&nbsp;&nbsp;
                    <a href="http://www.RMstudy.com/" target="_blank">RMstudy</a>&nbsp;&nbsp;&nbsp;
                      <a href="http://www.PROJstudy.com/" target="_blank">PROJstudy</a>&nbsp;&nbsp;&nbsp;
                      <a href="http://www.ITILstudy.com/" target="_blank">ITILstudy </a>&nbsp;&nbsp;&nbsp;</td>
                  </tr>
                  <tr>
                    <td colspan="2">Please feel free to refer your friends or colleagues for any of our or our affiliate courses:</td>
                  </tr>
                  <tr>
                    <td colspan="2"><form action="/referralsendmail.asp" method="post">
                        <table width="100%">
                          <tr>
                            <td><b>Your EamilID:</b></td>
                            <td><input type="text" name="yourEmail" size="10"></td>
                          </tr>
                          <tr>
                            <td><b>Friend's Email:</b></font></td>
                            <td><input type="text" name="email_1" size="10"></td>
                          </tr>
                          <tr>
                            <td><b>Friend's Email:</b></font></td>
                            <td><input type="text" name="email_2" size="10"></td>
                          </tr>
                          <tr>
                            <td><b>Friend's Email:</b></td>
                            <td><input type="text" name="email_3" size="10"></td>
                          </tr>
                          <tr>
                            <td colspan="2">&nbsp;</td>
                          </tr>
                          <tr align="center">
                            <td>&nbsp;</td>
                            <td><input type="Submit" name="type" value="Submit"></td>
                          </tr>
                        </table>
                      </form>
              </td>
            </tr>
          </table>
            <% End If %>
          </td>
      </tr>
    </table>
  </td>
  </tr>
</table>
</div>
</div>
<!-- Body Ends -->

<% End If %>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
