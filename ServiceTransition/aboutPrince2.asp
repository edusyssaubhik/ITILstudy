<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/innerwhyusbanner.html"-->
<!--#include virtual="/metatags/aboutPrince2_metatag.html"-->
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; FREE RESOURCES &raquo; About PRINCE2, OGC, APMG  </td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="margin-top:-12px; width:97%;">
                <!-- Content Start From Here-->
                <p class="Header">About PRINCE2 </p>
                <p >What is PRINCE2?</p>
                <p>PRINCE2(PRojects IN Controlled Environments) is a process-based method for effective project management.</p>
                <a href="http://www.prince-officialsite.com/" target="_blank">PRINCE2</a> is a de facto standard used extensively by the UK Government. It is widely recognised and used in the private sector in UK and other countries.
                <p>The PRINCE2 method is in the public domain, offering non-proprietary best practice guidance on project management. PRINCE2 is a registered trademark of OGC.</p>
                <p class="Header">PRINCE2 History</p>
                <p>PRINCE2 is derived from an earlier method called PROMPTII, and from project management method PRINCE, which was developed in 1989 by the Central Computer and Telecommunications Agency (CCTA) as a UK Government standard for information systems (IT) project management; however, it soon came to be regularly applied outside the purely IT environment. PRINCE2 was published in 1996, having been contributed to by a consortium of some 150 European organisations.<br />
                  PRINCE2 has become increasingly popular and is now a de facto standard for project management in the UK. Its use has spread beyond the UK to more than 50 other countries.
                  The current revision was released in 2009.</p>
                <p class="Header">PRINCE2 Advantage</p>
                <ul>
                  <li>PRINCE2 is a structured approach to project management.</li>
                  <li>It provides a method for managing projects within a clearly defined framework.</li>
                  <li>PRINCE2 describes procedures to coordinate people and activities in a project, design and supervise the project, and suggests alternatives if the project doesn't develop as planned.</li>
                  <li>In this method, each process is specified with its key inputs and outputs and lays down activities to be carried out to achieve these outputs. </li>
                  <li>PRINCE2 method enables efficient control of resources through its principle of 'management by stages'.</li>
                  <li>The PRINCE2 project can be carried out in a controlled and organised way.</li>
                  <li>PRINCE2, being a structured method that is widely recognised and understood, provides a common language for all the participants in the project.</li>
                  <li>The various management roles and responsibilities involved in a PRINCE2 project are clearly defined and are adaptable to suit the complexity of the project and the organisational environment.</li>
                </ul>
                <p class="Header">About OGC</p>
                <p>The Office of Government Commerce owns PRINCE2. It endeavours to ensure that Managing Successful Projects with PRINCE2(2009) remains a true reflection of current and future trends in the international field of project management best practice, and to produce guidance with lasting value. The OGC can be contacted at:</p>
               
                The Office of Government Commerce <br>
                Rosebery Court <br>
                St Andrews Business Park <br>
                Norwich NR7 0HS <br>
                Help Desk: 0845 000 4999 <br>
                General Tel: 01603 622 211 <br>
                Fax: 01603 704 817 <br>
                Email: servicedesk@ogc.gsi.gov.uk <br>
                Web: www.ogc.gov.uk <br>
                <p class="Header">About APM Group</p>
                <p> The APM Group is a leading accreditation, certification and qualification organization recognised internationally by government agencies. APMG has a worldwide presence, with offices in the UK, the Netherlands, India, Australia, China, Germany, Denmark and the US.<br>
                  Being the governing body for PRINCE2 worldwide, they look after accreditation, exams and licensing of PRINCE2.
               <br><br>
                Telephone: +44 (0)1494 452 450 or visit their Web site at <a href="http://www.apmgroup.co.uk/" target="_blank">www.apmgroup.co.uk.</a></p>
                <p class="Header">About TSO</p>
                The Stationery Office owns the copyright to the PRINCE2 Manual and other supporting documents. They can be contacted at <a href="http://www.tso.co.uk/" target="_blank">www.tso.co.uk.</a>
                <!-- Content End From Here-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
  
    <% 
	dim str
'Instantiate an ADO Recordset object.
Set rsQues1 = Server.CreateObject("ADODB.Recordset")

dateoffeedback=Date()-1
rsQues1.ActiveConnection = ConnObj
rsQues1.Open "SELECT datesent from feedbacksent where datesent='"&dateoffeedback&"'"
If rsQues1.EOF Then

'Application("scrollbar")="<a href=""/pmp-exam-success.asp"" target=_blank> 4500+ SUCCESS STORIES IN 2009, 2005, 2006</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""./companies.htm"" target=_blank> Employees of 122 companies enrolled in PMstudy.com</a>"

todaydate=Date()-1
Dim objCDOMail
Set rsQues = Server.CreateObject("ADODB.Recordset")
rsQues.ActiveConnection = ConnObj
rsQues.Open "select item_name, first_name, last_name, payer_email, date_valid, address_owner from PaypalDB where date_valid='"&todaydate&"'"
'rsQues.Open "select item_name, first_name, last_name, payer_email, date_valid from PaypalDB where payer_email='edusyspriyanka@gmail.com'"

If Not rsQues.BOF Then
Do While Not rsQues.EOF 
payer_email=rsQues("payer_email") 
first_name=rsQues("first_name")
last_name=rsQues("last_name")
item_name=rsQues("item_name")
address_owner=rsQues("address_owner")

name=first_name&" "&last_name


IF(InStr(address_owner,"IN")>0) Then
classroomstr = "PROJstudy.com is the Most Economical and Most Effective Accredited Training Organisation (ATO) for PRINCE2 Certification. With a high success rate in PRINCE2 exams, PROJstudy.com classroom trainings are rated very high by our past students. If you want to learn more about the benefits of our PRINCE2 classroom course, then follow the link: <a href=""http://projstudy.com/whyus/courseBenefits.asp"">http://projstudy.com/whyus/courseBenefits.asp</a><Br><br><b>Course details:</b>Our PRINCE2 Foundation and Practitioner (combined) classroom programmes are of 5 days. You can also enrol for 3-day Foundation or 2-day Practitioner classroom course.<br><br>For information about the course content, visit <a href=""http://www.projstudy.com/course-syllabus.asp"">http://www.projstudy.com/course-syllabus.asp.</a><BR><BR>To know more about PROJstudy PRINCE2 classroom course locations and dates, visit <a href=""http://www.projstudy.com/dates_location.asp"">http://www.projstudy.com/dates_location.asp</a><BR><BR>"
ELSE
IF(InStr(address_owner,"Uinited Kingdom")>0) Then
classroomstr = "PROJstudy.com is the Most Economical and Most Effective Accredited Training Organisation (ATO) for PRINCE2 Certification. With a high success rate in PRINCE2 exams, PROJstudy.com classroom trainings are rated very high by our past students. If you want to learn more about the benefits of our PRINCE2 classroom course, then follow the link: <a href=""http://projstudy.com/whyus/courseBenefits.asp"">http://projstudy.com/whyus/courseBenefits.asp</a><Br><br><b>Course details:</b> Our PRINCE2 Foundation and Practitioner (combined) classroom programmes are of 5 days. You can also enrol for 3-day Foundation or 2-day Practitioner classroom course.<br><br>Our courses are priced very economically. The usual course fee for 5-day Foundation and Practitioner Training is &#163;649. An Early Bird Discount of &#163;50 is provided to students who enrol at least 15 days before the program begins.<br><br>For information about the course content, visit <a href=""http://www.projstudy.com/course-syllabus.asp"">http://www.projstudy.com/course-syllabus.asp.</a><BR><BR>To know more about PROJstudy PRINCE2 classroom course locations and dates, visit <a href=""http://www.projstudy.com/dates_location.asp"">http://www.projstudy.com/dates_location.asp</a><BR><BR>"
'classroomstr = ""

END IF
END IF


'Holds the CDONTS NewMail Object
'Create the e-mail server object
Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'Who the e-mail is from
objCDOMail.From = "adminsupport@projstudy.com"
'Who the e-mail is sent to
objCDOMail.To = ""&payer_email&""
'objCDOMail.To = "edusyspriyanka@gmail.com, edusyspritam@gmail.com, edusysbharath@gmail.com"
'Who the blind copies are sent to
objCDOMail.Bcc = "edusys02@gmail.com"
'Set the subject of the e-mail
objCDOMail.Subject = ""&first_name&" "&last_name&" - More Freebies from PROJstudy.com on providing feedback about course : "&item_name&""
'Set the e-mail body format (0=HTML 1=Text)
objCDOMail.BodyFormat = 0
'Set the mail format (0=MIME 1=Text)
objCDOMail.MailFormat = 0
'Set the main body of the e-mail
objCDOMail.Body  = "<table width=""100%"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td width=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""595"" bgcolor=""#FFFFFF""><span><img src=""http://www.PROJstudy.com/images/banners/email_header.jpg"" alt=""PROJstudy"" width=""600"" height=""103"" /></span></td></tr><tr><td align=""center"" colspan=""2"" width=""560px""><table border=""0"" align=""center"" width=""560px""><tr><td><p align=""left""><font face=""Arial, Helvetica, sans-serif"" size=""2"">Dear "&first_name&" "&last_name&" <BR><BR> Greetings from PROJstudy.com! You recently completed the PROJstudy.com course:"&item_name&"<BR><BR>"&classroomstr&" We request you to please provide us your feedback for the course you had taken with us. Other than helping us improve our study material, your feedback might make you eligible for receiving other courses for free. As part of a promotion, we are giving out free courses to some students who provide feedback to us in PROJstudy.com. Courses for PROJstudy.com and its affiliates include:<BR><UL><LI>PRINCE2 Foundation & Practitioner Online courses(www.projstudy.com/PRINCE2-Online-Courses.asp)</LI><LI>PMP/CAPM preparation courses and 40 PDU courses(www.PMstudy.com/enroll.asp)</LI><LI>Six Sigma Black Belt Certification Course offering 55 PMI PDUs and Six Sigma Green Belt Certification Course offering 25 PMI PDUs(www.6sigmastudy.com)</LI><LI>Program Management Certification course offering 25 PMI PDUs (www.PROGstudy.com)</LI><LI>Human Resource Development Certification course offering 20 PMI PDUs (www.HRDstudy.com)</LI></UL> <BR><BR>Please enter your feedback here: <BR><BR><form method=""post"" action=""http://www.PROJstudy.com/insertQuery.asp""><input type=""hidden"" name=""Name"" value="&name&"><input type=""hidden"" name=""email"" value="&payer_email&"><BR><BR><textarea name=""complaint"" rows=""8"" cols=""40""></textarea><BR><p><input type=""Submit"" name=""type"" value=""Submit""></form></P><BR><BR>We hope you will enjoy your experience with PROJstudy.com. For queries, please email us at adminsupport@projstudy.com : we always look forward to your feedback and suggestions.<BR><BR>Best Regards, <BR>www.PROJstudy.com<BR>Email: adminsupport@projstudy.com<br /></font></p></td></tr></table></td></tr></table></td></tr><tr><td width=""45px"">&nbsp;</td></tr></table>"
'Importance of the e-mail (0=Low, 1=Normal, 2=High)
objCDOMail.Importance = 2
'Send the e-mail
objCDOMail.Send
'Close the server object
Set objCDOMail = Nothing	


'response.Write(str)

rsQues.MoveNext
		Loop%>
  <%
ConnObj.Execute "Insert into feedbacksent(datesent) values('"&todaydate&"')" 
set rsQues=Nothing
else
end if
else
end if


ConnObj.Close
set ConnObj = Nothing
set rsQues1=Nothing%>
  
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
