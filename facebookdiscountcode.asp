<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<!--#include virtual="/includes/Connection.asp"-->
<%  


Dim rqType,rqName,rqEmailId,rqPhoneNo,objRs,strQuery1,objRs1

rqType = Request.Form("details")
rqName = Request.Form("Name")
rqEmailId = Request.Form("EMailID")
rqPhoneNo = Request.Form("PhoneNo")

message = Session("message")
Session("message") = ""
Set objRs = server.CreateObject("ADODB.Recordset")
Set objRs1 = server.CreateObject("ADODB.Recordset")

strQuery = "SELECT TOP 1 * FROM facebookDiscounts Order by Id desc"
'response.Write(strQuery)
objRs.Open strQuery, ConnObj

rqDiscountCode = Trim(objRs("discountCode"))

%>
<style type="text/css">
.button{

background-image:url("http://www.ITILstudy.com/images/back/submit_button.png");
background-repeat:no-repeat;
height:30px;
width:78px;
border:none;
cursor:pointer;
margin-left:140px;


}
.postbutton{

background-image:url("http://www.ITILstudy.com/images/back/facebookreturnbutton.png");
background-repeat:no-repeat;
height:24px;
width:107px;
border:none;
cursor:pointer;


}
</style>
<script type="text/javascript">
					<!--
					//Validating The Email

					function echeck(str) {

							var str1 = str.value
							var at="@"
							var dot="."
							var lat=str1.indexOf(at)
							var lstr=str1.length
							var ldot=str1.indexOf(dot)
							if (str1.indexOf(at)==-1){
							   alert("Invalid E-mail ID")
							   return false
							}

							if (str1.indexOf(at)==-1 || str1.indexOf(at)==0 || str1.indexOf(at)==lstr){
							   alert("Invalid E-mail ID")
							   return false
							}

							if (str1.indexOf(dot)==-1 || str1.indexOf(dot)==0 || str1.indexOf(dot)==lstr){
								alert("Invalid E-mail ID")
								return false
							}

							if (str1.indexOf(at,(lat+1))!=-1){
								alert("Invalid E-mail ID")
								return false
							}

							if (str1.substring(lat-1,lat)==dot || str1.substring(lat+1,lat+2)==dot){
								alert("Invalid E-mail ID")
								return false
							}

							if (str1.indexOf(dot,(lat+2))==-1){
								alert("Invalid E-mail ID")
								return false
							}

							if (str1.indexOf(" ")!=-1){
								alert("Invalid E-mail ID")
								return false
							}
							
							if (str1.indexOf(",")!=-1){
								alert("Invalid E-mail ID")
								return false
							}								

							return true
						}

					function validate_required(field,alerttxt)
					{
						with (field)
						{
							if (field.value=="")
							  {alert(alerttxt);return false}
							else {return true}
						}
					}



					function validate_form(thisform)
					{
						with (thisform)
						{

						// Check The First Name Field Empty Or Not

						if (validate_required(Name,"Please Enter Your Name")==false)
							  {Name.focus();return false}

						// Check The EMail Field Empty Or not

						if (validate_required(EMailID,"Please Enter Your EmailId")==false)
							  {EMailID.focus();return false}

						// Check The Eamil Validation

						if (echeck(EMailID)==false)
							  {EMailID.focus();return false}

					
						}
					}


					-->
					</script>

</head>
<body>
<% If rqType = "" then %>

<form method="post" action="facebookdiscountcode.asp" onsubmit="return validate_form(this)">
 <table style="font-family:calibri; font-size:16px;" cellpadding="8" width="70%">
  
    <tr>
      <td align="right"><b>Name:</b></td>
      <td><input type="text" name="Name" size="20"></td>
    </tr>
    <tr>
      <td align="right"><b>Email ID:</b></td>
      <td><input type="text" name="EMailID" size="20"></td>
    </tr>
    <tr>
   
      <td colspan="2">
      <input type="hidden" name="details" value="yes" />
          <input type="submit" name="type"  value="" class="button"></td>
    </tr>
  <tr style="height:10px;">
  <td colspan="2"></td>
  </tr>
   
  </table>
</form>


<% Else %>

<%

Dim sIPAddress, objHtp, strQuery11

sIPAddress = Request.ServerVariables("HTTP_X_FORWARDED_FOR")

If sIPAddress="" Then sIPAddress = Request.ServerVariables("REMOTE_ADDR")

	strQuery11 = "http://geoip.maxmind.com/b?l=4tAUhyTgUD6d" & _
		"&i=" & sipaddress
	set objHtp = Server.CreateObject("Msxml2.ServerXMLHTTP")
	objHtp.open "GET", strQuery11, false
	objHtp.send
	sipAddress = sipAddress + ";" + objHtp.ResponseText 

'Here we can write inser query for inserting values given by the User'

strQuery1 = "Insert Into FacebookLike (Name,Email,IP_Address,Date) Values "
  
  		strQuery1= strQuery1& "('" & rqName & "',"
		strQuery1= strQuery1& "'" & rqEmailId & "',"
		strQuery1= strQuery1& "'" & sIPAddress & "',"
		strQuery1= strQuery1& "'" & Now() &"')"
		
 objRs1.Open strQuery1,ConnObj
 
 
 body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.ITILstudy.com/images/banners/email-header.jpg"" alt=""ITILstudy"" /></span><br></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "&rqName&" ,<br><br>Thank you for connecting with us on Facebook. Please use the following code to avail discounts:<br><br>Code - <b>"&rqDiscountCode&"</b> <br><br>For enrolment in ITILstudy classroom programs - <a href=""http://www.ITILstudy.com/dates_location.asp"" target=_blank"">click here</a><br><br>For enrolment in ITILstudy Online programs - <a href=""http://www.ITILstudy.com/enroll.asp"" target=_blank"">click here</a><br><br>Stay in touch with us on <a href=""http://www.facebook.com/ITILstudy"" target=_blank"">facebook</a><br><br>Best Regards,<br><br>Customer Support,<br><a href=""http://www.ITILstudy.com"">www.ITILstudy.com</a><br>Email: <a href=""adminsupport@ITILstudy.com"">adminsupport@ITILstudy.com</a></font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"
		
		'Response.Write(body)
 
 
 
 'Holds the CDONTS NewMail Object
		'Create the e-mail server object
		Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
		'Who the e-mail is from
		objCDOMail.From = "marketing@itilstudy.com"
		'Who the e-mail is sent to
		objCDOMail.To = rqEmailId
		
		objCDOMail.cc = "marketing@itilstudy.com"
		'Set the subject of the e-mail
		objCDOMail.Subject = "Congratulations - ITILstudy Discount Code"
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
%>


<table style="font-family:calibri;" cellpadding="5" width="70%">
     <tr>
    <td align="center">Use your discount code<br /> have been sent to your email address </td>
    </tr>
    <tr>
      <td align="center">Enroll now! ITILstudy Foundation<br /> Classroom Training  <a href="http://www.itilstudy.com/ITIL-Courses.asp"" target=_blank">click here</a></td>
    </tr>
   <tr>
   <td align="center">
   <form action="http://www.facebook.com/ITILstudy/app_128953167177144" target="_blank" >
      <input type="hidden" name="details" value="yes" />
          <input type="submit" name="type"  value="" class="postbutton"></form></td>
          </tr>
     
  
  </table>



<% End If %>

</body>
</html>
