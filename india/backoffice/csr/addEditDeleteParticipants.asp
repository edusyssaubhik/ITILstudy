<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
 'Written By : Bharath'
 'Last UpaDated: 01/11/2007'
 'Description :'
 'Purpose : Add/Edit/Delete Participants Into Database'
'======================================================='
%>
<% If not  Session("UserId") = "" Then %>
<!--#include virtual="/india/connection.asp"-->
<%
'======================================================='
 'Declare The Variables'
'======================================================='
Dim Sql
Dim rqParticipantName,rqCompanyName,rqAddParticipant,rqEditParticipant
Dim rqID,rqParID,rqType

rqParticipantName =  Request.Form("participantname")
rqCompanyName     =  Request.Form("companyname")
rqAddParticipant  =  Request.Form("addParticipant")
rqEditParticipant =  Request.Form("eidtParticipant")
rqID = Request.Form("ID")
rqParID = Request.Form("parID")
rqType = Request.QueryString("type")

If rqAddParticipant = "Add Participant" Then 
   
   Sql = "INSERT INTO ITIL_participants (name,company,sessionid)"
   Sql = Sql & " VALUES "
   Sql = Sql & "('" & rqParticipantName & "',"
   Sql = Sql & "'" & rqCompanyName & "',"
   Sql = Sql & "'" & rqID & "')"
   
   Rs.Open Sql,Conn
 
   Response.Redirect("addParticipants.asp?type=view/edit&ID="&rqID)
End If

If rqEditParticipant = "Edit Participant" Then
   
   Sql = "UPDATE ITIL_participants SET"
   Sql = Sql & " name = '" & rqParticipantName &"',"
   Sql = Sql & " company = '" & rqCompanyName &"'"
   Sql = Sql & " WHERE id = '" & rqParID  & "'"
   
   Rs.Open Sql,Conn
   
   Response.Redirect("addParticipants.asp?type=view/edit&ID="&rqID)
   
End If

If rqType = "delete" Then
   
   rqParID =  Request.QueryString("parID")
   rqID    =  Request.QueryString("ID")
   
   Sql = "DELETE FROM ITIL_participants WHERE id = '" & rqParID &"'"
   
   Rs.Open Sql,Conn
   
   Response.Redirect("addParticipants.asp?type=view/edit&ID="&rqID)
   
End If

 Rs.Close
 Set Rs = Nothing
 Conn.Close
 Set Conn = Nothing
 Else
 Response.Redirect("../login.asp")
 End If

%>