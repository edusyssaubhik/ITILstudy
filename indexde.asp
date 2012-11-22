
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
<!--#include virtual="/includes/headermetaGerman.asp"-->
<!--#include virtual="/includes/indexbannerGerman.html"-->
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
				  <table>   
		<tr>
                 <td id="imageHover"><img border="0" src="/images/buttons/percent98-US.png"/></td>
				   <td><br/>
                 Die Erfolgsquote unserer Präsenzseminare beträgt 99.2%<br/>
                    <br/></td>
                </tr>
</table>
				 </td></tr>
				 <tr>
                 <td>
					<iframe width="200" height="150" src="http://www.youtube.com/embed/rdnUsT2MmEA" frameborder="0" allowfullscreen></iframe>
                 </td>
                 </tr>                 
				 <tr>
                        <td width="60%">
						<iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fitilstudy&amp;width=292&amp;height=62&amp;colorscheme=light&amp;show_faces=false&amp;border_color&amp;stream=false&amp;header=false" scrolling="no" frameborder="0" style="border:1px solid #94A3C4; overflow:hidden; width:205px; height:62px;" allowTransparency="true"></iframe><br /><br />
						
				  
                      
                          Vorteile Präsenztraining
                          
                          <ol type="1">
						   <li>ITILstudy ist besser als andere ITIL Trainingsanbieter. <a href="/german/besser-als-die-Konkurrenz.asp">Mehr</a></li>
						   
                           
						   
						   <li>2 Tage ITIL Training inklusive ITIL Foundation Prüfung und 100% Geldzurückgarantie <a href="/german/Geld-zurück-Garantie.asp">Mehr</a></li>
                           <li>2 Tage Training mit "Accelerated Learning" Techniken (Form des beschleunigten Lernens). <a href="/german/2-Tage-ITIL-Training.asp">Mehr</a></li>
                           <li>Zugelassen von den zwei führenden ITIL Prüfungsinstitutionen - APMG und CSME. <a href="/german/aboutCSME-APMG.asp">Mehr</a></li>
                           <li>Mehrere gut zu erreichende Seminarorte für Ihr ITIL Training stehen  zur Auswahl. <a href="/german/ITIL-Kurs.asp">Mehr</a></li>
                           <li>Umfassende ITIL Kurse mit bewährten Trainingsmethoden. <a href="/german/umfassend.asp">Mehr</a></li>
                           <li>Hervorragende Trainer für ITIL Zertifizierungskurse. <a href="/german/Trainer.asp">Mehr</a></li>
                           <li>Kostenfreie Risk Management -Zertifizierung und 20 PMI PDUs im Wert von $ 300 <a href=""></a></li>
                          <!--  <li>Kostenfreie Six Sigma Green Belt Zertifizierung und 25 PMI PDUs im Wert von $ 250.<br /> oder<br />Human Resource Development Zertifizierung und 20 PMI PDUs im Wert von  $ 250. <a href="/german/kostenfreie-online-Zertifizierung.asp">Mehr</a>
							</li>-->
							
                          
                           <li>18 von PMI anerkannte PDUs mit unseren ITIL Kursen. <a href="/german/PMI_PDU.asp">Mehr</a></li>
                          </ol>    
                          
                          Vorteile der Online kurse
                           
						  <ol type="1">
                          <li>Attraktive Preise und effektive Kurse. </li>
                          <li>Umfassende Tests pro Kapitel. </li>
                          <li>Detaillierte Handbücher. </li>
                          <li>Kostenloser ITIL Foundation Simulated Test.</li>
                         
						</ol>
						  
						
						     </td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
			  
            <td width="27%" rowspan="3" valign="top" background="/images/back/left_line.jpg" class="general-body" >
		
			 
			  <p id="imageHover"><a href="/german/ITIL-Kurs.asp"> <img src="/images/German/Basic.png" alt="courses" height="44px" border="0" ></a>
			  <br /> 
               
                 <a href="/german/ITIL-Kurs.asp">Seminare ab € 890</a><br /> (Preise inklusive Prüfungsgebühr sowie 100% Geldzurückgarantie)
			    
              
               
              </p>
			  
			   <span class="SubHeader">
          
          Wählen Sie eine der folgenden Städten:
		  </span> <BR />
          <BR />
              <%

			Set Rs = Server.CreateObject("ADODB.Recordset")
			todayDate = now()

                   strQuery = "SELECT Top 4 city,startdate,status,afterEBdiscountwithouttax, afterEBdiscountwithtax,applicabledays,pricewithtax, pricewithouttax FROM ITIL_course WHERE country='Germany' AND status <> 'Cancelled' AND startdate >= '" & todayDate & "' ORDER BY startdate ASC"
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
              <a href="/german/ITIL-Kurs.asp">
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
              <span class="SubHeader"><a href="/german/ITIL-Kurs.asp"> ITILstudy Kurse werden in mehr als 10 Städten in Deutschland angeboten</a>.</span><br /><br />
              
         
         Bestehen Sie die ITIL Foundation Zertifizierungsprüfung schon am 2. Tag des Präsenztrainings. <a href="/german/Kursvorteile.asp">Mehr</a><br /><br />
          
          100% Geldzurückgarantie – die Beste der Branche
			  
              </p> 
			
			                    <p id="imageHover"><a href="/german/Präsenztraining-FAQ.asp"><img src="/images/buttons/Faq.jpg" height="97" border="0"></a></p>


			               </td>
						   
						    <%' If Session("CountryOrigin") = "Other" OR Session("CountryOrigin")="United Kingdom" Then %>
				   <td width="21%" rowspan="3" valign="top" background="/images/back/left_line.jpg" class="general-body" >		
					
						   
              <!--ITIL Online Course -->
              	
                  <p id="imageHover"><a href="/ITIL-Online-Courses.asp"><img src="/images/German/edu.png"  height="44px" border="0"></a></span>
                    <br />(Preise inklusive MwSt)<br /><br />
                      <a href="/ITIL-Online-Courses.asp">ITIL Foundation für 30 Tage - $ 300 </a><br />
					
 					<br /></p>
					
					<!--Blend Course -->
					
					<p id="imageHover"><a href="/ITIL-Online-Courses.asp"><img src="/images/German/Blend.png"  height="44px" border="0"></a></span>
                    <br />(Preise inklusive MwSt.)<br /><br />
					<a href="/ITIL-Online-Courses.asp">ITIL Blended Kurs - $ 450 </a>
					<br /><br /></p>
				



<table>
<tr>					
					<td id="imageHover"><img border="0" src="/images/buttons/New.jpg"/></td>
                  <td><br />
                  Basierend auf dem 2011 Lehrplan, zugelassen durch APMG <br/>
                    <br/></td></tr></table>

                  <!-- <td width="20%" id="imageHover"><a href="/ITIL-Online-Courses.asp"><img src="/images/buttons/Blended.jpg" width="168px " height="44px" border="0"></a>
                    <br />(Prices are inclusive of all taxes)<br /><br /></td></tr> -->
               
   

              </td>

			 <% 'End if %> 
                <td width="26%" rowspan="3" background="/images/back/left_line.jpg" class="general-body"> 
			<table width="100%" border="0" cellspacing="0" cellpadding="2">
    
<tr><td valign="top"><a href="http://www.projstudy.com" target="_blank"><img src="/images/buttons/PROJ.jpg" border="0" align="left" /></a></td>
<td width="80%" valign="top" ><a href="http://www.projstudy.com" target="_blank">PROJstudy.com</a><br />Ein führender Trainingsanbieter für PRINCE2.</td></tr>
<tr><td>&nbsp;</td></tr>

	<tr>
	<td valign="top"><a href="http://www.pmstudy.com" target="_blank"><img src="/images/buttons/PM.jpg" border="0" align="left"/> </a></td>
	
	<td width="80%" valign="top" ><a href="http://www.pmstudy.com" target="_blank">PMstudy.com</a><br />Ein führendes Unternehmen im Bereich PMP/CAPM Prüfungsvorbereitungs<br />trainings.</td></tr>
	<tr><td>&nbsp;</td></tr>
    
<tr><td valign="top" ><a href="http://www.6sigmastudy.com" target="_blank"><img src="/images/buttons/6sigma.jpg" border="0" align="left" /></a></td>

<td width="80%" valign="top" ><a href="http://www.6sigmastudy.com" target="_blank">6sigmastudy.com</a><br /> Die bevorzugte Trainingsorganisation für Six Sigma</td></tr>
<tr><td>&nbsp;</td></tr>


	
	<tr><td valign="top"><a href="http://www.progstudy.com" target="_blank"><img src="/images/buttons/PROG.jpg" border="0" align="left" /></a></td>
	
	<td width="80%" valign="top" ><a href="http://www.progstudy.com" target="_blank">PROGstudy.com</a><br />Bietet "günstige und effektive" PGMP Kurse</td></tr>
	         
<tr><td>&nbsp;</td></tr>
	<tr>	
<td colspan="2">Weitere Kurse finden Sie  <a href="/german/Partner.asp" >hier</a></td>
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
<!--#include virtual="/includes/footer-German.html"-->

