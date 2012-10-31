<%@ LANGUAGE="VBScript"%>
<% OPTION EXPLICIT %>
<% 
   If Session("UserId")  = "" Then
     Response.Redirect("../login.asp")
   Else
%>

<%
'======================================================='
 'Written By : Mahima'
 'Last UpaDated: 22/11/2011'
 'Description :'
 'Purpose : Feedback form from the students'
'======================================================='
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>FeedBack Mail</title>
</head>

<body>

<!--#include virtual="/india/connection.asp"-->
<%'code to send a mail to faculty if average rating is less than 8.5 

Dim strQuery,strQuery1,Rs1,Rs2,Courseid1,mailSent1,body,Courseid

Set Rs2 = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")

Courseid1 = Request.QueryString("courseid")

'query to retrive values
strQuery ="SELECT Courseid,mailSent from ITIL_feedbackMail where Courseid ='"&Courseid1&"'"

 Rs2.Open strQuery,Conn	
If Not Rs2.EOF Then
Courseid = Rs2("Courseid")
End If
If Courseid = "" Then

  body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span></td></tr>"
  body = body & "<tr><td><table align=""center"" border=""0"" width=""580px"">"
  body = body & "<tr><td align=""right"" colspan=""2""></td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Hi,</font></td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2""><p>The average of the feedback forms from </p></font></td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2""> <b>City :</b>"&Session("rscity")&" </font></td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2""><b>Date :</b>"&Session("rsstartDate")&" to "&Session("rsendDate")&"</font></td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2""><b>Instructor:</b> "&Session("rsInstructor")&"</font></td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2""> is below 8.5 and it needs to be reported.</font></td></tr>"
   
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2""><p>Average rating of the class:"&Session("AverageRating")&"</p></font></td></tr>"

   
  body = body & "<tr><td colspan=""3""><br><font face=""Arial"" size=2><b>Best Regards,</b></td></tr>"
  
  body = body & "<tr><td colspan=""3""><br><font face=""Arial"" size=2>Customer Support"
  body = body & "<br><font face=""Arial"" size=2><a href=""http://www.ITILstudy.com/"">www.ITILstudy.com</a>"
  

  
  body = body & "<br><font face=""Arial"" size=2>Email: <a href=""mailto:marketing@ITILstudy.com""/>marketing@ITILstudy.com</a></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"
'Response.write(body)
  
  Dim objCDOMail
'Holds the CDONTS NewMail Object
'Create the e-mail server object
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'Who the e-mail is from
objCDOMail.From = "adminsupport@ITILstudy.com"
'Who the e-mail is sent to
objCDOMail.To = "edusysbharath@gmail.com, edusyskavitha@gmail.com"
'Who the CC are sent to
'objCDOMail.Bcc = "edusysbharath@gmail.com"
'Who the blind copies are sent to
'objCDOMail.Cc = "edusysbharath@gmail.com"
'Who the e-mail reply-to
objCDOMail.Value("Reply-To") = "edusysbharath@gmail.com"
'Set the subject of the e-mail
objCDOMail.Subject = "Feedback Report"
'Set the e-mail body format (0=HTML 1=Text)
objCDOMail.BodyFormat = 0
'Set the mail format (0=MIME 1=Text)
objCDOMail.MailFormat = 0
'Set the main body of the e-mail
objCDOMail.Body = ""&body&""
'Importance of the e-mail (0=Low, 1=Normal, 2=High)
objCDOMail.Importance = 2
'Send the e-mail
objCDOMail.Send
'Close the server object
Set objCDOMail = Nothing

strQuery1 = "Insert INTO  ITIL_feedbackMail ( MailSent,courseid ) values ('1', '"&Courseid1&"')"
Rs1.Open strQuery1,Conn
Session("message") = "You Have Successfully Sent Mail To Faculty"
Response.Redirect("feedback-form.asp?courseId="&Courseid1)
Else
Session("message") = "You Have already sent a mail"
Response.Redirect("feedback-form.asp?courseId="&Courseid1)
End If 


 
  %>
</body>
</html>
<% End If%>

