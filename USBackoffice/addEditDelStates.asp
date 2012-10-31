<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
	If Session("USBUserId") = "" Then 
		Response.Redirect("login.asp")
	Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%

'declare the variable
Dim rqFacultyName1,rqFacultyEmailID1,rqFacultyName2,rqFacultyEmailID2
Dim rqFacultyName3,rqFacultyEmailID3,rqFacultyName4,rqFacultyEmailID4
Dim rqstates,rqstatecode,rqAction,rqFacultyName5,strQeruy1,todayDate
Dim rqstate_id ,rqType,rqdelStateId,rqFacultyEmailID5,strQeruy
Dim rqFac1EmailIdAndName, Fac1EmailId, Fac1Name, rqFacEmailIdAndName, i

'retrive the values
rqCountry = Request.Form("country")
rqstates = Trim(Request.Form("states"))
rqstatecode = Trim(Request.Form("statecode"))
rqFacultyName1 	= Request.Form("FacultyName1")
rqFacultyEmailID1 	= Request.Form("FacultyEmailID1")
rqFacultyName2 	= Request.Form("FacultyName2")
rqFacultyEmailID2 	= Request.Form("FacultyEmailID2")
rqFacultyName3 	= Request.Form("FacultyName3")
rqFacultyEmailID3 	= Request.Form("FacultyEmailID3")
rqFacultyName4 	= Request.Form("FacultyName4")
rqFacultyEmailID4 	= Request.Form("FacultyEmailID4")
rqFacultyName5 	= Request.Form("FacultyName5")
rqFacultyEmailID5 	= Request.Form("FacultyEmailID5")
rqType    = Request.Form("type") 
rqAction    = Request.QueryString("action") 
rqdelStateId = Request.QueryString("delStateId")
rqstate_id = Request.Form("state_id")

rqFac1EmailIdAndName	= Split(Request.Form("FacultyEmailID1"), "-")

For i = 0 to UBound(rqFac1EmailIdAndName)
    Fac1EmailId = Trim(rqFac1EmailIdAndName(0))
	Fac1SecEmailId = Trim(rqFac1EmailIdAndName(1))
	Fac1ThiEmailId = Trim(rqFac1EmailIdAndName(2))
	Fac1Name = Trim(rqFac1EmailIdAndName(3))
Next

rqFac2EmailIdAndName	= Split(Request.Form("FacultyEmailID2"), "-")

For i = 0 to UBound(rqFac2EmailIdAndName)
    Fac2EmailId = Trim(rqFac2EmailIdAndName(0))
	Fac2SecEmailId = Trim(rqFac2EmailIdAndName(1))
	Fac2ThiEmailId = Trim(rqFac2EmailIdAndName(2))
	Fac2Name = Trim(rqFac2EmailIdAndName(3))
Next

rqFac3EmailIdAndName	= Split(Request.Form("FacultyEmailID3"), "-")

For i = 0 to UBound(rqFac3EmailIdAndName)
    Fac3EmailId = Trim(rqFac3EmailIdAndName(0))
	Fac3SecEmailId = Trim(rqFac3EmailIdAndName(1))
	Fac3ThiEmailId = Trim(rqFac3EmailIdAndName(2))
	Fac3Name = Trim(rqFac3EmailIdAndName(3))
Next

rqFac4EmailIdAndName	= Split(Request.Form("FacultyEmailID4"), "-")

For i = 0 to UBound(rqFac4EmailIdAndName)
    Fac4EmailId = Trim(rqFac4EmailIdAndName(0))
	Fac4SecEmailId = Trim(rqFac4EmailIdAndName(1))
	Fac4ThiEmailId = Trim(rqFac4EmailIdAndName(2))
	Fac4Name = Trim(rqFac4EmailIdAndName(3))
Next

rqFac5EmailIdAndName	= Split(Request.Form("FacultyEmailID5"), "-")

For i = 0 to UBound(rqFac5EmailIdAndName)
    Fac5EmailId = Trim(rqFac5EmailIdAndName(0))
	Fac5SecEmailId = Trim(rqFac5EmailIdAndName(1))
	Fac5ThiEmailId = Trim(rqFac5EmailIdAndName(2))
	Fac5Name = Trim(rqFac5EmailIdAndName(3))
Next

todayDate = (YEAR(now()) & "-" & (Month(now())) & "-" & (DAY(now())))


If rqType = "Submit" Then

    
	strQuery = "INSERT INTO ITIL_states (country, states, statecode, fac_name1, fac_emailID1,fac_sec_emailid1, fac_name2, fac_emailID2,fac_sec_emailid2, fac_name3,fac_emailID3,fac_sec_emailid3,fac_name4,fac_emailID4,fac_sec_emailid4,fac_name5,fac_emailID5,fac_sec_emailid5,added_date,added_by, fac_thi_emailID1, fac_thi_emailID2, fac_thi_emailID3, fac_thi_emailID4, fac_thi_emailID5) VALUES ('"& rqCountry &"','"& rqstates &"','"& rqstatecode &"','"& Fac1Name &"','"& Fac1EmailId &"','"& Fac1SecEmailId &"','"& Fac2Name &"','"& Fac2EmailId &"','"& Fac2SecEmailId &"','"& Fac3Name &"','"& Fac3EmailId &"','"& Fac3SecEmailId &"','"& Fac4Name &"','"& Fac4EmailId &"','"& Fac4SecEmailId &"','"& Fac5Name &"','"& Fac5EmailId &"' ,'"& Fac5SecEmailId &"', '"& todayDate &"','"& Session("USBUserId") &"', '"& Fac1ThiEmailId &"', '"& Fac2ThiEmailId &"', '"& Fac3ThiEmailId &"', '"& Fac4ThiEmailId &"', '"& Fac5ThiEmailId &"')"
	
	ConnObj.Execute(strQuery) 
	
	Response.Redirect("states.asp")
	
ElseIf rqType = "Edit Details" Then

	strQuery1 = "UPDATE ITIL_states SET country = '"& rqCountry &"', states = '"& rqstates &"', statecode = '"& rqstatecode &"', fac_name1 = '"& Fac1Name &"', fac_emailID1 = '"& Fac1EmailId &"',fac_sec_emailid1 = '"& Fac1SecEmailId &"',  fac_name2 = '"& Fac2Name &"', fac_emailID2 = '"& Fac2EmailId &"',fac_sec_emailid2 = '"& Fac2SecEmailId &"', fac_name3 = '"& Fac3Name &"',fac_emailID3 = '"& Fac3EmailId &"',fac_sec_emailid3 = '"& Fac3SecEmailId &"', fac_name4 = '"& Fac4Name &"', fac_emailID4 = '"& Fac4EmailId &"',fac_sec_emailid4 = '"& Fac4SecEmailId &"', fac_name5 = '"& Fac5Name &"', fac_emailID5 = '"& Fac5EmailId &"',fac_sec_emailid5 = '"& Fac5SecEmailId &"',modified_date = '"& todayDate &"',modified_by = '"& Session("USBUserId")&"', fac_thi_emailID1 = '"& Fac1ThiEmailId &"', fac_thi_emailID2 = '"& Fac2ThiEmailId &"', fac_thi_emailID3 = '"& Fac3ThiEmailId &"', fac_thi_emailID4 = '"& Fac4ThiEmailId &"', fac_thi_emailID5 = '"& Fac5ThiEmailId &"' WHERE state_id = '"& rqstate_id &"'"
	
	
	
	ConnObj.Execute(strQuery1)
	
	Response.Redirect("states.asp")
		
ElseIf rqAction = "delete" then

	 ConnObj.Execute("DELETE  from ITIL_states where state_id =' " &rqdelStateId& " ' ")
	 
	 response.Redirect("states.asp")
	 
End If
%>
<!--#include virtual="/includes/connectionClose.asp"-->
<% End If %>
