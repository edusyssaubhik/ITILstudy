<!--#include virtual="/includes/headermeta.asp"-->
<!--#include virtual="/includes/classroombanner.html"-->
<!--#include virtual="/includes/connection.asp"-->



<!-- body section starts here------------------------------------------------------------------------------------------------------------->
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
      <table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="25%" >&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; Call back form</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
            

<h1 class="Header"> Response Call Back</h1>

                 

                  <% 
				  
				 Dim RqCourse,Rqname,rqPhoneno,rqLocation,rqQues,rqConvenient_Time
				 
				 
				  rqType  = Request.Form("type")
				'  RqCourse = Request.Form("course")
				  Rqname = Replace(Request.Form("Name"),"'","''")
				  rqPhoneno = Request.Form("Phoneno")
				  rqLocation = Request.Form("Location")
				  rqQues = Replace(Request.Form("Ques"),"'","''")
				 rqConvenient_Time = Request.Form("Convenient_Time")
				  
' ----------------------------------------------------------------------------------
'	 Inserting details of complaint log
' ----------------------------------------------------------------------------------
	    
   		'If rqType = "Submit" Then
   
		   strQuery = "INSERT INTO callback (Name, PhoneNo, location,Convenient_Time, enteredDate,query,country)"
		   strQuery = strQuery & " values "
		   strQuery = strQuery & "('" & Rqname & "',"
		   strQuery = strQuery & "' " & rqPhoneno & " ',"
		   strQuery = strQuery & "'" & rqLocation & "',"
		   strQuery = strQuery & "'" & rqConvenient_Time & "',"
		   strQuery = strQuery & "'" & now() & "',"
		  ' strQuery = strQuery & "'" & RqCourse & "',"
		   strQuery = strQuery & "'" & rqQues & "',"
		   strQuery = strQuery & "'" & Session("CountryOrigin") & "')"
	'Response.write(strQuery)

		   ConnObj.Execute strQuery
		   
		 
				  
				  
				 ' If RqCourse = "" then
'				  
'				  Response.Redirect("/callBack.asp")
'				  
'				  End If
'		
		
		
		strText = "Dear "&Rqname&",<BR><BR>Thank you for your query to ITILstudy.com, We will be answering back to your queries very soon. <BR><BR>For more queries, please email us at adminsupport@itilstudy.com."		                
%>
	
		
		<br>
        
        <% Response.Write(strText)
				  
  ' Pop_up code will comes here '
 
body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF"">" 
						
						body= body & "<span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" /></span>" 
						
						body= body &"</td></tr><tr><td colspan=""2"" width=""540px""><table border=""0"" width=""520px"" align=""center""><tr height=""30px""><td><font face=""Arial"" size=2>Hi,<BR><BR>We got the following information from student for call back.<BR><BR>Name: "&Rqname&"<BR><BR>Phone Number: "&rqPhoneno&"<BR><BR>Location: "&rqLocation&"<BR><BR>Convenient time to receive a call back: "&rqConvenient_Time&"<BR><BR>query: "&rqQues&"<BR><BR>Entered Date: "&now()&"<BR><BR>Country: "&Session("CountryOrigin")&"<br><br> Please do the needful.<BR><BR>Best Regards, <BR>Customer Support<br>www.ITILstudy.com<BR>Email: adminsupport@itilstudy.com</font></td></tr></table></td></tr></table></td></tr></table>"

'Response.Write(body)

Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
objCDOMail.From = "adminsupport@itilstudy.com"
objCDOMail.To =  "adminsupport@itilstudy.com"
objCDOMail.Cc = "marketing@itilstudy.com"
objCDOMail.Importance = 2
objCDOMail.Subject = ""& Rqname & " :Call Back."
objCDOMail.BodyFormat = 0
objCDOMail.MailFormat = 0
objCDOMail.Body =  body
objCDOMail.Send
Set objCDOMail = Nothing




' ENd If 	
   %>
                          
  
       </td>
    </tr>
    </table>
     </td>
    </tr>
    </table>
                     
                              
           
<!-- body section ends here -------------------------------------------------------------------------------------------------------------------->
<!--#include virtual="/includes/footer.html"-->

