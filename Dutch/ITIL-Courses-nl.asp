<!--#include virtual="/Dutch/metatags/dates_location_metatag.html"-->
<!--#include virtual="/includes/headermetaDutch.asp"-->
<!--#include virtual="/includes/learn-from-the-best-banner.asp"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<!--#include virtual="/includes/generator4datesandlocation-Dutch.asp"-->
<script language="JavaScript" type="text/javascript" src="/js/tableH.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/courses-dutch.js"></script>
<script type="text/javascript" src="/js/cities_combo.js"></script>
<script language="javascript" type="text/javascript">

<!--

function popitup(url) {
	newwindow=window.open(url,'name','toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=0,minimizable=0,resizable=0,height=300,width=300,top=250,left=400');
	if (window.focus) {newwindow.focus()}
	return false;
}

// -->
<!--  PMstudy -->
</script>
<script language="javascript" type="text/javascript">
<!--
	
function popitup(url) {
	newwindow=window.open(url,'name','toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=0,minimizable=0,resizable=0,height=300,width=300,top=250,left=400');
	if (window.focus) {newwindow.focus()}
	return false;
}
// -->
</script>

<script>
var ld=(document.all);
var ns4=document.layers;
var ns6=document.getElementById&&!document.all;
var ie4=document.all;
if (ns4)
ld=document.loading;
else if (ns6)
ld=document.getElementById("loading").style;
else if (ie4)
ld=document.all.loading.style;
function init()
{
if(ns4){ld.visibility="hidden";}
else if (ns6||ie4) ld.display="none";
}
</script>

</head>
<body onLoad="init()">
<!-- Body Starts -->
<div>
<!-- Body Starts -->
 
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
	  <table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" >&nbsp;</td>
            <td width="25%" >&nbsp;</td>
            <td width="73%" class="breadcrumb">Home &raquo; OPLEIDINGEN / INSCHRIJVEN  &raquo; Klassikale opleidingen </td>
          </tr>
          <tr>
     <!--#include virtual="/includes/innerLeftMenu-Dutch.asp"-->

            <td rowspan="4" background="/images/back/left_line.jpg" class="general-body">
			  <div>
                  <h1 class="PageTitle">ITIL<sup>&reg;</sup> FOUNDATION LESSEN - DATA, LOCATIES EN PRIJZEN</h1>

				  <table>
                <tbody><tr>
                  <td id="imageHover"><img border="0" src="../images/buttons/New.jpg"/></td>
                  <td><br/>
                    Het ITILstudy materiaal is bijgewerkt volgens de nieuwe 2011 ITIL syllabus en is goedgekeurd door APMG.<br/>
                    <br/><br></td>

                </tr>
              </tbody></table><br />
                  <span class="Header">Het klassikale ITILstudy Foundation programma bestaat uit:</span>
               <ol>
                   <li>Doe op de 2de dag het examen en slaag. (Slagingspercentage van 99,2%**)</li>
                    <li>100% Niet-goed-geld-terug-garantie <a href="/Dutch/moneyback-nl.asp">Meer</a></li>
                    <li>De opleidingskosten bestaan uit de kosten voor het ITIL Foundation examen</li>
                    <li>2-daagse klassikale opleiding door ervaren docenten.</li>
                    <li>Gratis online voorbereidende opleiding</li>
                    <li>Hoogwaardige, allesomvattende klassikaal studiemateriaal overeenkomstig het ITIL Foundation</li>
                    <li>Aanvullende RMstudy certificering ter waarde van $300. <a href="/Dutch/free-onlinecertification-nl.asp">Meer</a></li>
                    <li>Drankjes tijdens klassikale lessen</li>
                    <li>Alles dat nodig is voor het ITIL Foundation examen is aanwezig, u hoeft verder niets mee te nemen naar de les.</li>
                    <li>	Waardevolle tips om het ITIL Foundation examen te behalen</li>
                    <li>Gratis 18 door PMI goedgekeurde PDU's bij onze opleidingen <a href="/Dutch/PMI_PDU-nl.asp">Meer</a></li>

               </ol>
  
        
                   <table width="97%" border="0" onMouseOut="javascript:highlightTableRowVersionA(0);" id="myTable0" cellpadding="4" cellspacing="0" class="TableGeneral">
                    <!-- Content Start From Here-->
                    <%
					
					Dim strQuery
					Dim strApplicableDays
					Dim arrAllCourses
					Dim firstRow
					Dim lastRow
					Dim numRows
					Dim rowCounter
					Dim StartDate
					Dim ApplicableDays
					Dim arrAllWeekEndCourses
					Dim firstWeekEndRow
					Dim lastWeekEndRow
					Dim rowWeekEndCounter
					Dim WeekEndStartDate
					Dim WeekEndApplicableDays
					Dim numWeekEndRows
					Dim str
					Dim strDisplay
					Dim arrAllDates, Dates, numDateRows, DatefirstRow, DatelastRow, rowDateCounter		  
	
					 Set Rs = Server.CreateObject("ADODB.Recordset")
	
					 'Price Format Display Functions'
	
					 Currency_Format_Front = CurrencyFormat_Front(Session("CountryOrigin"))
	
					 Currency_Format_Back = CurrencyFormat_Back(Session("CountryOrigin"))
					
					 'Sql Query For Retrive Courses'
					 
					 'If Country is US or Canada show both country coures'
					 'Else show based on country'
					 If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then
				
						strQuery = "SELECT course.*, city.state_code, course.country FROM ITIL_course course, ITIL_city city Where course.city = city.city And course.coursetype = 'Normal' AND (course.country = 'US' OR course.country = 'Canada') And (city.country = 'US' OR city.country = 'Canada') AND (course.country = city.country) AND course.status <> 'Cancelled' And course.startdate BETWEEN '"&Now() - 1&"' AND DATEADD(day,180,'"&Now()&"')  order by course.startdate, course.city asc"
						
					Else
					
					strQuery = "SELECT course.*, city.state_code, course.country FROM ITIL_course course,ITIL_city city Where course.city = city.city And course.country = '" & Session("CountryOrigin") & "' AND city.country = '" & Session("CountryOrigin") & "' And course.coursetype = 'Normal' AND course.status <> 'Cancelled' And course.startdate BETWEEN '"&Now() - 1&"' AND DATEADD(day,180,'"&Now()&"') order by course.startdate, course.city asc"
					
					 End If
					' Response.Write(strQuery)
					 Rs.Open strQuery,ConnObj
	
					 If Not Rs.EOF Then
						arrAllCourses = Rs.getrows
						Session("arrAllCourses") = arrAllCourses

						numRows = Ubound(arrAllCourses,2)
						firstRow = 0
						lastRow = numRows
					  End If
	
					  Rs.Close
	
					'Sql Query For Retrive Courses'
	
					 strQuery = "SELECT Distinct(city), state_code FROM ITIL_city WHERE country = '" & Session("CountryOrigin") & "'"
									 
					 Rs.Open strQuery,ConnObj
	
					 If Not Rs.EOF Then
						arrAllCities = Rs.getrows
						Session("arrAllCities") = arrAllCities
						numCityRows = Ubound(arrAllCities,2)
						CityfirstRow = 0
						CitylastRow = numCityRows
					  End If
	
					  Rs.Close
					  
					'Sql Query For Retrive dates'
	
					 strQuery = "SELECT Distinct(startdate), enddate FROM ITIL_course WHERE country = '" & Session("CountryOrigin") & "' And startdate BETWEEN '"&Now() - 1&"' AND DATEADD(day,180,'"&Now()&"') And coursetype = 'Normal' order by startdate asc"
									 
					 Rs.Open strQuery,ConnObj
	
					 If Not Rs.EOF Then
						arrAllDates = Rs.getrows
						Session("arrAllCities") = Dates
						numDateRows = Ubound(arrAllDates,2)
						DatefirstRow = 0
						DatelastRow = numDateRows
					  End If
	
					  Rs.Close	
					  		
					  'Sql Query For Retrive ApplicableDays For EarlyBird Discount'
	
					  strApplicableDays = "SELECT applicabledays FROM ITIL_countrydetails WHERE country = '" & Session("CountryOrigin") & "'"	
					  
					  'Response.write(strApplicableDays)				  
	
					  Rs.Open strApplicableDays,ConnObj
	
					  Do Until Rs.EOF
						CourseApplicableDays = Rs("applicabledays")
					  Rs.Movenext
					  Loop
	
					  Rs.Close
					%>
					      <% If Session("CountryOrigin") <> "India" Then %>
                        
                  <span class="general-bodyBold"> Let op: </span><font color="red"><b>De prijzen zijn inclusief examenkosten en een 100% niet-goed-geld-terug-garantie.</b></font>
				  <%Else%>
				   <span class="general-bodyBold"> Note:</span><font color="red"><b> Prices are inclusive of Exam and Certification cost.</b></font> 
                   <% End If %>
              
			  
			  <% If Session("CountryOrigin") <> "US" AND Session("CountryOrigin") <> "Canada"  Then %>
              
 <br/><span class="general-bodyBold"><a href="/Dutch/termsAndConditions.asp" target="_blank">Algemene voorwaarden</a></span>
 
 <% End If %>
				 <div align="right"><span id="loader"style="bottom: 0px; right: 500px; top: 610px; left: 570px; width:25%; height: 100px; margin:auto;  background-repeat:repeat; background-image: url(/images/buttons/loading-bg.png); display:block; position:absolute; vertical-align:middle; text-align:center; font-family:Verdana, Geneva, sans-serif; color:#ffffff"><img src="/images/buttons/loading.gif" Width="40" align="middle" height="30" style="padding-top:30px;" /><br><br><font color="#FFFFFF">Loading...</font></span></div>
					<tr><td>
					<table border="0">
					<% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada"  Then %>
                     <tr>
                      <td valign="top" ><form name="frmselections">
                          <table  border="0" cellspacing="0" cellpadding="8" align="left">
                            <tr>					
					  			<td>
								  <select name="country1" id="country1" style="width:150px;" class="TeXtFielddropdown" onChange="findCountry(this.value,'Normal');clicked1();">
									<option value="Normal">-- Select Country --</option>
									<option value="US">US</option>
									<option value="Canada">Canada</option>
									
								   </select>
								  </td>

                             	 <td>
							  		<Select name="location" id="location" style="width:165px" disabled="disabled" class="TeXtFielddropdown"  onChange="findCity1(this.value,'Normal');">
					   					 <option value="All">-- Select City --</option>
						 		  	</select>
    	                          </td>
        	                     <!-- <td><select name="dates" id="dates" style="width:165px" disabled="disabled" class="TeXtFielddropdown" onChange="findDate(this.value);">
            	                      <option value="">-- Select Country First --</option>
                                	</select>
                              	  </td>-->
                            	</tr>
                             </table>
                        </form></td>
                    </tr>
						
					<% Else %>
                     <tr>
                      <td valign="top"><form name="frmselections">
                          <table  border="0" cellspacing="0" cellpadding="8" align="left">
                            <tr>
                              <td><select name="location" id="location" style="width:200px;" class="TeXtFielddropdown" onChange="findCity(this.value,'Normal');">
                                  <option value="All">------- Select City---- </option>
                                  <% If IsArray(arrAllDates) Then
	  					    		 For rowCityCounter = CityfirstRow to CitylastRow %>
                                  <option value="<% = arrAllCities(0,rowCityCounter) %>">
                                  <% = arrAllCities(0,rowCityCounter) %><% If Session("CountryOrigin") <> "United Kingdom" Then %><% If arrAllCities(1,rowCityCounter) <> "" Then %>, <% = arrAllCities(1,rowCityCounter) %><% End If %><% End If %>
                                  </option>
                                  <% Next
								     End If %>
                                  
                                </select>
                              </td>
                              <td><select name="dates" id="dates" class="TeXtFielddropdown" onChange="findDate(this.value);">
                                  <option value="All">-- Select Date --</option>
                                  <% If IsArray(arrAllDates) Then
									 For rowDateCounter = DatefirstRow to DatelastRow
									 StartDate = arrAllDates(0,rowDateCounter)
									 EndDate   = arrAllDates(1,rowDateCounter) %>
                                  <option value="<% = DAY(StartDate) & " " & MonthName(Month(StartDate),3) & " "  & YEAR(StartDate)%> to <% = DAY(EndDate) & " " & MonthName(Month(EndDate),3) & " "  & YEAR(EndDate)%>">
                                  <% = DAY(StartDate) & " " & MonthName(Month(StartDate),3) & " "  & YEAR(StartDate)%>
                                  to
                                  <% = DAY(EndDate) & " " & MonthName(Month(EndDate),3) & " "  & YEAR(EndDate)%>
                                  </option>
                                  <% 'End If
				     				 Next
						             End If %>
                                  <option value="All">All</option>
                                </select>
                              </td>
                            </tr>
                          </table>
                        </form>
						 
						</td>
                    </tr>
					 
					<% End If %>
	            				
                 
									<!--<tr><td align="right"><table border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>&nbsp;</td><td><div align="right"><a href="termsAndConditions.asp" target="_blank">Terms and Conditions</a></div></td></tr></table></td></tr>-->
                    <!-- ============== End of Dropdown============ -->
                          <%
			  'Created file includes here 
			  
					  Set fsoObject=Server.CreateObject ("Scripting.FileSystemObject")
					  
					  'Function For Displaying Question Format'
					 
					Set tsoObject = fsoObject.OpenTextFile("C:\GitHub\ITILstudy\dateslocation\ITILstudy-Classes-ITILstudy-Training-Dutch-"&Session("CountryOrigin")&".txt")
					'Set tsoObject = fsoObject.OpenTextFile("E:\vhosts\ITILstudy.com\httpdocs\dateslocation\ITILstudy-Classes-ITILstudy-Training-Dutch-"&Session("CountryOrigin")&".txt")
 
					  StrMain = tsoObject.ReadAll
					  
					  Response.Write strMain
	                %>
				
                
					<tr>
 					<td id="txtHint"></td></tr></table>
                
                     </td>
					
                   
                    </tr>
                    

                  </table>
               
                <div><span class="Required">*</span> : Prijs na vroege vogel korting (indien u zich inschrijft en meer dan 7 dagen voor aanvang van de opleiding heeft betaald en indien er plaats is)</div>
				<br>
				<% If Session("CountryOrigin") <> "Singapore" and Session("CountryOrigin") <> "Other"  Then %>
				<div><span class="Required">**</span> : Volgens de meest recentelijke gegevens die in januari 2012 bij ons bekend waren.</div>
				<br>
				<% End If %>
				<% If Session("CountryOrigin") = "US" Then %>
				<!--<div><span class="Required">**</span> : All Texas residents should be sponsored by an employer, and should provide the employer details while enrolling to ITILstudy course.</div>-->
                <%End If%>
                
               
                <p><a href="/Dutch/enrollClass.asp" class="Header">INSCHRIJVEN voor een Nederlandse, klassikale ITILstudy opleiding</a> </p>
         
                <!--#include virtual="/includes/connectionClose.asp"-->
                <!-- Content End From Here-->
              </td>
          </tr>
        </table></td>
    </tr>
  </table>
  
  
  
  
<% If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") Then %>
<!-- Google Code for ITILstudy USA - DL Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "B2ahCIO21QIQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?value=0&amp;label=B2ahCIO21QIQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
<!--================================-->

    <script type="text/javascript"> if (!window.mstag) mstag = {loadTag : function(){},time : (new Date()).getTime()};</script> <script id="mstag_tops" type="text/javascript" src="//flex.atdmt.com/mstag/site/4625211e-e6a9-48d9-b623-3b89707bb8e4/mstag.js"></script> <script type="text/javascript">        mstag.loadTag("analytics", {dedup:"1",domainId:"1861441",type:"1",actionid:"104275"})</script> <noscript> <iframe src="//flex.atdmt.com/mstag/tag/4625211e-e6a9-48d9-b623-3b89707bb8e4/analytics.html?dedup=1&domainId=1861441&type=1&actionid=104275" frameborder="0" scrolling="no" width="1" height="1" style="visibility:hidden;display:none"> </iframe> </noscript>
<% ElseIf Session("CountryOrigin") = "Australia" Then %>
<!-- Google Code for ITILstudy AUS - DL (P.M.5) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1001931809;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "nD2-CNf6yRIQoYjh3QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1001931809/?value=0&amp;label=nD2-CNf6yRIQoYjh3QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>



<% ElseIf (Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore") Then %>
<!-- Google Code for ITILstudy UAE, Singapore- DL (P.M.6) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1000044564;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "bFfFCIys1AMQlPDt3AM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1000044564/?value=0&amp;label=bFfFCIys1AMQlPDt3AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>



<%  ElseIf Session("CountryOrigin") = "Germany" Then  %>

<!-- Google Code for ITILstudy Germany - Eng- DL (P.M.2) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "YdvzCIOOlgMQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?value=0&amp;label=YdvzCIOOlgMQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


<% ElseIf Session("CountryOrigin") = "India" Then %>

<!-- Google Code for ITILstudy IND - DL (P.M.6) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1000044564;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "RIQvCJSr1AMQlPDt3AM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1000044564/?value=0&amp;label=RIQvCJSr1AMQlPDt3AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>





<% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
 <!-- Google Code for ITILstudy - DL for UK (P.M.3) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1017900619;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "-59DCL2DlAMQy9yv5QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1017900619/?value=0&amp;label=-59DCL2DlAMQy9yv5QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>



<!-- Google Code for ITILstudy UK - DL (P.M.6) Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1000044564;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "kEi0CPyt1AMQlPDt3AM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1000044564/?value=0&amp;label=kEi0CPyt1AMQlPDt3AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>

 
<% Else %>
<!-- Google Code for ITIL - DL Conversion Page -->


<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";

var google_conversion_label = "ks3NCLOnyQIQx8Kz6QM";

var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?label=ks3NCLOnyQIQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
<% End If %>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer-Dutch.html"-->
<script>
document.getElementById('loader').style.display='none';
</script>