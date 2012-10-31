<link rel="shortcut icon" href="/images/buttons/favicon.ico">
<link rel="stylesheet" type="text/css" href="/css/chromestyle.css">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script type="text/javascript" src="/js/chrome.js"></script>
<style type="text/css"></style>
<script type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function getCountry() {

    document.forms["myform"].submit();

}
-->
</script>
<%
If Request.Form("country") <> "" Then
	Session("CountryOrigin") = Request.Form("country")
Else
	Session("CountryOrigin") = Session("CountryOrigin")
End If 	

If(Session("CountryOrigin")<>"") Then

%>
<% Else %>


<!--#include virtual="/includes/headerConnection.asp"-->
<%

					Dim sIPAddress, objHtp, strQuery11


						sIPAddress = Request.ServerVariables("HTTP_X_FORWARDED_FOR")

						If sIPAddress="" Then sIPAddress = Request.ServerVariables("REMOTE_ADDR")


						strQuery11 = "http://geoip1.maxmind.com/b?l=4tAUhyTgUD6d" & _
							"&i=" & sipaddress
						set objHtp = Server.CreateObject("Msxml2.ServerXMLHTTP")
						objHtp.open "GET", strQuery11, false
						objHtp.send
						sipAddress = sipAddress + ";" + objHtp.ResponseText

					ConnObj1.Execute "INSERT INTO countrydetails (other, created_date, source_from) values('"&sIPAddress&"','"&now()&"', '"& Session("CountryOrigin") &"')"


If InStr(sipAddress,"IN") Then
	Session("CountryOrigin")="India"
	End If
	
If InStr(sipAddress,";US,") Then
		Session("CountryOrigin") = "US"
	End If
	
If InStr(sipAddress,";CA,") Then
		Session("CountryOrigin") = "Canada"
	End If
	
If InStr(sipAddress,";SG,") Then
		Session("CountryOrigin") = "Singapore"
	End If
	
If (InStr(sipAddress,";AU,")) Then
		Session("CountryOrigin") = "Australia"
	End If
	

If (InStr(sipAddress,";GB,") OR InStr(sipAddress,";UK,")) Then
		Session("CountryOrigin") = "United Kingdom"
	End If
	
If InStr(sipAddress,";AE,") Then
		Session("CountryOrigin") = "UAE"
	End If
	
If Session("CountryOrigin")="" Then
		Session("CountryOrigin")="Other"
	End If	

Set objHtp = Nothing
Set ConnObj1 = Nothing

End If
%>
<!--Google Analytic code -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-11335447-11']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

</head>
<body bgcolor="#CCCCCC" vlink="#0099CC" leftmargin="0" topmargin="0" onLoad="MM_preloadImages('/images/back/link_01_why_us_green.jpg','/images/back/link_02_courses_enroll_green.jpg','//6sigmastudyimages/back/link_03_free_resources_green.jpg','/images/back/link_04_methodology_green.jpg','/images/back/link_05_about_us_green.jpg','/images/back/link_06_login_green.jpg')">
<div align="center" class="MainTableBack" style="width:100%;">

<!-- Header Start -->
<div align="center" style="margin-top:-12px;" >
<div style="width:930px;" align="center">
  <table width="930" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><div align="right">
        <table width="930" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="580">&nbsp;</td>
			   <form name="myform" method="post">
              <td><br /> <% If Session("CountryOrigin") <> "Other" Then %>
                      <img src="/images/countries/<% = Trim(Session("CountryOrigin")) %>.gif" height="11px" />
           <% End If %>
                <select name="country" id="country" onChange="getCountry();">
                  <option value="">-Select-</option>
				  <option <% If Session("CountryOrigin") = "Australia" Then %> selected="selected" <% End If %> value="Australia">Australia</option>
                  <option <% If Session("CountryOrigin") = "India" Then %> selected="selected" <% End If %> value="India">India</option>
				   <option <% If Session("CountryOrigin") = "Singapore" Then %> selected="selected" <% End If %> value="Singapore">Singapore</option>
				    <option <% If Session("CountryOrigin") = "UAE" Then %> selected="selected" <% End If %> value="UAE">UAE</option>
                  <option <% If Session("CountryOrigin") = "United Kingdom" Then %> selected="selected" <% End If %> value="United Kingdom">UK</option>
				   <option <% If Session("CountryOrigin") = "US" Then %> selected="selected" <% End If %> value="US">US/Canada</option>
                    <option <% If Session("CountryOrigin") = "Other" Then %> selected="selected" <% End If %> value="Other">Other</option>
                </select>
              </td>
            </form>
             
      
            <td width="220"><br>
              <span class="style1"><a href="/index.asp">Home</a> | <a href="/contactus.asp">Contact</a>  | <a href="/sitemap.asp">Sitemap</a> 
              <%If(Session("FirstName")<>"") Then%>
              | <a href="/overview.asp">My Account</a>
              <%Else%>
             | <a href="/memberlogin.asp">Sign In</a>
              <%End If%>
              </span></td>
          </tr>
        </table>
        <div>
      </td>
    </tr>
    <tr>
	
	 <% If Session("CountryOrigin") = "India" Then %>
      <td id="imageHover"><div style="position:relative" id="imageHover"> <a href="/index.asp" ><img src="/images/buttons/logo_top.jpg" alt="ITILstudy" border="0" usemap="#MapLogo" id="imageHover"/></a>
	   <div class="contactInTopLogo"> <span id="callUsAt">Call: <span style="color:#0673b9">080 41557547 / 9008748005 </span></span> <span id="emailUs">Email: <a href="mailto:marketing@itilstudy.com" style="color:#0673b9">marketing@itilstudy.com</a></span> <span id="info">ITILstudy is a brand of Edusys Services Private Limited</span> </div>
          <map name="MapLogo" id="MapLogo">
    <area shape="rect" coords="12,0,236,67" href="/index.asp" />
	<area shape="rect" coords="707,2,915,101" href="http://www.apmg-international.com/AccreditedOrganisations/EdusysServices.asp" target="_blank" />
  </map></div>
        </td>
		<% ElseIf Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada"  Then  %>
 <td id="imageHover"><div style="position:relative" id="imageHover"> <a href="/index.asp" ><img src="/images/buttons/logo_top.jpg" alt="ITILstudy" border="0" usemap="#MapLogo" id="imageHover"/></a>
	   <div class="contactInTopLogo-US"> <span id="info">Most Successful ITIL<sup>&reg;</sup> Classes with 100% Moneyback Guarantee</span> </div>
          <map name="MapLogo" id="MapLogo">
    <area shape="rect" coords="12,0,236,67" href="/index.asp" />
	<area shape="rect" coords="707,2,915,101" href="http://www.apmg-international.com/AccreditedOrganisations/EdusysServices-UK.asp" target="_blank" />
  </map>
        </div></td>
		
		<% ElseIf Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore"  Then  %>
 <td id="imageHover"><div style="position:relative" id="imageHover"> <a href="/index.asp" ><img src="/images/buttons/logo_top.jpg" alt="ITILstudy" border="0" usemap="#MapLogo" id="imageHover"/></a>
	   <div class="contactInTopLogo"><span id="callUsAt">Call: <span style="color:#0673b9">855-234-8454</span></span> <span id="emailUs">Email: <a href="mailto:marketing@itilstudy.com" style="color:#0673b9">marketing@itilstudy.com</a></span> <span id="info">Most Successful ITIL<sup>&reg;</sup> Classes with Moneyback Guarantee</span> </div>
          <map name="MapLogo" id="MapLogo">
    <area shape="rect" coords="12,0,236,67" href="/index.asp" />
	<area shape="rect" coords="707,2,915,101" href="http://www.apmg-international.com/AccreditedOrganisations/EdusysServices-UK.asp" target="_blank" />
  </map>
        </div></td>
       <% ElseIf Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Australia" Then %>
 <td id="imageHover"><div style="position:relative" id="imageHover"> <a href="/index.asp" ><img src="/images/buttons/logo_top.jpg" alt="ITILstudy" border="0" usemap="#MapLogo" id="imageHover"/></a>
	   <div class="contactInTopLogo"><span id="callUsAt">Call: <span style="color:#0673b9">0800 0337 097</span></span> <span id="emailUs">Email: <a href="mailto:marketing@itilstudy.com" style="color:#0673b9">marketing@itilstudy.com</a></span> <span id="info">Most Successful ITIL<sup>&reg;</sup> Classes with Moneyback Guarantee</span> </div>
          <map name="MapLogo" id="MapLogo">
    <area shape="rect" coords="12,0,236,67" href="/index.asp" />
	<area shape="rect" coords="707,2,915,101" href="http://www.apmg-international.com/AccreditedOrganisations/EdusysServices-UK.asp" target="_blank" />
  </map>
  </div>
      </td>      
      
      <% Else %>
       <td id="imageHover"><div style="position:relative" id="imageHover"> <a href="/index.asp" ><img src="/images/buttons/logo_top.jpg" alt="ITILstudy" border="0" usemap="#MapLogo" id="imageHover"/></a>
	  
          <map name="MapLogo" id="MapLogo">
    <area shape="rect" coords="12,0,236,67" href="/index.asp" />
  </map>
  </div>
      </td>
      <% End If %>
    </tr>
  </table>
	
  <table width="930px" align="center" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="930px" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="2"><div style="width: 930px;" class="chromestyle" id="chromemenu">
                <ul>
                  <li><a href="#" rel="dropmenu1"><img src="/images/back/link_01_why_us_grey.jpg" alt="ITILstudy" name="a" id="a" onMouseOver="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onMouseOut="MM_swapImgRestore()" border="0" ></a></li>
                  
                  <% If Session("CountryOrigin") = "United Kingdom" Then %>
                  <li><a href="#" rel="dropmenu2"> <img src="/images/back/link_02_courses_enrol_grey.jpg" alt="ITILstudy" name="b" id="b" onMouseOver="MM_swapImage('b','','/images/back/link_02_courses_enrol_green.jpg',1)" onMouseOut="MM_swapImgRestore()" border="0"  /></a></li>
				  <% Else %>
				  <li><a href="#" rel="dropmenu2"> <img src="/images/back/link_02_courses_enroll_grey.jpg" alt="ITILstudy" name="b" id="b" onMouseOver="MM_swapImage('b','','/images/back/link_02_courses_enroll_green.jpg',1)" onMouseOut="MM_swapImgRestore()" border="0"  /></a></li>
				  <% End If %>
				  
				   <li id="imageHover"><a href="#" rel="dropmenu5"><img src="/images/back/link_03_free_resources_grey.jpg" name="c" id="c" onMouseOver="MM_swapImage('c','','/images/back/link_03_free_resources_green.jpg',1)" onMouseOut="MM_swapImgRestore()" border="0"></a></li>
                  
                  <li><a href="#" rel="dropmenu3"><img src="/images/back/link_04_methodology_grey.jpg" alt="ITILstudy" name="d" id="d" onMouseOver="MM_swapImage('d','','/images/back/link_04_methodology_green.jpg',1)" onMouseOut="MM_swapImgRestore()"  border="0" ></a></li>
                  
                  <li><a href="#" rel="dropmenu4"><img src="/images/back/link_05_about_us_grey.jpg" alt="ITILstudy" name="e" id="e" onMouseOver="MM_swapImage('e','','/images/back/link_05_about_us_green.jpg',1)" onMouseOut="MM_swapImgRestore()"  border="0" ></a></li>
                  
                 <!-- <li><a href="#" rel="dropmenu4"><img src="/images/back/affiliates_grey.png" alt="ITILstudy" name="d" id="d" onMouseOver="MM_swapImage('d','','/images/back/affiliates_green.png',1)" onMouseOut="MM_swapImgRestore()"  border="0" ></a></li>-->
                  
                   <% If Session("FirstName") = "" Then %>
            <li id="imageHover"><a href="/memberlogin.asp" rel="dropmenu6"><img src="/images/back/link_06_login_grey.jpg" name="f" onMouseOver="MM_swapImage('f','','/images/back/link_06_login_green.jpg',1)" onMouseOut="MM_swapImgRestore()" border="0" ></a></li>
            <% Else %>
            <li id="imageHover"><a href="/logoff.asp" rel="dropmenu6"><img src="/images/back/link_06_logout_grey.jpg" name="f" onMouseOver="MM_swapImage('f','','/images/back/link_06_logout_green.jpg',1)" onMouseOut="MM_swapImgRestore()" border="0" ></a></li>
            <% End If %>
                 
                </ul>
              </div>
              
            <!--1st drop down menu -->
      <div style="top: 26px; left: 203px; clip: rect(0pt, auto, 94.8717px, 0pt); visibility: hidden;margin-top:5px;" id="dropmenu1" class="dropmenudiv">
        <% session.Timeout = 1000 %>
        <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Australia" Then %>
        <a href="/ITIL-Training/better-than-competitors.asp" onMouseOver="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onMouseOut="MM_swapImgRestore()">Classroom - Better than Competitors </a>
		
		<% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Australia"  Then %>
     
      <a href="/ITIL-Training/moneyBack.asp" onMouseOver="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onMouseOut="MM_swapImgRestore()">Classroom - Moneyback Guarantee</a>
	  <% End If %>
     
        <a href="/ITIL-Training/courseBenefits.asp" onMouseOver="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onMouseOut="MM_swapImgRestore()">Classroom - Course Benefits</a>
		
	  <%' If Session("CountryOrigin") = "India"  Then %>
	  
       <!-- <a href="/ITIL-Training/bestPrice.asp" onmouseover="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onmouseout="MM_swapImgRestore()">Classroom - Best Price</a>-->
		<%' End If %>
		
         <a href="/ITIL-Training/instructors.asp" onMouseOver="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onMouseOut="MM_swapImgRestore()">Classroom - Best Faculty</a>
		 
		<% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Australia" Then %>
        
        <a href="/ITIL-Training/free-onlinecertification.asp" onMouseOver="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onMouseOut="MM_swapImgRestore()">Classroom - Free 6sigma Green Belt Course /<span style="display:inline-block; margin-left:71px;"> Free HRD Course</span></a>
		 <% End If %>
		 
		  <a href="/ITIL-Training/classroom-FAQ.asp" onMouseOver="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onMouseOut="MM_swapImgRestore()">Classroom - FAQs </a>
		   <% 'End If %>
		
			
         <a href="/ITIL-Training/comprehensive.asp" onMouseOver="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onMouseOut="MM_swapImgRestore()">Most Comprehensive and Effective </a>
           <a href="/ITIL-Training/exam-success.asp" onMouseOver="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onMouseOut="MM_swapImgRestore()">Most Successful and Popular</a>
           <a href="/ITIL-Training/PMI_PDU.asp" onMouseOver="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onMouseOut="MM_swapImgRestore()">PMI Approved PDUs </a>
        <% End If %>
  <%If Session("CountryOrigin") = "Other"  Then %>
		  <a href="/ITIL-Training/courseBenefits-Online.asp" onMouseOver="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onMouseOut="MM_swapImgRestore()">Online - Course Benefits</a>
		    <% End If %>
      </div>
      
      
      <!--2nd drop down menu -->
      <div style="top: 26px; left: 203px; clip: rect(0pt, auto, 94.8717px, 0pt); visibility: hidden; margin-left:28px; margin-top:5px;" id="dropmenu2" class="dropmenudiv">
        <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Australia" Then %>
        <a href="/ITIL-Courses.asp" onMouseOver="MM_swapImage('b','','/images/back/link_02_courses_enroll_green.jpg',1)" onMouseOut="MM_swapImgRestore()">ITIL Classroom Courses </a>
		 <% End If %>
		 <%' ElseIf Session("CountryOrigin") = "Other" OR Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Canada" Then %>
        
       <a href="/ITIL-Online-Courses.asp" onMouseOver="MM_swapImage('b','','/images/back/link_02_courses_enroll_green.jpg',1)" onMouseOut="MM_swapImgRestore()">ITIL Online Courses</a> </div>
	   <% 'End If %>
	   
	    <!--3nd drop down menu -->
      <div style="top: 26px; left: 203px; clip: rect(0pt, auto, 94.8717px, 0pt); visibility: hidden; margin-left:28px; margin-top:5px;" id="dropmenu5" class="dropmenudiv">
	  <a href="/freeresources/freeOnlineTest.asp" onMouseOver="MM_swapImage('c','','/images/back/link_03_free_resources_grey.jpg',1)" onMouseOut="MM_swapImgRestore()">Free Online Test </a>
        <% 'If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "India" Then %>
        <a href="/freeresources/aboutITIL.asp" onMouseOver="MM_swapImage('c','','/images/back/link_03_free_resources_grey.jpg',1)" onMouseOut="MM_swapImgRestore()">About ITIL </a>
        <% 'End If %>
	 	
 </div>
        
        
  
      <!--4th drop down menu -->
     <div style="top: 26px; left: 203px; clip: rect(0pt, auto, 94.8717px, 0pt); visibility: hidden; margin-left:29px; margin-top:5px;" id="dropmenu3" class="dropmenudiv">
        <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Australia"   Then %>
        <a href="/classroomTraining.asp" onMouseOver="MM_swapImage('d','','/images/back/link_04_methodology_green.jpg',1)" onMouseOut="MM_swapImgRestore()">Foundation Classroom Training</a>
		 <% End If %>
		 <% 'ElseIf Session("CountryOrigin") = "Other" OR Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Canada"  Then %>
		<a href="/methodology/Online-Training.asp" onMouseOver="MM_swapImage('d','','/images/back/link_04_methodology_green.jpg',1)" onMouseOut="MM_swapImgRestore()">Foundation Online Training</a>
        <% 'End If %>
		
        <!--<a href="contedumethod.asp" onmouseover="MM_swapImage('d','','/images/back/link_04_methodology_green.jpg',1)" onmouseout="MM_swapImgRestore()">Continuing Education Courses</a>-->
      </div>
      <!--5th drop down menu -->
       <div style="top: 26px; left: 203px; clip: rect(0pt, auto, 94.8717px, 0pt); visibility: hidden; margin-left:26px; margin-top:5px;" id="dropmenu4" class="dropmenudiv">
	    <a href="/aboutus.asp" onMouseOver="MM_swapImage('e','','/images/back/link_05_about_us_green.jpg',1)" onMouseOut="MM_swapImgRestore()">Who We Are </a>
	    <a href="/Affiliates.asp" onMouseOver="MM_swapImage('e','','/images/back/link_05_about_us_green.jpg',1)" onMouseOut="MM_swapImgRestore()">ITILstudy Affiliate Courses </a> 
		 <a href="/contactus.asp" onMouseOver="MM_swapImage('e','','/images/back/link_05_about_us_green.jpg',1)" onMouseOut="MM_swapImgRestore()">Contact Us/Feedback </a>  </div>
      <script type="text/javascript">

cssdropdown.startchrome("chromemenu")

</script>
              <%' Else
				' Response.Redirect "/index.asp"
			' End If%>
            </td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Header End -->
