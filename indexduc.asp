<!--#include virtual="/metatags/index_metatag.html"-->
<%
If Request.Form("countryName") <> "" Then
	Session("CountryOrigin") = Request.Form("countryName")
Else
	Session("CountryOrigin") = Session("CountryOrigin")
End If 

%>
<link rel="stylesheet" type="text/css" href="/css/styleBanner.css">
<!--#include virtual="/includes/headermetaDutch.asp"-->
<!--#include virtual="/includes/indexbannerDutch.asp"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<script type="text/javascript">
    isjQueryLoaded = 0
    $(document).ready(function () {
        $('#i1').fadeIn(300)
        isjQueryLoaded = 1;
    });
    function changeSlide(a, b) {

    }
</script>
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
            <td width="24%" class="Header"><img src="/images/German/Why-ITIL-ger.jpg" alt="Services" ></td>
			 <td width="27%" class="Header"><img src="/images/German/CLASSROOM_COURSES.jpg" alt="Services" /></td>
            <td width="21%" class="Header"><img src="/images/German/TOP_ONLINE_COURSES.jpg" alt="Services" ></td>
           <td width="26%" class="Header"><img src="/images/German/Partners.jpg" alt="Services" ></td>
          </tr>
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="24%" class="general-body"><table border="0" cellpadding="0" cellspacing="0">
               <tr>
                  <td colspan="2"><table border="0" cellpadding="4" cellspacing="0">
				  <tr>
				  <td>
				  <a style="padding-left:-20px;" href="/dutch/qualityPromise-nl.asp">
<img border="0" src="/images/buttons/QP.png">
</a>
				 </td></tr>
				 <tr>
                 <td>
					<iframe width="200" height="150" src="http://www.youtube.com/embed/rdnUsT2MmEA" frameborder="0" allowfullscreen></iframe>
                 </td>
                 </tr>                 
				 <tr>
                        <td width="60%">
						<iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fitilstudy&amp;width=292&amp;height=62&amp;colorscheme=light&amp;show_faces=false&amp;border_color&amp;stream=false&amp;header=false" scrolling="no" frameborder="0" style="border:1px solid #94A3C4; overflow:hidden; width:205px; height:62px;" allowTransparency="true"></iframe><br /><br />
						
				  
                      
                          Voordelen van klassikaal
                          
                          <ol type="1">
						   <li>ITILstudy is beter dan andere aanbieders van ITIL opleidingen <a href="/Dutch/better-than-competitors-nl.asp">Meer</a></li>
<li>2-daagse ITIL opleiding, inclusief ITIL Foundation examen en 100% niet-goed-geld-terug-garantie. <a href="/Dutch/moneyBack-nl.asp">Meer</a></li>
<li>2-daagse opleiding met technieken voor versneld leren. <a href="/Dutch/2-Day-ITIL-Training-nl.asp">Meer</a></li>
<li>Goedgekeurd door 2 vooraanstaande ITIL onderzoeksinstellingen - APMG en CSME. <a href="/Dutch/aboutCSME-APMG-nl.asp">Meer</a></li>
<li>Verschillende praktische locaties voor ITIL opleidingen. <a href="/Dutch/ITIL-Courses-nl.asp">Meer</a></li>
<li>Allesomvattende ITIL opleidingen met wereldwijd bewezen trainingsmethodologie. <a href="/Dutch/comprehensive-nl.asp">Meer</a></li>
<li>De beste faculteit voor ITIL certificatie-opleidingen. <a href="/Dutch/instructors-nl.asp">Meer</a></li>
<li>Gratis 18 door PMI goedgekeurde PDU's bij onze ITIL opleidingen. <a href="/Dutch/PMI_PDU-nl.asp">Meer</a></li>
                          </ol>    
                          
                         Voordelen van online opleidingen
                           
						  <ol type="1">
                          <li>De best geprijsde en effectieve opleidingen.</li>
<li>Allesomvattende toetsen per hoofdstuk.</li>
<li>Gedetailleerde studiegidsen.</li>
<li>Gratis ITIL Foundation proeftoets</li>
                         
						</ol>
						  
						
						     </td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
			  
            <td width="27%" rowspan="3" valign="top" background="/images/back/left_line.jpg" class="general-body" >
		
			 
			  <p id="imageHover"><a href="/Dutch/ITIL-Courses-nl.asp"> <img src="/images/German/Basic.png" alt="courses" height="44px" border="0" ></a>
			  <br /> 
               
                 <a href="/Dutch/ITIL-Courses-nl.asp">Opleidingen vanaf € 950 met aantrekkelijke groepskortingen</a><br /> (de prijzen zijn inclusief examenkosten en 100% niet-goed-geld-terug-garantie)
			    
              
               
              </p>
			  
			   <span class="SubHeader">
          
          Kies één van de volgende steden: 
		  </span> <BR />
          <BR />
              <%

			Set Rs = Server.CreateObject("ADODB.Recordset")
			todayDate = now()

                   strQuery = "SELECT Top 4 city,startdate,status,afterEBdiscountwithouttax, afterEBdiscountwithtax,applicabledays,pricewithtax, pricewithouttax FROM ITIL_course WHERE country='Netherlands' AND status <> 'Cancelled' AND startdate >= '" & todayDate & "' ORDER BY startdate ASC"
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
              <a href="/Dutch/ITIL-Courses-nl.asp">
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
       
              <BR>
              <span class="SubHeader"><a href="/Dutch/ITIL-Courses-nl.asp"> Meer opleidingen in Nederland bekijken...</a>.</span><br /><br />
              
         
        
			  
              </p> 
			
			                    <p id="imageHover"></p>


			               </td>
						   
						    <%' If Session("CountryOrigin") = "Other" OR Session("CountryOrigin")="United Kingdom" Then %>
				   <td width="21%" rowspan="3" valign="top" background="/images/back/left_line.jpg" class="general-body" >		
					
						   
              <!--ITIL Online Course -->
              	
                  <p id="imageHover"><a href="/ITIL-Online-Courses.asp"><img src="/images/buttons/edu.png"  height="44px" border="0"></a></span>
                    <br />(Prijzen zijn inclusief belasting)<br /><br />
                      <a href="/Dutch/ITIL-Online-Courses-nl.asp">ITIL Foundation opleiding - $ 300</a><br />
					<a href="/Dutch/ITIL-Online-Courses-nl.asp">Intermediate OSA opleiding - $ 665 </a><br />
                      <a href="/Dutch/ITIL-Online-Courses-nl.asp">Intermediate CSI opleiding - $ 665 </a><br />
 					<br /></p>
					
					<!--Blend Course -->
					
					<p id="imageHover"><a href="/ITIL-Online-Courses.asp"><img src="/images/buttons/Blended.png"  height="44px" border="0"></a></span>
                    <br />(Prijzen zijn inclusief belasting)<br /><br />
					<a href="/Dutch/ITIL-Online-Courses-nl.asp">ITIL gemengde opleiding - $ 450 </a>
					<br /><br /></p>
				



<a href="/dutch//knowYourCertificate-nl.asp">
<img src="/images/buttons/KYC.png">
</a>

<table>
<tbody>
<tr>
<td id="Td2">
<img border="0" src="/images/buttons/New.jpg">
</td>
<td>
<br>

Op basis van de syllabus uit 2011, goedgekeurd door APMG

</td>
</tr>
</tbody>
</table>
                      <br /> <a href="/Dutch/classroom-FAQ-nl.asp">
<img height="83px" border="0" src="/images/buttons/Faq.jpg">
</a>
                  <!-- <td width="20%" id="imageHover"><a href="/ITIL-Online-Courses.asp"><img src="/images/buttons/Blended.jpg" width="168px " height="44px" border="0"></a>
                    <br />(Prices are inclusive of all taxes)<br /><br /></td></tr> -->
               
   

              </td>

			 <% 'End if %> 
                <td width="26%" rowspan="3" background="/images/back/left_line.jpg" class="general-body"> 
			<table width="100%" border="0" cellspacing="0" cellpadding="2">
    
<tr><td valign="top"><a href="http://www.SCRUMstudy.com" target="_blank"><img src="/images/buttons/scrum.jpg" border="0" align="left" /></a></td>
<td width="80%" valign="top" ><a href="http://www.SCRUMstudy.com" target="_blank">SCRUMstudy.com</a><br />Een vermaarde aanbieder van opleidingen voor Scrum en Agile certificatie</td></tr>
<tr><td>&nbsp;</td></tr>

	<tr>
	<td valign="top"><a href="http://www.pmstudy.com" target="_blank"><img src="/images/buttons/PM.jpg" border="0" align="left"/> </a></td>
	
	<td width="80%" valign="top" ><a href="http://www.pmstudy.com" target="_blank">PMstudy.com</a><br />Een vooraanstaande organisatie voor de voorbereiding op PMP<sup>&reg;</sup> / CAPM<sup>&reg;</sup> examens</td></tr>
	<tr><td>&nbsp;</td></tr>
    
<tr><td valign="top" ><a href="http://www.6sigmastudy.com" target="_blank"><img src="/images/buttons/6sigma.jpg" border="0" align="left" /></a></td>

<td width="80%" valign="top" ><a href="http://www.6sigmastudy.com" target="_blank">6sigmastudy.com</a><br /> De aanbevolen Six Sigma opleidingsinstantie</td></tr>
<tr><td>&nbsp;</td></tr>


	
	<tr><td valign="top"><a href="http://www.progstudy.com" target="_blank"><img src="/images/buttons/PROG.jpg" border="0" align="left" /></a></td>
	
	<td width="80%" valign="top" ><a href="http://www.progstudy.com" target="_blank">PROGstudy.com</a><br />Biedt "Betaalbare en effectieve" PGMP opleidingen aan</td></tr>
	         
<tr><td>&nbsp;</td></tr>
	<tr>	
<td colspan="2"><a href="/Dutch/Affiliates-nl.asp" >Klik hier</a> voor meer opleidingen van affiliates</td>
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
<!--#include virtual="/includes/footer-Dutch.html"-->

