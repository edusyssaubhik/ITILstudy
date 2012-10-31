<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/metatags/index_metatag.html"-->
<%
	Dim strRefer1,strRefer2,strRefer3,strRefer4,strRefer5,strRefer6,strQuery

	Function StrQuoteReplace(strValue)
   		 StrQuoteReplace = Replace(strValue, "'", "''")
	End Function

	rqrefName  		=  Trim(StrQuoteReplace(Request.Form("refName")))
	rqrefEmailID    =  Trim(StrQuoteReplace(Request.Form("refEmailID")))
	rqfrndName1		=  Trim(StrQuoteReplace(Request.Form("frndName1")))
    rqfrndEmailID1	=  Trim(StrQuoteReplace(Request.Form("frndEmailID1")))
	rqfrndName2		=  Trim(StrQuoteReplace(Request.Form("frndName2")))
    rqfrndEmailID2	=  Trim(StrQuoteReplace(Request.Form("frndEmailID2")))
	rqfrndName3		=  Trim(StrQuoteReplace(Request.Form("frndName3")))
    rqfrndEmailID3	=  Trim(StrQuoteReplace(Request.Form("frndEmailID3")))
	rqfrndName4		=  Trim(StrQuoteReplace(Request.Form("frndName4")))
    rqfrndEmailID4	=  Trim(StrQuoteReplace(Request.Form("frndEmailID4")))
	rqfrndName5		=  Trim(StrQuoteReplace(Request.Form("frndName5")))
    rqfrndEmailID5	=  Trim(StrQuoteReplace(Request.Form("frndEmailID5")))
	rqfrndName6		=  Trim(StrQuoteReplace(Request.Form("frndName6")))
    rqfrndEmailID6	=  Trim(StrQuoteReplace(Request.Form("frndEmailID6")))
	rqPersonalMessage	=  Trim(StrQuoteReplace(Request.Form("personalMessage")))
	
	
	session("rqrefName") = rqrefName
	session("rqrefEmailID") = rqrefEmailID

	session("rqfrndName1")=rqfrndName1
	session("rqfrndEmailID1")=rqfrndEmailID1
	session("rqfrndName2")=rqfrndName2
	session("rqfrndEmailID2")=rqfrndEmailID2
	session("rqfrndName3")=rqfrndName3
	session("rqfrndEmailID3")=rqfrndEmailID3
	session("rqfrndName4")=rqfrndName4
	session("rqfrndEmailID4")=rqfrndEmailID4
	session("rqfrndName5")=rqfrndName5
	session("rqfrndEmailID5")=rqfrndEmailID5
	session("rqfrndName6")=rqfrndName6
	session("rqfrndEmailID6")=rqfrndEmailID6

	Set myMail = CreateObject("CDO.Message")

 	myMail.Bcc = "marketing@ITILstudy.com"
	

		
	myBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF"">" 
						'IF Session("CountryOrigin") = "India" Then
						myBody= myBody & "<span><img src=""http://www.ITILstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" /></span>" 
						'ElseIf Session("CountryOrigin")="United Kingdom" Then 
						'myBody= myBody &"<span><img src=""http://www.ITILstudy.com/images/banners/email_headerUK.jpg"" alt=""ITILstudy"" /></span>"
						'ElseIf Session("CountryOrigin")="Other" Then
						'myBody= myBody &"<span><img src=""http://www.ITILstudy.com/images/banners/email_header.jpg"" alt=""ITILstudy"" /></span>"
						'End if
						myBody= myBody &"</td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial, Helvetica, sans-serif"" size=""2"">"
		
	body = "Greetings from ITILstudy.com!  <br><br>Your friend "&rqrefName&" ("&rqrefEmailID&") has referred you to ITILstudy.com."
			
	body = body & "<br><br>We would like to take this opportunity to introduce ourselves. ITILstudy is among the select group of "
				IF Session("CountryOrigin") = "India" Then
						body= body & "<a href=""http://www.apmg-international.com/AccreditedOrganisations/EdusysServices.asp"" target=""_blank"">Accredited Training Organizations (ATO)</a>" 
						ElseIf Session("CountryOrigin")="United Kingdom" OR Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" Then 
						body= body &"<a href=""http://www.apmg-international.com/AccreditedOrganisations/EdusysServices-UK.asp"" target=""_blank"">Accredited Training Organizations (ATO)</a> "
						End If
						body= body &"accredited by APM Group, UK. ITILstudy specialises in conducting quality classroom training programmes to prepare delegates for ITIL Foundation certifications. <a href=""http://www.ITILstudy.com/"" target=""_blank"">ITILstudy.com</a> is the Most Economical and Most Effective Accredited Training Organization to prepare you for the ITIL Foundation Certification Exam. To enroll for our Classroom courses, visit <a href=""http://www.itilstudy.com/ITIL-Courses.asp"" target=""_blank"">http://www.itilstudy.com/ITIL-Courses.asp</a><br><br>ITILstudy has an excellent reputation for prompt and efficient service. It is highly regarded as an organization providing quality products and services at the most cost-effective prices. We deliver training solutions to corporate, both in the public as well as private sectors. We possess institutional capability to not only offer customized courses to our clients, but also to train their delegates in their own premises, if they so desire. To get a quote please email us at <a href=""mailto:marketing@itilstudy.com"" target=""_blank"">marketing@itilstudy.com</a><br><br> ITILstudy also provides online courses for ITIL aspirants, tailored to suit the requirements of working professionals and ensures that delegates master all the ITIL concepts and pass the Foundation exams with good marks. For details about our online courses, visit  <a href=""http://www.itilstudy.com/ITIL-Online-Courses.asp"" target=""_blank"">http://www.itilstudy.com/ITIL-Online-Courses.asp</a><br><br>Why don't you start with trying the various free resources available on <a href=""http://www.ITILstudy.com/"" target=""_blank"">www.ITILstudy.com!</a> This includes <a href=""http://www.itilstudy.com/freeresources/freeOnlineTest.asp"" target=""_blank"">Free 15 Questions to Understand ITIL Foundation Exam format</a> in the final exam format. <br><br>Best Regards,<br><br>Customer Support<br><a href=""http://www.ITILstudy.com"" target=""_blank"">www.ITILstudy.com</a><br>Email: marketing@itilstudy.com</font>"



	If rqfrndEmailID1 <> "" Then
	
		strRefer1 = "Insert into referer_Friend (refName ,refEmailID, frndName,frndEmailID, personalmessage, addedDate) values"
		strRefer1= strRefer1& "('" & rqrefName & " ',"
		strRefer1= strRefer1& "'"& rqrefEmailID &"',"
		strRefer1= strRefer1& "'" & rqfrndName1 & "',"
		strRefer1= strRefer1& "'" & rqfrndEmailID1 & "',"
		strRefer1= strRefer1& "'" & rqPersonalMessage & "',"
		strRefer1= strRefer1& "'" & Date() & "')"
		
		ConnObj.Execute (strRefer1)
		
		If rqfrndName1 <> "" Then
			myBody11 = "Dear "& rqfrndName1 &","
			Name1 = rqfrndName1& ": "
		Else
			myBody11 = "Hello, "
		End If

		myBody1 = myBody & myBody11 & "<BR><BR><form name=""referFrends"" action=""http://www.ITILstudy.com/insertReferFrnd.asp"" method=""post"">"& body &"<input type=""hidden"" name=""refEmailID"" value="&rqrefEmailID&"><input type=""hidden"" name=""refName"" value="&rqrefName&"></form>"
		'response.Write(strQuery)
		myMail.From=rqrefEmailID
		myMail.Subject = Name1 &"Your friend "&rqrefName&" has referred you to ITILstudy"
		myMail.To= rqfrndEmailID1
		myMail.HTMLBody = myBody1 
		myMail.Send
		
	End If
	
	If rqfrndEmailID2 <> "" Then 
		strRefer2 = "Insert into referer_Friend (refName ,refEmailID,frndName,frndEmailID, personalmessage, addedDate) values"
		strRefer2= strRefer2& "('" & rqrefName & " ',"
		strRefer2= strRefer2& "'"& rqrefEmailID &"',"
		strRefer2= strRefer2& "'" & rqfrndName2 & "',"
		strRefer2= strRefer2& "'" & rqfrndEmailID2 & "',"
		strRefer2= strRefer2& "'" & rqPersonalMessage & "',"
		strRefer2= strRefer2& "'" & Date() & "')"		
		
		ConnObj.Execute (strRefer2)

		If rqfrndName2 <> "" Then
			myBody12 = "Dear "& rqfrndName2 &","
			Name2 = rqfrndName& ": "
		Else
			myBody12 = "Hello, "
		End If
				 
		myBody2 = myBody & myBody12 & "<BR><BR><form name=""referFrends"" action=""http://www.ITILstudy.com/insertReferFrnd.asp"" method=""post"">"& body &"<input type=""hidden"" name=""refEmailID"" value="&rqrefEmailID&"><input type=""hidden"" name=""refName"" value="&rqrefName&"></form>"
		
		myMail.From=rqrefEmailID
		myMail.Subject = Name2 &"Your friend "&rqrefName&" has referred you to ITILstudy"
		myMail.To= rqfrndEmailID2
		myMail.HTMLBody = myBody2 
		myMail.Send

	End If
	
	If rqfrndEmailID3 <> "" Then 
		strRefer3 = "Insert into referer_Friend (refName ,refEmailID, frndName,frndEmailID, personalmessage, addedDate) values"
		strRefer3= strRefer3& "('" & rqrefName & " ',"
		strRefer3= strRefer3& "'"& rqrefEmailID &"',"
		strRefer3= strRefer3& "'" & rqfrndName3 & "',"
		strRefer3= strRefer3& "'" & rqfrndEmailID3 & "',"
		strRefer3= strRefer3& "'" & rqPersonalMessage & "',"
		strRefer3= strRefer3& "'" & Date() & "')"

		ConnObj.Execute (strRefer3)

		If rqfrndName3 <> "" Then
			myBody13 = "Dear "& rqfrndName3 &","
			Name3 = rqfrndName3& ": "
		Else
			myBody13 = "Hello, "
		End If
				
		myBody3 = myBody & myBody13 & "<BR><BR><form name=""referFrends"" action=""http://www.ITILstudy.com/insertReferFrnd.asp"" method=""post"">"& body &"<input type=""hidden"" name=""refEmailID"" value="&rqrefEmailID&"><input type=""hidden"" name=""refName"" value="&rqrefName&"></form>"

		myMail.From=rqrefEmailID
		myMail.Subject = Name3 &"Your friend "&rqrefName&" has referred you to ITILstudy"
		myMail.To= rqfrndEmailID3
		myMail.HTMLBody = myBody3 
		myMail.Send
		
	End If
	
	If rqfrndEmailID4 <> "" Then 
		strRefer4 = "Insert into referer_Friend (refName ,refEmailID, frndName,frndEmailID, personalmessage, addedDate) values"
		strRefer4= strRefer4& "('" & rqrefName & " ',"
		strRefer4= strRefer4& "'"& rqrefEmailID &"',"
		strRefer4= strRefer4& "'" & rqfrndName4 & "',"
		strRefer4= strRefer4& "'" & rqfrndEmailID4 & "',"
		strRefer4= strRefer4& "'" & rqPersonalMessage & "',"
		strRefer4= strRefer4& "'" & Date() & "')"

		ConnObj.Execute (strRefer4)

		If rqfrndName4 <> "" Then
			myBody14 = "Dear "& rqfrndName4 &","
			Name4 = rqfrndName4& ": "
		Else
			myBody14 = "Hello, "
		End If
				
		myBody4 = myBody & myBody14 & "<BR><BR><form name=""referFrends"" action=""http://www.ITILstudy.com/insertReferFrnd.asp"" method=""post"">"& body &"<input type=""hidden"" name=""refEmailID"" value="&rqrefEmailID&"><input type=""hidden"" name=""refName"" value="&rqrefName&"></form>"

		myMail.From=rqrefEmailID
		myMail.Subject = Name4 &"Your friend "&rqrefName&" has referred you to ITILstudy"
		myMail.To= rqfrndEmailID4
		myMail.HTMLBody = myBody4 
		myMail.Send
		
	End If
	
	If rqfrndEmailID5 <> "" Then 
		strRefer5 = "Insert into referer_Friend (refName ,refEmailID, frndName,frndEmailID, personalmessage, addedDate) values"
		strRefer5= strRefer5& "('" & rqrefName & " ',"
		strRefer5= strRefer5& "'"& rqrefEmailID &"',"
		strRefer5= strRefer5& "'" & rqfrndName5 & "',"
		strRefer5= strRefer5& "'" & rqfrndEmailID5 & "',"
		strRefer5= strRefer5& "'" & rqPersonalMessage & "',"
		strRefer5= strRefer5& "'" & Date() & "')"
		
		ConnObj.Execute (strRefer5)
		
		If rqfrndName5 <> "" Then
			myBody15 = "Dear "& rqfrndName5 &","
			Name5 = rqfrndName5& ": "
		Else
			myBody15 = "Hello, "
		End If		
		
		myBody5 = myBody & myBody15 & "<BR><BR><form name=""referFrends"" action=""http://www.ITILstudy.com/insertReferFrnd.asp"" method=""post"">"& body &"<input type=""hidden"" name=""refEmailID"" value="&rqrefEmailID&"><input type=""hidden"" name=""refName"" value="&rqrefName&"></form>"

		myMail.From=rqrefEmailID
		myMail.Subject = Name5 &"Your friend "&rqrefName&" has referred you to ITILstudy"
		myMail.To= rqfrndEmailID5
		myMail.HTMLBody = myBody5 
		myMail.Send
		
	End If
	
	If rqfrndEmailID6 <> "" Then 
		strRefer6 = "Insert into referer_Friend (refName ,refEmailID, frndName,frndEmailID, personalmessage, addedDate) values"
		strRefer6= strRefer6& "('" & rqrefName & " ',"
		strRefer6= strRefer6& "'"& rqrefEmailID &"',"
		strRefer6= strRefer6& "'" & rqfrndName6 & "',"
		strRefer6= strRefer6& "'" & rqfrndEmailID6 & "',"
		strRefer6= strRefer6& "'" & rqPersonalMessage & "',"
		strRefer6= strRefer6& "'" & Date() & "')"
		
		ConnObj.Execute (strRefer6)
		
		If rqfrndName6 <> "" Then
			myBody16 = "Dear "& rqfrndName6 &","
			Name6 = rqfrndName6& ": "
		Else
			myBody16 = "Hello, "
		End If			
		
		myBody6 = myBody & myBody16 & "<BR><BR><form name=""referFrends"" action=""http://www.ITILstudy.com/insertReferFrnd.asp"" method=""post"">"& body &"<input type=""hidden"" name=""refEmailID"" value="&rqrefEmailID&"><input type=""hidden"" name=""refName"" value="&rqrefName&"></form>"

		myMail.From=rqrefEmailID
		myMail.Subject = Name6 &"Your friend "&rqrefName&" has referred you to ITILstudy"
		myMail.To= rqfrndEmailID6
		myMail.HTMLBody = myBody6 
		myMail.Send

	End If	
	
	If rqfrndEmailID1 <> "" Then
	
		 refBody = "<table border=""0""><tr><td colspan=""2""><font face=""""Arial, Helvetica, sans-serif"""" size=""2"">Thank you for referring your friends to ITILstudy.<br /><br />You have referred the following friends to ITILstudy.com.<br /><br /></font></td></tr><tr><td width=""70%""><font face=""""Arial, Helvetica, sans-serif"""" size=""2""><b>Email ID</b></font></td><td><font face=""""Arial, Helvetica, sans-serif"""" size=""2""><b>Name</b></font></td></tr>"
			
		 If rqfrndName1 = "" Then
		 	rqfrndName1 = "Not Provided"
		 End If
		 
		 If rqfrndName2 = "" Then
		 	rqfrndName2 = "Not Provided"
		 End If
		 
		 If rqfrndName3 = "" Then
		 	rqfrndName3 = "Not Provided"
		 End If
		 
		 If rqfrndName4 = "" Then
		 	rqfrndName4 = "Not Provided"
		 End If
		 
		 If rqfrndName5 = "" Then
		 	rqfrndName5 = "Not Provided"
		 End If
		 
		 If rqfrndName6 = "" Then
		 	rqfrndName6 = "Not Provided"
		 End If
		 
		 If rqrefName <> "" Then
		 	refSubName = rqrefName &": "
		 End If
		 		 
		 If rqfrndEmailID1 <> "" Then 
			 refBody = refBody & "<tr><td><font face=""Arial, Helvetica, sans-serif"" size=""2"">"& rqfrndEmailID1 &"</font></td><td><font face=""Arial, Helvetica, sans-serif"" size=""2"">"& rqfrndName1 &"</font></td></tr>"
		 End If 
		 If rqfrndEmailID2 <> "" Then 
		 	refBody = refBody & "<tr><td><font face=""Arial, Helvetica, sans-serif"" size=""2"">"& rqfrndEmailID2 &"</font></td><td><font face=""Arial, Helvetica, sans-serif"" size=""2"">"& rqfrndName2 &"</font></td></tr>"
		 End If
		 If rqfrndEmailID3 <> "" Then 
		 	refBody = refBody & "<tr><td><font face=""Arial, Helvetica, sans-serif"" size=""2"">"&rqfrndEmailID3 &"</font></td><td><font face=""Arial, Helvetica, sans-serif"" size=""2"">"& rqfrndName3 &"</font></td></tr>"
		 End If
		 If rqfrndEmailID4 <> "" Then 
		 	refBody = refBody & "<tr><td><font face=""Arial, Helvetica, sans-serif"" size=""2"">"&rqfrndEmailID4 &"</font></td><td><font face=""Arial, Helvetica, sans-serif"" size=""2"">"& rqfrndName4 &"</font></td></tr>"
		 End If
		 If rqfrndEmailID5 <> "" Then 
		 	refBody = refBody & "<tr><td><font face=""Arial, Helvetica, sans-serif"" size=""2"">"& rqfrndEmailID5 &"</font></td><td><font face=""Arial, Helvetica, sans-serif"" size=""2"">"& rqfrndName5 &"</font></td></tr>"
		 End If
		 If rqfrndEmailID6 <> "" Then 
		 	refBody = refBody & "<tr><td><font face=""Arial, Helvetica, sans-serif"" size=""2"">"& rqfrndEmailID6 &"</font></td><td><font face=""Arial, Helvetica, sans-serif"" size=""2"">"& rqfrndName6 &"</font></td></tr>"
		 End If
		 	refBody = refBody & "<tr><td colspan=""2""><BR><BR><font face=""Arial, Helvetica, sans-serif"" size=""2"">If you would like to refer more friends, please <a href=""http://www.ITILstudy.com/referFriends.asp"">click here</a></font></td></tr><tr><td colspan=""2""><font face=""Arial, Helvetica, sans-serif"" size=""2""><br><br>Best Regards,<br /><br />Customer Support<br /><a href=""http://www.ITILstudy.com"" target=""_blank"">ITILstudy.com</a></font></td></tr></table><br /><br /></td></tr></table>"
		
		If rqrefName <> "" Then
			refName = "Dear "& rqrefName &","
		Else
			refName = "Hello,"
		End If
		 
  		myBodyRef = myBody &  refName & "<BR><BR>"&refBody
		
		myMail.From = "ITILstudy <marketing@ITILstudy.com>"
		myMail.Subject = refSubName & "Thank you for referring your friends to ITILstudy"
		myMail.To = rqrefEmailID
		myMail.HTMLBody = myBodyRef 
		myMail.Send
		
	End If
		
	Set myMail=nothing
				

Response.Redirect("thanksToReferrer.asp")
%>
