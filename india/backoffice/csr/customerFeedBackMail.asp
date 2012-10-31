<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 'Written By : Bharath'
 'Last UpaDated: 12/11/2007'
 'Description :'
 'Purpose : Sending Payment Received Email'
%>
<%
   If Session("UserId")  = "" Then
     Response.Redirect("../login.asp")
   Else
%>
<!--#include virtual="/india/connection.asp"-->
<%
''Declare The Variables
Dim rqCustFeedBackId
Dim rqCustName
Dim rqCustEmailId
Dim rqType
Dim subject
Dim body
Dim StrQuery1,strQuery2
Dim Rs1
Dim todaysDate
Dim objCDOMail
Dim rqBody
Dim rqSubject

set Rs1 = Server.CreateObject("ADODB.Recordset")

'Retirve The CustomerFeedBackId From customerFeedBack.asp Page'

rqCustFeedBackId  =  Request.Form("feedbackid")

'Retrive The Types for Example preview and sendmails With in this page'

rqType = Request.QueryString("type")

'Sql Query For Retive the Firstname, Lastname and Emailid'

strQuery1 = "SELECT custname,custemail,query from ITIL_custfeedback WHERE feedbackid = '" & rqCustFeedBackId & "'"

Rs.Open strQuery1,Conn

Do Until Rs.EOF

  Session("CustName") = Rs("custname")
  Session("CustEmailId") = Rs("custemail")
  Session("CustQuery") = Rs("query")

Rs.Movenext
Loop  

	          ' body="<font face='Arial' size=2>Dear "& Session("FirstName") &"&nbsp;"& Session("LastName") &" ,<BR><BR>Greetings to PMP Classroom Training Program participant from pmstudy.com/India<BR><BR>We acknowledge with thanks receipt of your cheque -------------- dated ----------- towards the course fee for PMP classroom training program to be held on "& Session("sstartDate")&" <BR><BR>We look forward to the pleasure of having you as our (pmstudy.com) valued participant at the program. <BR><BR>Best Regards,<BR>Anju Arambam<BR>Edusys Services Pvt Limited<BR># 224, 16th Cross, 23rd Main,<BR>JP Nagar 5th Phase, Bangalore - 560078<BR>Ph  : 91-80-41721315 / 41721347<BR>Cell: 91-97406 00727</font>"

               body="<font face='Arial' size=2>Dear "& Session("CustName") &" ,<BR><BR>Thank you for your constructive feedback to pmstudy.com <BR><BR><B>Here are the answers to your questions:</B><BR><B>Your question: "& Session("CustQuery") &"</B><BR>Answer: -----------------------------------<BR><BR>Best Regards,<BR>Customer Support<BR>Edusys Services Pvt Limited<BR># 224, 16th Cross, 23rd Main,<BR>JP Nagar 5th Phase, Bangalore - 560078<BR>Ph  : 91-80-41721315 / 41721347<BR>Cell: 91-97406 00727</font>"


If rqType = "preview" then
	
'Retrive The EnrollUserId,subject and body from this Page'

   rqCustFeedBackId  =  Request.Form("feedBackId")
   body    = Request.form("QueryReply")

End If

'Send Email'

if rqType = "sendmail" Then

'Retrive The enrolluserid from this page'   

rqCustFeedBackId  =  Request.Form("feedBackId")
rqBody    =  Request.Form("body")

	If InStr(1, rqbody, "'", 1) Then
	   rqbody = Replace(rqbody,"'","""" )
	end if

	'Sql Query For If You Send Email I am entering into database 1 for in courses.asp Page we want display a message "Check received email sent"'

    strQuery2 = "Update ITIL_custfeedback Set reply = '"& rqBody &"',replyby = '"& Session("UserId") &"',replydate = '"& now() &"' where feedbackid = '" & rqCustFeedBackId & "'"
	
    Rs1.Open strQuery2,Conn


    'Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'
'	objCDOMail.From = "pmstudy.com < edusysindia@gmail.com >"
'
'	objCDOMail.To =  " <" & Session("CustEmailId") & ">"
'	objCDOMail.cc = "t_satpathy@yahoo.com"
'	objCDOMail.BCC = "edusysindia@gmail.com"
'	'Importance of the e-mail (0=Low, 1=Normal, 2=High)
'	objCDOMail.Importance = 2
'
'	objCDOMail.Subject = "Re: Feedback from pmstudy.com"
'
'	objCDOMail.BodyFormat = 0
'
'	objCDOMail.MailFormat = 0
'
'	objCDOMail.Body = rqBody
'
'	objCDOMail.Importance = 2
'
'	objCDOMail.Send
'
'	Set objCDOMail = Nothing

    Response.write("Successfully send mail")
	
	Response.Redirect("customerFeedBack.asp")

Else

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Customer Feed Back Mail</title>
<link href="../../css/pagestyle.css" rel="stylesheet" type="text/css" />
</head>

<body><div id="htMap">
<table border="1" height="550" cellspacing="0" class="dbborder" width="950px">
 <tr>
   <td colspan="3" height="35"><div align="center"><strong>WELCOME TO ITILSTUDY BACKOFFICE OPERATIONS</strong></div></td>
 </tr>
 <tr>
  <td width="100px" valign="top" rowspan="22">
    <!--#include file="leftMenu.html"-->
  </td>
 </tr>
 <tr height="490">
  <td valign="top">
  <table width="700" height="580" border="1" cellpadding="0" cellspacing="0">
 <tr>
    <td width="547" valign="top"><table width="100%" cellspacing="0" cellpadding="2">
    <form id="form1" name="form1" method="post" action="customerFeedBackMail.asp?type=preview">
	<input type="hidden" name="feedBackId" value="<%= rqCustFeedBackId %>" />
      <tr>
        <td colspan="2" bgcolor="#00B0EC">Customer FeedBack Reply </td>
        </tr>
      <tr class="rowEven">
        <td width="28%">To : </td>
        <td width="72%"><% = Session("CustName") %> < <% = Session("CustEmailId") %> ></td>
      </tr>
      <tr class="rowOdd">
        <td>Subject : </td>
        <td>Re: Feedback from ITILstudy.com</td>
      </tr>
  <tr class="rowEven">
        <td colspan="2">
          <textarea name="QueryReply" cols="90" rows="25"><%= body %></textarea>
               </td>
      </tr>
      <tr class="rowEven">
        <td>&nbsp;</td>
        <td>       </td>
      </tr>
      <tr class="rowOdd">
        <td colspan="2" align="center">
          <input name="Submit" type="submit" class="buttonm" value="Preview" /></td>
        </tr>
        </form>
<form  method="post" action="customerFeedBackMail.asp?type=sendmail">
<input type="hidden" name="body" value="<%= body %>" />
<input type="hidden" name="feedBackId" value="<%= rqCustFeedBackId %>" />

      <tr class="rowEven">
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr class="rowEven">
        <td colspan="2" bgcolor="#00B0EC">Send Mail </td>
      </tr>
      <tr class="rowEven">
        <td>&nbsp;</td>
        <td>       </td>
      </tr>
      <tr class="rowOdd">
        <td colspan="2" align="center">
          <input type="submit" class="buttonm" name="sendmail" value="Send Mail" />
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
</td>
</tr>
</table>
</div>
</body>
</html>
<%	End If
End If
%>