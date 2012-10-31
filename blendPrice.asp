<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ITILstudy Blended Course Details</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body class="popupbody">
<div style="margin-top:10px;" style="visibility:hidden;">

<%
'========================================================='
'Written By : Priyanka'
'Written Date : 26-09-2011'
'Updated Date " 28-09-2011'
'Description :'
'In This Page We Are Diplaying 30% discount on ITILstudy Blended Course'
'========================================================='
%>

<!--#include virtual="/includes/connection.asp"-->
         <%
		 
		 
						'Declare The Variables'
						Dim discountedAmount
						Dim rqAmount, strQuery
						Dim rqType, Email,ITILcode
						
							 ' Retriving values'
							rqCode = request.Form("discountCode")
							rqType = request.QueryString("type")
							Email  = request.Form("Email")
							'response.Write(rqCode)
							'response.Write(Email) %>
                            
						
                            
							<% 'If rqType = "submit" then
							
							rqCode = request.QueryString("discountCode")
							rqType = request.QueryString("type")
							Email  = request.QueryString("Email")
						
							Dim ConnObj2
							
							Set ConnObj2 = Server.CreateObject("ADODB.Connection")
							Set objRs = Server.CreateObject("ADODB.Recordset")
						
							
							ConnObj2.Open "Provider =SQLOLEDB; Data Source=db.winwinhosting.com; Initial Catalog=APMGstudy; User Id=APMGstudy; Password=UpIwnfBKPP2aNv9a"
							
							'ConnObj2.Open "Provider=SQLOLEDB;Data Source=PRIYANKA-1545; Initial Catalog=APMGstudy; User Id=sa; Password=edusys"
							
							strQuery = "Select * from ITIL_blended where payer_email = '"&Email&"' "
							'response.Write(strQuery)
							objRs.Open strQuery, ConnObj2
							Do Until objRs.EOF
							
							ITILcode = objRs("ITIL_code")
						'response.Write(ITILcode)
							objRs.Movenext
							Loop
							objRs.Close
							
						 If ITILcode = rqCode Then  
							 If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Other"  Then 
							 If ITILcode <> rqCode Then  
                         		amount ="450" 
                      		else 
                        		amount="315"
                    		End If 
							
							ElseIf Session("CountryOrigin") = "United Kingdom" Then 
							
							If ITILcode <> rqCode Then  
                         		amount ="350" 
                      		else 
                        		amount="245"
                    		End If 
							
							End If %>
							
                         <% response.Write("Congratulations on successfully entering the discount code. you have been provided a discount of 30% of the actual price")%>
						<script type="text/javascript">
                        
                        //function myfunc () {
                                //var frm = document.getElementById("paypal");
                              //  frm.submit();
                           //}
                           // window.onload = myfunc;
							
							
                            
                        </script>

					  

      
  <form action="https://www.paypal.com/cgi-bin/webscr" method="post" id="paypal">
                      <input type="hidden" name="cmd" value="_xclick">
                      <input type="hidden" name="business" value="adminsupport@projstudy.com">
                      <input type="hidden" name="item_name" value="ITILstudy Blend Course">
                      <input type="hidden" name="item_number" value="106">
                      
                      <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Other" Then %>
                     
                          <input type="hidden" name="amount" value="<% =amount %>">
                       
                       <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                      
                              <input type="hidden" name="amount" value="<% =amount %>">
                            
                        <% End If%>
                     <input type="hidden" name="return" value="http://www.itilstudy.com/payment-success.asp">
                      <input type="hidden" name="rm" value="2">
					  
                      <%  If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" OR Session("CountryOrigin") = "India"  Then %>
                                              <input type="hidden" name="currency_code" value="USD">

                         <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
                                              <input type="hidden" name="currency_code" value="GBP">

                        <% End If%>
                       
					    
                          <div align="center"><br /><input type="submit" value="OK" onClick="this.form.target='_blank';return true;"  /></div>      
                       
                    </form>
                    
                    
                    
                    <%
					  Else
					  
					  response.Write("The code you have entered is invalid, please try again")%>
                      
					  
                            <div align="center"><br /><br /><input type="button" Value="Cancel" onClick="window.close()"> </div>                   
                    </form> 
					<%  
					  End If
					  'End If
					%>     
</div>
</body>
</html>
