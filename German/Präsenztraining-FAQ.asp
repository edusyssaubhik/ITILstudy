<!--#include virtual="/metatags/classroom-FAQ_metatag.html"-->
<!--#include virtual="/includes/headermetaGerman.asp"-->
<!--#include virtual="/includes/innerbannerFAQ.html"-->
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
            <td width="73%" class="breadcrumb">Home &raquo; WARUM UNS &raquo; Präsenztraining - FAQS</td>

          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu-German.asp"-->
<td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
			 <h1 class="PageTitle">ITILSTUDY PRÄSENZTRAINING - FAQS</h1>
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
                <p class="Header">Über ITIL<sup>&reg;</sup>: </p>
                <div style="border-bottom: 1px solid rgb(107, 121, 165);" id="faqContainer1" class="panel">
                  <div id="faqPanel1_1">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_1" class="collapsed">
                      <h3>Was ist ITIL?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel1_1" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>ITIL<sup>&reg;</sup> (IT Infrastructure Library) ist das weltweit verbreitetste Framework für das IT Service Management. Es ist ein praktischer Ansatz zur Identifizierung, Planung, Lieferung und Betreuung von IT-Dienstleistungen für Unternehmen. Es beschreibt, wie die IT-Ressourcen organisiert werden sollten, um den Mehrwert für ein Unternehmen zu liefern, indem die Prozesse, Funktionen und Rollen des IT Service Managements (ITSM) dokumentiert werden.</p>
                            <p>ITIL- Prinzipien werden von vielen Unternehmen aus dem öffentlichen und privaten Sektor angewendet, z.B. NASA, IBM, HP, British Telecom, HSBC bank, L’Oreal und viele andere.</p>
							<p>ITIL wurde vom Office of Government Commerce (OGC) entwickelt. Die IT Infrastructure Library (ITIL) ist ein Set von fünf Büchern, die die Umsetzung eines IT-Service-Managements beschreiben. In ITIL werden die für den Betrieb einer IT-Infrastruktur notwendigen Prozesse, Strukturen und Werkzeuge beschrieben.</p>
                            <p>Die der ITIL zugehörige Norm ist ISO/IEC 20000, die aus dem britischen Standard BS 15000 entwickelt wurde. ISO/IEC 20000 beschreibt ein integriertes Portfolio von Servicemanagement-Prozessen, die auf den in der ITIL definierten Prozessen basieren und diese ergänzen.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel1_2">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>Welche Zertifizierungen sind unter dem ITIL Qualifizierungsschema vorhanden?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                          
                            <p class="btext">Folgende Zertifizierungen sind im Rahmen der ITIL Qualifizierung möglich:</p>
                            <ul class="btext">
                              <li>ITIL Foundation </li>
                              <ol type="i">
                                <li>Das ITIL Foundation- Zertifikat in IT Service Management ist die Einstiegsprüfung des Schemas. Für diese Prüfung gibt es keine Voraussetzungen.</li>
                              </ol>
                            </ul>
                            <ul>
                              <li>ITIL Intermediate Level</li>
                              <ol type="i">
                                <li>Der ITIL Intermediate Level ist der Kern des ITIL-Qualifizierung. Voraussetzung für diese Prüfung ist die ITIL Foundation-Qualifikation und der erfolgreiche Abschluss eines anerkannten Trainingskurses.</li>
                                <li>Folgende Prüfungen sind für den Intermediate Level verfügbar:<br />
Service Lifecycle – Managementorientierte Prüfungen
Service Strategy, Service Design, Service Transition, Service Operation und Continual Service Improvement.
<br />
<b>Service Capability</b> – Prozessorientierte Prüfungen<br />Planning, Protection and Optimization; Release Control and Validation, Operational Support and Analysis und Service Offerings and Agreements.

</li>
                              </ol>
                            </ul>
							
							 <ul>
                              <li>ITIL Managing Across the Lifecycle (MALC) </li>
                              <ol type="i">
                                <li>Der ITIL Managing Across the Lifecycle (MALC) ist die Abschlußprüfung der ITIL-Qualifizierung. Kandidaten, die bereits andere ITIL-Zertifizierungen vorweisen können, sind berechtigt, diese Prüfung abzulegen. Nach erfolgreichem Abschluss erhalten Sie den ITIL Expert Level Award.

</li>
                                <li>Weitere Informationen zu den verfügbaren ITIL-Qualifikationen  finden Sie unter: 
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
                      <h3>Welchen Nutzen bringt  ITIL meinem Unternehmen?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
						  <p>Die IT Infrastructure Library (ITIL<sup>&reg;</sup>) ist ein allgemein anerkannter Ansatz für die Verwaltung und Bereitstellung von IT Services. Unternehmen implementieren ITIL<sup>&reg;</sup> Best Practices, um den Service zu verbessern, die Produktivität zu steigern, die IT-Kosten besser zu verwalten und um ein besseres Verständnis für die Aktivitäten in der IT-Abteilung zu entwickeln.</p>
                            <p>Folgende Vorteile bietet ITIL<sup>&reg;</sup>: </p>
                            <ul>
                              <li>ITIL<sup>&reg;</sup> bietet einen praktischen und dokumentierten Rahmen für die IT Best Practices innerhalb einer  IT Organisation.</li>
                              <li>Es reduziert IT-Kosten und rechtfertigt die Kosten der IT-Qualität. Es wird eine Verbesserung in der Anwenderproduktivität erreicht.</li>
                              <li>Es befähigt die IT eines Unternehmens, die interne Leistung und die Service-Bereitstellung zu messen und zu verbessern.</li>
                              <li>Es verbessert die Kommunikation und den Informationsfluss zwischen der IT und den Fachabteilungen des Unternehmens. Die Rollen und Verantwortlichkeiten für das IT Service Management werden identifiziert.</li>
                              <li>Es befähigt die IT, sich bei neuen Geschäftsmöglichkeiten und  Herausforderungen besser anzupassen.</li>
                              <li>Es verbessert die Beziehung zwischen der IT und der Geschäftsführung und – es somit erzeugt Vertrauen.</li>
                            </ul>
                           
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel1_4">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>Darf ich das ITIL Logo verwenden?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>ITIL<sup>&reg;</sup> wurde vom Office of Government Commerce (OGC), entwickelt. Im Juni 2010 wurde das OGC vom Cabinet Office (CO) übernommen.</p>
							<p>Die APM Group ist für Lizenzen zuständig. Die kommerzielle Nutzung der Frameworks, der Ausbildungen, der Graphiken und der Logos erfordern eine Lizenz, die beantragt werden kann. APM Group unterzieht die Nutzung dieser Rechte einer strengen Überwachung. Für weitere Informationen kontaktieren Sie bitte: <a href="mailto:servicedesk@apmgltd.com" target="_blank">servicedesk@apmgltd.com</a></p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                 
                         
                <script type="text/JavaScript" language="JavaScript">
	//start this accordion
	faqAccordionInit("faqContainer1");
	</script>.
                <p class="Header">Über ITILstudy</p>
                <div style="border-bottom: 1px solid rgb(107, 121, 165);" id="faqContainer2" class="panel">
                 
                  <div id="faqPanel2_2">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>Wie melde ich mich für ein Präsenztraining über ITILstudy.com an?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                         
                            <p>Die Anmeldung zu einem ITILstudy Präsenztraining ist ein dreistufiger Prozess: </p>
                            <ul style="list-style-type: square">
                              <li>Schritt 1: Registrierung durch Angabe der entsprechenden Anmeldeinformationen (ca. 3 Min.).</li>
                              <li>Schritt 2: Zahlen der Kursgebühr innerhalb von 5 Tagen nach Registrierung.</li>
							  <li>Schritt 3: ITILstudy bestätigt die Kursteilnahme nach Erhalt der Zahlung.</li>
                            </ul>
							<p>Zur Anmeldung oder für weitere Informationen, klicken Sie bitte <a href="http://www.itilstudy.com/enrollClass.asp" target="_blank">hier</a>.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>

                  <div id="faqPanel2_4">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>Was wird im ITILstudy Trainingsprogramm geschult?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                         
<UL>
<LI>Der Inhalt des ITILstudy Präsenztrainings deckt Ziele, Inhalte, Umfang und die Schlüsselkonzepte der ITIL Kernprozesse und –funktionen sowie weitere Bereiche des ITIL Foundation Lehrangebotes ab. Anhand von Praxis- und industriespezifischen Beispielen ist der 2-Tageskurs so konzipiert, dass die Teilnehmer die ITIL Prüfung beim ersten Versuch erfolgreich bestehen können. Weitere Informationen hierdazu erhalten Sie <a href="http://www.itilstudy.com/classroomTraining.asp">hier</a>.</LI> 
<LI>Weitere Informationen über Seminartermine und Schulungsorte erhalten Sie <a href="http://itilstudy.com/ITIL-Courses.asp">hier</a>.</LI>

</UL>


					
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel2_5">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>Wer wird das Training durchführen?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Alle Trainer sind APMG akkreditiert und bestens qualifiziert. Jeder unserer Trainer hat erfolgreich einem strengen Auswahlprozess durchlaufen, der von der APM Group UK festgelegt wuirde. Die Trainer haben das nötige Wissen und die Expertise, um den Teilnehmern sowohl die Konzepte als auch das Fachlichwissen gut zu vermitteln können. 
                              </p>
							  
							   
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel2_601">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>Was passiert, wenn ITILstudy einen Kurs absagt?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Wir bieten Ihnen für Sie vorteilhafte Stornierungsbedingungen, die  eine reibungslose Umbuchung oder Erstattung gewährleisten. Weitere Informationen dazu erhalten Sie <a href="/termsAndConditions.asp" target=_blank>hier</a>.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel2_6">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>Wie hoch ist die typische Teilnehmeranzahl?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Die maximale Teilnehmerzahl beträgt 15 Personen.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>

                  <div id="faqPanel2_19">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3> Welche Methode setzt ITILstudy für das ITIL Foundation Training ein? </h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Um mehr über unsere ITIL Präsenztrainingsmethode zu erfahren, klicken Sie bitte hier: <br />
<a href="http://itilstudy.com/classroomTraining.asp">ITIL  Foundation Classroom Training</a>
</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>


                  <div id="faqPanel2_7">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>Welche Kosten fallen für das ITILstudy Präsenztraining an? </h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Weitere Angaben über die ITILstudy Präsenztrainingsgebühr, klicken Sie bitte <a href="/ITIL-Courses.asp">hier</a>.</p>
                            
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
				  
                  <div id="faqPanel2_8">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>Was bedeutet ITIL “v3” Foundation?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>V3 steht für Version 3. APMG hat kürzlich die Verwendung der Versionsangabe bei allen ITIL Kursen entfernt. Nun gilt eine überarbeitete und verbesserte Version der ITIL<sup>&reg;</sup> Core Literatur „ITIL 2011 Edition“.</p>
                            
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                 
                  <div id="faqPanel2_9">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>Basiert der ITIL Foundation Kurs von ITILstudy auf dem ITIL v3 Foundation Lehrangebot?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Ja, der ITIL Foundation Kurs von ITILstudy basiert auf dem ITIL v3 Lehrangebot und wurde gemäß der ITIL 2011 Edition aktualisiert.</p>
                            
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
				  
                  <div id="faqPanel2_10">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader2_2" class="collapsed">
                      <h3>Wurde dieser Kurs an die ITIL 2011 Edition angepasst?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel2_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Der ITIL Foundation Kurs von ITILstudy wurde an das aktualisierte Lehrangebot „ITIL 2011 Edition“ angepasst. Auch unsere Trainer haben Ihren Wissensstand gemäß dem neuen Lehrangebot  aktualisiert.</p>
                            
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
	
	            <p class="Header">Über die ITIL Foundation Prüfung</p>
                <div style="border-bottom: 1px solid rgb(107, 121, 165);" id="faqContainer4" class="panel">
                  <div id="faqPanel4_1">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_1" class="collapsed">
                      <h3>Welche Voraussetzungen gibt es für die ITIL Foundation Prüfung?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; height: 1px; display: none;" id="panel4_1" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Für die ITIL Foundation Prüfung gibt es keine speziellen Voraussetzungen. Bereits vorhandene Kenntnisse über IT Services sind jedoch von Vorteil.</p>
                          
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
				       <div id="faqPanel4_11">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>Wann erhalte ich Zugang zum Online- Trainingsmaterial?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>ITILstudy möchte sicherstellen, dass die Teilnehmer sich bereits vor Kursbeginn über die wichtigsten ITIL Foundation- Schlüsselkonzepte und -grundlagen informieren können. ITILstudy ermöglicht daher den Zugang zu einem Online- Vorbereitungskurs sofort nach Zahlungseingang.  </p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel4_2">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>Wie ist das Format der ITIL Foundation- Prüfung?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                          
                            <p class="btext">Die Fragestellungen der ITIL Foundation- Prüfung selbst haben sich nicht geändert, jedoch das Format:</p>
                            <ul class="btext">
                              <li>40 Multiple-Choice-Fragen (auf Papier)</li>
                             <li>Dauer: 1 Stunde </li>
							 <li>Jede Frage zählt einmal</li>
							 <li>Falsch beantwortete Fragen zählen nicht </li>
							 <li>Mit 65% hat man bestanden, d.h. 26 von 40 Fragen müssen richtig beantwortet sein</li>
                            </ul>
							
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel4_3">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>Wie lautet der Lehrplan für den ITIL Foundation- Kurs?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
						  <p>Weitere Informationen über den ITIL Foundation- Lehrplan finden Sie <a href="/german/Präsenztraining.asp">hier</a>.</p>
                          
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel4_4">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>Welche Vorbereitungen sind für den ITILstudy Präsenzkurs erforderlichnötig?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>ITILstudy bietet den Teilnehmern ein Vorbereitungsprogramm an, welches vor Beginn des ITIL Foundation Seminars beendet werden sollte. Zugang erhalten die Teilnehmer sofort nach Zahlungseingang.

</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
				   <div id="faqPanel4_5">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>Wo kann ich die ITIL Prüfung ablegen?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Prüfungen können entweder in einem ITILstudy Center, dem Center einer anderen akkreditierten Trainingsorganisation (ATO) oder in einem von APMG anerkannten Prometric Center abgelegt werden. Die offenen Center- Prüfungen werden nur an festgelegten Terminen und an nur bestimmten Orten abgehalten. Wir empfehlen, die Prüfung in einem Prometric Center ca. 4-6 Wochen im Voraus zu buchen. Um die Prüfung bei ITILstudy abzulegen, kontaktieren Sie uns bitte unter: <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com</a>

</p>
<p>Sie können entweder telefonisch APMG internationalen Service-Desk: +44 (0)1494 452450 um die Prüfung zu arrangieren, um per E-Mail <a href="mailto:servicedesk@apmgroupltd.com" target="_blank">servicedesk@apmgroupltd.com</a> oder besuchen Sie die Website <a href="http://www.itil-officialsite.com/" target="_blank">www.itil-officialsite.com</a></p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel4_6">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>Wann kann ich das Resultat meiner ITIL Foundation- Prüfung erwarten?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Die ITIL Foundation- Prüfungsergebnisse liegen eine Woche nach Prüfungsabgabe vor. Wenn Sie die Prüfung bei ITILstudy abgelegt haben, erhalten wir die Resultate von der zuständigen Vertretung von APMG -International innerhalb von 5 Tagen. Diese senden wir Ihnen innerhalb von 24 Stunden nach Erhalt zu.


</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
				  
				    <div id="faqPanel4_7">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>Wann erhalte ich mein ITIL Foundation- Zertifikat?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Wenn Sie die ITIL Foundation- Prüfung bei ITILstudy abgelegt haben, leiten wir das Zertifikat an Sie weiter, sobald wir es von CSME erhalten haben. Dies dauert in der Regel ca. 3 Wochen. Bitte beachten Sie, dass das Zertifikat immer an die zugelassene Trainingsorganisation (ATO) geschickt wird, bei der die Prüfung abgelegt wurde. Sollten Sie Ihr Zertifikat nicht innerhalb von 3 Wochen erhalten haben, kontaktieren Sie uns bitte: <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com</a></p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
				  
				   <div id="faqPanel4_8">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader1_2" class="collapsed">
                      <h3>Kann ich die Prüfung nochmal ablegen, wenn ich beim ersten Versuch durchgefallen bin?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel1_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Ja, Sie können die Prüfung erneut ablegen.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                 
                         
                <script type="text/JavaScript" language="JavaScript">
	//start this accordion
	faqAccordionInit("faqContainer4");
	</script>
                <p class="Header">Bezahlung und </p>
                <div style="border-bottom: 1px solid rgb(107, 121, 165);" id="faqContainer3" class="panel">
             
                  <!--<div id="faqPanel3_2">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_2" class="collapsed">
                      <h3> What are the acceptable modes of payment?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                          <p>A wide range of easy payment options are available.</p>
                          <p>Payment can be done through the following means:</p>
						  <ul>
						  <li>Cheque or Demand Draft favoring "Edusys Services Pvt Limited."<br />This should be couriered to the following address:<br />Edusys Services Pvt Limited,<br />#27, 2nd Floor, Santosh Towers,<br />4th Main,100 Ft. Ring Road,<br />J.P. Nagar 4th Phase,<br />Bangalore - 560078<br /> India</li>
						  <li>Bank Transfer: Payee Name: EDUSYS SERVICES PVT LIMITED <br />Bank Name : ICICI Bank Limited<br />Account Number : ICICI Bank A/c No : 0401 0500 0128<br />Branch Name : ICICI Bank, J.P. Nagar Branch, Bangalore</li>
						  <li>Alternate Payment Mechanism: If you have problems in making payments through Cheque or Demand Draft, please email us at <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com</a>; we will suggest alternate payment options to you.</li>
						  </ul>

                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>-->
                  <div id="faqPanel3_3">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_2" class="collapsed">
                      <h3>Kann ich die Bezahlung auch vor Ort vornehmen?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Wir empfehlen, die Zahlung ín jedem Fall im Voraus vorzunehmen, um etwaige Probleme vor Ort zu vermeiden, da die Teilnehmeranzahl beschränkt ist und die Plätze schon vergeben sein könnend. Hinzu kommt, dass die ITIL Foundation- Prüfungen im Voraus gebucht werden müssen und die Prüfungsunterlagen  auf die angemeldeten Teilnehmer begrenzt sind, die die Gebühr vollständig bezahlt haben. </p>
                            <p>Eine rechtzeitige Bezahlung hat ausserdem den Vorteil, dass Sie rechtzeitig vorab den Online-Zugang zum Seminar-Vorbereitungskurs erhalten und sich somit besser für das 2-tägige Training vorbereiten können.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel3_4">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_2" class="collapsed">
                      <h3>Wird der Zahlungsempfang zusammen mit den Informationen über den Schulungsort und den Trainingsdaten bestätigt?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Jeder Teilnehmer erhält nach Anmeldung eine druckfähige Rechnung.</p>
							<p>Die Zahlungsbestätigung wird dem Teilnehmer nach Zahlungseingang zugeschickt.</p>
							<p>Die Trainingstermine werden zusammen mit der Rechnung per E-Mail zugeschickt.</p>
							<p>Der Schulungsort wird mindestens 7 Tage vor Trainingsbeginn mitgeteilt.</p>
							<p>Schulungsort und Termine werden finden Sie ebenfalls auch auf unserer Webseite: <a href="/german/ITIL-Kurs.asp">Sie hier</a></p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel3_5">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_2" class="collapsed">
                      <h3>Bieten Sie eine Ermäßigung auf die Kursgebühr an?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_2" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>In Einzelfällen bieten wir Frühbucherrabatte an. Für weitere Informationen über unsere aktuellen Kurse und mögliche Ermäßigungen klicken Sie bitte <a href="/ITIL-Courses.asp">hier</a>.<br /><br />Wir bieten ebenfalls eine Ermäßigung von 5% für Gruppenanmeldungen an, wenn sich mehr als fünf Teilnehmer zu dem gleichen Kurs anmelden. Um weitere Informationen anzufordern, senden Sie bitte eine E-Mail an: <a href="mailto:marketing@ITILstudy.com" target="_blank">marketing@ITILstudy.com</a>.</p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel3_6">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_3" class="collapsed">
                      <h3>Ist die ITIL Foundation- Prüfungsgebühr inklusive  Kursgebühr?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_3" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
                            <p>Ja, unsere Kursgebühr schließt die ITIL Foundation- Prüfungsgebühr bereits mit ein. </p>
                          </div>
                        </div>
                        <div class="outerFAQContainerBottom">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                  <div id="faqPanel3_7">
                    <div style="background-color: rgb(107, 121, 165); color: rgb(51, 51, 51); font-weight: normal;" id="faqHeader3_3" class="collapsed">
                      <h3>Was ist noch inklusive der ITIL Foundation- Präsenztrainingsgebühr?</h3>
                    </div>
                    <div style="border-style: solid; border-color: rgb(107, 121, 165); border-width: 0px 1px; margin: 0px; overflow: hidden; display: none; height: 1px;" id="panel3_3" class="answer">
                      <div class="faqItemContent">
                        <div class="outerFAQContainer">
                          <div class="innerFAQContainer">
								
                            <p>Die Kursgebühr beinhaltet das komplette Lernmaterial, die Trainergebühr sowie Erfrischungen während der Trainingspausen an den Seminartagen.</p>
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
<!--#include virtual="/includes/footer-German.html"-->
