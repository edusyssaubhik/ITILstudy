<!--#include virtual="/metatags/courseBenefits_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/FreeRes-aboutITIL-banner.asp"-->
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
 'Declare The Variables'
'======================================================='

 Dim rqafterEBDiscountPrice, rqcurrencyformat, rqapplicabledays
 Dim strQuery ,objRs, rqebdiscount

Set objRs = Server.CreateObject("ADODB.Recordset")

'Query to get the values from ITIL_countrydetails table
 strQuery = "SELECT ebdiscount, afterEBDiscountPrice,applicabledays FROM ITIL_countrydetails WHERE country = '" & Session("CountryOrigin") & "'"	

'Response.Write(strQuery)

  objRs.Open strQuery,ConnObj
  
	
  Do Until objRs.EOF
  
	rqebdiscount = objRs("ebdiscount")
	rqafterEBDiscountPrice = objRs("afterEBDiscountPrice")
	rqapplicabledays = objRs("applicabledays")
	
  objRs.Movenext
  Loop

  objRs.Close
%>
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="25%" >&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; WHY US &raquo; Classroom Course Benefits </td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px; width:97%;">
              <!-- Content Start From Here-->
			   <% If Session("CountryOrigin") <> "India" Then %>
               		<%If Session("CountryOrigin") = "United Kingdom" Then%>
                    	<h1 class="PageTitle">Nine reasons why you should select ITILstudy as your training partner</h1>
                    <%ElseIf Session("CountryOrigin") = "US"  OR Session("CountryOrigin") = "Canada" Then%>
              			<h1 class="PageTitle">Nine reasons why you should select ITILstudy as your training partner</h1>
                      <%Else%>
              			<h1 class="PageTitle">Eight reasons why you should select ITILstudy as your training partner</h1>
              		<%End If%>
              <% Else %>
             <h1 class="PageTitle">Seven reasons why you should select ITILstudy as your training partner</h1>
               <% End If %>
              
             
                
              <ul type="1">
              
              <li>
                <span class="SubHeader"> Best faculty:</span>
                ITILstudy has experienced and professional trainers who are APMG Accredited and are the best in the industry. Each has extensive industry / IT service management experience. Through a comprehensive and extensive “Train-the-trainer” program, all our faculty are trained in ITILstudy classroom training techniques and adult learning processes aimed at delivering an exceptional training experience. <a href="/ITIL-Training/instructors.asp">More</a>
                </li>
                   <li>  <span class="SubHeader">Scientifically designed effective and result-oriented instruction method:</span>
              ITILstudy classroom course has been developed, assessed, and evaluated by several ITIL<Sup>&reg;</sup> Foundation certified experts, and approved by APMG. To improve the learning experience and to enhance retention, our course draws instructional elements from the three primary learning styles, that is, visual (presentations, aids, etc.), auditory (verbal instructions, interactions, etc.) and kinaesthetic (do-it-yourself). Several interactive methods such as experiential learning, small groups, hands-on practice, repetition, trainee panels, periodic evaluation and case studies are extensively used. </li>
                 
                <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Australia" Then %>
              <li>
                <span class="SubHeader">100% Moneyback Guarantee: </span> Our classroom program ensures that you pass the ITIL Foundation exam or we will refund the course fee. <a href="/ITIL-Training/moneyBack.asp">More</a></li>
                <% End If %> 
                 <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada"  Then %>
				<li><span class="SubHeader">ITIL Simulation in Class:</span> To relate the ITIL concepts learned in class to a practical scenario, our ITIL Foundation course includes an ITIL Simulation.<a href="/2-Day-ITIL-Training.asp">More</a></li>
                <% End If %> 
                
                <%If Session("CountryOrigin") = "United Kingdom" Then%>
                <li>
                <span class="SubHeader"> Completely Free and Complimentary Access to Risk Management Certification (priced at £ 195): </span>
                Trusted by 1175+ companies across 63+ countries, this course will not only help you understand and apply the concepts of Risk Management in your workplace but also will offer you 18 PMI PDUs which can be used for continuing education.
                
                 </li>
                
                <%End If%>
                
              <li>
                <span class="SubHeader"> Best value for money:</span>
                <%If Session("CountryOrigin") = "United Kingdom" Then%>
                	Fee for ITILstudy’s ITIL Foundation 3-days classroom training can be as low as £ 950 (plus 20% VAT) per student. <a href="/ITIL-Courses.asp">More </a>
                <%Else%>
                Fee for ITILstudy’s ITIL Foundation <% If Session("CountryOrigin") = "Singapore" then %>3<%Else%>2<% End If %>-days classroom training can be as low as <% = rqafterEBDiscountPrice %> per student. <a href="/ITIL-Courses.asp">More </a>
           		<%End If%>
                 </li>
              <li>
               <% If Session("CountryOrigin") = "Netherlands" Then %>
 						<span class="SubHeader">&euro;100 early bird discount: </span>&euro;100 Early Bird Discount is provided if enrollment is done 12 days before the course start date. So, after the discount, the cost of course is only &euro;899. 
                            <%Else%>
                        
                <span class="SubHeader"><% = rqebdiscount %> Early Bird Discount:</span> <% = rqebdiscount %> Early Bird Discount is provided if enrollment is done <% = rqapplicabledays %> days before the course start date. So, after the discount, the cost of course is only <% = rqafterEBDiscountPrice %>. <a href="/ITIL-Courses.asp">More </a>
   <%End If%>
                </li>
                <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then %>
                <!--  <li>
             <span class="SubHeader"> No pre-preparation required: </span>ITILstudy course is comprehensive and provides everything to make you successful in the ITIL Foundation exam - no prior preparation is required.</li>-->
                 <li>
                <span class="SubHeader">Access to ITILstudy pre-course study material: </span>
              We offer our students access to ITILstudy's pre-course study material as soon  as we receive the payment.</li>
                <% Else %>
              <li>
                <span class="SubHeader">Access to ITILstudy pre-course study material: </span>
              We offer our students access to ITILstudy's pre-course study material as soon  as we receive the payment.</li>
            <% End If %> 
              
             <!-- <% 'If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Australia" Then %>
                <li><span class="SubHeader">Free Six Sigma Green Belt or Human Resource Development Certification:</span>  ITILstudy's classroom students get free and complimentary access to either 100% online Six Sigma Green Belt course  <%' If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" Then %>(worth $ 250)<%' ElseIf Session("CountryOrigin") = "Australia" Then%>(worth 250 USD)<% 'Else %> (worth &#163; 175)<%' End If %>provided by <a href="http://www.6sigmastudy.com/" target="_blank">http://www.6sigmastudy.com</a>  or 100% online Human Resource Development course  <%' If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" Then %>(worth $ 250)<% 'ElseIf Session("CountryOrigin") = "Australia" Then%>(worth 250 USD)<%'Else %> (worth &#163; 175)<%' End If %> provided by <a href="http://www.hrdstudy.com/" target="_blank"> http://www.hrdstudy.com</a>
                </li>
                <% 'End If %>-->
              
                
                 <li> <span class="SubHeader">Excellent Study Environment:</span>
			<% If Session("CountryOrigin") = "Australia" then %>
  Course will be conducted in a star hotel or premium meeting centre, at convenient locations with all the required study aids. It will include lunch, snacks and coffee/tea for the 2 days of classroom training.
 <%Else%>
 Our classroom training is normally conducted at premium meeting centres / hotels at convenient locations with all the required study aids. Snacks and coffee / tea are provided during the classroom programme.
<!-- Our classroom training is normally conducted at premium meeting centres / hotels at convenient locations with all the required study aids. Snacks and coffee / tea are provided during the classroom programme.-->
<% End If%>

               </li>
              
             <li>
                <span class="SubHeader"> PMI Approved PDUs:</span>
                <%If Session("CountryOrigin") = "United Kingdom" Then%>
                 ITILstudy provides 18 PDUs with ITIL Foundation classroom training courses. These are valid PDUs for continuing education requirements in maintaining PMI Certification Status.<a href="http://itilstudy.com/ITIL-Training/PMI_PDU.asp"> More </a> 
                <%Else%>
               ITILstudy provides 18 PDUs with ITIL Foundation classroom training courses. These are valid PDUs for continuing education requirements in maintaining PMI Certification Status.<a href="http://itilstudy.com/ITIL-Training/PMI_PDU.asp"> More </a> 
			   <%End If%>
			  
               
                </li>
                  
              <!-- Content End From Here-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
