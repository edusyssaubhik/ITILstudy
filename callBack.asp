<!--#include virtual="/metatags/index_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/classroombanner.html"-->


<script type="text/javascript">
<!--
function Form_Validator(theform)
{

  //Check To See If The Current Password Field Is Blank
   
  if (theform.course.value == '')
  {
    alert("Please Selct course");
    theform.course.focus();
	return(false);
  }

  //Check To See If The New Password Field Is Blank
    
  if (theform.Name.value == '')
  {
    alert("Please enter Name");
    theform.Name.focus();
	return(false);
  }


  if (theform.Name.value == '')
  {
    alert("Please enter Name");
    theform.Name.focus();
	return(false);
  }
  
    if (theform.Phoneno.value == '')
  {
    alert("Please enter Phone number");
    theform.Phoneno.focus();
	return(false);
  }
  
    if (theform.Location.value == '')
  {
    alert("Please enter Location");
    theform.Location.focus();
	return(false);
  }
  
   
    if (theform.Convenient_Time.value == '')
  {
    alert("Please enter Convenient time");
    theform.Convenient_Time.focus();
	return(false);
  }
  
  
  
}




-->
</script>
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="25%" >&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; Call back form</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><h5 class="Header">Call back form</h5>
              <table border="0">
                <form method="POST" action="/Responsecallback.asp" name="form2" onSubmit="return Form_Validator(this)">
                  <tr>
                    <td ><span class="general-bodyBold">Name</span><span class="Required">*</span></td>
                    <td ><input type="text" name="Name"></td>
                  </tr>
                  <tr>
                    <td><span class="general-bodyBold">Phone No.</span><span class="Required">*</span>:</td>
                    <td ><input type="text" name="Phoneno"></td>
                  </tr>
                  <tr>
                    <td><span class="general-bodyBold">Location:</span><span class="Required">*</span>:</td>
                    <td ><input type="text" name="Location"></td>
                  </tr>
                  <tr>
                    <td><span class="general-bodyBold">Convenient time to receive a call back:</span><span class="Required">*</span>:</td>
                    <td ><input type="text" name="Convenient_Time" />
                      Ex:8:00 AM to 9:00 AM</td>
                  </tr>
                  <tr>
                  <tr>
                    <td><span class="general-bodyBold">Please let us know about your query:</span></td>
                    <td ><textarea name="Ques" cols="20" rows="6"></textarea>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td><input type="submit"  value="Submit" class="button" style="width:60px;" >
                      <input type="reset" value="Reset"  class="button" style="width:60px;"></td>
                  </tr>
                </form>
              </table>
              <br/>
              <br/></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
