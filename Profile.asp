<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerloginbanner.html"-->
<!--#include virtual="/metatags/memberlogin_metatag.html"-->
<!--#include virtual="/includes/connection.asp"-->

</script>
<script type="text/javascript">
function Form_reg_Validator(theform)
{
  //Check To See If The Current Password Field Is Blank    
  if (theform.first_name.value == "Please Enter Your First Name" || theform.first_name.value =="" || theform.first_name.value.length <2)
  {
    alert("Please enter first name");
    theform.first_name.focus();
	return(false);
  }
   if (theform.last_name.value == "Please Enter Your Last Name" || theform.last_name.value =="" || theform.last_name.value.length<1)
  {
    alert("Please enter last name");
    theform.last_name.focus();
	return(false);
  } 
 
if (isNaN(theform.phone.value))
  {
    alert("Please enter numeric only");
    theform.last_name.focus();
	return(false);
  }   								  
}
				

</script>
 <!-- Body Starts --> 
  <div> 
    <%
				  'code by chandan to remove session of state in mycourses page
				  newstate=Session("State")
				  Session.Contents.Remove("State")
				  %>
  <%
   If trim(session("current_user_id")) = "" then 'means user not logged in
	 Response.Redirect("/memberlogin.asp")
	 End if
  

                          first_name = Request.Form("first_name")
						last_name = Request.Form("last_name")
						custom = Request.Form("custom")
						phone = Request.Form("phone")
						city=Request.Form("city")						
						if first_name="" and last_name="" then 
                          Set objRs = Server.CreateObject("ADODB.Recordset")		
						  strQuery = "SELECT * FROM Customer_Accounts WHERE Id='"&session("current_user_id")&"'"
						 
						  objRs.open strQuery,ConnObj								
											
						 if objRs.eof = false then	
						 first_name=objRs("first_name")
						 last_name=objRs("last_name")
						 custom=objRs("custom")
						 phone=objRs("phone")
						 city=objRs("address_city")
						 first_name=objRs("first_name")
						 end if		
						 objRs.close
                     Else					 
                      if  Len(first_name)>2 and Len(last_name)>1 then 
					  'response.write("update")
						ConnObj.Execute "UPDATE Customer_Accounts SET  custom = '"&custom&"', phone = '"&phone&"',address_city = '"&city&"' WHERE Id ='"&session("current_user_id")&"'"
						'response.write "UPDATE Customer_Accounts SET  custom = '"&custom&"', phone = '"&phone&"',address_city = '"&city&"' WHERE Id ='"&session("current_user_id")&"'"
                      msg="Change successful"
						end if					  
                     end if	
			'for profile session update
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
						
  %>
  <br/>
  <div> <span class="Error" style="color:green"><% =msg%></span>
  	<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="235" align="left" valign="top" bgcolor="#FFFFFF">
				<table width="100%" border="0" cellspacing="0" cellpadding="8">

                  <tr>
                    <td width="2%">&nbsp;</td>
                    <td width="25%">&nbsp;</td>
                   <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; Profile</td>
                  </tr>
                  <tr>
					<!--#include virtual="/includes/innerLeftMenu.asp"-->
					<%   Session("State") =newstate %>
                    <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
					<div style="margin-top:-12px; width:95%;">
					<br />

						<div>
						  <table border="0" cellpadding="4" cellspacing="0" width="">
						   <form method="POST" action="/profile.asp" name="form2" onSubmit="return Form_reg_Validator(this)">
                          <!--  <form method="POST" action="/Registeremail.asp" name="form2" onSubmit="return Form_reg_Validator(this)">-->
						      <tr>
						        <!--<td colspan="2"><h1 class="PageTitle">Please Register <span style=""> | </span><a href="/fbApp/fb.asp"><img src="/flogin.gif"/> </a> </h1></td>-->
								 <td colspan="2"><h1 class="PageTitle">Profile</h1></td><!--<td><a href="/fbApp/fb.asp"><img src="/flogin.gif"/> </a> </td>-->
						      </tr>						     
							  <tr>
						        <td><span class="general-bodyBold">firstname</span><span class="Required">*</span>:</td>
						        <td>
								 <input type="text" name="first_name" value="<%=first_name%>" class="TeXtField"></td>
						      </tr>
							  <tr>
						        <td><span class="general-bodyBold">Last Name</span><span class="Required">*</span>:</td>
						        <td>
								<input type="text" name="last_name" value="<%=last_name%>" class="TeXtField"></td>
						      </tr>
						      <tr>
						        <td><span class="general-bodyBold">City</span>:</td>
						        <td>
								<input type="text" name="city" value="<%=city%>" size="50" class="TeXtField">
								</td>                              
						      </tr>
						      <tr>
						        <td><span class="general-bodyBold">Company name</span>:</td>
						        <td>
								<input type="text" name="custom"  value="<%=custom%>" size="50" class="TeXtField">
								</td>
						      </tr>	
 <tr>
						        <td><span class="general-bodyBold">Contact-no</span>:</td>
						        <td>
								<input type="text" name="phone" value="<%=phone%>" size="50" class="TeXtField">
								</td>
						      </tr>								  
						      <tr>
						        <td>&nbsp;</td>
								<td>
								<input type="submit" class="ButtonGeneral" value=" Save " style="width:60px;" />
								
						          <input type="reset" value="Reset" class="ButtonGeneral" style="width:60px;">                                  
                          
                             
						        </td>
						      </tr>
						    </form>
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