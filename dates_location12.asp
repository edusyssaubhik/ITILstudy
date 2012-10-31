<!--#include virtual="/metatags/dates_location_metetag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/innermethodologybanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<!--#include virtual="/includes/generator4datesandlocation12.asp"-->
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
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; COURSES / ENROL &raquo; Classroom Courses </td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">

                <div>
                  <span class="PageTitle">ITIL<Sup>&reg;</sup> Foundation CLASSES - DATES, LOCATIONS AND PRICES </span><br><br>
                
                <span class="Header">ITILstudy ITIL Foundation classroom program includes:</span>
              <ol id="new" type="1"> <li>Everything required for ITIL Foundation exam would be provided, you don’t need to bring anything else to the class</li>
              <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore"  Then %>
               <li>Money Back Guarantee  <a href="/ITIL-Training/moneyBack.asp">More</a></li>
                 <%' If Session("CountryOrigin") = "US" Then %>
               <li>Free Six Sigma Green Belt Certification and 25 PMI PDUs worth $ 250 or Human Resource Development Certification and 20 PMI PDUs worth $ 250. <a href="ITIL-Training/free-onlinecertification.asp">More</a>
							</li>
                 <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
  <li>Money Back Guarantee  <a href="/ITIL-Training/moneyBack.asp">More</a></li>
                 <%' If Session("CountryOrigin") = "US" Then %>
               <li>Free Six Sigma Green Belt Certification and 25 PMI PDUs worth &#163; 175 or Human Resource Development Certification and 20 PMI PDUs worth  &#163; 175. <a href="ITIL-Training/free-onlinecertification.asp">More</a>
							</li>                
                            
                             <% End If %>
                 <li>The cost of ITIL Foundation exam</li>
                 <li>2-day classroom training by experienced trainers</li>
                <li>Free online prep course </li>
                <li>High quality, comprehensive classroom study materials in line with the ITIL Foundation exam</li>

 <li>Refreshments during classroom sessions</li>
 <li>Valuable tips to pass the  ITIL Foundation exam</li>
 <li>Free 18 PMI approved PDUs with our courses <a href="http://itilstudy.com/ITIL-Training/PMI_PDU.asp">More</a></li>
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
	
					 strQuery = "SELECT Distinct(startdate), enddate FROM ITIL_course WHERE country = '" & Session("CountryOrigin") & "' And startdate >= '"&Now() - 1&"' order by startdate asc"
									 
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
								  <select name="country" id="country" style="width:150px;" class="TeXtFielddropdown" onChange="findCountry(this.value);clicked1();">
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
                                  <% = arrAllCities(0,rowCityCounter) %><% If arrAllCities(1,rowCityCounter) <> "" Then %>, <% = arrAllCities(1,rowCityCounter) %><% End If %>
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
                        </form></td>
                    </tr>
					<% End If %>
                   <% If Session("CountryOrigin") <> "United Kingdom"  Then %>
									<tr><td align="right"><table border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>&nbsp;</td><td><div align="right"><a href="termsAndConditions.asp" target="_blank">Terms and Conditions</a></div></td></tr></table></td></tr>
                                    <% End If %>
                    <!-- ============== End of Dropdown============ -->
                     <%
			  'Created file includes here 
			  
					  Set fsoObject=Server.CreateObject ("Scripting.FileSystemObject")
					  
					  'Function For Displaying Question Format'
					 
					 ' Set tsoObject = fsoObject.OpenTextFile("C:\ITILstudy\dateslocation\ITILstudy-Classes-ITILstudy-Training-"&Session("CountryOrigin")&".txt")
					 Set tsoObject = fsoObject.OpenTextFile("E:\vhosts\ITILstudy.com\httpdocs\dateslocation\ITILstudy-Classes-ITILstudy-Training-"&Session("CountryOrigin")&".txt")
 
					  StrMain = tsoObject.ReadAll
					  
					  Response.Write strMain
	                %>
                    </td>
                    </tr>
                    
                    <tr><td colspan="8" id="txtHint" width="100%"></td></tr>

                  </table>
                </div>
               
                <div><span class="Required">*</span> : Price after early bird discount (if you enroll more than <% = CourseApplicableDays %> days before the course start date, and if seats are available)</div><br>
				<% If Session("CountryOrigin") = "US" Then %>
				<div><span class="Required">**</span> : All Texas residents should be sponsored by an employer, and should provide the employer details while enrolling to ITILstudy course.</div>
                <%End If%>
                
               
                <p><a href="enrollClass.asp" class="Header">Enroll in ITILstudy
                  <% = Session("CountryOrigin") %>
                  classroom training </a> </p>
                <div>
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

				  <!-- Google Code for ITILStudy Dates Location Conversion Page -->
				<script type="text/javascript">
				/* <![CDATA[ */
				var google_conversion_id = 1026351431;
				var google_conversion_language = "ar";
				var google_conversion_format = "2";
				var google_conversion_color = "ffffff";
				var google_conversion_label = "Jj-qCOvtiQIQx8Kz6QM";
				var google_conversion_value = 0;
				/* ]]> */
				</script>
				<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
				</script>
				<noscript>
				<div style="display:inline;">
				<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?label=Jj-qCOvtiQIQx8Kz6QM&amp;guid=ON&amp;script=0"/>
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