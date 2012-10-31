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
            <td width="73%" class="PageTitle">Scenario Based Chapter Test <a href="/ITIL/help.asp#studyguides" style="float:right; margin-right:20px;"><img src="/images/buttons/Help.png" height="20px" style="border-color:#FFFFFF" onmouseover="this.src='/images/buttons/help_h.png'" onmouseout="this.src='/images/buttons/Help.png'"></a></td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><br />
              <div  style="margin-top:-17px; width:95%;"> 
              <!-- Content Start From Here-->
              <div><span class="Header">Dear </span><% If Session("FirstName") = "" Then %><span class="Header">Trial User,</span><% Else %><span class="Header"><% = Session("FirstName") %>&nbsp;<% = Session("LastName") %>, </span><% End If %></div> 
              <p class="SubHeader">Please find below the links for this chapter scenario question: </p>
              
			  <ul>
			  
			 
			  
			  
	<% 
	
if (Int(kno)=1) then
	%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Introduction to Service Management</span></td></tr><tr><td><a href="/ITIL-OSAdocs/ScenarioQues/1-OSA.pdf" target="_blank">Click here</a> to download scenario based chapter test</td></tr><tr><td><a href="/ITIL-OSAdocs/ScenarioQues/1a-OSAIntro.pdf" target="_blank">Click here</a> to download scenario based chapter test with answer</td></tr></table>
	 
   
     
	<%elseif (Int(kno)=2) then%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Event Management</span></td></tr><tr><td><a href="/ITIL-OSAdocs/ScenarioQues/2-OSA.pdf" target="_blank">Click here</a> to download scenario based chapter test</td></tr><tr><td><a href="/ITIL-OSAdocs/ScenarioQues/2a-OSAEvent.pdf" target="_blank">Click here</a> to download scenario based chapter test with answer</td></tr></table>
	
	<%elseif (Int(kno)=3) then%>
 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Incident Management</span></td></tr><tr><td><a href="/ITIL-OSAdocs/ScenarioQues/3-OSA.pdf" target="_blank">Click here</a> to download scenario based chapter test</td></tr><tr><td><a href="/ITIL-OSAdocs/ScenarioQues/3a-OSAIncident.pdf" target="_blank">Click here</a> to download scenario based chapter test with answer</td></tr></table>
	
	 <%elseif (Int(kno)=4) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Request Fulfilment</span></td></tr><tr><td><a href="/ITIL-OSAdocs/ScenarioQues/4-OSA.pdf" target="_blank">Click here</a> to download scenario based chapter test</td></tr><tr><td><a href="/ITIL-OSAdocs/ScenarioQues/4a-OSARequest.pdf" target="_blank">Click here</a> to download scenario based chapter test with answer</td></tr></table>
	
	<%elseif (Int(kno)=5) then
	%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Problem Management </span></td></tr><tr><td><a href="/ITIL-OSAdocs/ScenarioQues/5-OSA.pdf" target="_blank">Click here</a> to download scenario based chapter test</td></tr><tr><td><a href="/ITIL-OSAdocs/ScenarioQues/5a-OSAProblem.pdf" target="_blank">Click here</a> to download scenario based chapter test with answer</td></tr></table>
	
	<%elseif (Int(kno)=6) then
	%>
<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Access Management </span></td></tr><tr><td><a href="/ITIL-OSAdocs/ScenarioQues/6-OSA.pdf" target="_blank">Click here</a> to download scenario based chapter test</td></tr><tr><td><a href="/ITIL-OSAdocs/ScenarioQues/6a-OSAAccess.pdf" target="_blank">Click here</a> to download scenario based chapter test with answer</td></tr></table>
	 <%elseif (Int(kno)=7) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">	Service Desk</span></td></tr><tr><td><a href="/ITIL-OSAdocs/ScenarioQues/7-OSA.pdf" target="_blank">Click here</a> to download scenario based chapter test</td></tr><tr><td><a href="/ITIL-OSAdocs/ScenarioQues/7a-OSAService Desk.pdf" target="_blank">Click here</a> to download scenario based chapter test with answer</td></tr></table>
<%elseif (Int(kno)=8) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Service Operation Functions</span></td></tr><tr><td><a href="/ITIL-OSAdocs/ScenarioQues/8-OSA.pdf" target="_blank">Click here</a> to download scenario based chapter test</td></tr><tr><td><a href="/ITIL-OSAdocs/ScenarioQues/8a-OSAFunctions.pdf" target="_blank">Click here</a> to download scenario based chapter test with answer</td></tr></table>
	
	<%elseif (Int(kno)=9) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Technology & Implementation</span></td></tr><tr><td><a href="/ITIL-OSAdocs/ScenarioQues/9-OSA.pdf" target="_blank">Click here</a> to download scenario based chapter test</td></tr><tr><td><a href="/ITIL-OSAdocs/ScenarioQues/9-OSATech&Implement.pdf" target="_blank">Click here</a> to download scenario based chapter test with answer</td></tr></table>
	
	
<%	End If %>
              </ul>
               <p><span class="general-bodyBold">Please note:</span></p>
                    <ul>
                      <li>The Chapter scenario Tests assess the delegate’s degree of understanding of the respective chapter content. </li>
                      <li>The questions are in the Multiple Choice format, wherein the delegate will have to choose most correct answer from a choice of four (4) options. The correct option is provided along with justification and reference.</li>
                      <li>Each answer is provided with a 'Justification' which enhances the delegate’s understanding of the concept. The delegate can understand why the correct option is correct and why the rest of the options are incorrect.</li>
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