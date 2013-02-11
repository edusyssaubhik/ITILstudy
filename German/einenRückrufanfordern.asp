<!--#include virtual="/German/metatags/contactus_metetag.html"-->
<!--#include virtual="/includes/headermetaGerman.asp"-->
<!--#include virtual="/includes/inneraboutusbanner.html"-->
<!-- Body Starts -->

<%  

If Session("message")<> "" Then

message = Session("message")
Session("message") = ""
End If


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
                    <h1 class="PageTitle">Call Back form :</h1>
                    </td>
                </tr>
                <% If message <> "" Then  %>
                <tr>
                <td><% = message %>
                </td>
                </tr>
                <% Else %>
                <tr>
                  <td colspan="2">
                <form name="complaint" action="addediteinenRückrufanfordern.asp" method="post" onSubmit="return validate_form(this)">
                  <table border="0" cellspacing="5" cellpadding="0" width="100%" >
                    <tr>
                      <td><span class="general-bodyBold">Name:</span></td>
                      <td><input type="text" name="Name" id="Name" size="20" /></td>
                    </tr>
                    <tr>
                      <td><span class="general-bodyBold">Telefonnummer:</span></td>
                      <td><input type="text" name="TNO" id="TNO" size="20" /></td>
                    </tr>
                    <tr>
                      <td width="20%"><span class="general-bodyBold">Lage:</span></td>
                      <td><input type="text" name="position" id="position" size="20" /></td>
                    </tr>
                    <tr>
                      <td><span class="general-bodyBold">Geeigneten Zeitpunkt um einen Rückruf zu erhalten:</span></td>
                      <td><input type="text" name="Time" id="Time" size="20" /></td>
                    </tr>
                    <tr>
                      <td><span class="general-bodyBold">Bitte teilen Sie uns Ihre Anfrage:</span></td>
                      <td><input type="text" name="Info" id="info" size="20" /></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td><input type="Submit" name="type" value="Senden" /></td>
                    </tr>
                  </table>
                </form></td>
             
          </tr>
          <% End If %>
        </table></div>   <pre>
                
                
                </pre></td>
    </tr>
  </table>
  </td></tr></table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer-German.html"-->
