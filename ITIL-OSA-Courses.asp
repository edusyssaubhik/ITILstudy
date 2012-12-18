
<!--#include virtual="/metatags/dates_location_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<%
 If Session("CountryOrigin") <> "US" And Session("CountryOrigin") <> "Canada" And Session("CountryOrigin") <> "United Kingdom" And Session("CountryOrigin") <> "India" And Session("CountryOrigin") <> "Australia" And Session("CountryOrigin") <> "Germany" And Session("CountryOrigin") <> "Netherlands" And Session("CountryOrigin") <> "UAE" Then 
 Response.Redirect("/index.asp")
End If
 
%>
<!--#include virtual="/includes/learn-from-the-best-banner.asp"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<!--#include virtual="/includes/generator4OSA-Courses.asp"-->

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
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; COURSES / ENROLL &raquo; Classroom Courses </td>
          </tr>
          <tr>
          <% If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") Then %>
    <!--#include virtual="/includes/innerLeftMenuChat.asp"-->
    <% Else %>
     <!--#include virtual="/includes/innerLeftMenu.asp"-->
     <% End If %>
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">

                <div>
                  <h1 class="PageTitle">ITIL<Sup>&reg;</sup> OSA CLASSES - DATES, LOCATIONS AND PRICES </h1>
				  
				  <table>
                <tbody><tr>
                  <td id="imageHover"><img border="0" src="/images/buttons/New.jpg"/></td>
                  <td><br/>
                    ITILstudy course has been updated in December, 2011 to the new format as per 2011 Syllabus and is approved by APMG.<br/>
                    <br/><br></td>

                </tr>
              </tbody></table>
  
                <span class="Header">ITILstudy ITIL Intermediate classroom program includes:</span>

              <ol id="new" type="1">
              
                 <% If Session("CountryOrigin") <> "India" Then %>

<li><%If Session("CountryOrigin") = "United Kingdom" Then%>4<%Else%>3<%end if%> Day Training with Accelerated Learning Techniques. <a href="http://www.itilstudy.com/3-Day-ITIL-Training.asp">More</a></li>
<li>The course fee includes the cost of ITIL Intermediate  exam</li>

			   <li>Course includes an exam voucher for the Intermediate exam</li>
                
                               

                 <li><%If Session("CountryOrigin") = "United Kingdom" Then%>4-day<%Else%>3-day<%end if%> classroom training by experienced trainers. <a href="/ITIL-Training/instructors.asp">More</a></li>
                  <% If Session("CountryOrigin") = "United Kingdom" Then %>
                 <li>Free RM study course worth 195 GBP  </li>
                <%ElseIf Session("CountryOrigin") <> "India" Then %>

                  <li>Complementary RMstudy Certification worth $150. <a href="http://itilstudy.com/ITIL-Training/free-onlinecertification.asp" target="_blank">More</a></li>

				<%Else%>
                <li>Free online prep course </li>
  				<%End If%>

                <li>High quality, comprehensive classroom study materials in line with the ITIL Intermediate exam is provided</li>



 
 <li>Everything required for ITIL Intermediate exam would be provided, you don&#8217;t need to bring anything else to the class</li>

 <li>Valuable tips to pass the  ITIL Intermediate exam</li>
<li>Provides Online access to ITIL Intermediate course material offering 12 hours of pre-classroom study</li>
 <li>Free 27 PMI approved PDUs with our courses <a href="http://itilstudy.com/ITIL-Training/Intermediate_PMIPDU.asp">More</a></li>              
 
                   <% Else %>                
                                   
                  <li>3 Day Training with Accelerated Learning Techniques.<a href="http://www.itilstudy.com/3-Day-ITIL-Training.asp">More</a></li>
                  <li>The course fee includes the cost of ITIL Intermediate exam.</li>
                  <li>3-day classroom training by experienced trainers.<a href="/ITIL-Training/instructors.asp">More</a> </li>
                  <li>High quality, comprehensive classroom study materials in line with the ITIL Intermediate exam is provided.</li>
                  <li>Refreshments and Lunch during classroom sessions</li>
                  <li>Everything required for ITIL Intermediate exam would be provided, you don’t need to bring anything else to the class.</li>
                  <li>Valuable tips to pass the ITIL Intermediate exam.</li>
                  <li>Provides Online access to ITIL Intermediate course material offering 12 hours of pre-classroom study</li>
                  <li>Free 27 PMI approved PDUs with our courses<a href="http://itilstudy.com/ITIL-Training/Intermediate_PMIPDU.asp"> More</a></li>
               
                   <% End If %>
                   
                    </ol><br/>
                    
                    
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
					 If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "India" Then
				
						strQuery = "SELECT course.*, city.state_code, course.country FROM ITIL_course course, ITIL_city city Where course.city = city.city And (course.country = 'US' OR course.country = 'Canada'  OR course.country = 'United Kingdom' OR course.country = 'India') And (city.country = 'US' OR city.country = 'Canada' OR city.country = 'United Kingdom' OR course.country = 'India') AND (course.country = city.country) AND course.status <> 'Cancelled' And course.startdate BETWEEN '"&Now() - 1&"' AND DATEADD(day,180,'"&Now()&"')  order by course.startdate, course.city asc"
						
					Else
					
					strQuery = "SELECT course.*, city.state_code, course.country FROM ITIL_course course,ITIL_city city Where course.city = city.city And course.country = '" & Session("CountryOrigin") & "' AND city.country = '" & Session("CountryOrigin") & "' AND course.status <> 'Cancelled' And course.startdate BETWEEN '"&Now() - 1&"' AND DATEADD(day,180,'"&Now()&"') order by course.startdate, course.city asc"
					
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
	
					 strQuery = "SELECT Distinct(startdate), enddate FROM ITIL_course WHERE coursetype = 'OSA' and country = '" & Session("CountryOrigin") & "' And startdate BETWEEN '"&Now() - 1&"' AND DATEADD(day,180,'"&Now()&"') order by startdate asc"
				' response.Write(strQuery)				 
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
								  <select name="country1" id="country1" style="width:150px;" class="TeXtFielddropdown" onChange="findCountry(this.value,'OSA');clicked1();">
									<option value="Normal">-- Select Country --</option>
									<option value="US">US</option>
									<option value="Canada">Canada</option>
									
								   </select>
								  </td>

                             	 <td>
							  		<Select name="location" id="location" style="width:165px" disabled="disabled" class="TeXtFielddropdown"  onChange="findCity1(this.value,'OSA');">
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
                              <td><select name="location" id="location" style="width:200px;" class="TeXtFielddropdown" onChange="findCity(this.value,'OSA');">
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
                       <tr>
                  
                   <td> <br><div align="right"><span id="loader"style="bottom: 0px; right: 500px; top: 810px; left: 570px; width:25%; height: 100px; margin:auto;  background-repeat:repeat; background-image: url(/images/buttons/loading-bg.png); display:block; position:absolute; vertical-align:middle; text-align:center; font-family:Verdana, Geneva, sans-serif; color:#ffffff"><img src="/images/buttons/loading.gif" Width="40" align="middle" height="30" style="padding-top:30px;" /><br><br><font color="#FFFFFF">Loading...</font></span><a href="/Intermediate-TermsAndConditions.asp" target="_blank">Terms and Conditions</a></div></td></tr></table>
				   
				   
				   
				   
                  </td></tr>
                   
									<!--<tr><td align="right"><table border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>&nbsp;</td><td><div align="right"><a href="termsAndConditions.asp" target="_blank">Terms and Conditions</a></div></td></tr></table></td></tr>-->
                    <!-- ============== End of Dropdown============ -->
                   <%
			  'Created file includes here 
			  
					  Set fsoObject=Server.CreateObject ("Scripting.FileSystemObject")
					  
					  'Function For Displaying Question Format'
					 
					'Set tsoObject = fsoObject.OpenTextFile("C:\GITHub\ITILstudy\dateslocation\ITILstudy-Classes-ITILstudy-Training-OSA-"&Session("CountryOrigin")&".txt")
					Set tsoObject = fsoObject.OpenTextFile("E:\vhosts\ITILstudy.com\httpdocs\dateslocation\ITILstudy-Classes-ITILstudy-Training-OSA-"&Session("CountryOrigin")&".txt")
 
					  StrMain = tsoObject.ReadAll
					  
					  Response.Write strMain
	                %>
					
                    </td>
                    </tr>
                    
                    <tr><td colspan="8" id="txtHint" width="100%"></td></tr>

                  </table>
                </div>
               
               <!-- <div><span class="Required">*</span> : Price after early bird discount (if you enroll and pay more than <% 'If Month(Date) = 11 Then %>3<% 'Else %><'% = CourseApplicableDays %><% 'End If %> days before the course start date, and if seats are available)</div>
				<br>-->
				
				<% If Session("CountryOrigin") = "US" Then %>
				<!--<div><span class="Required">**</span> : All Texas residents should be sponsored by an employer, and should provide the employer details while enrolling to ITILstudy course.</div>-->
                <%End If%>
                
               
                <p><a href="/enrollClass.asp?coursetype=OSA" class="Header">ENROLL in ITILstudy
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

                <!-- Google Code for classroom dates Conversion Page -->
					<script type="text/javascript">
					/* <![CDATA[ */
					var google_conversion_id = 1017900619;
					var google_conversion_language = "en";
					var google_conversion_format = "2";
					var google_conversion_color = "ffffff";
					var google_conversion_label = "4kf4COW0qAIQy9yv5QM";
					var google_conversion_value = 0;
					/* ]]> */
					</script>
					<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
					</script>
					<noscript>
					<div style="display:inline;">
					<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1017900619/?label=4kf4COW0qAIQy9yv5QM&amp;guid=ON&amp;script=0"/>
					</div>
					</noscript>

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
				  
                </div>
                <!--#include virtual="/includes/connectionClose.asp"-->
                <!-- Content End From Here-->
              </td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
<script>
document.getElementById('loader').style.display='none';
</script>

