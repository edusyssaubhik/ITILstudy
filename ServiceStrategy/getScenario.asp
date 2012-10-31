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
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Introduction</span></td></tr><tr><td><a href="/ITIL-CSIdocs/ScenarioQues/chapter1.pdf" target="_blank">Click here</a> to download scenario based chapter test</td></tr><tr><td><a href="/ITIL-CSIdocs/ScenarioQues/chapter1a.pdf" target="_blank">Click here</a> to download scenario based chapter test with answer</td></tr></table>
	 
   
     
	<%elseif (Int(kno)=2) then%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Principles</span></td></tr><tr><td><a href="/ITIL-CSIdocs/ScenarioQues/chapter2.pdf" target="_blank">Click here</a> to download scenario based chapter test</td></tr><tr><td><a href="/ITIL-CSIdocs/ScenarioQues/chapter2a.pdf" target="_blank">Click here</a> to download scenario based chapter test with answer</td></tr></table>
	
	<%elseif (Int(kno)=3) then%>
 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Processes</span></td></tr><tr><td><a href="/ITIL-CSIdocs/ScenarioQues/chapter3.pdf" target="_blank">Click here</a> to download scenario based chapter test</td></tr><tr><td><a href="/ITIL-CSIdocs/ScenarioQues/chapter3a.pdf" target="_blank">Click here</a> to download scenario based chapter test with answer</td></tr></table>
	
	 <%elseif (Int(kno)=4) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Methods and Techniques</span></td></tr><tr><td><a href="/ITIL-CSIdocs/ScenarioQues/chapter4.pdf" target="_blank">Click here</a> to download scenario based chapter test</td></tr><tr><td><a href="/ITIL-CSIdocs/ScenarioQues/chapter4a.pdf" target="_blank">Click here</a> to download scenario based chapter test with answer</td></tr></table>
	
	<%elseif (Int(kno)=5) then
	%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Organising</span></td></tr><tr><td><a href="/ITIL-CSIdocs/ScenarioQues/chapter5.pdf" target="_blank">Click here</a> to download scenario based chapter test</td></tr><tr><td><a href="/ITIL-CSIdocs/ScenarioQues/chapter5a.pdf" target="_blank">Click here</a> to download scenario based chapter test with answer</td></tr></table>
	
	<%elseif (Int(kno)=6) then
	%>
<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Technology</span></td></tr><tr><td><a href="/ITIL-CSIdocs/ScenarioQues/chapter6.pdf" target="_blank">Click here</a> to download scenario based chapter test</td></tr><tr><td><a href="/ITIL-CSIdocs/ScenarioQues/chapter6a.pdf" target="_blank">Click here</a> to download scenario based chapter test with answer</td></tr></table>
	 <%elseif (Int(kno)=7) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Implementing</span></td></tr><tr><td><a href="/ITIL-CSIdocs/ScenarioQues/chapter7.pdf" target="_blank">Click here</a> to download scenario based chapter test</td></tr><tr><td><a href="/ITIL-CSIdocs/ScenarioQues/chapter7a.pdf" target="_blank">Click here</a> to download scenario based chapter test with answer</td></tr></table>
<%elseif (Int(kno)=8) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Critical Success Factor & Risk</span></td></tr><tr><td><a href="/ITIL-CSIdocs/ScenarioQues/chapter8.pdf" target="_blank">Click here</a> to download scenario based chapter test</td></tr><tr><td><a href="/ITIL-CSIdocs/ScenarioQues/chapter8a.pdf" target="_blank">Click here</a> to download scenario based chapter test with answer</td></tr></table>
	
<%	End If %>
              </ul>
               <p><span class="general-bodyBold">Please note:</span></p>
                    <ul>
                      <li>The Chapter scenario Tests assess the delegate’s degree of understanding of the respective chapter content. </li>
                      <li>The questions are in the Multiple Choice format, wherein the delegate will have to choose most correct answer from a choice of four (4) options. The correct option is provided along with justification and reference.</li>
                      <li>Each answer is provided with a 'Justification' which enhances the delegate’s understanding of the concept. The delegate can understand why the correct option is correct and why the rest of the options are incorrect.</li>
                      <li>The 'Reference' directs the delegate to where the concept embodied in the justification can be found in the OGC ITIL<sup>&reg;</sup> Hand Book.</li>
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