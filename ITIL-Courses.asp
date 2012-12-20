<!--#include virtual="/metatags/dates_location_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/learn-from-the-best-banner.asp"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<!--#include virtual="/includes/generator4datesandlocation.asp"-->
<!--#include virtual="/includes/location.html"-->
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
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
	  <table width="100%" border="0" cellspacing="0" cellpadding="8">
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
            <td rowspan="4" background="/images/back/left_line.jpg" class="general-body">
			  <div>
                  <h1 class="PageTitle">ITIL<Sup>&reg;</sup> Foundation CLASSES - DATES, LOCATIONS AND PRICES </h1>
                 <% If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") Then %>
			  
				 <table border="0" cellpadding="2" cellspacing="0">
                <tbody><tr>
                  <!--<td id="imageHover"></td>-->
                  <td colspan="2">
                       <!--#include virtual="/includes/ITIL-benefits.asp"-->
                    </td>

                </tr>
				<tr>
              <td width="415px" >
  
			  <table cellpadding="0" cellspacing="0">
              <tr><td><span class="PageTitle"><b>Additional features and benefits</b></span></td></tr>
			<tr><td> <ol type="1"><li>The course fee includes the cost of ITIL Foundation exam</li>
			<li>High quality, comprehensive classroom study materials in line with the ITIL Foundation exam is provided. <a href="/Classroom-Courseware.asp">More</a></li>
			<li> Lunch and refreshments during classroom sessions</li>
		  <li>Everything required for ITIL Foundation exam would be provided, you don't need to bring anything else to the class</li>
          <li>Complementary RMstudy Certification worth $ 150. <a href="http://itilstudy.com/ITIL-Training/free-onlinecertification.asp" target="_blank">More</a></li>
			            <li> Provides Online access to ITIL Foundation course material offering 6 hours of pre-classroom study</li>

                <li>Valuable tips to pass the ITIL Foundation exam</li>
			<li> Free 18 PMI<sup>&reg;</sup> approved PDUs with our courses</li></ol></td></tr>
			<tr><td>&nbsp;</td></tr>
			</table>
               
    </td>           
<td width="230px" style="padding-top:8px;"><!--#include virtual="/includes/faculty.asp"--></td>

</tr>
			   </tbody></table>
                <% ElseIf (Session("CountryOrigin") = "United Kingdom") Then %>
			  
				 <table border="0" cellpadding="2" cellspacing="0">
        
                <tbody><tr>
                  <td id="imageHover"><img border="0" src="../images/buttons/New.jpg"/></td>
                  <td><br/>
                    ITILstudy material has been updated for the new 2011 ITIL Syllabus and is approved by APMG.</td>

                </tr>
              </tbody></table>
                <table border="0" cellpadding="10" cellspacing="0">
				<tr>
              <td width="415px" >
  
			  <table cellpadding="0" cellspacing="0"><br>
              <tr><td><span class="PageTitle"><b>Additional features and benefits</b></span></td></tr>
			<tr><td> <ol type="1"><li>Take the exam on the 3rd day and pass. (Pass percentage of 99.2%<span class="Required">**</span>)</li>
			<li>100% Money Back Guarantee. <a href="/ITIL-Training/moneyBack.asp">More</a></li>
			<li>The course fee includes the cost of ITIL Foundation exam</li>
		  <li>3-day classroom training with real-life role-play exercises. </li>
			<li>Complimentary RMstudy Certification worth £195 GBP </li>
                <li> Provides Online access to ITIL Foundation course material offering 6 hours of pre-classroom study</li>
			<li> High quality, comprehensive classroom study materials in line with the ITIL Foundation exam is provided. <a href="/Classroom-Courseware.asp">More</a></li>
            
            <li>Refreshments and Lunch during classroom sessions</li>
            <li>Everything required for ITIL Foundation exam would be provided, you don't need to bring anything else to the class</li>
            <li>Valuable tips to pass the ITIL Foundation exam</li>
            <li>Free 18 PMI approved PDUs with our courses. <a href="http://itilstudy.com/ITIL-Training/PMI_PDU.asp">More</a></li>
            </ol></td></tr>
			<tr><td>&nbsp;</td></tr>
			</table>
               
    </td>           
<td width="230px" style="padding-top:8px;"><br><!--#include virtual="/includes/faculty.asp"--></td>

</tr>
			   </tbody></table>
               
              <% Else %>
              
				  
				  <table>
                <tbody><tr>
                  <td id="imageHover"><img border="0" src="../images/buttons/New.jpg"/></td>
                  <td><br/>
                    ITILstudy material has been updated for the new 2011 ITIL Syllabus and is approved by APMG.<br/>
                    <br/><br></td>

                </tr>
              </tbody></table>
               
                <span class="Header">ITILstudy ITIL Foundation classroom program includes:</span>
              <ol id="new" type="1">
               
			   <li>Take the exam on the 2nd day and pass. (Pass percentage of 99.2%<span class="Required">**</span>)</li>
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
                 <li>2-day classroom training by experienced trainers. </li>
 <% If Session("CountryOrigin") <> "US" And Session("CountryOrigin") <> "Canada" Then %>
                 <li>Free online prep course </li>
                <% End if %>
                  <%If Session("CountryOrigin") <> "India" Then %>
                  <li> Provides Online access to ITIL Foundation course material offering 6 hours of pre-classroom study</li>
                  <%End If %>
                <li>High quality, comprehensive classroom study materials in line with the ITIL Foundation exam is provided.
                    <%If Session("CountryOrigin") <> "India" And Session("CountryOrigin") <> "Singapore" And Session("CountryOrigin") <> "UAE" then %>
                    <a href="/Classroom-Courseware.asp"> More</a>
                    <%End If %>
                </li>
                                    <%If Session("CountryOrigin") = "India" Then %>
                  <li> Provides Online access to ITIL Foundation course material offering 6 hours of pre-classroom study</li>
                  <%End If %>
                			   <%If Session("CountryOrigin") <> "India" then %>

  <li>Complimentary RMstudy Certification worth $150. <a href="http://itilstudy.com/ITIL-Training/free-onlinecertification.asp">More</a></li>
     <% End if %>
 <li>Refreshments during classroom sessions</li>
 <li>Everything required for ITIL Foundation exam would be provided, you don't need to bring anything else to the class</li>
 <li>Valuable tips to pass the  ITIL Foundation exam</li>
 <li>Free 18 PMI<sup>&reg;</sup> approved PDUs with our courses <a href="http://itilstudy.com/ITIL-Training/PMI_PDU.asp">More</a></li>
                </ol>
               
               <%End If%>

				<% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada"  Then %>
			  <span class="general-bodyBold"> Class Timings :</span><font> 08:00 AM to 06:00 PM</font> 
              <span class="general-bodyBold" style="margin-left:80px;"><a href="/termsAndConditions.asp" target="_blank">Terms and Conditions</a></span><br/><br>
			 <% End If%>
         
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
                        
                  <span class="general-bodyBold"> Note:</span><font color="red"><b> Prices are inclusive of Exam Cost, and 100% Moneyback Guarantee.</b></font>
				  <%Else%>
				   <span class="general-bodyBold"> Note:</span><font color="red"><b> Prices are inclusive of Exam and Certification cost.</b></font> 
                   <% End If %>
              
			  
			  <% If Session("CountryOrigin") <> "US" AND Session("CountryOrigin") <> "Canada"  Then %>
              
 <br/><span class="general-bodyBold"><a href="/termsAndConditions.asp" target="_blank">Terms and Conditions</a></span>
 
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
					 
					'Set tsoObject = fsoObject.OpenTextFile("C:\inetpub\wwwroot\dateslocation\ITILstudy-Classes-ITILstudy-Training-"&Session("CountryOrigin")&".txt")
					Set tsoObject = fsoObject.OpenTextFile("E:\vhosts\ITILstudy.com\httpdocs\dateslocation\ITILstudy-Classes-ITILstudy-Training-"&Session("CountryOrigin")&".txt")
 
					  StrMain = tsoObject.ReadAll
					  
					  Response.Write strMain
	                %>
				
                
					<tr>
 					<td id="txtHint"></td></tr></table>
                
                     </td>
					
                   
<% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada"  Then %>
				 <td width="220px" align="right">     
             
			          <div id="places">
                              <h1 class="PageTitle">Locations</h1>
                           We are having classes at several convenient locations. <a onClick="makeActive();" href="/locations.asp">View All</a>
						<div id="slideshow" align="center" style="margin-top:10px;">						
						<img src="/images/Locations/Holiday Inn Boise.jpg" alt="Slideshow Image 1" height="150px" width="220px" class="active"/>
						<img src="/images/Locations/Residence Inn - Charlotte.jpg" alt="Slideshow Image 2"  height="150px" width="220px"/>
						<img src="/images/Locations/HILTON GARDEN INN - CINCINNATI BLUE ASH.jpg" alt="Slideshow Image 3"  height="150px" width="220px"/>
						<img src="/images/Locations/Embassy Hotel_Cleveland.jpg" alt="Slideshow Image 4"  height="150px" width="220px"/>
						<img src="/images/Locations/Homewood Suites by Hilton - Columbia, Maryland.jpg" alt="Slideshow Image 5"  height="150px" width="220px"/>
						<img src="/images/Locations/Hampton-Inn-Columbus-Dublin- Columbus, Ohio.jpg" alt="Slideshow Image 6" height="150px" width="220px"/>
						<img src="/images/Locations/Spring Hill Hotel Dallas.jpg" alt="Slideshow Image 7"  height="150px" width="220px"/>
						<img src="/images/Locations/Hilton Garden Inn Ft. Lauderdale airport-cruise port - Fort Lauderdale.jpg" alt="Slideshow Image 8"  height="150px" width="220px"/>
						<img src="/images/Locations/Hampton Inn & Suites Frederick - Frederick.jpg" alt="Slideshow Image 9"  height="150px" width="220px"/>
						<img src="/images/Locations/Hilton Garden Inn - Minneapolis.jpg" alt="Slideshow Image 10"  height="150px" width="220px"/>
						<img src="/images/Locations/Hyatt Hotel Memphis.jpg" alt="Slideshow Image 11"  height="150px" width="220px"/>
						<!--<img src="/images/Locations/DoubleTree Hilton - Pittsburgh.jpg" alt="Slideshow Image 12"  height="150px" width="220px"/>-->
						<img src="/images/Locations/Hilton Garden Inn Tampa East.jpg" alt="Slideshow Image 13"  height="150px" width="220px"/>
						<img src="/images/Locations/Arctic Club Hotel - a Double Tree by Hilton - Seattle.jpg" alt="Slideshow Image 14" height="150px" width="220px"/> 
						<img src="/images/Locations/Hampton Inn and Suites Roseville - Sacramento.jpg" alt="Slideshow Image 15"  height="150px" width="220px"/>			   
						<img src="/images/Locations/Crown Plaza St. louis.jpg" alt="Slideshow Image 16"  height="150px" width="220px"/>
						<img src="/images/Locations/Hilton Garden Inn Fairfax Washington DC.jpg" alt="Slideshow Image 17"  height="150px" width="220px"/>			   
						<img src="/images/Locations/Hilton Hotel West Palm Beach Florida.jpg" alt="Slideshow Image 18"  height="150px" width="220px"/>
						</div>                           
		                    <div id="place_list">
							<div id="list_1">
							<a onClick="makeActive();" href="/locations.asp?location=Boise" id="list_style">Boise</a>
							<a onClick="makeActive();" href="/locations.asp?location=Charlotte" id="list_style">Charlotte</a>
							<a onClick="makeActive();" href="/locations.asp?location=Cincinnati/Blue Ash" id="list_style">Cincinnati/Blue Ash</a>
							<a onClick="makeActive();" href="/locations.asp?location=Cleveland" id="list_style">Cleveland</a>
							<a onClick="makeActive();" href="/locations.asp?location=Columbia " id="list_style">Columbia </a>
							<a onClick="makeActive();" href="/locations.asp?location=Columbus " id="list_style">Columbus </a>
							<a onClick="makeActive();" href="/locations.asp?location=Dallas" id="list_style">Dallas</a>	
							<a onClick="makeActive();" href="/locations.asp?location=Fort Lauderdale" id="list_style">Fort Lauderdale</a>									
							<a onClick="makeActive();" href="/locations.asp?location=Frederick" id="list_style">Frederick</a>
							</div>
									
							<div id="list_2">
							<a onClick="makeActive();" href="/locations.asp?location=Minneapolis" id="list_style">Minneapolis</a>
							<a onClick="makeActive();" href="/locations.asp?location=Memphis" id="list_style">Memphis</a>
						<!--	<a onClick="makeActive();" href="/locations.asp?location=Pittsburgh" id="list_style">Pittsburgh</a>-->
							<a onClick="makeActive();" href="/locations.asp?location=Tampa" id="list_style">Tampa </a>
							<a onClick="makeActive();" href="/locations.asp?location=Seattle" id="list_style">Seattle </a>
							<a onClick="makeActive();" href="/locations.asp?location=Sacramento" id="list_style">Sacramento </a>
							<a onClick="makeActive();" href="/locations.asp?location=St. Louis" id="list_style">St. Louis</a>
							<a onClick="makeActive();" href="/locations.asp?location= Washington D.C. (Fairfax)" id="list_style"> Washington D.C.</a>
							<a onClick="makeActive();" href="/locations.asp?location=West Palm Beach" id="list_style">West Palm Beach </a>
							
							</div>

                            </div> 
						</div>
					</td>
					<%End If%>
	
                    </tr>
                    

                  </table>
               
                <div><span class="Required">*</span> : Price after early bird discount (if you <% If Session("CountryOrigin") = "United Kingdom" Then %>enrol<% Else %>enroll <% End If %> and pay more than <% If Month(Date) = 11 Then %>3<% Else %><% = CourseApplicableDays %><% End If %> days before the course start date, and if seats are available)</div>
				<br>
				<% If Session("CountryOrigin") <> "Singapore" and Session("CountryOrigin") <> "Other"  Then %>
				<div><span class="Required">**</span> : As per the most recent data available with us till August 2012</div>
				<br>
				<% End If %>
				<% If Session("CountryOrigin") = "US" Then %>
				<!--<div><span class="Required">**</span> : All Texas residents should be sponsored by an employer, and should provide the employer details while enrolling to ITILstudy course.</div>-->
                <%End If%>
                
               
                <p><a href="enrollClass.asp" class="Header"><% If Session("CountryOrigin") = "United Kingdom" Then %>ENROL<% Else %>ENROLL <% End If %> in ITILstudy
                  <% = Session("CountryOrigin") %>
                  classroom training </a> </p>
         
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




      <!-- Added by :  Priyanka on date : 18/12/2012 -->     
                  
               <!-- Google Code for ITILstudy US-DL Conversion Page -->
                <script type="text/javascript">
                /* <![CDATA[ */
                var google_conversion_id = 947765691;
                var google_conversion_language = "en";
                var google_conversion_format = "3";
                var google_conversion_color = "ffffff";
                var google_conversion_label = "ljEjCIW3tgkQu4P3wwM";
                var google_conversion_value = 0;
                /* ]]> */
                </script>
                <script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
                </script>
                <noscript>
                <div style="display:inline;">
                <img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/947765691/?value=0&amp;label=ljEjCIW3tgkQu4P3wwM&amp;guid=ON&amp;script=0"/>
                </div>
                </noscript>



</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
<script>
document.getElementById('loader').style.display='none';
</script>