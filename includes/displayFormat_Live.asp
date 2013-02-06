<%
'This Function Uses is Displaying Price Formats in India and US'
Function CurrencyFormat_Front(Country)

	Select Case Country
	
		Case "India"
			CurrencyFormat_Front = " Rs. "

	
		Case "US", "Canada", "UAE","Other","United Kingdom"
			CurrencyFormat_Front = " $ "
			
		Case "Germany"
			CurrencyFormat_Front = " &euro; "
			
		Case "Netherlands"
			CurrencyFormat_Front = " &euro; "
			
	End Select
	
End Function	


'This Function Uses is Displaying Price Formats in UAE and SG'
Function CurrencyFormat_Back(Country)

	Select Case Country
	
	   Case "Australia"
			CurrencyFormat_Back = " AUD"	
			
		 Case "Singapore"
			CurrencyFormat_Back = " SGD"		
	  
	End Select
	
End Function
%>