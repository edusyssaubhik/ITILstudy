<!--#include virtual="/metatags/index_metatag.html"-->
<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/innerwhyusbanner.html"-->
<!--#include virtual="/includes/libfuncs.asp"-->
<div>
<html>
<head>
<script type="text/javascript">

function check(str)
{
	var str1 = str.value
	if (isNaN(str1))
		{
		 alert('Amount has Characters. \n Please remove them and try again');
		 return false
		}
	return true
}

function emptycheck(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}
}

function validate_form(thisform)
{

  with (thisform)
	{

		if (emptycheck(item_name,"Please enter your Payment for")==false)
			  {item_name.focus();return false}

		if (emptycheck(amount,"Please enter your Amount")==false)
			  {amount.focus();return false}
			  
		if (check(amount)==false)
			     {amount.focus();return false}
	  
			  
     }
}


function validate_form2(thisform)
{

  with (thisform)
	{

		if (emptycheck(Merchant_Param,"Please enter your Payment for")==false)
			  {Merchant_Param.focus();return false}

		if (emptycheck(Amount,"Please enter your Amount")==false)
			  {Amount.focus();return false}
			  
		if (check(Amount)==false)
			     {Amount.focus();return false}
	  
			  
     }
}


function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}
}


function validate_form1(thisform)
{
	with (thisform)
	{

	// Check The First Name Field Empty Or Not

	if (validate_required(billing_cust_name,"Please enter your name")==false)
		  {billing_cust_name.focus();return false}

	}

}

</script>
</head>
<!-- Body Starts -->
<body>
<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
        <tr>
          <td width="2%" class="Header">&nbsp;</td>
          <td width="25%" class="PageTitle">&nbsp;</td>
          <td width="73%" class="breadcrumb">&nbsp;</td>
        <tr>
          <!--#include virtual="/includes/innerLeftMenu.asp"-->
          <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px; width:95%;"> <br />
              <h1 class="PageTitle">Making payment for itilstudy.com (for increasing duration, bulk enrollments etc)</h1>
              <% If Request.Form("Amount") = "" Then %>
              <span>Please note that itilstudy.com supports 2 payment processors, CCAvenue and Paypal. You can use either of the two payment processors for making payments</span>
              <% End If %>
              <table border="0" cellpadding="10" cellspacing="0">
                <tr>
                  <td><br>
                    <span  class="Header">Make payment using primary Payment Processor, CCAvenue</span><br>
                    <br>
                    <% If Request.Form("Amount") = "" Then %>
					<form method="post" action="http://www.pmstudy.com/itil_ccavenue.asp" onSubmit="return validate_form2(this)" >
                    <table border="0" cellpadding="4" cellspacing="0">
                      
                        <tr>
                          <td>Payment made for :</td>
                          <td><input type="text" name="Merchant_Param" size="50">
                            <br/>
                            <I><font face="arial" size="2" color="red">(some examples are "Extending course by 7 days", "Bulk enrollment of 10 students" etc.)</font></I></td>
                        </tr>
                        <tr>
                          <td>Amount :</td>
                          <td><input type="text" name="Amount" size="5">
                          </td>
                        </tr>
                        <tr>
                          <td>Please pay using CCAvenue</td>
                          <td  align="center"><input type="image"  src="/images/back/buybutton.gif" border="0" name="submit" alt="Make payments  with CCAvenue - it's fast, free and secure!"></td>
                        </tr>
                      
                    </table></form>
					</td>
                </tr>
                <tr>
                  <td><br>
                    <span class="Header">Make payment using primary Payment Processor, PayPal</span><br>
                    <br>
					 <form action="https://www.paypal.com/cgi-bin/webscr" method="post"  onSubmit="return validate_form(this)" >
                    <table border="0" cellpadding="4" cellspacing="0">
                     
                        <input type="hidden" name="cmd" value="_xclick">
                        <input type="hidden" name="business" value="adminsupport@projstudy.com">
                        <tr>
                          <td>Payment made for :</td>
                          <td><input type="text" name="item_name" size="50">
                            <br/>
                            <I><font face="arial" size="2" color="red">(some examples are "Extending course by 7 days", "Bulk enrollment of 10 students" etc.)</font></I></td>
                        </tr>
                        <input type="hidden" name="item_number" value="10000">
                        <tr>
                          <td>Amount : </td>
                          <td><input type="text" name="amount" size="3"></td>
                        </tr>
                        <input type="hidden" name="cancel_return" value="http://www.itilstudy.com">
                        <input type="hidden" name="return" value="http://www.itilstudy.com/payment-success.asp">
                        <input type="hidden" name="rm" value="2">
                        <input type="hidden" name="currency_code" value="USD">
                        <tr>
                          <td>Please pay using Paypal</td>
                          <td  align="center"><input type="image"  src="/images/back/buybutton.gif" border="0" name="submit" alt="Make payments  with PayPal - it's fast, free and secure!"></td>
                        </tr>
                     
                    </table>
					 </form>
                    <% ElseIf Request.Form("Amount") <> "" Then %>
                    <%
                'Decalre the Local Variables'
                Dim rqItemNumber
                Dim rqItemName
                Dim rqAmount
                Dim orderid 
                
                
                'Generating unique order id'
                orderid = "ITIL"
                
                randomno1=int(Year(Date()))
                
                randomno2=int(Month(Date()))
                
                randomno3=int(Day(Date()))
                
                randomno4=int((Hour(Now())))
                
                randomno5=int((Minute(Now())))
                
                randomno6=int((Second(Now())))
                
                randomno7 = (randomno1 &""& randomno2 &""& randomno3 &""& randomno4 &""& randomno5 &""& randomno6)
                
                Order_ID = orderid &""& randomno7
                
				  Merchant_Id	   = "t_satpat1848" 
				  Order_Id       = Order_ID
				  Merchant_Param = Request.Form("Merchant_Param")
			      Amount  = Request.Form("Amount")
				  currency_type  = "USD"		
				  Redirect_Url   = "http://www.itilstudy.com/payment-success.asp"
				  WorkingKey	 = "dpgnrv2li2jvxivqk1qjg3tbm89unbxk"
                          
                  Checksum	   =   getChecksum(Merchant_Id, Order_Id, Amount, WorkingKey, currency_type, Redirect_Url) %>
                    <table border="0" cellpadding="4" cellspacing="0">
                      <form method="post" action="https://world.ccavenue.com/servlet/ccw.CCAvenueController" onSubmit="return validate_form1(this)" >
                        <tr>
                          <td>Name:</td>
                          <td><input type="text" name="billing_cust_name" /></td>
                        </tr>
                        <tr>
                          <td>City:</td>
                          <td><input type="text" name="billing_cust_city" /></td>
                        </tr>
                        <tr>
                          <td>State / Province:</td>
                          <td><input type="text" name="billing_cust_state" /></td>
                        </tr>
                        <tr>
                          <td>Country:</td>
                          <td><input type="text" name="billing_cust_country" /></td>
                        </tr>
                        <tr>
                        <tr>
                          <td>Payment made for :</td>
                          <td><input type="text" name="Merchant_Param" value="<% = Merchant_Param %>" /></td>
                        </tr>
                        <tr>
                          <td>Amount :</td>
                          <td> $
                            <% = Amount %>
                            <input type="hidden" name="Merchant_Id" value="<%=Merchant_Id%>">
                            <input type="hidden" name="Amount" value="<%=Amount%>">
                            <input type="hidden" name="Order_Id" value="<%=Order_Id%>">
                            <input type="hidden" name="Currency" value="<% = currency_type %>">
                            <input type="hidden" name="TxnType" value="A">
                            <input type="hidden" name="actionID" value="txn">
                            <input type="hidden" name="Redirect_Url" value="<%=Redirect_Url%>">
                            <input type="hidden" name="Checksum" value="<%=Checksum%>">
                          </td>
                        </tr>
                        <tr>
                          <td>Please pay using CCAvenue</td>
                          <td  align="center"><input type="submit" value="Confirm" alt="BuyNow" /></td>
                        </tr>
                      </form>
                    </table></td>
                </tr>
              </table>
              <% End If %>
              <div> </div>
              <div>
                <p class="Header">Please note:</p>
                <ul>
                  <% If Request.Form("Amount") = "" Then %>
                  <li>If you wish to pay through a check, it should be made in favour of 'Edusys Services Pvt. Ltd' and sent to the following address: VMEdu, Inc., 4539 Metropolitan Ct., Frederick, MD 21704.</li>
                  <% End If %>
                  <li>If you are unable to remit payment using any of the methods given above, please email us at marketing@itilstudy.com so that we can suggest an alternate mode of payment to you.</li>
                  <li>Within 6 hours of your making the payment, we will provide you the service for which the payment was made. Please check your email (including your bulk email folder for any email from us).</li>
                </ul>
                </p>
              </div>
            </div></td>
        </tr>
      </table></td></td>
        </tr>
      </table>
  </tr>
</table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
