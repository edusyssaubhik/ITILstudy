<!--#include virtual="/metatags/better-than-competitors_metatag.html"-->
<!--#include virtual="/includes/headermetaGerman.asp"-->
<!--#include virtual="/includes/innermethodologybanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
 'Declare The Variables'
'======================================================='

 Dim rqafterEBDiscountPrice, rqcurrencyformat, rqapplicabledays
 Dim strQuery ,objRs

Set objRs = Server.CreateObject("ADODB.Recordset")

'Query to get the values from ITIL_countrydetails table
 strQuery = "SELECT afterEBDiscountPrice,applicabledays FROM ITIL_countrydetails WHERE country = '" & Session("CountryOrigin") & "'"	

'Response.Write(strQuery)

  objRs.Open strQuery,ConnObj
  
	
  Do Until objRs.EOF
  
	rqafterEBDiscountPrice = objRs("afterEBDiscountPrice")
	rqapplicabledays = objRs("applicabledays")
	
  objRs.Movenext
  Loop

  objRs.Close
%>

<!-- Body Starts -->
<script language="JavaScript" type="text/javascript" src="/js/tableH.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/courses.js"></script>
<script type="text/javascript" src="/js/cities_combo.js"></script>
<script>
var ld=(document.all);
var ns4=document.layers;
var ns6=document.getElementById&&!document.all;
var ie4=document.all;
if (ns4)
ld=document.loading;
else if (ns6)
ld=document.getElementById("loading").style;
else if (ie4)
ld=document.all.loading.style;
function init()
{
if(ns4){ld.visibility="hidden";}
else if (ns6||ie4) ld.display="none";
}
</script>
<style type="text/css">
#myTable0{
	border:#CCC solid 1px;
}

#myTable0 td{
	padding:5px;
	border-top:#CCC solid 1px;
	border-left:#CCC solid 1px;
}


#myTable0 td:first-child{
	border-left:none;
	text-align:center;
    font-weight:bold;
    vertical-align:middle;	
}
#myTable0 #header td{
	border-top:none;
	font-weight:bold;
    background-color:#F2F4F4;  
    text-align: center;
    vertical-align: middle;	
}


</style>


<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" >&nbsp;</td>
            <td width="25%">&nbsp;</td>
            <td width="73%" class="breadcrumb">Home &raquo; WARUM UNS &raquo; Besser als die konkurrenz</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu-German.asp"-->
<td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><br /><div style="margin-top:-12px; width:97%;">
              <!-- Content Start From Here-->
		   <h1 class="PageTitle">GRÜNDE, WESHALB SIE ITILSTUDY WÄHLEN SOLLTEN</h1>
           <p>ITILstudy erfüllt die höchsten Anforderungen der APMG, die an  ein ITIL Foundation-Präsenztraining gestellt werden. Vergleichen Sie ITILstudy mit anderen ITIL Foundation-Trainingsanbietern und machen Sie sich selbst ein Bild. </p><br>			

		
                  <table width="97%" id="myTable0" border="0" align="center" onMouseOut="javascript:highlightTableRowVersionA(0);"  cellpadding="0" cellspacing="0" class="TableGeneral">
                    
                    <tr id="header">
                      <td width="20%">Kriterien</td>
                      <td>ITILstudy Vorteile</td>
                      <td>Achtung vor Trainingsanbietern</td>
                    </tr>
                     <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                       <td>Hohe Kurs-Qualität <i>zugelassen</i> von APMG und unterrichtet von APMG- akkreditierten Trainern
                       </td>
                       <td><ul>
                            <li>ITILstudy ist eine Marke von Edusys Services Pvt. Limited, UK (VMEdu, Inc., US) – eine von <a href="http://www.apmg-international.com/" target="_blank">APMG</a> akkreditierte  Trainingsorganisation (ATO).</li>
                            <li>ITILstudy Kurse und Kursmaterial wurden von APMG akkreditiert.</li>
                            <li>Unsere Trainer und Berater sind von APMG akkreditiert und verfügen über ein breites Spektrum an praktischen Erfahrungen. Sie sind in der Vermittlung von ITILstudy Unterrichtsmethoden und -techniken ausgebildet, um ein interaktives und ansprechendes Training bieten zu können.
                            </li>
                       </ul></td>
                       <td><ul>
					   
                            <li>die keine von APMG akkreditierten ATOs sind.</li>
                           <li>deren Kurse und Kursinhalte  nicht von APMG akkreditiert wurden.</li>
                           <li>die nicht mit APMG akkreditierten Trainern zusammenarbeiten.</li>
                            </ul></td>
                    </tr>

                            
                              <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                           <td>100% Geldzurückgarantie</td>
                           <td><ul>
						   <li>Die außergewöhnliche Qualität unserer Programme und eine 100% Geldzurückgarantie bedeuten, dass Sie bei Nichtbestehen der ersten ITIL Foundation-Prüfung diese innerhalb von drei Monaten kostenlos wiederholen können. Sollten Sie sie erneut nicht bestehen, erhalten Sie die gesamte Kursgebühr zurück</li>
                                 <li>Um die 100% Geldzurückgarantie in Anspruch nehmen zu können, müssen Sie an allen Tagen des Seminars teilnehmen und am 2. Tag die Prüfung ablegen.</li>
                                 
                                 </ul></td>
                           <td><ul>
                               <li>die keine 100% Geld-zurück-Garantie auf ihre Kurse anbieten</li> 
                               <li>die sehr strenge Bedingungen in Bezug auf Ihre Rückerstattung haben sowie nicht den Ruf in der Branche genießen, die Geld-zurück-Regelung einzuhalten.</li> 
                               <li>die versteckte Gebühren von dem Rückerstattungsbetrag abziehen, so dass es keiner 100%-Regelung entspricht.</li> 
                                 </ul></td>
                                 
                    </tr>
                            
                              <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                                <td>Umfassendes Programm mit minimalem Vorbereitungsaufwand </td>
                                <td><ul>
                                     <li>Der ITILstudy Kurs ist sehr umfassend und bietet Ihnen alle Voraussetzungen, um die ITIL Foundation-Prüfung erfolgreich ablegen zu können. Es ist kein weiteres Material erforderlich.</li>
                                     <li>Vor Kursbeginn ist  nur eine minimale Vorbereitung erforderlich.</li>
                                     <li>2 Tage intensives Kurstraining und  die Hausaufgaben sind die Hauptbestandteile des Kurses.</li>
                                     <li>Am 2. Tag sind Sie in der Lage, die ITIL Foundation Prüfung erfolgreich abzulegen.</li>
                                      </ul>
                                </td>
                                 <td><ul>
                                       <li>die von Ihnen vor Kursbeginn viel Vorbereitung und Vorarbeit anfordern.</li>
                                       </ul></td>
                    </tr>
                    
                    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                                <td>Durchführungsgarantie </td>
                                <td><ul>
                                     <li>Wir garantieren die Durchführung unserer Kurse</li>
                                     <li>Sollte dennoch einmal ein Kurs seitens ITILstudy storniert werden müssen, bestehen die folgenden Möglichkeiten:
                                     <ol type="1">
                                     <li>Der Kurs wird verschoben: Sie können sich dafür entscheiden, an einem zukünftigen Kurs teilzunehmen. Der bereits bezahlte Betrag wird mit dem später stattfindenden Kurs verrechnet.</li>
                                     <li>Rückerstattung: Sie können für das stornierte Seminar eine Rückerstattung der kompletten Kursgebühr beantragen und erhalten Ihr Geld zurück.</li>
                                     </ol>
                                     </li>
                                      </ul>
                                </td>
                                 <td><ul>
                                        <li>die ihre Kurse aufgrund weniger Teilnehmer, Trainermangel oder anderer Gründe regelmäßig stornieren ohne Alternativen anzubieten.</li>
                                        <li>die die Rückerstattung der Kursgebühr verzögern.</li>
                                        
                                       </ul></td>
                    </tr>
                               <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                                 <td>Großzügige Bedingungen bei Umbuchung und Rücktritt</td>
                                 <td><ul>
                                       
                                      <li>Sollten Sie einmal aus wichtigem Grund eine Kursumbuchung oder einen Kursrücktritt vornehmen müssen, bietet ITILstudy Ihnen großzügige Bedingungen. <a href="/German/Geschäftsbedingungen.asp">Mehr</a></li>
                                      
                                      </ul>
                                 </td>
                                 <td><ul>
                                       <li>die strenge Bedingungen vorweisen, wenn es um Kursumbuchungen oder Kursstornierungen geht. Wenn Teilnehmer erst einmal die Kursgebühr bezahlt haben, können Sie selbst in einer Notsituation weder umbuchen noch stornieren. </li>
                                      
                                       </ul></td>
									   
                               </tr>
                               <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                                <td>Bestes Preis-Leistungs-Verhältnis</td>
                                <td><ul>
								 <li>ITILstudy Kurse beginnen bei € 890 nach Abzug des Frühbucherrabatts – ein sehr attraktiver Preis für einen  anspruchsvollen Kurs dieser Art.</li>
                                      <li>Zusätzliche Ermäßigungen bestehen für Firmentrainings oder Gruppenanmeldungen. Bei Fragen dazu <a href="/german/Kontakt.asp">kontaktieren Sie uns</a>.</li>
                                      <li>Das 2-Tages-Trainingsprogramm stellt sicher, dass Sie alle Voraussetzungen erfüllen, um auf die ITIL Prüfung vorbereitet zu sein.</li>
                                     </ul></td>
                                <td><ul>
                                     <li>die ihre Kursgebühren bei Verhandlung reduzieren oder behaupten, den günstigsten Seminarpreis auf dem Markt zu haben. Im Vergleich zu ITILstudy haben diese Anbieter normalerweise keine Ausgaben, die mit hochklassigen Trainings und der Bezahlung von hochqualifizierten Trainern verbunden sind. Sie bieten auch keine Geld-zurück-Garantie oder kostenfreien Kurse (wie die Six Sigma Green Belt Zertifizierung oder die HRD Zertifizierung) an. Effektiv betrachtet, bieten Sie nicht das  beste Preis-Leistungs-Verhältnis, obwohl  sie eine niedrigere Seminargebühr vorweisen.</li>
                                   
                                     </ul></td>
                              </tr>
                              
                               <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                                <td>Regionales Seminarangebot</td>
                                <td><ul>
								 <li>ITILstudy führt Seminare in zahlreichen größeren Städten Deutschlands durch. Wählen Sie den für Sie geeigneten Ort. <a href="/german/ITIL-Kurs.asp">Mehr</a> </li>
                                     
                                     </ul></td>
                                <td><ul>
                                     <li>die nur eine geringe Auswahl an Kursen und Kursorten anbieten.</li>
                                   
                                     </ul></td>
                              </tr>
                    
                     <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                                <td>Kostenfreie Risk Management -Zertifizierung und 20 PMI PDUs im Wert von $ 300 
</td>
                                <td><ul>
								 <li>Teilnehmer der ITILstudy Präsenztrainings erhalten kostenlosen Zugang zu einem der folgenden Onlinekurse: Risk Management Kurs (im Wert von $300), angeboten von <a href="http://www.rmstudy.com" target="_blank">www.RMstudy.com</a></li>
                                     
                                     </ul></td>
                                <td><ul>
                                     <li>die keine weiteren Seminare für kontinuierliche Verbesserung oder nd training of students. Some providers may occasionally have some contests with no guaranteed prize</li>
                                   
                                     </ul></td>
                              </tr>
                               <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                                <td>Weitere Vorteile</td>
                                <td><ul>
								 <li>Trainings werden in erstklassigen Hotels oder Seminarzentren durchgeführt.</li>
                                   <li>Kostenlose Online ITIL Foundation Vorbereitung.</li>
                                   <li>Anspruchsvolle und umfassende Kursunterlagen, die Sie für die Prüfung einsetzen.</li>  
                                   <li>Wertvolle und praktische Tipps zur Prüfung.</li>  
                                     </ul></td>
                                <td><ul>
                                     <li>die Trainings in engen Seminarräumen mit wenig Qualitätsanspruch abhalten.</li>
                                      <li>deren Kursmaterial eine geringe oder mittelmäßige Qualität vorweist.</li>
                                   
                                     </ul></td>
                              </tr>
                              
                              
                              
              </table>
              
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
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?label=t-fgCJGHqQEQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>

<!-- Body Ends -->
<!--#include virtual="/includes/footer-German.html"-->
