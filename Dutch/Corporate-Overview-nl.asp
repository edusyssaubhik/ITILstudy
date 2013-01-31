
<!--#include virtual="/includes/headermetaDutch.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/innercoursebanner.html"-->





<style type="text/css">
.corporateTable{
	border-collapse:collapse;

	
	}
	
.corporateTable td {
	
	border:solid 1px #666;
	vertical-align:middle;
	padding-left:5px;
	text-align:center;
	}
	
.corporateTable th	{
	background-color:rgb(198,217,241);
	vertical-align:middle;
	border:solid 1px #666;
	font-size: 10pt;
	}
	
	.corporateTable td:first-child {
		text-align:left;
	}
		
		</style>

<script language ="JavaScript" type="text/javascript">

// Function To Validate Fields And Display An Alert Message If Any Field Is Empty.
//Email Validation

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

function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}
}

function validate_form(thisform)
{
	with (thisform)
    {
		
	    if (validate_required(Name,"Please enter your Name")=='')
 		     {Name.focus();return false}
	    if (validate_required(EMailID,"Please enter your email address")=='')
 		     {EMailID.focus();return false}
		if (echeck(EMailID)==false)
 	         {EMailID.focus();return false}
	   
 	    if (validate_required(Query,"Please write your query")==false)
 		     {Query.focus();return false}
		
	}
}
</script>
</head>
<body onLoad="init()">
<!-- Body Starts -->
<div >
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
	  <table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr >
            <td width="2%">&nbsp;</td>
            <td width="25%">&nbsp;</td>
            <td width="73%" class="breadcrumb">Home &raquo; BEDRIJFSOPLEIDINGEN &raquo; Overzicht en voordelen</td>
          </tr>
           <tr>
            <!--#include virtual="/includes/innerLeftMenu-Dutch.asp"-->
            <td rowspan="4" background="/images/back/left_line.jpg" class="general-body"><h1 class="PageTitle">ITILSTUDY - UW BETROUWBARE PARTNER VOOR BEDRIJFSOPLEIDINGEN</h1>
            <p>ITILstudy verzorgt opleidingen in meer dan <a href="/Dutch/exam-success-nl.asp">160 landen voor 3500+ bedrijven</a>. Enkele bedrijven die onlangs een bedrijfstarief hebben kunnen onderhandelen of die bedrijfsopleidingen gepland hebben bij ITILstudy staan hieronder:<br/></p>
			
<table>
			<tbody><tr><td align="center" width="662px"><img src="/images/buttons/1.jpg" height="60" hspace="25"><img src="/images/buttons/2.jpg" height="60" hspace="35"><img src="/images/buttons/3.jpg" height="60" hspace="30"></td></tr>
			
			<tr><td align="center" width="662px"><img src="/images/buttons/5.jpg" height="60" hspace="15"><img src="/images/buttons/6.jpg" height="79" hspace="20"><img src="/images/buttons/7.jpg" height="60" hspace="20"><img src="/images/buttons/8.jpg" height="60" hspace="10"></td></tr>
			
			<tr><td align="center" width="662px" style="padding-top:17px;"><img src="/images/buttons/9.jpg" height="60" hspace="26"><img src="/images/buttons/10.jpg" height="79" hspace="33"><img src="/images/buttons/11.jpg" height="60" hspace="15"></td></tr>
			
			<tr><td align="center" width="662px" style="padding-top:35px;"><img src="/images/buttons/13.jpg" height="60" hspace="20"><img src="/images/buttons/14.jpg" height="60" hspace="55"><img src="/images/buttons/15.jpg" height="60" hspace="15"></td></tr>
			
			<tr><td align="center" width="662px" style="padding-top:35px;"><img src="/images/buttons/12.jpg" height="60" hspace="10"><img src="/images/buttons/16.jpg" height="60" hspace="20"><img src="/images/buttons/17.jpg" height="60" hspace="18"><img src="/images/buttons/18.jpg" height="60" hspace="18"></td></tr>
            
             <tr><td align="center" width="662px" style="padding-top:35px;"><img src="/images/buttons/19.jpg" height="60" hspace="10"><img src="/images/buttons/20.jpg" height="60" hspace="15"><img src="/images/buttons/4.jpg" height="60" hspace="25"></td></tr>
			
			
			</tbody></table>
			
			
	<p>
ITIL<sup>&reg;</sup> Foundation vormt de startkwalificatie en maakt kandidaten bewust van hoofdelementen, concepten en terminologie die gebruikt wordt in de ITIL<sup>&reg;</sup> Service Lifecycle. Het doel van het ITIL<sup>&reg;</sup> Foundation certificaat IT Service Management is om aan te geven dat de kandidaat kennis heeft van de ITIL terminologie, structuur en basisconcepten en de grondprincipes van ITIL praktijken op het gebied van servicemanagement onder de knie heeft.</p>

		
	<p class="Header">Waarom kiezen wereldwijd vooraanstaande organisaties ITILstudy?</p>
	<table  border="0">
	<tr><td >
	<p>Het meest efficiënte en betaalbare middel voor ITIL Foundation certificatie:</p>
	<ul>
	<li><span class="general-bodyBold">Uitstekend en meetbaar succes: </span>Onze klassikale voorbereidende opleiding op het ITIL examen heeft een slagingspercentage van 99,2%.</li>
	<li><span class="general-bodyBold">De beste faculteit:</span> We hebben een zeer hoog slagingspercentage (99%) en krijgen voortdurend feedback van studenten omtrent de hoge kwaliteit van onze docenten.  <a href="/Dutch/Instructors-nl.asp">Klik hier</a> voor bio's van docenten</li>
<li><span class="general-bodyBold">100% niet-goed-geld-terug-garantie:</span> ITILstudy verzekert u dat geen enkele cent van uw investering in opleiding weggegooid geld is. We verzekeren u dat onze studenten het ITIL Foundation examen behalen. Is dat niet het geval, dan betalen wij alle examenkosten terug. <a href="/Dutch/moneyBack-nl.asp">Meer</a> </li>
	
	     <li><span class="general-bodyBold">Flexibele leveringsmogelijkheden:</span> ITILstudy begrijpt dat elke organisatie zo haar eigen behoeften en beperkingen heeft en voorziet daarom bedrijven van flexibele leveringsmogelijkheden:
<ul type="circle">
		   <li><span class="general-bodyBold">Opleidingen op locatie:</span> Indien opleiding op locatie de gewenste optie is, krijgen wij de mogelijkheid om de opleidingsmodule op basis van uw agenda aan te passen aan de behoeften van uw organisatie.v
<li><span class="general-bodyBold">Weekendlessen:</span> Ook in het weekend kunnen we lesgeven zodat de opleiding niet in de weg staat van het drukke programma van de professionals in uw organisatie.</li>
<li><span class="general-bodyBold">Zeer goede locaties:</span> Voor het gemak van onze afgevaardigden van bedrijven geven we ook les in zeer goede hotels en congrescentra.
  </li></ul></li></ul>
</td> </tr></table>

<p> <span class="Header">OPLEIDINGSMOGELIJKHEDEN:</span><br/><br/>
<p>ITILstudy ITIL<sup>&reg;</sup> Foundation opleidingen zijn samengesteld met als doel de student een praktisch begrip te doen krijgen van concepten op het gebied van IT servicemanagement en het certificatie-examen te doen halen. In dit hoofdstuk worden de flexibele opleidingsmogelijkheden voor ITIL Foundation certificering beschreven.</p>

<table border="0" align="center" width="100%" cellspacing="0" cellpadding="2" class="corporateTable">

                          <tr >
                            <th>Opleidingsmogelijkheden</th>	
                              <th>Duur</th>	
                              <th>Soort opleiding</th>	
                              <th>Examenkosten inbegrepen?</th>	
                              <th>ITIL Foundation examen afgenomen tijdens opleiding?</th>
                          </tr>
                          <tr align="center">
                            <td>A. Online zelfstudie</td>	
                              <td>90 dagen toegang</td>	
                              <td>Zelfstudie</td>	
                              <td>Ja</td>	
                              <td>Nee, waardebon</td>
                          </tr>
                          <tr align="center">
                            <td>B. Virtueel klaslokaal</td>	
                              <td>2 Dagen</td>	
                              <td>Live online docent</td>	
                              <td>Ja</td>
                              <td>	Nee, waardebon</td>
                          </tr>
                          <tr align="center">
                            <td>C. Traditionele klas</td>	
                              <td>2 Dagen</td>	
                              <td>Geleid door docent</td>	
                              <td>Ja</td>	
                              <td>Ja</td>
                          </tr>
                          <tr align="center">
                            <td>D. Traditionele klas + workshop op maat/casus voor specifieke industrieën</td>	
                              <td>3 Dagen</td>	
                              <td>Geleid door docent</td>	
                              <td>Ja</td>	
                              <td>Ja</td>
                          </tr>
                        
                        </table>

<p><br> <span class="Header">MOGELIJKHEID A: Online zelfstudie</span></p><hr>
<p>Deze opleiding kan altijd en overal worden gevolgd. Hij is geschikt voor teams die zich in verschillende tijdzones en op verschillende locaties bevinden. Omdat de inhoud van de opleiding online staat, kunnen studenten op eigen tempo studeren en het certificatie-examen inplannen op een voor hen praktische examenlocatie. Voordelen van het online zelfstudieprogramma:
<ul><li>Overal en altijd: Overal en altijd te volgen. Geschikt voor teams die zich in verschillende tijdzones en op verschillende locaties bevinden.</li>
<li>18 PMI PDU's certificaat voor de behoefte aan vervolgstudie van PMP-gecertificeerde professionals.</li></ul></p>

<p><br> <span class="Header">MOGELIJKHEID B: Virtueel klaslokaal</span></p><hr>
<p>Deze opleiding brengt de deelnemers vanaf alle locaties virtueel samen. Studenten profiteren van een training die 1,5 dag duurt en LIVE online plaatsvindt in een virtueel klaslokaal en geleid wordt door een docent. Het enige dat u nodig heeft is een computer met internetverbinding. Alle studiematerialen en andere leermiddelen zullen vooraf per e-mail door ITILstudy naar studenten worden gestuurd. Twee ITILstudy docenten onderwijzen tegelijkertijd studenten tijdens een live klassikale opleiding via het internet (één docent bespreekt de concepten en de andere docent behandelt alle vragen en chatbesprekingen).<br />
De opleiding via het internet is voorzien van allerlei interactieve functies, zoals geïntegreerde online klassikale toetsen, proeftoetsen, chat en een vragenforum. Hierdoor kunnen studenten volledig deelnemen en maximaal profiteren van de lestijd. Ervaren docenten delen geselecteerde casussen, voorbeelden en inzichten ter ondersteuning van ITIL concepten. Studenten ontvangen een waardebon voor het examen om de certificering in te kunnen plannen.
<br>
Voordelen van het virtuele klaslokaalprogramma:
<ul><li>Het brengt de deelnemers vanuit allerlei locaties virtueel samen</li>
<li><b>Voorbeelden en inzichten specifiek voor organisaties en relevant voor de desbetreffende industrie</b> worden door ervaren docenten gedeeld met de studenten</li>
<li>Werknemers zijn al binnen 2 dagen gecertificeerd!</li>
<li>18 PMI PDU's certificaat voor de behoefte aan vervolgstudie van PMP-gecertificeerde professionals.</li>
<li>Aanvullende online opleiding risicomanagement ter waarde van $300 geheel <b>GRATIS!</b></li>
</ul></p>


<p><br> <span class="Header">MOGELIJKHEID C: 2-Daags traditioneel klaslokaal</span></p><hr>
<p>Door deze opleiding te volgen kunnen studenten profiteren van onze interactieve lesstijl en de kennis die zij vergaren tijdens de persoonlijke klassikale instructies die zij krijgen. De student ontvangt al het noodzakelijke studiemateriaal en leermiddelen op locatie (op uw locatie of die van ons). Aan het einde van de tweede dag neemt onze faculteit het certificatie-examen af en zijn uw werknemers gecertificeerd. <br />
Voordelen van het 2-daagse traditionele klassikale programma:

<ul><li>Interactieve lesstijl en het delen van kennis in een klassikale omgeving.</li>
<li><b>Voorbeelden en inzichten die relevant zijn voor de industrie</b> worden gedeeld door ervaren docenten</li>
<li>Werknemers zijn al binnen 2 dagen gecertificeerd!</li>
<li>18 PMI PDU's certificaat voor de behoefte aan vervolgstudie van PMP-gecertificeerde professionals.</li>
<li>Aanvullende online opleiding risicomanagement ter waarde van $300 geheel <b>GRATIS!</b></li>
</ul></p>

<p><br> <span class="Header">MOGELIJKHEID D: 3-Daagse klassikale, op maat gemaakte casestudy</span></p><hr>
<p>Deze opleiding verloopt hetzelfde als de 2-daagse traditionele klassikale opleiding, met een extra dag instructie als aanvulling. Op de derde dag zal de docent de mogelijkheid van uw organisatie om ITIL te implementeren onder de loep nemen en verbeterpunten vaststellen. Door deze mogelijkheid kunnen casestudy's of voorbeelden specifiek voor uw industrie of bedrijf worden ingezet als onderdeel van het programma.<br />
Voordelen van het 2-daagse traditionele klassikale programma:

<ul><li>Interactieve lesstijl en het delen van kennis in een klassikale omgeving.</li>
<li><b>Voorbeelden en inzichten die relevant zijn voor de industrie</b> worden gedeeld door ervaren docenten</li>
<li>Op maat gemaakte casestudy’s specifiek voor de industriële sector, waardoor studenten de concepten en processen van ITIL Foundation tot in detail begrijpen</li>
<li>Werknemers zijn al binnen 2 dagen gecertificeerd!</li>
<li>Aanvullende online opleiding risicomanagement ter waarde van $300 geheel <b>GRATIS!</b></li>
</ul>

Stuur uw gegevens naar ons om u in te schrijven voor een geplande bedrijfsopleiding en/of te profiteren van bedrijfskortingen voor uw bedrijf. Onze bedrijfsvertegenwoordiger zal vervolgens contact met u opnemen  – <a href="/Dutch/Corporate-Overview-nl.asp">NU INSCHRIJVEN!</a> Sommige bedrijven bezitten een geopende betaalrekening voor directe facturering.
</p>


<p> <span class="Header">Contact met ons opnemen</span><br/><br/>
Om u in te schrijven voor een bedrijfsopleiding of voor meer informatie <span class="general-bodyBold"> BELT U ONS NU OP +1-855-234-8454</span><br/>
U kunt ook een e-mail sturen naar <a href="mailto:marketing@itilstudy.com"> marketing@ITILstudy.com </a>of het onderstaande contactformulier invullen:<br/><br/>
<a name="contactus">
<table> 
                <form method="post" action="/Corporate/Corporate-DB.asp" onSubmit="return validate_form(this)">
                  <tr>
                    <td><span class="general-bodyBold"><span class="general-bodyBold">Naam:</span> </td>
                    <td><input type="text" name="Name" size="40" class="TeXtField"></td>
                  </tr>
                  <tr>
                    <td><span class="general-bodyBold"><span class="general-bodyBold">E-mailadres:</span> </td>
                    <td><input type="text" name="EMailID" size="40" class="TeXtField"></td>
                  </tr>
                  <tr>
                    <td><span class="general-bodyBold"><span class="general-bodyBold">Telefoonnummer:</span> </td>
              <td><input type="text" name="Contact" size="40" class="TeXtField"></td>
                  </tr>
				   <tr>
                    <td><span class="general-bodyBold"><span class="general-bodyBold">Vragen/Opmerkingen:</span> </td>
                    <td><textarea name="Query" rows="8" cols="40" class="TeXtFieldTextarea"></textarea></td>
                  </tr>
				  
				  
                  <tr>
                    <td colspan="2" align="center"><div align="center" style="margin-left:25px">
                        <input type="submit" value="Submit" class="ButtonGeneral" style="width:60px;">
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" value="Reset" class="ButtonGeneral" style="width:75px;">
                      </div></td>
                  </tr>
				  
                </form>
           </table>

</div>
<br/><!--<span class="general-bodyBold">To read some of the case studies of how we helped organizations build their project management expertise, <a href="/Corporate/Corporate-Case-Studies.asp">click here</a></span>--></p>
<span class="general-bodyBold">Download onze brochure voor bedrijven om alles te weten te komen over onze opleidingen en de redenen die ten grondslag liggen aan ons grote succes <a href="/Corporate/ITILCorporate-Brochure.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png"></a></span></p>   
</td></tr></table>

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
<div style="display:inline;"> <img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?label=t-fgCJGHqQEQx8Kz6QM&amp;guid=ON&amp;script=0"/> </div>
</noscript>
<!--#include virtual="/includes/connectionClose.asp"-->
<!-- Body Ends -->
<!--#include virtual="/includes/footer-Dutch.html"-->
