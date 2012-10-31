<% 
If Session("FirstName") = "" Then 
Response.Redirect("/memberlogin.asp")
Else
%>

<!--#include virtual="/metatags/index_metatag.html"-->
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

strQuery = "SELECT AreaTitle from KArea_ITIL WHERE KNo = '" & Session("KNO") & "'"

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
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Introduction</span></td></tr><tr><td><A href="http://www.APMGstudy.com/ITILdocs/Foundation/guides/1.Introduction.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;&nbsp;<A href="http://www.APMGstudy.com/ITILdocs/Foundation/guides/1.Introduction.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="http://www.APMGstudy.com/ITILdocs/Foundation/flash/1.Introduction.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.APMGstudy.com/ITILdocs/Foundation/flash/1.Introduction.html" target="_blank">View Online</a></td></tr><tr><td><a href="http://www.APMGstudy.com/ITILdocs/Foundation/HTML/1.Introduction.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.APMGstudy.com/ITILdocs/Foundation/HTML/1.Introduction.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIldocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.APMGstudy.com/ITILdocs/Foundation/Podcast/1.Introduction.rss</span><br /> </td></tr><tr><td><a href="/ITIldocs/FIB/Introduction.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table>
	 
   
     
	<%elseif (Int(kno)=2) then%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Service Strategy</span></td></tr><tr><td><A href="http://www.APMGstudy.com/ITILdocs/Foundation/guides/2.Service-Strategy.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;&nbsp;<A href="http://www.APMGstudy.com/ITILdocs/Foundation/guides/2.Service-Strategy.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td> <a href="http://www.APMGstudy.com/ITILdocs/Foundation/flash/2.Service-Strategy.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="http://www.APMGstudy.com/ITILdocs/Foundation/flash/2.Service-Strategy.html" target="_blank">View Online</a></td></tr><tr><td><a href="http://www.APMGstudy.com/ITILdocs/Foundation/HTML/2.Service-Strategy.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.APMGstudy.com/ITILdocs/Foundation/HTML/2.Service-Strategy.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIldocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.APMGstudy.com/ITILdocs/Foundation/Podcast/2.Service-Strategy.rss</span><br />  </td></tr><tr><td><a href="/ITIldocs/FIB/Service Strategy.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table>
    
    

	
	<%elseif (Int(kno)=3) then%>
 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Service Design</span></td></tr><tr><td><A href="http://www.APMGstudy.com/ITILdocs/Foundation/guides/3.Service-Design.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="http://www.APMGstudy.com/ITILdocs/Foundation/guides/3.Service-Design.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="http://www.APMGstudy.com/ITILdocs/Foundation/flash/3.Service-Design.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.APMGstudy.com/ITILdocs/Foundation/flash/3.Service-Design.html" target="_blank">View Online</a></td></tr><tr><td><a href="http://www.APMGstudy.com/ITILdocs/Foundation/HTML/3.Service-Design.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.APMGstudy.com/ITILdocs/Foundation/HTML/3.Service-Design.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIldocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.APMGstudy.com/ITILdocs/Foundation/Podcast/3.Service-Design.rss</span><br /></td></tr><tr><td><a href="/ITIldocs/FIB/Service Design.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table>
     
	
	 <%elseif (Int(kno)=4) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Service Transition</span></td></tr><tr><td><A href="http://www.APMGstudy.com/ITILdocs/Foundation/guides/4.Service-Transition.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="http://www.APMGstudy.com/ITILdocs/Foundation/guides/4.Service-Transition.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td> <a href="http://www.APMGstudy.com/ITILdocs/Foundation/flash/4.Service-Transition.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.APMGstudy.com/ITILdocs/Foundation/flash/4.Service-Transition.html" target="_blank">View Online</a></td></tr><tr><td><a href="http://www.APMGstudy.com/ITILdocs/Foundation/HTML/4.Service-Transition.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.APMGstudy.com/ITILdocs/Foundation/HTML/4.Service-Transition.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIldocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.APMGstudy.com/ITILdocs/Foundation/Podcast/4.Service-Transition.rss</span><br /></td></tr><tr><td><a href="/ITIldocs/FIB/Service Transition.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table> 
      

	
	<%elseif (Int(kno)=5) then
	%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Service Operation</span></td></tr><tr><td><A href="http://www.APMGstudy.com/ITILdocs/Foundation/guides/5.Service-Operation.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="http://www.APMGstudy.com/ITILdocs/Foundation/guides/5.Service-Operation.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="http://www.APMGstudy.com/ITILdocs/Foundation/flash/5.Service-Operation.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<A href="http://www.APMGstudy.com/ITILdocs/Foundation/flash/5.Service-Operation.html" target="_blank">View Online</a></td></tr><tr><td><a href="http://www.APMGstudy.com/ITILdocs/Foundation/HTML/5.Service-Operation.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.APMGstudy.com/ITILdocs/Foundation/HTML/5.Service-Operation.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIldocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.APMGstudy.com/ITILdocs/Foundation/Podcast/5.Service-Operation.rss</span><br /></td></tr><tr><td><a href="/ITIldocs/FIB/Service Operation.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table> 
    

	
	
	<%elseif (Int(kno)=6) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Continual Service Improvement</span></td></tr><tr><td><A href="http://www.APMGstudy.com/ITILdocs/Foundation/guides/6.Continual-Service-Improvement.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="http://www.APMGstudy.com/ITILdocs/Foundation/guides/6.Continual-Service-Improvement.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Download PDF</A></td></tr><tr><td><a href="http://www.APMGstudy.com/ITILdocs/Foundation/flash/6.Continual-Service-Improvement.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.APMGstudy.com/ITILdocs/Foundation/flash/6.Continual-Service-Improvement.html" target="_blank">View Online</a></td></tr><tr><td><a href="http://www.APMGstudy.com/ITILdocs/Foundation/HTML/6.Continual-Service-Improvement.htm" target="_blank"><img src="/images/buttons/htmlIcon.png"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.APMGstudy.com/ITILdocs/Foundation/HTML/6.Continual-Service-Improvement.htm" target="_blank">HTML Format</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations):</span> Please subscribe to ITIL<sup>&reg;</sup> Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to this  anytime ,while driving, traveling or taking rest.<BR><BR><a href="/ITIldocs/podcasthelp.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Please click here for help on how to download the Podcasts</a>. <BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://www.APMGstudy.com/ITILdocs/Foundation/Podcast/6.Continual-Service-Improvement.rss</span><br /></td></tr><tr><td><a href="/ITIldocs/FIB/Continual Service Improvement.pdf" target="_blank" onclick="_gaq.push(['_trackEvent','Download','PDF',this.href]);">Click here</a> to download fill in the blanks</td></tr></table>

	 

        
<%	end if %>
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