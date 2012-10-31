<%
'================ Here auto generation of tag code exicutes ====================================== '

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")


'Code for generating automatic tag for refral module'
orderid = "ITIL"

randomno1=int(Year(Date()))

randomno2=int(Month(Date()))

randomno3=int(Day(Date()))

randomno4=int((Hour(Now())))

randomno5=int((Minute(Now())))

randomno6=int((Second(Now())))

randomno7 = (randomno1 &""& randomno2 &""& randomno3 &""& randomno4 &""& randomno5 &""& randomno6)


' Here you can add other characters such as lowercase or special.
Dim pChar, pCount


pChar = "ABCDEFGHIJKLMNPQRSTUVWXYZ@$0123456789"

pCount = Len(pChar) 

Dim psw
psw = "FDN"

Dim pswtag
pswtag = "FDN"

Randomize
For i = 1 To 6 ' password length
psw = psw & Mid( pChar, 1 + Int(Rnd * pCount), 1 )
pass=psw
Next

For i = 1 To 6 ' password length
pswtag = pswtag & Mid( pChar, 1 + Int(Rnd * pCount), 1 )
Tagpass=pswtag
Next


'================ End Of auto generated TAG ================================================ '


'=============== Here updating Tag Record ======================================='

If rqEmailId <> "" Then

Session("FirstName") = rqRefName
Session("EmailId") = rqEmailId

Else

Session("EmailId")= Session("EmailId")
Session("FirstName") = Session("FirstName")
End If


'Query for selecting the RefId If he has already have an account no need of creating account once again '
strQuery = "SELECT * FROM Ref_Account WHERE EmailId = '"&Session("EmailId")&"'"


'response.Write(strQuery)
objRs.Open strQuery, ConnObjRef



If NOT objRs.EOF Then

	RqRefId = objRs("RefID")
	pass = objRs("Pass")
	
	'Selcting the Tag number that he already generated erlier so that he will use old tag only and aslo checking its valid period'
	strQuery1 = "SELECT * FROM Tag_History WHERE RefID = '"&RqRefId&"' AND ValidDate >= '"& Now() &"'"
	

	
		objRs1.Open strQuery1, ConnObjRef
	
	
	If NOT objRs1.EOF Then
	
		GenTag = objRs1("Tag")
		
	
	Else
	
	GenTag = orderid &""& randomno7 &""& Tagpass
	
		'If his having tag but expired we are creating again a new tag'
			
			ConnObjRef.Execute "INSERT Into Tag_History (RefID, Tag, GenDate, ValidDate) VALUES ('"& RqRefId &"','"& GenTag &"','"& Now() &"','"& Now()+30 &"')"
			
			
	
	End If
	
	objRs1.Close

     
'If he dont have an account erlier we create new account and new tag'
Else

	GenTag = orderid &""& randomno7 &""& Tagpass
	
	
	'This Condition is for any one is creating account from Backoffice'
	If Session("courseid") <> "" Then 
	
	ConnObjRef.Execute "INSERT INTO Ref_Account (Name, EmailId, Pass,PayStatus) VALUES ('"& Session("FirstName") &"','"& Session("EmailId") &"','"& pass &"','Paid')"
	
	Else
	
	'This Condition is for any one is creating account from EmailID'
	ConnObjRef.Execute "INSERT INTO Ref_Account (Name, EmailId, Pass) VALUES ('"& Session("FirstName") &"','"& Session("EmailId") &"','"& pass &"')"
	
	End If
	
	strEnollID = "SELECT max(RefID) as RefID FROM Ref_Account"
	
	objRs1.Open strEnollID,ConnObjRef
	
	
	
	Do Until objRs1.Eof
	
		RqRefId = objRs1("RefID")
	
	objRs1.Movenext
	Loop
	objRs1.Close
	
	ConnObjRef.Execute "INSERT INTO Tag_History (RefID, Tag, GenDate, ValidDate) VALUES ('"& RqRefId &"','"& GenTag &"','"& Now() &"','"& Now()+30 &"')"
	

End If

objRs.Close

'================ End Of auto generated TAG ================================================ '


%>