<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%' option explicit %>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 21/09/2010'
'Description :'
'This Page is for inserting Complaint '
'======================================================='
' This page validates the user email id and inserts the contact details in to cat_paypaldb and course details in to proformainvoice tables and redirects the user for login.
%>
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
	Dim complaintType, subject, complaint, todayDate, strQuery
	Dim Email, FirstName, LastName,CustomerName, RollNo, courseType,courses1
	
	
' ----------------------------------------------------------------------------------
'	 declaration
' ----------------------------------------------------------------------------------
 
        complaintType    =     request.Form("queryType")
		courses1          =     request.Form("course")
		courseType       =     request.Form("courseType")
		subject          =     request.Form("subject")
		complaint        =     Replace(Request.Form("complaint"),"'","''")
        rqType           =     request.Form("type")
		'Email            =     request.Form("email")
		
        Name             =      Request.Form("Name")

		
		FirstName        =     request.Form("FirstName")
		LastName         =     request.Form("LastName")
		
	   If  request.Form("email") <> "" Then
		'If coming from feedback from contact us and also from more freebies email feedback form'
		    Email = request.Form("email")
			
		Else
		'If coming from query page after logged into online course'
		    Email = Session("PayerEmail")	
				
		End If
 
      
      'formatting date
	   todayDate = (YEAR(now()) & "-" & (Month(now())) & "-" & (DAY(now()))) 
	   
	   'Name from automatic send mail from aboutPRINCE2 page
	   If  Name <> "" Then
		    CustomerName = Name
		Else
		    'Concatenating name	
		    CustomerName = FirstName&" "&LastName	
		End If
	   
	   
	   
	   'response.Write(CustomerName)
	   
' ----------------------------------------------------------------------------------
'	 Inserting details of complaint log
' ----------------------------------------------------------------------------------
	    
   		If rqType = "Submit" OR rqType = "Senden" Then
   
		   strQuery = "INSERT INTO support_complaint (subject, customername, complaint, department, complaint_status, createdby, createdon, lastupdatedon, courseType,country)"
		   strQuery = strQuery & " values "
		   strQuery = strQuery & "('" & subject & "',"
		   strQuery = strQuery & "' " & CustomerName & " ',"
		   strQuery = strQuery & "'" & complaint & "',"
		   strQuery = strQuery & "'" & complaintType & "',"
		   strQuery = strQuery & "'1',"
		   strQuery = strQuery & "'" & CustomerName & "',"
		   strQuery = strQuery & "'" & todayDate & "',"
		   strQuery = strQuery & "'" & todayDate & "',"
		   'If Session("State") = "verified1" Then
		   strQuery = strQuery & "'ITIL ',"
		  ' Else
		  ' strQuery = strQuery & "'PRINCE2',"
		   'End If
		   strQuery = strQuery & "'" & Session("CountryOrigin") & "')"
	

		   ConnObj.Execute strQuery
		   
		   
		   strQuery1 = "SELECT top 1 complaint_no FROM support_complaint Where country = '" & Session("CountryOrigin") & "' ORDER BY complaint_no DESC"
		   
		   objRs.open strQuery1, ConnObj
		   
		   Do Until objRs.EOF
		   
		   	Complaint_No = objRs("complaint_no")
		   
		   objRs.Movenext
		   Loop
		   objRs.Close
		   
		   %>
		  <div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
    
    <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
    
    <table width="100%" border="0" cellspacing="0" cellpadding="8">
      <tr>
        <td width="2%" class="Header">&nbsp;</td>
        <td width="25%" class="PageTitle">&nbsp;</td>
        <td width="73%" class="PageTitle">Got a Query/ Suggestion - Write to us</td>
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
    
    
		<% 
		If Session("State") = "verified1" OR Session("State") = "verified2" OR Session("State") = "verified3" OR Session("State") = "verified5" OR Session("State") = "verified6" OR Session("State") = "verified7"  Then
			strText = "Dear "&CustomerName&",<BR><BR>Thank you for taking time to write to us.<BR><BR>For more queries, please email us at adminsupport@itilstudy.com."
		   else
	strText = "Dear "&CustomerName&",<BR><BR>Thank you for your query to ITILstudy.com. We will be answering back to your queries very soon. <BR><BR>We hope you are enjoying your experience with ITILstudy.com; if you have any further queries, please email us at adminsupport@ITILstudy.com."		                
	End If  
	
		
		Response.Write(strText)
	   
		   
		    'Email Template'
		body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF"">" 
						body= body &"<span><img src=""http://www.ITILstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" /></span>"
		         
						If Session("State") = "verified1" OR Session("State") = "verified2" OR Session("State") = "verified3" OR Session("State") = "verified5" OR Session("State") = "verified6" OR Session("State") = "verified7"   Then
						body= body &"<br></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "& CustomerName &",<br><br>Thank you for taking time to write to us.<br><br>We have forwarded your query to the Subject Matter experts and our Accredited ITIL trainers. One of them would get back to you within the next 12 hours.<br><br>As per our records, your query related to the chapter," & courses1 & " is,<br>"& complaint&"<br><br>We appreciate your time taken to write to us and assure you that your query would be answered at the earliest. We hope you are enjoying your course with ITILstudy and look forward to hear more from you.<br><br>For any further queries, please do not hesitate to write to us; however we would request you to be patient towards receiving the reply from the faculty and do not re-post the same query again.<br><br>Best Regards,<br>Customer Support<br>ITILstudy<br>A brand of Edusys Services Pvt. Limited</font></td></tr></table></td></tr><tr><td align=""center""><hr>"
						 else
						body= body &"<br></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "& CustomerName &",<br><br>Greetings from ITILstudy!<br><br>Thank you for taking time to write to us. We would like to inform you that your feedback/complaint has been registered. Your reference number is "& Complaint_No &". Please use this number for further correspondence in this regard.<br><br>Best Regards,<br>www.ITILstudy.com<br>Email: marketing@ITILstudy.com</font></td></tr></table></td></tr><BR><B>Feedback from "&CustomerName&":</B><BR>Query Type: "&complaintType&"<BR>Comment: "&complaint&"<BR><BR><tr><td align=""center""><hr>"
						     End If 
						If Session("State") = "verified1" OR Session("State") = "verified2" OR Session("State") = "verified3" OR Session("State") = "verified5" OR Session("State") = "verified6" OR Session("State") = "verified7"  Then 
body= body &" <font size=""1px""><div align=""center"">&copy; 2011 ITILstudy.com Content is based on OGC (ITIL<sup>&reg;</sup>) material.</div></font><br><font size=""1px"">ITIL<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.<br>The Swirl logo™ is a trade mark of the Cabinet Office.</font></td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"&sIPAddress
                           else
body= body &"<font size=""1px"">ITIL<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.<br/>The Swirl logo™ is a trade mark of the Cabinet Office.</font></td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"&sIPAddress
		                End If 
		'Response.Write(body)

		Dim objCDOMail     
		'Holds the CDONTS NewMail Object
		'Create the e-mail server object
		Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
		'If Session("State") = "verified1" Then
		'Who the e-mail is from
		objCDOMail.From =  "marketing@itilstudy.com"
		'Else
		'Who the e-mail is from
		'objCDOMail.From =  "marketing@itilstudy.com"
		'End iF
		
		'Who the e-mail is sent to
		objCDOMail.To = ""&Email&""
		If Session("State") = "verified1" Then
		'bcc
	    objCDOMail.Bcc = "marketing@itilstudy.com,edusyslakshmimg@gmail.com,edusysankits@gmail.com"
		Else
		'bcc
	    objCDOMail.Bcc = "marketing@itilstudy.com"
		End iF
		
		If Session("CountryOrigin") = "Us" Then
		'bcc
	    objCDOMail.Bcc = "marketing@PMstudy.com"
		End If

		If Session("State") = "verified1" OR Session("State") = "verified2" OR Session("State") = "verified3" OR Session("State") = "verified5" OR Session("State") = "verified6" OR Session("State") = "verified7"  Then
	    'Set the subject of the e-mail
		objCDOMail.Subject = "Online course query, Chapter "& courses1
		Else
		'Set the subject of the e-mail
		objCDOMail.Subject = "Automated mail on Query Submission"
		End If
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
		   
' ----------------------------------------------------------------------------------
'	Deleting session variables
' ----------------------------------------------------------------------------------  	   	   
	   	   
		Session("complaintType")	 	=	""			
		Session("subject")		 	    =	""			
		Session("complaint")		    =	""
		
	   
   
		'Response.Redirect("query.asp")   
    %>
  </td></tr>
        </table>
<!-- Content End From Here-->
		<!--#include virtual="/includes/connectionClose.asp"-->
      </div>

<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
