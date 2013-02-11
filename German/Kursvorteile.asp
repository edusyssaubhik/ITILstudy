<!--#include virtual="/German/metatags/courseBenefits_metatag.html"-->
<!--#include virtual="/includes/headermetaGerman.asp"-->
<!--#include virtual="/includes/innerwhyusbanner.html"-->
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
%>
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="25%" >&nbsp;</td>
            <td width="73%" class="breadcrumb">Home &raquo; WARUM UNS &raquo; Kurse vorteile</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu-German.asp"-->
<td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px; width:97%;">
              <br /><!-- Content Start From Here-->
			   <% If Session("CountryOrigin") <> "India" Then %>
              <h1 class="PageTitle">NEUN GR�NDE F�R  ITILSTUDY ALS TRAININGSPARTNER </h1>
                 <% Else %>
             <h1 class="PageTitle">Seven reasons why you should select ITILstudy as your training partner</h1>
               <% End If %>
              
             
                
              <ul type="1">
              
              <li>
                <span class="SubHeader">Hervorragende Trainer:  </span>
                 ITILstudy hat erfahrene und professionelle Trainer, die eine APMG-Zulassung nachweisen k�nnen. Sie verf�gen �ber umfassende Branchenerfahrung bzw. Erfahrungen im IT Service Management und haben ein umfangreiches ��Train-the-trainer�-Programm absolviert, das sowohl die spezifische ITILstudy Trainingsmethode umfasst als auch den auf Unterricht mit Erwachsenen ausgerichtet ist, um  den Teilnehmern ein ansprechendes Training zu bieten. <a href="/german/Trainer.asp">Mehr</a>
                </li>
                   <li>  <span class="SubHeader"> Wissenschaftlich fundierte effiziente und ergebnisorientiere Lehrmethode:</span>
             Die ITILstudy Pr�senztrainings wurden von durch die ITIL Foundation zertifizierten Experten entwickelt und getestet und von APMG genehmigt. Um die Lernerfahrung zu verbessern und die Aufnahmef�higkeit zu f�rdern, nutzen unsere Kurse die drei prim�ren Lernstile, d. h. eine Kombination aus visuellem (Pr�sentationen), auditivem (verbale Anweisungen, Interaktionen usw.) und kin�sthetischem (do-it-yourself) Lernstil. Verschiedene interaktive Methoden wie z.B.  erfahrungsbezogenes Lernen, Kleingruppen, praktische �bungen, Wiederholungen, regelm��ige Bewertung und Fallbeispiele werden ausgiebig verwendet. </li>
                 
              
              <li>
                <span class="SubHeader">100% Geldzur�ckgarantie:   </span> Unser Pr�senztraining gew�hrleistet, dass Sie die ITIL Foundation- Pr�fung bestehen, andernfalls  erstatten wir Ihnen die Kursgeb�hr zur�ck. <a href="/german/Geld-zur�ck-Garantie.asp">Mehr</a></li>
                
                
                
              <li>
                <span class="SubHeader">Bestes Preis-Leistungs-Verh�ltnis: </span>
               Bestes Preis-Leistungs-Verh�ltnis: 2 Tage ITIL Foundation- Pr�senztraining bereits ab � 890 pro Person. <a href="/german/ITIL-Kurs.asp">Mehr </a>
           
                 </li>
              <li>
              
                <span class="SubHeader">� 100 Fr�hbucher-Erm��igung: </span> Sie erhalten � 890 Fr�hbucher-Erm��igung, wenn Sie den Kurs 12 Tage vor Beginn des Kurses buchen. Abz�glich der Erm��igung betr�gt die Kursgeb�hr � 890 (zzgl. MwSt.). <a href="/german/ITIL-Kurs.asp">Mehr </a>
   
                </li>
                
              <li>
                <span class="SubHeader">Zugang zu ITILstudy Vorbereitungsmaterial:</span>
             Die Teilnehmer erhalten Zugang zu unserem Kurs-Vorbereitungsmaterial, gleich nach Erhalt der Bezahlung.</li>
             
              <li> <span class="SubHeader">Kostenlose Risk Management -Zertifizierung:</span>
	 
Die Teilnehmer von ITILstudy Kursen erhalten kostenlosen Zugang zum Onlinekurs Risk Management (im Wert von $ 300), angeboten von <a href="http://www.RMstudy.com">www.RMstudy.com</a>. 
   </li>
               
                 <li> <span class="SubHeader">Ausgezeichnete Lernumgebung: </span>
	 
Die Trainings werden in der Regel in gut zu erreichenden erstklassigen Hotels oder Seminarzentren durchgef�hrt, die ein ideales Lernumfeld bieten. Snacks und Kaffee/Tee werden w�hrend des Trainings angeboten. 
   </li>
              
             <li>
                <span class="SubHeader">PMI genehmigte PDUs: </span>
               F�r den ITIL Foundation Pr�senzkurs erhalten Sie von ITILstudy 18 PDUs, die Sie f�r Ihre Re-Zertifizierung einsetzen k�nnen.<a href="/german/PMI_PDU.asp"> Mehr </a> 
			   
			  
               
                </li>
                  
              <!-- Content End From Here-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer-German.html"-->
