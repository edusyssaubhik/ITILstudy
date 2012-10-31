<%@LANGUAGE="VBSCRIPT"%>
<% OPTION EXPLICIT %>
<!--#include virtual="/includes/connection.asp"-->

<% 
If Session("USBUserId") = "" Then 
	Response.Redirect("/USBackoffice/login.asp")
Else

'Declare the local variables'	
Dim objRsCountry
Dim strNews, strCountry
Dim rqAction, rqCountry
	
Set objRsCountry = Server.CreateObject("ADODB.Recordset")

strCountry = "SELECT * FROM CRM_Countries"

objRsCountry.Open strCountry, ConnObj
	
'If Admin Selects the Country and cliked on Submit button, It will come here and raise a session variable'
rqAction = Request.Form("submit")
rqCountry = Request.Form("country")

If rqAction = "Submit" Then
	
	'Raising session for Country'
	Session("CRM_Country") = rqCountry

End If

If Session("CRM_Country") = "Global" Then
Session("CRM_Country") = "India" 
End If	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Home</title>
<!-- CSS -->
<link href="css/style1.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/faq.css">
<script language="javascript">
<!-- 
function Form_Validator(theform)
{
	if (theform.country.value == "")
	{
    	 alert("Please select the Country.");
	     theform.country.focus();
    	 return (false);
    }

}
/*function goto(form) 
{ 
	var index=form.select.selectedIndex
	if (form.select.options[index].value != "0") 
	{
		//window.location=form.select.options[index].value;
		window.open(form.select.options[index].value,"","location=1,status=1,scrollbars=1, width=1000,height=1000")
	}
}

    newwindow=window.open("",width=1000,height=1000,status=false, toolbar=false,menubar=false,scrollbar=false,resizable=false);
    newwindow.document.write("<span style='font-family:verdana; color:#0099FF; font-size:14px;'>Please wait, Loading Contents...</span>");
    newwindow.onload=geturl();
	
    function geturl(){
        newwindow.location.href="http://www.live.in";
    }*/

function goto(form) 
{ 
	var index=form.select.selectedIndex
	
	if (form.select.options[index].value != "0") 
	{
		//window.location=form.select.options[index].value;
		
		newwindow=window.open("","status=0,scrollbars=1, width=1000,height=1000");
        newwindow.document.write("<span style='font-family:verdana; color:#0099FF; font-size:14px;'>Please wait...</span>");		
        newwindow.location.href=form.select.options[index].value;
		
    
	}
}
 

//-->
</SCRIPT>

</head>
<body>
<div id="wrapper">
  <!--#include virtual="/USBackoffice/includes/topMenu.asp"-->
  <!-- // #end mainNav -->
  <div id="containerHolder">
    <div id="container">
      <div id="sidebar">
        <!--#include virtual="/USBackoffice/includes/leftMenu.asp"-->
        <!-- // .sideNav -->
      </div>
      <!-- // #sidebar -->
      <!-- h2 stays for breadcrumbs -->
      <h2><a href="home.asp">Home</a> &raquo; <a href="overview.asp" class="active">Overview</a></h2>
      <% If Session("CRM_Country") = "Global" OR Session("TypeOfUser") = "Admin" Then %>
      <div id="main">
        <p>&nbsp;</p>
        <fieldset>
        <form action="overview.asp" method="POST" onSubmit="return Form_Validator(this)">
          <table>
            <tr>
              <td>Select Country: </td>
             
                  	   <td><select name="country">
                  <option value="">--Select--</option>
                  <% Do Until objRsCountry.EOF %>
                  <% If objRsCountry("Country") <> "Global" Then %>
                  <option <% If Session("CRM_Country") = objRsCountry("Country") Then %> selected="selected" <% End If %> value="<% = objRsCountry("Country") %>">
                  <% = objRsCountry("Country") %>
                  </option>
                  <% End If %>
                  <% objRsCountry.Movenext
					 Loop
					 objRsCountry.Close %>
                </select>
              </td>
              <td><input type="Submit" name="submit" value="Submit" /></td>
            </tr>
          </table>
        </form>
        </fieldset>
      </div>
      <% End If %>
      <% If Session("CRM_Country") <> "Global" Then %>
      <div id="main">
        <table width="90%">
          <tr>
            <td><h3>Overview of the Backoffice</h3></td>
			<td><h4><a href="/USBackoffice/programStatus.asp" class="active" target="_blank">Program status</a></h4></td>
            </tr>
        </table>
 <fieldset>
        <table width="100%">
          <tr>
            <td width="20%"><label><b>Understanding the backoffice system</b></label>
            
            <% If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then %>
           
             <label><b>Contact Numbers</b></label>
              <label>Phoenix Office - First Line: (480) 882-0706, Second Line: (520) 226-4988</label>
              <label>Jenni Barclay - (719) 201-0354</label>  
              <label>Tanya Ball - (719) 201-2334</label><br />
			              
              <label><b>Prep Course Access:</b></label>
               <label>Link: www.ITILstudy.com/memberlogin.asp</label>
                             <label>UserID: prepcourse@itilstudy.com</label>
                             <label>Password: ITILprep@$</label>
             	<hr /> <br />
              <% End If %>
             
            
              <% If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" OR Session("CRM_Country") = "India" ) Then %>
               <label><a href="/payforclass.asp" target="_blank">Link which can be provided to students for ad-hoc payments - Paypal or Google Checkout</a><br /> (http://www.ITILstudy.com/payforclass.asp)</label>
			   <% ElseIf Session("CRM_Country") = "UAE" Then %>
			    <label><a href="/makepayment.asp" target="_blank">Link which can be provided to students for ad-hoc payments - Paypal or CCavenue</a><br /> (http://www.ITILstudy.com/makepayment.asp)</label>
				 <% ElseIf Session("CRM_Country") = "Singapore" Then %>
			    <label><a href="/makepaymentsg.asp" target="_blank">Link which can be provided to students for ad-hoc payments - Paypal </a><br /> (http://www.ITILstudy.com/makepaymentsg.asp)</label>
				 <% ElseIf (Session("CRM_Country") = "United Kingdom") Then %>
               <label><a href="/payforukclass.asp" target="_blank">Link which can be provided to students for ad-hoc payments - Google Checkout or Paypal </a><br /> (http://www.ITILstudy.com/payforukclass.asp)</label>
			    <% ElseIf (Session("CRM_Country") = "Australia") Then %>
               <label><a href="/payforausclass.asp" target="_blank">Link which can be provided to students for ad-hoc payments - Paypal </a><br /> (http://www.ITILstudy.com/payforausclass.asp)</label>
				<% End If %>
               <% If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" ) Then %>
               <label><a href="/ITIL_Call allocation.pdf" target="_blank">List of states allocated to faculty for call handling</a></label>
                <label><a href="/Timesheet.xlsx" target="_blank">Timesheet for ITIL Foundation</a></label>              
			   <% End If %>
			     <label><a href="/ProcessEmail.pdf" target="_blank">Process to setup your ITILstudy Email ID on Gmail Account</a></label>
				  <label><a href="/steps_faculty.asp" target="_blank">The Process of becoming a faculty with ITILstudy</a></label>
                    <label><a href="/Checklist for ITIL Exam - CSME.xlsx" target="_blank">Checklist for ITIL Exam - CSME</a></label>
				   <% If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" ) Then %>
				 <!-- <label><a href="/ITIL_Marketing_Brochure.pdf" target="_blank">Marketing and related documents</a></label>-->
                
                   <label><a href="/writeup.pdf" target="_blank">Marketing Writeup</a></label>
				  <% End If %>
				  <% If Session("TypeOfUser") = "Admin" Then %>
				  <label><a href="/USBackoffice/NoOfEnrollment.asp" target="_blank">No of enrollments</a></label>
				  <% End If %>
                   <% If (Session("CRM_Country") <> "India" ) Then %>
                 <label><a href="/ITILstudy-Feedback-form_2708201.pdf" target="_blank">Feedback Form</a></label>
                  <% End If %>
                <% If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" ) Or Session("CRM_Country") ="Germany" OR Session("CRM_Country")= "Netherlands"Then %>
                    <label><b>Case Study 1</b></label>
                               <a href="/ITILstudy 4G-Student.pdf" target="_blank">ITILstudy 4G-Student</a><br /><br />
                <a href="/ITILstudy_4G-Instructor.pdf" target="_blank">ITILstudy_4G-Instructor</a>
               <br><br />


                    <label><b>Case Study 2</b></label>
                    <a href="/ITILstudy_e-commerce website-v1.1.pdf" target="_blank">ITILstudy E- Commerce : Instructor</a><br /><br />
                <a href="/ITILstudy_Student workbook_e commerce v1.1.pdf" target="_blank">ITILstudy E-Commerce : Student</a>
               <br><br />
                <%End If %>

                 <% If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" ) Then %>
                     <label><b>Webex for Role Play / Simulation</b></label>
                <!--<br /><br />
                  <label><b>Webex Recording- ITIL Case Study Discussion on June 26th, 2012</b></label>-->
                 
               <a href="https://vmedu.webex.com/vmedu/ldr.php?AT=pb&SP=MC&rID=66138857&rKey=f052d9d1047f8f31" target="_blank">https://vmedu.webex.com/vmedu/ldr.php?AT=pb&SP=MC&rID=66138857&rKey=f052d9d1047f8f31</a>
               <br><br />
                   
                   <label><b>Webex Recording - Elizabeth Lynne Warren Washington DC</b></label>
                   Day 1<br /><br />
                <label>Streaming recording link:<br /> <a href="https://vmedu.webex.com/vmedu/ldr.php?AT=pb&SP=MC&rID=61537537&rKey=bc36e00075d085a8" target="_blank">https://vmedu.webex.com/vmedu/ldr.php?AT=pb&SP=MC&rID=61537537&rKey=bc36e00075d085a8</a></label>
                <label>Download recording link:<br /> <a href="https://vmedu.webex.com/vmedu/lsr.php?AT=dw&SP=MC&rID=61537537&rKey=d59252f15067c922" target="_blank">https://vmedu.webex.com/vmedu/lsr.php?AT=dw&SP=MC&rID=61537537&rKey=d59252f15067c922</a></label><br>
                  Day 2<br /><br />
                <label>Streaming recording link:<br /> <a href="https://vmedu.webex.com/vmedu/ldr.php?AT=pb&SP=MC&rID=61537537&rKey=bc36e00075d085a8" target="_blank">https://vmedu.webex.com/vmedu/ldr.php?AT=pb&SP=MC&rID=61537537&rKey=bc36e00075d085a8</a></label>
                <label>Download recording link: <br /><a href="https://vmedu.webex.com/vmedu/lsr.php?AT=dw&SP=MC&rID=61537537&rKey=d59252f15067c922" target="_blank">https://vmedu.webex.com/vmedu/lsr.php?AT=dw&SP=MC&rID=61537537&rKey=d59252f15067c922</a></label> <br />
                
                 <label><b>Webex Recording - Ruth Kim</b></label>
                 
                <label>Day 1:<br /> <a href="https://pmtraining.webex.com/pmtraining/lsr.php?AT=pb&SP=TC&rID=9928842&act=pb&rKey=dd74c021bbafd0d5 " target="_blank">https://pmtraining.webex.com/pmtraining/lsr.php?AT=pb&SP=TC&rID=9928842&act=pb&rKey=dd74c021bbafd0d5</a></label>
                <label>Day 2:<br /> <a href="https://pmtraining.webex.com/pmtraining/lsr.php?AT=pb&SP=TC&rID=9952587&act=pb&rKey=82c46a2e6a67f299" target="_blank">https://pmtraining.webex.com/pmtraining/lsr.php?AT=pb&SP=TC&rID=9952587&act=pb&rKey=82c46a2e6a67f299</a></label><br>
                
               
                 <% End If %>
              </td></tr>
             
			<!--   <tr>
            <td> <label><b>Marketing and related documents</b></label>
             
              
			  
              
              <label>Will be updated shortly</label></td>
          </tr>
              <% 'End If %>
			  <tr>
           
          </tr>-->
           <% If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then %>
          <tr>
            <td ><label><b>Corporate pricing</b><br /><br />
			  <table width="100%" class="table1"  cellpadding="5" border="1">
                          <tr align="center">
                            <td>Price per student</td>
                            <td><b>Corporate pricing for the first 2 classes <br>
                              (Evaluation pricing - onsite/in ITILstudy facility)</b></td>
                            <td><b>Final Corporate pricing <br>
                              (Onsite in company)</b></td>
                            <td><b>Final Corporate pricing <br>
                              (Facility by ITILstudy)</b></td>
                          </tr>
                          <tr align="center">
                            <td>Less than 5 students </td>
                            <td>-</td>
                            <td> $ 1000 *</td>
                            <td> $ 1049 *</td>
                          </tr>
                          <tr align="center">
                            <td>5 - 9 students</td>
                            <td>-</td>
                            <td> $ 949 *</td>
                            <td> $ 999 *</td>
                          </tr>
                          <tr align="center">
                            <td>10 - 14 students</td>
                            <td> $ 850</td>
                            <td> $ 900 </td>
                            <td> $ 950 </td>
                          </tr>
                          <tr align="center">
                            <td>15 - 19 students</td>
                            <td >$ 800 </td>
                            <td> $ 850 </td>
                            <td> $ 900 </td>
                          </tr>
                          <tr align="center">
                            <td>20 - 25 students</td>
                            <td> $ 750</td>
                            <td> $ 800 </td>
                            <td> $ 850 </td>
                          </tr>
                        </table>
                        <BR>
                        <BR>
                        *: Class may not be feasible at all times and approval required. Please email marketing@ITILstudy.com.<BR>
                        <BR>
			</td></tr>
            
               <tr>
            <td ><label><b>ITIL Lite Corporate Class</b><br /><br />
			  <table width="100%" class="table1"  cellpadding="5" border="1">
                          <tr align="center">
                            <td><b>No. of Students</b></td>
                            <td><b>Fees/Student</b></td>
                            <td><b>Travel Cost </b></td>
                            <td><b>Certification</b></td>
                          </tr>
                          <tr align="center">
                            <td>5 - 9 students  </td>
                            <td>$ 600</td>
                            <td>Instructor travel included</td>
                            <td>Exam not included</td>
                          </tr>
                          <tr align="center">
                           <td>10 - 14 students </td>
                            <td>$ 550</td>
                            <td>Instructor travel included</td>
                            <td>Exam not included</td>
                          </tr>
                          <tr align="center">
                            <td>15 - 19 students </td>
                            <td>$ 500</td>
                            <td>Instructor travel included</td>
                            <td>Exam not included</td>
                          </tr>
                          <tr align="center">
                           <td>20 - 25 students</td>
                            <td>$ 450</td>
                            <td>Instructor travel included</td>
                            <td>Exam not included</td>
                          </tr>
                         
                        </table>
                        <BR>
                     
			</td></tr>
			<%End If%>
       </table>
        </fieldset>
      </div>
      <% End If %>
      <!-- // #main -->
      <div class="clear"></div>
    </div>
    <!-- // #container -->
  </div>
  <!-- // #containerHolder -->
  <p id="footer">&nbsp;</p>
</div>
<!-- // #wrapper -->
</body>
</html><% End If %>
