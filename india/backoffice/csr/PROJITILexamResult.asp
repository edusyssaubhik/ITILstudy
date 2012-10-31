<%@ Language = "VBScript" %>
<%' OPTION EXPLICIT %>
<%
 'Written By : savita'
 'Last UpaDated: 20/10/2011'
 'Description :'
 'Purpose : Sending Exam Result'
%>
<%
   If Session("UserId")  = "" Then
     Response.Redirect("../login.asp")
   Else
%>
<!--#include virtual ="/india/connection-PROJ.asp"-->
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
Dim str1,str2,Price,rqSendEmail,City,rqCity,examdate

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

strQuery = "SELECT id,firstname,lastname,email,nameofemployeer,coursedetails,coursedate,phoneno,address,country,courseType,Marks from PROJITIL_enrolledusers WHERE id = '" & rqEnrollUserId & "'"
Rs.Open strQuery,Conn

Do Until Rs.EOF

 Session("ID") = Rs("id")
 Session("FirstName") = Rs("firstname")
 Session("Lastname")  = Rs("lastname")
 Session("EmailId")   = Trim(Rs("email"))
 Session("NameOfEmployer")   = Rs("nameofemployeer")
  Course   = Rs("coursedetails")
  Session("CourseDate") = Rs("coursedate")
 Session("PhoneNo")   = Rs("phoneno")
 Session("address")   = Rs("address")

 Session("country") = Rs("country")
 Session("courseType") = Rs("courseType")
 Session("Marks") = Rs("Marks")
 
 'Address = Session("street")&"<br>"&Session("city")&"<br>"&Session("postalCode")&"<br>"&Session("state1")&"<br>"&Session("country")
 
'response.write(Session("CourseDate"))
courseDetails = Split(Course," :")
courseDetails1 = courseDetails(0)
coursedate = Session("CourseDate")

examdate = split(coursedate," to ")
examdate1 = examdate(1)

'Session("Coursedetails") = courseDetails(0)

'Session("CourseDate") = courseDetails(13)&" "&courseDetails(14)&" "&courseDetails(15)
'Session("location") = courseDetails()

'response.Write(courseDetails(2))
'response.Write("c")
'response.Write(courseDetails(4))
'response.Write("d")
'response.Write(courseDetails(5))
'response.Write("e")
'response.Write(courseDetails(6))
' response.Write("f")
' response.Write(courseDetails(7))
' response.Write("g")
'response.Write(courseDetails(8))
' response.Write("h")
'response.Write(courseDetails(9))
' response.Write("i")
' response.Write(courseDetails(10))
' response.Write("j")
' response.Write(courseDetails(11))
' response.Write("k")
' response.Write(courseDetails(12))
 'response.Write("l")
 'response.Write(courseDetails(13))
 'response.Write("m")
 'response.Write(courseDetails(14))
 'response.Write("n")
 'response.Write(courseDetails(15))
' response.Write("o")
' response.Write(courseDetails(16))
' response.Write("p")
' response.Write(courseDetails(17))
' response.Write("q")
' response.Write(courseDetails(18))
 'response.Write(Course)

Rs.Movenext
Loop

Rs.Close


rqType = Request.QueryString("type")


 subject="PROJstudy ITIL Foundation Exam Result"

 body = "<table width=""100%"" border=""0"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span>" 
                     
                       body= body & "<span><img src=""http://www.PROJstudy.com/images/banners/email_headerUK.jpg"" alt=""PROJstudy"" /></span>" 
                      
						
						body= body &"</td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""4"" cellspacing=""4"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "&Session("FirstName")&" "&Session("Lastname")&","
						
						IF (Session("Marks") >= "26" And (Session("courseType") = "Foundation" OR Session("courseType") = "Suite"))Then
						
						 body = body & "<tr><td align=""left"" colspan=""2"" align=""center""><br>Congratulations from <a href=""http://www.PROJstudy.com/"" target=""_blank"">PROJstudy.com!</a></td></tr>"
  body = body & "<tr><td align=""left"" colspan=""2"" align=""center"">We are pleased to inform that you have passed the PROJstudy ITIL<sup>&reg;</sup> "&Session("courseType")&" exam conducted on "&examdate1&" in "&courseDetails1&".You answered" 
   body = body & " "&Session("Marks")&" out of 40"

   body = body & " questions correctly.<br><br>Your PROJstudy ITIL<sup>&reg;</sup> "&Session("courseType")&"  certificate is under process and you would be informed as soon as it is shipped to you.<br></td></tr>"
   If session("address") <> "" Then
  body = body & "<tr><td align=""left"" colspan=""2"">As per our records, your mailing address is : <br><br><div align=""left"">"&Session("address")&"</div></td></tr>"
   End If
  body = body & "<tr><td align=""left"" colspan=""2"">Kindly confirm your mailing address and contact number so that we could ship you the certificates, as and when we receive it from APMG.</td></tr>"
 
  
  body = body & "<tr><td align=""left"" colspan=""2"">We hope you enjoyed your experience with PROJstudy ITIL classroom course. </td></tr>"  
  

   body = body & "<tr><td align=""left"" colspan=""2"">If you have any queries contact us at itilinfo@projstudy.com.</td></tr>" 
					
   
   ElseIF  (Session("Marks") < "26" And (Session("courseType") = "Foundation" OR Session("courseType") = "Suite"))  Then
   
   
	    body = body & "<tr><td align=""left"" colspan=""2"" align=""center"">We are sorry to inform that you could not clear the PROJstudy ITIL<sup>&reg;</sup>"&Session("courseType")&" exam conducted on "&examdate1&" in "&courseDetails1&". You answered"
		

	
	 IF  (Session("courseType") = "Foundation" OR Session("courseType") = "Suite")  Then
	 
	    
		  body = body &" "&Session("Marks")&" out of 40 questions correctly, whereas the required passing marks were 26 out of 40.</td></tr>"
	
		   
	 End IF
	 
	 
  
  body = body & "<tr><td align=""left"" colspan=""2"">We recommend that you go through over all the course material that was provided to you by PROJstudy ITIL and spend at least 3 hours of concentrated study on the subject each day. Please ensure that you cover all the Themes, Principles and Processes more thoroughly. When you decide to retake the exam you can do so during our classroom programs.</td></tr>"
 
   body = body & "<tr><td align=""left"" colspan=""2"">If you have any queries contact us at itilinfo@projstudy.com</td></tr>"
   
   End If
   
   End If

  body = body & "<tr><td colspan=""3""><br><font face=""Arial"" size=2><b>Best Regards,</b></td></tr>"
   
  body = body & "<tr><td colspan=""3""><font face=""Arial"" size=2>Customer Support<br><a href=""http://www.PROJstudy.com"" target=""_blank"">www.PROJstudy.com</a><br />Email: <a href=""mailto: itilinfo@projstudy.com"">itilinfo@projstudy.com</a><br /><br/><hr><div align=""center""><font size=""1px"">The Swirl logo™ is a trade mark of the Cabinet Office.<br />ITIL<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.</font></div></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"
  
 ' Response.Write(body)
  	   
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
   rqSubject =  "ITILstudy ITIL Exam Result"
   rqSendEmail = Request.Form("emailid")
   
 

	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")

	objCDOMail.From = "itilinfo@projstudy.com"

	objCDOMail.To =  rqSendEmail
	
	'If Session("country") is India then cc send to salesindia@pmstudy.com otherwise send to marketing@pmstudy.com'
	
	objCDOMail.Cc = "itilinfo@projstudy.com"

	
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

    strQuery2 = "Update PROJITIL_enrolledusers Set checkrecmailsent = '1' where  id = '" & rqEnrollUserId & "'"
	
    Rs2.Open strQuery2,Conn
	
    Response.write("Successfully send mail")
    
	
Else


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ITILstudy ITIL Exam Result</title>
<link href="./css/pagestyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="htMap">
  <table width="700" height="580" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#00B0EC" class="dbborder" >
    <tr>
      <td width="547" valign="top"><table width="100%" cellspacing="0" cellpadding="2">
          <form id="form1" name="form1" method="post" action="PROJITILexamResult.asp?type=preview">
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
              <td>PROJstudy ITIL Exam Result</td>
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
          <form  method="post" action="PROJITILexamResult.asp?type=sendmail">
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
'End If
%>
