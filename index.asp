<!--#include virtual="/metatags/index_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/indexbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->

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
            <td width="24%" class="Header"><img src="/images/buttons/Why_ITIL.jpg" alt="Services" ></td>
			 <td width="30%" class="Header">
			 <% If Session("CountryOrigin") = "Other" Then  %>
           	 <img src="images/buttons/title_news.jpg" alt="Services" /> 
             <% Else %>
             <img src="/images/buttons/title_courses.jpg" alt="Services" />
			 <% End If %></td>
             
             
			<% If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin")="United Kingdom") Then  %>
            <td width="21%" class="Header"><img src="/images/buttons/itilstudy_anywhere.jpg" alt="Services" ></td>            
            
            <% Else %>
            <td width="21%" class="Header"><img src="/images/buttons/title_courses-ol.jpg" alt="Services" ></td>
            <% End If %>
            <% If Session("CountryOrigin")="United Kingdom" Then  %>
           <td width="24%" class="Header"><img src="/images/buttons/ITILstudy-Corporate.jpg" alt="Services" ></td>
           <% Else %>
           <td width="24%" class="Header"><img src="/images/buttons/Affiliates.jpg" alt="Services" ></td>
           <% End If %>
          </tr>
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="24%" class="general-body"><table border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="2"><table border="0" cellpadding="4" cellspacing="0">
				  <tr>
				  <td>
				  <table width="100%">   
                  
                   <% If Session("CountryOrigin") = "United Kingdom" Then %>
                  
				<tr>
                  <td id="imageHover" ><img border="0" src="/images/buttons/percent98-UK.jpg" /></td>
				   </tr>
                  <tr><td>Our students enjoy a pass rate of 99.2% - the best in the industry <br/></td></tr>

                  
                   <% ElseIf Session("CountryOrigin") <> "Singapore" AND Session("CountryOrigin") <> "Other" AND Session("CountryOrigin") <> "United Kingdom" Then %>
                   
					<tr>
                  <td id="imageHover" ><img border="0" src="/images/buttons/percent98-US.png" /></td>
				   <td>Our students enjoy a pass rate of 99.2% - the best in the industry <br/></td>
                   </tr>
                  
				<% End If %>
                
		</table>
				 </td></tr>
                 <% If Session("CountryOrigin") <> "India" AND Session("CountryOrigin") <> "UAE" AND Session("CountryOrigin") <> "Other" Then %>
				 <tr>
                 <td>
					<iframe width="200" height="150" src="http://www.youtube.com/embed/rdnUsT2MmEA" frameborder="0" allowfullscreen></iframe>
                 </td>
                 </tr>
				<% End If %>                 
				 <tr>
                        <td width="60%">
						<% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin")="United Kingdom" OR Session("CountryOrigin") = "Australia"  Then %>
						<iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fitilstudy&amp;width=292&amp;height=62&amp;colorscheme=light&amp;show_faces=false&amp;border_color&amp;stream=false&amp;header=false" scrolling="no" frameborder="0" style="border:1px solid #94A3C4; overflow:hidden; width:205px; height:62px;" allowTransparency="true"></iframe><br /><br />
						<% End If%>
                        <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" Then %>
                        <a href="http://www.facebook.com/ITILstudy/app_203351739677351" target="_blank">Like Us</a> on Facebook for Discount vouchers<br /><br />
						<% End If%>
				   <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India"  OR  Session("CountryOrigin") = "Australia"  Then %>
                      
                          Classroom Benefits
                          
                          <ol type="1">
						   <li>ITILstudy is better than other ITIL Training Providers. <a href="/ITIL-Training/better-than-competitors.asp">More</a></li>
						   
                           <% If Session("CountryOrigin") = "India" Then %>
                           <li>2 day ITIL training including ITIL Foundation Exam.</li>
                           <% Else %>
                           <li>2 day ITIL training including ITIL Foundation Exam and 100% Money Back Guarantee. <a href="/ITIL-Training/moneyBack.asp">More</a></li>
                           <% End If %>
						   
						   <li>2 Day Training with Accelerated Learning Techniques. <a href="/2-Day-ITIL-Training.asp">More</a></li>
                           <li>Approved by 2 leading ITIL Examination Institutes - APMG and CSME. <a href="/aboutCSME-APMG.asp">More</a></li>
                           <li>Several convenient ITIL Training locations. <a href="/ITIL-Courses.asp">More</a></li>
                           <li>Comprehensive ITIL courses with globally proven training methodology. <a href="/ITIL-Training/comprehensive.asp">More</a></li>
                           <li>Best faculty for ITIL Certification courses. <a href="/ITIL-Training/instructors.asp">More</a></li>

							<!--<%' If Session("CountryOrigin") = "Australia" then %>
                            <li>Free Six Sigma Green Belt Certification and 25 PMI PDUs worth 250 USD.<br />or<br />
							Human Resource Development Certification and 20 PMI PDUs worth 250 USD. <a href="ITIL-Training/free-onlinecertification.asp">More</a>
							</li>
							
                           <%' ElseIf Session("CountryOrigin")="United Kingdom" Then %>
                            <li>Free Six Sigma Green Belt Certification and 25 PMI PDUs worth &#163;175.<br />or<br />
							Human Resource Development Certification and 20 PMI PDUs worth &#163;175. <a href="ITIL-Training/free-onlinecertification.asp">More</a>
							</li>
                            <%' ElseIf Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then   %>
                            <li>Free Six Sigma Green Belt Certification and 25 PMI PDUs worth $ 250.<br />or<br />
							Human Resource Development Certification and 20 PMI PDUs worth $ 250. <a href="ITIL-Training/free-onlinecertification.asp">More</a>
							</li>       
							<%' ElseIf Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore"  then   %>
                            <li>Free Six Sigma Green Belt Certification and 25 PMI PDUs worth $ 250.<br />or<br />
							Human Resource Development Certification and 20 PMI PDUs worth $ 250. <a href="ITIL-Training/free-onlinecertification.asp">More</a>
							</li>                                                 
							 <%' End If %>-->
                           <li>Free 18 PMI approved PDUs with our ITIL courses. <a href="/ITIL-Training/PMI_PDU.asp">More</a></li>
                          </ol>
                          
                          <% ElseIf Session("CountryOrigin")="United Kingdom" Then %>
                          
                          
                          Classroom Benefits
                          
                          <ol type="1">
						   <li>ITILstudy is better than other ITIL Training Providers. <a href="/ITIL-Training/better-than-competitors.asp">More</a></li>
						  <li>100% Money Back Guarantee. <a href="/ITIL-Training/moneyBack.asp">More</a></li>  
                           <li>Best Faculty. <a href="/ITIL-Training/instructors.asp">More</a></li>
                           <li>Convenient Locations. <a href="/ITIL-Courses.asp">More</a></li>
                           <li>3 Days Comprehensive Training. <a href="ITIL-Training/comprehensive.asp">More</a></li>
                           <li>Complimentary RMstudy certification. <a href="ITIL-Training/free-onlinecertification.asp">More</a></li>
                           <li>99.2% pass rate. <a href="ITIL-Training/Success-Rate.asp">More</a></li>                          
                           <li>Approved by 2 leading ITIL Examination Institutes - APMG and CSME. <a href="/aboutCSME-APMG.asp">More</a></li>
                            <li>Globally proven training methodology.</li>
                             <li>Free 18 PMI approved PDU’s.</a></li>
                          </ol>
                          
                          
                            <% End If %>       
                          <% 'ElseIf Session("CountryOrigin") = "Other"  Then %>
                          Online Course Benefits
                           
						  <ol type="1">
                          <li>Best priced and Effective courses. </li>
                          <li>Comprehensive Chapter Tests. </li>
                          <li>Detailed Study Guides. </li>
                          <li>Free ITIL Foundation Simulated Test.</li>
                         
						</ol>
						  
						 <!-- <ol type="1">
                          <li>Best priced and Effective courses. <a href="/ITIL-Training/courseBenefits-Online.asp">More</a></li>
                          <li>Comprehensive Chapter Tests. <a href="/freeresources/chapterTest.asp"> More</a></li>
                          <li>Detailed Study Guides. <a href="/freeresources/freestudyGuides.asp">More</a></li>
                          <li>Free ITIL Foundation Simulated Test. <a href="/freeresources/freeSimulatedTest.asp">More</a></li>
                          <ol> -->
						               
						     </td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
			  
            <td width="27%" rowspan="3" valign="top" background="/images/back/left_line.jpg" class="general-body" >
			
			
			 <% If Session("CountryOrigin") = "Other"  Then %>
           ITILstudy offers the best online courses (highest success rates) at the most economical prices for ITIL Foundation exam preparation.  <br /><br />View our ITILstudy classes in other countries.<br />
		    
              <table border="0" width="80%">
                <tr>
                  <td width="50%"><b>Select Country:</b></td>
                  <td height="30%" >
                    <form name="myform1" method="post">
              
                <select name="countryName" id="countryName" onChange="getCountry1();">
                  <option value="">-Select Country-</option>
                  <option <% If Session("CountryOrigin") = "Australia" Then %> selected="selected" <% End If %> value="Australia">Australia</option>
				  <option <% If Session("CountryOrigin") = "Canada" Then %> selected="selected" <% End If %> value="Canada">Canada</option>
                  <option <% If Session("CountryOrigin") = "India" Then %> selected="selected" <% End If %> value="India">India</option>
				  <option <% If Session("CountryOrigin") = "Singapore" Then %> selected="selected" <% End If %> value="Singapore">Singapore</option>
				  <option <% If Session("CountryOrigin") = "UAE" Then %> selected="selected" <% End If %> value="UAE">UAE</option>
				  <option <% If Session("CountryOrigin") = "United Kingdom" Then %> selected="selected" <% End If %> value="United Kingdom">United Kingdom</option>
				  <option <% If Session("CountryOrigin") = "US" Then %> selected="selected" <% End If %> value="US">US</option>

                  <!-- <option <%' If Session("CountryOrigin") = "Canada" Then %> selected="selected" <%' End If %> value="Canada">Canada</option>-->
                </select>
              
            </form><br /><br /></td>
                </tr>
              </table>
             
            <%' End If %>
			 <% Else %>
			 
			  <p id="imageHover"><a href="/ITIL-Courses.asp"> <img src="/images/buttons/courses_basic.jpg" alt="courses" height="44px" border="0" ></a>
			  <br /> 
              
                <% If Session("CountryOrigin") = "United Kingdom"  Then %>
                Courses starting from £ 900 <br />(Price inclusive of exam fees and 100% Money Back Guarantee)        
                 <% ElseIf Session("CountryOrigin") = "Australia"  Then %>
                 Courses starting at 1400 AUD <br />(Prices are inclusive of exam fees and 100% Money Back Guarantee)
                <% ElseIf Session("CountryOrigin") = "Singapore"  Then %> 
                Courses starting at 1600 SGD<br /> (Prices are inclusive of exam fees and 100% Money Back Guarantee)
                <% ElseIf Session("CountryOrigin") = "UAE"  Then %> 
                Courses starting at $ 1000 <br /> (Prices are inclusive of exam fees and 100% Money Back Guarantee)
                <% ElseIf Session("CountryOrigin") = "India"  Then %> 
                  Courses starting at Rs. 10750<br /> (Prices are inclusive of exam fees)
                 <% ElseIf (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada")  Then %> 
                 <a href="/ITIL-Courses.asp">Courses starting at $ 1199 with attractive group discounts</a><br /> (Prices are inclusive of exam fees and 100% Money Back Guarantee)
                  <% ElseIf Session("CountryOrigin") = "Germany"  Then %> 
                 <a href="/ITIL-Courses.asp">Courses starting at € 890 with attractive group discounts</a><br /> (Prices are inclusive of exam fees and 100% Money Back Guarantee)
			    <%End If %>
              
               
              </p>
			  
			   <span class="SubHeader">
          <% If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") Then %>
          Select from more than 35 cities in US/Canada:
          <br /><bR />
		  <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
          Select from 29 cities across United Kingdom:
          <br /><bR />
           <% ElseIf (Session("CountryOrigin") = "Germany") Then %>                                  
          Select from the following cities: 
                    <br /><bR />

          <% End If %>
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
              <a href="/ITIL-Courses.asp">
              <% = City %>
              |
              <% = CourseDate %>
  
              </a>&nbsp;&nbsp;&nbsp;
              <% If Status = "Full" Then %>
              <font color="red">Full</font>
              <% End If %>
              <br>
              <%
				     
					 End If
					 Rs.Movenext
					 Loop
                     Rs.Close
				  %>
          
          </span>
         
          
           <%If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") Then%>
        
         <br /> <a href="/ITIL-Courses.asp"> View classes in Atlanta, Chicago, Charlotte, Los Angeles, Miami, New Jersey, New York, Orlando, Phoenix, San Francisco, Seattle, Toronto, Washington DC, and other cities.</a></span>
         
          <%End If%>
          
          
          <% If Session("CountryOrigin") = "United Kingdom" Or   Session("CountryOrigin") = "US" or Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "India" Then %>
          
           <p id="imageHover"><a href="/ITIL-OSA-Courses.asp"> <img src="/images/buttons/ITIL-Advanced-OSA.jpg" alt="courses" height="44px" border="0" ></a>
			    <br /> 
                
                
                <% If Session("CountryOrigin") = "United Kingdom" Then %>
                
                Intermediate Training Courses<br/>ITIL Capability Certificate in Operational Support and Analysis (4 Days) <br />Courses starting from £ 1850 (Price inclusive of exam fees)
                
                 <% ElseIf Session("CountryOrigin") = "US" or Session("CountryOrigin") = "Canada" Then %>
                 
                Operational Support and Analysis (OSA) courses starting from $ 2,150 with attractive group discount (Prices are inclusive of exam fees) 
                
                 <% ElseIf Session("CountryOrigin") = "India" Then %>
                 
               ITIL Capability Certificate in Operational Support and Analysis (3 Days) Courses starting from Rs 28,776 (Price inclusive of exam fees)
                 
                 <% End If %>
                
              <br /><br />
                
                
                <%

			Set Rs = Server.CreateObject("ADODB.Recordset")
			todayDate = now()

                   strQuery = "SELECT Top 4 city,startdate,status,afterEBdiscountwithouttax, afterEBdiscountwithtax,applicabledays,pricewithtax, pricewithouttax FROM ITIL_course WHERE coursetype = 'OSA' AND country='"&Session("CountryOrigin")&"' AND status <> 'Cancelled' AND startdate >= '" & todayDate & "' ORDER BY startdate ASC"
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
              <a href="/ITIL-OSA-Courses.asp">
              <% = City %>
              |
              <% = CourseDate %>
  
              </a>&nbsp;&nbsp;&nbsp;
              <% If Status = "Full" Then %>
              <font color="red">Full</font>
              <% End If %>
              <br>
              <%
				     
					 End If
					 Rs.Movenext
					 Loop
                     Rs.Close
				  %>
                
         <br />
                
                <a href="/ITIL-OSA-Courses.asp"> Click here for more classes</a>
               <br /><br />
               <a href="/ITIL-CSI-Courses.asp"> <img src="/images/buttons/ITIL-Advanced-CSI.jpg" alt="courses" height="44px" border="0" ></a><br />
               
                 <% If Session("CountryOrigin") = "United Kingdom" Then %>
                
                  Intermediate Training Courses<br/>ITIL Lifecycle Certificate in Continual Service Improvement (3 Days)<br/>Courses starting from £ 1000 (Price inclusive of exam fees)       
                 <% ElseIf Session("CountryOrigin") = "US" or Session("CountryOrigin") = "Canada" Then %>
                 
                 Continual Service Improvement (CSI) courses starting from $ 2,150 with attractive group discount (Prices are inclusive of exam fees) 

<% ElseIf Session("CountryOrigin") = "India" Then %>
                 
ITIL Lifecycle Certificate in Continual Service Improvement (3 Days) Courses starting from Rs 28,776 (Price inclusive of exam fees) 

                 
                 <% End If %>
               
           
                <br /><br />
                
                 <%

			Set Rs = Server.CreateObject("ADODB.Recordset")
			todayDate = now()

                   strQuery = "SELECT Top 4 city,startdate,status,afterEBdiscountwithouttax, afterEBdiscountwithtax,applicabledays,pricewithtax, pricewithouttax FROM ITIL_course WHERE coursetype = 'CSI' AND country='"&Session("CountryOrigin")&"' AND status <> 'Cancelled' AND startdate >= '" & todayDate & "' ORDER BY startdate ASC"
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
              <a href="/ITIL-CSI-Courses.asp">
              <% = City %>
              |
              <% = CourseDate %>
  
              </a>&nbsp;&nbsp;&nbsp;
              <% If Status = "Full" Then %>
              <font color="red">Full</font>
              <% End If %>
              <br>
              <%
				     
					 End If
					 Rs.Movenext
					 Loop
                     Rs.Close
				  %>
                
                
               
           <% ElseIf Session("CountryOrigin") = "UAE" Then %>
           <BR /> 
			Select from 2 cities across UAE:
           <% ElseIf Session("CountryOrigin") = "Singapore" Then %>            
           <BR />
            Select a convenient program in Singapore:
           <% ElseIf Session("CountryOrigin") = "India" Then %>            
           <BR />
			Select from 9 cities across India:
           <% ElseIf (Session("CountryOrigin") = "Australia") Then %>                                  
           <BR />
           Select from 6 cities across Australia:
		  
		  <% End If %></span> 

          
<br />
       
		<%If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") Then%>
        
         	 <a href="/ITIL-CSI-Courses.asp"> Click here for more classes </a></span>
            <% elseIf (Session("CountryOrigin") = "Australia") Then %>
		    <a href="/ITIL-Courses.asp">View classes in Sydney, Melbourne, Canberra, Adelaide, Perth, Brisbane and other cities.</a></span>
			<% ElseIf (Session("CountryOrigin") = "United Kingdom" ) Then %>
		   <a href="/ITIL-CSI-Courses.asp"> Click here for more classes </a></span>
			<% ElseIf (Session("CountryOrigin") = "India") Then %>
		   <a href="/ITIL-Courses.asp"> View classes in Bangalore, Mumbai, Delhi, Pune, Hyderabad, Kolkata, Ahmedabad, Coimbatore, Trivandrum and other cities.</a></span>
		
	<%Else%>
    
        <span align="right"><a href="/ITIL-Courses.asp">See More Courses in <%=Session("CountryOrigin")%>...</a></span>
          
    <%End If%>
			  
              </p> 
			

			   <% End If %>
			               </td>
						   
						    <%' If Session("CountryOrigin") = "Other" OR Session("CountryOrigin")="United Kingdom" Then %>
				   <td width="21%" rowspan="3" valign="top" background="/images/back/left_line.jpg" class="general-body" >		
					
						   
              <!--ITIL Online Course -->
              	<% If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin")="United Kingdom") Then %>
                <p id="imageHover"><a href="/ITIL-Training/ITIL-Led-Live-Online-Course.asp"><img src="/images/buttons/WBT.jpg" height="46px" border="0"></a><br />
                 <a href="/ITIL-Training/ITIL-Led-Live-Online-Course.asp">Instructor-led Virtual Classes</a><br />
                 Courses starting at <% If Session("CountryOrigin")="United Kingdom" Then %> £ 900 (Prices are inclusive of exam fees and 100% Moneyback Guarantee)<% Else %>$1199
                (Prices are inclusive of exam fees and 100% Money Back Guarantee)<% End If %>
               <br /><br /></p>
               

                

            <% End If %>
               
					<% If Session("CountryOrigin")="United Kingdom" Then %>
					  <p id="imageHover"><a href="/ITIL-Online-Courses.asp"><img src="/images/buttons/edu.png"  height="44px" border="0"></a></span>
                   <br /><br />
                    <a href="/ITIL-Online-Courses.asp">ITIL Foundation Course - <% = Currency_Format_Front %> 200 <% = Currency_Format_Back %> </a>
                    </a><br />
					<a href="/ITIL-Online-Courses.asp">Intermediate OSA Course - <% = Currency_Format_Front %> 425  <% = Currency_Format_Back %></a><br />
                    <a href="/ITIL-Online-Courses.asp">Intermediate CSI Course - <% = Currency_Format_Front %> 425  <% = Currency_Format_Back %></a><br />
					<br /></p>
					
					<% ElseIf Session("CountryOrigin")="Australia" Then %>
					  <p id="imageHover"><a href="/ITIL-Online-Courses.asp"><img src="/images/buttons/edu.png"  height="44px" border="0"></a></span>
                   <br /><br />
                    <a href="/ITIL-Online-Courses.asp">ITIL Foundation Course - 285 AUD </a></a><br />
					<a href="/ITIL-Online-Courses.asp">Intermediate OSA Course - 625 AUD </a><br />
                    <a href="/ITIL-Online-Courses.asp">Intermediate CSI Course - 625 AUD </a><br />
					<br /></p>
					  <% Else %>
                  <p id="imageHover"><a href="/ITIL-Online-Courses.asp"><img src="/images/buttons/edu.png"  height="44px" border="0"></a></span>
                    <br />(Prices are inclusive of all taxes)<br /><br />
                    <a href="/ITIL-Online-Courses.asp">ITIL Foundation Course - $ 300 </a><br />
					<a href="/ITIL-Online-Courses.asp">Intermediate OSA Course - $ 665  </a><br />
                    <a href="/ITIL-Online-Courses.asp">Intermediate CSI Course - $ 665  </a><br />
					<br /></p>
					<% End If %>

					
					<!--Blend Course -->
					
					<% If Session("CountryOrigin")="United Kingdom" Then %>
					<p id="imageHover"><a href="/ITIL-Online-Courses.asp"><img src="/images/buttons/Blended.png"  height="44px" border="0"></a>
                   <br /><br />
					<a href="/ITIL-Online-Courses.asp">ITIL Blended Course - <% = Currency_Format_Front %> 350 <% = Currency_Format_Back %></a><br /><br />
					</p>
					<% ElseIf Session("CountryOrigin")="Australia" Then %>
					<p id="imageHover"><a href="/ITIL-Online-Courses.asp"><img src="/images/buttons/Blended.png"  height="44px" border="0"></a>
                   <br /><br />
					<a href="/ITIL-Online-Courses.asp">ITIL Blended Course - 560 AUD </a><br /><br />
					</p>
					 <% Else %>
					<p id="imageHover"><a href="/ITIL-Online-Courses.asp"><img src="/images/buttons/Blended.png"  height="44px" border="0"></a></span>
                    <br />(Prices are inclusive of all taxes)<br /><br />
					<a href="/ITIL-Online-Courses.asp">ITIL Blended Course - $ 450 </a>
					<br /><br /></p>
					<% End If %>
				



<table>
<tr>		

<% If Session("CountryOrigin") = "United Kingdom" Then %>
                  
	<td id="imageHover">&nbsp;&nbsp;&nbsp;<img border="0" src="/images/buttons/New-UK.jpg"  border="0" /></td>
                  
<% ElseIf Session("CountryOrigin") <> "Singapore" AND Session("CountryOrigin") <> "Other" AND Session("CountryOrigin") <> "United Kingdom" Then %>

		<td id="imageHover">&nbsp;&nbsp;&nbsp;<img border="0" src="/images/buttons/New.jpg"  border="0" /></td>
                    
 <% End If %>
                   
                   
                   <td><br />Based on 2011 Syllabus, Approved by APMG </td></tr></table>

                  <!-- <td width="20%" id="imageHover"><a href="/ITIL-Online-Courses.asp"><img src="/images/buttons/Blended.jpg" width="168px " height="44px" border="0"></a>
                    <br />(Prices are inclusive of all taxes)<br /><br /></td></tr> -->
               
   
			                    <p id="imageHover"><a href="/ITIL-Training/classroom-FAQ.asp"><img src="/images/buttons/Faq.jpg" height="97" border="0"></a></p>

              </td>
              

			 <% 'End if %> 
                <td width="26%" rowspan="3" background="/images/back/left_line.jpg" class="general-body"> 
			<table width="100%" border="0" cellspacing="0" cellpadding="2">
         
			
<% If Session("CountryOrigin")<>"United Kingdom" Then %>
    
<tr><td valign="top" ><a href="http://www.projstudy.com" target="_blank"><img src="/images/buttons/PROJ.jpg" border="0" align="left" /></a></td>
<td width="80%" valign="top" ><a href="http://www.projstudy.com" target="_blank">PROJstudy.com</a><br />A premier training provider for PRINCE2<sup>&reg;</sup></td></tr>
<tr><td>&nbsp;</td></tr>

	<tr>
	<td valign="top" width="20%" ><a href="http://www.pmstudy.com" target="_blank"><img src="/images/buttons/PM.jpg" border="0" align="left"/> </a></td>
	
	<td width="80%" valign="top" ><a href="http://www.pmstudy.com" target="_blank">PMstudy.com</a><br />A leading organization for  PMP<sup>&reg;</sup> / CAPM<sup>&reg;</sup> exam prep training </td></tr>
	<tr><td>&nbsp;</td></tr>
    
<tr><td valign="top" ><a href="http://www.6sigmastudy.com" target="_blank"><img src="/images/buttons/6sigma.jpg" border="0" align="left" /></a></td>

<td width="80%" valign="top" ><a href="http://www.6sigmastudy.com" target="_blank">6sigmastudy.com</a><br /> The preferred Six Sigma Training organization</td></tr>
<tr><td>&nbsp;</td></tr>


	
	<tr><td valign="top"><a href="http://www.progstudy.com" target="_blank"><img src="/images/buttons/PROG.jpg" border="0" align="left" /></a></td>
	
	<td width="80%" valign="top" ><a href="http://www.progstudy.com" target="_blank">PROGstudy.com</a><br />Offers "Economical and Effective" PGMP Course</td></tr>
	         
<tr><td>&nbsp;</td></tr>
	<tr>	
<td colspan="2">For more affiliate courses <a href="/affiliates.asp" >Click here</a></td>
	</tr>
    
    <% Else %>
    <b>Corporate Class Offers</b><br/><br/>We are specialized in providing<br /> corporate and onsite training.<br /> Provide us your requirements <br />and we will get the best offers:<br/><br/>
        
     <form name="addcorporate" action="addcorporateclass.asp" method="post" onsubmit="return Form_Validator(this)">
    <table border="0" cellpadding="2" cellspacing="0" width="105%">
     <tr><td colspan="2"><span style="color:red;"><% =message1 %></span></td></tr>
    <tr><td>Name<span class="Required">*</span></td><td><input type="text" name="name" size="13px"/></td></tr>
    <tr><td>Email ID <span class="Required">*</span></td><td><input type="text" name="emailid" size="13px" /></td></tr>
    <tr><td>Company <span class="Required">*</span></td><td><input type="text" name="company" size="13px"/></td></tr>
    <tr><td>Contact No.<span class="Required">*</span></td><td><input type="text" name="phoneno" size="13px"/></td></tr>
    <tr><td>Course<span class="Required">*</span></td><td><select name="course" ><option>ITIL Foundation</option><option>CSI Course</option><option>OSA Course</option></select></td></tr>
    <tr><td colspan="2">
    <table>
    <tr><td>No. of Delegates<span class="Required">*</span></td><td><input type="text" name="no_delegates" size="8px" /></td></tr></table></td></tr>
    <tr><td>&nbsp;</td><td><input type="submit" name="Submit" value="Submit" />&nbsp;</td></tr>		
    </table>
    </form>
    <% End If %>
    <br /><br />
    <% If Session("CountryOrigin") = "United Kingdom" Then %>
	<table><tr><td>
    <p class="Header" style="font-size:13px">ITILSTUDY – YOUR TRUSTED PARTNER FOR CORPORATE TRAINING</p>
	</td></tr><tr><td>				
			
              <style type="text/css">
			 #slide img
			 {
			  	margin-right: 10px;
				margin-left: 10px;
				border: 1px solid #CCC;
				vertical-align: middle;
				
			  }			  
			  a#marquee:hover{
				background:#fff;
			  }
			  </style><br />
             <marquee behavior="alternate" hspace="10px" scrollamount="5" id="slide" onMouseover="this.scrollAmount=1" onMouseout="this.scrollAmount=5"><a href="/ITIL-Training/exam-success.asp" id="marquee">
                <img src="/images/com_logo/cadbury.png" width="74" height="56" />
                <img src="/images/com_logo/adidas-group.png" width="112" height="54" />
                <img src="/images/com_logo/adobe.png" width="56" height="56" />
                <img src="/images/com_logo/american-express.png" width="52" height="56" />
                <img src="/images/com_logo/apple.png" width="56" height="56" />
                <img src="/images/com_logo/at&t.png" width="60" height="56" />
                <img src="/images/com_logo/bank-of-america.png" width="59" height="56" />
                <img src="/images/com_logo/barclays.png" width="112" height="54" />
                <img src="/images/com_logo/bosch.png" width="56" height="56" />
                <img src="/images/com_logo/bp.png" width="77" height="56" />
                <img src="/images/com_logo/dell.png" width="56" height="56" />
                <img src="/images/com_logo/ernst&young.png" width="56" height="56" />
                <img src="/images/com_logo/emirates.png" width="74" height="56" />
                <img src="/images/com_logo/ericsson.png" width="56" height="56" />
                <img src="/images/com_logo/exchange.png" width="85" height="56" />
                <img src="/images/com_logo/fedEx.png" width="56" height="56" />
                <img src="/images/com_logo/gm.png" width="69" height="56" />
                <img src="/images/com_logo/hcl.png" width="56" height="56" />
                <img src="/images/com_logo/hsbc.png" width="90" height="56" />
                <img src="/images/com_logo/jet-airways.png" width="82" height="56" />
                <img src="/images/com_logo/microsoft.png" width="106" height="56" />
                <img src="/images/com_logo/paypal.png" width="112" height="42" />
                <img src="/images/com_logo/motoraola.png" width="70" height="56" />
                <img src="/images/com_logo/us-navy.png" width="78" height="56" />
                <img src="/images/com_logo/rbs.png" width="56" height="56" />
                <img src="/images/com_logo/tesco.png" width="92" height="56" />
</a>              </marquee>
    
    </td></tr>
    <tr><td><br /><p>To sign-up for a scheduled corporate class and/or to take advantage of corporate discounts for your company, please submit enrolment details and our corporate account representative will contact you at the earliest.</p></td></tr>
    </table>
    <%End If%>
	</table></td>
          </tr>
                </tr>
           
           
             <!--   <tr>
                  <td width="65%" id="imageHover"><a href="/freeresources/chapterTest.asp"><img src="/images/buttons/free-chapter-test.jpg"  height="97" border="0"></a></td>
                </tr>
                <tr>
                  <td width="65%" id="imageHover"><a href="/freeresources/freeSimulatedTest.asp"><img src="/images/buttons/free-simulated.jpg"   height="97" border="0"></a>                  </td>
                </tr>-->
                <!-- <tr>
                 <td width="65%" id="imageHover"><a href="/freeresources/chapterTest.asp"><img src="/images/buttons/PROJstudy-blend.jpg"   height="44px" border="0"></a><br />
                 <a href="/enrol.asp">Foundation + Practitioner - &#163; 699</a>
                 </td>
				 
                </tr>-->
              </table></td>
 
              </table>
          </tr>
      </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->

