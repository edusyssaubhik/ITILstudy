<%@ Language = "VBScript" %>
<%
'======================================================='
'Written By : Bharath'
'Created Date : 17/02/2012'
'Modified By : Bharath'
'Modified Date : 17/02/2012'
'Description :'
'Purpose : Sending Exam Result'
 '======================================================='
%>
<%
   If Session("UserId")  = "" Then
     Response.Redirect("/India/backoffice/login.asp")
   Else
%>
<!--#include virtual="/India/connection_global.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->

<%
''Declare The Variables
Dim rqEnrollUserId
Dim rqFirstName,Address
Dim rqLastName,courseDetails
Dim rqType,Course
Dim subject
Dim body
Dim rqTempNo
Dim StrQuery1,strQuery2
Dim FirstName
Dim LastName
Dim EmailId
Dim rqEnrollEmailId
Dim CourseDate,str,startDate,i,sstartDate
Dim Rs1
Dim todaysDate
Dim rqEmail,rqPhoneNumber,rqNameOfEmployeer,rqCourseDetails,dtax,coursePrice
Dim Total,Date2,rqCourse
Dim str1,str2,Price,rqSendEmail,City,rqCity

set Rs = Server.CreateObject("ADODB.Recordset")
set Rs1 = Server.CreateObject("ADODB.Recordset")
set Rs2 = Server.CreateObject("ADODB.Recordset")
Set Rs3 = Server.CreateObject("ADODB.Recordset")

'Retirve The EnrolledUSerId From Courses.asp Page'

rqEnrollUserId  =  Request.Querystring("enrollUserId")
rqCourse = request.QueryString("course")
Session("course") = rqCourse
'Currency Format Display Functions'

 Currency_Format_Front = CurrencyFormat_Front(Session("Country"))

 Currency_Format_Back = CurrencyFormat_Back(Session("Country"))
					 
'Sql Query For Retive the Firstname, Lastname and Emailid'

strQuery = "SELECT id,firstname,lastname,email,nameofemployeer,coursedetails,coursedate,phoneno,jobtitle,street,city,state1,postalCode,country,Foundation,Practitioner from prince2_enrolledusers WHERE id = '" & rqEnrollUserId & "'"
Rs.Open strQuery,ConnObj

Do Until Rs.EOF

 Session("ID") = Rs("id")
 Session("FirstName") = Rs("firstname")
 Session("Lastname")  = Rs("lastname")
 Session("EmailId")   = Trim(Rs("email"))
 Session("NameOfEmployer")   = Rs("nameofemployeer")
  Course   = Rs("coursedetails")
  Session("CourseDate") = Rs("coursedate")
 Session("PhoneNo")   = Rs("phoneno")
 Session("street")   = Rs("street")
 Session("city")   = Rs("city")
 Session("state1") = Rs("state1")
 Session("postalCode") = Rs("postalCode")
 Session("country") = Rs("country")
 Session("jobtitle") = Rs("jobtitle")
 Session("Foundation") = Rs("Foundation")
 Session("Practitioner") = Rs("Practitioner")
 
 Address = Session("street")&"<br>"&Session("city")&"<br>"&Session("postalCode")&"<br>"&Session("state1")&"<br>"&Session("country")
 

courseDetails = Split(Course," ")

Session("Coursedetails") = courseDetails(0)

Rs.Movenext
Loop

Rs.Close


rqType = Request.QueryString("type")


 subject="PMstudy PRINCE2 Exam Result"

 body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span>" 
                        IF Session("country") = "India" then
						body= body &"<span><img src=""http://www.PMstudy.com/images/banners/PRINCE2_email_headerIN.jpg"" alt=""PMstudy"" /></span>"
						ElseIF Session("country") = "United Kingdom" then
						body= body &"<span><img src=""http://www.PMstudy.com/images/banners/PRINCE2_email_headerUK.jpg"" alt=""PMstudy"" /></span>"
						ElseIF Session("country") = "Australia"   then
						body= body &"<span><img src=""http://www.PMstudy.com/images/banners/email_headerAUS.jpg"" alt=""PMstudy"" /></span>"
						Else
                       body= body & "<span><img src=""http://www.PMstudy.com/images/banners/PRINCE2_email_header.jpg"" alt=""PMstudy"" /></span>" 
                        End If
						
						body= body &"</td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""4"" cellspacing=""4"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "&Session("FirstName")&" "&Session("Lastname")&","
						
						IF (Session("Foundation") >= "35" And Session("course") = "Foundation") OR (Session("Practitioner") >= "59" And Session("course") = "Practitioner") Then
						 body = body & "<tr><td align=""left"" colspan=""2"" align=""center""><br>Congratulations from <a href=""http://www.PMstudy.com/"" target=""_blank"">PMstudy.com!</a></td></tr>"
  body = body & "<tr><td align=""left"" colspan=""2"" align=""center"">We are pleased to inform that you have passed the PRINCE2<sup>&reg;</sup> "&Session("course")&" exam conducted on ----------- in -----------.You answered" 
  If Session("course") = "Foundation" Then
   body = body & " "&Session("Foundation")&" out of 70"
   ElseIf Session("course") = "Practitioner"  Then
    body = body & " "&Session("Practitioner")&" out of 108"
   End If
    body = body & " questions correctly.<br><br>Your PRINCE2<sup>&reg;</sup> "&Session("course")&"  certificate is under process and you would be informed as soon as it is shipped to you.<br></td></tr>"
  body = body & "<tr><td align=""left"" colspan=""2"">As per our records, your mailing address is : <br><br><div align=""left"">"&Address&"</div></td></tr>"
  body = body & "<tr><td align=""left"" colspan=""2"">Kindly confirm your mailing address and contact number so that we could ship you the certificates.</td></tr>"
  
  body = body & "<tr><td align=""left"" colspan=""2"">We hope you enjoyed your experience with PMstudy.com. If you liked our course structure and methodology, you can refer your friends for PMstudy PRINCE2 classroom courses.<br><br>Click on the button to ""Refer Friend"".<br><br></td></tr>"  
  body = body & "<tr><td align=""left"" colspan=""2""><form name=""referFriend"" action=""http://www.PMstudy.com/insertReferFrnd.asp""  method=""post""><input type=""hidden"" name=""refEmailID"" value="&Session("EmailId")&"><input type=""hidden"" name=""refName"" value="&Session("FirstName")&">Friend`s Email:  <input type=""text"" name=""frndEmailID1"">&nbsp; &nbsp; Name(optional):  <input type=""text"" name=""frndName1""><br /><br>  Friend`s Email:  <input type=""text"" name=""frndEmailID2"">  &nbsp; &nbsp; Name(optional):  <input type=""text"" name=""frndName2"">  <br /><br>  Friend`s Email:  <input type=""text"" name=""frndEmailID3""> &nbsp; &nbsp;  Name(optional):  <input type=""text"" name=""frndName3""><br /><br /><div align=""center""><input type=""submit"" value=""Refer Friend"" /></div></form></td></tr>"  
  IF Session("country") = "India" Then
   body = body & "<tr><td align=""left"" colspan=""2"">If you have any queries contact us at adminsupport@pmstudy.com or +91 80 41557547.</td></tr>" 
						ElseIf Session("country")="United Kingdom" Then 
   body = body & "<tr><td align=""left"" colspan=""2"">If you have any queries contact us at adminsupport@pmstudy.com or +44(0) 8000 337 947.</td></tr>" 
						ElseIf Session("country")="Australia" Then 
   body = body & "<tr><td align=""left"" colspan=""2"">If you have any queries contact us at adminsupport@pmstudy.com or +61 2 8896 4313.</td></tr>" 
				ElseIf Session("country")="Other" or Session("CountryOrigin") = "Hong Kong" OR  Session("CountryOrigin") = "Singapore" OR  Session("CountryOrigin") = "UAE" Then
   body = body & "<tr><td align=""left"" colspan=""2"">If you have any queries contact us at adminsupport@pmstudy.com.</td></tr>" 
						End if
   
   ElseIF  (Session("Foundation") < "35" And Session("course") = "Foundation")  OR (Session("Practitioner") < "59" And Session("course") = "Practitioner") Then
   
   	  IF Session("country") =  "United Kingdom" OR  Session("country") =  "Australia" or Session("CountryOrigin") = "Hong Kong" OR  Session("CountryOrigin") = "Singapore" OR  Session("CountryOrigin") = "UAE" Then

    body = body & "<tr><td align=""left"" colspan=""2"" align=""center"">We are sorry to inform you that you did not pass the PRINCE2 "&Session("course")&" exam conducted on ------- in ---------- You answered"
	else
	    body = body & "<tr><td align=""left"" colspan=""2"" align=""center"">We are sorry to inform that you could not clear the PRINCE2<sup>&reg;</sup>"&Session("Coursedetails")&" exam conducted on "&Session("CourseDate")&". You answered"
		
    End IF
	
	 IF  Session("course") = "Foundation"  Then
	 
	      IF Session("country") =  "United Kingdom" OR  Session("country") =  "Australia" or Session("CountryOrigin") = "Hong Kong" OR  Session("CountryOrigin") = "Singapore" OR  Session("CountryOrigin") = "UAE" Then
	      body = body &" "&Session("Foundation")&" out of 70 questions correctly.</td></tr>"
		  Else
		  body = body &" "&Session("Foundation")&" out of 70 questions correctly, whereas the required passing marks were 35 out of 70.</td></tr>"
		  End If

	 ELseIf Session("course") = "Practitioner"  Then
	 
	    IF Session("country") =  "United Kingdom" OR  Session("country") =  "Australia" or Session("CountryOrigin") = "Hong Kong" OR  Session("CountryOrigin") = "Singapore" OR  Session("CountryOrigin") = "UAE" Then
	      body = body &" "&Session("Practitioner")&" out of 108 questions correctly.</td></tr>"
		  body = body & "<tr><td align=""left"" colspan=""2"" align=""center""><br>Your PRINCE2<sup>&reg;</sup> Foundation certificate is under process and you would be informed as soon as it is shipped to you.<br><br>As per our records, your mailing address is :<br><br><div align=""left"">"&Address&"</div><br><br>Kindly confirm your mailing address and contact number so that we could ship you the certificates.</td></tr>"
		  else
		   body = body &" "&Session("Practitioner")&" out of 108 questions correctly, whereas the required passing marks were 59 out of 108.</td></tr>"
		   body = body & "<tr><td align=""left"" colspan=""2"" align=""center""><br>Your PRINCE2<sup>&reg;</sup> Foundation certificate is under process and you would be informed as soon as it is shipped to you.<br><br>As per our records, your mailing address is :<br><br><div align=""left"">"&Address&"</div><br><br>Kindly confirm your mailing address and contact number so that we could ship you the certificates.</td></tr>"
		   End If
		   
	 End IF
	 
	 IF Session("country") =  "United Kingdom" OR  Session("country") =  "Australia" or Session("CountryOrigin") = "Hong Kong" OR  Session("CountryOrigin") = "Singapore" OR  Session("CountryOrigin") = "UAE" Then
	 
  body = body & "<tr><td align=""left"" colspan=""2"" align=""center""><br>PMstudy offers an Exam Retake Guarantee for those delegates who do not pass their PRINCE2 exams on the first attempt after attending PMstudy's PRINCE2 Classroom training. To know more please visit.  <a href=""http://www.PMstudy.com/PRINCE2-Training/examRetakeGuarantee.asp"" target=""_blank"">(http://www.PMstudy.com/PRINCE2-Training/examRetakeGuarantee.asp)</a>.<br><br></td></tr>"
  body = body & "<tr><td align=""left"" colspan=""2"">We recommend that you go over all the course material that was provided to you by PMstudy and spend at least 3 hours of concentrated study on the subject each day. Please ensure that you cover all the Themes, Principles and Processes more thoroughly. When you decide to retake the exam you can do so during our classroom programs.</td></tr>"  
  body = body & "<tr><td align=""left"" colspan=""2"">If you do require any additional guidance we can always connect you with one of instructors who will be able to clear your doubts.</td></tr>"  
  body = body & "<tr><td align=""left"" colspan=""2"">We wish you all the best for the PRINCE2 exam </td></tr>"  
   body = body & "<tr><td align=""left"" colspan=""2"">If you have any queries contact us at adminsupport@pmstudy.com or 0800 0337 947.</td></tr>" 
   
  Else
  
  body = body & "<tr><td align=""left"" colspan=""2"">We recommend that you go through over all the course material that was provided to you by PMstudy and spend at least 3 hours of concentrated study on the subject each day. Please ensure that you cover all the Themes, Principles and Processes more thoroughly.</td></tr>"
 
   body = body & "<tr><td align=""left"" colspan=""2"">If you have any queries contact us at adminsupport@pmstudy.com or +91 80 41557547.</td></tr>"
   
   End If
   
   End If

  body = body & "<tr><td colspan=""3""><br><font face=""Arial"" size=2><b>Best Regards,</b></td></tr>"
   
  body = body & "<tr><td colspan=""3""><font face=""Arial"" size=2>Customer Support<br><a href=""http://www.PMstudy.com"" target=""_blank"">www.PMstudy.com</a><br />Email: <a href=""mailto: adminsupport@pmstudy.com"">adminsupport@pmstudy.com</a><br /><br/><hr><div align=""center""><font size=""1px"">PRINCE2<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.<br>The Swirl logoT is a trade mark of the Cabinet Office.</font></div></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"
  	   
If rqType = "preview" then
	
'Retrive The EnrollUserId,subject and body from this Page'

   rqEnrollUserId = Request.Form("enrollUserId")
   subject = Request.form("subject")
   body    = Request.form("QueryReply")

End If

'Send Email'

if rqType = "sendmail" Then

   Dim objCDOMail
   Dim rqBody
   Dim rqSubject

'Retrive The enrolluserid from this page'  
 
   rqEnrollUserId = Request.Form("enrolluserid")
   rqCity = Request.Form("city")
   rqBody    =  Request.Form("body")
   rqSubject =  "PMstudy PRINCE2 Exam Result"
   rqSendEmail = Request.Form("emailid")
   
 

	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")

	objCDOMail.From = "marketing@pmstudy.com"

	objCDOMail.To =  rqSendEmail
	
	'If Session("country") is India then cc send to salesindia@pmstudy.com otherwise send to marketing@pmstudy.com'
	
	objCDOMail.Cc = "marketing@pmstudy.com"

	
	objCDOMail.Bcc = "t_satpathy@yahoo.com" 
	
	'Importance of the e-mail (0=Low, 1=Normal, 2=High)
	
	objCDOMail.Importance = 2
	
	objCDOMail.Subject = rqSubject

	objCDOMail.BodyFormat = 0

	objCDOMail.MailFormat = 0

	objCDOMail.Body = rqBody

	objCDOMail.Send

	Set objCDOMail = Nothing
	
'Sql Query For If You Send Email I am entering into database 1 for in courses.asp Page we want display a message "Check received email sent"'

    strQuery2 = "Update prince2_enrolledusers Set checkrecmailsent = '1' where  id = '" & rqEnrollUserId & "'"
	
    Rs2.Open strQuery2,ConnObj
	
    Response.write("Successfully send mail")
    
	
Else


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PMstudy PRINCE2 Exam Result</title>
<link href="./css/pagestyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="htMap">
  <table width="700" height="580" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#00B0EC" class="dbborder" >
    <tr>
      <td width="547" valign="top"><table width="100%" cellspacing="0" cellpadding="2">
          <form id="form1" name="form1" method="post" action="PRINCE2-ExamResult.asp?type=preview">
            <input type="hidden" name="enrollUserId" value="<%= rqEnrollUserId %>" />
            <input type="hidden" name="city" value="<%= City %>" />
            
            <tr>
              <td colspan="2" bgcolor="#00B0EC">Send Exam Result </td>
            </tr>
            <tr class="rowEven">
              <td width="28%">To : </td>
              <td width="72%"><% = Session("FirstName") %>
                &nbsp;
                <% = Session("LastName") %>
                <
                <% = Session("EmailId") %>
                <%= rqSendEmail %>
                ></td>
            </tr>
            <tr class="rowOdd">
              <td>Subject : </td>
              <td> PMstudy PRINCE2 Exam Result</td>
            </tr>
            <tr class="rowEven">
              <td colspan="2"><textarea name="QueryReply" cols="90" rows="25"><%= body %></textarea>
              </td>
            </tr>
            <tr class="rowEven">
              <td>&nbsp;</td>
              <td></td>
            </tr>
            <tr class="rowOdd">
              <td colspan="2" align="center"><input name="Submit" type="submit" class="buttonc" value="Preview" /></td>
            </tr>
          </form>
          <form  method="post" action="PRINCE2-ExamResult.asp?type=sendmail">
            <input type="hidden" name="body" value='<%= body %>' />
            <input type="hidden" name="enrolluserid" value="<%= rqEnrollUserId %>" />
            <input type="hidden" name="emailid" value="<%= Session("EmailId") %>" />
            <input type="hidden" name="city" value="<%= rqCity %>" />
            <tr class="rowEven">
              <td colspan="2">&nbsp;</td>
            </tr>
            <tr class="rowEven">
              <td colspan="2" bgcolor="#00B0EC">Send Mail </td>
            </tr>
            <tr class="rowEven">
              <td>&nbsp;</td>
              <td></td>
            </tr>
            <tr class="rowOdd">
              <td colspan="2" align="center"><input type="submit" class="buttonc" name="sendmail" value="Send Mail" />
              </td>
            </tr>
          </form>
          <tr class="rowEven">
            <td colspan="2">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <% if rqType = "preview" Then %>
    <tr>
      <td colspan="3"><%Response.write(subject & "<br/><br/>")
				Response.write(body)%></td>
    </tr>
    <% End If %>
  </table>
</div>
</body>
</html>
<%	End If
End If
%>
