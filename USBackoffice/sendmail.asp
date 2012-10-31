<!--#include virtual="/includes/connection.asp"-->
<% If Session("USBUserId") = "" Then
    Response.Redirect("default.asp")
   Else
%>
<%
 'Written By : Bharath'
 'Created Date: 31/11/2007'
 'Last UpaDated: 29/04/2011'
 'Description :'
 'Purpose : Send Marketing Mails'

'Declare Local Variables'
Dim rqCallId
Dim rqAction
Dim strValue

Set objRs = Server.CreateObject("ADODB.Recordset")

'Retrive The Type Within this page'
rqCallId = Request.QueryString("callid")
rqAction = Request.QueryString("action")
rqUSBackoffice = Request.Form("USBackoffice")
'getting the session into variable
BackofficeEmailID = Session("USBUserId") 

'response.Write(BackofficeEmailID)
'Session("USBUserId") = payer_email


	strQuery = "SELECT callername,emailid,question,website FROM ITIL_callsreceived_new WHERE callid = '"& rqCallId &"'"

	objRs.Open strQuery,ConnObj
		
	Do Until objRs.EOF 
			
		session("website") = objRs("website")
		first_name = objRs("callername")
		payer_email     = objRs("emailid")
		feedback  = objRs("question")
		
		'response.Write(payer_email)
		
	objRs.Movenext
	Loop
	objRs.Close

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Send Marketing Mails</title>
<script language="javascript">
body {
	background: white;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #646464;
	text-align: center;
}
</script>
<script language="javascript">
function Form_Validator(theform)
{

	if (theform.tempNo1.value == "")
	{
	 alert("Please select template1");
	 theform.tempNo1.focus();
	 return (false);
	} 
	
	if (theform.tempNo2.value == "")
	{
	 alert("Please select template2");
	 theform.tempNo2.focus();
	 return (false);
	}	

}
</script>
<script type="text/javascript">

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
	var iChars = "!#$%^&*@()+=-[]\\\';,{}|\":<>?";

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
	var iChars = "0123456789";

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

    // Check The Id Field Empty Or Not

	if (validate_required(SrNo,"Please Enter ID Number")==false)
	      {SrNo.focus();return false}

    // Check The If You Given Any Special Characters In Id field'

	if (validate_special(SrNo,"Your ID Has Special Characters. \n Please remove them and try again")==false)
	 	 {SrNo.focus();return false}

    // Check The Phone Number Field Have numerals

	if (validate_number(SrNo,"Your ID is not a numeral")==false)
	      {SrNo.focus();return false}

    }
	// Check the Email Template Selected or Not

	if(thisform.TempNo.value == "" )
	{
	  alert("PLease select the Email Template");
	  thisform.TempNo.focus();
	  return (false);
	}

	with (thisform)
	{

    // Check The EMail Field Empty Or not

	if (validate_required(emailfrom,"Please Enter Email From")==false)
		  {emailfrom.focus();return false}

    // Check The Eamil Validation

    if (echeck(emailfrom)==false)
	      {emailfrom.focus();return false}

	if (validate_required(dbtables,"Please Select DataBase")==false)
		  {dbtables.focus();return false}

    // Check The EMail Field Empty Or not

	if (validate_required(bcc,"Please Enter BCC")==false)
		  {bcc.focus();return false}

    // Check The Eamil Validation

    if (echeck(bcc)==false)
	      {bcc.focus();return false}

    // Check The EMail Field Empty Or not

	if (validate_required(cc,"Please Enter CC")==false)
		  {cc.focus();return false}

    // Check The Eamil Validation

    if (echeck(cc)==false)
	      {cc.focus();return false}

    // Check The EMail Field Empty Or not

	if (validate_required(replyto,"Please Enter Re-PlyTo EmailId")==false)
		  {replyto.focus();return false}

    // Check The Eamil Validation

    if (echeck(replyto)==false)
	      {replyto.focus();return false}

	}
}
</script>
</head>
<body>
<table width="80%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#00B0EC" class="dbborder" >
  <tr>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="2">
        <% If Session("website") = "PMstudy" Then %>
        <form name="one" action="http://www.pmstudy.com/adminsendemail1.asp" method="post" target="_blank" onsubmit="return validate_form(this)">
        
        <% ElseIf Session("website") = "ITILstudy" Then %>
        <form name="one" action="http://www.ITILstudy.com/adminsendemail1.asp" method="post" target="_blank" onsubmit="return validate_form(this)">
          <% End If %>
		  <input type="hidden" name="BackofficeEmailID" value="<% = BackofficeEmailID %>" />
          <input type="hidden" name="USBackoffice" value="USBackoffice" />
          <input type="hidden" name="payer_email" value="<% = payer_email %>" />
          <input type="hidden" name="first_name" value="<% = first_name %>" />
          <input type="hidden" name="callId" value="<% = rqCallId %>" />
          <input type="hidden" size="3000" name="feedback" value="<%= feedback %>">
          <tr>
            <td colspan="2" bgcolor="#00B0EC">Select Template </td>
          </tr>
          <tr class="rowEven">
            <td>Email From : </td>
            <td><% = BackofficeEmailID %></td>
          </tr>
          <tr class="rowOdd">
            <td>To : </td>
            <td><% = payer_email %></td>
          </tr>
          <tr>
            <input type="hidden" size="30" name="submitvalue" value="Initialize">
          <tr class="rowOdd">
            <td>Cc : </td>
            <td><% = BackofficeEmailID %></td>
          </tr>
          <tr>
          <tr class="rowOdd">
            <td valign="top">Question : </td>
            <td><textarea name="feedback" rows="7" cols="30"></textarea></td>
          </tr>
          <tr>
            <td >Mail to be sent:</td>
            <td valign="top"><select name="MailiD">
                <% If Session("website")= "PMstudy" Then 
					'pmstudy email template
				%>
                <option value="1"> Freeform Text - answering emails ( existing user )</option>
                <option value="2"> Freeform Text - answering emails ( new user - no Study Procedure )</option>
                <option value="8"> Freeform Text - answering emails ( new user - with Study Procedure )</option>
                <option value="10"> Website slow at present</option>
                <option value="13"> Website slow at present, will refund money</option>
                <option value="11"> Website performance has improved</option>
                <option value="12"> Website performance has improved - will refund money </option>
                <option value="15"> Thank you for feedback - not a PMP till now</option>
                <option value="16"> Thank you for feedback - successful PMP</option>
                <option value="3"> Congratulation on passing PMP Exam</option>
                <option value="4"> About PMstudy.com</option>
                <option value="5"> breaking up PMstudy.com course to 2 study durations</option>
                <option value="6"> Referring corrections to Academic Team</option>
                <option value="9"> Alternate payment through CCAvenue</option>
                <option value="14"> About PMP Bulk / Corporate enrollment</option>
                <option value="7"> Corporate email India : About PMstudy.com , 6sigmastudy.com</option>
                <option value="17">Unable to make payment using the credit card (For online courses)</option>
                <option value="18">If payment cannot be made through PayPal (for online courses)</option>
                <option value="19"> About PMstudy's PMP online course </option>
                <option value="20"> About CAPM </option>
                <option value="21" >About CAPM Bulk/ Corporate discount </option>
                <option value="23">Require company email address for providing reference</option>
                <% ElseIf Session("website")= "ITILstudy" Then
					'projstudy email template
				 %>
                <Option VALUE="1">About PROJstudy</option>
                <Option VALUE="2">Feedback to PROJstudy.com course - existing user</option>
                <Option VALUE="3">Feedback to PROJstudy.com course - New User</option>
                <Option VALUE="4">Feedback to PROJstudy.com course - with study procedure</option>
                <Option VALUE="5">Website performance has improved, will provide refund</option>
                <Option VALUE="6">Website performance has improved</option>
                <Option VALUE="7">Website slow at present, performance will improve shortly</option>
                <option value="8">Website slow at present, will provide refund</option>
                <option value="9">About PROJstudy's PRINCE2 online course</option>
                <option value="10">If payment cannot be made through PayPal (for online courses)</option>
                <option value="11">Re Bulk-Corporate Enrollment in www.PROJstudy.comd</option>
                <option value="12">Require company email address for providing reference</option>
                <option value="13">Suggestions for PROJstudy.com course</option>
                <option value="14">Unable to make payment using the credit card (For online courses)</option>
                <option value="15">Enrolment details for PROJstudy PRINCE2 Classroom courses</option>
                <option value="16">Reminder - Payment Declined from Google Checkout</option>
                <option value="17">Class Confirmation</option>
                <option value="18">Eligibilty Criteria</option>
                <option value="19">Enrolment email</option>
                <option value="20">Payment received</option>
                <option value="21">Pre- course study</option>
                <option value="22">Rescheduling query</option>
                <option value="23">Course Content</option>
                <% End If %>
              </select>
            </td>
          </tr>
          <tr class="rowEven">
            <td></td>
            <td><input type="Submit" value="Preview Email"></td>
          </tr>
        </form>
        <tr class="rowEven">
          <td colspan="2">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td colspan="3"><% Response.write(strBody)%></td>
  </tr>
</table>
</div>
</body>
</html>
<%
End If
%>
</BODY>
</HTML>
