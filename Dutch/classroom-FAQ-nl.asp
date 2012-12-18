<!--#include virtual="/metatags/classroom-FAQ_metatag.html"-->
<!--#include virtual="/includes/headermetaDutch.asp"-->
<!--#include virtual="/includes/guaranteed-success-FAQ-banner.asp"-->
<!--#include virtual="/includes/connection.asp"-->
<link rel="stylesheet" type="text/css" href="/css/faq.css">

<!-- Body Starts -->
<%
'Declare The Local Variable'
Dim strCourseDetails
Dim objRsCourseDetails
Dim Price
Dim EBDiscount
Dim AfterEBDiscount
Dim Tax
Dim ApplicableDays

Set objRsCourseDetails = Server.CreateObject("ADODB.Recordset")

'Sql Query For Retrive Counry Prices and Applicable days'

strCourseDetails = "SELECT starttime,endtime,payments FROM itil_countrydetails WHERE country = '" & Session("CountryOrigin") & "'"

objRsCourseDetails.Open strCourseDetails,ConnObj

Do Until objRsCourseDetails.EOF

StartTime =  objRsCourseDetails("starttime")
EndTime	  =  objRsCourseDetails("endtime")
Payments  =  objRsCourseDetails("payments")

objRsCourseDetails.Movenext
Loop

objRsCourseDetails.Close

%>
<!-- Body Starts -->
<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="25%">&nbsp;</td>
            <td width="73%" class="breadcrumb">Home &raquo; WAAROM WIJ  &raquo;Klassikaal - Veelgestelde vragen</td>

          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu-Dutch.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
			 <h1 class="PageTitle">KLASSIKALE OPLEIDINGEN ITILSTUDY - VEELGESTELDE VRAGEN</h1>
              <!-- Content Start From Here-->
              <script language="javascript">
<!--
//function openit() {
//newWindow = window.open('emailus.asp', 'myWindow', 'toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=0,minimizable=0,resizable=0,width=500,height=315');
}
// -->
</script>
              <script src="/js/prototype.js" type="text/javascript"></script>
              <script src="/js/ricoCommon.js" type="text/javascript"></script>
              <script src="/js/ricoEffects.js" type="text/javascript"></script>
              <script src="/js/ricoAccordion.js" type="text/javascript"></script>
              <script type="text/JavaScript" language="JavaScript">
				function faqAccordionInit(elementId){
				
					var accordion_options={
						panelHeight: "auto",
						tabLocation: "inline",
						mode: "free",
						onLoadShowTab: -1,
						collapsedTextColor: "#333",
						expandedTextColor: "#333",
						transitionColor: "#CCCCCC",
						duration: 50
					};
				   
					new Rico.Accordion($(elementId),accordion_options);
				  }

			</script>
              <div id="outerFormContainer">
              <div id="mainContent" class="faqGroup">
                <p class="Header">Over ITIL<sup>&reg;</sup>: </p>
                <div style="border-bottom: 1px solid rgb(107, 121, 165);" id="faqContainer1" class="panel">
                  <div id="faqPanel1_1">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_1" class="collapsed">
                      <h3>Wat is ITIL?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_1" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>ITIL (IT Infrastructure Library<sup>&reg;</sup>) is de meest alom aangenomen structuur voor IT Servicemanagement ter wereld. Het is een praktische aanpak voor de identificatie, planning, levering en ondersteuning van IT aan bedrijven. Het beschrijft hoe IT-middelen georganiseerd moeten worden om tot zakelijke meerwaarde te komen, waarbij de processen, functies en rollen van IT Servicemanagement (ITSM) worden gedocumenteerd.</p>
                            <p>ITIL principes worden door een groot aantal organisaties in zowel de openbare als privésector gebruikt, zoals NASA, IBM, HP, British Telecom, HSBC bank, L'Oreal en vele anderen.</p>
							<p>ITIL is opgezet door en in het eigendom van het Office of Government Commerce (OCG), de ITIL beste praktijken worden uiteengezet in vijf begeleidende kernpublicaties die de fundamentele ITIL principes uiteenzetten, welke gericht zijn op gebieden binnen de discipline Service Management.</p>
                            <p>De ITIL beste praktijken verstevigen daarnaast de funderingen van ISO/IEC 20000 (voorheen BS15000), de internationale maatstaf op het gebied van servicemanagement voor organisatorische certificering en volgzaamheid.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel1_2">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>Welke certificeringen zijn beschikbaar onder het ITIL kwalificatieprogramma?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                          
                            <p class="btext">De volgende certificeringen zijn beschikbaar onder het ITIL kwalificatieprogramma:</p>
                            <ul class="btext">
                              <li>ITIL Foundation </li>
                              <ol type="i">
                                <li>Het ITIL Foundation certificaat in IT Servicemanagement vormt het startexamen van het programma. Er zijn geen eerste vereisten voor deelname aan dit examen.</li>
                              </ol>
                            </ul>
                            <ul>
                              <li>ITIL Intermediate</li>
                              <ol type="i">
                                <li>ITIL Intermediate vormt de kern van het programma. Om een examen op dit niveau af te leggen, dienen kandidaten reeds de ITIL Foundation kwalificatie in het bezit te hebben en een geaccrediteerde opleiding te hebben voltooid.</li>
                                <li>De volgende examens zijn beschikbaar op het Intermediate niveau: <br />
Service Lifecycle - examens gericht op management, waaronder<br />
Service Strategy, Service Design, Service Transition, Service Operation en Continual Service Improvement.<br />
Service Capability - examens gericht op processen, waaronder Planning Protection and Optimization, Release Control and Validation, Operational Support and Analysis en Service Offerings and Agreements


</li>
                              </ol>
                            </ul>
							
							 <ul>
                              <li>ITIL Managing Across the Lifecycle (MALC) </li>
                              <ol type="i">
                                <li>Dit vormt het topexamen van het programma. Kandidaten die een aantal ITIL certificaten hebben behaald, komen in aanmerking om deze opleiding te volgen en dit certificaat te behalen en komen na een succesvolle afronding in aanmerking voor de ITIL Expert Level Award.

</li>
                                <li>Zie voor de volledige informatie met betrekking tot de kwalificaties die behaald kunnen worden met het programma: 
<a href="http://www.itil-officialsite.com/Qualifications/ITILQualificationScheme.aspx" target="_blank">www.itil-officialsite.com/Qualifications/ITILQualificationScheme.aspx</a>

</li>
                              </ol>
                            </ul>
                           
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel1_3">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>Hoe werkt ITIL voor mijn organisatie?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
						  <p>De IT Infrastructure Library (ITIL) is een universeel geaccepteerde aanpak van het management en de levering van IT services. Organisaties implementeren de ITIL beste praktijken ter verbetering van de service, verhoging van de productiviteit, een beter beheer van IT-kosten en de ontwikkeling van een beter begrip van activiteiten binnen de afdeling IT.</p>
                            <p>Hieronder volgen de voordelen van ITIL: </p>
                            <ul>
                              <li>Het biedt één enkele, gedocumenteerde structuur voor de beste praktijk in IT die als rode draad binnen de organisatie van IT heen loopt.</li>
<li>Het drukt de kosten voor IT en verantwoordt de kosten voor de kwaliteit van IT en ondersteunt een verbeterde productiviteit van gebruikers.</li>
<li>Het ondersteunt de mogelijkheid van IT om de interne prestaties en dienstverlening te meten en te verbeteren.</li>
<li>Het verbetert de communicatie- en informatiestromen tussen IT en organisatorische afdelingen van bedrijven en identificeert de rollen en verantwoordelijkheden voor IT Servicemanagement.</li>
<li>Het verbetert de aanpasbaarheid van IT naarmate zich bedrijfsmogelijkheden en uitdagingen voordoen.</li>
<li>Het verbetert de relatie met IT binnen het bedrijf en versterkt het vertrouwen.</li>
                            </ul>
                           
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel1_4">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>Mag ik het ITIL<sup>&reg;</sup> logo gebruiken?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Het ITIL logo is de beste praktijk draai, gevolgd door het woord ITIL<sup>&reg</sup>. Dit specifieke logo mag alleen worden gebruikt door OGC, TSO en APM Group - de accrediteur.</p>
							<p>Indien u het logo om wat voor reden dan ook wenst te gebruiken, dient u daar voorafgaand toestemming van OGC voor te verkrijgen. Neem contact op met OGC via: <a href="mailto:ServiceDesk@ogc.gsi.gov.uk">ServiceDesk@ogc.gsi.gov.uk</a></p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                 
                         
                <script type="text/JavaScript" language="JavaScript">
	//start this accordion
	faqAccordionInit("faqContainer1");
	</script>
                <p class="Header">Over ITILstudy</p>
                <div style="border-bottom: 1px solid rgb(107, 121, 165);" id="faqContainer2" class="panel">
                 
                  <div id="faqPanel2_2">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>Hoe schrijf ik me via ITILstudy.com in voor de klassikale ITIL opleiding?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                         
                            <p>U kunt zich in drie stappen inschrijven voor de klassikale ITILstudy opleidingen:</p>
                            <ul style="list-style-type: square">
                              <li>	Stap 1: Schrijf u in door inschrijvingsinformatie in te voeren (dit duurt ongeveer 3 minuten).</li>
<li>Stap 2: Voldoe binnen 5 dagen na registratie de betaling voor de opleiding.</li>
<li>Stap 3: ITILstudy zal uw deelname bevestigen zodra de betaling is ontvangen.</li>
                            </ul>
							<p><a href="/Dutch/enrollClass-nl.asp">Klik hier</a> om u in te schrijven bij ITILstudy of voor informatie met betrekking tot inschrijvingen..</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>

                  <div id="faqPanel2_4">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>Wat wordt er tijdens het ITILstudy lesprogramma onderwezen?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                         
<UL>
<LI>De inhoud van de klassikale ITILstudy opleiding heeft betrekking op doelen, doelstellingen, werkingssfeer en basisconcepten van primaire ITIL processen en functies, evenals andere onderdelen van ITIL Foundation als gevonden in de syllabus. Met een nadruk op levensechte voorbeelden die specifiek zijn toegespitst op de industrie, is de 2-daagse klassikale opleiding zo ontworpen dat een student bij een eerste poging het ITIL examen kan behalen. <a href="/Dutch/classroomTraining-nl.asp">Klik hier</a> voor meer gegevens.</LI>
<li><a href="/Dutch/ITIL-Courses-nl.asp">Klik hier</a> voor gegevens met betrekking tot het lesprogramma op verschillende locaties.
</LI>

</UL>


					
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel2_5">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>Wie geeft de opleiding?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Al onze docenten zijn APMG-geaccrediteerd en worden gekozen uit de allerbeste docenten in de industrie. Al onze docenten hebben met succes een nauwgezet en streng selectieproces doorlopen als uiteengezet door APM Group UK. Zij bezitten de benodigde kennis en expertise om ervoor te zorgen dat studenten de concepten goed begrijpen en worden verrijkt met geschikte lesstof. <a href="/Dutch/instructors-nl.asp">Meer</a>
                              </p>
							  
							   
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel2_601">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3> Wat gebeurt er als ITILstudy een les annuleert?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Wij hanteren de beste annuleringsvoorwaarden in de industrie, waardoor lessen probleemloos kunnen worden verzet of terugbetaald. <a href="/Dutch/termsAndConditions.asp" target=_blank>Klik hier</a> voor meer informatie.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel2_6">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>Hoe groot zijn de klassen doorgaans?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Het aantal deelnemers varieert, maar we hanteren een maximale klassengrootte van 15 personen.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>

                  <div id="faqPanel2_19">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>Welke methodologie hanteert ITILstudy voor het geven van klassikale ITIL Foundation opleidingen?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Klik hieronder op <a href="/Dutch/classroomTraining-nl.asp">Klassikale ITIL Foundation opleiding</a> om meer te weten te komen over onze klassikale opleidingsmethodologie.
</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>


                  <div id="faqPanel2_7">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>Wat zijn de kosten voor de klassikale ITILstudy lessen?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p><a href="/Dutch/ITIL-Courses-nl.asp">Klik hier</a> voor gegevens omtrent de kosten voor klassikale ITILstudy opleidingen.</p>
                            
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
				  
                  <div id="faqPanel2_8">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>Wat betekent v3 in ITIL "v3" Foundation?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>V3 staat voor Versie 3. APMG heeft onlangs het gebruik van v3 en/of v3 voor ITIL opleidingen gestaakt zodat een ITIL opleiding zonder versienummering kan worden gevolgd.</p>
                            
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                 
                  <div id="faqPanel2_9">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>Is de ITIL Foundation opleiding door ITILstudy gebaseerd op de ITIL v3 Foundation syllabus?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Ja, deze is gebaseerd op de ITIL v3 syllabus en is bijgewerkt volgens de ITIL 2011 vernieuwing.</p>
                            
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
				  
                  <div id="faqPanel2_11">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>Hoe genereer ik 18 door PMI goedgekeurde PDU's uit mijn klassikale ITIL Foundation lesprogramma en verzend ik die naar PMI?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>U kunt de 18 PDU's downloaden van de online voorbereidende opleiding, welke gekoppeld is aan de klassikale opleiding. De link om PDU's te downloaden wordt aan het einde van de eerste dag van het klassikale lesprogramma actief en blijft gedurende 7 dagen na het einde van de tweede dag van het lesprogramma actief. <br/><br/>
Tijdens het verzenden van de PDU's naar PMI gebruikt u de volgende informatie:<br /><br/>
<b>Naam aanbieder:</b> VMedu, Inc. <br/>
<b>Nummer aanbieder:</b> 2053 <br/>
<b>Activiteitsnummer:</b> ITILSTUD <br/>
<b>Naam activiteit:</b> ITIL opleiding <br/>
<b>Type aanbieder:</b> R.E.P. <br/>




</p>
                            
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                                  
                              
                  
                  
                  
                <script type="text/JavaScript" language="JavaScript">
	//start this accordion
	faqAccordionInit("faqContainer2");
	</script>
	
	            <p class="Header">Over het ITIL Foundation examen</p>
                <div style="border-bottom: 1px solid rgb(107, 121, 165);" id="faqContainer3" class="panel">
                  <div id="faqPanel3_1">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_1" class="collapsed">
                      <h3>Gaan er bepaalde voorwaarden (geschiktheidscriteria) gepaard met het afleggen van het ITIL Foundation examen?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel3_1" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Er zijn bepaalde voorwaarden/geschiktheidscriteria aanwezig voor het afleggen van het ITIL Foundation examen. Een algemeen begrip van IT is echter wel gewenst.</p>
                          
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>

				       <div id="faqPanel3_11">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_2" class="collapsed">
                      <h3>Wanneer krijg ik toegang tot het online lesmateriaal?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>ITILstudy probeert ervoor te zorgen dat studenten voor de klassikale lessen reeds vertrouwd zijn met de ITIL Foundation concepten en terminologie. Om hiervoor te zorgen, biedt ITILstudy toegang tot een online voorbereidende opleiding zodra de benodigde betaling is ontvangen.
 
</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>

                  <div id="faqPanel3_2">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_3" class="collapsed">
                      <h3>In welke vorm wordt het ITIL Foundation examen afgenomen?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                          
                            <p class="btext">De soorten vragen voor het ITIL Foundation examen zijn niet veranderd, maar de samenstelling is wel veranderd als hieronder aangegeven:</p>
                            <ul class="btext">
                              <li>40 Meerkeuzevragen per bladzijde.</li>
                                <li>Tijdspanne van één uur.</li>
                                <li>Voor elke vraag krijgt men een punt.</li>
                                <li>Geen aftrekpunten voor onjuiste antwoorden.</li>
                                <li>Het slagingspercentage ligt op 65%, m.a.w. 26 vragen goed van de 40. </li>
                            </ul>
							<p>U kunt de ITIL Foundation opleiding succesvol afronden door u in te schrijven voor ITILstudy's klassikale ITIL Foundation opleiding.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel3_3">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_4" class="collapsed">
                      <h3>Wat is de syllabus voor de ITIL Foundation opleiding?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
						  <p><a href="/Dutch/classroomTraining-nl.asp">Klik hier</a> voor gegevens omtrent de syllabus van de ITIL Foundation opleiding.</p>
                          
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel3_4">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_5" class="collapsed">
                      <h3>Welke voorbereiding is nodig voor de klassikale ITILstudy opleiding?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                         <p>ITILstudy voorziet haar studenten van een voorbereidingsprogramma. Aangeraden wordt om dit programma te voltooien vooraleer een klassikale opleiding voor het ITIL Foundation examen te volgen. De toegang tot deze opleiding wordt vrijgegeven zodra wij de betaling voor de klassikale opleiding hebben ontvangen.

</p>

                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
				   <div id="faqPanel3_5">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_5" class="collapsed">
                      <h3>Waar kan ik het examen doen?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>De examens worden afgenomen in één van de centra van ITILstudy of eventuele andere geaccrediteerde opleidingsinstanties. Examens kunnen daarnaast ook worden afgenomen in één van de door APMG erkende Pro-metric centra. De examens in open centra worden alleen op bepaalde dagen en bepaalde plaatsen afgenomen. Aangeraden wordt om 4-6 weken van tevoren het examen in een Pro-metric centrum te reserveren. Neem contact met ons op via <a href="mailto:marketing@ITILstudy.com">marketing@ITILstudy.com</a> om examen te doen bij ITILstudy.
                                
                                <br /><br />U kunt ons telefonisch bereiken op: +44 (0) 1494 458 948 om het examen te regelen, een e-mail sturen <br /> naar <a href="mailto:servicedesk@apmgroupltd.com">servicedesk@apmgroupltd.com</a> of de website <a href="http://www.itil-officialsite.com">www.itil-officialsite.com</a> bezoeken

</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel3_6">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_6" class="collapsed">
                      <h3>Wanneer kan ik de eerste resultaten van mijn ITIL Foundation examens verwachten?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>De resultaten van het ITIL Foundation examen zullen binnen één week na deelname aan het examen bekend worden gemaakt. Indien u uw examen bij ons heeft gedaan, dan zullen uw resultaten binnen 5 dagen direct naar ons toe worden gestuurd door het desbetreffende internationale APMG kantoor. Nadat we de resultaten hebben ontvangen van APMG zullen we u binnen 24 uur informeren over uw resultaten.

</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
				  
				    <div id="faqPanel3_7">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_7" class="collapsed">
                      <h3>Wanneer ontvang ik mijn ITIL Foundation certificaat?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Indien de student het ITIL Foundation examen bij ons heeft behaald, zullen de certificaten direct naar u toe worden gestuurd zodra we deze van APMG hebben ontvangen. Dit gehele proces duurt ongeveer 3 weken. Houd er rekening mee dat de certificaten naar ATO's zullen worden gestuurd indien u uw examen heeft gedaan via een ATO. Neem contact met ons op via  <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com</a> indien u binnen 3 weken uw certificaat nog niet heeft ontvangen.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
				  
				   <div id="faqPanel3_8">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_8" class="collapsed">
                      <h3>Mag ik herexamen doen als ik hem bij een eerste poging niet behaal?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Ja, u mag herexamen doen.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                 

	 
    
                <script type="text/JavaScript" language="JavaScript">
	//start this accordion
	faqAccordionInit("faqContainer3");
	
	
	</script>
    
    
                <p class="Header">Betaling en soortgelijke kwesties</p>
                <div style="border-bottom: 1px solid rgb(107, 121, 165);" id="faqContainer5" class="panel">
             
                   <div id="faqPanel3_3">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_2" class="collapsed">
                      <h3>Kan ik mijn betaling op locatie voldoen?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Om teleurstelling op locatie te voorkomen dient u de betaling vooraf te voldoen. We hanteren namelijk een beperkte klassengrootte en plaatsen dienen vooraf te worden gereserveerd. Daarnaast moeten ITIL Foundation examens vooraf worden geboekt en is het aantal examens beperkt tot het aantal ingeschreven studenten die volledig hebben betaald. Het kan voorkomen dat studenten die op locatie willen betalen de toegang geweigerd wordt door de niet-beschikbaarheid van examens.<br /><br />

Door op tijd te betalen, krijgt u tevens toegang tot ons voorbereidingsmateriaal, waardoor u beter bent voorbereid op de opleiding zelf.
</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel3_4">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_2" class="collapsed">
                      <h3>Sturen jullie een betaalbewijs en ontvangen wij voorafgaand aan de opleiding informatie omtrent de locatie en data van de lessen?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>De student zal na inschrijving een afdrukbaar betaalbewijs ontvangen.</p>
<p>Het betaalbewijs wordt aan studenten verstuurd zodra de betaling is ontvangen.</p>
<p>De opleidingsdata zullen met de factuur worden meegestuurd.</p>
<p>Informatie omtrent de locatie zal uiterlijk 7 dagen voorafgaand aan de aanvang van het programma worden doorgegeven.</p>
<p>Informatie omtrent de locatie en opleidingsdata zal tevens op onze website worden gepubliceerd.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel3_5">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_2" class="collapsed">
                      <h3>Geven jullie ook korting op de opleidingskosten?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Af en toe bieden wij studenten een vroege vogel korting. <a href="/Dutch/ITIL-Courses-nl.asp">Klik hier</a> voor gegevens omtrent de huidige opleidingskosten en beschikbare kortingen.<br /><br />
                                Ook hanteren we een korting van 5% op groepsinschrijvingen indien meer dan vijf deelnemers tegelijkertijd aan de opleiding deelnemen. Stuur een e-mail naar <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com</a> voor meer gegevens..</p>
                              
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel3_6">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_3" class="collapsed">
                      <h3>Zijn de kosten voor het ITIL Foundation examen inbegrepen bij de opleidingskosten?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_3" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Ja, onze opleidingskosten zijn inclusief de kosten voor het ITIL Foundation examen.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel3_7">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_3" class="collapsed">
                      <h3>Wat is er verder nog inbegrepen (of uitgesloten van) bij de kosten voor de klassikale ITIL Foundation opleiding?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_3" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
								
                            <p>De kosten voor een klassikale opleiding zijn inclusief de kosten voor studiemateriaal, kosten voor de docent en drankjes tijdens de pauzes gedurende de 2-daagse opleiding.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  
                  
                     
                  
                  
                  
                  
                 
                <script type="text/JavaScript" language="JavaScript">
	//start this accordion
	faqAccordionInit("faqContainer5");
	</script>
                <div style="height: 20px;"> &nbsp; </div>
                <!-- Content End From Here-->
                <!--#include virtual="/includes/connectionClose.asp"-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer-Dutch.html"-->
