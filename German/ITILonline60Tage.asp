<!--#include virtual="/includes/headermetaGerman.asp"-->
<!--#include virtual="/includes/innerwhyusbanner.html"-->
<!--#include virtual="/metatags/comprehensive_metatag.html"-->
<!-- Body Starts -->
<link href="css/style.css" rel="stylesheet" type="text/css" />
	<%
	Dim item_number 
	'rqAction  =  Request.Form("action")
		rqAction  =  Request.QueryString("action")
	'Response.write("Test	"&rqAction)
	rqType    =  Request.Form("type")
	item_number     =  Request.Form("item_number")
	
	%>
<script type="text/javascript">
function showVideo(){
window.open('/ITILdocs/tour/screen-video.html');
}
</script>

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="25%" >&nbsp;</td>
            <td width="73%" class="breadcrumb">&nbsp;</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu-German.asp"-->
<td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px; width:97%;">
                <!-- Content Start From Here-->
                <p> Handb�cher (Lernunterlagen), Kapiteltests und Podcasts f�r alle Kapitel: 60 Tage (2 Monate)</p>

<span class="Sub_Header">Sie erhalten 60 Tage (2 Monate) Zugang zu folgenden Online-Unterlagen:</span>
                <ol>
                  <li> Lernhandb�cher (Folien): Erkl�ren Ziel, Zweck, Inhalt und Umfang und die Grundkonzepte der ITIL Kernprozesse � und funktionen sowie weitere Syllabus Bereiche von ITIL. </li>
                  <li> Kapiteltests und Evaluierungstests: Diese Tests pr�fen das Verst�ndnis des Teilnehmers hinsichtlich des Kapitelinhalts.</li>
                 <li> L�ckentests: Die L�ckentests helfen dem Teilnehmer, sich die Schl�sselbegriffe jedes Kapitels zu merken.   </li>
				 <li> APMG Beispieltest: Um ein Gef�hl f�r die echte ITIL Foundation Pr�fung zu bekommen, machen Sie APMGs Beispieltest als Teil unseres Online-Kurses und werten Sie Ihre Antworten mit den mitgegebenen L�sungen aus. </li>
				 <li> Mock Tests: Dieser Test wird Ihnen helfen, sich noch besser f�r die Pr�fung vorzubereiten sowie eventuelle Schwachstellen zu verbessern. Zugang zu diesem Test ist erst nach Beendigung der Kapitel- und Evaluierungstests m�glich.  </li>
				 <li> PDU Zertifikat: Sie erhalten ein Zertifikat mit 18 PMI PDUs, welches als Qualifikationsnachweis f�r Ihre Re-Zertifizierung als PMP gilt.</li></ol>
				 
				 <p>Eine Tour des ITIL Foundation Online-Kurses erhalten Sie <a href="" onclick="showVideo();">hier</a>.</p>
				 <p>Eine Liste der Kapitel aus dem ITILstudy Foundation Online-Kurs erhalten Sie <a href="/Onlinecourse-syllabus.asp">hier</a>.</p>
			

                <!-- Content End From Here-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer-German.html"-->
