<%

'validations if the field is empty
Function valueRequired(strvalue)

valueError =""
If strvalue = "" Then
     valueError = "Please enter the value"
End If
valueRequired = valueError
End function

'For Any Names
Function ForNames(strValue)
    strValue = Trim(strValue)
	splCharArray =Array("!","`","~","@","#","$","%","^","&","*","(",")","_","-","+",".","*","/","'","""","?",">","<",":",";","[","]","\","|","}","{","+",",","1","2","3","4","5","6","7","8","9","0","")
	splMessage = ""
	For i = 0 to UBound(splCharArray)
			For j = 1 To len(strValue) 
				myChar = Mid(strValue,j,1)
				If myChar = splCharArray(i) Then
						myFlag = 1
						Exit For
				End If
			Next
   
			If myFlag = 1 Then
				splMessage  = "Field should not Contain special character/numbers."
				
				Exit For 
			End If
	Next
    If strValue = "" Then
        splMessage  = "Field should not Contain Special character/numbers."
    End If
	ForNames = splMessage
	
End Function
'////////////////////////////////////////////////////////////////////////////////////////////


'Phone Numbers 
 
Function ForNumber(strValue)
strValue = Trim(strvalue)
Set regEx = New RegExp   
   regEx.IgnoreCase = False
  ' regEx.Pattern ="^(\d+)(-{1})(\d+)(-{1})(\d+)$"   
   regEx.Pattern ="[0-9-]"  
   validatePhoneno = regEx.Test(Trim(strValue)) 
    splMessage =""
     If Not validatePhoneno Then
	     splMessage = "Enter proper Phone No"
    End If
    ForNumber = splMessage  

End Function


'validations for only numeric values
 Function ForotherNumber(strValue)
    strValue = Trim(strvalue)
    splMessage = ""
    If Not ISNumeric(strValue) Then
        splMessage = "Enter only numeric value"
    End If
    ForotherNumber = splMessage
 End Function 



'////////////////////////////////////////////////////////////////////////////////////////////

'For Other Names (Eg: Institution Name etc.)

Function ForOtherNames(strValue)
    strValue = Trim(strValue)
	splCharArray =Array("!","`","~","@","#","$","%","^","*","+","*","?",">","<","|","}","{","+"," ","1","2","3","4","5","6","7","8","9","0","")
	splMessage = ""
	For i = 0 to UBound(splCharArray)
			For j = 1 To len(strValue) 
				myChar = Mid(strValue,j,1)
				If myChar = splCharArray(i) Then
						myFlag = 1
						Exit For
				End If
			Next
   
			If myFlag = 1 Then
				splMessage  = "Enter only characters"
				
				Exit For 
			End If
	Next
    If strValue = "" Then
        splMessage  = "special characters Found"
    End If
	ForOtherNames = splMessage
	
End Function
'////////////////////////////////////////////////////////////////////////////////////////////


'For Address
Function ForAddress(strValue)
    strValue = ReplaceSpecialChar(strValue)
	'splCharArray =Array("'")
	'splMessage = ""
	'For i = 0 to UBound(splCharArray)
			'For j = 1 To len(strValue) 
				'myChar = Mid(strValue,j,1)
				'If myChar = splCharArray(i) Then
						'myFlag = 1
						'Exit For
				'End If
			'Next
   
			'If myFlag = 1 Then
				'splMessage  = "Some special characters Found"
				
				'Exit For 
			'End If
	'Next
	'ForAddress = splMessage
    ForAddress = strValue
End Function
'////////////////////////////////////////////////////////////////////////////////////////////


'Numbers And alphabets (EG: PAN)
Function ForNumbersAndAlphabets(strValue)
    strValue = Trim(strValue)

	splCharArray =Array("!","`","~","@","#","$","%","^","&","*","(",")","_","-","+",".","*","/","'","""","?",">","<",":",";","[","]","\","|","}","{","+",",")
	splMessage = ""
	For i = 0 to UBound(splCharArray)
			For j = 1 To len(strValue) 
				myChar = Mid(strValue,j,1)
				If myChar = splCharArray(i) Then
						myFlag = 1
						Exit For
				End If
			Next
   
			If myFlag = 1 Then
				splMessage  = "Names Contains special characters."
				
				Exit For 
			End If
	Next
    If strValue = "" Then 
        splMessage  = "Names Contains Special characters."
    End If
	ForNumbersAndAlphabets = splMessage

End Function
'////////////////////////////////////////////////////////////////////////////////////////////


'For Gender
Function ForGender(strValue)
    strValue = Trim(UCASE(strvalue))
    splMessage = "Gender Should Be Male(M)/Female(F)"
    Select Case strValue
        Case "M"        : splMessage = ""
        Case "MALE"     : splMessage = ""
        Case "F"        : splMessage = ""
        Case "FEMALE"   : splMessage = ""
    End Select
    ForGender = splMessage
End Function
'////////////////////////////////////////////////////////////////////////////////////////////

'For Email
Function ForEmail(strValue) 
    strValue = Trim(strvalue)

    Set regEx = New RegExp 
    regEx.IgnoreCase = False
    regEx.Pattern = "^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w{2,}$"
    validateEmail = regEx.Test(Trim(strValue)) 
    splMessage = ""
    If Not validateEmail Then
        splMessage = "Enter proper email id"
    End If
    ForEmail = splMessage
End Function  

'////////////////////////////////////////////////////////////////////////////////////////////
'For Password
Function ForPassword(strValue)
    strValue = Trim(strValue)
	splCharArray =Array("'"," ","-","~","`","""","")
	splMessage = ""
	For i = 0 to UBound(splCharArray)
			For j = 1 To len(strValue) 
				myChar = Mid(strValue,j,1)
				If myChar = splCharArray(i) Then
						myFlag = 1
						Exit For
				End If
			Next
   
			If myFlag = 1 Then
				splMessage  = "Some special characters Found"
				
				Exit For 
			End If
	Next
    If strValue = "" Then 
        splMessage  =  "Some special characters Found"
    End If
	ForPassword = splMessage
End Function

'////////////////////////////////////////////////////////////////////////////////////////////
'general function
Function ReplaceSpecialChar(strvalue)
    strValue = Trim(strValue)
    strValue = UCASE(strValue)
    strValue = Replace(strValue,"'","''")
    strValue = Replace(strValue," OR ","/")
    strValue = Replace(strValue," AND ","&")
    ReplaceSpecialChar = strValue
End Function

'general function
'Function RemoveSpaces(strvalue)
'    strValue = Trim(strValue)
'    strValue = Replace(strValue," " ,"")
'    ReplaceSpecialChar = strValue
'End Function

%>

