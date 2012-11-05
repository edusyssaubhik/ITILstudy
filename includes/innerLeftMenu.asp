<script type="text/javascript">
<!--
function showArrow(a){
	document.getElementById(a).style.visibility="visible";
}
function hideArrow(a){
	document.getElementById(a).style.visibility="hidden";
}


function Form_Validator(theform)
{

 //check to see if the City field is balnk

  if (theform.searchData.value == "")
  {
     alert("Please enter");
     theform.searchData.focus();
     return (false);
  }


}

function submitform()
{
    if(document.search.onsubmit && 
    !document.search.onsubmit())
    {
        return;
    }
 document.search.submit();
}

function addLoadEvent(func) { 
 var oldonload = window.onload; 
 if (typeof window.onload != 'function') { 
   window.onload = func; 
 } else { 
   window.onload = function() { 
     if (oldonload) { 
       oldonload(); 
     } 
     func(); 
   } 
 } 
} 
 
addLoadEvent(function() { 
if (navigator.appName == 'Microsoft Internet Explorer')
  {
//document.getElementById('searchbox').style.paddingTop="5px";
document.getElementById('submitbox').style.marginTop="-23px";

   }
})

function showVideo(){
window.open('/ITILdocs/tour/screen-video.html');
}

function showVideo1(){
window.open('/ITILdocs/tour/screen-video1.html');
}

function showPDF(){
window.open('/generateVoucher.asp');
}

function popitup(url) {
	newwindow=window.open(url,'name','toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=0,minimizable=0,resizable=0,height=150,width=300,top=250,left=400');
	if (window.focus) {newwindow.focus()}
	return false;
}
-->
</script>
<style type="text/css">
#contact-box
{
	width:185px;
	height:auto;
	border:#66ccfd 1px solid;
	font-family:Arial, Helvetica, sans-serif;
	font-size:13px;
	color:#333;
	padding:10px 5px 10px 5px;
	line-height:20px;
	text-align:center;

	
	
}
#contact-box a:hover
{
	background-color:#FFF;
	
}
</style>



<script type="text/javascript"></script>
<script language="JavaScript" type="text/javascript" src="/js/highlight.js"></script>


<td width="2%">&nbsp;</td>
<td width="25%" class="general-body"><%  
Dim State
State=Session("State")
'response.Write(State)
If(Session("State")<>"") Then%>
  <span class="Header">Welcome <%=Session("FirstName")%>&nbsp;<%=Session("LastName")%>,</span><br />
  <br>
  <span class="SubHeader">Your course includes :</span><br>
  <br />
  <%
	If Session("ITIL") = "Foundation" Then 
		course = "Foundation"
	ElseIf Session("ITIL") = "ITILstudy Blend Course" Then 
		course = "ITIL"
	ElseIf Session("ITIL") = "ITILstudy Online Course" Then 
		course = "ITIL"
	ElseIf Session("ITIL") = "ITIL Intermediate (CSI) Online course" Then 
		course = "ITIL CSI"
	End If
	
Select Case State

 'Case "verified1" %>

  <% Case "verified4"
  
  'Pre prep course

   %>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftMenu"  id="primarynav">
    <tr>
      <td><a href="/overview.asp"  id='menulk'>Course Overview &nbsp; &nbsp;</a></td>
    </tr>
      <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
   <tr>
      <td><a href="/prepcourse.asp"  id='menulk'>Classroom Prep Course &nbsp; </a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/processChart.asp" target="_blank"  id='menulk'>Process Chart&nbsp; &nbsp; </a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
  <tr>
      <td><a href="/ITIL_prepGuides.asp"  id='menulk'>Chapter Guides &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	 <tr>
      <td><a href="/ITIL/chapterTestsIndex.asp" id='menulk'>Chapter Tests &nbsp; &nbsp;</a></td>
    </tr>
	<tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    
    <tr>
      <td><a href="/query.asp"  id='menulk'>Query/Suggestion &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	  <% 
	 ' Response.write(Date())
	  'If Session("DateValid") = Date() Then
	 ' If(CDate(Session("DateValid"))-(Date())=0) OR (CDate(Session("DateValid"))-(Date())=1)  Then
	  'after classroom the pdu certificate will be available for next 30 days
	  ' If(CDate(Session("DateValid"))-(Date())<= 30) Then
	  
	 ' If (CDate(StartDate)-(Date()+Int(ApplicableDays)+1) >= 0) Then
	'Response.write(Date())
	 '  Response.write("<br>Test "&Session("enddate"))
	   
	   If ((30 + Date()) -(CDate(Session("enddate")))>=30) then
	  
	  ' If (30 = CDate(Session("enddate"))-(Date()+30+1) >= 0) Then
	   
	  %>
		   <tr>
		   <td>
		 <a href="/certificate.asp" target="_blank"  id='menulk' >PDU Certificate &nbsp; &nbsp;</a>  
</td></tr>
 <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	<% End If %>
    <tr>
      <td class="level1">Search</td>
    </tr>
    <tr>
      <td><!--<form name="search" action="/search.asp" method="post" style="display:inline" target="_blank" onsubmit="return Form_Validator(this)">
        <input type='text' name="searchData" class="searchBox" id='searchbox' /> 
       <input type="submit" id="submitbox" value="">
        </form>-->
       
        <form name="search" action="/ITILsearch.asp" method="post" style="display:inline" target="_blank" onsubmit="return Form_Validator(this)">
         <table border="0px" cellpadding="0px" cellspacing="0px" width="100%"><tr>
        <td width="142px;"> 
        
        <input type='text' name="searchData" class="searchBox" id='searchbox' style="color: rgb(161, 161, 161);width:110px;height:25px;"  class="TeXtField" value="Glossary Search"  onfocus='myObj = document.getElementById("searchbox");if(this.value=="Glossary Search") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("searchbox");if(myObj.value == "") myObj.value="Glossary Search";myObj.style.color = "#a1a1a1";if(myObj.value!="Glossary Search") myObj.style.color="#000000";'> </td>
        
        <td> <div id="submitbox" style="display:inline"><input type="image" src="/images/buttons/searchbg.gif"></div></td>
        </tr>
        </table>
          
    </form>
        

      </td>
    </tr>
	<tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	<tr><td>
			<a href="/changepassword.asp?changepass=one"  id='menulk'>
       Change Password &nbsp; &nbsp;</a></td>
    </tr>
	<tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/logoff.asp"  id='menulk'> 
        Sign Out &nbsp; &nbsp;</a></td>
    </tr>
  </table>
  
 
     <% Case  "verified8","verified12" %>
   <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftMenu"  id="primarynav">
    <tr>
     <td><a href="/overview.asp"  id='menulk'>Overview of course &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
    <td><a href="/practiceTestsIndex.asp"  id='menulk'>Simulated practice tests  &nbsp; &nbsp;</a></td>
      
    </tr>
    <tr>
    <td><a href="/nextSteps.asp"  id='menulk'>Next Steps &nbsp; &nbsp;</a></td>
      
    </tr>
	<tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	<tr><td>
			<a href="/changepassword.asp?changepass=one"  id='menulk'>
       Change Password &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="SubHeader"><a href="/logoff.asp"  id='menulk'><BR>
        Sign Out &nbsp; &nbsp;</a></td>
    </tr>
  </table>
   <% Case "verified1" ,"verified3" , "verified5" ,"verified2" ,"verified6","verified7","verified13"
   'Online Blend course
   %>
  <table width="232px" border="0" cellspacing="0" cellpadding="0" class="leftMenu" id="primarynav">
    <tr>
      <td ><a href="/overview.asp"  id='menulk'>Overview of course &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
	<% If Session("State") = "verified2" OR Session("State") = "verified3" OR Session("State") = "verified5" OR Session("State") = "verified13"   Then %>
      <td ><a href="" onclick="showVideo(); return false;" id='menulk'>Course Tour &nbsp; &nbsp;</a></td>
	  <% ElseIf Session("State") = "verified1" OR Session("State") = "verified6" OR Session("State") = "verified7"  Then %>
	   <td ><a href="" onclick="showVideo1(); return false;" id='menulk'>Course Tour &nbsp; &nbsp;</a></td>
	   <% End If %>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/syllabus-Requirement.asp" id='menulk'>Syllabus &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% If Session("KNO") = "" Then %>
    <tr>
	<%' If Session("State") = "verified13" Then %>
	  <%' Else %>
	  <td><a href="/ITIL/guidesIndex.asp" id='menulk'>Select Chapter &nbsp; &nbsp;</a></td>
	    <%' End If %>
    </tr>
	<% Else %>  
    <tr>
	<% 'If Session("State") = "verified13" Then %>
		   <%' Else %>
	 <td><a href="/ITIL/guidesIndex.asp" id='menulk'>Change Chapter &nbsp; &nbsp;</a></td>
	    <%' End If %>
    </tr>
    <% End If %>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/methodology/tour3.asp" id='menulk' onclick="test">Study Methodology &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
     <tr>
      <td class="level1">Search</td>
    </tr>
    <tr>
      <td><!--<form name="search" action="/search.asp" method="post" style="display:inline" target="_blank" onsubmit="return Form_Validator(this)">
        <input type='text' name="searchData" class="searchBox" id='searchbox' /> 
       <input type="submit" id="submitbox" value="">
        </form>-->
       
        <form name="search" action="/ITILsearch.asp" method="post" style="display:inline" target="_blank" onsubmit="return Form_Validator(this)">
         <table border="0px" cellpadding="0px" cellspacing="0px" width="100%"><tr>
        <td width="142px;"> 
        
        <input type='text' name="searchData" class="searchBox" id='searchbox' style="color: rgb(161, 161, 161);width:110px;height:25px;"  class="TeXtField" value="Glossary Search"  onfocus='myObj = document.getElementById("searchbox");if(this.value=="Glossary Search") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("searchbox");if(myObj.value == "") myObj.value="Glossary Search";myObj.style.color = "#a1a1a1";if(myObj.value!="Glossary Search") myObj.style.color="#000000";'> </td>
        
        <td> <div id="submitbox" style="display:inline"><input type="image" src="/images/buttons/searchbg.gif"></div></td>
        </tr>
        </table>
        
          
    </form>
        

      </td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% If Session("KNO") <> "" Then
	 %>
  
    <tr>
      <td class="level1"><% = Session("ChapterName") %></td>
    </tr>
	
	<tr>
      <td class="subMenu"><a href="/ITIL/guides1.asp" id='menulk'>- Study Guides &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ITIL/chapterTestsIndex.asp" id='menulk'>- Chapter Test &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ITIL/pdusindex.asp" id='menulk'>- Evaluation &nbsp; &nbsp;</a></td>
    </tr>
  <!--  <tr>
      <td class="subMenu"><a href="#" onMouseOver="showArrow('img12');" onMouseOut="hideArrow('img12')">- Casestudy</a><img src="/images/buttons/hoverArrow.png" width="11"  id="img12" class="img"></td>
    </tr>-->
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% End If %>
    <!--<tr>
      <td><a href="/practiceQues-ITIL.asp" id='menulk' >APMG Sample Paper Q & A &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>-->
    <tr>
      <td>
        <% If Session("KnoPassed") = 6 Then %>
            <%If Session("State") = "verified5" OR Session("State")="verified7"  Then%>
                    <a href="/ITILsim/APMG-sample-papers.asp"  id='menulk' >APMG Sample Paper &nbsp; &nbsp; </a> 
              <%Else %>
                    <a href="/ITILsim/practiceTestsIndex.asp"  id='menulk' >APMG Sample Paper &nbsp; &nbsp; </a> 
              <%end If %>
    <%Else%>
    
       <a href="/ITIL/mockTest.asp" style="color: rgb(161, 161, 161);width:200px;"  id='menulk' onClick="return popitup('/ITIL/mockTest.asp')" >APMG Sample Paper &nbsp; &nbsp; </a>
	   
	   
    <% End If %>
    
      
      </td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
           <% If Session("KnoPassed") = 6 Then 
		   %>
		   <tr>
		   <td>
		 <a href="/certificate.asp" target="_blank"  id='menulk' >PDU Certificate &nbsp; &nbsp;</a>  
</td></tr>
 <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	 <% If Session("State") = "verified1" OR Session("State") = "verified6" OR Session("State") = "verified7"  Then %>
     <tr>
      <td><a href=""  id='menulk' onclick="showPDF(); return false;" >Generate Voucher &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
     <% End If %>
     <tr>
      <td>
 
<a href="/ITIL/feedback.asp"  id='menulk' >Post course Feedback &nbsp; &nbsp;</a>
           
      </td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
     <% End If %>
    <tr>
      <td><a href="/query.asp"  id='menulk'>Query/Suggestion &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    
  <tr>
  <td class="level1">Ask me a question</td>
  </tr>
  <tr>
      <td>   
      <form action="/searchresults1.asp" id="cse-search-box" target="_blank">
        <table border="0px" cellpadding="0px" cellspacing="0px" width="100%"><tr>
        <td width="142px;"> 

    <input type="hidden" name="cx" value="016011900712214369325:uxcy_lv2cqa" />
    
     <input type="hidden" name="cof" value="FORID:9" />
    <input type="hidden" name="ie" value="UTF-8" />
    <input type="hidden" name="filter" value="0" />
<input type="text" name="q"  class="searchBox" id='searchbox'/>
<td><input type="image" name="sa2" value="Go" id="submitbox" src="/images/buttons/searchbg.gif"/></td>
   </tr>
        </table>
</form>
        </td>
    </tr>
     <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/ITIL/help.asp"  id='menulk'>Help &nbsp; &nbsp;</a></td>
    </tr>
	<tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	<tr><td>
			<a href="/changepassword.asp?changepass=one"  id='menulk'>
       Change Password &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/logoff.asp"  id='menulk'> Sign Out &nbsp; &nbsp;</a></td>
    </tr>
  </table>
  
  	<% 'FOR ITIL Intermediate (CSI) Online course'
		 case "verified9" 	%>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftMenu"  id="primarynav">   
     <tr>
      <td ><a href="/overview.asp"  id='menulk'>Overview of course &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>  
    <tr>
      <td><a href="/syllabus-Requirement.asp"  id='menulk'>Syllabus &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% If Session("KNO") = "" Then %>
    <tr>
      <td><a href="/ITIL-CSI/guidesIndex.asp"  id='menulk'>Select Chapter &nbsp; &nbsp;</a></td>
    </tr>
	<% Else %>  
    <tr>
		  <td><a href="/ITIL-CSI/guidesIndex.asp"  id='menulk'>Change Chapter &nbsp; &nbsp;</a></td>
    </tr>
    <% End If %>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/methodology/tour4.asp"  id='menulk' onclick="test">Study Methodology &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
     <tr>
      <td class="level1">Search</td>
    </tr>
    <tr>
      <td>
        <form name="search" action="/ITILCSIsearch.asp" method="post" style="display:inline" target="_blank" onsubmit="return Form_Validator(this)">
         <table border="0px" cellpadding="0px" cellspacing="0px" width="100%"><tr>
        <td width="142px;"> 
        
        <input type='text' name="searchData" class="searchBox" id='searchbox' style="color: rgb(161, 161, 161);width:110px;height:25px;"  class="TeXtField" value="Glossary Search"  onfocus='myObj = document.getElementById("searchbox");if(this.value=="Glossary Search") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("searchbox");if(myObj.value == "") myObj.value="Glossary Search";myObj.style.color = "#a1a1a1";if(myObj.value!="Glossary Search") myObj.style.color="#000000";'> </td>
        
        <td> <div id="submitbox" style="display:inline"><input type="image" src="/images/buttons/searchbg.gif"></div></td>
        </tr>
        </table>
        
          
    </form>
        

      </td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% If Session("KNO") <> "" Then
	 %>
  
    <tr>
      <td class="level1"><% = Session("ChapterName") %></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ITIL-CSI/guides1.asp"  id='menulk'>- Study Guides &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ITIL-CSI/chapterTestsIndex.asp"  id='menulk'>- Chapter Test &nbsp; &nbsp;</a></td>
    </tr>
	    <tr>
      <td class="subMenu"><a href="/ITIL-CSI/scenarioChapterTest.asp"  id='menulk'>- Scenario Based Chapter Test &nbsp; &nbsp;</a></td>
    </tr>

    <tr>
      <td class="subMenu"><a href="/ITIL-CSI/pdusindex.asp"  id='menulk'>- Evaluation &nbsp; &nbsp;</a></td>
    </tr>
 
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% End If %>
     <!-- <tr>
      <td><a href="/practiceQues-CSI.asp"  id='menulk'>APMG Sample Paper Q & A &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>-->
	 <tr>
      <td><a href="/ITIL-CSI-Sample1/sample8Ques/TestRules.asp"  id='menulk'>APMG Sample Paper 1 &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	 <tr>
      <td><a href="/ITIL-CSI-Sample2/sample2Ques/TestRules.asp"  id='menulk'>APMG Sample Paper 2 &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	
     <% If Session("KnoPassed") = 8 Then %>
		   <tr>
		   <td>
		 <a href="/courseCSICertificate.asp" target="_blank"  id='menulk' >Course Certificate &nbsp; &nbsp;</a>  
</td></tr>
 <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
     <!--<tr>
      <td><a href=""  id='menulk' onclick="showPDF(); return false;" >Generate Voucher &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>-->
     <% End If %>
         <tr>
      <td>
 
<a href="/ITIL-CSI/feedback.asp"  id='menulk' >Post course Feedback  &nbsp; &nbsp;</a>
           
      </td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/query.asp"  id='menulk'>Query/Suggestion &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    
  <tr>
  <td class="level1">Ask me a question</td>
  </tr>
  <tr>
      <td>   
      <form action="/searchresults1.asp" id="cse-search-box" target="_blank">
        <table border="0px" cellpadding="0px" cellspacing="0px" width="100%"><tr>
        <td width="142px;"> 

    <input type="hidden" name="cx" value="016011900712214369325:uxcy_lv2cqa" />
    
     <input type="hidden" name="cof" value="FORID:9" />
    <input type="hidden" name="ie" value="UTF-8" />
    <input type="hidden" name="filter" value="0" />
<input type="text" name="q"  class="searchBox" id='searchbox'/>
<td><input type="image" name="sa2" value="Go" id="submitbox" src="/images/buttons/searchbg.gif"/></td>
   </tr>
        </table>
</form>
        </td>
    </tr>
     <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/ITIL-CSI/help.asp"  id='menulk'>Help  &nbsp; &nbsp;</a></td>
    </tr>
	<tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	<tr><td>
			<a href="/changepassword.asp?changepass=one"  id='menulk'>
       Change Password &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/logoff.asp"  id='menulk'> Sign Out &nbsp; &nbsp;</a></td>
    </tr>

  </table>
  
  <% 'FOR Service Strategy Online course'
		 case "verified14" 	%>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftMenu"  id="primarynav">   
     <tr>
      <td ><a href="/overview.asp"  id='menulk'>Overview of course &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>  
    <tr>
      <td><a href="/syllabus-Requirement.asp"  id='menulk'>Syllabus &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% If Session("KNO") = "" Then %>
    <tr>
      <td><a href="/ServiceStrategy/guidesIndex.asp"  id='menulk'>Select Chapter &nbsp; &nbsp;</a></td>
    </tr>
	<% Else %>  
    <tr>
		  <td><a href="/ServiceStrategy/guidesIndex.asp"  id='menulk'>Change Chapter &nbsp; &nbsp;</a></td>
    </tr>
    <% End If %>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/methodology/tour6.asp"  id='menulk' onclick="test">Study Methodology &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
     <tr>
      <td class="level1">Search</td>
    </tr>
    <tr>
      <td>
        <form name="search" action="/ITILStrategysearch.asp" method="post" style="display:inline" target="_blank" onsubmit="return Form_Validator(this)">
         <table border="0px" cellpadding="0px" cellspacing="0px" width="100%"><tr>
        <td width="142px;"> 
        
        <input type='text' name="searchData" class="searchBox" id='searchbox' style="color: rgb(161, 161, 161);width:110px;height:25px;"  class="TeXtField" value="Glossary Search"  onfocus='myObj = document.getElementById("searchbox");if(this.value=="Glossary Search") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("searchbox");if(myObj.value == "") myObj.value="Glossary Search";myObj.style.color = "#a1a1a1";if(myObj.value!="Glossary Search") myObj.style.color="#000000";'> </td>
        
        <td> <div id="submitbox" style="display:inline"><input type="image" src="/images/buttons/searchbg.gif"></div></td>
        </tr>
        </table>
        
    </form>

      </td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% If Session("KNO") <> "" Then
	 %>
  
    <tr>
      <td class="level1"><% = Session("ChapterName") %></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ServiceStrategy/guides1.asp"  id='menulk'>- Study Guides &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ServiceStrategy/chapterTestsIndex.asp"  id='menulk'>- Chapter Test &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ServiceStrategy/pdusindex.asp"  id='menulk'>- Evaluation &nbsp; &nbsp;</a></td>
    </tr>
 
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% End If %>
      <tr>
      <td><a href="/ServiceStrategy/SS_samplePapers.asp"  id='menulk'> Strategy Sample Papers &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	
  
     <%' If Session("KnoPassed") = 8 Then %>
		 <!--  <tr>
		   <td>
		 <a href="/certificate.asp" target="_blank"  id='menulk' >PDU Certificate &nbsp; &nbsp;</a>  
</td></tr>
 <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
     <tr>
      <td><a href=""  id='menulk' onclick="showPDF(); return false;" >Generate Voucher &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>-->
     <% 'End If %>
     
         <tr>
      <td>
 
<a href="/ServiceStrategy/feedback.asp"  id='menulk' >Post course Feedback  &nbsp; &nbsp;</a>
           
      </td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/query.asp"  id='menulk'>Query/Suggestion &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    
  <tr>
  <td class="level1">Ask me a question</td>
  </tr>
  <tr>
      <td>   
      <form action="/searchresults1.asp" id="cse-search-box" target="_blank">
        <table border="0px" cellpadding="0px" cellspacing="0px" width="100%"><tr>
        <td width="142px;"> 

    <input type="hidden" name="cx" value="016011900712214369325:uxcy_lv2cqa" />
    
     <input type="hidden" name="cof" value="FORID:9" />
    <input type="hidden" name="ie" value="UTF-8" />
    <input type="hidden" name="filter" value="0" />
<input type="text" name="q"  class="searchBox" id='searchbox'/>
<td><input type="image" name="sa2" value="Go" id="submitbox" src="/images/buttons/searchbg.gif"/></td>
   </tr>
        </table>
</form>
        </td>
    </tr>
     <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/ServiceStrategy/help.asp"  id='menulk'>Help  &nbsp; &nbsp;</a></td>
    </tr>
	<tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	<tr><td>
			<a href="/changepassword.asp?changepass=one"  id='menulk'>
       Change Password &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/logoff.asp"  id='menulk'> Sign Out &nbsp; &nbsp;</a></td>
    </tr>

  </table>
  
  	<% ' ITIL Service Transition Online course'
		 case "verified15" 	%>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftMenu"  id="primarynav">   
     <tr>
      <td ><a href="/overview.asp"  id='menulk'>Overview of course &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>  
    <tr>
      <td><a href="/syllabus-Requirement.asp"  id='menulk'>Syllabus &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% If Session("KNO") = "" Then %>
    <tr>
      <td><a href="/ServiceTransition/guidesIndex.asp"  id='menulk'>Select Chapter &nbsp; &nbsp;</a></td>
    </tr>
	<% Else %>  
    <tr>
		  <td><a href="/ServiceTransition/guidesIndex.asp"  id='menulk'>Change Chapter &nbsp; &nbsp;</a></td>
    </tr>
    <% End If %>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/methodology/tour7.asp"  id='menulk' onclick="test">Study Methodology &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
     <tr>
      <td class="level1">Search</td>
    </tr>
    <tr>
      <td>
        <form name="search" action="/ITILTransitionsearch.asp" method="post" style="display:inline" target="_blank" onsubmit="return Form_Validator(this)">
         <table border="0px" cellpadding="0px" cellspacing="0px" width="100%"><tr>
        <td width="142px;"> 
        
        <input type='text' name="searchData" class="searchBox" id='searchbox' style="color: rgb(161, 161, 161);width:110px;height:25px;"  class="TeXtField" value="Glossary Search"  onfocus='myObj = document.getElementById("searchbox");if(this.value=="Glossary Search") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("searchbox");if(myObj.value == "") myObj.value="Glossary Search";myObj.style.color = "#a1a1a1";if(myObj.value!="Glossary Search") myObj.style.color="#000000";'> </td>
        
        <td><div id="submitbox" style="display:inline"><input type="image" src="/images/buttons/searchbg.gif"></div></td>
        </tr>
        </table>
        
          
    </form>
        

      </td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% If Session("KNO") <> "" Then
	 %>
  
    <tr>
      <td class="level1"><% = Session("ChapterName") %></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ServiceTransition/guides1.asp"  id='menulk'>- Study Guides &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ServiceTransition/chapterTestsIndex.asp"  id='menulk'>- Chapter Test &nbsp; &nbsp;</a></td>
    </tr>
	    <!--<tr>
      <td class="subMenu"><a href="/ServiceTransition/scenarioChapterTest.asp"  id='menulk'>- Scenario Based Chapter Test &nbsp; &nbsp;</a></td>
    </tr>-->

    <tr>
      <td class="subMenu"><a href="/ServiceTransition/pdusindex.asp"  id='menulk'>- Evaluation &nbsp; &nbsp;</a></td>
    </tr>
 
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% End If %>
     <!-- <tr>
      <td><a href="/practiceQues-CSI.asp"  id='menulk'>APMG Sample Paper Q & A &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>-->
	 <tr>
      <td><a href="/ServiceTransition/ST_samplePapers.asp"  id='menulk'>Transition Sample Paper &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	 
	
     <% If Session("KnoPassed") = 8 Then %>
	   <!--	   <tr>
		   <td>
		 <a href="/courseCSICertificate.asp" target="_blank"  id='menulk' >Course Certificate &nbsp; &nbsp;</a>  
</td></tr>
 <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
  <tr>
      <td><a href=""  id='menulk' onclick="showPDF(); return false;" >Generate Voucher &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>-->
     <% End If %>
         <tr>
      <td>
 
<a href="/ServiceTransition/feedback.asp"  id='menulk' >Post course Feedback  &nbsp; &nbsp;</a>
           
      </td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/query.asp"  id='menulk'>Query/Suggestion &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    
  <tr>
  <td class="level1">Ask me a question</td>
  </tr>
  <tr>
      <td>   
      <form action="/searchresults1.asp" id="cse-search-box" target="_blank">
        <table border="0px" cellpadding="0px" cellspacing="0px" width="100%"><tr>
        <td width="142px;"> 

    <input type="hidden" name="cx" value="016011900712214369325:uxcy_lv2cqa" />
    
     <input type="hidden" name="cof" value="FORID:9" />
    <input type="hidden" name="ie" value="UTF-8" />
    <input type="hidden" name="filter" value="0" />
<input type="text" name="q"  class="searchBox" id='searchbox'/>
<td><input type="image" name="sa2" value="Go" id="submitbox" src="/images/buttons/searchbg.gif"/></td>
   </tr>
        </table>
</form>
        </td>
    </tr>
     <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/ServiceTransition/help.asp"  id='menulk'>Help  &nbsp; &nbsp;</a></td>
    </tr>
	<tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	<tr><td>
			<a href="/changepassword.asp?changepass=one"  id='menulk'>
       Change Password &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/logoff.asp"  id='menulk'> Sign Out &nbsp; &nbsp;</a></td>
    </tr>

  </table>
  
  
  <% '--------------------------------------------------------------------------------------------------------------------------------------------------
     ' ITIL Service Design Online course'
	 
		 case "verified16" 	%>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftMenu"  id="primarynav">   
     <tr>
      <td ><a href="/overview.asp"  id='menulk'>Overview of course &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>  
    <tr>
      <td><a href="/syllabus-Requirement.asp"  id='menulk'>Syllabus &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% If Session("KNO") = "" Then %>
    <tr>
      <td><a href="/ServiceDesign/guidesIndex.asp"  id='menulk'>Select Chapter &nbsp; &nbsp;</a></td>
    </tr>
	<% Else %>  
    <tr>
		  <td><a href="/ServiceDesign/guidesIndex.asp"  id='menulk'>Change Chapter &nbsp; &nbsp;</a></td>
    </tr>
    <% End If %>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/methodology/tour8.asp"  id='menulk' onclick="test">Study Methodology &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
     <tr>
      <td class="level1">Search</td>
    </tr>
    <tr>
      <td>
        <form name="search" action="/ITILDesignSearch.asp" method="post" style="display:inline" target="_blank" onsubmit="return Form_Validator(this)">
         <table border="0px" cellpadding="0px" cellspacing="0px" width="100%"><tr>
        <td width="142px;"> 
        
        <input type='text' name="searchData" class="searchBox" id='searchbox' style="color: rgb(161, 161, 161);width:110px;height:25px;"  class="TeXtField" value="Glossary Search"  onfocus='myObj = document.getElementById("searchbox");if(this.value=="Glossary Search") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("searchbox");if(myObj.value == "") myObj.value="Glossary Search";myObj.style.color = "#a1a1a1";if(myObj.value!="Glossary Search") myObj.style.color="#000000";'> </td>
        
        <td> <div id="submitbox" style="display:inline"><input type="image" src="/images/buttons/searchbg.gif"></div></td>
        </tr>
        </table>
        
          
    </form>
        

      </td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% If Session("KNO") <> "" Then
	 %>
  
    <tr>
      <td class="level1"><% = Session("ChapterName") %></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ServiceDesign/guides1.asp"  id='menulk'>- Study Guides &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ServiceDesign/chapterTestsIndex.asp"  id='menulk'>- Chapter Test &nbsp; &nbsp;</a></td>
    </tr>

    <tr>
      <td class="subMenu"><a href="/ServiceDesign/pdusindex.asp"  id='menulk'>- Evaluation &nbsp; &nbsp;</a></td>
    </tr>
 
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% End If %>
    
     <tr>
      <td><a href="/ServiceDesign/SD_samplePapers.asp"  id='menulk'>Service Design Sample Paper &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
     
         <tr>
      <td>
 
<a href="/ServiceDesign/feedback.asp"  id='menulk' >Post course Feedback  &nbsp; &nbsp;</a>
           
      </td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/query.asp"  id='menulk'>Query/Suggestion &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    
  <tr>
  <td class="level1">Ask me a question</td>
  </tr>
  <tr>
      <td>   
      <form action="/searchresults1.asp" id="cse-search-box" target="_blank">
        <table border="0px" cellpadding="0px" cellspacing="0px" width="100%"><tr>
        <td width="142px;"> 

    <input type="hidden" name="cx" value="016011900712214369325:uxcy_lv2cqa" />
    
     <input type="hidden" name="cof" value="FORID:9" />
    <input type="hidden" name="ie" value="UTF-8" />
    <input type="hidden" name="filter" value="0" />
<input type="text" name="q"  class="searchBox" id='searchbox'/>
<td><input type="image" name="sa2" value="Go" id="submitbox" src="/images/buttons/searchbg.gif"/></td>
   </tr>
        </table>
</form>
        </td>
    </tr>
     <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/ServiceDesign/help.asp"  id='menulk'>Help  &nbsp; &nbsp;</a></td>
    </tr>
	<tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	<tr><td>
			<a href="/changepassword.asp?changepass=one"  id='menulk'>
       Change Password &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/logoff.asp"  id='menulk'> Sign Out &nbsp; &nbsp;</a></td>
    </tr>

  </table>
  
  
   <% '--------------------------------------------------------------------------------------------------------------------------------------------------
     ' ITIL Service Operation Online course'
	 
		 case "verified17" 	%>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftMenu"  id="primarynav">   
     <tr>
      <td ><a href="/overview.asp"  id='menulk'>Overview of course &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>  
    <tr>
      <td><a href="/syllabus-Requirement.asp"  id='menulk'>Syllabus &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% If Session("KNO") = "" Then %>
    <tr>
      <td><a href="/ServiceOperation/guidesIndex.asp"  id='menulk'>Select Chapter &nbsp; &nbsp;</a></td>
    </tr>
	<% Else %>  
    <tr>
		  <td><a href="/ServiceOperation/guidesIndex.asp"  id='menulk'>Change Chapter &nbsp; &nbsp;</a></td>
    </tr>
    <% End If %>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/methodology/tour9.asp"  id='menulk' onclick="test">Study Methodology &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
     <tr>
      <td class="level1">Search</td>
    </tr>
    <tr>
      <td>
        <form name="search" action="/ITILOperationSearch.asp" method="post" style="display:inline" target="_blank" onsubmit="return Form_Validator(this)">
         <table border="0px" cellpadding="0px" cellspacing="0px" width="100%"><tr>
        <td width="142px;"> 
        
        <input type='text' name="searchData" class="searchBox" id='searchbox' style="color: rgb(161, 161, 161);width:110px;height:25px;"  class="TeXtField" value="Glossary Search"  onfocus='myObj = document.getElementById("searchbox");if(this.value=="Glossary Search") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("searchbox");if(myObj.value == "") myObj.value="Glossary Search";myObj.style.color = "#a1a1a1";if(myObj.value!="Glossary Search") myObj.style.color="#000000";'> </td>
        
        <td> <div id="submitbox" style="display:inline"><input type="image" src="/images/buttons/searchbg.gif"></div></td>
        </tr>
        </table>
        
          
    </form>
        

      </td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% If Session("KNO") <> "" Then
	 %>
  
    <tr>
      <td class="level1"><% = Session("ChapterName") %></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ServiceOperation/guides1.asp"  id='menulk'>- Study Guides &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ServiceOperation/chapterTestsIndex.asp"  id='menulk'>- Chapter Test &nbsp; &nbsp;</a></td>
    </tr>

    <tr>
      <td class="subMenu"><a href="/ServiceOperation/pdusindex.asp"  id='menulk'>- Evaluation &nbsp; &nbsp;</a></td>
    </tr>
 
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% End If %>
    
     <tr>
      <td><a href="/ServiceOperation/SO_samplePapers.asp"  id='menulk'>Service Operation Papers &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
     
         <tr>
      <td>
 
<a href="/ServiceOperation/feedback.asp"  id='menulk' >Post course Feedback  &nbsp; &nbsp;</a>
           
      </td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/query.asp"  id='menulk'>Query/Suggestion &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    
  <tr>
  <td class="level1">Ask me a question</td>
  </tr>
  <tr>
      <td>   
      <form action="/searchresults1.asp" id="cse-search-box" target="_blank">
        <table border="0px" cellpadding="0px" cellspacing="0px" width="100%"><tr>
        <td width="142px;"> 

    <input type="hidden" name="cx" value="016011900712214369325:uxcy_lv2cqa" />
    
     <input type="hidden" name="cof" value="FORID:9" />
    <input type="hidden" name="ie" value="UTF-8" />
    <input type="hidden" name="filter" value="0" />
<input type="text" name="q"  class="searchBox" id='searchbox'/>
<td><input type="image" name="sa2" value="Go" id="submitbox" src="/images/buttons/searchbg.gif"/></td>
   </tr>
        </table>
</form>
        </td>
    </tr>
     <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/ServiceOperation/help.asp"  id='menulk'>Help  &nbsp; &nbsp;</a></td>
    </tr>
	<tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	<tr><td>
			<a href="/changepassword.asp?changepass=one"  id='menulk'>
       Change Password &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/logoff.asp"  id='menulk'> Sign Out &nbsp; &nbsp;</a></td>
    </tr>

  </table>
  
  
  
  
  	<% 'FOR ITIL Intermediate (OSA) Online course'
		 case "verified11" 	%>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftMenu"  id="primarynav">   
     <tr>
      <td ><a href="/overview.asp"  id='menulk'>Overview of course &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>  
    <tr>
      <td><a href="/syllabus-Requirement.asp"  id='menulk'>Syllabus &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% If Session("KNO") = "" Then %>
    <tr>
      <td><a href="/ITIL-OSA/guidesIndex.asp"  id='menulk'>Select Chapter &nbsp; &nbsp;</a></td>
    </tr>
	<% Else %>  
    <tr>
		  <td><a href="/ITIL-OSA/guidesIndex.asp"  id='menulk'>Change Chapter &nbsp; &nbsp;</a></td>
    </tr>
    <% End If %>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/methodology/tour5.asp"  id='menulk' onclick="test">Study Methodology &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
     <tr>
      <td class="level1">Search</td>
    </tr>
    <tr>
      <td>
        <form name="search" action="/ITILOSAsearch.asp" method="post" style="display:inline" target="_blank" onsubmit="return Form_Validator(this)">
         <table border="0px" cellpadding="0px" cellspacing="0px" width="100%"><tr>
        <td width="142px;"> 
        
        <input type='text' name="searchData" class="searchBox" id='searchbox' style="color: rgb(161, 161, 161);width:110px;height:25px;"  class="TeXtField" value="Glossary Search"  onfocus='myObj = document.getElementById("searchbox");if(this.value=="Glossary Search") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("searchbox");if(myObj.value == "") myObj.value="Glossary Search";myObj.style.color = "#a1a1a1";if(myObj.value!="Glossary Search") myObj.style.color="#000000";'> </td>
        
        <td> <div id="submitbox" style="display:inline"><input type="image" src="/images/buttons/searchbg.gif"></div></td>
        </tr>
        </table>
        
          
    </form>
        

      </td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% If Session("KNO") <> "" Then
	 %>
  
    <tr>
      <td class="level1"><% = Session("ChapterName") %></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ITIL-OSA/guides1.asp"  id='menulk'>- Study Guides &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ITIL-OSA/chapterTestsIndex.asp"  id='menulk'>- Chapter Test &nbsp; &nbsp;</a></td>
    </tr>
	    <tr>
      <td class="subMenu"><a href="/ITIL-OSA/scenarioChapterTest.asp"  id='menulk'>- Scenario Based Chapter Test &nbsp; &nbsp;</a></td>
    </tr>

    <tr>
      <td class="subMenu"><a href="/ITIL-OSA/pdusindex.asp"  id='menulk'>- Evaluation &nbsp; &nbsp;</a></td>
    </tr>
 
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% End If %>
     <!-- <tr>
      <td><a href="/practiceQues-CSI.asp"  id='menulk'>APMG Sample Paper Q & A &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>-->
	 <tr>
      <td><a href="/ITIL-OSA-Sample1/sample1Ques/TestRules.asp"  id='menulk'>APMG Sample Paper 1 &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	 <tr>
      <td><a href="/ITIL-OSA-Sample2/sample2Ques/TestRules.asp"  id='menulk'>APMG Sample Paper 2 &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	
	<% If Session("KnoPassed") = 9 Then %>
		  <tr>
		   <td>
		 <a href="/courseOSACertificate.asp" target="_blank"  id='menulk' >Course Certificate &nbsp; &nbsp;</a>  
</td></tr>
 <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <!--<tr>
      <td><a href=""  id='menulk' onclick="showPDF(); return false;" >Generate Voucher &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>-->
     <% End If %>
         <tr>
      <td>
 
<a href="/ITIL-OSA/feedback.asp"  id='menulk' >Post course Feedback  &nbsp; &nbsp;</a>
           
      </td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/query.asp"  id='menulk'>Query/Suggestion &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    
  <tr>
  <td class="level1">Ask me a question</td>
  </tr>
  <tr>
      <td>   
      <form action="/searchresults1.asp" id="cse-search-box" target="_blank">
        <table border="0px" cellpadding="0px" cellspacing="0px" width="100%"><tr>
        <td width="142px;"> 

    <input type="hidden" name="cx" value="016011900712214369325:uxcy_lv2cqa" />
    
     <input type="hidden" name="cof" value="FORID:9" />
    <input type="hidden" name="ie" value="UTF-8" />
    <input type="hidden" name="filter" value="0" />
<input type="text" name="q"  class="searchBox" id='searchbox'/>
<td><input type="image" name="sa2" value="Go" id="submitbox" src="/images/buttons/searchbg.gif"/></td>
   </tr>
        </table>
</form>
        </td>
    </tr>
     <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/ITIL-OSA/help.asp"  id='menulk'>Help  &nbsp; &nbsp;</a></td>
    </tr>
	<tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	<tr><td>
			<a href="/changepassword.asp?changepass=one"  id='menulk'>
       Change Password &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/logoff.asp"  id='menulk'> Sign Out &nbsp; &nbsp;</a></td>
    </tr>

  </table>
  
  <% 'FOR ITIL Intermediate (PPO) Online course'
		 case "verified18" 	%>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftMenu"  id="primarynav">   
     <tr>
      <td ><a href="/overview.asp"  id='menulk'>Overview of course &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>  
    <tr>
      <td><a href="/syllabus-Requirement.asp"  id='menulk'>Syllabus &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% If Session("KNO") = "" Then %>
    <tr>
      <td><a href="/ITIL-PPO/guidesIndex.asp"  id='menulk'>Select Chapter &nbsp; &nbsp;</a></td>
    </tr>
	<% Else %>  
    <tr>
		  <td><a href="/ITIL-PPO/guidesIndex.asp"  id='menulk'>Change Chapter &nbsp; &nbsp;</a></td>
    </tr>
    <% End If %>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/methodology/ITIL-Intermediate-PPO-ClassroomTraining.asp"  id='menulk' onclick="test">Study Methodology &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    
    <% If Session("KNO") <> "" Then
	 %>
  
    <tr>
      <td class="level1"><% = Session("ChapterName") %></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ITIL-PPO/guides1.asp"  id='menulk'>- Study Guides &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ITIL-PPO/chapterTestsIndex.asp"  id='menulk'>- Chapter Test &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ITIL-PPO/pdusindex.asp"  id='menulk'>- Evaluation &nbsp; &nbsp;</a></td>
    </tr>
 
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% End If %>
       <tr>
      <td><a href="/ITIL-PPO/PPO_samplePapers.asp"  id='menulk'>PPO Sample Papers &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	
	
     <% 'If Session("KnoPassed") = 8 Then %>
		 <!--   <tr>
		   <td>
		 <a href="/coursePPOCertificate.asp" target="_blank"  id='menulk' >Course Certificate &nbsp; &nbsp;</a>  
</td></tr>
 <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href=""  id='menulk' onclick="showPDF(); return false;" >Generate Voucher &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>-->
     <% 'End If %>
         <tr>
      <td>
 
<a href="/ITIL-PPO/feedback.asp"  id='menulk' >Post course Feedback  &nbsp; &nbsp;</a>
           
      </td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/query.asp"  id='menulk'>Query/Suggestion &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    
  <tr>
  <td class="level1">Ask me a question</td>
  </tr>
  <tr>
      <td>   
      <form action="/searchresults1.asp" id="cse-search-box" target="_blank">
        <table border="0px" cellpadding="0px" cellspacing="0px" width="100%"><tr>
        <td width="142px;"> 

    <input type="hidden" name="cx" value="016011900712214369325:uxcy_lv2cqa" />
    
     <input type="hidden" name="cof" value="FORID:9" />
    <input type="hidden" name="ie" value="UTF-8" />
    <input type="hidden" name="filter" value="0" />
<input type="text" name="q"  class="searchBox" id='searchbox'/>
<td><input type="image" name="sa2" value="Go" id="submitbox" src="/images/buttons/searchbg.gif"/></td>
   </tr>
        </table>
</form>
        </td>
    </tr>
     <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/ITIL-PPO/help.asp"  id='menulk'>Help  &nbsp; &nbsp;</a></td>
    </tr>
	<tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	<tr><td>
			<a href="/changepassword.asp?changepass=one"  id='menulk'>
       Change Password &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/logoff.asp"  id='menulk'> Sign Out &nbsp; &nbsp;</a></td>
    </tr>

  </table>

<% 'FOR ITIL Intermediate (SOA) Online course'
		 case "verified19" 	%>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftMenu"  id="primarynav">   
     <tr>
      <td ><a href="/overview.asp"  id='menulk'>Overview of course &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>  
    <tr>
      <td><a href="/syllabus-Requirement.asp"  id='menulk'>Syllabus &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% If Session("KNO") = "" Then %>
    <tr>
      <td><a href="/ITIL-SOA/guidesIndex.asp"  id='menulk'>Select Chapter &nbsp; &nbsp;</a></td>
    </tr>
	<% Else %>  
    <tr>
		  <td><a href="/ITIL-SOA/guidesIndex.asp"  id='menulk'>Change Chapter &nbsp; &nbsp;</a></td>
    </tr>
    <% End If %>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/methodology/ITIL-Intermediate-SOA-ClassroomTraining.asp"  id='menulk' onclick="test">Study Methodology &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    
    <% If Session("KNO") <> "" Then
	 %>
  
    <tr>
      <td class="level1"><% = Session("ChapterName") %></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ITIL-SOA/guides1.asp"  id='menulk'>- Study Guides &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ITIL-SOA/chapterTestsIndex.asp"  id='menulk'>- Chapter Test &nbsp; &nbsp;</a></td>
    </tr>
	 
    <tr>
      <td class="subMenu"><a href="/ITIL-SOA/pdusindex.asp"  id='menulk'>- Evaluation &nbsp; &nbsp;</a></td>
    </tr>
 
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% End If %>
    
	 <tr>
      <td><a href="/ITIL-SOA/SOA_samplePapers.asp"  id='menulk'>SOA Sample Papers &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	 
         <tr>
      <td>
 
<a href="/ITIL-SOA/feedback.asp"  id='menulk' >Post course Feedback  &nbsp; &nbsp;</a>
           
      </td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/query.asp"  id='menulk'>Query/Suggestion &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    
  <tr>
  <td class="level1">Ask me a question</td>
  </tr>
  <tr>
      <td>   
      <form action="/searchresults1.asp" id="cse-search-box" target="_blank">
        <table border="0px" cellpadding="0px" cellspacing="0px" width="100%"><tr>
        <td width="142px;"> 

    <input type="hidden" name="cx" value="016011900712214369325:uxcy_lv2cqa" />
    
     <input type="hidden" name="cof" value="FORID:9" />
    <input type="hidden" name="ie" value="UTF-8" />
    <input type="hidden" name="filter" value="0" />
<input type="text" name="q"  class="searchBox" id='searchbox'/>
<td><input type="image" name="sa2" value="Go" id="submitbox" src="/images/buttons/searchbg.gif"/></td>
   </tr>
        </table>
</form>
        </td>
    </tr>
     <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/ITIL-SOA/help.asp"  id='menulk'>Help  &nbsp; &nbsp;</a></td>
    </tr>
	<tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	<tr><td>
			<a href="/changepassword.asp?changepass=one"  id='menulk'>
       Change Password &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/logoff.asp"  id='menulk'> Sign Out &nbsp; &nbsp;</a></td>
    </tr>

  </table>
<% 'FOR ITIL Intermediate (RCV) Online course'
		 case "verified20" 	%>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftMenu"  id="primarynav">   
     <tr>
      <td ><a href="/overview.asp"  id='menulk'>Overview of course &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>  
    <tr>
      <td><a href="/syllabus-Requirement.asp"  id='menulk'>Syllabus &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% If Session("KNO") = "" Then %>
    <tr>
      <td><a href="/ITIL-RCV/guidesIndex.asp"  id='menulk'>Select Chapter &nbsp; &nbsp;</a></td>
    </tr>
	<% Else %>  
    <tr>
		  <td><a href="/ITIL-RCV/guidesIndex.asp"  id='menulk'>Change Chapter &nbsp; &nbsp;</a></td>
    </tr>
    <% End If %>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/methodology/ITIL-Intermediate-RCV-ClassroomTraining.asp"  id='menulk' onclick="test">Study Methodology &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
     <tr>
      <td class="level1">Search</td>
    </tr>
    <tr>
      <td>
        <form name="search" action="/ITILRCVsearch.asp" method="post" style="display:inline" target="_blank" onsubmit="return Form_Validator(this)">
         <table border="0px" cellpadding="0px" cellspacing="0px" width="100%"><tr>
        <td width="142px;"> 
        
        <input type='text' name="searchData" class="searchBox" id='searchbox' style="color: rgb(161, 161, 161);width:110px;height:25px;"  class="TeXtField" value="Glossary Search"  onfocus='myObj = document.getElementById("searchbox");if(this.value=="Glossary Search") myObj.value="";myObj.style.color = "#000000";' onblur='myObj = document.getElementById("searchbox");if(myObj.value == "") myObj.value="Glossary Search";myObj.style.color = "#a1a1a1";if(myObj.value!="Glossary Search") myObj.style.color="#000000";'> </td>
        
        <td> <div id="submitbox" style="display:inline"><input type="image" src="/images/buttons/searchbg.gif"></div></td>
        </tr>
        </table>
        
          
    </form>
        

      </td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% If Session("KNO") <> "" Then
	 %>
  
    <tr>
      <td class="level1"><% = Session("ChapterName") %></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ITIL-RCV/guides1.asp"  id='menulk'>- Study Guides &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="subMenu"><a href="/ITIL-RCV/chapterTestsIndex.asp"  id='menulk'>- Chapter Test &nbsp; &nbsp;</a></td>
    </tr>

    <tr>
      <td class="subMenu"><a href="/ITIL-RCV/pdusindex.asp"  id='menulk'>- Evaluation &nbsp; &nbsp;</a></td>
    </tr>
 
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <% End If %>
     <!-- <tr>
      <td><a href="/ITIL-RCV/RCV_samplePapers.asp"  id='menulk'>RCV Sample Papers &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>-->
	
	
     <% If Session("KnoPassed") = 8 Then %>
		  <!--  <tr>
		   <td>
		 <a href="/courseRCVCertificate.asp" target="_blank"  id='menulk' >Course Certificate &nbsp; &nbsp;</a>  
</td></tr>
 <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href=""  id='menulk' onclick="showPDF(); return false;" >Generate Voucher &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>-->
     <% End If %>
         <tr>
      <td>
 
<a href="/ITIL-RCV/feedback.asp"  id='menulk' >Post course Feedback  &nbsp; &nbsp;</a>
           
      </td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/query.asp"  id='menulk'>Query/Suggestion &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    
  <tr>
  <td class="level1">Ask me a question</td>
  </tr>
  <tr>
      <td>   
      <form action="/searchresults1.asp" id="cse-search-box" target="_blank">
        <table border="0px" cellpadding="0px" cellspacing="0px" width="100%"><tr>
        <td width="142px;"> 

    <input type="hidden" name="cx" value="016011900712214369325:uxcy_lv2cqa" />
    
     <input type="hidden" name="cof" value="FORID:9" />
    <input type="hidden" name="ie" value="UTF-8" />
    <input type="hidden" name="filter" value="0" />
<input type="text" name="q"  class="searchBox" id='searchbox'/>
<td><input type="image" name="sa2" value="Go" id="submitbox" src="/images/buttons/searchbg.gif"/></td>
   </tr>
        </table>
</form>
        </td>
    </tr>
     <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/ITIL-RCV/help.asp"  id='menulk'>Help  &nbsp; &nbsp;</a></td>
    </tr>
	<tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
	<tr><td>
			<a href="/changepassword.asp?changepass=one"  id='menulk'>
       Change Password &nbsp; &nbsp;</a></td>
    </tr>
    <tr>
      <td class="bottomBorder">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="/logoff.asp"  id='menulk'> Sign Out &nbsp; &nbsp;</a></td>
    </tr>

  </table>


  <% End Select	%>

  <% Else %>
  <table border="0" cellspacing="0" cellpadding="2">
    	<% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin")="United Kingdom" OR Session("CountryOrigin") = "Australia"  Then %>
	<tr>
	<td>
    <iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fitilstudy&amp;width=292&amp;height=62&amp;colorscheme=light&amp;show_faces=false&amp;border_color&amp;stream=false&amp;header=false" scrolling="no" frameborder="0" style="border:1px solid #94A3C4; overflow:hidden; width:205px; height:62px;" allowTransparency="true"></iframe>
    
   <!-- <iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2FITILstudy%2Fapp_128953167177144+&amp;width=292&amp;height=62&amp;colorscheme=light&amp;show_faces=false&amp;border_color&amp;stream=false&amp;header=true" scrolling="no" frameborder="0" style="border:1px; overflow:hidden; width:205px; height:62px;" allowTransparency="true"></iframe>-->
    
    </td>
	</tr>
	 <tr>
      <td>&nbsp;</td>
    </tr>
 <%End If %>
 
 <% If Session("CountryOrigin") = "Germany" Then %>
 
    <tr>
      <td id="imageHover"><a href="/german/ITIL-Kurs.asp"><img src="/images/German/Basic.png" border="0" ></a><br /><br /></td>
    </tr>
     <tr>
      <td id="imageHover"><object width="200" height="150"><iframe width="200" height="150" src="http://www.youtube.com/embed/G7sizMIi9K4?wmode=transparent" frameborder="0" allowfullscreen></iframe><br /><br /></td>
    </tr>    
      <tr><td>              <table>
                        <tr><td rowspan="2"><a href="/freeresources/freeSimulatedTest.asp"><img src="/images/symbol/symbol_free.jpg"></a></td><td><a href="/freeresources/freeSimulatedTest.asp"><img src="/images/symbol/symbol_free_text.jpg"></a><br />ITIL<sup>&reg;</sup> Exam <br />Practice Test</td></tr>
                        <tr><td></td></tr>

                    </table></td></tr>
	<tr>
    <td>
    <div id="contact-box" align="center">
           <b>Speak to our ITIL trainer today</b><br>
           <span class="ph-no"><b>(+49) 069 344643</b></span>
        </div>		
        </td>
        </tr>
    
    <% else %>
    <% If Session("CountryOrigin") <> "India" AND Session("CountryOrigin") <> "UAE" AND Session("CountryOrigin") <> "Other" AND Session("CountryOrigin") <> "Australia" AND Session("CountryOrigin") <> "United Kingdom" Then %>

     <tr>
      <td id="imageHover"><iframe width="200" height="150" src="http://www.youtube.com/embed/G7sizMIi9K4?wmode=transparent" frameborder="0" allowfullscreen></iframe><br /><br /></td>
    </tr>
      <tr><td>              <table>
                        <tr><td rowspan="2"><a href="/freeresources/freeSimulatedTest.asp"><img src="/images/symbol/symbol_free.jpg"></a></td><td><a href="/freeresources/freeSimulatedTest.asp"><img src="/images/symbol/symbol_free_text.jpg"></a><br />ITIL<sup>&reg;</sup> Exam <br />Practice Test</td></tr>
                        <tr><td></td></tr>

                    </table></td></tr>
    <% End If %>
    <% If Session("CountryOrigin") <> "United Kingdom" AND Session("CountryOrigin") <> "UAE" AND Session("CountryOrigin") <> "Australia"  Then %>
      <%If Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Other" Then %>
                  <tr><td>              <table>
                        <tr><td rowspan="2"><a href="/freeresources/freeSimulatedTest.asp"><img src="/images/symbol/symbol_free.jpg"></a></td><td><a href="/freeresources/freeSimulatedTest.asp"><img src="/images/symbol/symbol_free_text.jpg"></a><br />ITIL<sup>&reg;</sup> Exam <br />Practice Test</td></tr>
                        <tr><td></td></tr>

                    </table></td></tr>
      <%end If %>
    <tr>
      <td id="imageHover"><a href="/ITIL-Courses.asp"><img src="/images/buttons/courses_basic.jpg"   border="0" ></a><br /><br /></td>
    </tr>

    <% End If %>
     <% If Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Australia" Then %>
     
     <tr>
      
      <td id="imageHover"><object width="200" height="150"><iframe width="200" height="150" src="http://www.youtube.com/embed/G7sizMIi9K4?wmode=transparent" frameborder="0" allowfullscreen></iframe><br /><br /></td>
   
    </tr>  
    <tr><td>              <table>
                        <tr><td rowspan="2"><a href="/freeresources/freeSimulatedTest.asp"><img src="/images/symbol/symbol_free.jpg"></a></td><td><a href="/freeresources/freeSimulatedTest.asp"><img src="/images/symbol/symbol_free_text.jpg"></a><br />ITIL<sup>&reg;</sup> Exam <br />Practice Test</td></tr>
                        <tr><td></td></tr>

                    </table></td></tr>

	
    <tr>
    
    <td>
      <link rel="stylesheet" type="text/css" href="/css/innerleftmenu.css">
  
   <div id="left_navigation">
  
    
    <table>
    <tr><td>
     <div id="contact-box">
      <% If Session("CountryOrigin") = "United Kingdom" Then %>
           <b>Speak to our ITIL Counsellor </b><br>
           <span class="ph-no"><b>020-79568922</b></span><br />
           or<br /><% End If %><b><a href="/callback.asp">
           <table style="text-align:left">
           <tr>
           <td width="40px"><img src="/images/buttons/Request.png" border="0" ></td><td style="vertical-align:middle; color:#09C"> &nbsp;Request a call back</td></tr></table></a>
           
       	</div>
        </td>
        </tr>
        
   
   <tr><td>
 
<%
   Dim valur,svrUrl,Rqsplit
   ' Code for getting URL and splitting and using as per for requrement'	
		svrHttps = request.servervariables("HTTPS")
		svrHost = request.servervariables("HTTP_HOST")
		svrUrl = request.servervariables("URL")
		
		RqRetriveURLCount = Split(svrUrl,"/")
		rqCount = 0
		for i = 0 to  UBound(RqRetriveURLCount)
		
		rqCount = rqCount + 1
		
		NEXT
		
		RetriveURL = Split(svrUrl,"/",int(rqCount))
		  
%>




<% '--------------- Here starts the conditions for leftmenus -------------------------'
      ' -------  Here starts PRINCE2 folder leftmenu ------------------' %>
<%

Rqsplit = Split(svrUrl,"/",3)

Rqname =Rqsplit(1)
if ubound(Rqsplit) = 2 Then
	Rqname = Rqsplit(2)
End If
%>
<% If RqName = "ITIL-Courses.asp" Then %>

<div style="float: left" id="my_menu" class="sdmenu">
<div>

  <span>Why ITILstudy</span>
  
  <% ' Why PROJstudy PRINCE2 left menu for Uk'%>
   
   
  <% If RqName = "better-than-competitors.asp" Then %>
  <a onClick="makeActive();" href="/ITIL-Training/better-than-competitors.asp" id="selected">Better than Competitors</a>
  <% Else %>
  <a onClick="makeActive();" href="/ITIL-Training/better-than-competitors.asp">Better than Competitors</a>
  <% End If %>
  
  <% If RqName = "Success-Rate.asp" Then %>
  <a onClick="makeActive();"  href="/ITIL-Training/Success-Rate.asp" id="selected">99.2% Pass Rate</a>
  <% Else %>
  <a onClick="makeActive();" href="/ITIL-Training/Success-Rate.asp">99.2% Pass Rate</a>
  <% End If %>
  
  <% If RqName = "moneyBack.asp" Then %>
  <a onClick="makeActive();"  href="/ITIL-Training/moneyBack.asp" id="selected">100% Moneyback Guarantee</a>
  <% Else %>
  <a onClick="makeActive();" href="/ITIL-Training/moneyBack.asp">100% Moneyback Guarantee</a>
  <% End If %>
  
  <% If RqName = "courseBenefits.asp" Then %>
  <a onClick="makeActive();"  href="/ITIL-Training/courseBenefits.asp" id="selected">Course Benifits</a>
  <% Else %>
  <a onClick="makeActive();" href="/ITIL-Training/courseBenefits.asp">Course Benifits</a>
  <% End If %>
  
  <% If RqName = "instructors.asp" Then %>
  <a onClick="makeActive();"  href="/ITIL-Training/instructors.asp" id="selected">Best Faculty</a>
  <% Else %>
  <a onClick="makeActive();" href="/ITIL-Training/instructors.asp">Best Faculty</a>
  <% End If %>
  
  <% If RqName = "free-onlinecertification.asp" Then %>
  <a onClick="makeActive();" href="/ITIL-Training/free-onlinecertification.asp" id="selected">Free Risk Management Course</a>
  <% Else %>
  <a onClick="makeActive();" href="/ITIL-Training/free-onlinecertification.asp">Free Risk Management Course</a>
  <% End if %>
  
  <% If RqName = "classroom-FAQ.asp" Then %>
  <a onClick="makeActive();"  href="/ITIL-Training/classroom-FAQ.asp" id="selected">FAQs</a>
  <% Else %>
  <a onClick="makeActive();" href="/ITIL-Training/classroom-FAQ.asp">FAQs</a>
  <% End If %>
  
  
  <% If Rqname = "feedback_class.asp" Then %>
  <a onClick="makeActive();"  href="/feedback_class.asp" id="selected">ITILstudy Testimonials</a>
  <% Else %>
  <a onClick="makeActive();" href="/feedback_class.asp">ITILstudy Testimonials</a>
  <% End If %>
  
  <% If RqName = "comprehensive.asp" Then %>
  <a onClick="makeActive();" href="/ITIL-Training/comprehensive.asp" id="selected">Most Comprehensive and Effective</a>
  <% Else %>
  <a onClick="makeActive();" href="/ITIL-Training/comprehensive.asp">Most Comprehensive and Effective</a>
  <% End if %>
  
  <% If RqName = "exam-success.asp" Then %>
  <a onClick="makeActive();" href="/ITIL-Training/exam-success.asp" id="selected">Most Successful and Popular</a>
  <% Else %>
  <a onClick="makeActive();" href="/ITIL-Training/exam-success.asp">Most Successful and Popular</a>
  <% End If %>
  
  <% If RqName = "PMI_PDU.asp" Then %>
  <a onClick="makeActive();"  href="/ITIL-Training/PMI_PDU.asp" id="selected">PMI Approved PDUs</a>
  <% Else %>
  <a onClick="makeActive();" href="/ITIL-Training/PMI_PDU.asp">PMI Approved PDUs</a>
  <% End If %>
  
  </div>
  
  </div>
  
  <% End If  %>
  </div>

<script type="text/javascript">
var myMenu;
myMenu = new SDMenu("my_menu");
myMenu.oneSmOnly = true;
myMenu.remember= true;
myMenu.markCurrent = true;
myMenu.speed = 4;
<% if valur <> "" Then%>
var firstSubmenu = myMenu.submenus[<% = valur%>];
myMenu.expandMenu(firstSubmenu);  
<% end if %>
myMenu.init();
</script>
</td></tr></table></td></tr>
    <%ElseIf Session("CountryOrigin") = "India" Then%>
	    <tr>
      <td id="imageHover"><a href="/indexindia.asp"><img src="/images/buttons/ITIL-Advanced.jpg"   border="0" ></a><br /><br /></td>
    </tr>	 
    <% ElseIf Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada"  Then %>
    <tr>
      <td id="imageHover"><a href="/indexus.asp"><img src="/images/buttons/ITIL-Advanced.jpg"   border="0" ></a><br /><br /></td>
    </tr>
    <% End If %>
    <% If Session("CountryOrigin") <> "United Kingdom" AND Session("CountryOrigin") <> "UAE" AND Session("CountryOrigin") <> "Australia" Then %>
	<tr>
      <td id="imageHover"><a href="/ITIL-Online-Courses.asp#edu"><img src="/images/buttons/edu.png"   border="0" ></a><br /><br /></td>
    </tr>
    <% 'If Session("CountryOrigin") = "US" Then %>
     <tr>
      <td id="imageHover"><a href="/ITIL-Online-Courses.asp#Blend"><img src="/images/buttons/Blended.png"   border="0" ></a><br /><br /></td>
    </tr>
    <% End If%>
<!--	 <%' If Session("CountryOrigin") <> "India" Then %>
	  <tr>
      <td id="imageHover"><a href="/ITIL-Online-Courses.asp#OSA"><img src="/images/buttons/OSA.png"   border="0" ></a></td>
    </tr>-->
    <% End If  %>
   
  </table>
  <% End If%>
</td>
