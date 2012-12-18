<!--#include virtual="/metatags/contactus_metetag.html"-->
<!--#include virtual="/includes/headermetaDutch.asp"-->
<!--#include virtual="/includes/inneraboutusbanner.html"-->
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
            <td width="73%" class="breadcrumb">Home &raquo; Neem contact met ons op/Feedback </td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu-Dutch.asp"-->
<td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-15px; width:97%;">
              <table border="0" width="100%" cellspacing="0" cellpadding="2" >
                <tr>
                  <td colspan="2" class="general-body"><br />
                    <h1 class="PageTitle">CONTACTGEGEVENS:<br />
                      <br />
                     LET OP: ITILSTUDY IS EEN MERK VAN EDUSYS SERVICES PVT. LIMITED, UK.</h1>
                    <span class="Header"> a) Contact per telefoon of fax </span><br />
                    <br />
                    Online opleiding: Vragen niet telefonisch. Gaarne een e-mail sturen naar <a href="mailto:adminsupport@itilstudy.com" target="_blank">adminsupport@itilstudy.com</a>
(Houd er rekening mee dat als u heeft betaald voor een online opleiding, het tot 4 uur kan duren voor uw account is geactiveerd en uw inloggegevens naar uw e-mailadres zullen worden gestuurd. Voor online opleidingen versturen we geen studiemateriaal.)<br />
                   <br />
                 Vragen over Nederlandse ITIL<sup>&reg;</sup> Foundation klassikale opleidingen: <br /><br />
                 
                  
                    <br />   <br />  
                    
                    <span class="Header">Adres:</span><br>
       

 					Edusys Services GmbH<br>
				   Kurt-Blaum-Platz 8<br>
				   63450 Hanau / Frankfurt-Main<br>
                         
			 <br />
                    <span class="Header">b) E-mailadres  </span><br>
                    <br />
                  Vragen over online opleidingen : <a href="mailto: adminsupport@ITILstudy.com">adminsupport@ITILstudy.com</a>.<br />
                   Vragen over Nederlandse ITIL Foundation klassikale opleidingen: <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com </a><BR>
                    <BR>
                   
                    <p> <span class="Header"><a name="feedback"></a>Feedbackformulier:</span><br />
                      <br />
                      We waarderen uw feedback ontzettend. Geef uw feedback in het volgende formulier. We zullen uw bericht zo spoedig mogelijk beantwoorden.
                    </p></td>
                </tr>
                <tr>
                  <td colspan="2">&nbsp;</td>
                </tr>
                <form name="complaint" action="insertQuery-nl.asp" method="post" onSubmit="return validate_form(this)">
                  <table border="0" cellspacing="5" cellpadding="0" width="100%" >
                    <tr>
                      <td><span class="general-bodyBold">Voornaam:</span></td>
                      <td><input type="text" name="FirstName" id="FirstName" size="20" /></td>
                    </tr>
                    <tr>
                      <td><span class="general-bodyBold">Achternaam:</span></td>
                      <td><input type="text" name="LastName" id="LastName" size="20" /></td>
                    </tr>
                    <tr>
                      <td><span class="general-bodyBold">E-mailadres:</span></td>
                      <td><input type="text" name="email" id="email" size="20" /></td>
                    </tr>
                    <tr>
                      <td width="20%"><span class="general-bodyBold">Soort vraag:</span></td>
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
                      <td><span class="general-bodyBold">Onderweg:</span></td>
                      <td><input type="text" name="subject" id="subject" size="40" /></td>
                    </tr>
                    <tr>
                      <td><span class="general-bodyBold">Feedback/Klacht:</span></td>
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
<!--#include virtual="/includes/footer-Dutch.html"-->
