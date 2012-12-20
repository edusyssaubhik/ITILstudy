<!--#include virtual="/includes/connection.asp"-->
<% 
    Dim Country ,objRs, Query , fromDate ,todate
     
    Set objRs = Server.CreateObject("ADODB.Recordset")
    Set objRsComment = Server.CreateObject("ADODB.Recordset")

    'country = Session("CRM_Country")
    fromDate =  formatdatetime(now() - 2 , 2)
    todate =formatdatetime(now()-1 ,2)
    strBody = ""
    strBody = "<html><body><table width=""100%"" border=""0"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""80%"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF"" align=""center""><span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""10"">Hello,<br><br>&nbsp;&nbsp;&nbsp;Call Report for the date <b>"&formatdatetime(fromdate,1)&"</b></td></tr><tr><td colspan=""2""><table border=""1"" cellspacing=""0"" cellpadding=""5"" style=""width:100%""><tr><th>Sl NO</th><th>Country</th><th>State</th><th>Caller For</th><th>Caller Name</th><th>Question</th><th>Added Date</th><th>Comments</th><th>Status</th><th>Status2</th></tr>"

   Query = "SELECT callid,callfor, callername, phoneno, emailid, callerstate, question, addeddate,call_status1, call_status2, Country FROM  ITIL_callsreceived_new WHERE addeddate BETWEEN '"&fromDate&"' AND '"&todate&"' And call_status1 <>'4' order By addeddate asc"
'response.Write(Query)
objRs.Open Query, ConnObj

callcounter = 1

If Not objRs.EOF Then


Do Until objRs.EOF
 
    CallID  = objRs("callid")
	CallFor = objRs("callfor")
	CallerName = objRs("callername")
	PhoneNo = objRs("phoneno")
	EmailID = objRs("emailid")
	CallerState = objRs("callerstate")
	Question = objRs("question")
	AddedDate = objRs("addeddate")
	callStatus1 = objRs("call_status1")
	callStatus2 = objRs("call_status2")
    country = objRs("Country")
If callStatus1 = "1" Then
		RqStatus = "call to be made"
ElseIf callStatus1 = "2" Then
        RqStatus = "call to be followed"	
ElseIf callStatus1 = "3" Then
        RqStatus = "Closed call"	
ElseIf callStatus1 = "4" Then
        RqStatus = "Free Enrollment"	
End If

strBody = strBody &"<tr align=""center""><td valign=""top"">&nbsp;"& callcounter &"</td><td valign=""top"">&nbsp;"&country&"</td><td valign=""top"">&nbsp;"& CallerState &"</td><td valign=""top"">&nbsp;"& CallFor &"</td><td valign=""top"">&nbsp;"& CallerName &"</td><td valign=""top"">&nbsp;"& Question&"</td><td valign=""top"">&nbsp;"& AddedDate&"</td><td valign=""top"" width=""500px"">&nbsp;"


'Sql Query For Retrive The comments For That EnrolledUser'
strQuery = "SELECT f_comment,comm_addedby,comm_date FROM fac_comments_new WHERE callid = '"&CallID&"'  Order by f_cid desc"
'response.Write(strQuery)
objRsComment.Open strQuery,ConnObj
If Not objRsComment.EOF Then
   items = objRsComment.getrows
   numrows = Ubound(items,2)
   firstrow = 0
   lastrow = numrows
 End If
 
If IsArray(items) Then

	For rowcounter = firstrow to lastrow
	allitems = items(0,rowcounter)
	allitems1 = items(1,rowcounter)
	allitems2 = items(2,rowcounter)

	strBody = strBody & "<div style=""text-align:left;"">"& allitems & "<br> added by " & allitems1 & "<br>" & allitems2 & "<br><br></div>"

	
	Next
End If  

    objRsComment.Close  
    strBody = strBody & "</td><td valign=""top"">&nbsp;"&RqStatus&"</td><td valign=""top"">&nbsp;"&callStatus2&"</td></tr>"



callcounter = callcounter + 1
objRs.Movenext
Loop
    else
       strBody = strBody & " No details found for the date "& formatdatetime(fromdate,2) 
    end If
strBody = strBody &"</table></td></tr><tr><td><br><br>Best Regards,<br>ITILstudy Team<br><a href=""http://www.itilstudy.com"">www.ITILstudy.com</a></td></tr></table></body></html>"
    response.write strBody

        Set objCDOMailsend = Server.CreateObject("CDONTS.NewMail")
		objCDOMailsend.From = "edusysmadhava@gmail.com"
		objCDOMailsend.To = "edusysbharath@gmail.com"
        objCDOMailsend.cc="edusysmadhava@gmail.com"
		objCDOMailsend.Subject = "ITILstudy - Call report on "& Formatdatetime(fromDate,2)
		objCDOMailsend.BodyFormat = 0
		objCDOMailsend.MailFormat = 0
		objCDOMailsend.Body = strBody
		objCDOMailsend.Importance = 2
		objCDOMailsend.Send
		Set objCDOMailsend = Nothing
		
     %>