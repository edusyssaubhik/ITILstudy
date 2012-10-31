<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerbanner.html"-->
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
            <td width="73%" class="PageTitle">Thank you</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px; width:97%">
                <!-- Content Start From Here-->
               <table border="0">
			   <% If session("rqfrndEmailID1") <> "" or session("rqfrndEmailID2") <> "" or session("rqfrndEmailID3") <> "" or session("rqfrndEmailID4") <> ""or session("rqfrndEmailID5") <> "" or session("rqfrndEmailID6") <> "" Then %>
             	<tr>
					<td colspan="2">Thank you <% = session("rqrefName") %>, for referring your friends to ITILstudy.<br /><br />You have referred the following friends to ITILstudy.com.<br /><br /></td>
				</tr>
                <tr>
                  <td width="50%"><b>Email ID</b></td>
                  <td><b>Name</b></td>
                </tr>
                <%End If%>
                <% If session("rqfrndEmailID1") <> "" Then %>
                <tr>
                  <td><% =session("rqfrndEmailID1") %></td>
                  <td><% =session("rqfrndName1") %></td>
                </tr>
                 <%End If%>
                <% If session("rqfrndEmailID2") <> "" Then %>
                <tr>
                  <td><% =session("rqfrndEmailID2") %></td>
                  <td><% =session("rqfrndName2") %></td>
                </tr>
				 <%End If%>
                <% If session("rqfrndEmailID3") <> "" Then %>
                <tr>
                  <td><% =session("rqfrndEmailID3") %></td>
                  <td><% =session("rqfrndName3") %></td>
                </tr>
				 <%End If%>
                <% If session("rqfrndEmailID4") <> "" Then %>
                <tr>
                  <td><% =session("rqfrndEmailID4") %></td>
                  <td><% =session("rqfrndName4") %></td>
                </tr>
				 <%End If%>
                <% If session("rqfrndEmailID5") <> "" Then %>
                <tr>
                  <td><% =session("rqfrndEmailID5") %></td>
                  <td><% =session("rqfrndName5") %></td>
                </tr>
				 <%End If%>
                <% If session("rqfrndEmailID6") <> "" Then %>
                <tr>
                  <td><% =session("rqfrndEmailID6") %></td>
                  <td><% =session("rqfrndName6") %></td>
                </tr>
				 <%End If%>
               </table>
				<br /><br />
				<div>If you would like to refer more friends, please <a href="/referFriends.asp">click here</a></div>

                <!-- Content End From Here-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
