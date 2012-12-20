<!--#include virtual="/includes/headermetapayment.asp"-->
<!--#include virtual="/includes/innerbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<!--#include virtual="/includes/libfuncs.asp"-->
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
    
    <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
    
    <table width="100%" border="0" cellspacing="0" cellpadding="8">
      <tr>
        <td width="2%" class="Header">&nbsp;</td>
        <td width="25%" class="PageTitle">&nbsp;</td>
        <td width="73%" class="PageTitle">Payment</td>
      </tr>
      <tr>
      
      <!--#include virtual="/includes/innerLeftMenu.asp"-->
      <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
      
      <div style="margin-top:-12px; width:96%">
      
      <!-- Content Start From Here-->
      <%
	   'Declare Local Variables'
		Dim strQuery3,strQuery2,Rs1,todaysDate
		Dim dtax,coursePrice,dbprice,Date2,TotalCCAvenue
		Dim CourseDate,Course,Price,Course1,startDate,endDate,sstartDate,eendYear,Course2
		Dim startingDate,splitStartDate,endingDate,splitEndDate,sstartYear,eendDate
		Dim str1,str2,str3,str4,str5,str6,i,Total
		Dim  rqEnrollUsetrID,rqCountry
		Dim orderid, orderid1, orderid2, orderid3, orderid4, orderid5
		Dim Merchant_Id, Order_Id, currency_type, Redirect_Url, WorkingKey
		Dim Merchant_Param, Checksum
		



		'Retrive the EnrollID and Country'

		rqEnrollUsetrID =  Request.QueryString("enrollUserID")
		rqCountry       =  Request.QueryString("Country")
		rqCourse        =  Request.QueryString("item_name_1") 
		
		Session("CountryOrigin") = rqCountry
		
		'Generating unique order id'
		orderid = "ITILCS"&Session("CountryOrigin")

		Order_ID = orderid &""& Session("EnrollID")		
		'Currency Format Display Functions'

		 Currency_Format_Front = CurrencyFormat_Front(Session("CountryOrigin"))

		 Currency_Format_Back = CurrencyFormat_Back(Session("CountryOrigin"))


		Session("EnrollID") = rqEnrollUsetrID
		Session("CountryOrigin") = rqCountry

		Set Rs  = Server.CreateObject("ADODB.Recordset")
		Set Rs1 = Server.CreateObject("ADODB.Recordset")

		todaysDate = Now()

		Date2 = DateAdd("d", +5,CDate(todaysDate))
		  
		strQuery3 = "SELECT * FROM ITIL_enrolledusers WHERE id = '" & Session("EnrollID") & "'"

		Rs.Open strQuery3,ConnObj
		 
	%>
      
        <table width="95%" border="0" cellpadding="2" cellspacing="0">
          <tr>
            <td colspan="2"><div align="center"><span class="Header">COURSE ENROLLMENT DETAILS (PROFORMA INVOICE)</span></div>
              <br />
              </td>
          </tr>
          <% Do Until Rs.EOF %>
          <tr>
            <td align="right" colspan="2"><div align="right"><strong>
                <% = FormatDateTime(todaysDate,1) %>
                </strong></div></td>
          </tr>
          <tr>
            <td><span class="general-bodyBold">Enroll ID :</span>
              <% = Rs("id") %></td>
          </tr>
          <tr>
            <td><span class="general-bodyBold">Name :</span>
              <% = Rs("firstname") %>
              &nbsp;
              <% =  Rs("lastname") %></td>
          </tr>
          <tr>
            <td><span class="general-bodyBold">Email :</span>
              <% = Rs("email") %></td>
          </tr>
          <tr>
            <td><span class="general-bodyBold">Phone Number :</span>
              <% = Rs("phoneno") %></td>
          </tr>
          <tr>
            <td><span class="general-bodyBold">Name Of Employer/Business :</span>
              <% = Session("nameofemployeer") %></td>
          </tr>
          <tr>
            <td><br>
              <span class="SubHeader">Thank you for enrolling in ITILstudy.com <% = Rs("enrolledfor") %> seminar.</span></td>
          </tr>
          <tr>
            <td colspan="2"><br>
              <span class="Header">Details of your course and Payment :</span><br />
              <br />
              <table border="0" align="left" width="95%" cellspacing="0" class="TableGeneral">
                <tr>
                    <td align="center" class="TableRowOdd" width="85%"><span class="HeaderLarge">Details</span></td>
                    <td align="center" class="TableRowOdd"><span class="HeaderLarge">Payment</span></td>
                  </tr>
				 <%
							
							'Course Details'
							CourseDate = Rs("coursedetails")
							FBdiscount = Rs("FBdiscount")

							'Course Price'

							'If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Germany") Then
							If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Australia") Then
							
								If Not IsNull(Rs("VAT")) Then
								
								VAT = Rs("VAT")
								
								Else
								
								VAT = 0
								
								End If
							
							Total = Int(Rs("amount")) + Int(VAT)
							TotalCCAvenue = Int(Rs("amount")) + Int(VAT)							
							
							
							Else
							Total = Rs("amount")
							TotalCCAvenue = Rs("amount")							
							End If
							
							'Calculating the facebook discount
							If FBdiscount <> "" Then
							'If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") Then 
							'x = 10
							TotalFBdis = Total - int(FBdiscount)
							
							End If	
							
							'Response.Write(TotalFBdis&"Test")

						   %>
  
                <tr>
                  <td class="TableRowEven"><span class="TableCopyName">ITIL  Foundation <% = Rs("enrolledfor") %> training
                    <% = Rs("coursedetails") %>
                    </span> <br>
                    <span class="TableCopyDetails">(This includes service tax)</span> </td>
					 <td align="center" class="TableRowEven"><span class="TableCopyName">
                      <% = Currency_Format_Front %>
                      <% = FormatNumber(Rs("amount")) %>
                      <% = Currency_Format_Back %>
                      </span></td>
					   </tr>
                  <% 'If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Germany") Then %>
                  <% If (Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Australia") Then %>
                  <% If VAT <> "" AND VAT <> 0 Then %>
                  <tr>
                    <td class="TableRowEven"><span class="TableCopyName">VAT @
                      <% If (Session("CountryOrigin") = "United Kingdom") Then %>
                      20%
                      <% ElseIf (Session("CountryOrigin") = "India") Then %>
                      10.3%
                       <% ElseIf (Session("CountryOrigin") = "Germany") Then %>
                      19%
                      <% ElseIf (Session("CountryOrigin") = "Australia") Then %>
                      10%
                      <% End If %>
                      </span> </td>
                    <td align="center" class="TableRowEven"><span class="TableCopyName">
                      <% = Currency_Format_Front %>
                      <% = FormatNumber(VAT) %>
                      <% = Currency_Format_Back %>
                      </span></td>
                  </tr>
                  <% End If %>
                  <% End If %>
                  <% If (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada") And FBdiscount <> "" Then %>
                   <tr>
                    <td align="right" class="TableRowEven"><span class="TableCopyName">Discount Amount</span></td>
                    <td align="center" class="TableRowEven"><span class="TableCopyName">
                     <% = Currency_Format_Front %>
                      <% = FormatNumber(FBdiscount) %>
                      <% = Currency_Format_Back %>
                      </span></td>
                  </tr>
                   <% End If %>
                  <tr>
                    <td align="right" class="Tablefooter"><span class="TableCopyName">Total</span></td>
                    <td align="center" class="Tablefooter"><span class="TableCopyName">
                      <% = Currency_Format_Front %>
                       <% If FBdiscount <> "" Then %>
                       <% = FormatNumber(TotalFBdis) %>
                       <% Else %>
                      <% = FormatNumber(Total) %>
                       <% End If %>
                      <% = Currency_Format_Back %>
                      </span></td>
                  </tr>
					                
	       <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
              <td colspan="2" class="general-body"><span class="general-bodyBold">Please Note : </span><br>
                Full payment of the enrollment fee <strong>(
                <% = Currency_Format_Front %>
                <% If FBdiscount <> "" Then %>
                       <% = FormatNumber(TotalFBdis) %>
                       <% Else %>
                      <% = FormatNumber(Total) %>
                       <% End If %>
                <% = Currency_Format_Back %>
                )</strong> should be done through <br />
                <br />
              </td>
            </tr>
		  
          <% If Session("CountryOrigin") = "India" Then %>
          <tr>
            <td> 1. <strong>Check</strong> or <strong>Demand Draft</strong> favoring "<strong>EDUSYS SERVICES PVT LIMITED</strong>".<br />
              <br />
              This should be couriered to the following address:<br>
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Edusys Services Pvt Limited,</strong><br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# 224, 16th Cross, 23rd Main,<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;J P Nagar 5th Phase, <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Near Sai Puspanjali Marriage Hall),<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bangalore, India - 560078<br>
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ph:+91-80-41721315 / +91-80-41721347<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cell:+91-97406 00727<br>
              <br>
            </td>
          </tr>
          <tr>
            <td class="general-body"> 2. Bank Transfer :<br />
              <br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Payee Name : EDUSYS SERVICES PVT LIMITED </strong><br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Bank Name : ICICI Bank Limited</strong><br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Account Number : ICICI Bank A/c No : 0401 0500 0128</strong><br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Branch Name : ICICI Bank, J.P. Nagar Branch, Bangalore</strong> </td>
          </tr>
        
          
          <% ElseIf (Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" ) Then %>
            <tr>
              <td class="btext">
              <table border="0" width="100%">
                  <tr>
                    <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>1. Google Checkout </B></td>
                   <td><form action="https://checkout.google.com/api/checkout/v2/checkoutForm/Merchant/749730688196705" id="BB_BuyButtonForm" method="post" name="BB_BuyButtonForm">
                  <input name="item_name_1" type="hidden" value="ITILstudy <% = Rs("enrolledfor") %> Training"/>
                  <input name="item_description_1" type="hidden" value="ITILstudy <% = Rs("enrolledfor") %> Training"/>
                  <input name="item_quantity_1" type="hidden" value="1"/>
                 <% If FBdiscount <> "" Then %>
                        <input name="item_price_1" type="hidden" value="<% = TotalFBdis %>"/>
                        <% Else %>
                         <input name="item_price_1" type="hidden" value="<% = Total %>"/>
                         <% End If %>
                  <input name="item_currency_1" type="hidden" value="USD"/>
                  <input name="_charset_" type="hidden" value="utf-8"/>
                  <input alt="" src="https://checkout.google.com/buttons/buy.gif?merchant_id=749730688196705&amp;w=117&amp;h=48&amp;style=white&amp;variant=text&amp;loc=en_US" type="image" align="middle"/>
                </form></td></tr>
					<tr>
			<td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>2. Paypal </B></td>
              <td><form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                  <input type="hidden" name="cmd" value="_xclick">
                  <input type="hidden" name="business" value="vmeduinc1@gmail.com">
                  <input type="hidden" name="item_name" value="ITIL <% = Rs("enrolledfor") %> Course">
                  <input type="hidden" name="currency_code" value="USD">
                    <% If FBdiscount <> "" Then %>
                  <input type="hidden" name="amount" value="<% = TotalFBdis %>">
                  <% Else %>
                   <input type="hidden" name="amount" value="<% = Total %>">
                   <% End If %>
				    <input name="item_name" type="hidden" value="<% = CourseDetails %>"/>
				    <input type="image" src="/images/back/buybutton.gif" alt="BuyNow" />
                 
                </form></td>
                  </tr>
				  
                </table></td>
            </tr>
            <tr>
              <td class="btext">
              <table border="0" width="100%">
                  <tr>
                    <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>3. Bank Transfer :</B></td>
                    <td><b>Bank Name: </b>Bank of America, Frederick, MD, USA<br /><b>Type of Account:</b> Current<br /><b>Account Name:</b> VMedu Inc<br><b>Account Number: </b>4460 0519 5480<br><b>Routing Number: </b>052001633 (paper & electronic) / 026009593 (wires)<br /><br /></td>
                    <td></td>
                   </tr>
                 </table>
               </td>
            </tr> 
            
              <% ElseIf Session("CountryOrigin") = "Singapore" Then %>
      <tr>
      
      <td class="btext">
      
      <table border="0">
        <%
				 If(Application("ccvar2")>10000) Then

				 Else

					Application("ccvar2")=int(now())*10000

				 End If
			  %>
      
        <tr>
         <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>1. Paypal </B></td>
          <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
            <input type="hidden" name="cmd" value="_xclick">
            <input type="hidden" name="business" value="adminsupport@projstudy.com">
            <input type="hidden" name="item_name" value="ITIL <% = Rs("enrolledfor") %> Training - <% = Session("CountryOrigin") %>">
            <input type="hidden" name="item_number" value="5007">
            <input type="hidden" name="amount" value="<% = Total %>">
            <input type="hidden" name="cancel_return" value="http://www.itilstudy.com">
            <input type="hidden" name="return" value="http://www.itilstudy.com/payment-success.asp">
            <input type="hidden" name="rm" value="2">
            <input type="hidden" name="currency_code" value="SGD">
            <td><input type="image" src="/images/back/buybutton.gif" alt="BuyNow" /></td>
          </form>
        </tr>
        
         </table>
      </td>
      
      </tr> 
			
			  <% ElseIf Session("CountryOrigin") = "UAE" Then %>
      <tr>
      
      <td class="btext">
      
      <table border="0">
        <%
				 If(Application("ccvar2")>10000) Then

				 Else

					Application("ccvar2")=int(now())*10000

				 End If
			  %>
      
        <tr>
         <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>1. Paypal </B></td>
          <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
            <input type="hidden" name="cmd" value="_xclick">
            <input type="hidden" name="business" value="adminsupport@projstudy.com">
            <input type="hidden" name="item_name" value="ITIL <% = Rs("enrolledfor") %> Training - <% = Session("CountryOrigin") %>">
            <input type="hidden" name="item_number" value="5007">
            <input type="hidden" name="amount" value="<% = Total %>">
            <input type="hidden" name="cancel_return" value="http://www.itilstudy.com">
            <input type="hidden" name="return" value="http://www.itilstudy.com/payment-success.asp">
            <input type="hidden" name="rm" value="2">
            <input type="hidden" name="currency_code" value="USD">
            <td><input type="image" src="/images/back/buybutton.gif" alt="BuyNow" /></td>
          </form>
        </tr>
		
		  <tr>
         <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>2. CCAvenue</B></td>
          <%
		  Merchant_Id	   = "t_satpat1848" 
		  Order_Id       = Order_ID	
		  Amount  = TotalCCAvenue
		  currency_type  = "USD"		
		  Redirect_Url   = "http://www.itilstudy.com/payment-success.asp"
		  WorkingKey	   = "dpgnrv2li2jvxivqk1qjg3tbm89unbxk"
		  Checksum	   = getChecksum(Merchant_Id, Order_Id, Amount, WorkingKey, currency_type, Redirect_Url)
		  
		  %>
          <td width="900px"><form method="post" action="http://www.pmstudy.com/itil_ccavenue.asp">
              <input type="hidden" name="Merchant_Id" value="<%=Merchant_Id%>">
              <input type="hidden" name="item_name" value="ITILstudy <% = rqCourseType %> Training - <% = Session("CountryOrigin") %>">
              <input type="hidden" name="Amount" value="<% = Amount %>">
			   <input type="hidden" name="TotalCCAvenue" value="<% = TotalCCAvenue %>">
              <input type="hidden" name="Order_Id" value="<%=Order_Id%>">
              <input type="hidden" name="ITIL_country" value="<% = Session("CountryOrigin") %>">
              <input type="hidden" name="Currency" value="<% = currency_type %>">
              <input type="hidden" name="TxnType" value="A">
              <input type="hidden" name="actionID" value="txn">
              <input type="hidden" name="Redirect_Url" value="<%=Redirect_Url%>">
              <input type="hidden" name="Checksum" value="<%=Checksum%>">
              <input type="image" src="/images/back/buybutton.gif" alt="BuyNow" />
            </form></td>
        </tr>
       
        
      </table>
      </td>
      
      </tr>  
	  
	   <% ElseIf Session("CountryOrigin") = "United Kingdom"  Then %>
            <tr>
              <td class="btext">
              <table border="0" width="100%">
                  <tr>
                    <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>1. Google Checkout </B></td>
                    <td>
					  <form action="https://checkout.google.com/api/checkout/v2/checkoutForm/Merchant/924725040306386" id="BB_BuyButtonForm" method="post" name="BB_BuyButtonForm" target="_top">
                        <input name="item_name_1" type="hidden" value="ITILstudy <% = Rs("enrolledfor") %> Training "/>
                        <input name="item_description_1" type="hidden" value="ITILstudy <% = Rs("enrolledfor") %> Training "/>
                        <input name="item_quantity_1" type="hidden" value="1"/>
                        <input name="item_price_1" type="hidden" value="<% = Total %>"/>
                        <input name="item_currency_1" type="hidden" value="GBP"/>
                        <input name="_charset_" type="hidden" value="utf-8"/>
                        <input alt="" src="https://checkout.google.com/buttons/buy.gif?merchant_id=749730688196705&amp;w=117&amp;h=48&amp;style=white&amp;variant=text&amp;loc=en_US" type="image" align="middle"/>
                    </form>			
</td>
                  </tr>
                
                  
                   <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                    <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>2. Paypal</B></td>
                    <td>
					<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                      <input type="hidden" name="cmd" value="_cart"> 
                      <input type="hidden" name="upload" value="1"> 
                      <input type="hidden" name="business" value="edusysservices@gmail.com">    
                      <input type="hidden" name="item_name_1" value="ITILstudy <% = Rs("enrolledfor") %> Training  - <% = Session("CountryOrigin") %>">
                      <input type="hidden" name="currency_code" value="GBP">  
    					<input name="item_name" type="hidden" value="<% = CourseDetails %>"/>
						 <input type="hidden" name="amount_1" value="<% = Total %> "/> 
						  <input type="hidden" name="cancel_return" value="http://www.ITILstudy.com">
                  <input type="hidden" name="return" value="http://www.ITILstudy.com/payment-success.asp">
						<input type="image" src="/images/back/buybutton.gif" alt="BuyNow" />
                </form>
                              
							                                  </td></tr> </table>
      </td>
      
      </tr>  
      
       <% ElseIf Session("CountryOrigin") = "Germany"  Then %>
            <tr>
              <td class="btext"><table border="0" width="100%">
     
                   <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                    <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B> Paypal</B></td>
                    <td>
					<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                      <input type="hidden" name="cmd" value="_cart"> 
                      <input type="hidden" name="upload" value="1"> 
                      <input type="hidden" name="business" value="edusysservices@gmail.com">    
                      <input type="hidden" name="item_name_1" value="ITILstudy <% = Rs("enrolledfor") %> Training  - <% = Session("CountryOrigin") %>">
                      <input type="hidden" name="currency_code" value="EUR">  
    					<input name="item_name" type="hidden" value="<% = CourseDetails %>"/>
						 <input type="hidden" name="amount_1" value="<% = Total %> "/> 
						  <input type="hidden" name="cancel_return" value="http://www.ITILstudy.com">
                  <input type="hidden" name="return" value="http://www.ITILstudy.com/payment-success.asp">
						<input type="image" src="/images/back/buybutton.gif" alt="BuyNow" />
                </form>
                              
							                                  </td></tr> </table>
      </td>
      
      </tr>  
							   
							   
		   <% ElseIf Session("CountryOrigin") = "Australia"  Then %>
            <tr>
              <td class="btext"><table border="0" width="100%">
                
                  
                   <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
                    <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;<B>1. Paypal</B></td>
                    <td>
					<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
					<input type="hidden" name="cmd" value="_xclick">
					<input type="hidden" name="business" value="edusysaus@gmail.com">
					<input type="hidden" name="item_name" value="ITILstudy <% = Rs("enrolledfor") %> Training  - <% = Session("CountryOrigin") %>">
					<input type="hidden" name="amount" value="<% = Total %> "/> 
					<input type="hidden" name="cancel_return" value="http://www.ITILstudy.com">
					<input type="hidden" name="return"  value="http://www.ITILstudy.com/payment-success.asp">
					<input type="hidden" name="currency_code"  value="AUD">  
					<input type="image" src="/images/back/buybutton.gif" alt="BuyNow" />
					</form>
					</td>
                  <!--  <td>
					<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                      <input type="hidden" name="cmd" value="_cart"> 
                      <input type="hidden" name="upload" value="1"> 
                      <input type="hidden" name="business" value="edusysservices@gmail.com">    
                      <input type="hidden" name="item_name_1" value="ITILstudy <% = Rs("enrolledfor") %> Training  - <%' = Session("CountryOrigin") %>">
                      <input type="hidden" name="currency_code" value="AUD">  
    				  <input name="item_name" type="hidden" value="<%' = CourseDetails %>"/>
					  <input type="hidden" name="amount_1" value="<%' = Total %> "/> 
					  <input type="hidden" name="cancel_return" value="http://www.ITILstudy.com">
                      <input type="hidden" name="return" value="http://www.ITILstudy.com/payment-success.asp">
					  <input type="image" src="/images/back/buybutton.gif" alt="BuyNow" />
                   </form>
                          </td>-->
				  </tr>
				  
                </table></td>
            </tr>
            <tr>
              <td class="btext"><table border="0" width="100%">
                  <tr>
                    <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;<B>2. Bank Transfer :</B></td>
                    <td><b>Bank Name: </b>ANZ Bank (Australia and New Zealand Banking Group Limited)<br />
                        <b>Account Name:</b> EDUSYS SERVICES PTY LTD <br>
                        <b>Account Number: </b>376446238 <br>
                        <b>BSB (Bank State Branch):</b> 012055</b><br />
                      <br /></td>
                    <td></td>
                  </tr>
                </table></td>
            </tr>            
          <% End If %>
          <tr>
            <td colspan="2" class="general-body"><br />
              <span class="general-bodyBold">We have reserved a seat for you in this course. However, the payment should be received by us
              <% If(CDate(splitStartDate)-(Date()-1)>5) Then%>
              within 5 days from today i.e. before
              <% =  FormatDateTime(DateAdd("d", +4,CDate(todaysDate)),1) %>
              </span>
              <% End If %>
              <% If(CDate(splitStartDate)-(Date())=4) Then%>
              within 4 days from today i.e. before
              <% =  FormatDateTime(DateAdd("d", +3,CDate(todaysDate)),1) %>
              </span>
              <% End If %>
              <% If(CDate(splitStartDate)-(Date())=3) Then%>
              within 3 days from today i.e. before
              <% = FormatDateTime(DateAdd("d", +2,CDate(todaysDate)),1) %>
              </span>
              <% End If %>
              <% If(CDate(splitStartDate)-(Date())=2) Then%>
              within 2 days from today i.e. before
              <% = FormatDateTime(DateAdd("d", +1,CDate(todaysDate)),1) %>
              </span>
              <% End If %>
              <% If(CDate(splitStartDate)-(Date())=1) Then%>
              today i.e. before 5 PM
              <% = FormatDateTime(todaysDate,1) %>
              </span>
              <% End If %>
              <% If(CDate(splitStartDate)-(Date())=0) Then%>
              today i.e. before 9 AM
              <% = FormatDateTime(todaysDate,1) %>
              </span>
              <% End If %>
              - otherwise, your registration for this program will be cancelled. </td>
          </tr>
          <tr>
            <td align="center" colspan="2"><br />
              <font face="Arial" color = "green" size="2.5"><b>We look forward to having you as a student with ITILstudy.com <% = Rs("enrolledfor") %> Training!!!</b></font> </td>
          </tr>
          <% Rs.Movenext
						   Loop 
						   Rs.Close %>
        </table>
        </td></tr>
        </table>
		
        <!-- Content End From Here-->
        <!--#include virtual="/includes/connectionClose.asp"-->
      </div>
      </td>
      
      </tr>
      
    </table>
    </td>
    
    </tr>
    
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
