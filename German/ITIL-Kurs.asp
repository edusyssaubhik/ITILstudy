<!--#include virtual="/metatags/ITIL-Kurs.html"-->
<!--#include virtual="/includes/headermetaGerman.asp"-->
<!--#include virtual="/includes/innermethodologybanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<!--#include virtual="/includes/generator4datesandlocation-German.asp"-->
<%' response.codePage = 65001
'response.charset = "utf-8"
%>

<script language="JavaScript" type="text/javascript" src="/js/tableH.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/courses-German.js"></script>
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
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" >&nbsp;</td>
            <td width="25%" >&nbsp;</td>
            <td width="73%" class="breadcrumb">Home &raquo; KURSE/ANMELDUNG &raquo; Präsenzseminar kurse </td>
          </tr>
          <tr>
           <!--#include virtual="/includes/innerLeftMenu-German.asp"-->
<td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">

                <div>
                  <h1 class="PageTitle">ITIL<Sup>&reg;</sup>FOUNDATION KURSE – TERMINE, ORTE UND PREISE </h1>
				  
				  <table>
                <tbody><tr>
                  <td id="imageHover"><img border="0" src="/images/buttons/New.jpg"/></td>
                  <td><br/>
                    ITILstudy Kurse wurden im Dezember 2011  mit dem 2011 Lehrplan aktualisiert und von APMG anerkannt. <br/>
                    <br/><br></td>

                </tr>
              </tbody></table>
                                  <div id="tbody">

                 <div >  

                <span class="Header">ITILstudy ITIL Foundation Präsenztrainingskurse beinhalten:</span>

              <ol id="new" type="1">


			   <li>Ablegen der Prüfung am 2. Trainingstag (Erfolgsquote von 99.2%<span class="Required">**</span>)</a></li>   

			   <li>100% Geldzurückgarantie  <a href="http://www.itilstudy.com/german/Geld-zurück-Garantie.asp">Mehr</a></li>
	  

             <!-- <li>Kostenfreie Six Sigma Green Belt Zertifizierung und 25 PMI PDUs im Wert von $ 250 oder Human Resource Development Zertifizierung und 20 PMI PDUs im Wert von $ 250.  <a href="http://www.itilstudy.com/german/kostenfreie-online-Zertifizierung.asp">Mehr</a></li>
-->
              <li>Kostenlose Risk Management-Zertifizierung und 20 PMI PDUs im Wert von $ 300<a href="http://www.RMstudy.com"> Mehr</a></li>


              <li>Die Kursgebühr beinhaltet die Kosten für die ITIL Foundation Prüfung</li>

              <li>2 Tage Präsenzseminar mit erfahrenen Trainern <a href="http://www.itilstudy.com/german/Trainer.asp">Mehr</a></li>
       
              <li>Kostenloser Online Vorbereitungskurs </li>

              <li>Qualitativ hochwertige Schulungsunterlagen werden bereitgestellt</li>

              <li>Erfrischungen während des Trainings</li>

 			  <li>Alle erforderlichen Unterlagen für die ITIL Foundation- Prüfung werden angeboten, weitere Unterlagen Ihrerseits sind nicht erforderlich</li>

			  <li>Wertvolle Tipps für die  ITIL Foundation Prüfung</li>

 			  <li>18 von PMI anerkannte PDUs erhalten Sie für diesen Kurs. <a href="http://itilstudy.com/german/PMI_PDU.asp">Mehr</a></li>
<!--<li>Wir bieten classroom Programme sowohl in Englisch und Deutsch</li>-->
                </ol>

                  </div>

                  

                  
                   <div><br>
                   <table width="97%" border="0" onMouseOut="javascript:highlightTableRowVersionA(0);" id="myTable0" cellpadding="3" cellspacing="0" class="TableGeneral">
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
					' If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then
				
					'	strQuery = "SELECT course.*, city.state_code, course.country FROM ITIL_course course, ITIL_city city Where course.city = city.city And (course.country = 'US' OR course.country = 'Canada') And (city.country = 'US' OR city.country = 'Canada') AND (course.country = city.country) AND course.status <> 'Cancelled' And course.startdate BETWEEN '"&Now() - 1&"' AND DATEADD(day,180,'"&Now()&"')  order by course.startdate, course.city asc"
					'	
				'	Else
					
					strQuery = "SELECT course.*, city.state_code, course.country FROM ITIL_course course,ITIL_city city Where course.city = city.city And course.country = 'Germany' AND city.country = 'Germany' AND course.status <> 'Cancelled' And course.startdate BETWEEN '"&Now() - 1&"' AND DATEADD(day,180,'"&Now()&"') order by course.startdate, course.city asc"
					
					' End If
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
	
					 strQuery = "SELECT Distinct(city), state_code FROM ITIL_city WHERE country = 'Germany'"
									 
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
	
					 strQuery = "SELECT Distinct(startdate), enddate FROM ITIL_course WHERE country = 'Germany' And startdate >= '"&Now() - 1&"' order by startdate asc"
									 
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
	
					  strApplicableDays = "SELECT applicabledays FROM ITIL_countrydetails WHERE country = 'Germany'"	
					  
					  'Response.write(strApplicableDays)				  
	
					  Rs.Open strApplicableDays,ConnObj
	
					  Do Until Rs.EOF
						CourseApplicableDays = Rs("applicabledays")
					  Rs.Movenext
					  Loop
	
					  Rs.Close
					%>
					<% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada"  Then %>
                   <tr>
                      <td valign="top" colspan="6"><form name="frmselections">
                          <table width="60%" border="0" cellspacing="0" cellpadding="0" align="center">
                            <tr>					
					  			<td>
								  <select name="country1" id="country1" style="width:150px;" class="TeXtFielddropdown" onChange="findCountry(this.value);clicked1();">
									<option value="">-- Select Country --</option>
									<option value="US">US</option>
									<option value="Canada">Canada</option>
									
								   </select>
								  </td>

                             	 <td>
							  		<Select name="location" id="location" style="width:165px" disabled="disabled" class="TeXtFielddropdown"  onChange="findCity(this.value);">
					   					 <option value="">-- Select City --</option>
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
                      <td valign="top" colspan="6"><form name="frmselections">
                          <table width="80%" border="0" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                              <td><select name="location" id="location" style="width:200px;" class="TeXtFielddropdown" onChange="findCity(this.value);">
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
					  <tr><td>
                       <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
                       <tr><td> <br>
                        
				   <span class="general-bodyBold"> Bitte beachten Sie: </span><font color="red"><b>die Preise verstehen sich inklusive Prüfungsgebühr, der 100% Geldzurückgarantie und einem kostenlosen Risk Management (im Wert von $ 300).</b></font>
                   </td>
                   <td> <br><div align="right"><span id="loader" style="bottom: 0px; right: 500px; top: 610px; left: 570px; width:25%; height: 100px; margin:auto;  background-repeat:repeat; background-image: url(/images/buttons/loading-bg.png); display:block; position:absolute; vertical-align:middle; text-align:center; font-family:Verdana, Geneva, sans-serif; color:#ffffff"><img src="/images/buttons/loading.gif" Width="40" align="middle" height="30" style="padding-top:30px;" /><br><br><font color="#FFFFFF">Loading...</font></span><a href="/German/Geschäftsbedingungen.asp" target="_blank">Geschäftsbedingungen</a></div></td></tr></table>
				   
				   
				   
				   
                  </td></tr>
                   
									<!--<tr><td align="right"><table border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>&nbsp;</td><td><div align="right"><a href="termsAndConditions.asp" target="_blank">Terms and Conditions</a></div></td></tr></table></td></tr>-->
                    <!-- ============== End of Dropdown============ -->
                   <%
			  'Created file includes here 
			  
					  Set fsoObject=Server.CreateObject ("Scripting.FileSystemObject")
					  
					  'Function For Displaying Question Format'
					 
					Set tsoObject = fsoObject.OpenTextFile("C:\GitHUB\ITILStudy\dateslocation\ITILstudy-Classes-ITILstudy-Training-"&Session("CountryOrigin")&".txt")
					'Set tsoObject = fsoObject.OpenTextFile("E:\vhosts\ITILstudy.com\httpdocs\dateslocation\ITILstudy-GermanLang-Classes-ITILstudy-Training-"&Session("CountryOrigin")&".txt")
 
					  StrMain = tsoObject.ReadAll
					  
					  Response.Write strMain
	                %>
					
                    </td>
                    </tr>
                    
                    <tr><td colspan="8" id="txtHint" width="100%"></td></tr>

                  </table>
                </div>
               
                <div><span class="Required">*</span> : Preis nach Early-Bird-Rabatt (wenn Sie registrieren und mehr als Tage Zahlen vor Beginn des Kurses, und wenn Plätze verfügbar sind)
</div>
				<br>
				<% If Session("CountryOrigin") <> "Singapore" and Session("CountryOrigin") <> "Other"  Then %>
				<div><span class="Required">**</span> : Gemäss den neuesten Daten für Januar 2012 bei uns verfügbar</div>
				<br>
				<% End If %>
				<% If Session("CountryOrigin") = "US" Then %>
				<!--<div><span class="Required">**</span> : All Texas residents should be sponsored by an employer, and should provide the employer details while enrolling to ITILstudy course.</div>-->
                <%End If%>
                
               
                <p><a href="#" class="Header">REGISTRIEREN im ITILstudy Deutschland-Schulungen </a></p>
             
                <!--#include virtual="/includes/connectionClose.asp"-->
                <!-- Content End From Here-->
              </td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer-German.html"-->
<script>
document.getElementById('loader').style.display='none';
</script>
<!-- Google Code for ITILstudy GER German - DL Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1026351431;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "Api5CJPD1QIQx8Kz6QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?value=0&amp;label=Api5CJPD1QIQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
