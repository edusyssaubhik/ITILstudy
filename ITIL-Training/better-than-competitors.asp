<!--#include virtual="/metatags/better-than-competitors_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/better-than-comp-banner.asp"-->
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
 'Declare The Variables'
'======================================================='

 Dim rqafterEBDiscountPrice, rqcurrencyformat, rqapplicabledays
 Dim strQuery ,objRs

Set objRs = Server.CreateObject("ADODB.Recordset")

'Query to get the values from ITIL_countrydetails table
 strQuery = "SELECT afterEBDiscountPrice,applicabledays FROM ITIL_countrydetails WHERE country = '" & Session("CountryOrigin") & "'"	

'Response.Write(strQuery)

  objRs.Open strQuery,ConnObj
  
	
  Do Until objRs.EOF
  
	rqafterEBDiscountPrice = objRs("afterEBDiscountPrice")
	rqapplicabledays = objRs("applicabledays")
	
  objRs.Movenext
  Loop

  objRs.Close

  If session("CountryOrigin") = "Singapore" Then
     rqafterEBDiscountPrice = Replace(rqafterEBDiscountPrice,"$","SGD") 'Replaces $ with SGD
  End If   
%>

<!-- Body Starts -->
<script language="JavaScript" type="text/javascript" src="/js/tableH.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/courses.js"></script>
<script type="text/javascript" src="/js/cities_combo.js"></script>
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
<style type="text/css">
#myTable0{
	border:#CCC solid 1px;
}

#myTable0 td{
	padding:5px;
	border-top:#CCC solid 1px;
	border-left:#CCC solid 1px;
}


#myTable0 td:first-child{
	border-left:none;
	text-align:center;
    font-weight:bold;
    vertical-align:middle;	
}
#myTable0 #header td{
	border-top:none;
	font-weight:bold;
    background-color:#F2F4F4;  
    text-align: center;
    vertical-align: middle;	
}


</style>


<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" >&nbsp;</td>
            <td width="25%">&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; WHY US &raquo; Classroom - Better than Competitors </td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><br /><div style="margin-top:-12px; width:97%;">
              <!-- Content Start From Here-->
		   <h1 class="PageTitle">Why is ITILstudy better than its competitors?</h1>
           <p>ITILstudy scores the highest on all criteria that students look for while selecting ITIL<Sup>&reg;</sup> Classroom training. Please do the analysis yourself by comparing ITILstudy with other ITIL  training providers.</p><br>			

		
                  <table width="97%" id="myTable0" border="0" align="center" onMouseOut="javascript:highlightTableRowVersionA(0);"  cellpadding="0" cellspacing="0" class="TableGeneral">
                    
                    <tr id="header">
                      <td width="20%">Criteria</td>
                      <td>Benefits of ITILstudy</td>
                      <td>Beware of Training Providers that</td>
                    </tr>
                      <% If Session("CountryOrigin") <> "US" AND Session("CountryOrigin") <> "Canada" Then %>
					 <% If Session("CountryOrigin") <> "India" Then %>
                     <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                       <td>Experienced Faculty
                       </td>
                       <td><ul>
                            <li> ITILstudy prides itself on the quality of its faculty, who are the best in the industry, have 10+ years of industry experience and have been trained on ITILstudy training techniques and adult learning processes to deliver an exceptional training experience. <a href="/ITIL-Training/instructors.asp" target="_blank">More</a></li>
                            <li>You would be usually taught by a faculty in your local area who understands the local issues and relates to ITIL concepts through appropriate examples, role plays and case studies.</li>
                           
                       </ul></td>
                       <td><ul>
					   
                            <li> Do not provide correct information on their faculty in their websites or marketing collaterals. These companies may not have faculty with proper experience, communication skills or experience to teach senior professionals. </li>
                            </ul></td>
                    </tr>
				     <% End If %>
                     


                     <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                       <td>Best Documented success rate - 99.2%
                       </td>
                       <td><ul>
                            <li> Of all the students who attended our classes, 99.2% have passed the ITIL  exam. Following the ITILstudy methodology ensures that you succeed in the exam.</li>
							<%If Session("CountryOrigin")= "United Kingdom" Then%>
                            <li>If you study well in the 3/4 days of class depending upon your preferred course, and do your homework properly, you will almost certainly pass the ITIL exam.</li>
							<%Else%>
                            <li>  If you study well in the 2 days of class, and do your homework properly, you will almost certainly pass the ITIL  exam.</li>
                           <%End If%>
                       </ul></td>
                       <td><ul>
					   
                            <li> Do not explicitly state their pass rates in their websites and marketing collaterals. </li>
                            <li>Mention a pass rate of 100%. A pass rate of 100% may be realistically impossible because ITIL is a difficult exam.</li>
                            </ul></td>
                    </tr>  
                    
                                      
                   <% If Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin")="United Kingdom" OR Session("CountryOrigin") = "Australia" Then %>
                           <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                           <td>100% Moneyback Guarantee</td>
                           <td><ul>
                                 <li>Our confidence in our quality is reflected by the fact that we are the only ITIL  Training provider in the industry to offer a 100% Money Back Guarantee.  As per our 100% Moneyback policy, if you fail in the first attempt, you are allowed to retake the ITIL  exam within 3 months of failing the exam for the first time. In case you fail for a second time, we will refund the course fee paid by you. </li>
                                
                                 <li>For the 100% Moneyback Guarantee to be valid you must attend the <%If Session("CountryOrigin")= "United Kingdom" Then%>3<%Else%>2<%End If%> days classroom program, study during the <%If Session("CountryOrigin")= "United Kingdom" Then%>3<%Else%>2<%End If%> days of the class, and take the ITIL exam on the last day of the classroom program. </li> 
                                 </ul></td>
                           <td><ul>
                                
                            
                                <li>Don't offer 100% Moneyback guarantee on their courses.</li>
                                <li>Have very stringent conditions on refund, and do not have the reputation in the industry of adhering to their Moneyback policies.</li>
                                 <li>Have hidden charges to be deducted from the Moneyback, so it is never 100%.</li>
                                <!-- <li>Deduct administrative fees, so the refund is not actually 100%.</li>-->
                                 </ul></td>
                                 
                    </tr>
                    <% End If %>

                     <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                       <td>Quality course content approved by APMG and CSME and taught by accredited trainers
                       </td>
                       <td><ul>
                            <li>ITILstudy is a brand of Edusys Services Pvt. Limited, UK - an APMG and CSME approved Accredited Training Organization (ATO).</li>
                            <li>ITILstudy course and course ware  has been accredited by APMG.</li>
                            <li>All our faculty are ITIL certified and accredited by APMG and CSME. Each has extensive industry experience and is trained in ITILstudy classroom training techniques and adult learning processes aimed at delivering an exceptional training experience.
                            </li>
                       </ul></td>
                       <td><ul>
					   
                            <li>Are not APMG / CSME approved ATOs. </li>
                           <li>Do not have their courses approved by APMG / CSME. </li>
                           <li>Do not have APMG / CSME approved trainers.</li>
                            </ul></td>
                    </tr>

                            
                              <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                           <td>Comprehensive program with minimal pre-course work</td>
                           <td><ul>
						   <li>ITILstudy course is comprehensive and provides everything to make you successful in the ITIL  exam - no other study materials or reference materials are required.</li>
                                 <li>Attend classes with minimal pre-course work.</li>
                                 <li>Study well during the program and do your homework.</li>
								<li><%If Session("CountryOrigin")="United Kingdom" then%>Take ITIL exam on the last day of your preferred course, and PASS!<%else%>Take ITIL  exam on the 2nd day and PASS!<%End If%></li>
                                 
                                 </ul></td>
                           <td><ul>
                               <li>Mandate you to do a lot of pre-course work before attending the classroom training.</li> 
                                 </ul></td>
                                 
                    </tr>
                            
                              <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                                <td>Guaranteed-to-run classes</td>
                                <td><ul>
                                     <li>All our classes are guaranteed to run.</li>
                                     <li>In an unlikely event of ITILstudy cancelling a class, the following options are available:<br /><br />
                                      <ol>
                                      
                                      <li><spam class="SubHeader">Reschedule a class:</spam> you can opt to reschedule for a future class. The amount paid for the cancelled ITILstudy class will be adjusted towards the future class.</li>
                                      
                                      <li> <spam class="SubHeader">Ask for full refund:</spam> you can ask for a full refund of what you have paid for the cancelled class.</li>
                                   
                                      </ol>
                                  </li>
                                      </ul>
                                </td>
                                 <td><ul>
                                       <li>Keep cancelling their classes because of insufficient enrolments, lack of faculty or any other reasons and leave students without any alternatives.</li>
                                      <!-- <li>Do not refund the full amount.</li>-->
                                       <li>Delayed refunds.</li>
                                       </ul></td>
                    </tr>
                    
                    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                                <td>Liberal terms and conditions for course rescheduling and cancellation </td>
                                <td><ul>
                                     <li>We know that there could be situations where students would need to reschedule or cancel their class enrolments. ITILstudy has liberal policies for class rescheduling and cancellation. <a href="/termsAndConditions.asp" >More</a></li>
                                     
                                      </ul>
                                </td>
                                 <td><ul>
                                       <li>Have stringent terms and conditions for class rescheduling and cancellation. Once students pay for their classes, they cannot reschedule or cancel even in an emergency situation.</li>
                                       
                                       </ul></td>
                    </tr>
                               <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                                 <td>Best Value at Lowest Price</td>
                                 <td><ul>
                                       
                                      <li>ITILstudy courses start at <% = rqafterEBDiscountPrice %>  after early bird discount - the lowest price for such a high quality course.</li>
                                     
                                      <li>Additional discounts available for corporate classes, or bulk enrolments. To enquire about corporate classes or bulk enrolments, please <a href="/contactus.asp" >Contact Us</a>.</li>
                                      <%If Session("CountryOrigin")= "United Kingdom" Then%>
                                      <li>The classroom program ensures that you have everything you need to prepare for the ITIL exam.</li>
                                      <% ElseIf Session("CountryOrigin")= "India" Then %>
                                      <li>The 2 days classroom program for Foundation and 3 day classroom training for CSI and OSA ensure that you have everything you need to prepare for the ITIL exam.</li>
                                      <% Else %>
                                      <li>The 2 days classroom program ensure that you have everything you need to prepare for the ITIL exam.</li>
                                      <%End If%>
                                     
                                      </ul></td>
                                 <td><ul>
                                       <li>Overcharge: they may be exploiting you by charging too much.</li>
                                       <li>Keep decreasing their prices as you bargain with them, or claim that they would not be beaten on price by any other competitor. Such providers usually do not have the costs associated with running high quality trainings or paying highly qualified faculty like ITILstudy does.<% If Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore"  Then%>They also do not provide Moneyback Guarantees, or free courses like Six Sigma Green Belt certification or HRD certification offered for free by ITILstudy. <% End if %> So effectively, they do not offer the best value trainings even though they may be priced lower.</li>
                                       </ul></td>
									   
                               </tr>
                               <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                                <td>Several convenient locations</td>
                                <td><ul>
								 <% If Session("CountryOrigin") = "Singapore" Then %>
									   <li>ITILstudy conducts several classes in <% = Session("CountryOrigin") %>. Training with the leader assures you of the "PROVEN QUALITY" training at your convenient locations. <a href="/ITIL-Courses.asp">More</a></li>
									   <% ElseIf Session("CountryOrigin") = "United Kingdom" Then%>
                                       
                                       <li>ITILstudy conducts several classes at almost all major cities in UK. Training with the leader assures you of the proven quality training at a location near you. <a href="/ITIL-Courses.asp">More</a></li>
                                      <%Else%>
                                     <li>ITILstudy conducts several classes at almost all major cities in <% = Session("CountryOrigin") %>. Training with the leader assures you of the "PROVEN QUALITY" training at your convenient locations. <a href="/ITIL-Courses.asp">More</a></li>
                                     
                                     <% End If %>
                                     </ul></td>
                                <td><ul>
                                     <li>Have limited locations and classes.</li>
                                   
                                     </ul></td>
                              </tr>
   <!--                   <% 'If Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore"  Then%>
                             <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                               <td>Free Six Sigma Green Belt Certification and 25 PMI PDUs.<br />or<br />
							Human Resource Development Certification and 20 PMI PDUs.</td>
                              <td><ul>
                                   <li>   ITILstudy's classroom students get free and complimentary access to either 100% online Six Sigma Green Belt course (worth $250) provided by <a href="http://www.6sigmastudy.com/" target="_blank">http://www.6sigmastudy.com</a>  or 100% online Human Resource Development course (worth $250) provided by <a href="http://www.hrdstudy.com/" target="_blank"> http://www.hrdstudy.com</a></li>
                                   </ul>
                               </td>
							   
							
                               <td><ul>
                               <li>Do not provide similar offers for continued improvement and training of students. Some providers may occasionally have some contests with no guaranteed prize.</li>
                               </ul></td>
                             </tr> 
                             
                            <%' End IF %>  -->                                               
                             <%If Session("CountryOrigin")="United Kingdom" Then %>
                             
						<tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                               <td>3 Day Training with Comprehensive Learning Techniques 
                               </td>
                               <td><ul>
                            <li>ITILstudy uses Comprehensive Learning Techniques to ensure that you pass the ITIL exam with 3 days of training. </li>
                           
                       </ul></td>
                       <td><ul>
					     <li>
                         No value addition for 3 days training.</li>
                            </ul></td>
                    </tr>
                    <%End If%>
                    
                     <%If Session("CountryOrigin")="US" OR Session("CountryOrigin")="Canada" Then %>
                             
						<tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                               <td>Free Risk Management course and 20 PMI<sup>&reg;</sup> PDUs
                               </td>
                               <td><ul>
                            <li>ITILstudy's classroom students get free and complimentary access to the Risk Management course provided by www.RMstudy.com (priced at $300). Students also get free 20 PMI PDUs - this satisfies continuing education requirements for the first year for certified Project Management Professionals (PMP)<sup>&reg;</sup>. <a href="http://itilstudy.com/ITIL-Training/free-onlinecertification.asp" target="_blank">More</a></li>
                           
                       </ul></td>
                       <td></td>
                    </tr>
                    <%End If%>
                             
                             <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                             <td>Other benefits</td>
                             <td><ul>
                                   <li>Trainings are conducted in star hotels and high-end meeting centers.</li>
                                   <li>Free online ITIL  pre-course work.</li>
                                   <li>High quality and comprehensive classroom study materials required for the ITIL  exam.</li>
                                  <li>Valuable and practical exam taking tips.</li>
                                  </ul>
                               </td>
                                  <td><ul>
                                  <li>Conduct trainings in-house in cramped meeting rooms, with no emphasis on quality.</li>
                                  <li>Have study material of poor or mediocre quality.</li>
                                  </ul></td>
                    </tr>
                    
                    
                    
                    
                    <% ElseIf  Session("CountryOrigin") = "US" Or Session("CountryOrigin") = "Canada" Then %>
                    
                    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                       <td>Best Documented success rate - 99.2%
                       </td>
                       <td><ul>
                            <li>Our delegates enjoy a very high success rate of 99.2% in the first attempt. <a href="/ITIL-Training/Success-Rate.asp">More</a> </li>
                           
                       </ul></td>
                       <td><ul>
					   <li>Do not mention the success rates on their websites.</li>
                            </ul></td>
                    </tr>
                      <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                           <td>100% Moneyback Guarantee</td>
                           <td><ul>
                                 <li>Our confidence in our quality is reflected by the fact that we are the only ITIL  Training provider in the industry to offer a 100% Money Back Guarantee. </li>
                                
                                 <li>We guarantee that you will be successful in your ITIL<sup>&reg;</sup>  exam after attending the classroom training program offered by us or we will pay for your exam retake. If you fail again, we will refund your course fee in full. <a href="/ITIL-Training/moneyBack.asp">More</a></li> 
                                 </ul></td>
                           <td><ul>
                           <li>Don't offer 100% Moneyback guarantee on their courses.</li>
                                 </ul></td>
                                 
                    </tr>
                    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                       <td>Experienced Faculty
                       </td>
                       <td><ul>
                            <li>All our instructors are ITIL certified (approved by APMG or CSME) with an average project and service management work experience of 15+ years in areas like Information Technology, Construction, Government, Healthcare, Manufacturing etc. Their practical examples and real life experiences make it easier for students to understand and appreciate complex concepts. <a href="/ITIL-Training/instructors.asp">More</a></li>
                           
                       </ul></td>
                       <td><ul>
					     <li>Do not provide correct information on their faculty in their websites or marketing collaterals. These companies may not have faculty with proper experience, communication skills or experience to teach senior professionals.</li>
                            </ul></td>
                    </tr>
                    
                    
                            <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                            <td>Specialized in ITIL training </td>
                            <td><ul>
                                  <li> We provide more focused training on ITIL. Further, we discuss case studies and role plays which relate the important concepts to real life scenarios.</li>
                                  </ul></td>
                             <td><ul>
                                   <li>Do not focus on ITIL training and only prepares students for the ITIL certification exam.</li>
                                   </ul></td>

                    </tr>
                    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                       <td>2 Day Training with Accelerated Learning Techniques 
                       </td>
                       <td><ul>
                            <li>ITILstudy uses Accelerated Learning Techniques to ensure that you pass the ITIL exam with just 2 days of training. <a href="/2-Day-ITIL-Training.asp">More</a> </li>
                           
                       </ul></td>
                       <td><ul>
					     <li>
                         Make you spend an extra day on preparation.</li>
                            </ul></td>
                    </tr>
                   
                    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                     <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then %>
                     <td>No Pre-Course required</td>
                     <% Else %>
                       <td>Non-mandatory pre-course</td>
                       <% End If %>
                       <td><ul>
                            <li>ITILstudy course is comprehensive and provides everything to make you successful in the ITIL  exam - no prior preparation is required. </li>
                           
                       </ul></td>
                       <td><ul>
					     <li>Mandate you to do a lot of pre-course work before attending the classroom training.</li>
                            </ul></td>
                    </tr>
                    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                       <td>Guaranteed-to-run classes</td>
                       <td><ul>
                            <li>All our classes are guaranteed to run.</li>
                          <li>In an unlikely event of ITILstudy cancelling a class, the following options are available:
                          <ol type="1"> 
                          <li>Reschedule a class: You can opt to attend a future class. The amount paid for the cancelled ITILstudy class will be adjusted towards the future class.</li>
                          <li>Ask for full refund: you can ask for a full refund of what you have paid for the cancelled class.</li>
                          </ol>
                          </li>
                       </ul></td>
                       <td><ul>
					     <li>Keep cancelling their classes because of insufficient enrolments, lack of faculty or any other reasons and leave students without any alternatives.</li>
                         <li>Delayed refunds.</li>
                            </ul></td>
                    </tr>
                    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                       <td>Several convenient locations</td>
                       <td><ul>
                            <li>ITILstudy conducts several classes at almost all major cities in US. Training with the leader assures you of the proven quality training at a location near you. <a href="/ITIL-Courses.asp">More</a></li>
                       </ul></td>
                       <td><ul>
					     <li>Have limited locations and classes.</li>
                            </ul></td>
                    </tr>
                    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                       <td>Liberal terms and conditions for course rescheduling and cancellation</td>
                       <td><ul>
                            <li>We know that there could be situations where delegates would need to reschedule or cancel their class enrolments. ITILstudy has liberal policies for class rescheduling and cancellation. <a href="/termsAndConditions.asp">More</a></li>
                       </ul></td>
                       <td><ul>
					     <li>Have stringent terms and conditions for class rescheduling and cancellation. Once delegates pay for their classes, they cannot reschedule or cancel even in an emergency situation.</li>
                            </ul></td>
                    </tr>
                    <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                       <td> Quality course content accredited by APMG and CSME and taught by accredited trainers</td>
                       <td><ul>
                            <li>All our faculty are ITIL certified and accredited by APMG and CSME. They have extensive industry experience and are trained in ITILstudy classroom training techniques and adult learning processes aimed at delivering an exceptional training experience.</li>
                            <li>ITILstudy is a brand of Edusys Services Pvt. Limited, UK (VMEdu, Inc., US)- an APMG and CSME approved Accredited Training Organization (ATO).</li>
                            <li>ITILstudy course and course ware have been accredited by APMG.</li>
                       </ul></td>
                       <td><ul>
					     <li>Are not APMG accredited ATOs</li>
                         <li>Do not have their courses accredited by APMG</li>
                         <li>Do not have APMG accredited trainers</li>
                            </ul></td>
                    </tr>
                    
                    
                       <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                           <td>Comprehensive program with minimal pre-course work</td>
                           <td><ul>
						   <li>ITILstudy course is comprehensive and provides everything to make you successful in the ITIL  exam - no other study materials or reference materials are required.</li>
                                 <li>Attend classes with minimal pre-course work.</li>
                                 <li>Study well during the program and do your homework.</li>
								<li>Take ITIL  exam on the 2nd day and PASS!</li>
                                 
                                 </ul></td>
                           <td><ul>
                               <li>Mandate you to do a lot of pre-course work before attending the classroom training.</li> 
                                 </ul></td>
                                 
                    </tr>
                   
						<tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                               <td>Free Risk Management course and 20 PMI<sup>&reg;</sup> PDUs
                               </td>
                               <td><ul>
                            <li>ITILstudy's classroom students get free and Complementary access to the Risk Management course provided by www.RMstudy.com (priced at $300). Students also get free 20 PMI PDUs - this satisfies continuing education requirements for the first year for certified Project Management Professionals (PMP)<sup>&reg;</sup>. <a href="http://itilstudy.com/ITIL-Training/free-onlinecertification.asp" target="_blank">More</a></li>
                           
                       </ul></td>
                       <td></td>
                    </tr>
                    
                       <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                       <td>Other benefits</td>
                       <td><ul>
                            <li>Trainings are conducted in luxury hotels and high-end meeting centers.</li>
                            <% If Session("CountryOrigin") <> "Canada" Then %>
                            <li>Free online ITIL  pre-course work.</li>
                            <% End If %>
                            <li>High quality and comprehensive classroom study materials required for the ITIL  exam.</li>
                            <li>Valuable and practical exam taking tips.</li>
                       </ul></td>
                       <td><ul>
					     <li>Conduct trainings in-house in cramped meeting rooms with no emphasis on quality.</li>
                         <li>Have study material of poor or mediocre quality.</li>
                            </ul></td>
                    </tr>
                    <% End If  %>            
              </table>
              
              </td>
          </tr>
        </table>
        </td>
    </tr>
  </table>
</div>

<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1026351431/?label=t-fgCJGHqQEQx8Kz6QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>

<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
