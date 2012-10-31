
<script type="text/JavaScript">


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
%>
<!--#include virtual="/metatags/index_metatag.html"-->
<!--#include virtual="/includes/headermeta1.asp"-->
<!--#include virtual="/includes/indexbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
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
			<% If Session("CountryOrigin") = "Other" Then  %>
            <td width="22%" class="SubHeader"><img src="images/buttons/title_news.jpg" alt="Services" /> </td>
            <% Else %>
            <td width="26%" class="Header"><img src="/images/buttons/title_courses.jpg" alt="Services"></td>
			 <% End If %>
			   <% 'If Session("CountryOrigin") = "Other" OR Session("CountryOrigin")="United Kingdom" Then %>
            <td width="20%" class="Header"><img src="/images/buttons/title_courses-ol.jpg" alt="Services" ></td>
          
            <%' End If %>
            <!--<td width="26%" class="SubHeader"><img src="images/buttons/title_courses-ol.jpg" alt="Services" /> </td>--> 
           <td width="22%" class="Header"><img src="/images/buttons/Affiliates.jpg" alt="Services" ></td>
          
          </tr>
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="24%" class="general-body"><table border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="2"><table border="0" cellpadding="4" cellspacing="0">
				   <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India"  OR Session("CountryOrigin")="United Kingdom" OR Session("CountryOrigin") = "Australia"  Then %>
                      <tr>
                        <td width="60%">
                          Classroom Benefits
                          <ol type="1">
						   <li>ITILstudy is better than competitors. <a href="/ITIL-Training/better-than-competitors.asp">More</a></li>
                            <li>Comprehensive course with globally proven training methodology. <a href="/ITIL-Training/comprehensive.asp">More</a></li>
                           <li>Great success rate.</li>
						   <li>Most Economical and Most Effective.</li>
                            <li>Best faculty. <a href="/ITIL-Training/instructors.asp">More</a></li>
							<% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore"  then   %>
                            <li>Free Six Sigma Green Belt Certification and 25 PMI PDUs worth $ 250.<br />or<br />
							Human Resource Development Certification and 20 PMI PDUs worth <br />$ 250. <a href="ITIL-Training/free-onlinecertification.asp">More</a>
							</li>
                           <% ElseIf Session("CountryOrigin")="United Kingdom" OR Session("CountryOrigin") = "Australia" Then %>
                            <li>Free Six Sigma Green Belt Certification and 25 PMI PDUs worth &#163;175.<br />or<br />
							Human Resource Development Certification and 20 PMI PDUs worth <br />&#163;175. <a href="ITIL-Training/free-onlinecertification.asp">More</a>
							</li>
							 <% End If %>
							<% If Session("CountryOrigin") = "India" Then %>
                            <li>Best price. <a href="/ITIL-Courses.asp">More</a></li>
							<% ElseIf Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore"  OR Session("CountryOrigin")="United Kingdom" OR Session("CountryOrigin") = "Australia" Then %>
                            <li>100% Moneyback Guarantee. <a href="/ITIL-Training/moneyBack.asp">More</a></li>
							 <% End If %>
                            <li>Several convenient locations. <a href="/ITIL-Courses.asp">More</a></li>
                            <li>Free 18 PMI approved PDUs with our courses. <a href="/ITIL-Training/PMI_PDU.asp">More</a></li>
							
                          </ol>
                        
                          <% ElseIf Session("CountryOrigin") = "Other"  Then %>
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
						   <% End If %>                     
						     </td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
			  
            <td width="26%" rowspan="3" valign="top" background="/images/back/left_line.jpg" class="general-body" >
			
			
			 <% If Session("CountryOrigin") = "Other"  Then %>
           ITILstudy offers the best online courses (highest success rates) at the most economical prices for ITIL Foundation exam preparation.  <br /><br />View our ITILstudy classes in other countries.<br />
		    
              <table border="0" width="80%">
                <tr>
                  <td width="50%"><b>Select Country:</b></td>
                  <td height="30%" >
                    <form name="myform1" method="post">
              
                <select name="countryName" id="countryName" onChange="getCountry1();">
                  <option value="">-Select-</option>
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
               
			     
              </p>
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
			   -
              <% If (CDate(StartDate)-(Date()+ApplicableDays+1) >= 0) Then %>
              <% If Session("CountryOrigin") = "United Kingdom"  Then %>
              <% = "&#163; "&PriceUK %>
              <% ElseIf Session("CountryOrigin") = "India"  Then %>
              <% = "Rs. "&Price %>
			  <% ElseIf Session("CountryOrigin") = "Australia"  Then %>
              <% = Price &" AUD" %>
              <% ElseIf Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" Then %>
              <% = "$ "&Price %>
              <%End If %>
              <% Else %>
              <% If Session("CountryOrigin") = "United Kingdom"  Then %>
              <% = "&#163; "&PriceUK1 %>
              <% ElseIf Session("CountryOrigin") = "India"  Then %>
              <% = "Rs. "&Price1 %>
			  <% ElseIf Session("CountryOrigin") = "Australia"  Then %>
              <% = Price &" AUD" %>
              <% ElseIf Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" Then %>
               <% = "$ "&Price1 %>
              <%End If %>
              <%End If %>
			  
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
       
              <BR>
              <span align="right"><a href="/ITIL-Courses.asp">
              See more courses in <%=Session("CountryOrigin")%>...
              </a></span><br />
              <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" Then %>
			   (Prices are inclusive of exam fees & taxes)
              <% End If %>
              </p> 
			   <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin")="United Kingdom" OR Session("CountryOrigin") = "Australia" Then %>
			   <p class="general-body" style="margin-top:-0px;"><ul><li>Pass ITIL Foundation exam on the 2nd day of Classroom Training <a href="/ITIL-Training/courseBenefits.asp">More</a></li>
    <li>
        Moneyback Guarantee - Best in the industry <a href="/ITIL-Training/moneyBack.asp">More</a></li>
   </ul></p>
   <%End If%>
			                    <p id="imageHover"><a href="/ITIL-Training/classroom-FAQ.asp"><img src="/images/buttons/Faq.jpg" height="97" border="0"></a></p>

			   <% End If %>
			               </td>
						   
						    <%' If Session("CountryOrigin") = "Other" OR Session("CountryOrigin")="United Kingdom" Then %>
				   <td width="26%" rowspan="3" valign="top" background="/images/back/left_line.jpg" class="general-body" >		
					<table border="0" width="100%">
					<tr>	   
              
					<% If Session("CountryOrigin")="United Kingdom" Then %>
					  <td width="20%" id="imageHover"><a href="/ITIL-Online-Courses.asp"><img src="/images/buttons/edu.png"  height="44px" border="0"></a>
                   <br /><br />
					<a href="/ITIL-Online-Courses.asp">Foundation for 30 Days - <% = Currency_Format_Front %> 75 <% = Currency_Format_Back %></a><br />
                    <a href="/ITIL-Online-Courses.asp">Foundation for 60 Days - <% = Currency_Format_Front %> 150 <% = Currency_Format_Back %></a><br />
                    <a href="/ITIL-Online-Courses.asp">Foundation for 90 Days - <% = Currency_Format_Front %> 200 <% = Currency_Format_Back %> </a>
                    </a><br /><br /></td>
					  <% Else %>
                  <td width="20%" id="imageHover"><a href="/ITIL-Online-Courses.asp"><img src="/images/buttons/edu.png"  height="44px" border="0"></a>
                    <br />(Prices are inclusive of all taxes)<br /><br />
					<a href="/ITIL-Online-Courses.asp">Foundation for 30 Days - $ 100 </a><br />
                    <a href="/ITIL-Online-Courses.asp">Foundation for 60 Days - $ 175 </a><br />
                    <a href="/ITIL-Online-Courses.asp">Foundation for 90 Days - $ 225 </a>
                    </a><br /><br /></td>
					
					
					<% End If %>
					</tr>
					<tr>
					<% If Session("CountryOrigin")="United Kingdom" Then %>
					<td width="20%" id="imageHover"><a href="/ITIL-Online-Courses.asp"><img src="/images/buttons/Blended.png"  height="44px" border="0"></a>
                   <br /><br />
					<a href="/ITIL-Online-Courses.asp">ITIL Blended Course - <% = Currency_Format_Front %> 350 <% = Currency_Format_Back %></a><br />
					</td>
					 <% Else %>
					<td width="20%" id="imageHover"><a href="/ITIL-Online-Courses.asp"><img src="/images/buttons/Blended.png"  height="44px" border="0"></a>
                    <br />(Prices are inclusive of all taxes)<br /><br />
					<a href="/ITIL-Online-Courses.asp">ITIL Blended Course - $ 450 </a><br />
					</td>
					
					<% End If %>
					</tr>
                  <!-- <td width="20%" id="imageHover"><a href="/ITIL-Online-Courses.asp"><img src="/images/buttons/Blended.jpg" width="168px " height="44px" border="0"></a>
                    <br />(Prices are inclusive of all taxes)<br /><br /></td></tr> -->
               
   
              </table>
              </td>

			 <% 'End if %> 
            <td width="22%" rowspan="3" background="/images/back/left_line.jpg" class="general-body"> <table width="100%" border="0" cellspacing="6" cellpadding="4">
                
		<tr>	  
	<td width="25%" ><a href="/affiliates/pmstudy.asp" ><img src="/images/buttons/PM.jpg" border="0" align="left"/> </a></td>
	
	<td width="85%" valign="top" ><a href="/affiliates/pmstudy.asp" >PMstudy.com</a><br />A leading organization for  PMP<sup>&reg;</sup> / CAPM<sup>&reg;</sup> exam prep training  </td></tr>
    
<tr><td valign="top" ><a href="/affiliates/PROJstudy.asp" ><img src="/images/buttons/PROJ.jpg" border="0" align="left" /></a></td>
<td width="85%" valign="top" ><a href="/affiliates/PROJstudy.asp" >PROJstudy.com</a><br />A premier training provider for PRINCE2<sup>&reg;</sup></td></tr>

<tr><td valign="top" ><a href="/affiliates/6sigmastudy.asp" ><img src="/images/buttons/6sigma.jpg" border="0" align="left" /></a></td>

<td width="85%" valign="top" ><a href="/affiliates/6sigmastudy.asp" >6sigmastudy.com</a><br /> The preferred Six Sigma Training organization</td></tr>


	
	<tr><td valign="top"><a href="/affiliates/progstudy.asp" ><img src="/images/buttons/PROG.jpg" border="0" align="left" /></a></td>
	
	<td width="85%" valign="top" ><a href="/affiliates/progstudy.asp" >PROGstudy.com</a><br />Offers "Economical and Effective" PGMP Course<br></td></tr>
	         
 

	<tr>	
<td colspan="2">For more affiliate courses <a href="/affiliates.asp" >Click here</a></td>
	</tr>
	
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

