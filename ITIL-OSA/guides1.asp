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

strQuery = "SELECT AreaTitle from KArea_OSA WHERE KNo = '" & Session("KNO") & "'"

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
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Introduction to Service Management</span></td></tr><tr><td><A href="/ITIL-OSAdocs/guides/Introduction-to-Service-Management.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;&nbsp;<A href="/ITIL-OSAdocs/guides/Introduction-to-Service-Management.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="/ITIL-OSAdocs/flash/Introduction.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIL-OSAdocs/flash/Introduction.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ITIl-OSAdocs/HTML/Introduction-OSA.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIl-OSAdocs/HTML/Introduction-OSA.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-OSAdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIl-OSAdocs/ITIL-OSAPodcast/Introduction.rss</span><br /> </td></tr><tr><td><a href="/ITIL-OSAdocs/FIB/OSA Chap 1.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table>
	 
   
     
	<%elseif (Int(kno)=2) then%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Event Management</span></td></tr><tr><td><A href="/ITIL-OSAdocs/guides/Event-Management.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;&nbsp;<A href="/ITIL-OSAdocs/guides/Event-Management.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td> <a href="/ITIL-OSAdocs/flash/Event-Management.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="/ITIL-OSAdocs/flash/Event-Management.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ITIl-OSAdocs/HTML/Event-Management.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIl-OSAdocs/HTML/Event-Management.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-OSAdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIl-OSAdocs/ITIL-OSAPodcast/Event-Management.rss</span><br /> </td></tr><tr><td><a href="/ITIL-OSAdocs/FIB/OSA Chap 2.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table>
    

	
	<%elseif (Int(kno)=3) then%>
 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Incident Management</span></td></tr><tr><td><A href="/ITIL-OSAdocs/guides/Incident-Management.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/ITIL-OSAdocs/guides/Incident-Management.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="/ITIL-OSAdocs/flash/Incident-Management.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIL-OSAdocs/flash/Incident-Management.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ITIl-OSAdocs/HTML/Incident-Management.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIl-OSAdocs/HTML/Incident-Management.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-OSAdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIl-OSAdocs/ITIL-OSAPodcast/Incident-Management.rss</span><br /></td></tr><tr><td><a href="/ITIL-OSAdocs/FIB/OSA Chap 3.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table>
     
	
	 <%elseif (Int(kno)=4) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Request Fulfilment</span></td></tr><tr><td><A href="/ITIL-OSAdocs/guides/Request-Fulfilment.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/ITIL-OSAdocs/guides/Request-Fulfilment.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td> <a href="/ITIL-OSAdocs/flash/Request-Fulfillment.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIL-OSAdocs/flash/Request-Fulfillment.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ITIl-OSAdocs/HTML/Request-Fulfilment.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIl-OSAdocs/HTML/Request-Fulfilment.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-OSAdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIl-OSAdocs/ITIL-OSAPodcast/Request-Fulfilment.rss</span><br /></td></tr><tr><td><a href="/ITIL-OSAdocs/FIB/OSA Chap 4.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table> 
      

	
	<%elseif (Int(kno)=5) then
	%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Problem Management</span></td></tr><tr><td><A href="/ITIL-OSAdocs/guides/Problem-Management.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/ITIL-OSAdocs/guides/Problem-Management.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="/ITIL-OSAdocs/flash/Problem-Management.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<A href="/ITIL-OSAdocs/flash/Problem-Management.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ITIl-OSAdocs/HTML/Problem-Management.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIl-OSAdocs/HTML/Problem-Management.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-OSAdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIl-OSAdocs/ITIL-OSAPodcast/Problem-Management.rss</span><br /></td></tr><tr><td><a href="/ITIL-OSAdocs/FIB/OSA Chap 5.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table> 
    

	
	
	<%elseif (Int(kno)=6) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Access Management</span></td></tr><tr><td><A href="/ITIL-OSAdocs/guides/Access-Management.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/ITIL-OSAdocs/guides/Access-Management.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="/ITIL-OSAdocs/flash/Access-Management.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIL-OSAdocs/flash/Access-Management.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ITIl-OSAdocs/HTML/Access-Management.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIl-OSAdocs/HTML/Access-Management.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-OSAdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>. <BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIl-OSAdocs/ITIL-OSAPodcast/Access-Management.rss</span><br /></td></tr><tr><td><a href="/ITIL-OSAdocs/FIB/OSA Chap 6.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table>

	 <%elseif (Int(kno)=7) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Service Desk</span></td></tr><tr><td><A href="/ITIL-OSAdocs/guides/Service-Desk.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/ITIL-OSAdocs/guides/Service-Desk.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="/ITIL-OSAdocs/flash/Service-Desk.html" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIL-OSAdocs/flash/Service-Desk.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ITIl-OSAdocs/HTML/Service-Desk.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIl-OSAdocs/HTML/Service-Desk.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-OSAdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>. <BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIl-OSAdocs/ITIL-OSAPodcast/Service-Desk.rss</span><br /></td></tr><tr><td><a href="/ITIL-OSAdocs/FIB/OSA Chap 7.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table>


<%elseif (Int(kno)=8) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Service Operation Functions</span></td></tr><tr><td><A href="/ITIL-OSAdocs/guides/Functions.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/ITIL-OSAdocs/guides/Functions.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="/ITIL-OSAdocs/flash/Functions.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIL-OSAdocs/flash/Functions.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ITIl-OSAdocs/HTML/Functions.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIl-OSAdocs/HTML/Functions.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-OSAdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>. <BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIl-OSAdocs/ITIL-OSAPodcast/Functions.rss</span><br /></td></tr><tr><td><a href="/ITIL-OSAdocs/FIB/OSA Chap 8.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table>
	
<%elseif (Int(kno)=9) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Technology & Implementation </span></td></tr><tr><td><A href="/ITIL-OSAdocs/guides/Technology-and-Implementation.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/ITIL-OSAdocs/guides/Technology-and-Implementation.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="/ITIL-OSAdocs/flash/Technology-and-Implementation.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIL-OSAdocs/flash/Technology-and-Implementation.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ITIl-OSAdocs/HTML/Technology-and-Implementation.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ITIl-OSAdocs/HTML/Technology-and-Implementation.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIL-OSAdocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>. <BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ITIl-OSAdocs/ITIL-OSAPodcast/Technology-and-Implementation.rss</span><br /></td></tr><tr><td><a href="/ITIL-OSAdocs/FIB/OSA Chap 9.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table>



        
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