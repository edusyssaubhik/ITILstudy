<!--#include virtual="/metatags/comprehensive_metatag.html"-->
<!--#include virtual="/includes/headermetaGerman.asp"-->
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
            <td width="73%" class="breadcrumb">Startseite &raquo; FIRMENTRAININGS &raquo; �berblick und Vorteile</td>
          </tr>
           <tr>
            <!--#include virtual="/includes/innerLeftMenu-German.asp"-->
            <td rowspan="4" background="/images/back/left_line.jpg" class="general-body"><h1 class="PageTitle">ITILSTUDY � IHR ZUVERL�SSIGER PARTNER F�R FIRMENTRAININGS</h1>
            <p>ITILstudy schult in �ber <a href="/german/Pr�fungserfolg.asp">160 L�ndern in mehr als 3500 Unternehmen</a>. Einige der Unternehmen, die spezielle Firmenkondition ausgehandelt wurden bzw. firmeninterne Kurse geplant sind, sind weiter unten aufgelistet. <br/></p>
			
<table>
			<tbody><tr><td align="center" width="662px"><img src="/images/buttons/1.jpg" height="60" hspace="25"><img src="/images/buttons/2.jpg" height="60" hspace="35"><img src="/images/buttons/3.jpg" height="60" hspace="30"></td></tr>
			
			<tr><td align="center" width="662px"><img src="/images/buttons/5.jpg" height="60" hspace="15"><img src="/images/buttons/6.jpg" height="79" hspace="20"><img src="/images/buttons/7.jpg" height="60" hspace="20"><img src="/images/buttons/8.jpg" height="60" hspace="10"></td></tr>
			
			<tr><td align="center" width="662px" style="padding-top:17px;"><img src="/images/buttons/9.jpg" height="60" hspace="26"><img src="/images/buttons/10.jpg" height="79" hspace="33"><img src="/images/buttons/11.jpg" height="60" hspace="15"></td></tr>
			
			<tr><td align="center" width="662px" style="padding-top:35px;"><img src="/images/buttons/13.jpg" height="60" hspace="20"><img src="/images/buttons/14.jpg" height="60" hspace="55"><img src="/images/buttons/15.jpg" height="60" hspace="15"></td></tr>
			
			<tr><td align="center" width="662px" style="padding-top:35px;"><img src="/images/buttons/12.jpg" height="60" hspace="10"><img src="/images/buttons/16.jpg" height="60" hspace="20"><img src="/images/buttons/17.jpg" height="60" hspace="18"><img src="/images/buttons/18.jpg" height="60" hspace="18"></td></tr>
            
             <tr><td align="center" width="662px" style="padding-top:35px;"><img src="/images/buttons/19.jpg" height="60" hspace="10"><img src="/images/buttons/20.jpg" height="60" hspace="15"><img src="/images/buttons/4.jpg" height="60" hspace="25"></td></tr>
			
			
			</tbody></table>
			
			
	<p>
ITIL Foundation in<sup>&reg;</sup> ist die Basis Qualifikation, die den Kandidaten ein Bewusstsein f�r die Schl�sselelemente, die Konzepte und die Terminologie des ITIL-<sup>&reg;</sup> -Service-Lebenszyklus vermittelt. Das ITIL<sup>&reg;</sup> Foundation Certificate in IT Service Management bescheinigt, dass der Kandidat Kenntnisse der Terminologie, Struktur und von grundlegenden Konzepten erlangt hat und die Grundprinzipien der Anwendung von ITIL f�r das IT Service Management begriffen hat.</p>

		
	<p class="Header">Warum w�hlen f�hrende globale Unternehmen ITILstudy als Partner?</p>
	<table  border="0">
	<tr><td >
	<p>ITILstudy ist die effizienteste und kosteng�nstige Art, ITIL Foundation zertifiziert zu werden:</p>
        <ul>
<li><b>Messbaren Erfolg:</b> Unsere Kurse in der ITIL Examen Vorbereitung haben  eine nachgewiesene Erfolgsbilanz von 99,2 % Preise </li>
<li> <b>Erfahrene Lehrer:</b> Wir verdanken unsere hohe Erfolgsquote (99,2 %) und das gute Teilnehmer-Feedback zur Qualit�t unseren Lehrern. F�r weitere Informationen zu den Lehrern <a href="/german/Trainer.asp">klicken Sie hier</a> </li>
<li> <b>100 % Geld-zur�ck-Garantie:</b> ITILstudy bietet Ihnen Investitionsschutz und versichert Ihnen, dass kein einziger Euro in das Training vergeudet wird. Wir stellen sicher, dass unsere Sch�ler die ITIL Foundation-Pr�fung bestehen oder wir �bergeben die komplette Pr�fungsgeb�hr zur�ck. <a href="/german/Geld-zur�ck-Garantie.asp">Mehr</a>  </li>
<li> <b>Flexible Kursoptionen:</b> ITILstudy versteht, dass die verschiedene Organisationen unterschiedliche Bed�rfnisse und Rahmenbedingungen haben. Daher bietet es den Unternehmen flexible Kursoptionen an:</li>
            <ul>
<li> <b>Kurse bei Ihnen vor Ort:</b> Wenn dies von Ihnen bevorzugt wird, dann gibt es die M�glichkeit die Lernmodule ganz konkret an die Bed�rfnisse Ihrer Organisation und Ihrem Zeitplan anzupassen</li>
<li> <b>Wochenend-Kurse:</b> Kurse am Wochenende erleichtern die Teilnahme ihrer Fachleute, die einen vollen Terminkalender haben</li>
<li> <b>Spezielle Standorte:</b> Wir f�hren die Kurse auch in gehobenen Hotels und Konferenzzentren durch, um Ihnen einen besonders hohen Komfort zu gew�hrleisten</li>
</ul><ul>
</td> </tr></table>

<p> <span class="Header">KURSANGEBOTE:</span><br/>
<p>ITILstudy ITIL<sup>&reg;</sup> Foundation-Kurse haben das Ziel, Studierenden ein praktische Verst�ndnis von IT Service Management-Konzepten zu vermitteln  sowie optimal auf die Zertifizierungspr�fung vorzubereiten. In diesem Abschnitt werden die flexiblen Kursangebote aufgelistet, die wir f�r die ITIL Foundation Zertifizierung anbieten.</p>

<table border="0" align="center" width="100%" cellspacing="0" cellpadding="2" class="corporateTable">

                          <tr >
                            <th>Kursangebote</th>
                            <th>Dauer</th>
                            <th>Ausbildung-Format</th>
                            <th>Pr�fungsgeb�hr inbegriffen?</th>
                            <th>ITIL Foundation Pr�fung im Kurs enthalten?</th>
                          </tr>
                          <tr align="center">
                            <td>A. Online-Selbststudium</td>
                              <td>	90 Tage Zugang</td>	
                              <td>Selbststudium</td>	
                              <td>Ja</td>	
                              <td>Nein, Gutschein wird zur Verf�gung gestellt</td>
                          </tr>
                          <tr align="center">
                            <td>B. Virtuelles Klassenzimmer</td>	
                              <td>2 Tage</td>	
                              <td>Kursleiter Live Online</td>	
                              <td>Ja</td>	
                              <td>Nein, Gutschein wird zur Verf�gung gestellt</td>
                          </tr>
                          <tr align="center">
                            <td>C. Herk�mmlicher Kurs	</td>
                              <td>2 Tage</td>	
                              <td>Kursleiter</td>	
                              <td>Ja</td>	
                              <td>Ja</td>
                          </tr>
                          <tr align="center">
                            <td>D. Herk�mmlicher Kurs und ma�geschneiderte Workshops (branchenspezifische Fallstudien)</td>	
                              <td>3 Tage</td>	
                              <td>Kursleiter</td>	
                              <td>Ja</td>	
                              <td>Ja</td>
                          </tr>
                        
                        </table>

<p><br> <span class="Header">OPTION A: Online Selbststudium</span></p><hr>
<p>Diese Schulung ist an jedem Ort und zu jeder Zeit erreichbar. Sie ist f�r Teams in mehreren Zeitzonen und Orten  geeignet. Da der Kursinhalt online verf�gbar ist, k�nnen Studenten in ihrem eigenen Tempo lernen und  die Zertifizierungspr�fung an einem Standort ihnen bequemen, lokalen Pr�fungsort durchf�hren. Die Vorteile des Online-Selbststudiums sind:
<ul><li>Jederzeit und �berall: Von �berall auf der Welt zu jeder Zeit zug�nglich. Geeignet f�r Teams, die durch Zeitzonen und unterschiedlichen Orten getrennt sind</li>
<li>18 PMI<sup>&reg;</sup> genehmigte PDUs f�r das Zertifikat, helfen bei der Re-Zertifizierung von PMP <sup>&reg;</sup> zertifizierten Experten.</li></ul></p>

<p><br> <span class="Header">OPTION B: Virtuelles Klassenzimmer</span></p><hr>
<p>Diese Schulung bringt die Teilnehmer von einem beliebigen Standort zusammen. Die Teilnehmer profitieren von 1,5 Seminartagen, die durch einen Lehrer gef�hrt werden und den sie live und  online verfolgen k�nnen. Es wird als nur ein Computer mit Internetverbindung ben�tigt. Alle Studienmaterialien und andere Lehrmittel werden den Teilnehmer rechtzeitig vor Kursbeginn per Mail von ITILstudy zugeschickt. Zwei ITILstudy Lehrer unterrichten die Teilnehmer virtuell. Der eine Lehrer erl�utert die Konzepte, w�hrend der zweite Lehrer die Fragen der Teilnehmer beantwortet und die Diskussionen leitet.<br />
Die Internet-basierten Kurse  umfassen interaktive Features, wie ein integriertes Online-Klassenzimmer-Quiz, mock Test, Chat und ein Fragen- und Antwort- Forum und erm�glichen den Teilnehmern so voll teilzunehmen und einen maximalen Nutzen zu erhalten.  Mit ausgew�hlten Fallstudien, praxisnahen Beispielen werden von erfahrenen Lehrern die ITIL Konzepte vermittelt. Ein Examens-Gutschein wird den Teilnehmern f�r die Zertifizierung zur Verf�gung gestellt.
<br>
Vorteile des virtuellen Klassenzimmer-Programms:
<ul><li>Bringt die Teilnehmer von einem beliebigen Standort praktisch zusammen</li>
<li><b>Spezifische Organisation und Industrie relevante</b> Beispiele und Erkenntnisse von erfahrenen Lehrern erteilt</li>
<li> Mitarbeiter sind in 2 Tagen zertifiziert!</li>
<li>18 PMI<sup>&reg;</sup> genehmigte PDUs f�r das Zertifikat, helfen bei der Re-Zertifizierung von PMP <sup>&reg;</sup> zertifizierten Experten.</li>
<li> Kostenloser Risiko-Management Online-Kurs im Wert von 300 Dollars!</li></ul></p>


<p><br> <span class="Header">OPTION C: Herk�mmlicher 2-Tages-Kurs</span></p><hr>
<p>Bei Besuch dieses Kurses profitieren die Teilnehmer durch den interaktiven Unterrichtsstil und die Erkenntnisse, die durch den partizipieren, pers�nlichen Klassenunterricht vermittelt werden. Alle die notwendige Studienmaterial und Studienhilfsmittel werden den Teilnehmern am Veranstaltungsort (an Ihrem Standort oder bei uns) zur Verf�gung gestellt. Am Ende des zweiten Tages wird die Zertifizierungspr�fung von unserem Lehrer durchgef�hrt und Ihre Mitarbeiter werden in Anschluss normalerweise zertifiziert sein. <br>
Die Vorteile des 2-Tages-Programm im Rahmen der herk�mmlichen Kurs:

<ul><li> Interaktive Lehrstil und Wissensaustausch in einem Klassenzimmer</li>
<li> <b>Industrie relevante</b> Beispiele und Erkenntnisse von erfahrenen Lehrer erteilt</li>
<li> Mitarbeiter sind in 2 Tagen zertifiziert!</li>
<li>  18 PMI<sup>&reg;</sup> genehmigte PDUs f�r das Zertifikat, helfen bei der Re-Zertifizierung von PMP <sup>&reg;</sup> zertifizierten Experten.</li>
<li> Kostenloser Risiko-Management Online-Kurs im Wert von 300 Dollars!</li></ul></p>

<p><br> <span class="Header">OPTION D: 3 Tage Unterricht + ma�geschneiderte Fallstudie</span></p><hr>
<p>Diese Schulung ist �hnlich,  wie die 2-Tage herk�mmlichen Unterricht jedoch mit einem zus�tzlichen Tag. Am dritten Tag hilft der Lehrer die F�higkeit Ihres Unternehmens bei der ITIL Implementierung zu beurteilen und zu ermitteln in welchen Bereichen Verbesserungen sinnvoll sind. Diese Option erm�glicht Industrie- und/oder unternehmensspezifische Fallstudien als Teil des Programms zu verwenden.Diese Schulung ist �hnlich,  wie die 2-Tage herk�mmlichen Unterricht jedoch mit einem zus�tzlichen Tag. Am dritten Tag hilft der Lehrer die F�higkeit Ihres Unternehmens bei der ITIL Implementierung zu beurteilen und zu ermitteln in welchen Bereichen Verbesserungen sinnvoll sind. Diese Option erm�glicht Industrie- und/oder unternehmensspezifische Fallstudien als Teil des Programms zu verwenden.<br>

Vorteile des 3-Tages-Programm im Rahmen des  traditionellen Klassenzimmer-Unterrichts

<ul><li>Interaktive Lehrstil und den Wissensaustausch in einem Klassenzimmer</li>
<li><b>Industrie relevante</b> Beispiele und Erkenntnisse von erfahrenen Lehrer erteilt</li>
<li>Ma�geschneiderte Fallstudien aus der ihrem Industriesektor erm�glichen den Teilnehmern, die Konzepte und Prozesse der ITIL Foundation in praxisnahen Details zu verstehen</li>
<li>Mitarbeiter in 2 Tagen zertifiziert!</li>
<li> Kostenloser Risiko-Management Online-Kurs im Wert von  300 Dollars!</li></ul>

Zur Anmeldung f�r einen geplanten firmeninternen Kurs und/oder f�r eine Firmen-Erm��igung, f�llen Sie  bitte die Anmeldung aus. Einer unserer Firmenansprechpartner  wird Sie kontaktieren. Einige Unternehmen haben ein Abrechnungskonto f�r die direkte Abrechnung bereits etabliert.
</p>


<p> <span class="Header">Kontaktieren Sie uns</span><br/><br/>
Registrieren Sie sich f�r einen firmeninternen Kurs oder f�r weitere Informationen<span class="general-bodyBold"> rufen Sie uns jetzt an +4969 505027 386</span><br/>
Sie k�nnen auch uns per e-Mail <a href="mailto:marketing@itilstudy.com"> marketing@ITILstudy.com </a>oder f�llen Sie unten stehende Formular kontaktieren:<br/><br/>
<a name="contactus">
<table> 
                <form method="post" action="/Corporate/Corporate-DB.asp" onSubmit="return validate_form(this)">
                  <tr>
                    <td><span class="general-bodyBold"><span class="general-bodyBold">Name:</span> </td>
                    <td><input type="text" name="Name" size="40" class="TeXtField"></td>
                  </tr>
                  <tr>
                    <td><span class="general-bodyBold"><span class="general-bodyBold">E-Mail-Adresse:</span> </td>
                    <td><input type="text" name="EMailID" size="40" class="TeXtField"></td>
                  </tr>
                  <tr>
                    <td><span class="general-bodyBold"><span class="general-bodyBold">Telefonnummer.: </span> </td>
              <td><input type="text" name="Contact" size="40" class="TeXtField"></td>
                  </tr>
				   <tr>
                    <td><span class="general-bodyBold"><span class="general-bodyBold">Fragen/Kommentare: </span> </td>
                    <td><textarea name="Query" rows="8" cols="40" class="TeXtFieldTextarea"></textarea></td>
                  </tr>
				  
				  
                  <tr>
                    <td colspan="2" align="center"><div align="center" style="margin-left:25px">
                        <input type="submit" value="absenden" class="ButtonGeneral" style="width:60px;">
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" value="zur�cksetzen" class="ButtonGeneral" style="width:75px;">
                      </div></td>
                  </tr>
				  
                </form>
           </table>

</div>
<br/><!--<span class="general-bodyBold">To read some of the case studies of how we helped organizations build their project management expertise, <a href="/Corporate/Corporate-Case-Studies.asp">click here</a></span>--></p>
<span class="general-bodyBold">Laden Sie unsere Unternehmensbrosch�re und erfahren Sie mehr �ber unseren Kurs und die Gr�nde f�r unseren Erfolg.<a href="/Corporate/ITILCorporate-Brochure.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png"></a></span></p>   
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
<!--#include virtual="/includes/footer.html"-->
