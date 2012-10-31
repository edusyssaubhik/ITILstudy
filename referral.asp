<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/connectionRef.asp"-->
<!-- Body Starts -->
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

					function validate_specialcharacters(field,alerttxt)
					{
						var iChars = "!#$%^&*@()+=[]\\\';{}|\":<>?";

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


					function validate_number(field,alerttxt)
					{
						var iChars = "0123456789-/,";

						with (field)
						{
							for (var i = 0; i < value.length; i++) {
								if (!(iChars.indexOf(value.charAt(i)) != -1)) {
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

						if (validate_required(yourEmail,"Please Enter Your EmailId")==false)
							  {yourEmail.focus();return false}

						// Check The Eamil Validation

						if (echeck(yourEmail)==false)
							  {yourEmail.focus();return false}
							  
							  
						// Check The EMail Field Empty Or not

						if (validate_required(YourName,"Please Enter Your YourName")==false)
							  {YourName.focus();return false}
	  

                        // Check The EMail Field Empty Or not

						if (validate_required(email_1,"Please Enter friends EmailId")==false)
							  {email_1.focus();return false}

						// Check The Eamil Validation

						if (echeck(email_1)==false)
							  {email_1.focus();return false}
							  
							  
						// Check The EMail Field Empty Or not

						if (validate_required(name_1,"Please Enter friends Name")==false)
							  {name_1.focus();return false}
	  	  
					
						}
					}


					-->
					</script>
<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="PageTitle">Referral</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
              <table width="100%" cellpadding="0" cellspacing="0">
              <tr><td>
                <%  
				    'Declaring the variables'
					Dim rqEnrollID,rqEmailID,rqTag
					
					'Retriving the values'
					rqEnrollID = Request.QueryString("id")
					rqEmailID = Request.QueryString("refEmail")
					rqTag= Request.QueryString("tag")
					
					'Creating recordset object'
					Set objRs = server.CreateObject("ADODB.Recordset")
					Set objRs1 = server.CreateObject("ADODB.Recordset")	
					
					'Checking Tag whether valid or not'
					
					strQuery = "SELECT * FROM Tag_History WHERE Tag = '"&rqTag&"' AND ValidDate >= '"& Now() &"'"
					
                    'response.Write(strQuery)

					objRs.Open strQuery, ConnObjRef
					
					If NOT objRs.EOF Then
					
						'Based on the tag getting RefId and keeping that in session'
						
						Session("RefID") = objRs("RefID")
						
						Session("CountryOrigin") = "US"
						
						
						Response.Redirect("/ITIL-Courses.asp")
						
					Else
					
						Response.Write("Code is Not Valid")
					
					End If
					%>
                    </td></tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
