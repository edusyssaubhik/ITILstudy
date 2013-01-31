<!--#include virtual="/metatags/better-than-competitors_metatag.html"-->
<!--#include virtual="/includes/headermetaDutch.asp"-->
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
            <td width="73%" class="breadcrumb">Home &raquo; WAAROM WIJ &raquo; Klassikaal - Beter dan de concurrent</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu-German.asp"-->
<td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><br /><div style="margin-top:-12px; width:97%;">
              <!-- Content Start From Here-->
		   <h1 class="PageTitle">WAAROM IS ITIL STUDY BETER DAN HAAR CONCURRENT?</h1>
           <p>ITILstudy gooit de hoogste ogen op het gebied van alle criteria waar studenten naar op zoek zijn wanneer ze op zoek zijn naar een klassikale ITIL<sup>&reg;</sup> opleiding. U kunt het zelf zien door ITILstudy te vergelijken met andere aanbieders van ITIL opleidingen.</p><br>			

		
                  <table width="97%" id="myTable0" border="0" align="center" onMouseOut="javascript:highlightTableRowVersionA(0);"  cellpadding="0" cellspacing="0" class="TableGeneral">
                    
                    <tr id="header">
                      <td width="20%">Criteria</td>
                      <td>Voordelen van ITILstudy</td>
                      <td>Let op voor aanbieders van opleidingen die</td>
                    </tr>
                     <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                       <td>Beste faculteit
                       </td>
                       <td><ul>
                            <li>ITILstudy is trots op de kwaliteit van haar faculteit en is de beste in de industrie, heeft meer dan 10 jaar ervaring binnen de industrie en heeft een uitvoerige opleiding genoten op het gebied van ITILstudy opleidingstechnieken en leerprocessen van volwassenen om tot een uitzonderlijke opleidingservaring te komen. <a href="/Dutch/instructors-nl.asp">Meer</a> </li>
<li>U wordt doorgaans onderwezen door een faculteit in de buurt die de plaatselijke problemen begrijpt en zich met geschikte voorbeelden, rollenspel en casussen kan toeleggen op ITIL concepten.

                            </li>
                       </ul></td>
                       <td><ul>
					   
                            <li>Bieden geen correcte informatie over hun faculteit aan op de website of plaatsen marketingteksten. Deze bedrijven beschikken soms niet over de juiste ervaring, communicatieve vaardigheden of ervaring om gevorderde professionals te onderwijzen.</li>
                            </ul></td>
                    </tr>

                            
                              <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                           <td>Het hoogst gedocumenteerde slagingspercentage - 99,2%</td>
                           <td><ul>
						   <li>Van alle studenten die onze lessen hebben bijgewoond, heeft 99,2% het ITIL examen behaald. Het volgen van de ITILstudy methodologie staat garant voor het behalen van het examen.</li>
<li>Als u op de 2 klassikale dagen goed studeert en goed het huiswerk maakt, zult u vrijwel zeker het ITIL examen behalen.
</li>
                                 
                                 </ul></td>
                           <td><ul>
                               <li>Geven hun slagingspercentage niet eenduidig weer op de website en in hun marketingteksten.</li> 
                                <li>Beweren een slagingspercentage van 100% te hebben. Een slagingspercentage van 100% is realistisch gezien onmogelijk omdat ITIL een zeer lastig examen is.</li> 
                                 </ul></td>
                                 
                    </tr>
                            
                              <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                                <td>Hoogwaardige inhoud van de opleiding, goedgekeurd door APMG en CSME en onderwezen door geaccrediteerde docenten</td>
                                <td><ul>
                                     <li>ITILstudy is een merk van Edusys Services Pvt. Limited, UK - een door APMG en CSME goedgekeurde en geaccrediteerde opleidingsinstantie (ATO (Accredited Training Organization)).</li>
                                    <li>De opleidingen van ITILstudy zijn geaccrediteerd door APMG.</li>
                                    <li>Onze faculteit is de beste in de industrie en is geaccrediteerd door APMG en CSME. Beiden hebben uitgebreide ervaring in de industrie en zijn opgeleid middels klassikale ITILstudy opleidingstechnieken en leerprocessen voor volwassenen, gericht op een uitzonderlijke opleidingservaring.</li>
                                      </ul>
                                </td>
                                 <td><ul>
                                       <li>Zijn geen door APMG / CSME goedgekeurde ATO's.</li>
                                         <li>Bieden geen opleidingen aan die zijn goedgekeurd door APMG / CSME.</li>
                                         <li>Maken geen gebruik van door APMG / CSME goedgekeurde docenten.</li>
                                       </ul></td>
                    </tr>
                    
                    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                                <td>Allesomvattend programma met minimale inspanning voorafgaand aan de opleiding</td>
                                <td><ul>
                                     <li>De ITILstudy opleiding is allesomvattend en biedt alles dat u nodig heeft om u het ITIL examen met succes te doen behalen - er zijn geen andere studiematerialen of naslagwerken nodig.</li>
<li>Woon de lessen bij met een minimale voorbereiding.</li>
<li>Studeer goed tijdens het lesprogramma en doe uw huiswerk.</li>
<li>Doe het ITIL examen op de tweede dag en SLAAG!</li>
                                    
                                      </ul>
                                </td>
                                 <td><ul>
                                        <li>Zullen van u eisen veel voorbereidingen te treffen voorafgaand aan de opleiding en vooraleer de klassikale lessen bij te wonen.</li>
                                        
                                        
                                       </ul></td>
                    </tr>
                               <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                                 <td>Gegarandeerd goed lopende lessen</td>
                                 <td><ul>
                                       
                                      <li>	Al onze lessen lopen gegarandeerd goed.</li>
                                        <li>In het onfortuinlijke geval dat ITILstudy een les annuleert, heeft u één van de volgende mogelijkheden:</li>
                                      <ol>
                                          <li>Plan opnieuw een les in: u kunt ervoor kiezen een toekomstige les opnieuw in te plannen. Het bedrag dat u heeft betaald voor de geannuleerde ITILstudy les zal voor de volgende les worden aangepast.</li>
                                            <li>U kunt een volledige terugbetaling vragen: u kunt een volledige terugbetaling vragen voor het bedrag dat u heeft betaald voor de geannuleerde les.</li>

                                      </ol>
                                      </ul>
                                 </td>
                                 <td><ul>
                                       <li>	Blijven hun lessen maar annuleren door onvoldoende inschrijvingen, omdat ze geen faculteit hebben of wegens andere redenen en bieden de student geen ander alternatief.</li>
<li>Verlate terugbetalingen.</li>

                                      
                                       </ul></td>
									   
                               </tr>
                               <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                                <td>Brede algemene voorwaarden voor het verzetten en annuleren van lessen</td>
                                <td><ul>
								 <li>We weten dat er zich situaties voor kunnen doen waarin studenten hun inschrijving voor een lessen moeten annuleren of lessen moeten verzetten. ITILstudy hanteert een breed beleid voor het verzetten en annuleren van lessen. <a href="/termsAndConditions.asp">Meer</a></li>
                                     </ul></td>
                                <td><ul>
                                     <li>Hanteren zeer strakke algemene voorwaarden voor het verzetten en annuleren van lessen. Wanneer studenten eenmaal hun lessen hebben betaald, kunnen deze niet meer worden verzet of geannuleerd, zelfs als het een noodgeval betreft.</li>
                                   
                                     </ul></td>
                              </tr>
                              
                               <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                                <td>De hoogste waarde tegen de laatste prijs</td>
                                <td><ul>
								 <li>ITILstudy opleidingen beginnen al met vroege vogel kortingen, waardoor u de laatste prijs betaalt voor een ontzettend hoogwaardige opleiding.</li>
<li>Voor bedrijfslessen of groepsinschrijvingen zijn daarnaast nog extra kortingen van toepassing.  <a href="/Dutch/contactus-nl.asp">Neen contact met ons op</a> om meer te weten te komen over bedrijfslessen of groepsinschrijvingen.</li>
<li>Het 2-daagse klassikale programma voorziet u van alles dat u nodig heeft ter voorbereiding op het ITIL examen.</li>

                                     
                                     </ul></td>
                                <td><ul>
                                     <li>Overvragen: ze brengen u wellicht te veel in rekening.</li>
<li>Ze blijven hun prijzen verlagen terwijl ze met u spreken over de prijs of beweren dat hun prijs scherper is dan die van alle andere concurrenten. Dergelijke aanbieders hebben vaak geen last van de kosten die gepaard gaan met het geven van een hoogwaardige opleiding en hebben geen kosten op het gebied van een gediplomeerde faculteit als ITILstudy. Het gevolg is dat zij daardoor niet de meest hoogwaardige opleidingen kunnen aanbieden, ondanks de lagere prijs die ze aanbieden.</li>

                                   
                                     </ul></td>
                              </tr>
                    
                     <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                                <td>Verschillende praktische locaties
</td>
                                <td><ul>
								 <li>ITILstudy geeft haar zeer uiteenlopende lessen in verschillende grote steden in Nederland. Door de opleiding te genieten met een leider, bent u verzekert van een opleiding van de "HOOGSTE KWALITEIT" op een voor u praktische locatie. <a href="/Dutch/ITIL-Courses-nl.asp">Meer</a></li>
                                     
                                     </ul></td>
                                <td><ul>
                                     <li>Hebben een beperkt aantal locaties en lessen.</li>
                                   
                                     </ul></td>
                              </tr>
                               <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                                <td>Andere voordelen</td>
                                <td><ul>
								 <li>De opleidingen worden gegeven in sterrenhotels en hoogwaardige ontmoetingsplaatsen.</li> 
                                <li>Gratis online ITIL voorbereidend werk.</li> 
                                <li>Hoogwaardig en allesomvattend studiemateriaal tijdens de klassikale lessen dat nodig is voor het ITIL examen.</li> 
                                <li>Waardevolle en praktische tips voor het examen.</li> 
 
                                     </ul></td>
                                <td><ul>
                                     <li>Geven opleidingen in te krappe ontmoetingsruimten, zonder kwaliteit te benadrukken.</li>
<li>Bieden studiemateriaal van slechte of gemiddelde kwaliteit aan.</li>

                                   
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
<!--#include virtual="/includes/footer-Dutch.html"-->
