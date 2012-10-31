<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%' option explicit %>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 19/08/2011'
'Description :'
'This Page is for inserting course feedback '
'======================================================='
' This page validates the user email id and inserts the contact details in to cat_paypaldb and course details in to proformainvoice tables and redirects the user for login.
%>
<!--#include virtual="/metatags/index_metatag.html"-->
<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innermethodologybanner.html"-->
<!-- #include virtual = "/includes/connection.asp"-->

<%
' ----------------------------------------------------------------------------------
'	Recordset varables
' ----------------------------------------------------------------------------------
	Set objRs = Server.CreateObject("ADODB.Recordset")
' ----------------------------------------------------------------------------------
'	Variable declaration
' ----------------------------------------------------------------------------------
	Dim ParticipantName, subject, city, todayDate, strQuery
	Dim Email, firstName, lastName,startDate,country,RollNo, courseType
	Dim studyGuides, studyMethodology, webInterface, chapterTests,MockTest,aboutCourse,Improvement,comments
	
' ----------------------------------------------------------------------------------
'	Retriving form feedback
' ----------------------------------------------------------------------------------
        If request.Form("Name") <> "" Then 
		 ParticipantName = 	request.Form("Name")
		 'response.Write(ParticipantName)
       Else
         firstName        =     request.Form("FirstName")
		 lastName         =     request.Form("LastName")
         ParticipantName  =     firstName&" "&lastName
	End IF	 
         startDate        =     request.Form("StartDate")
		 endDate        =     request.Form("EndDate")
		 city             =     request.Form("city")
		 country          =     request.Form("country")
		 studyGuides      =     Request.Form("studyguides")
		 studyMethodology =     Request.Form("studyMethodology")
		 webInterface     =     Request.Form("webInterface")
		 chapterTests     =     Request.Form("chapterTests")
		 MockTest         =     Request.Form("MockTest")
		 aboutCourse      =     Replace(Request.Form("course"),"'","''")
		 Improvement      =     Replace(Request.Form("Improvement"),"'","''")
		 comments         =     Replace(Request.Form("comments"),"'","''")
         rqType           =     request.Form("type")
		'Email            =     request.Form("email")
		
		
	   If  request.Form("email") <> "" Then
		'If coming from feedback from contact us and also from more freebies email feedback form'
		    Email = request.Form("email")
			
		Else
		'If coming from query page after logged into online course'
		    Email = Session("PayerEmail")	
			
		End If
 'response.Write(Email)	
      
      'formatting date
	   todayDate = (YEAR(now()) & "-" & (Month(now())) & "-" & (DAY(now()))) 
	   

	   
' ----------------------------------------------------------------------------------
'	 Inserting details of complaint log
' ----------------------------------------------------------------------------------
	    
   		If rqType = "Submit" Then
   
		   strQuery = "INSERT INTO ITIL_CourseFeedback (participantName, startDate,endDate,city,country,studyGuides, studyMethodology, WebInterface, chapterTests, mockTest, likedAboutCourse, improvOpportunity, comments)"
		   strQuery = strQuery & " values "
		   strQuery = strQuery & "('" & ParticipantName & "',"
		   strQuery = strQuery & "' " & startDate & " ',"
		   strQuery = strQuery & "'" & endDate & "',"
		   strQuery = strQuery & "'" & city & "',"
		   strQuery = strQuery & "'" & country & "',"
		   strQuery = strQuery & "'" & studyGuides & "',"
		   strQuery = strQuery & "'" & studyMethodology & "',"
		   strQuery = strQuery & "'" & webInterface & "',"
		   strQuery = strQuery & "'" & chapterTests & "',"
		   strQuery = strQuery & "'" & mockTest & "',"
		   strQuery = strQuery & "'" & aboutCourse & "',"
		   strQuery = strQuery & "'" & Improvement & "',"
		   strQuery = strQuery & "'" & comments & "')"
	

		   ConnObj.Execute strQuery
		   
		   
		
		   
		   %>
		  <div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
    
    <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
    
    <table width="100%" border="0" cellspacing="0" cellpadding="8">
      <tr>
        <td width="2%" class="Header">&nbsp;</td>
        <td width="25%" class="PageTitle">&nbsp;</td>
        <td width="73%" class="PageTitle">Feedback</td>
      </tr>
      <tr>
      
      <!--#include virtual="/includes/innerLeftMenu.asp"-->
      <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
      <br />
      <div style="margin-top:-12px;">
        <!-- Content Start From Here-->
        
      <%
	   'Getting ip address'
	   
	  
sIPAddress = Request.ServerVariables("HTTP_X_FORWARDED_FOR")

If sIPAddress="" Then sIPAddress = Request.ServerVariables("REMOTE_ADDR")

	strQuery11 = "http://geoip1.maxmind.com/b?l=4tAUhyTgUD6d" & _
		"&i=" & sipaddress
	set objHtp = Server.CreateObject("Msxml2.ServerXMLHTTP")
	objHtp.open "GET", strQuery11, false
	objHtp.send
	sipAddress = sipAddress + ";" + objHtp.ResponseText %>
    
    
		<% strText = "Dear "&ParticipantName&",<BR><BR>Thank you for your feedback to ITILstudy.com.<BR><BR>For more queries, please email us at adminsupport@itilstudy.com."
		
		Response.Write(strText)
	   
		   
		    'Email Template'
		body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.ITILstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" /></span>" 
				body= body &"<br></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "& ParticipantName &",<br><br>Thank you for taking time to provide your valuable feedback.<br><br>We are forwarding your suggestions to the relavent department which evaluates suggestions and feedback and takes relevant and appropriate actions.<br><br>The feedback submitted by you is mentioned below. Kindly review and if there are any changes or comments, please reply back to this email.<br><br>Start date: "&startDate&"<br><br>End Date: "&endDate&"<br><br>Location<br><br>City: "&city&"<br><br>Country: "&country&"<br><br>Ratings (Scale 1 to 10; 10 = Best, 1 = Worst)<br><br>Study Guides: "&studyGuides&" <br>Study Methodology: "&studyMethodology&"<br>Web Interface: "&webInterface&"<br>Chapter Tests:"&chapterTests&"<br>Mock Test: "&mockTest&"<br><br>What did you like about the Course: "&aboutCourse&"<br><br>Improvement Opportunity: "&Improvement&"<br><br>Any other comments: "&comments&"<br><br>We value such feedback and suggestions. We hope in future also you would reach out to us with your thoughts, suggestions and feedback.<br><br>We hope you enjoyed our experience with ITILstudy.<br><br>Best Regards,<br>Customer Support<br>ITILstudy<br>A brand of Edusys Services Pvt. Limited</font></td></tr></table></td></tr><tr><td align=""center""><hr>"
                body= body &" <font size=""1px""><div align=""center"">&copy; 2011 ITILstudy.com Content is based on OGC (ITIL<sup>&reg;</sup>) material.</div></font><br><font size=""1px"">ITIL<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.<br/>The Swirl logo™ is a trade mark of the Cabinet Office.</font></td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"&sIPAddress
                          
		'Response.Write(body)

		Dim objCDOMail     
		'Holds the CDONTS NewMail Object
		'Create the e-mail server object
		Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
		'Who the e-mail is from
		objCDOMail.From =  "adminsupport@itilstudy.com"
		'Who the e-mail is sent to
		objCDOMail.To = ""&Email&""
		'bcc
	    objCDOMail.Bcc = "adminsupport@itilstudy.com,marketing@itilstudy.com"
		'Set the subject of the e-mail
		objCDOMail.Subject = "ITILstudy: Feedback requested on the ITIL online course"
		'Set the e-mail body format (0=HTML 1=Text)
		objCDOMail.BodyFormat = 0
		'Set the mail format (0=MIME 1=Text)
		objCDOMail.MailFormat = 0
		'Set the main body of the e-mail
		objCDOMail.Body = body
		'Importance of the e-mail (0=Low, 1=Normal, 2=High)
		objCDOMail.Importance = 2
		'Send the e-mail
		objCDOMail.Send
		'Close the server object
		Set objCDOMail = Nothing
		

		   End If
    %>
  </td></tr>
        </table>
<!-- Content End From Here-->
      </div>

<!-- Body Ends -->

		<!--#include virtual="/includes/connectionClose.asp"-->
<!--#include virtual="/includes/footer.html"-->
