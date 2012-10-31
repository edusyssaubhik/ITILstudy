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

strQuery = "SELECT AreaTitle from KArea_PPO WHERE KNo = '" & Session("KNO") & "'"

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
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Introduction to PPO </span></td></tr><tr><td><A href="/ITIL-PPOdocs/guides/chapter-1.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;&nbsp;<A href="/ITIL-PPOdocs/guides/chapter-1.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="/ITIL-PPOdocs/flash/chapter-1.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIL-PPOdocs/flash/chapter-1.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-PPOdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIl-PPOdocs/podcast/chapter-1.rss</span><br /> </td></tr></table>
	 
   
     
	<%elseif (Int(kno)=2) then%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Capacity Management</span></td></tr><tr><td><A href="/ITIL-PPOdocs/guides/chapter-2.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png" alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;&nbsp;<A href="/ITIL-PPOdocs/guides/chapter-2.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td> <a href="/ITIL-PPOdocs/flash/chapter-2.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="/ITIL-PPOdocs/flash/chapter-2.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-PPOdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIl-PPOdocs/podcast/chapter-2.rss</span><br /> </td></tr></table>
    

	
	<%elseif (Int(kno)=3) then%>
 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Availability Management</span></td></tr><tr><td><A href="/ITIL-PPOdocs/guides/chapter-3.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/ITIL-PPOdocs/guides/chapter-3.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="/ITIL-PPOdocs/flash/chapter-3.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIL-PPOdocs/flash/chapter-3.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-PPOdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIl-PPOdocs/podcast/chapter-3.rss</span><br /></td></tr></table>
     
	
	 <%elseif (Int(kno)=4) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">IT Service Continuity Management</span></td></tr><tr><td><A href="/ITIL-PPOdocs/guides/chapter-4.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/ITIL-PPOdocs/guides/chapter-4.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td> <a href="/ITIL-PPOdocs/flash/chapter-4.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIL-PPOdocs/flash/chapter-4.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-PPOdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIl-PPOdocs/podcast/chapter-4.rss</span><br /></td></tr></table> 
      

	
	<%elseif (Int(kno)=5) then
	%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Information Security Management</span></td></tr><tr><td><A href="/ITIL-PPOdocs/guides/chapter-5.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/ITIL-PPOdocs/guides/chapter-5.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="/ITIL-PPOdocs/flash/chapter-5.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<A href="/ITIL-PPOdocs/flash/chapter-5.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-PPOdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIl-PPOdocs/podcast/chapter-5.rss</span><br /></td></tr></table> 
    

	
	
	<%elseif (Int(kno)=6) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Demand Management </span></td></tr><tr><td><A href="/ITIL-PPOdocs/guides/chapter-6.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/ITIL-PPOdocs/guides/chapter-6.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="/ITIL-PPOdocs/flash/chapter-6.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIL-PPOdocs/flash/chapter-6.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-PPOdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>. <BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIl-PPOdocs/podcast/chapter-6.rss</span><br /></td></tr></table>

	 <%elseif (Int(kno)=7) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">PPO roles and responsibilities</span></td></tr><tr><td><A href="/ITIL-PPOdocs/guides/chapter-7.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/ITIL-PPOdocs/guides/chapter-7.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="/ITIL-PPOdocs/flash/chapter-7.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIL-PPOdocs/flash/chapter-7.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-PPOdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>. <BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIl-PPOdocs/podcast/chapter-5.rss</span><br /></td></tr></table>


<%elseif (Int(kno)=8) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Technology and implementation cosideration</span></td></tr><tr><td><A href="/ITIL-PPOdocs/guides/chapter-8.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/ITIL-PPOdocs/guides/chapter-8.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="/ITIL-PPOdocs/flash/chapter-8.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIL-PPOdocs/flash/chapter-8.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-PPOdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>. <BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIl-PPOdocs/podcast/chapter-8.rss</span><br /></td></tr></table>

        
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