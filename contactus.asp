<!--#include virtual="/metatags/contactus_metetag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/targeting-success-banner.asp"-->
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
		 
		   if (str1.indexOf(",")!=-1){
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
<script>
var imgContainer=0; 
function loadImage(imageValue){
    if(imgContainer){
    document.getElementById('officeImage').src="/images/back/loading.gif"
    document.getElementById('officeImage').src="/images/back/office"+imageValue+".jpg"
    }
    else{
    document.getElementById('imgContainerT').style.display="Block"
    imgContainer=1;
    document.getElementById('officeImage').src="/images/back/loading.gif"
    document.getElementById('officeImage').src="/images/back/office"+imageValue+".jpg"        }
}
function closeimgContainer(){
    document.getElementById('imgContainerT').style.display="none";
    imgContainer=0; 
    }
</script>

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" >&nbsp;</td>
            <td width="25%">&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; Contact Us/Feedback</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-15px; width:97%;">
              <table border="0" width="100%" cellspacing="0" cellpadding="2" >
                <tr>
                  <td colspan="2" class="general-body"><br />
                    <h1 class="PageTitle">Contact Details:<br />
                      <br />
                    <%If session("CountryOrigin") = "Germany" OR session("CountryOrigin") = "Netherlands" Then %>
                      PLEASE NOTE: ITILstudy is a brand of Edusys Services GmbH
                    <%Else %>
                        PLEASE NOTE: ITILstudy is a brand of Edusys Services Pvt. Limited, UK
                        <%End If %>
                      <%If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then  %>
                      (VMEdu, Inc., US)
                      <% End if%>
                      .</h1>
                    <%If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") =  "Germany" OR Session("CountryOrigin") = "Netherlands" Then  %>
                    <span class="Header"> a) Phone and Fax Contact </span><br>
                    <br />
                    Online Course: No phone queries; please email <a href="mailto:adminsupport@ITILstudy.com" target="_blank">adminsupport@ITILstudy.com</a><br />
                    (Please note that if you have paid for any online course, it will take up to 4 hours for your account to be activated and your log-in details will be sent to your email address. We do not ship out any study material for online courses.)<br />
                    <br />
                     <%If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then  %>US/Canada  <%ElseIf Session("CountryOrigin") ="Germany" Then  %>Germany<%ElseIf Session("CountryOrigin") ="Netherlands" Then  %>Netherlands<%End If %> ITIL<sup>&reg;</sup> Foundation Classroom Course Queries:  
                     
                      <%If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada"  Then  %>
         
                             +1-855-234-8454 or 480-882-0706 / 520-226-4988 (available only during business hours i.e. 7:00 AM to 5:00 PM MST)<br /><br />
                    <font color="red"><B>Call us now: </B> ITILstudy also offers customized weekend courses and corporate classes.</font><BR>
                    <br>
                    Fax number : 240-238-2987 <br />
                    <br />
        
          			<%ElseIf Session("CountryOrigin") =  "Germany" Then  %>
                    
                		 +4969 505027 386<br />
                         
                          <br>
                     <span class="SubHeader">Address:</span><br>
                   <table id="officeThumbs" cellpadding="0" cellspacing="0" border="0" width="602">
                   <tbody><tr>
                    <td rowspan="2" align="left" valign="top">               
                   Edusys Services GmbH<br>
				   Kurt-Blaum-Platz 8<br>
				   63450 Hanau / Frankfurt-Main<br>
                   
                   <%ElseIf Session("CountryOrigin") = "Netherlands" Then  %>
                                             
                          <br>
                     <span class="SubHeader">Address:</span><br>
                   <table id="officeThumbs" cellpadding="0" cellspacing="0" border="0" width="602">
                   <tbody><tr>
                    <td rowspan="2" align="left" valign="top">               
                   Edusys Services GmbH<br>
				   Kurt-Blaum-Platz 8<br>
				   63450 Hanau / Frankfurt-Main<br>
                         
					<%End If %>
                    
                   
<%If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada"  Then %>
                    <span class="SubHeader">Address:</span><br>
                    
                    <table border="0">
                    <tr>
                  
                    <td>VMEdu, Inc. <br />
						40 N. Central Ave. Suite 1405<br />
						Phoenix, AZ 85004

                    </td>
                     <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                     <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                      <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                      <td>
                    VMEdu, Inc. <br>
                    4539 Metropolitan Ct.<br>
                    Frederick, MD 21704 <br>
                    <br />
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    </tr>
                    </table>
                   
                    
            <%End If %>
            
                     <br /><br />
                    <span class="Header">b) Email </span><br>
                    <br />
                    Online Course Queries: <a href="mailto: adminsupport@ITILstudy.com">adminsupport@ITILstudy.com</a>.<br />
                    <%If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then  %>US/Canada  <%ElseIf Session("CountryOrigin") ="Germany" Then  %>Germany<%ElseIf Session("CountryOrigin") ="Netherlands" Then %>Netherlands<%End If %> ITIL Foundation Classroom Course Queries: <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com </a> <BR>
                    <BR>
                    <% ElseIf Session("CountryOrigin") = "Australia" Then  %>
                    <span class="Header"> a) Phone Contact </span><br />
                    <br />
                    Online Course: No phone queries; please email <a href="mailto:adminsupport@ITILstudy.com" target="_blank">adminsupport@ITILstudy.com</a><br />
                    (Please note that if you paid for any online course, it will take up to 4 hours for your account to be activated and your log-in details will be sent to your email address. We do not ship out any study material for online courses.)<br />
                    <br />
                    Australia ITIL<sup>&reg;</sup> Foundation Classroom Course Queries: +61 2 88964376 <br />
                    Praveen Jomy, ITIL - Tel No: 61-(0) 4-21440972    <br />
                    <br />
                    <span class="SubHeader">Address:</span><br>
                    Level 5, Nexus Norwest<br />
                    4 Columbia Court<br />
                    Baulkham Hills, NSW 2153<br />
                    Australia <br>
                    <br />
                    <span class="Header">b) Email </span><br>
                    <br />
                    Online Course Queries: <a href="mailto: adminsupport@ITILstudy.com">adminsupport@ITILstudy.com</a>.<br />
                    Australia ITIL Foundation Classroom Course Queries: <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com </a><BR>
                    <BR>
                    <%'End If%>
                    <%ElseIf Session("CountryOrigin") = "United Kingdom"  Then  %>
                    <span class="Header"> a) Phone Contact </span><br />
                    <br />
                    Online Course: No phone queries; please email <a href="mailto:adminsupport@ITILstudy.com" target="_blank">adminsupport@ITILstudy.com</a><br />
                    (Please note that if you paid for any online course, it will take up to 4 hours for your account to be activated and your log-in details will be sent to your email address. We do not ship out any study material for online courses.)<br />
                    <br />
                    UK ITIL<sup>&reg;</sup> Foundation Classroom Course Queries: 0800 0337 947 <br />
                    <br />
                    <span class="Header">Address:</span><br><br />
                   <table cellpadding="0" cellspacing="0" border="0" width="602" id="officeThumbs">
                   <tr>
                    <td align="left" valign="top" rowspan="2">
                   Edusys Services Private Limited<br />
                    29th Floor<br />
                    One Canada Square,<br />
                    Canary Wharf<br />
                    London<br />
                    E14 5DY<br />
                    United Kingdom<br />
                    </td>
                    <td height="30px" align="center" valign="middle">&nbsp;</td>
                    </tr>
                    <tr>
                    <td align="right" valign="bottom" style="padding:5px; border-left:solid 1px #ccc"><img src="/images/back/office-small/offsmall1.jpg" height="70" onclick="loadImage('1')"/><img src="/images/back/office-small/offsmall2.jpg" height="70" onclick="loadImage('2')" /><img src="/images/back/office-small/offsmall3.jpg" height="70" onclick="loadImage('3')"/><img src="/images/back/office-small/offsmall4.jpg" height="70"  onclick="loadImage('4')" /></td>
                    </tr>
                    </table>
                    <table cellpadding="5" cellspacing="0" border="0" width="602" id="imgContainerT" style="display:none">
                    <tr>
                    <td><div id="imgContainer">
                    <div id="imgHeader"><img src="/images/back/close-n.png" width="30" height="30" onmouseover="this.src='/images/back/close-h.png'" onmouseout="this.src='/images/back/close-n.png'" onclick="closeimgContainer()" align="right" title="close"/></div>
                    
                    <div id="imgField"><img src="/images/back/loading.gif" height="450" id="officeImage"/></div>
                    </div></td>         
                     </tr>
                                        
                    </table><br /><br />
                    <span class="Header">b) Email </span><br>
                    <br />
                    Online Course Queries: <a href="mailto: adminsupport@ITILstudy.com">adminsupport@ITILstudy.com</a>.<br />
                    UK ITIL Foundation Classroom Course Queries: <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com </a><BR>
                    <BR>
                    <%ElseIf Session("CountryOrigin") = "UAE"  Then  %>
                    <span class="Header"> a) Phone Contact </span><br>
                    <br />
                    Online Course: No phone queries; please email <a href="mailto:adminsupport@ITILstudy.com" target="_blank">adminsupport@ITILstudy.com</a><br />
                    (Please note that if you paid for any online course, it will take up to 4 hours for your account to be activated and your log-in details will be sent to your email address. We do not ship out any study material for online courses.)<br />
                    <br />
                    UAE ITIL<sup>&reg;</sup> Foundation Classroom Course Queries (not for online courses): <br />
                    <br />
                    <!--<b>Alaa Konswa  (Tel: 50-2757445)</b><br>-->
                    <br>
                    <span class="Header">b) Email </span><br>
                    <br />
                    Online Course Queries: <a href="mailto: adminsupport@ITILstudy.com">adminsupport@ITILstudy.com</a>.<br />
                    UAE ITIL Foundation Classroom Course Queries: <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com </a> <BR>
                    <BR>
                    <%'End If%>
                    <%ElseIf Session("CountryOrigin") = "Singapore"  Then  %>
                    <span class="Header"> a) Phone Contact </span><br>
                    <br />
                    Online Course: No phone queries; please email <a href="mailto:adminsupport@ITILstudy.com" target="_blank">adminsupport@ITILstudy.com</a><br />
                    (Please note that if you paid for any online course, it will take up to 4 hours for your account to be activated and your log-in details will be sent to your email address. We do not ship out any study material for online courses.)<br />
                    <br />
                    Singapore ITIL<sup>&reg;</sup> Foundation Classroom Course Queries (not for online courses): <br />
                    <br />
                    <b>Lena Stephanie (Tel: 65 91555760)</b><br>
                    <br>
                    <span class="Header">b) Email </span><br>
                    <br />
                    Online Course Queries: <a href="mailto: adminsupport@ITILstudy.com">adminsupport@ITILstudy.com</a>.<br />
                    Singapore ITIL Foundation Classroom Course Queries: <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com </a><BR>
                    <BR>
                    <%ElseIf Session("CountryOrigin") = "Other"  Then  %>
                    <span class="Header"> a) Phone Contact </span><br>
                    <br />
                    Online Course: No phone queries; please email <a href="mailto:adminsupport@ITILstudy.com" target="_blank">adminsupport@ITILstudy.com</a><br />
                    (Please note that if you paid for any online course, it will take up to 4 hours for your account to be activated and your log-in details will be sent to your email address. We do not ship out any study material for online courses.)<br />
                    <br />
                    <span class="Header">b) Email </span><br>
                    <br />
                    Online Course Queries: <a href="mailto: adminsupport@ITILstudy.com">adminsupport@ITILstudy.com</a>.<br />
                    <BR>
                    <% ElseIf Session("CountryOrigin") = "India" Then%>
                    <p><span class="Header">a) Phone Contact:</span><br />
                      <br />
                      Online Course: No phone queries; please email <a href="mailto:adminsupport@ITILstudy.com" target="_blank">adminsupport@ITILstudy.com</a><br />
                      (Please note that if you paid for any online course, it will take up to 4 hours for your account to be activated and your log-in details will be sent to your email address. We do not ship out any study material for online courses.)<br />
                      <br />
                      ITIL<sup>&reg;</sup> Classroom course queries, contact: Phone: +91 80 4155 75 47, Mobile: 9008748005
                      <% 'If Session("CountryOrigin") = "India" Then%>
                    <p> <span class="Header">b) Address:</span><br />
                      <br />
                      EDUsys Services Private Limited,<br />
                      #27, 2<sup>nd</sup> Floor, Santosh Towers,<br />
                      4<sup>th</sup> Main,100 Ft. Ring Road,<br>
                      J.P. Nagar 4<sup>th</sup> Phase,<br>
                      Bangalore - 560078 <br />
                      India<br />
                      <br />
                    </p>
                    <p> <span class="Header">c) Email: </span><br />
                      <br />
                      Online Course Queries: <a href="mailto: adminsupport@ITILstudy.com">adminsupport@ITILstudy.com</a>.<br />
                      ITIL Classroom course queries: <a href="mailto: marketing@ITILstudy.com">marketing@ITILstudy.com</a>. </p>
                    <% End If %>
                    <p> <span class="Header"><a name="feedback"></a>Feedback Form:</span><br />
                      <br />
                      We value your feedback. Please provide the same in the following format. We will respond at the earliest.<br />
                    </p></td>
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
                      <td ><select name="queryType">
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
