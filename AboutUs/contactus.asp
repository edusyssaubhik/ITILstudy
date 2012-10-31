<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/inneraboutusbanner.html"-->
<!--#include virtual="/metatags/contactus_metatag.html"-->
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
           <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; ABOUT US &raquo; Contact Us/Feedback</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
			<div style="margin-top:-15px; width:97%;">
		
              <table border="0" width="100%" cellspacing="0" cellpadding="2" >
                <tr>
                  <td colspan="2" class="general-body">
				  <p><span class="PageTitle">Contact Details:<br /><br />Please Note: Projstudy is a brand of Edusys Services Private Limited</span></p>
                    
				  <p><span class="Header">a) Phone Contact:</span><br />
                  <% If Session("CountryOrigin") = "India" Then %>
                 <!-- Online Course: No phone queries; please email <a href="mailto: adminsupport@projstudy.com">adminsupport@projstudy.com</a>.<br />
                  (Please note that if you paid for any online course, it will take up to 4 hours for your account to be activated and your log-in details will be sent to your email address. We do not ship out any study material for online courses).<br /><br />-->
                  PRINCE2<sup>&reg;</sup> Classroom course queries,contact:
Phone: +91 80 4155 75 47,
Mobile: +91 96866 02156 / 57
                  </p>
                  <% ElseIF Session("CountryOrigin") = "United Kingdom" Then %> 

<p>UK PRINCE2<sup>&reg;</sup> Classroom course queries (not for online courses): +44(0) 8000 337 947<br />

<% ElseIF Session("CountryOrigin") = "Australia"   Then  %>
                
<p>Australia PRINCE2<sup>&reg;</sup> Classroom course queries (not for online courses): +61 2 8896 4313<br />


   
<% End If %> 
				  <p>
                                   
                  <span class="Header">b) Address:</span><br /><br />
                   <% If Session("CountryOrigin") = "India" Then %>
                    EDUsys Services Private Limited,<br />
				    #27, 2<sup>nd</sup> Floor, Santosh Towers,<br />
                     4<sup>th</sup> Main,100 Ft. Ring Road,<br>
                     J.P. Nagar 4<sup>th</sup> Phase,<br>
				     Bangalore - 560078 <br />
                   India<br /><br />  
                    <% ElseIF Session("CountryOrigin") = "United Kingdom" Then  %>
                   Edusys Services Pvt Limited<br />

1-3 Floor<br />
124 Baker Street<br />
London<br />
W1U 6TY<br />
England   <br /> <br /> 

  <% ElseIF Session("CountryOrigin") = "Australia"   Then  %>
                
Level 5, Nexus Norwest<br />
4 Columbia Court<br />
Baulkham Hills, NSW 2153<br />
Australia<br /> <br /> 

   <% End If %>     
                  </p>
				<p>
                <span class="Header">c) Email: </span><br /><br />
                 <!--Online Course Queries: <a href="mailto: adminsupport@projstudy.com">adminsupport@projstudy.com</a>.<br />-->
                PRINCE2<sup>&reg;</sup> Classroom course queries: <a href="mailto: marketing@projstudy.com">marketing@projstudy.com</a>.
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
                     <form name="complaint" action="insertQuery.asp" method="post" onSubmit="return validate_form(this)">
        
 
     <table border="0" cellspacing="5" cellpadding="0" width="100%" >
	         <tr>
        <td><span class="general-bodyBold">First Name:</span></td>
        <td><input type="text" name="FirstName" id="FirstName" size="20" /></td>
        </tr>
	         <tr>
        <td><span class="general-bodyBold">Last Name:</span></td>
        <td><input type="text" name="LastName" id="LastName" size="20" /></td>
        </tr>		
		        <tr>
        <td><span class="general-bodyBold">Email:</span></td>
        <td><input type="text" name="email" id="email" size="20" /></td>
        </tr>
		<tr>
		<td width="20%"><span class="general-bodyBold">Query Type:</span></td>
        <td >
        <select name="queryType">
         <option value="">--Select--</option>
                  <option value="Website/Login issues">Website/Login issues</option>
                  <option value="Venue related comments">Venue related comments</option>
                  <option value="Other Material related issues">Other Material related issues</option>
                  <option value="Payment related">Payment related</option>
                  <option value="Reschedule/Cancellation related queries"> Reschedule/Cancellation related queries </option>
                  <option value="Feedback"> Feedback</option>
                  <option value="Course content related">Course content related</option>
                  <option value="Examination related queries">Examination related queries</option>
                  <option value="Miscellaneous Issues">Miscellaneous Issues</option>
                 
        </select>
        </td>
        </tr>
        
        <tr>
        <td><span class="general-bodyBold">Subject:</span></td>
        <td><input type="text" name="subject" id="subject" size="40" /></td>
        </tr>
		
        <tr>
        <td><span class="general-bodyBold">Feedback/Complaint:</span></td>
        <td><textarea name="complaint" rows="10" cols="20"></textarea></td>
        </tr>
        <tr>
        <td></td>
        <td><input type="Submit" name="type" value="Submit" />
        <input type="reset"  value="Reset" /></td>
        </tr>
        </table>
        </form>
              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
