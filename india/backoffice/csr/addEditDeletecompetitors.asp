<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
   If Session("UserId") = "" Then
     Response.Redirect("/login.asp")
   Else
%>
<%
'======================================================='
 'Written By : Mahima'
 'Last UpaDated: 22/11/2011'
 'Description :'
 'Purpose : Feedback form from the students'
'======================================================='
%>
<!--#include virtual="/india/connection.asp"-->
<% 

Dim Rs1,rqCompetitor,rqType,message,strQuery1,strQuery,rqId,rqDelete,Id,rqCountry


'Create Record set
 Set Rs = Server.CreateObject("ADODB.Recordset")
 Set Rs1 = Server.CreateObject("ADODB.Recordset")

'Retrive Type From Competitor.asp Page'
 rqType = Request.Form("createCompetitor")

If rqType = "Create Competitor" Then
rqCompetitor       =  Request.Form("Competitor")
rqCountry       =  Request.Form("country")

'If You Adding New Competitor, Here We Are checking That Paricular rowcounter Available Or Not'
 strQuery1 = "SELECT Id,Competitor, country FROM ITIL_competitors WHERE Competitor = '" & rqCompetitor & "'"
 RESPONSE.WRITE( strQuery1)
 Rs1.Open strQuery1,Conn
 
 If (Not Rs1.BOF) and (Not Rs1.EOF) Then 
'That Particular Competitor Already Added Then Through One Message To Competitors.asp Page'
   If (rqCompetitor = Rs1("Competitor")) Then
   
     Session("message1") = "This competitors Is Already Added"
	 Response.Redirect("Competitors.asp?type=add")	 
   End If  

'If That Particular Competitor Not Added Then Insert Into DataBase'  
 Else
 strQuery = "INSERT INTO ITIL_competitors(Competitor, country)"
 strQuery = strQuery & " Values "
 strQuery = strQuery & "('" & rqCompetitor & "',"
  strQuery = strQuery & "'" & rqCountry & "')"
 Rs.Open strQuery,Conn
 Session("message1") = "You Have Successfully Added New Competitor"
 Response.Redirect("competitors.asp")
End If

End If


'Editing Competitor
rqType = Request.Form("save")

If rqType = "Save" Then
rqCompetitor       =  Request.Form("Competitor")
rqId               =  Request.Form("Id")
rqCountry      	   =  Request.Form("country")

'Query to upadate After editing Copetitor
strQuery = "UPDATE ITIL_competitors SET"
strQuery = strQuery & " Competitor = '" & rqCompetitor & "',"
strQuery = strQuery & " country = '" & rqCountry & "'"
strQuery = strQuery & " WHERE Id = '" & rqId & "'"
 Rs.Open strQuery,Conn

 Session("message") = "You Have Successfully Edited Competitor"
 Response.Redirect("competitors.asp")

Else


 rqDelete = Request.Querystring("deleteId") 
'Query to delete Copetitor from database
 strQuery1 = "DELETE  FROM ITIL_competitors WHERE Id = '" & rqDelete & "'"
 
 Rs.Open strQuery1,Conn

 Session("message") = "Your Successfully Deleted Competitor"
 Response.Redirect("competitors.asp")

'Rs.Close
'Conn.Close
End If
%>
<% End If%>