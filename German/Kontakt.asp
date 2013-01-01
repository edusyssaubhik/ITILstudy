<!--#include virtual="/metatags/contactus_metetag.html"-->
<!--#include virtual="/includes/headermetaGerman.asp"-->
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
            <td width="73%" class="breadcrumb">&nbsp;</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu-German.asp"-->
<td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-15px; width:97%;">
              <table border="0" width="100%" cellspacing="0" cellpadding="2" >
                <tr>
                  <td colspan="2" class="general-body"><br />
                    <h1 class="PageTitle">KONTAKT:<br />
                      <br />
                     BITTE BEACHTEN SIE: ITILSTUDY IST EINE MARKE DER Edusys Services GmbH</h1>
                    <span class="Header"> a) Telefon und Fax </span><br />
                    <br />
                    Onlinekurse: Keine telefonischen Anfragen möglich. Bitte senden Sie eine E-Mail an: <a href="mailto:adminsupport@itilstudy.com" target="_blank">adminsupport@itilstudy.com</a>
(Wenn Sie die Gebühr für einen Onlinekurs bezahlt haben, dauert es ca. 4 Stunden bis ihr Account aktiviert ist und wir Ihnen Ihre Log-In- Daten an Ihre E-Mail Adresse schicken.  Das Lernmaterial wird bei Onlinekursen nicht in Papierform zugeschickt.)<br />
                   <br />
                 Anfragen zu ITIL<sup>&reg;</sup> Foundation- Präsenztrainings in Deutschland: +4969 505027 386<br /><br />
                 Rufen Sie uns an:  ITILstudy bietet auch auf Ihren Bedarf angepasste Wochenendkurse und Firmenschulungen an.
                  
                  
                    <br />   <br />  
                    
                    <span class="Header">Adresse:</span><br>
                   
<!--Edusys Services Private Limited<br />
29th Floor,<br />
One Canada Square,<br />
Canary Wharf,<br />
London,<br />
E14 5DY<br />
United Kingdom
-->                   

 					Edusys Services GmbH<br>
				   Kurt-Blaum-Platz 8<br>
				   63450 Hanau / Frankfurt-Main<br>
                         
			 <br />
                    <span class="Header">b) E-Mail </span><br>
                    <br />
                  Anfragen zu Online-Kursen: <a href="mailto: adminsupport@ITILstudy.com">adminsupport@ITILstudy.com</a>.<br />
                   Anfragen zu ITIL Foundation Präsenztrainings in Deutschland richten Sie an: <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com </a><BR>
                    <BR>
                   
                    <p> <span class="Header"><a name="feedback"></a>Feedback Formular:</span><br />
                      <br />
                      Wir schätzen Ihr Feedback sehr. Bitte senden Sie es uns im folgenden Format. Wir werden sobald wie möglich antworten:
                    </p></td>
                </tr>
                <tr>
                  <td colspan="2">&nbsp;</td>
                </tr>
                <form name="complaint" action="/insertQuery.asp" method="post" onSubmit="return validate_form(this)">
                  <table border="0" cellspacing="5" cellpadding="0" width="100%" >
                    <tr>
                      <td><span class="general-bodyBold">Vorname:</span></td>
                      <td><input type="text" name="FirstName" id="FirstName" size="20" /></td>
                    </tr>
                    <tr>
                      <td><span class="general-bodyBold">Nachname:</span></td>
                      <td><input type="text" name="LastName" id="LastName" size="20" /></td>
                    </tr>
                    <tr>
                      <td><span class="general-bodyBold">E-Mail:</span></td>
                      <td><input type="text" name="email" id="email" size="20" /></td>
                    </tr>
                    <tr>
                      <td width="20%"><span class="general-bodyBold">Thema Ihrer Anfrage:</span></td>
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
                      <td><span class="general-bodyBold">Betreff:</span></td>
                      <td><input type="text" name="subject" id="subject" size="40" /></td>
                    </tr>
                    <tr>
                      <td><span class="general-bodyBold">Feedback/Anliegen:</span></td>
                      <td><textarea name="complaint" rows="10" cols="20"></textarea></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td><input type="Submit" name="type" value="Senden" />
                        <input type="reset"  value="Neu" /></td>
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
<!--#include virtual="/includes/footer-German.html"-->
