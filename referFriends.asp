<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/indexbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/metatags/index_metatag.html"-->
<!-- Body Starts -->
<script language="javascript">

function toggleVARetainerAddMoreBP1(AddMoreBP1){
if(document.getElementById(AddMoreBP1).style.display == 'none'){
document.getElementById(AddMoreBP1).style.display = 'block';
}else{
document.getElementById(AddMoreBP1).style.display = 'none';
}
 

}
function echeck(str) {

		var str1 = str.value
		//document.write(str1)
		var at="@"
		var dot="."
		var lat=str1.indexOf(at)
		var lstr=str1.length
		var ldot=str1.indexOf(dot)
		if (str1.indexOf(at)==-1){
		   alert("Invalid Email ID")
		   return false
		}

		if (str1.indexOf(at)==-1 || str1.indexOf(at)==0 || str1.indexOf(at)==lstr){
		   alert("Invalid Email ID")
		   return false
		}

		if (str1.indexOf(dot)==-1 || str1.indexOf(dot)==0 || str1.indexOf(dot)==lstr){
			alert("Invalid Email ID")
			return false
		}

		if (str1.indexOf(at,(lat+1))!=-1){
			alert("Invalid Email ID")
			return false
		}

		if (str1.substring(lat-1,lat)==dot || str1.substring(lat+1,lat+2)==dot){
			alert("Invalid Email ID")
			return false
		}

		if (str1.indexOf(dot,(lat+2))==-1){
			alert("Invalid Email ID")
			return false
		}

		if (str1.indexOf(" ")!=-1){
			alert("Invalid Email ID")
			return false
		}

		return true
	}
// Function To Validate The Form And Display An Alert Message If Any Field Is Found empty.
 function validate_required(field,alrttxt)
 {

      with(field)
       {
            if (field.value=="")
                {alert(alrttxt);return false}
            else
                {return true}
       }
 }
 // Function To Validate The Form And Display An Alert Message If Any Field Is Found having special characters.
 function validate_special(field,alrttxt)
 {
     var iChars = "!#$%^&*@()+=-[]\\\';,{}|\":<>?";
     with(field)
	 {
	   for(var i =0; i < value.length; i++)
	   {
	     if(iChars.indexOf(value.charAt(i))!=-1)
		 {
		   alert(alrttxt);
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

 
 // Function To Validate The Form And Display An Alert Message If Any Field Is Found Empty.
 function validate_form(thisform)
  {
  	   with(thisform)
         {
               //Checking whether the Total No Of Days s entered or not
              if(validate_required(refEmailID,"Please enter your Email ID")==false)
                 {refEmailID.focus();return false}

			  //Checking whether the StartDateOfLeave s entered or not
              if(echeck(refEmailID,"Invalid Refer Email ID")==false)
                 {refEmailID.focus();return false}
				 
				  //Checking whether the StartDateOfLeave s entered or not
              //if(validate_required(refName,"Please enter Your Name")==false)
              //   {refName.focus();return false}
			}	 
				 
			var rqfrndEmailID1 = document.referFriend.frndEmailID1.value
			var rqfrndEmailID2 = document.referFriend.frndEmailID2.value
			var rqfrndEmailID3 = document.referFriend.frndEmailID3.value
			var rqfrndEmailID4 = document.referFriend.frndEmailID4.value
			var rqfrndEmailID5 = document.referFriend.frndEmailID5.value
			var rqfrndEmailID6 = document.referFriend.frndEmailID6.value
			
 		  
		  if(rqfrndEmailID1=="" && rqfrndEmailID2=="" && rqfrndEmailID3=="" && rqfrndEmailID4=="" && rqfrndEmailID5=="" && rqfrndEmailID6=="")
		  	{
				with(thisform)
					 {
						   if(validate_required(frndEmailID1,"Please enter atlest one of your Friend's Email ID")==false)
							frndEmailID1.focus();return false;
					 }
			}
		 else
		 	{
				 
				if (rqfrndEmailID1!="")
					{
					 
					with(thisform)
					 	{
						//Checking whether the StartDateOfLeave s entered or not
						  if(echeck(frndEmailID1,"Invalid Email ID")==false)
							 {frndEmailID1.focus();return false}
						}
					}
					
				if (rqfrndEmailID2!="")
					{
					 
					with(thisform)
					 	{
						//Checking whether the StartDateOfLeave s entered or not
						  if(echeck(frndEmailID2,"Invalid Email ID")==false)
							 {frndEmailID2.focus();return false}
						}
					}
					
				if (rqfrndEmailID3!="")
					{
					 
					with(thisform)
					 	{
						//Checking whether the StartDateOfLeave s entered or not
						  if(echeck(frndEmailID3,"Invalid Email ID")==false)
							 {frndEmailID3.focus();return false}
						}
					}
					
				if (rqfrndEmailID4!="")
					{
					 
					with(thisform)
					 	{
						//Checking whether the StartDateOfLeave s entered or not
						  if(echeck(frndEmailID4,"Invalid Email ID")==false)
							 {frndEmailID4.focus();return false}
						}
					}
					
				if (rqfrndEmailID5!="")
					{
					 
					with(thisform)
					 	{
						//Checking whether the StartDateOfLeave s entered or not
						  if(echeck(frndEmailID5,"Invalid Email ID")==false)
							 {frndEmailID5.focus();return false}
						}
					}
					
				if (rqfrndEmailID6!="")
					{
					 
					with(thisform)
					 	{
						//Checking whether the StartDateOfLeave s entered or not
						  if(echeck(frndEmailID6,"Invalid Email ID")==false)
							 {frndEmailID6.focus();return false}
						}
					}
 			}
     }


</script>

  <script type="text/javascript">
	<!--
/**
 * Determines if a field is exceeding the maximum size
 * and truncates the string if it is over the limit.
 */
function maxlength(field, size) {
    if (field.value.length > size) {
        field.value = field.value.substring(0, size);
    }
}
// -->
</script>
<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="PageTitle">Refer Friends</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px; width:97%">
                <!-- Content Start From Here-->
        <table border="0">
          <tr>
            <td width="69%"><!---------- content start------------------->
 
              
				   
              <p class="SubHeader">Refer Friends</p>
              <form name="referFriend" action="InsertReferFrnd.asp"  method="post" onSubmit="return validate_form(this)">
                <table border="0"  align="left" width="95%">
                  <tr>
                    <td colspan="4"><table border="0" cellpadding="10" cellspacing="0">
                        <tr>
                          <td class="TableRowOdd">Your Email ID:<span class="Note">*</span></td>
                          <td class="TableRowOdd"><input type="text" name="refEmailID" maxlength="50" value="<% = session("rqrefEmailID") %>" /></td>
                          <td class="TableRowOdd">Your Name:</td>
                          <td class="TableRowOdd"><input type="text" name="refName" maxlength="20" value="<% = session("rqrefName") %>" /></td>
                        </tr>
                        <tr>
                          <td class="TableRowEven">Friend's Email:<span class="Note">*</span></td>
                          <td class="TableRowEven"><input type="text" maxlength="50" name="frndEmailID1" /></td>
                          <td class="TableRowEven">Name:</td>
                          <td class="TableRowEven"><input type="text" maxlength="20" name="frndName1" /></td>
                        </tr>
                        <tr>
                          <td class="TableRowEven">Friend's Email:</td>
                          <td class="TableRowEven" ><input type="text" maxlength="50" name="frndEmailID2" /></td>
                          <td class="TableRowEven">Name:</td>
                          <td class="TableRowEven"><input type="text" maxlength="20" name="frndName2" /></td>
                        </tr>
                        <tr>
                          <td class="TableRowEven">Friend's Email:</td>
                          <td class="TableRowEven"><input type="text" maxlength="50" name="frndEmailID3" /></td>
                          <td class="TableRowEven">Name: </td>
                          <td class="TableRowEven"><input type="text" maxlength="20" name="frndName3" /></td>
                        </tr>
                      </table></td>
                  </tr>
                  
                  <tr>
                    <td colspan="2"><a href="javascript:;" onClick="toggleVARetainerAddMoreBP1('AddMoreBP1');" >More</a></td>
                  </tr> 
				  
                  <tr id="AddMoreBP1" style="display:none">
                    <td colspan="4"><table border="0" cellpadding="10" cellspacing="0">
                        <tr >
                          <td class="TableRowEven">Friend's Email:</td>
                          <td class="TableRowEven"><input type="text" maxlength="50" name="frndEmailID4" /></td>
                          <td class="TableRowEven">Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                          <td class="TableRowEven"><input type="text" maxlength="20" name="frndName4" /></td>
                        </tr>
                        <tr>
                          <td class="TableRowEven">Friend's Email:</td>
                          <td class="TableRowEven"><input type="text" maxlength="50" name="frndEmailID5" /></td>
                          <td class="TableRowEven">Name:</td>
                          <td class="TableRowEven"><input type="text" maxlength="20" name="frndName5" /></td>
                        </tr>
                        <tr>
                          <td class="TableRowEven">Friend's Email:</td>
                          <td class="TableRowEven"><input type="text" maxlength="50" name="frndEmailID6" /></td>
                          <td class="TableRowEven">Name: </td>
                          <td class="TableRowEven"><input type="text" maxlength="20" name="frndName6" /></td>
                        </tr>
                      </table></td>
                  </tr>
				  <tr>
                    <td colspan="4">
						<table >
							<tr>
								<td>Personal Message:</td>
								<td  colspan="2"><textarea cols="25"  rows="3" name="personalMessage" onKeyPress="maxlength(this, 1990);"  style="font-family:Arial, Helvetica, sans-serif; font-size:12px;">I have taken free simulated test provided by ITILstudy.com. I liked it and would want you to try it out.</textarea></td>
							</tr>
						</table>
					</td>
                  </tr> 
                  <tr>
                    <td colspan="3"><div align="center">
                        <input type="submit" name="Action" value="Refer Friends" />
                      </div></td>
                  </tr>
				 <!-- <tr>
				  	<td><a href="/referFriendsTermsAndConditions.asp" target="_blank">Terms and conditions</a>.</td>
					</tr> -->
                </table>
              </form>


                <!-- Content End From Here-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
