<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerloginbanner.html"-->
<!--#include virtual="/metatags/memberlogin_metatag.html"-->
<!--#include virtual="/includes/connection.asp"-->
<script type="text/javascript">
<!--
function Form_Validator(theform)
{

  //Check To See If The Current Password Field Is Blank
   
  if (theform.payer_email.value == "Enter your email address")
  {
    alert("Please enter email id");
    theform.payer_email.focus();
	return(false);
  }

  //Check To See If The New Password Field Is Blank
    
  if (theform.pass.value == "********")
  {
    alert("Please enter password");
    theform.pass.focus();
	return(false);
  }

}
-->
</script>
 <!-- Body Starts --> 
 <%
 guid1 =  Request.querystring("key")
 dim value,EmailGuid,paypalguid, Isverified
 Isverified=false 

 value=Split(guid1,",")	

 if guid1<>"" then
    paypalguid=value(0)
    EmailGuid=value(1)	

    dim strEmailID
						strEmailID = "SELECT Id,first_name, last_name,account_type_id, email,password FROM Customer_Accounts WHERE emailverification_code = '"&EmailGuid&"' ORDER BY id desc"
								           set objRs1 = server.CreateObject("ADODB.recordset")		

						objRs1.open strEmailID,ConnObj
						if objRs1.eof = false then	
					   dim id
					
					   id=objRs1("Id")		
					
						
						Set objRs3 = Server.CreateObject("ADODB.Recordset")
						
						strEmailID = "SELECT Id, payer_email FROM PaypalDb WHERE EmailVerificationcode = '"&paypalguid&"'"
						objRs3.open strEmailID,ConnObj           'get all paypal value using email
						if objRs3.eof = false then  'user verified
						session("current_user_id")=id
						Session("FirstName")=objRs1("first_name")
						Session("LastName")=objRs1("last_name")	
						session("loggedinEmail")=objRs1("email")
						
						' Session("FirstName")=objRs1("first_name")
						' Session("LastName")=objRs1("last_name")	
						' session("loggedinEmail")=objRs1("email")
						 Isverified=true                '======= bool is true now

					  Set objRs2 = Server.CreateObject("ADODB.Recordset")						
						strEmailID = "SELECT ID, payer_email FROM PaypalDb WHERE payer_email = '"&objRs3("payer_email")&"' ORDER BY id desc"
						objRs2.open strEmailID,ConnObj
						if objRs2.eof = false then
                          Do While NOT objRs2.Eof	
						    ConnObj.Execute "UPDATE PaypalDB SET  customer_id = '"&id&"' WHERE id ='"&objRs2("ID")&"'"
                              objRs2.MoveNext
                         Loop
					'Response.Redirect("/Mycourses.asp")
                  else
						'Response.Redirect("/ITIL-Online-Courses.asp")		
						 End If
					   
						end if
						
						
						 End if
						 End if
						
						 %>
  <div>  
  	<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="235" align="left" valign="top" bgcolor="#FFFFFF">
				<table width="100%" border="0" cellspacing="0" cellpadding="8">

                  <tr>
                    <td width="2%">&nbsp;</td>
                    <td width="25%">&nbsp;</td>
                   <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; choose Email</td>
                  </tr>
                  <tr>
					<!--#include virtual="/includes/innerLeftMenu.asp"-->
                    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
					<div style="margin-top:-12px; width:95%;">
					<br />

						<div>
						  <table border="0" cellpadding="4" cellspacing="0" width="">
						  <%
						  if Isverified=true then
						  %>
						   <tr>
						        <td colspan="2"><h1 class="PageTitle">Thank you</h1></td>
						      </tr>
						      <tr>
						        <td colspan="2">&nbsp;</td>
						      </tr>
							  <tr>
							  <td>
							  Thank you for verification now this email id has synchronized with your account
							  </td>
							  </tr>
							  <tr>
							  <td
							 <span> Visit my enrolled courses by <a href="/Mycourses.asp">clicking here</a>.</span>
							  </td>
							  </tr>
							  <tr>
							  <td
							 <span> Visit new courses by <a href="/ITIL-Online-Courses.asp">clicking here</a>.</span>
							  </td>
							  </tr>
						  <%
						else
						  %>
 <tr>
						        <td colspan="2"><h1 class="PageTitle">Invalid Link</h1></td>
						      </tr>
						      <tr>
						        <td colspan="2">&nbsp;</td>
						      </tr>
							  <tr>
							  <td>
							  Either your link has expired or it is invalid
							  </td>
							  </tr>
						 <%
						 end if
						  %>
						    
						  </table>
						</div>
					
						
			</div>		</td>
                    </tr>


                </table>
          </td>
		</tr>
	</table>
  </div>
  <!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->