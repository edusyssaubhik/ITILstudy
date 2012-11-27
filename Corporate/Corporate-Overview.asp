
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/innercoursebanner.html"-->





<style type="text/css">
.corporateTable{
	border-collapse:collapse;

	
	}
	
.corporateTable td {
	
	border:solid 1px #666;
	vertical-align:middle;
	padding-left:5px;
	text-align:center;
	}
	
.corporateTable th	{
	background-color:rgb(198,217,241);
	vertical-align:middle;
	border:solid 1px #666;
	font-size: 10pt;
	}
	
	.corporateTable td:first-child {
		text-align:left;
	}
		
		</style>

<script language ="JavaScript" type="text/javascript">

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

function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}
}

function validate_form(thisform)
{
	with (thisform)
    {
		
	    if (validate_required(Name,"Please enter your Name")=='')
 		     {Name.focus();return false}
	    if (validate_required(EMailID,"Please enter your email address")=='')
 		     {EMailID.focus();return false}
		if (echeck(EMailID)==false)
 	         {EMailID.focus();return false}
	   
 	    if (validate_required(Query,"Please write your query")==false)
 		     {Query.focus();return false}
		
	}
}
</script>
</head>
<body onLoad="init()">
<!-- Body Starts -->
<div >
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
	  <table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr >
            <td width="2%">&nbsp;</td>
            <td width="25%">&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; CORPORATE TRAINING &raquo; Overview and Benefits</td>
          </tr>
           <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td rowspan="4" background="/images/back/left_line.jpg" class="general-body"><h1 class="PageTitle">ITILSTUDY – YOUR TRUSTED PARTNER FOR CORPORATE TRAINING</h1>
            <p>ITILstudy provides training in over <a href="/itil-training/exam-success.asp">160 countries for 3500+ companies</a>. A few of the companies that currently have negotiated corporate rates or scheduled corporate classes with ITILstudy are listed below:<br/></p>
			
<table>
			<tbody><tr><td align="center" width="662px"><img src="/images/buttons/1.jpg" height="60" hspace="25"><img src="/images/buttons/2.jpg" height="60" hspace="35"><img src="/images/buttons/3.jpg" height="60" hspace="30"></td></tr>
			
			<tr><td align="center" width="662px"><img src="/images/buttons/5.jpg" height="60" hspace="15"><img src="/images/buttons/6.jpg" height="79" hspace="20"><img src="/images/buttons/7.jpg" height="60" hspace="20"><img src="/images/buttons/8.jpg" height="60" hspace="10"></td></tr>
			
			<tr><td align="center" width="662px" style="padding-top:17px;"><img src="/images/buttons/9.jpg" height="60" hspace="26"><img src="/images/buttons/10.jpg" height="79" hspace="33"><img src="/images/buttons/11.jpg" height="60" hspace="15"></td></tr>
			
			<tr><td align="center" width="662px" style="padding-top:35px;"><img src="/images/buttons/13.jpg" height="60" hspace="20"><img src="/images/buttons/14.jpg" height="60" hspace="55"><img src="/images/buttons/15.jpg" height="60" hspace="15"></td></tr>
			
			<tr><td align="center" width="662px" style="padding-top:35px;"><img src="/images/buttons/12.jpg" height="60" hspace="10"><img src="/images/buttons/16.jpg" height="60" hspace="20"><img src="/images/buttons/17.jpg" height="60" hspace="18"><img src="/images/buttons/18.jpg" height="60" hspace="18"></td></tr>
            
             <tr><td align="center" width="662px" style="padding-top:35px;"><img src="/images/buttons/19.jpg" height="60" hspace="10"><img src="/images/buttons/20.jpg" height="60" hspace="15"><img src="/images/buttons/4.jpg" height="60" hspace="25"></td></tr>
			
			
			</tbody></table>
			
			
	<p>
ITIL<sup>&reg;</sup> Foundation is the entry-level qualification, which offers candidates an awareness of the key elements, concepts, and terminology used in the ITIL<sup>&reg;</sup> Service Lifecycle. The purpose of the ITIL<sup>&reg;</sup> Foundation Certificate in IT Service Management is to certify that the candidate has gained knowledge of the ITIL terminology, structure and basic concepts and has comprehended the core principles of ITIL practices for Service Management.</p>

		
	<p class="Header">Why do leading global organizations choose ITILstudy?</p>
	<table  border="0">
	<tr><td >
	<p>Very efficient and economical means to become ITIL Foundation certified:</p>
	<ul>
	<li><span class="general-bodyBold">Outstanding measurable success: </span>Our ITIL Exam Prep Classroom course has a proven track record of 99.2% pass rate </li>
	<li><span class="general-bodyBold">Experienced faculty:</span> We owe our high pass rate (99.2%) and consistently great student feedback to the quality of our instructors. For instructor bios, <a href="/itil-training/instructors.asp">click  here</a></li>
<li><span class="general-bodyBold">100% Moneyback Guarantee: </span> ITILstudy assures you that not a single dollar of your training investment is wasted. We ensure that our students pass the ITIL Foundation exam or we the complete exam fees back. <a href="/itil-training/moneyBack.asp">More</a> </li>
	
	     <li><span class="general-bodyBold">Flexible delivery options:</span> ITILstudy understands different organizations have different needs and constraints, therefore, it provides corporates with flexible delivery options:
<ul type="circle">
		   <li><span class="general-bodyBold">On-site training:</span> Where onsite training is the preferred option, it gives us the opportunity to customize the training module to suit the needs of your organization based on your schedule</li>
<li><span class="general-bodyBold">Weekend classes:</span> We can conduct classes on weekends to accommodate the busy schedules of professionals in your organization</li>
<li><span class="general-bodyBold">Upscale, off-site locations: </span>We also conduct classes in upscale hotels and conference centers for the comfort of our corporate delegates  </li></ul></li></ul>
</td> </tr></table>

<p> <span class="Header">TRAINING OPTIONS:</span><br/><br/>
<p>ITILstudy ITIL<sup>&reg;</sup> Foundation courses are structured with the goal of providing students with a practical understanding of IT Service Management concepts as well as passing the certification exam. This section highlights the flexible training options we provide for ITIL Foundation Certification. </p>

<table border="0" align="center" width="100%" cellspacing="0" cellpadding="2" class="corporateTable">

                          <tr >
                            <th>Training Options</th>
                            <th>Duration</th>
                            <th>Training Format</th>
                            <th>Exam Fee Included?</th>
                            <th>ITIL Foundation Exam Administered during Course?</th>
                          </tr>
                          <tr align="center">
                            <td>A. Online Self-Study </td>
                            <td>90 day access</td>
                            <td>Self-Study</td>
                            <td> Yes</td>
                            <td>No, Voucher Provided</td>
                          </tr>
                          <tr align="center">
                            <td>B. Virtual Classroom</td>
                            <td>2 Day</td>
                            <td> Instructor-led Live Online</td>
                            <td> Yes</td>
                            <td>No, Voucher Provided</td>
                          </tr>
                          <tr align="center">
                            <td>C. Traditional Classroom</td>
                            <td> 2 Day</td>
                            <td>Instructor-led </td>
                            <td> Yes</td>
                            <td>Yes</td>
                          </tr>
                          <tr align="center">
                            <td>D. Traditional Classroom + Tailored Workshop/Industry-specific Case Study</td>
                            <td >3 Day </td>
                            <td> Instructor-led</td>
                            <td> Yes </td>
                            <td>Yes</td>
                          </tr>
                        
                        </table>

<p><br> <span class="Header">OPTION A: Online Self-Study</span></p><hr>
<p>This training course is accessible from anywhere in the world at any time. It is suitable for teams separated by time zones and location. With the course content available online, students can study at their own pace and then schedule the certification exam at a convenient, local exam site.
Benefits of Online Self-Study Program:
<ul><li>Anywhere Anytime: Accessible from anywhere in the world at any time. Suitable for teams separated by time zones and location</li>
<li>18 PMI<sup>&reg;</sup> approved PDUs certificate to help to cater to the needs of continuing education units for PMP<sup>&reg;</sup> certified professionals.</li></ul></p>

<p><br> <span class="Header">OPTION B: Virtual Classroom</span></p><hr>
<p>This training course brings together the participants from any location virtually. Students benefit from 1.5 days of instructor-led training via LIVE online virtual classroom environment.  Only required resource is a computer with internet connectivity. All study materials and other teaching aids will be mailed to students in advance by ITILstudy.
Two ITILstudy faculty simultaneously teach students through a live-classroom training delivered over the internet (one faculty discusses concepts and the second faculty handles all questions and chat discussions).<br>
Internet based training include interactive features such as integrated online classroom quizzes, mock tests, chat, and Q&A forum to allow students to fully participate and extract maximum value. Selected case studies, examples and insights are shared by experienced faculty to impart ITIL concepts. An exam voucher is provided to students to schedule the certification.<br>
Benefits of Virtual Classroom Program:
<ul><li>Brings together the participants from any location virtually</li>
<li><b>Organization specific and Industry relevant</b> examples and insights shared by experienced faculty</li>
<li>Employees certified in 2 days!</li>
<li>18 PMI PDUs certificate to help to cater to the needs of continuing education units for PMP certified professionals.</li>
<li>Complimentary Risk Management Online Course worth $300 <b>!</b></li></ul></p>


<p><br> <span class="Header">OPTION C: 2-Day Traditional Classroom</span></p><hr>
<p>This training course allows students to benefit from our interactive teaching style and the knowledge gained through participative face-to-face classroom instruction. All the necessary study material and study aids are provided to the student at the venue (at your location or ours). At the end of the second day, the certification exam would be administered by our faculty and your employees would be certified. <br>
Benefits of 2-Day Traditional Classroom Program:
<ul><li>Interactive teaching style and Knowledge sharing in a classroom environment</li>
<li><b>Industry relevant </b> examples and insights shared by experienced faculty</li>
<li>Employees certified in 2 days!</li>
<li>18 PMI PDUs certificate to help to cater to the needs of continuing education units for PMP certified professionals.</li>
<li>Complimentary Risk Management Online Course worth $300 <b>!</b></li></ul></p>

<p><br> <span class="Header">OPTION D: 3-Day Classroom + Tailored Case Study</span></p><hr>
<p>This training course is the same as the 2-Day Traditional Classroom course with an additional day of instruction. On the third day, the faculty will help assess your organization’s capability to implement ITIL and in identifying improvement areas. This option allows for industry and/or company specific case studies or examples to be used as part of the program.<br>
Benefits of 2-Day Traditional Classroom Program:
<ul><li>Interactive teaching style and Knowledge sharing in a classroom environment</li>
<li><b>Industry relevant </b> examples and insights shared by experienced faculty</li>
<li>Tailor made case studies specific to the industry sector which enables the students to understand the concepts and processes of ITIL Foundation in vivid detail</li>
<li>Employees certified in 2 days!</li>
<li>Complimentary Risk Management Online Course worth $300 <b>!</b></li></ul>

To sign-up for a scheduled corporate class and/or to take advantage of corporate discounts for your company, please submit enrolment details and our corporate account representative will contact you. Some companies have an open payment account already established for direct billing.
</p>


<p> <span class="Header">Contact Us</span><br/><br/>
To enroll for a corporate class or for more information<span class="general-bodyBold"> CALL US NOW @ +1-855-234-8454</span><br/>
You can also email us at <a href="mailto:marketing@itilstudy.com"> marketing@ITILstudy.com </a>or fill contact form below:<br/><br/>
<a name="contactus">
<table> 
                <form method="post" action="/Corporate/Corporate-DB.asp" onSubmit="return validate_form(this)">
                  <tr>
                    <td><span class="general-bodyBold"><span class="general-bodyBold">Name:</span> </td>
                    <td><input type="text" name="Name" size="40" class="TeXtField"></td>
                  </tr>
                  <tr>
                    <td><span class="general-bodyBold"><span class="general-bodyBold">Email address:</span> </td>
                    <td><input type="text" name="EMailID" size="40" class="TeXtField"></td>
                  </tr>
                  <tr>
                    <td><span class="general-bodyBold"><span class="general-bodyBold">Contact no:</span> </td>
              <td><input type="text" name="Contact" size="40" class="TeXtField"></td>
                  </tr>
				   <tr>
                    <td><span class="general-bodyBold"><span class="general-bodyBold">Question/Comments:</span> </td>
                    <td><textarea name="Query" rows="8" cols="40" class="TeXtFieldTextarea"></textarea></td>
                  </tr>
				  
				  
                  <tr>
                    <td colspan="2" align="center"><div align="center" style="margin-left:25px">
                        <input type="submit" value="Submit" class="ButtonGeneral" style="width:60px;">
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" value="Reset" class="ButtonGeneral" style="width:75px;">
                      </div></td>
                  </tr>
				  
                </form>
           </table>

</div>
<br/><!--<span class="general-bodyBold">To read some of the case studies of how we helped organizations build their project management expertise, <a href="/Corporate/Corporate-Case-Studies.asp">click here</a></span>--></p>
<span class="general-bodyBold">Download our corporate brochure to read more about our course and the reasons behind our outstanding success.<a href="/Corporate/ITILCorporate-Brochure.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png"></a></span></p>   
</td></tr></table>

            </td>
          </tr>
        </table>
		</td>
    </tr>
  </table>
</div>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;"> <img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?label=t-fgCJGHqQEQx8Kz6QM&amp;guid=ON&amp;script=0"/> </div>
</noscript>
<!--#include virtual="/includes/connectionClose.asp"-->
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
