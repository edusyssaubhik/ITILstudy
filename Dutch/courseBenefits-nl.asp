<!--#include virtual="/Dutch/metatags/courseBenefits_metatag.html"-->
<!--#include virtual="/includes/headermetaDutch.asp"-->
<!--#include virtual="/includes/FreeRes-aboutITIL-banner.asp"-->
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
 'Declare The Variables'
'======================================================='

 Dim rqafterEBDiscountPrice, rqcurrencyformat, rqapplicabledays
 Dim strQuery ,objRs, rqebdiscount

Set objRs = Server.CreateObject("ADODB.Recordset")

'Query to get the values from ITIL_countrydetails table
 strQuery = "SELECT ebdiscount, afterEBDiscountPrice,applicabledays FROM ITIL_countrydetails WHERE country = '" & Session("CountryOrigin") & "'"	

'Response.Write(strQuery)

  objRs.Open strQuery,ConnObj
  
	
  Do Until objRs.EOF
  
	rqebdiscount = objRs("ebdiscount")
	rqafterEBDiscountPrice = objRs("afterEBDiscountPrice")
	rqapplicabledays = objRs("applicabledays")
	
  objRs.Movenext
  Loop

  objRs.Close

    If Session("CountryOrigin") = "Singapore" then
        rqebdiscount = Replace(rqebdiscount,"$","SGD")
        rqafterEBDiscountPrice = Replace(rqafterEBDiscountPrice,"$","SGD")
    End if
%>
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="25%" >&nbsp;</td>
            <td width="73%" class="breadcrumb">Home &raquo;WAAROM WIJ  &raquo; Voordelen van klassikale opleidingen</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu-Dutch.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px; width:97%;"><br />
              <!-- Content Start From Here-->
			  
             <h1 class="PageTitle">ACHT REDENEN WAAROM U ITILSTUDY ALS OPLEIDINGSPARTNER IN DE ARM ZOU MOETEN NEMEN</h1>
              
              
             
                
              <ul type="1">
              
              <li>
                <span class="SubHeader">De beste faculteit: </span>
                ITILstudy heeft ervaren en professionele docenten die APMG-geaccrediteerd zijn en de allerbeste op hun gebied. Ze hebben allemaal een zeer uitgebreide ervaring in de industrie / IT Servicemanagement. Door een allesomvattend en uitgebreid "doceer-de-docent" programma zijn de leden van onze faculteit allemaal onderwezen op het gebied van klassikale ITILstudy opleidingstechnieken en leerprocessen van volwassenen zodat zij u een uitzonderlijke opleidingservaring kunnen bieden. <a href="/Dutch/instructors-nl.asp">Meer</a>
                </li>
                   <li>  <span class="SubHeader">Wetenschappelijk ontworpen, effectieve en resultaatgerichte instructiemethode: </span>
              De klassikale ITILstudy opleiding is ontworpen, beoordeeld en geëvalueerd door verschillende door ITIL<sup>&reg;</sup> Foundation gecertificeerde experts, en zijn goedgekeurd door APMG. Om de leerervaring en het onthouden van de lesstof te verbeteren, ontleent onze opleiding educatieve onderdelen aan de drie primaire leerstijlen, zijnde visueel (presentaties, hulpmiddelen), auditief (mondelinge instructies, interactie, etc.) en kinesthetisch (doe-het-zelf).  Er worden verschillende interactieve methoden ingezet, zoals experimenteel leren, kleine groepen, de praktijk onder de loep, herhaling, stagepanels, periodieke evaluatie en casussen.</li>
                 
             <li>
                <span class="SubHeader">100% niet-goed-geld-terug-garantie: </span> Ons klassikale programma zorgt ervoor dat u het ITIL Foundation examen behaalt. Is dat niet het geval, dan betalen wij u de kosten voor de opleiding terug <a href="/Dutch/moneyBack-nl.asp">Meer</a></li>


				<li><span class="SubHeader">De meeste waarde voor uw geld: </span>Het tarief voor de 2-daagse klassikale ITIL Foundation opleiding van ITILstudy kan per student worden afgerekend. <a href="/Dutch/ITIL-Courses-nl.asp">Meer</a></li>

                
              <li>

 						<span class="SubHeader">&euro;100 vroege vogel korting: </span>De &euro;100 vroege vogel korting is van toepassing indien u zich langer dan 12 dagen voor de startdatum van de opleiding inschrijft. Na de korting kost de opleiding dus nog maar &euro; 950. 
                            
                </li>

              <li>
                <span class="SubHeader">Toegang tot voorbereidend studiemateriaal van ITILstudy: </span>
              Zodra we de betaling hebben ontvangen, krijgt de student toegang tot het voorbereidende studiemateriaal van ITILstudy.</li>
              
                
                 <li> <span class="SubHeader">Uitmuntende leeromgeving: </span>
 Onze klassikale opleiding wordt doorgaans gegeven in sterrenhotels en hoogwaardige ontmoetingsplaatsen waar we van alle gemakken zijn voorzien. Tijdens het lesprogramma wordt u voorzien van tussendoortjes en koffie / thee.
               </li>
              
             <li>
                <span class="SubHeader">Door PMI goedgekeurde PDU's:</span>
                
               ITILstudy biedt tijdens klassikale ITIL Foundation opleidingen 18 PDU's aan. Dit zijn geldige PDU's voor de voortdurende eisen aan de opleiding om de PMI certificatiestatus te blijven behouden. <a href="/Dutch/PMI_PDU-nl.asp">Meer </a> 
               
                </li>
                  
              <!-- Content End From Here-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer-Dutch.html"-->
