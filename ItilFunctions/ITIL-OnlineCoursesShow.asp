	<%
	 'added by cm for display of the course list.
			  dim enrolledcourse51 ,enrolledcourse112, syncWithFb
			  			
			   If not trim(session("current_user_id")) = "" then
			   Set objRsCM = Server.CreateObject("ADODB.Recordset")
						dim strEmailID						
						strEmailID = "SELECT payer_email, first_name, last_name, item_name, date_valid, paypal_address_id, pass FROM PaypalDb WHERE customer_id = '"&session("current_user_id")&"' and date_valid>='"&cdate(Date)&"' and item_number='0051' ORDER BY id desc"
						objRsCM.open strEmailID,ConnObj											
						
					if objRsCM.eof = false then
					enrolledcourse51=true
					end if 
					objRsCM.close
					
					strEmailID = "SELECT payer_email, first_name, last_name, item_name, date_valid, paypal_address_id, pass FROM PaypalDb WHERE customer_id = '"&session("current_user_id")&"' and date_valid>='"&cdate(Date)&"' and item_number='112' ORDER BY id desc"
						objRsCM.open strEmailID,ConnObj											
						
					if objRsCM.eof = false then
					enrolledcourse112=true
					end if 
					objRsCM.close
					end if
			
			if enrolledcourse51 <> true then 'true means already inrolled for this course using this customer id			
			
			%>
			
			<!--15 question Free Online test to understand ITIL exam -->
                  <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
				   

                    <td height="108" class="TableRowOdd"><a href="/test15ques.html" target="_blank"> <span class="TableCopyName"> Free 15 question test </span> <span class="TableCopyDetails">(Understand ITIL<sup>&reg;</sup> exam format in 15 minutes). This test includes all the final Foundation Exam features including Marking Questions, Countdown timer and more.</a></span></td>
                    <td class="TableRowOdd" colspan="3"><div align="center">
					 <form action="/customerdetails.asp" method="post" name="0051" id="0051">
					                  <input type="hidden" name="item_number" value="0051">
                  <input type="hidden" name="APMG" value="APMG">
                  <input type="hidden" name="item_name" value="Understand ITIL Exam">
                        <% If Session("CountryOrigin") = "United Kingdom" Then %>
                        <input name="submit" type="submit" class="ButtonBuyNow1 cm" value="Enrol for FREE test">
                        <% Else %>
                        <input name="submit" type="submit" class="ButtonBuyNow1 cm" value="Enroll for FREE test">
                        <% End If %>
						 </form>
                      </div>
					 </td>
					   
                  </tr>
				  <% end if %>
				  		<%	if enrolledcourse112 <> true then 'true means already inrolled for this course using this customer id
						%>

						<!--40 question Free Online test to understand ITIL exam -->

                  <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
				  <form action="/customerdetails.asp" method="post" name="112">
                  <input type="hidden" name="item_number" value="112">
                  <input type="hidden" name="APMG" value="APMG">
                  <input type="hidden" name="item_name" value="Free Simulated Test">
                    <td height="108" class="TableRowEven"><a href="/test40ques.html" target="_blank"> <span class="TableCopyName"> Completely Free Simulated Practice Test (Test 1)!!! </span><br /><span class="TableCopyDetails">Best way to understand ITIL<sup>&reg;</sup> Foundation Exam format.<br />(40 Questions, 1 hour - available for 2 days)</a></span></td>
                    <td class="TableRowEven" colspan="3"><div align="center">
                        <% If Session("CountryOrigin") = "United Kingdom" Then %>					
                        <input name="submit" type="submit" class="ButtonBuyNow1 cm" value="Enrol for FREE test">
                        <% Else %>						
                        <input name="submit" type="submit" class="ButtonBuyNow1 cm" value="Enroll for FREE test">
                        <% End If %>
						</div></td>
					  </form>
                  </tr>
                
				<!-- ITIL Foundation Online Course -->
               <%
			   end if
			   %>
                <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                  <td height="108" class="TableRowOdd"><a href="/ITILonline.asp?action=180days" target="_blank"><span class="TableCopyName">ITILstudy ITIL Foundation (Online Course) :</span> <span class="TableCopyDetails">Priced at
                    <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Netherlands"  OR Session("CountryOrigin") = "Other" Then %>
                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front 
					%>
                    $ 300
                    <%' = Currency_Format_Back 
					%>
                    </span>
                    <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                    200
                    <% = Currency_Format_Back %>
                    </span>
					<% ElseIf Session("CountryOrigin") = "Australia" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                    285 
                    <% = Currency_Format_Back %>
                    </span>
                    <% End If %>
                    for 180 Days (This includes E-learning through Study Guides, Chapter Test and podcasts for all chapters along with 18 PMI PDU Certificate) </span></a></td>
                  <form method="post" action="/customerdetails.asp" onSubmit="return validate_form(this)">
                    <input type="hidden" name="item_name" value="ITIL Foundation Online Course">
                    <input type="hidden" name="item_number" value="104">
                    <td class="TableRowOdd" colspan="2"><div align="center">
            <!--<input type="submit" class="ButtonBuyNow" value="Buy - CCAvenue" />-->
			<input name="submit" type="submit" class="ButtonBuyNow cm" value="Buy">
					  </div>
                </td></form>
                  
                </tr>
				
				<!--Intermediate OSA online course -->
				
				  <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                  <td height="108" class="TableRowEven"><a href="/ITILOSA.asp" target="_blank"><span class="TableCopyName">ITILstudy ITIL Intermediate OSA (Online Course) :</span> <span class="TableCopyDetails"> Priced at
                    <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Other" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Netherlands"  Then %>
                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front 
					%>
                    $ 665 
                    <%' = Currency_Format_Back 
					%>
                    </span>
                    <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                   425 
                    <% = Currency_Format_Back %>
                    </span>
					<% ElseIf Session("CountryOrigin") = "Australia" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                   625 
                    <% = Currency_Format_Back %>
                    </span>
					<% ElseIf Session("CountryOrigin") = "UAE" Then %>
                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front
					%>
                   $ 665  
                    <%' = Currency_Format_Back
					%>
                    </span>
					<% ElseIf Session("CountryOrigin") = "Singapore" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                   838  
                    <% = Currency_Format_Back %>
                    </span>
                    <% End If %>
                    for 60 Days (This includes E-learning through Study Guides, Chapter Test and podcasts for all chapters along with 18 PMI PDU Certificate)</span></a></td>
                 <form method="post" action="/customerdetails.asp" onSubmit="return validate_form(this)">
                    <input type="hidden" name="item_name" value="ITIL Intermediate OSA Online Course">
                    <input type="hidden" name="item_number" value="111">
                    <td class="TableRowEven" colspan="2"><div align="center">
            <!--<input type="submit" class="ButtonBuyNow" value="Buy - CCAvenue" />-->
			<input name="submit" type="submit" class="ButtonBuyNow cm" value="Buy">
					  </div>
                </td></form>
                
                </tr>
				
                
                		<!--Intermediate CSI online course -->
				
				  <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                  <td height="108" class="TableRowOdd"><a href="/ITILCSI.asp" target="_blank"><span class="TableCopyName">ITILstudy ITIL Intermediate CSI (Online Course) :</span> <span class="TableCopyDetails"> Priced at
                    <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Other" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Netherlands"  Then %>
                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front 
					%>
                    $ 665 
                    <%' = Currency_Format_Back 
					%>
                    </span>
                    <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                   425 
                    <% = Currency_Format_Back %>
                    </span>
					<% ElseIf Session("CountryOrigin") = "Australia" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                   625 
                    <% = Currency_Format_Back %>
                    </span>
					<% ElseIf Session("CountryOrigin") = "UAE" Then %>
                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front 
					%>
                   $ 665  
                    <%' = Currency_Format_Back 
					%>
                    </span>
					<% ElseIf Session("CountryOrigin") = "Singapore" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                   838  
                    <% = Currency_Format_Back %>
                    </span>
                    <% End If %>
                    for 60 Days (This includes E-learning through Study Guides, Chapter Test and podcasts for all chapters along with 18 PMI PDU Certificate)</span></a></td>
                 <form method="post" action="/customerdetails.asp" onSubmit="return validate_form(this)">
                    <td class="TableRowOdd" colspan="2">
					 <input type="hidden" name="item_name" value="ITIL Intermediate CSI Online Course">
                    <input type="hidden" name="item_number" value="109">
                   
					<div align="center"><input name="submit" type="submit" class="ButtonBuyNow cm" value="Buy">			
                   </div>
                </td></form>
                
               </tr>
                
                
                  <!--Service Transition online course -->
				
				  <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                  <td height="108" class="TableRowEven"><a href="/ITILTransition.asp" target="_blank"><span class="TableCopyName">ITILstudy ITIL Intermediate Service Transition (Online Course) :</span> <span class="TableCopyDetails"> Priced at
                    <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Other" OR Session("CountryOrigin") = "India"  OR Session("CountryOrigin") = "Netherlands" Then %>
                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front 
					%>
                    $ 665 
                    <%' = Currency_Format_Back 
					%>
                    </span>
                    <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                   425 
                    <% = Currency_Format_Back %>
                    </span>
					<% ElseIf Session("CountryOrigin") = "Australia" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                   625 
                    <% = Currency_Format_Back %>
                    </span>
					<% ElseIf Session("CountryOrigin") = "UAE" Then %>
                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front
					%>
                   $ 665  
                    <%' = Currency_Format_Back 
					%>
                    </span>
					<% ElseIf Session("CountryOrigin") = "Singapore" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                   838  
                    <% = Currency_Format_Back %>
                    </span>
                    <% End If %>
                    for 60 Days (This includes E-learning through Study Guides, Chapter Test and podcasts for all chapters along with 18 PMI PDU Certificate)</span></a></td>
                 <form method="post" action="/customerdetails.asp" onSubmit="return validate_form(this)">
                    <td class="TableRowEven" colspan="2">
					  <input type="hidden" name="item_name" value="ITIL Service Transition Online Course">
                    <input type="hidden" name="item_number" value="115">
                  
					<div align="center">
					<input name="submit" type="submit" class="ButtonBuyNow cm" value="Buy">
            <!--<input type="submit" class="ButtonBuyNow" value="Buy - CCAvenue" />-->
					  </div>
                </td></form>
                
                </tr>
                
                
                
                
                <tr>
                  <td colspan="4" class="TableRowOdd">&nbsp;</td>
                </tr>
				
				
                <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                  <td class="TableRowEven" width="60%"><a name="Blend"></a><img src="/images/buttons/Blended.png" ></td>
                  <td class="TableRowEven" colspan="3" ><div align="center"><span class="Header">Blended Course</span></div></td>
                </tr>
                <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                  <td height="108" class="TableRowOdd"><span class="TableCopyName"><a href="/ITILblend.asp" target="_blank"> ITILstudy ITIL Foundation (Online Course + Exam Voucher) :</span> <span class="TableCopyDetails">Priced at
                    <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Other" OR Session("CountryOrigin") = "Netherlands" Then %>
                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front
					%>
                    $ 450
                    <%' = Currency_Format_Back 
					%>
                    </span>
                    <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                    400
                    <% = Currency_Format_Back %>
                    </span>
					<% ElseIf Session("CountryOrigin") = "Australia" Then %>
                    <span class="TableCopyCost">
                    <% = Currency_Format_Front %>
                    560
                    <% = Currency_Format_Back %>
                    </span>
                    <% End If %>
                    for 90 Days (This includes E-learning through Study Guides, Chapter Test and podcasts for all chapters along with 18 PMI PDU Certificate) &nbsp;
                    <%'If Session("CountryOrigin") = "United Kingdom" Then
					%>
                    <!--<b> One Exam Retake</b>-->
                    <%'End If
					%>
                    </span></a><br />
                    <br />
                    <!--30% discount on ITIL blend course -->
                    <% 'If Session("CountryOrigin") = "United Kingdom" Then
					%>
                    <!--If you have an ITIL discount code, please enter it here:
                    <form action="/blendPrice.asp?type=submit" method="get" id="discount" target="newwindow">
                      <br />
                      Email Id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <input type="text" name="Email" />
                      <br />
                      (Please provide the email id which you used in order to
                      <% 'If Session("CountryOrigin") = "United Kingdom" Then 
					  %>
                      enrol
                      <% 'Else 
					  %>
                      enroll
                      <% 'End If 
					  %>
                      for the PROJstudy classroom course.)<br />
                      Discount Code:&nbsp;&nbsp;
                      <input type="text" name="discountCode" />
                      <input name="submit" type="submit" class="ButtonBuyNow cm" value="Validate" onClick="return openwindow()">
					
                    </form>-->
                    <!-- Ends here - 30% discount on ITIL blend course -->
                    <%' End If
					%>
                  </td>
				  <td class="TableRowOdd" colspan="2"><div align="center"><form action="/customerdetails.asp" method="post">
                      <input type="hidden" name="cmd" value="_xclick">
                      <input type="hidden" value="adminsupport@projstudy.com" name="business">
                      <input type="hidden" value="ITILstuyd Blend Course" name="item_name">
                       <input type="hidden" value="106" name="item_number">
					<input name="submit" type="submit" class="ButtonBuyNow cm" value="Buy">
					  </form></div></td>
                </tr>
                
                
                <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');"></tr>
                <tr>
                  <td colspan="4" class="TableRowEven">&nbsp;</td>
                </tr>
                <!-- <td class="TableRowOdd">
				<%
				
				hour1=hour(now)
				
				Select Case hour1
				
				  Case 1
					'Application("enable")="No"
					'Application("int2")=0
				
				  Case 3
					Application("enable")="No"
					'Application("int1")=Application("int2")+1
				
				  Case 5
					Application("enable")="No"
					'Application("int1")=Application("int2")+1
					
				  Case 7
					Application("enable")="Yes"
					'Application("int1")=Application("int2")+1
					
				  Case 9
					Application("enable")="No"
					'Application("int1")=Application("int2")+1
					
				  Case 11
					Application("enable")="No"
					'Application("int1")=Application("int2")+1
					
				  Case 13
					Application("enable")="No"
					'Application("int1")=Application("int2")+1
					
				  Case 15
					Application("enable")="No"
					'Application("int1")=Application("int2")+1
					
				  Case 17
					'Application("enable")="Yes"
					int1=int1+1
				
				  Case 19
					Application("enable")="No"
					'Application("int1")=Application("int2")+1
					
				  Case 21
					Application("enable")="No"
					'Application("int1")=Application("int2")+1
					
				  Case 23
					Application("enable")="No"
					'Application("int1")=Application("int2")+1
					
				  Case Else
					Application("enable")="No"
					Application("count")=0
						
				  End Select
				
				
				'If(Application("enable")="Yes" and Application("count")<10) Then
				'If(Application("enable")<>"No") Then
				'If(0<>0) Then
				If Application("int2") < 50  Then 
				
			%>
               
			   
			    <input type=hidden name="SPHRPHR" value="PHR">
                <div align="center">
                  <input name="Submit23" type="submit" class="ButtonGeneral" value="Enroll for FREE test">
                </div>
                <% Else %>
                <div align="left"> Test reached maximum limit; please try again after sometime, or enroll in other tests below </div>
                <% End If
				%>
              </td>
            </tr>
          </form>
       
 -->
              