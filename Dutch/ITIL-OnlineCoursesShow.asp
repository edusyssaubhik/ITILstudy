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
				   

                    <td height="108" class="TableRowOdd"><a href="/test15ques.html" target="_blank"> <span class="TableCopyName"> Gratis 15-vragen toets </span> <span class="TableCopyDetails">(De samenstelling van het ITIL<sup>&reg;</sup> examen begrijpen in 15 minuten). Deze toets heeft betrekking op alle kenmerken van het Foundation examen, waaronder het markeren van vragen, een aftelprocedure en nog veel meer.</a></span></td>
                    <td class="TableRowOdd" colspan="3"><div align="center">
					 <form action="/customerdetails.asp" method="post" name="0051" id="0051">
					                  <input type="hidden" name="item_number" value="0051">
                  <input type="hidden" name="APMG" value="APMG">
                  <input type="hidden" name="item_name" value="Understand ITIL Exam">
                        <input name="submit" type="submit" class="ButtonBuyNow1 cm" value="Enroll for FREE test">
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
                    <td height="108" class="TableRowEven"><a href="/test40ques.html" target="_blank"> <span class="TableCopyName"> Geheel gratis gesimuleerde oefentoets (toets 1)!!! </span><br /><span class="TableCopyDetails">De beste manier om de samenstelling van het ITIL® Foundation examen te begrijpen.<br>(40 Vragen, 1 uur - beschikbaar gedurende 2 dagen)
</a></span></td>
                    <td class="TableRowEven" colspan="3"><div align="center">
						
                        <input name="submit" type="submit" class="ButtonBuyNow1 cm" value="Enroll for FREE test">
						</div></td>
					  </form>
                  </tr>
                
				<!-- ITIL Foundation Online Course -->
               <%
			   end if
			   %>
                <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                  <td height="108" class="TableRowOdd"><a href="/ITILonline.asp?action=180days" target="_blank"><span class="TableCopyName">ITILstudy ITIL Foundation (online opleiding) : </span> <span class="TableCopyDetails">Met een prijs van 
                    
                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front 
					%>
                    $ 300
                    <%' = Currency_Format_Back 
					%>
                    </span>
                   
                    voor 180 dagen (dit is inclusief elektronisch leren via studiegidsen, toetsen per hoofdstuk en podcasts voor alle hoofdstukken, evenals 18 PMI PDU certificaat)</span></a></td>
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
                  <td height="108" class="TableRowEven"><a href="/ITILOSA.asp" target="_blank"><span class="TableCopyName">ITILstudy ITIL Intermediate OSA (online opleiding) :</span> <span class="TableCopyDetails"> Met een prijs van

                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front 
					%>
                    $ 665 
                    <%' = Currency_Format_Back 
					%>
                    </span>
                    
                    voor 60 dagen (dit is inclusief elektronisch leren via studiegidsen, toetsen per hoofdstuk en podcasts voor alle hoofdstukken, evenals 18 PMI PDU certificaat)</span></a></td>
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
                  <td height="108" class="TableRowOdd"><a href="/ITILCSI.asp" target="_blank"><span class="TableCopyName">ITILstudy ITIL Intermediate CSI (online opleiding) :</span> <span class="TableCopyDetails"> Met een prijs van 

                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front 
					%>
                    $ 665 
                    <%' = Currency_Format_Back 
					%>
                    </span>
                    
                   voor 60 dagen (dit is inclusief elektronisch leren via studiegidsen, toetsen per hoofdstuk en podcasts voor alle hoofdstukken, evenals 18 PMI PDU certificaat)</span></a></td>
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
                  <td height="108" class="TableRowEven"><a href="/ITILTransition.asp" target="_blank"><span class="TableCopyName">ITILstudy ITIL Intermediate Service Transition (online opleiding) :</span> <span class="TableCopyDetails"> Met een prijs van
                    
                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front 
					%>
                    $ 665 
                    <%' = Currency_Format_Back 
					%>
                    </span>
                    
                    voor 60 dagen (dit is inclusief elektronisch leren via studiegidsen, toetsen per hoofdstuk en podcasts voor alle hoofdstukken, evenals 18 PMI PDU certificaat)</span></a></td>
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
                  <td class="TableRowEven" colspan="3" ><div align="center"><span class="Header">Gemengde opleiding</span></div></td>
                </tr>
                <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                  <td height="108" class="TableRowOdd"><span class="TableCopyName"><a href="/ITILblend.asp" target="_blank"> ITILstudy ITIL Foundation (online opleiding + waardebon voor het examen) :</span> <span class="TableCopyDetails"> Met een prijs van
                    
                    <span class="TableCopyCost">
                    <%' = Currency_Format_Front
					%>
                    $ 450
                    <%' = Currency_Format_Back 
					%>
                    </span>
                    
                    voor 90 dagen (dit is inclusief elektronisch leren via studiegidsen, toetsen per hoofdstuk en podcasts voor alle hoofdstukken, evenals 18 PMI PDU certificaat) 

                    </span></a><br />
                    <br />

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

              