
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
