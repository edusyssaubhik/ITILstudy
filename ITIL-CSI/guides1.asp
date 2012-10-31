<% 
If Session("FirstName") = "" Then 
Response.Redirect("/memberlogin.asp")
Else
%>

<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerqualitymaterialbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!-- Body Starts -->
<%
Dim kno

If Request.Form("kno") <> "" Then
	kno = Request.Form("kno")
Else
	kno = Session("KNO")
End If		

Session("KNO") = kno

Set objRs = Server.CreateObject("ADODB.Recordset")

strQuery = "SELECT AreaTitle from KArea_CSI WHERE KNo = '" & Session("KNO") & "'"

objRs.Open strQuery, ConnObj

Do Until objRs.EOF

	Session("ChapterName") = objRs("AreaTitle")

objRs.Movenext
Loop
objRs.Close
%>
<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="PageTitle">Study Guides <a href="/ITIL/help.asp#studyguides" style="float:right; margin-right:20px;"><img src="/images/buttons/Help.png" height="20px" style="border-color:#FFFFFF" onmouseover="this.src='/images/buttons/help_h.png'" onmouseout="this.src='/images/buttons/Help.png'"></a></td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><br />
              <div  style="margin-top:-17px; width:95%;"> 
              <!-- Content Start From Here-->
              <div><span class="Header">Dear </span><% If Session("FirstName") = "" Then %><span class="Header">Trial User,</span><% Else %><span class="Header"><% = Session("FirstName") %>&nbsp;<% = Session("LastName") %>, </span><% End If %></div> 
              <p class="SubHeader">Please find below the study guide, fill in the blanks and podcast for this chapter: </p>
              
			  <ul>
			  
			 
			  
			  
	<% 
	
if (Int(kno)=1) then
	%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Introduction</span></td></tr><tr><td><A href="/ITIL-CSIdocs/guides/Chapter1-CSI-Introduction.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;&nbsp;<A href="/ITIL-CSIdocs/guides/Chapter1-CSI-Introduction.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="/ITIL-CSIdocs/flash/Introduction.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIL-CSIdocs/flash/Introduction.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ITIl-CSIdocs/HTML/CSI_Introduction.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIl-CSIdocs/HTML/CSI-Introduction.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-CSIdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIL-CSIPodcast/CSI-Introduction.rss</span><br /> </td></tr><tr><td><a href="/ITIL-CSIdocs/FIB/CSI_Introduction.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table>
	 
   
     
	<%elseif (Int(kno)=2) then%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Principles</span></td></tr><tr><td><A href="/ITIL-CSIdocs/guides/Chapter2-CSI-Principles.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;&nbsp;<A href="/ITIL-CSIdocs/guides/Chapter2-CSI-Principles.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td> <a href="/ITIL-CSIdocs/flash/Principles.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="/ITIL-CSIdocs/flash/Principles.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ITIl-CSIdocs/HTML/CSI_Principles.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIl-CSIdocs/HTML/CSI-Principles.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-CSIdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIL-CSIPodcast/CSI-Principles.rss</span><br /> </td></tr><tr><td><a href="/ITIL-CSIdocs/FIB/CSI_Principles.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table>
    

	
	<%elseif (Int(kno)=3) then%>
 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Processes</span></td></tr><tr><td><A href="/ITIL-CSIdocs/guides/Chapter3-CSI-Processes.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/ITIL-CSIdocs/guides/Chapter3-CSI-Processes.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="/ITIL-CSIdocs/flash/Processes.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIL-CSIdocs/flash/Processes.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ITIl-CSIdocs/HTML/CSI_Processes.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIl-CSIdocs/HTML/CSI-Processes.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-CSIdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIL-CSIPodcast/CSI-Processes.rss</span><br /></td></tr><tr><td><a href="/ITIL-CSIdocs/FIB/CSI_Process.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table>
     
	
	 <%elseif (Int(kno)=4) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Methods and Techniques</span></td></tr><tr><td><A href="/ITIL-CSIdocs/guides/Chapter4-CSI-Methods-and-Techniques.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/ITIL-CSIdocs/guides/Chapter4-CSI-Methods-and-Techniques.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td> <a href="/ITIL-CSIdocs/flash/Methods-and-Techniques.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIL-CSIdocs/flash/Methods-and-Techniques.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ITIl-CSIdocs/HTML/CSI-Methods-and-Techniques.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIl-CSIdocs/HTML/CSI-Methods-and-Techniques.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-CSIdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIL-CSIPodcast/CSI-Methods-and-Techniques.rss</span><br /></td></tr><tr><td><a href="/ITIL-CSIdocs/FIB/CSI_Methods.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table> 
      

	
	<%elseif (Int(kno)=5) then
	%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Organising</span></td></tr><tr><td><A href="/ITIL-CSIdocs/guides/Chapter5-CSI-Organising.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"> <img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/ITIL-CSIdocs/guides/Chapter5-CSI-Organising.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="/ITIL-CSIdocs/flash/Organising-for-CSI.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<A href="/ITIL-CSIdocs/flash/Organising-for-CSI.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ITIl-CSIdocs/HTML/OrganisingforCSI.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIl-CSIdocs/HTML/Organising-for-CSI.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-CSIdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIL-CSIPodcast/Organising-for-CSI.rss</span><br /></td></tr><tr><td><a href="/ITIL-CSIdocs/FIB/CSI_Organizing.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table> 
    

	
	
	<%elseif (Int(kno)=6) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Technology</span></td></tr><tr><td><A href="/ITIL-CSIdocs/guides/Chapter6-CSI-Technology.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/ITIL-CSIdocs/guides/Chapter6-CSI-Technology.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="/ITIL-CSIdocs/flash/Technology-for-CSI.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIL-CSIdocs/flash/Technology-for-CSI.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ITIl-CSIdocs/HTML/TechnologyforCSI.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIl-CSIdocs/HTML/Technology-for-CSI.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-CSIdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>. <BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIL-CSIPodcast/Technology-for-CSI.rss</span><br /></td></tr><tr><td><a href="/ITIL-CSIdocs/FIB/CSI_Technology.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table>

	 <%elseif (Int(kno)=7) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Implementing</span></td></tr><tr><td><A href="/ITIL-CSIdocs/guides/Chapter7-CSI-Implementing.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/ITIL-CSIdocs/guides/Chapter7-CSI-Implementing.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="/ITIL-CSIdocs/flash/Implementing.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIL-CSIdocs/flash/Implementing.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ITIl-CSIdocs/HTML/ImplementingCSI.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIl-CSIdocs/HTML/Implementing-CSI.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-CSIdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>. <BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIL-CSIPodcast/Implementing-CSI.rss</span><br /></td></tr><tr><td><a href="/ITIL-CSIdocs/FIB/CSI_Implementing.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table>


<%elseif (Int(kno)=8) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Critical Success Factor & Risk</span></td></tr><tr><td><A href="/ITIL-CSIdocs/guides/Chapter8-CSI-Challenges-Critical-Success-factors-and-risks.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/ITIL-CSIdocs/guides/Chapter8-CSI-Challenges-Critical-Success-factors-and-risks.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="/ITIL-CSIdocs/flash/Challenges-Critical-Success-factors-and-Risks.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIL-CSIdocs/flash/Challenges-Critical-Success-factors-and-Risks.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ITIl-CSIdocs/HTML/ChallengesCriticalSuccessFactorsAndRisks.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIl-CSIdocs/HTML/Challenges-Critical-Success-factors-and-risks.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-CSIdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>. <BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIL-CSIPodcast/Challenges-Critical-Success-factors-and-risks.rss</span><br /></td></tr><tr><td><a href="/ITIL-CSIdocs/FIB/CSI_CRITICAL_SUCCESS_FACTOR_&_RISK.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table>


        
<%	End If %>
              </ul>
             <p class="Header">Key points covered</p>
               <ul>
                      <li>Explain the goals, objectives and scope of ITIL core processes and functions.</li>
                      <li>List the 'Lesson Objectives' for each chapter.</li>
                      <li>Define the important terms and concepts relevant to the chapter.</li>
                      <li>Explain roles and responsibilities relevant to the processes and functions.</li>
                 
                       <!-- <li>Explains roles and responsibilities relevant to the functions/processes.</li>-->
                     
                    </ul>
                
              <div>
                <!-- Content End From Here-->
                <!--#include virtual="/includes/connectionClose.asp"-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
<% End If %>