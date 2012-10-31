<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/inneraboutusbanner.html"-->
<!--#include virtual="/metatags/contactus_metetag.html"-->
<!-- Body Starts -->

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
function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}
}
// Function To Validate The Form And Display An Alert Message If Any Field Is Found Empty.

function validate_form(thisform)
{
    with (thisform)
    {
     
	   //Check To See If The  Name Field Is Balnk     
		
		if (validate_required(FirstName,"Please enter the First Name")==false)
			  {FirstName.focus();return false}

		if (validate_required(LastName,"Please enter the Last Name")==false)
			  {LastName.focus();return false}
			  
		if (validate_required(email,"Please enter the Email ID")==false)
			  {email.focus();return false}			  
			  			  
	   //Check To See If The EmailId Correct Or Not   
	   
        if (echeck(email)==false)
 	         {email.focus();return false}
			 
  }
  
					 if (thisform.queryType.value == "") 
							  {
								alert("Please select Complaint Type");
								thisform.queryType.focus();
								return(false);
							  }
					
					
					   with (thisform)
						 {

						// Check The subject Field Empty Or Not

						if (validate_required(subject,"Please Enter subject")==false)
							  {subject.focus();return false}
							  
						// Check The complaint Field Empty Or Not

						if (validate_required(complaint,"Please Enter complaint")==false)
							  {complaint.focus();return false}
                     
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
           <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; Contact Us/Feedback</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
			<div style="margin-top:-15px; width:97%;">
		
              <table border="0" width="100%" cellspacing="0" cellpadding="2" >
                <tr>
                  <td colspan="2" class="general-body">
				  <p><span class="PageTitle">Contact Details:<br /><br />PLEASE NOTE: ITILstudy is a brand of EDUsys Services Pvt. Limited.</span></p>
                    <% If Session("CountryOrigin") = "India" Then%> 
				  <p><span class="Header">a) Phone Contact:</span><br />
                 ITIL<sup>&reg;</sup> Classroom course queries, contact: Phone: +91 80 4155 75 47, Mobile: +91 96866 02156 / 57
                   <% End If %>
                  </p>
                 

                <% If Session("CountryOrigin") = "India" Then%>    
				  <p>
                  <span class="Header">b) Address:</span><br /><br />
                    EDUsys Services Private Limited,<br />
				    #27, 2<sup>nd</sup> Floor, Santosh Towers,<br />
                     4<sup>th</sup> Main,100 Ft. Ring Road,<br>
                     J.P. Nagar 4<sup>th</sup> Phase,<br>
				     Bangalore - 560078 <br />
                   India<br /><br />  
                  </p>
				   <% ElseIf Session("CountryOrigin") = "US" Then%>
				    <span class="Header">b) Address:</span><br /><br />
                    VMEDU, Inc. <br />
				    4539 Metropolitan Ct.<br />
                     Frederick, MD 21704 <br /><br />  
                  </p>
				   <% End If %>    
				<p>
                <span class="Header">c) Email: </span><br /><br />
                 <!--Online Course Queries: <a href="mailto: adminsupport@projstudy.com">adminsupport@projstudy.com</a>.<br />-->
                ITIL Classroom course queries: <a href="mailto: marketing@itilstudy.com">marketing@itilstudy.com</a>.
                </p>
                
               <p>
                <span class="Header"><a name="feedback"></a>Feedback Form:</span><br /><br />
We value your feedback. Please provide the same in the following format. We will respond at the earliest.<br />
 </p>
				 </td>
                </tr>
                <tr>
                  <td colspan="2">&nbsp;</td>
                </tr>
                   <form method="post" action="./feedBackAns.asp" onsubmit="return validate_form(this)">
                  <tr>
                    <td><span class="general-bodyBold"></span><span class="general-bodyBold">Name:</span> </td>
                    <td><input type="text" name="Name" size="40" class="TeXtField"></td>
                  </tr>
                  <tr>
                    <td><span class="general-bodyBold"></span><span class="general-bodyBold">Email address:</span> </td>
                    <td><input type="text" name="EMailID" size="40" class="TeXtField"></td>
                  </tr>
                  <tr>
                    <td><span class="general-bodyBold"></span><span class="general-bodyBold">Feedback:</span> </td>
                    <td><textarea name="Feedback" rows="8" cols="40" class="TeXtFieldTextarea"></textarea></td>
                  </tr>
                  <tr>
                    <td colspan="2" align="center"><div align="center">
                        <input type="submit" value="Submit" class="ButtonGeneral" style="width:60px;">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" value="Clear form" class="ButtonGeneral" style="width:75px;">
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
