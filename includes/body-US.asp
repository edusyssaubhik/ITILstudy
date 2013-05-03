<script type="text/JavaScript">

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

/*Phone number validation*/
function validate_number(field,alerttxt)
  {
  	var iChars = "0123456789-()";

  	with (field)
  	{
  		for (var i = 0; i < value.length; i++) {
  		  	if (!(iChars.indexOf(value.charAt(i)) != -1)) {
  		  	alert (alerttxt);
  		  	return false;
  		  	}
  		}
  	}
  }


 function Form_Validator(theform)
{


  if (theform.name.value == "")
  {
     alert("Please enter the name.");
     theform.name.focus();
     return (false);
  }



   if (theform.emailid.value == "")
  {
     alert("Please enter the email id.");
     theform.emailid.focus();
     return (false);
  }

  with (theform)
  {
 	    if(echeck(emailid)==false)
		{emailid.focus();return false}

  }


  if (theform.company.value == "")
  {
     alert("Please enter the company name.");
     theform.company.focus();
     return (false);
  }



 if (theform.phoneno.value == "")
  {
     alert("Please enter the phone number.");
     theform.phoneno.focus();
     return (false);
  }


  with (theform)
  {
 	    if (validate_number(phoneno,"Phone number1 is not a numeral")==false)
 	         {phoneno.focus();return false}

  }


  if (theform.no_delegates.value == "")
  {
     alert("Please enter the number of delegates.");
     theform.no_delegates.focus();
     return (false);
  }


  with (theform)
  {
 	    if (validate_number(phoneno,"Phone number1 is not a numeral")==false)
 	         {phoneno.focus();return false}

  }



}

function getCountry1() {

    document.forms["myform1"].submit();

}


//-->
</script>
<!-- Body Starts -->
<%
If Request.Form("countryName") <> "" Then
	Session("CountryOrigin") = Request.Form("countryName")
Else
	Session("CountryOrigin") = Session("CountryOrigin")
End If



 message1 = Session("message1")
 Session("message1") = ""

%>
<%

 'Price Format Display Functions'

 Currency_Format_Front = CurrencyFormat_Front(Session("CountryOrigin"))

 Currency_Format_Back = CurrencyFormat_Back(Session("CountryOrigin"))
%>

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
    
    <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
        <tr>
          <td width="2%" class="Header">&nbsp;</td>
          <td width="24%" class="Header"><img src="/ITIL/images/buttons/Why_ITIL.jpg" alt="Services" ></td>
          <td width="30%" class="Header"><img src="/ITIL/images/buttons/title_courses.jpg" alt="Services" /></td>
          <td width="21%" class="Header"><img src="/ITIL/images/buttons/itilstudy_anywhere.jpg" alt="Services" ></td>
          <td width="24%" class="Header"><img src="/ITIL/images/buttons/Our-Other-Courses.jpg" alt="Our Other Courses" ></td>
        </tr>
        <tr>
          <td width="2%">&nbsp;</td>
          <td width="24%" class="general-body"><table border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td colspan="2"><table border="0" cellpadding="4" cellspacing="0">
                    <tr>
                      <td><table width="100%">
                          <tr>
                            <td id="imageHover" ><img border="0" src="/ITIL/images/buttons/percent98-US.png" /></td>
                            <td>Our students enjoy a pass rate of 99.2% - the best in the industry <br/></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td><iframe width="200" height="150" src="http://www.youtube.com/embed/G7sizMIi9K4?wmode=transparent" frameborder="0" allowfullscreen></iframe></td>
                    </tr>
                    <tr>
                      <td width="60%"><iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fitilstudy&amp;width=292&amp;height=62&amp;colorscheme=light&amp;show_faces=false&amp;border_color&amp;stream=false&amp;header=false" scrolling="no" frameborder="0" style="border:1px solid #94A3C4; overflow:hidden; width:205px; height:62px;" allowTransparency="true"></iframe>
                        <br />
                        <br />
                        <a href="http://www.facebook.com/itilstudy/app_203351739677351" target="_blank">Like Us</a> on Facebook for discount vouchers<br />
                        <br />
                        Overall performance rating of 94 declared by Dun & Bradstreet Open Ratings. <a href="/ITIL/DunandBradstreet-Report.pdf" target="_blank">Learn More</a><br />
                        <br />
                        Classroom Benefits
                        <ol type="1">
                          <li>MyITstudy is better than other ITIL Training Providers. <a href="/ITIL/ITIL-Training/better-than-competitors.asp">More</a></li>
                          <li>3-day ITIL training including ITIL Foundation Exam and 100% Money Back Guarantee. <a href="/ITIL/ITIL-Training/moneyBack.asp">More</a></li>
                          <li>FREE iPad Mini worth $329 with all our ITIL courses. <a href="/ITIL/ITIL-Training/freeiPad.asp">More</a></li>
			  <li>3-day Training with Accelerated Learning Techniques. <a href="/ITIL/2-Day-ITIL-Training.asp">More</a></li>
                          <li>Approved by 3 leading ITIL Examination Institutes - APMG, CSME and EXIN. <a href="/ITIL/aboutCSME-APMG.asp">More</a></li>
                          <li>Several convenient ITIL Training locations. <a href="/ITIL/ITIL-Courses.asp">More</a></li>
                          <li>Complementary Risk Management course and 20 Project Management Institute (PMI)<sup>&reg;</sup> PDUs worth $150. <a href="http://www.MyITstudy.com/ITIL/ITIL-Training/free-onlinecertification.asp" target="_blank">More</a></li>
                          <li>Comprehensive ITIL courses with globally proven training methodology. <a href="/ITIL/ITIL-Training/comprehensive.asp">More</a></li>
                          <li>Experienced faculty for ITIL Certification courses. <a href="/ITIL/ITIL-Training/instructors.asp">More</a></li>
                          <li>Free 18 PMI approved PDUs with our ITIL courses. <a href="/ITIL/ITIL-Training/PMI_PDU.asp">More</a></li>
                        </ol>
                        <% 'ElseIf Session("CountryOrigin") = "Other"  Then %>
                        Online Course Benefits
                        <ol type="1">
                          <li>Economical and Effective courses. </li>
                          <li>Comprehensive Chapter Tests. </li>
                          <li>Detailed Study Guides. </li>
                          <li>Free ITIL Foundation Simulated Test.</li>
                        </ol></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td width="27%" rowspan="3" valign="top" background="/ITIL/images/back/left_line.jpg" class="general-body" ><p id="imageHover"><a href="/ITIL/ITIL-Courses.asp"> <img src="/ITIL/images/buttons/courses_basic1.jpg" alt="courses" height="28px" border="0" ></a><br />
              
            <h1 class="HomePageTitle"> <span  style="color:#0065b0; font-size:14px;"><b>3 day ITIL Foundation</b></span><br />
              Courses starting at $1,999<br />
              (Price includes exam fees, FREE iPad mini and 100% Money Back Guarantee)<br />
              
            </p>
            <span class="SubHeader"> US/Canada: <br />
            <bR />
            <%

			Set Rs = Server.CreateObject("ADODB.Recordset")
			todayDate = now()

                   strQuery = "SELECT Top 4 city,startdate,status,afterEBdiscountwithouttax, afterEBdiscountwithtax,applicabledays,pricewithtax, pricewithouttax FROM ITIL_course WHERE country='"&Session("CountryOrigin")&"' AND status <> 'Cancelled' AND startdate >= '" & todayDate & "' ORDER BY startdate ASC"
'response.Write(strQuery)
                     Rs.Open strQuery,ConnObj

					 Do Until Rs.EOF

						City      =  Rs("city")
						StartDate =  Rs("startdate")
						Status    =  Rs("status")
						Price     =  Rs("afterEBdiscountwithtax")
						PriceUK     =  Rs("afterEBdiscountwithouttax")
						PriceUK1   =  Rs("pricewithouttax")
						ApplicableDays = Rs("applicabledays")
						Price1     =  Rs("pricewithtax")

						CourseDate = Day(StartDate) & " " & MonthName(Month(StartDate), true) & ", " & Year(StartDate)
'response.Write(CourseDate)
						If(CDate(StartDate)-Date()>0) Then

				  %>
            <a href="/ITIL/ITIL-Courses.asp">
            <% = City %>
            |
            <% = CourseDate %>
            </a>
            <% If Status = "Full" Then %>
            <font color="red">&nbsp;&nbsp;&nbsp;Full</font>
            <% End If %>
            <br>
            <%

					 End If
					 Rs.Movenext
					 Loop
                     Rs.Close
				  %>
            </span> <br />
            View classes in <a href="http://www.MyITstudy.com/ITIL/ITIL-Training-Atlanta.asp">Atlanta</a>, <a href="http://www.MyITstudy.com/ITIL/ITIL-Training-Chicago.asp">Chicago</a>, <a href="http://www.MyITstudy.com/ITIL/ITIL-Training-Charlotte.asp">Charlotte</a>, <a href="http://www.MyITstudy.com/ITIL/ITIL-Training-Los-Angeles.asp">Los Angeles</a>, <a href="http://www.MyITstudy.com/ITIL/ITIL-Training-Miami.asp">Miami</a>, <a href="http://www.MyITstudy.com/ITIL/ITIL-Training-New-York.asp">New York</a>, <a href="http://www.MyITstudy.com/ITIL/ITIL-Training-Orlando.asp">Orlando</a>, <a href="http://www.MyITstudy.com/ITIL/ITIL-Training-Phoenix.asp">Phoenix</a>, <a href="http://www.MyITstudy.com/ITIL/ITIL-Training-San-Francisco.asp">San Francisco</a>, <a href="http://www.MyITstudy.com/ITIL/ITIL-Training-Seattle.asp">Seattle</a>, <a href="http://www.MyITstudy.com/ITIL/ITIL-Training-Toronto.asp">Toronto</a>, <a href="http://www.MyITstudy.com/ITIL/ITIL-Training-Washington-D.C.-(Fairfax).asp">Washington DC</a>, and <a href="http://www.MyITstudy.com/ITIL/ITIL-Courses.asp">other cities</a>.</span> <br />
            <br />
            <span align="right"><a href="/ITIL//ITIL-Courses.asp">Click here for more classes </span>
            <p id="imageHover"><a href="/ITIL/ITIL-OSA-Courses.asp"> <img src="/ITIL/images/buttons/ITIL-Advanced-OSA1.jpg" alt="courses" height="28px" border="0" ></a><br />
              
              ITIL Intermediate courses starting at $ 2,999 with attractive group discount <br />
              (Price includes exam fees and FREE iPad mini)<br />
<br />
              
              <a href="/ITIL/ITIL-OSA-Courses.asp"> Click here to see dates and locations for ITIL Operational Support & Analysis (OSA) Qualification Courses</a> <br />
              <br />
	      <a href="/ITIL/ITIL-CSI-Courses.asp"> Click here to see dates and locations for ITIL Continual Service Improvement (CSI) Qualification Courses</a> <br />
              <br />
		<a href="/ITIL/ITIL-ST-Courses.asp"> Click here to see dates and locations for ITIL Service Transition (ST) Qualification Courses</a> <br />
		<%If Session("CountryOrigin") <> "India" And  Session("CountryOrigin") <> "US" And Session("CountryOrigin") <> "Canada" And Session("CountryOrigin") <>"Saudi Arabia" And Session("CountryOrigin") <> "Singapore" Then%>
              <br />
              <br />
              <a href="/ITIL/ITIL-ST-Courses.asp"> <img src="/ITIL/images/buttons/ITIL-Advanced-CSI1.jpg" alt="courses" height="28px" border="0" ></a><br />
              <span id="subImage">For ITIL<sup>&reg;</sup> Intermediate ST</span></span><br />
              <br />
              <br />
              <%

			Set Rs = Server.CreateObject("ADODB.Recordset")
			todayDate = now()

                   strQuery = "SELECT Top 4 city,startdate,status,afterEBdiscountwithouttax, afterEBdiscountwithtax,applicabledays,pricewithtax, pricewithouttax FROM ITIL_course WHERE coursetype = 'ST' AND country='"&Session("CountryOrigin")&"' AND status <> 'Cancelled' AND startdate >= '" & todayDate & "' ORDER BY startdate ASC"
'response.Write(strQuery)
                     Rs.Open strQuery,ConnObj

					 Do Until Rs.EOF

						City      =  Rs("city")
						StartDate =  Rs("startdate")
						Status    =  Rs("status")
						Price     =  Rs("afterEBdiscountwithtax")
						PriceUK     =  Rs("afterEBdiscountwithouttax")
						PriceUK1   =  Rs("pricewithouttax")
						ApplicableDays = Rs("applicabledays")
						Price1     =  Rs("pricewithtax")

						CourseDate = Day(StartDate) & " " & MonthName(Month(StartDate), true) & ", " & Year(StartDate)
'response.Write(CourseDate)
						If(CDate(StartDate)-Date()>0) Then

				  %>
              <a href="/ITIL/ITIL-ST-Courses.asp">
              <% = City %>
              |
              <% = CourseDate %>
              </a>
              <% If Status = "Full" Then %>
              <font color="red">&nbsp;&nbsp;&nbsp;Full</font>
              <% End If %>
              <br>
              <%

					 End If
					 Rs.Movenext
					 Loop
                     Rs.Close
				  %>
              <br />
              <a href="/ITIL/ITIL-ST-Courses.asp"> Click here for more classes </a></span>
              <%End If %>
            </p></td>
          <%' If Session("CountryOrigin") = "Other" OR Session("CountryOrigin")="United Kingdom" Then %>
          <td width="21%" rowspan="3" valign="top" background="/ITIL/images/back/left_line.jpg" class="general-body" ><!--ITIL Online Course -->
            <p id="imageHover"><a href="/ITIL/ITIL-Training/ITIL-Led-Live-Online-Course.asp"><img src="/ITIL/images/buttons/WBT1.jpg" height="29px" border="0"></a><br />
              <span id="subImage">For ITIL<sup>&reg;</sup> Foundation</span></span>
            <h1 class="HomePageTitle"> <span  style="color:#0065b0; font-size:14px;"><a href="/ITIL/ITIL-Training/3-Day-ITIL-Led-Live-Online-Course.asp"><b>3 day instructor-led Virtual Live Class</b></a></span><br />
              Courses starting at $1,999 <br />
              (Price includes exam fees, FREE iPad mini and 100% Money Back Guarantee)<br />
              With real life examples and case studies<br />
            </h1>
            </p>
            
            <p id="imageHover"><a href="/ITIL/ITIL-Online-Courses.asp"><img src="/ITIL/images/buttons/edu1.png"  height="28px" border="0"></a><br />
              <span id="subImage">For ITIL<sup>&reg;</sup> Online Courses</span></span> <br />
	       Courses starting at $300	 <br />
              (Prices include all taxes and exclude exam fees)<br />
              <br />
              <a href="/ITIL/ITIL-Online-Courses.asp">ITIL Foundation Course - $ 300 </a><br />
              <a href="/ITIL/ITIL-Online-Courses.asp">Intermediate OSA Course - $ 665 </a><br />
              <a href="/ITIL/ITIL-Online-Courses.asp">Intermediate CSI Course - $ 665 </a><br />
              <a href="/ITIL/ITIL-Online-Courses.asp">Intermediate ST Course - $ 665 </a><br />
              <br />
            </p>
            <!--Blend Course -->
            <p id="imageHover"><a href="/ITIL/ITIL-Online-Courses.asp"><img src="/ITIL/images/buttons/Blended1.png"  height="28px" border="0"></a><br />
              <span id="subImage">For ITIL<sup>&reg;</sup> Online Courses with Exam</span></span> <br />
              
              <br />
              <a href="/ITIL/ITIL-Online-Courses.asp">ITIL Foundation Blended Course - $ 450 </a> <br />
		(Price includes all taxes and exam fees)<br />              
		<br />
            </p>
         
            
            </td>
          <% 'End if %>
          <td width="26%" rowspan="3" background="/ITIL/images/back/left_line.jpg" class="general-body"><table width="100%" border="0" cellspacing="0" cellpadding="2">
           
              
              <tr>
                <td valign="top" ><a href="http://www.SCRUMstudy.com" target="_blank"><img src="/ITIL/images/buttons/scrum.jpg" border="0" align="left" /></a></td>
                <td width="80%" valign="top" ><a href="http://www.SCRUMstudy.com" target="_blank">SCRUMstudy.com</a><br />
                  A preferred training provider for Scrum and Agile Certification</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" width="20%" ><a href="http://www.pmstudy.com" target="_blank"><img src="/ITIL/images/buttons/PM.jpg" border="0" align="left"/> </a></td>
                <td width="80%" valign="top" ><a href="http://www.pmstudy.com" target="_blank">PMstudy.com</a><br />
                  A leading organization for  PMP<sup>&reg;</sup> / CAPM<sup>&reg;</sup> exam prep training </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td valign="top" ><a href="http://www.6sigmastudy.com" target="_blank"><img src="/ITIL/images/buttons/6sigma.jpg" border="0" align="left" /></a></td>
                <td width="80%" valign="top" ><a href="http://www.6sigmastudy.com" target="_blank">6sigmastudy.com</a><br />
                  The preferred Six Sigma Training organization</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td valign="top"><a href="http://www.progstudy.com" target="_blank"><img src="/ITIL/images/buttons/PROG.jpg" border="0" align="left" /></a></td>
                <td width="80%" valign="top" ><a href="http://www.progstudy.com" target="_blank">PROGstudy.com</a><br />
                  Offers "Economical and Effective" PgMP Course</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td colspan="2">For our other courses <a href="/ITIL/affiliates.asp" >Click here</a></td>
              </tr>
              <tr>
                <td colspan="2"><br /></td>
              </tr>
              
              
            </table></td>
        </tr>
        </tr>
        
      </table></td>
  </table>
  </tr>
  </table>
  </td>
  </tr>
  </table>
</div>
