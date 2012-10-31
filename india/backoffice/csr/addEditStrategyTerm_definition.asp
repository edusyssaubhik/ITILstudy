<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 '======================================================='
'Written By : Priyanka'
'Last UpDated : 18/12/2010'
'Description :'
'This Page Is Comes From terms_definition.asp Page'
'======================================================='%
 
%>
<% 
   'If Session("UserId")  = "" Then
'     Response.Redirect("/india/backOffice/login.asp")
'   Else
%>
<!--#include virtual="/india/connection.asp"-->
<%
'-----------------------------------------------------------'
'Insert '
'-----------------------------------------------------------'

'Declare The Variables'
 
 Dim strQuery
 Dim strQuery1
 Dim Rs1
 Dim rqTerm 
 Dim rqDefinition
 Dim rqRefPage
 Dim rqAddedBy
 Dim rqAddedON
 Dim rqTermId   
 Dim rqDelete
 Dim rqType
 Dim rqEditTerm
 DIm rqEditDefinition 
 Dim rqEditRefPage
 Dim rqEditAddedOn 
 Dim rqEditAddedBy  
 Dim rqEditTermId   
 Dim todayDate
 
 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs = Server.CreateObject("ADODB.Recordset")

'Retrive Type From terms_definition.asp Page'

 rqType = Request.Form("Add")

'Retrive All terms Defintion Values From terms_Defintion.asp Page'

 rqTerm              =  Request.Form("term")
 rqDefinition      =  Replace(Request.Form("definition"),"'","''")
 rqTermId            =  Request.Form("id")
 
 'formatting date
 todayDate = (YEAR(now()) & "-" & (Month(now())) & "-" & (DAY(now()))) 

'If You adding new term That Details We Insert Here'


If rqType = "Add" Then


 strQuery = "INSERT INTO StrategyTerm_definition (term,definition,addedby,addedon)"
 strQuery = strQuery & " Values "
 strQuery = strQuery & "('" & rqTerm & "',"
 strQuery = strQuery & "'" & rqDefinition & "',"
 strQuery = strQuery & "'" & Session("UserId") & "',"
 strQuery = strQuery & "'" & todayDate & "')"

 Rs.Open strQuery,Conn

 Session("message") = "You Have Successfully Added Terms"
 Response.Redirect("StrategyTerm_definition.asp")



End If

'Create Term If Condition Closed Here'

'-----------------------------------------------------------'
'Edit Existing Term'
'-----------------------------------------------------------'

'Retrive Type From terms_definition.asp Page'

rqType = Request.Form("editTerms")

 rqEditTerm              =  Request.Form("editterm")
 rqEditDefinition      =  Replace(Request.Form("editdefinition"),"'","''")
 rqEditRefPage           =  Request.Form("editrefpage")
 rqEditAddedOn           =  Request.Form("editaddedby")
 rqEditAddedBy           =  Request.Form("editaddedon")
 
 rqEditTermId            =  Request.Form("editTermId")

'If Type Equals To Update Then Update Query Will Execute'

If rqType = "Update" Then

 strQuery = "UPDATE StrategyTerm_definition SET"
 strQuery = strQuery & " term = '" & rqEditTerm & "',"
 strQuery = strQuery & " definition = '" & rqEditDefinition & "',"
 strQuery = strQuery & " addedby = '" & Session("UserId") & "',"
 strQuery = strQuery & " addedon = '" & todayDate & "'"
 strQuery = strQuery & " WHERE id = '" & rqEditTermId & "'"

 Rs.Open strQuery,Conn

 Session("message") = "You Have Successfully Edited Terms definition"
 Response.Redirect("StrategyTerm_definition.asp")

Else

 rqDelete = Request.Querystring("deleteTermId")

 strQuery1 = "DELETE  FROM StrategyTerm_definition WHERE id = '" & rqDelete & "'"

 Rs.Open strQuery1,Conn

 Session("message") = "Your Successfully Deleted "
 Response.Redirect("StrategyTerm_definition.asp")

Rs.Close
Conn.Close
End If

'Update If Condition Closed Here'

'End If
%>