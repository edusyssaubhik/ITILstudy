<!--#include virtual="/metatags/dates_location_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/innermethodologybanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<!--#include virtual="/includes/generator4datesandlocation.asp"-->
<script language="JavaScript" type="text/javascript" src="/js/tableH.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/courses.js"></script>
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
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; COURSES /  <% If Session("CountryOrigin") = "United Kingdom" Then %>ENROL<% Else %>ENROLL <% End If %> &raquo; Classroom Courses </td>
          </tr>
          <tr>
          <%If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") Then %>
    <!--#include virtual="/includes/innerLeftMenuChat.asp"-->
    <% Else %>
     <!--#include virtual="/includes/innerLeftMenu.asp"-->
     <% End If %>
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">

                <div>
                  <h1 class="PageTitle">ITIL<Sup>&reg;</sup> Foundation CLASSES - DATES, LOCATIONS AND PRICES </h1>
				  
				  <table>
                <tbody><tr>
                  <td id="imageHover"><img border="0" src="/images/buttons/New.jpg"/></td>
                  <td><br/>
                    ITILstudy course has been updated in December, 2011 to the new format as per 2011 Syllabus and is approved by APMG.<br/>
                    <br/><br></td>

                </tr>
              </tbody></table>
               
                <span class="Header">ITILstudy ITIL Foundation classroom program includes:</span>
              <ol id="new" type="1">
               
			   <li>Take the exam on the <%If Session("CountryOrigin") = "United Kingdom" then%>3rd<%Else%>2nd<%End iF%> day and pass. (Pass percentage of 99.2%<span class="Required">**</span>)</li>
			   <%If Session("CountryOrigin") <> "India" then %>
			  <li>100% Money Back Guarantee  <a href="/ITIL-Training/moneyBack.asp">More</a></li>
			  <%End If%>
              <!--<% 'If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore"  Then %>
              <li>Free Six Sigma Green Belt Certification and 25 PMI PDUs worth $ 250 or Human Resource Development Certification and 20 PMI PDUs worth $ 250. <a href="ITIL-Training/free-onlinecertification.asp">More</a></li>
                 <%' ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
               <li>Free Six Sigma Green Belt Certification and 25 PMI PDUs worth &#163; 175 or Human Resource Development Certification and 20 PMI PDUs worth  &#163; 175. <a href="ITIL-Training/free-onlinecertification.asp">More</a></li>   
				<%' ElseIf Session("CountryOrigin") = "Australia" Then %>
               <li>Free Six Sigma Green Belt Certification and 25 PMI PDUs worth 250 USD or Human Resource Development Certification and 20 PMI PDUs worth 250 USD. <a href="ITIL-Training/free-onlinecertification.asp">More</a></li>                             
                             <% 'End If %>-->
                 <li>The course fee includes the cost of ITIL Foundation exam</li>
                 <li><%If Session("CountryOrigin") = "United Kingdom" then%>3-day<%Else%>2-day<%End IF%> <%if Session("CountryOrigin")= "United Kingdom" Then %>classroom training with real-life role-play exercises.<%Else%>classroom training by experienced trainers.<%End If%> </li>
 <% If Session("CountryOrigin") <> "US" And Session("CountryOrigin") <> "Canada" Then %>
                <% If Session("CountryOrigin") = "United Kingdom" Then %>
                <li>Complimentary 6 Sigma Green Belt Certification worth £175 GBP  </li>
                <%Else%>
                
                <li>Free online prep course </li>
  				<%End If%>
                <% End if %>
                <li>High quality, comprehensive classroom study materials in line with the ITIL Foundation exam is provided</li>

 <li>Refreshments <%If Session("CountryOrigin") = "United Kingdom" Then %>and Lunch <%End iF%>during classroom sessions</li>
 <li>Everything required for ITIL Foundation exam would be provided, you don't need to bring anything else to the class</li>
 <li>Valuable tips to pass the  ITIL Foundation exam</li>
 <li>Free <%If Session("CountryOrigin") = "United Kingdom" Then %>18<%Else%>18<%End If%> PMI approved PDUs with our courses <a href="http://itilstudy.com/ITIL-Training/PMI_PDU.asp">More</a></li>
                </ol>
               
               

			   

			<br>
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
					<% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada"  Then %>
                   <tr>
                      <td valign="top" colspan="6"><form name="frmselections">
                          <table width="60%" border="0" cellspacing="0" cellpadding="0" align="center">
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
                      <td valign="top" colspan="6"><form name="frmselections">
                          <table width="80%" border="0" cellspacing="0" cellpadding="0" align="center">
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
					  <tr><td>
                       <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
                       <tr><td> <br>
                        <% If Session("CountryOrigin") <> "India" Then %>
                        
                  <span class="general-bodyBold"> Note:</span><font color="red"><b> Prices are inclusive of Exam Cost, and 100% Moneyback Guarantee.</b></font>
				  <%Else%>
				   <span class="general-bodyBold"> Note:</span><font color="red"><b> Prices are inclusive of Exam and Certification cost.</b></font>
                   <% End If %></td>
                   <td> <br><div align="right"><span id="loader"style="bottom: 0px; right: 500px; top: 610px; left: 570px; width:25%; height: 100px; margin:auto;  background-repeat:repeat; background-image: url(/images/buttons/loading-bg.png); display:block; position:absolute; vertical-align:middle; text-align:center; font-family:Verdana, Geneva, sans-serif; color:#ffffff"><img src="/images/buttons/loading.gif" Width="40" align="middle" height="30" style="padding-top:30px;" /><br><br><font color="#FFFFFF">Loading...</font></span><a href="/termsAndConditions.asp" target="_blank">Terms and Conditions</a></div></td></tr></table>
				   
				   
				   
				   
                  </td></tr>
                   
									<!--<tr><td align="right"><table border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>&nbsp;</td><td><div align="right"><a href="termsAndConditions.asp" target="_blank">Terms and Conditions</a></div></td></tr></table></td></tr>-->
                    <!-- ============== End of Dropdown============ -->
                   <%
			  'Created file includes here 
			  
					  Set fsoObject=Server.CreateObject ("Scripting.FileSystemObject")
					  
					  'Function For Displaying Question Format'
					 
					'Set tsoObject = fsoObject.OpenTextFile("C:\ITILstudy\dateslocation\ITILstudy-Classes-ITILstudy-Training-"&Session("CountryOrigin")&".txt")
					Set tsoObject = fsoObject.OpenTextFile("E:\vhosts\ITILstudy.com\httpdocs\dateslocation\ITILstudy-Classes-ITILstudy-Training-"&Session("CountryOrigin")&".txt")
 
					  StrMain = tsoObject.ReadAll
					  
					  Response.Write strMain
	                %>
					
                    </td>
                    </tr>
                    
                    <tr><td colspan="8" id="txtHint" width="100%"></td></tr>

                  </table>
                </div>
               
                <div><span class="Required">*</span> : Price after early bird discount (if you <% If Session("CountryOrigin") = "United Kingdom" Then %>enrol<% Else %>enroll <% End If %> and pay more than <% If Month(Date) = 11 Then %>3<% Else %><% = CourseApplicableDays %><% End If %> days before the course start date, and if seats are available)</div>
				<br>
				<% If Session("CountryOrigin") <> "Singapore" and Session("CountryOrigin") <> "Other"  Then %>
				<div><span class="Required">**</span> : As per the most recent data available with us for January 2012</div>
				<br>
				<% End If %>
				<% If Session("CountryOrigin") = "US" Then %>
				<!--<div><span class="Required">**</span> : All Texas residents should be sponsored by an employer, and should provide the employer details while enrolling to ITILstudy course.</div>-->
                <%End If%>
                
               
                <p><a href="enrollClass.asp" class="Header"><% If Session("CountryOrigin") = "United Kingdom" Then %>ENROL<% Else %>ENROLL <% End If %> in ITILstudy
                  <% = Session("CountryOrigin") %>
                  classroom training </a> </p>
                <div>
				
				<!-- Google Code for classroom dates Conversion Page -->
					<script type="text/javascript">
					/* <![CDATA[ */
					var google_conversion_id = 1065235366;
					var google_conversion_language = "en_US";
					var google_conversion_format = "2";
					var google_conversion_color = "ffffff";
					var google_conversion_label = "A724CPTUbRCm5_j7Aw";
					var google_conversion_value = 0;
					/* ]]> */
					</script>
					<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
					</script>
					<noscript>
					<div style="display:inline;">
					<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1065235366/?label=A724CPTUbRCm5_j7Aw&amp;guid=ON&amp;script=0"/>
					</div>
					</noscript>

        		

                </div>
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

<%  ElseIf Session("CountryOrigin") = "Germany" Then  %>
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

<% ElseIf Session("CountryOrigin") = "India" Then %>

<!-- Google Code for ITILStudy Dates-Location Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1017900619;
var google_conversion_language = "en";
var google_conversion_format = "1";
var google_conversion_color = "ffffff";
var google_conversion_label = "XqCFCJ2uqAIQy9yv5QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1017900619/?value=0&amp;label=XqCFCJ2uqAIQy9yv5QM&amp;guid=ON&amp;script=0"/>
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
<!--#include virtual="/includes/footer.html"-->
<script>
document.getElementById('loader').style.display='none';
</script>