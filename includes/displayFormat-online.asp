<% 

'This Function Uses is Displaying Price Formats in India and US'
Function CurrencyFormat_Front(Country)

	Select Case Country
	
		Case "US", "India", "Canada","Singapore", "UAE","Other"
			CurrencyFormat_Front = " $ "
			
		Case "United Kingdom"
			CurrencyFormat_Front = " &#163; "

       
			
	End Select
	
End Function	

'This Function Uses is Displaying Price Formats in UAE and SG'
Function CurrencyFormat_Back(Country)

	Select Case Country
	
	
	   Case "Australia"
			CurrencyFormat_Back = " AUD"
	
	End Select
	
End Function

 %>

