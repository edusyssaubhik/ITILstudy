<!--#include virtual="/metatags/index_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/inneraboutusbanner.html"-->
<!-- Body Starts -->
<%
Dim Message
 Message = Session("Message")
 Session("Message") = ""
%>
<script language ="javascript">

// Function To Validate Fields And Display An Alert Message If Any Field Is Empty.

//Email Validation

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

  		 return true
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
function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}
}

// Function To Validate mobilefield And Display An Alert Message If The Field Is Empty.

function Mobile_check(mobilefield,mobilealerttxt)
{
	with(mobilefield)
	{
		if(mobilefield.value.length > 10 )
		{alert(mobilealerttxt);return false}
		else {return true}
	}
}

// Function To Validate mobilefield And Display An Alert Message If The Field Is Empty.

function Mobile_check1(mobilefield,mobilealerttxt)
{
	with(mobilefield)
	{
		if(mobilefield.value.length < 10 )
		{alert(mobilealerttxt);return false}
		else {return true}
	}
}




function validate_form(thisform)
{
    with (thisform)
	    {
	   



	   //Check To See If The Last Name Field Is Balnk     
	   
		if (validate_required(Name,"Please enter your Name")==false)
			  {Name.focus();return false}


//Check To See If The Personal EmailId Field Is Balnk    
	   
 	    if (validate_required(EMailID,"Please Enter Your EmailId")==false)
 		     {EMailID.focus();return false}


   //Check To See If The  mobile number Field Is Balnk    
	   
 	    if (validate_required(Cno,"Please enter contact number")==false)
 		     {Cno.focus();return false}



	   //Check To See If The  mobile number Have Numerals    
	   
 	    if (validate_number(Cno," Contact number is not a numeral")==false)
 	         {Cno.focus();return false}


		   
	   //Check To See If The Personal EmailId Correct Or Not
	   
        if (echeck(EMailID)==false)
 	         {EMailID.focus();return false}
			 
	
			 
	
	   
	}
}
</script>
<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; Payment Overphone </td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><h1 class="PageTitle">Payment Overphone</h1>
            
              <table border="0" width="100%" cellspacing="0" cellpadding="2">
                <tr>
                  <td colspan="2" class="general-body"><span class="SubHeader">Hours of operation:</span>
                  The service is available from 8:00 am to 8:00 pm EST (Monday to Friday)<br><br />
                    <span class="SubHeader">Forms of payment:</span>
                     Credit card only.<br><br />
                    <span class="SubHeader">Cards accepted:</span>
                     Visa, MC, AMEX, Discovery.<br><br />
                    If you want to do your credit card payment over phone, please send an e-mail to <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com</a> and we will call you within 12 business hours to take your payment or please fill in the form below and we will contact you.<br><br />
                  
                    <span class="Header">Contact Form</span><br>
                   
                    Please fill in the form below and we will contact you. </td>
                </tr>
                <tr>
                  <td colspan="2">&nbsp;</td>
                </tr>
                <form method="post" action="/phonepayment.asp" onSubmit="return validate_form(this)">
                  <tr>
                    <td><span class="general-bodyBold"><span class="general-bodyBold">Name:</span> </td>
                    <td><input type="text" name="Name" size="50" class="TeXtField"></td>
                  </tr>
                  <tr>
                    <td><span class="general-bodyBold"><span class="general-bodyBold">Email ID:</span> </td>
                    <td><input type="text" name="EMailID" size="50" class="TeXtField"></td>
                  </tr>
                  <tr>
                    <td><span class="general-bodyBold"><span class="general-bodyBold">Enrollment ID:</span> </td>
                    <td><input type="text" name="EnrollID" size="50" class="TeXtField"></td>
                  </tr>
                   <tr>
                    <td><span class="general-bodyBold"><span class="general-bodyBold">Contact No:</span> </td>
                    <td><input type="text" name="Cno" size="50" class="TeXtField"></td>
                  </tr>
                  <tr>
                    <td><span class="general-bodyBold"><span class="general-bodyBold">Additional Information:</span> </td>
                    <td><textarea name="Info" rows="8" cols="40" class="TeXtFieldTextarea"></textarea></td>
                  </tr>
                  <tr>
                    <td colspan="2" align="center"><div align="center">
                        <input type="submit" value="Submit" class="ButtonGeneral" style="width:60px;">
                        
                      </div></td>
                  </tr>
                </form>
                                        
                   
              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
<% If Message <> "" then %> 
<script type="text/javascript">
alert(" <% = Message %> ")
</script>
<% End if %>

