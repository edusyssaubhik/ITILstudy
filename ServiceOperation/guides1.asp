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

strQuery = "SELECT AreaTitle from KArea_Operation WHERE KNo = '" & Session("KNO") & "'"

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
              <p class="SubHeader">Please find below the study guide, Flash file and podcast for this chapter: </p>
              
			  <ul>
			  
			 
			  
			  
	<% 
	
if (Int(kno)=1) then
	%>
	 
		<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Introduction to service Operation</span></td></tr><tr><td><A href="http://www.ITILstudy.com/ServiceOperationDocs/guides/Chapter-1.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;&nbsp;<A href="http://www.ITILstudy.com/ServiceOperationDocs/guides/Chapter-1.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="http://www.ITILstudy.com/ServiceOperationDocs/flash/Chapter-1.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.ITILstudy.com/ServiceOperationDocs/flash/Chapter-1.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ServiceOperationDocs/HTML/Chap-1.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ServiceOperationDocs/HTML/Chap-1.htm" target="_blank">HTML Format</a></td></tr><tr><td>Podcasts (audio / visual presentations): Please subscribe to ITIL<Sup style="line-height:0px">&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime, while driving, traveling or taking rest.<BR><BR><a href="/ITIldocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ServiceOperationDocs/Podcast/Chapter-1.rss</span><br /> </td></tr></table>
	 
   
     
	<%elseif (Int(kno)=2) then%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Service Operation principles</span></td></tr><tr><td><A href="http://www.ITILstudy.com/ServiceOperationDocs/guides/Chapter-2.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;&nbsp;<A href="http://www.ITILstudy.com/ServiceOperationDocs/guides/Chapter-2.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td> <a href="http://www.ITILstudy.com/ServiceOperationDocs/flash/Chapter-2.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="http://www.ITILstudy.com/ServiceOperationDocs/flash/Chapter-2.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ServiceOperationDocs/HTML/Chap-2.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ServiceOperationDocs/HTML/Chap-2.htm" target="_blank">HTML Format</a></td></tr><tr><td>Podcasts (audio / visual presentations): Please subscribe to ITIL<Sup style="line-height:0px">&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime, while driving, traveling or taking rest.<BR><BR><a href="/ITIldocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ServiceOperationDocs/Podcast/Chapter-2.rss</span><br />  </td></tr></table>
    
    

	
	<%elseif (Int(kno)=3) then%>
     
     
     <table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Service Operation processes</span></td></tr><tr><td><A href="http://www.ITILstudy.com/ServiceOperationDocs/guides/Chapter-3.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="http://www.ITILstudy.com/ServiceOperationDocs/guides/Chapter-3.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="http://www.ITILstudy.com/ServiceOperationDocs/flash/Chapter-3.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.ITILstudy.com/ServiceOperationDocs/flash/Chapter-3.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ServiceOperationDocs/HTML/Chap-3.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ServiceOperationDocs/HTML/Chap-3.htm" target="_blank">HTML Format</a></td></tr><tr><td>Podcasts (audio / visual presentations): Please subscribe to ITIL<Sup style="line-height:0px">&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime, while driving, traveling or taking rest.<BR><BR><a href="/ITIldocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ServiceOperationDocs/Podcast/Chapter-3.rss</span><br /></td></tr></table>
     
	
	 <%elseif (Int(kno)=4) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Common Service Operation activities</span></td></tr><tr><td><A href="http://www.ITILstudy.com/ServiceOperationDocs/guides/Chapter-4.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="http://www.ITILstudy.com/ServiceOperationDocs/guides/Chapter-4.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td> <a href="http://www.ITILstudy.com/ServiceOperationDocs/flash/Chapter-4.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.ITILstudy.com/ServiceOperationDocs/flash/Chapter-4.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ServiceOperationDocs/HTML/Chap-4.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ServiceOperationDocs/HTML/Chap-4.htm" target="_blank">HTML Format</a></td></tr><tr><td>Podcasts (audio / visual presentations): Please subscribe to ITIL<Sup style="line-height:0px">&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime, while driving, traveling or taking rest.<BR><BR><a href="/ITIldocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ServiceOperationDocs/Podcast/Chapter-4.rss</span><br /></td></tr></table> 
      

	
	<%elseif (Int(kno)=5) then
	%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Organising for Service Operation</span></td></tr><tr><td><A href="http://www.ITILstudy.com/ServiceOperationDocs/guides/Chapter-5.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="http://www.ITILstudy.com/ServiceOperationDocs/guides/Chapter-5.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="http://www.ITILstudy.com/ServiceOperationDocs/flash/Chapter-5.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<A href="http://www.ITILstudy.com/ServiceOperationDocs/flash/Chapter-5.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ServiceOperationDocs/HTML/Chap-5.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ServiceOperationDocs/HTML/Chap-5.htm" target="_blank">HTML Format</a></td></tr><tr><td>Podcasts (audio / visual presentations): Please subscribe to ITIL<Sup style="line-height:0px">&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime, while driving, traveling or taking rest.<BR><BR><a href="/ITIldocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ServiceOperationDocs/Podcast/Chapter-5.rss</span><br /></td></tr></table> 
    

	
	
	<%elseif (Int(kno)=6) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Technology considerations</span></td></tr><tr><td><A href="http://www.ITILstudy.com/ServiceOperationDocs/guides/Chapter-6.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="http://www.ITILstudy.com/ServiceOperationDocs/guides/Chapter-6.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="http://www.ITILstudy.com/ServiceOperationDocs/flash/Chapter-6.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.ITILstudy.com/ServiceOperationDocs/flash/Chapter-6.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ServiceOperationDocs/HTML/Chap-6.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ServiceOperationDocs/HTML/Chap-6.htm" target="_blank">HTML Format</a></td></tr><tr><td>Podcasts (audio / visual presentations): Please subscribe to ITIL<Sup style="line-height:0px">&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime, while driving, traveling or taking rest.<BR><BR><a href="/ITIldocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>. <BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ServiceOperationDocs/Podcast/Chapter-6.rss</span><br /></td></tr></table>

	 
	 <%elseif (Int(kno)=7) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Implementation of Service Operation </span></td></tr><tr><td><A href="http://www.ITILstudy.com/ServiceOperationDocs/guides/Chapter-7.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="http://www.ITILstudy.com/ServiceOperationDocs/guides/Chapter-7.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="http://www.ITILstudy.com/ServiceOperationDocs/flash/Chapter-7.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.ITILstudy.com/ServiceOperationDocs/flash/Chapter-7.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ServiceOperationDocs/HTML/Chap-7.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ServiceOperationDocs/HTML/Chap-7.htm" target="_blank">HTML Format</a></td></tr><tr><td>Podcasts (audio / visual presentations): Please subscribe to ITIL<Sup style="line-height:0px">&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime, while driving, traveling or taking rest.<BR><BR><a href="/ITIldocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>. <BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ServiceOperationDocs/Podcast/Chapter-7.rss</span><br /></td></tr></table>


<%elseif (Int(kno)=8) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Challenges, critical success factors and risks</span></td></tr><tr><td><A href="http://www.ITILstudy.com/ServiceOperationDocs/guides/Chapter-8.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="http://www.ITILstudy.com/ServiceOperationDocs/guides/Chapter-8.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="http://www.ITILstudy.com/ServiceOperationDocs/flash/Chapter-8.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.ITILstudy.com/ServiceOperationDocs/flash/Chapter-8.html" target="_blank">View Online</a></td></tr><tr><td><a href="/ServiceOperationDocs/HTML/Chap-8.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ServiceOperationDocs/HTML/Chap-8.htm" target="_blank">HTML Format</a></td></tr><tr><td>Podcasts (audio / visual presentations): Please subscribe to ITIL<Sup style="line-height:0px">&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime, while driving, traveling or taking rest.<BR><BR><a href="/ITIldocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>. <BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.ITILstudy.com/ServiceOperationDocs/Podcast/Chapter-8.rss</span><br /></td></tr></table>


        
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