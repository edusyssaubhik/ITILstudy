<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 'Written By : Bharath'
 'Last UpaDated: 09/10/2007'
 'Description :'
 'Purpose : Add/Edit/Delete Locations DataBase'
%>
<% If not  Session("UserId") = "" Then %>
<!--#include virtual="/india/connection.asp"-->
<%
 'Declare The Variables'

 Dim strQuery
 Dim strQuery1
 Dim add
 Dim rqCity
 Dim cityId
 Dim rqLocation
 Dim edit
 Dim rqUpdateCity
 Dim rqUpdateLocationId
 Dim strQuery2
 Dim rqLocationDelete
 Dim strQuery3
 Dim Rs1,Rs2
 Dim Location
 Dim rqUpdateLocation
 Dim City

 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs2 = Server.CreateObject("ADODB.Recordset")

'==================================================='
'Retrive From location.asp Page User Clicks Add Location Or Edit Location'
'==================================================='

 add = Request.Form("addloc")
 edit = Request.Form("editloc")
 rqCity = Request.Form("city")

'Retriving The cityid from ps_city table because this cityid insert into location table'

strQuery = "SELECT cityid FROM ITIL_city where country = '"& session("country") &"' and city = '" & rqCity & "'"

Rs.Open strQuery,Conn

do until Rs.EOF
  cityId = Rs("cityid")
Rs.Movenext
Loop


'==================================================='
'If User Clicks Add Location and Add City and Location We Insert Here'
'strQuery1 For Searching User Entered City and Location Already Existing Or Not'
'If Location already Existed Then Display One Message in location.asp Page "You Already Added This Location"'
'If you haven't That Location it Will Insert Into DataBase
'==================================================='

If add = "Add Location" Then

  rqCity = Request.Form("city")
  rqLocation = Request.Form("location")

  strQuery1 = "SELECT city,location FROM ITIL_location WHERE country = '"& session("country") &"' and city = '" & rqCity & "' and location = '" & rqLocation &"'"

  Rs1.Open strQuery1,Conn

  If (not Rs1.BOF) and (not Rs1.EOF) Then

     Location = Rs1("location")
     City     = Rs1("city")

   If rqlocation = Location Then

     Session("message") = "This Location Is Already Added"
     Response.Redirect("location.asp")

   End if

  Else

    strQuery2 = "INSERT INTO ITIL_location (city,location,cityid,country) values ('"& rqCity & "','" & rqlocation & "','" & cityId & "','"& session("country") &"')"

    Rs2.Open strQuery2,Conn

    Session("message") = "You Have Successfully Added Location"
    Response.Redirect("location.asp")

 End If

End If

'==================================================='
'If You Click Edit In location.asp Page In That Page You can Edit That Location and Insert Here'
'Print One Message In location.asp Page "Your Have Successfully Edited Location"'
'==================================================='

If edit = "Edit Location" Then

 rqUpdateCity = Request.Form("city")
 rqUpdateLocation = Request.Form("updateLocation")
 rqUpdateLocationId = Request.Form("updateLocationId")

 strQuery1 = "UPDATE ITIL_location SET country = '"& session("country") &"', city = '" & rqUpdateCity & "',location = '" & rqUpdateLocation & "',cityid = '" & cityId & "'  Where locationid = '" & rqUpdateLocationId & "'"

 Rs1.Open strQuery1,Conn

 Session("message") = "You Have Successfully Edited Location"
 Response.Redirect("location.asp")

Else

'==================================================='
'If User Click Delete That Particular Location In location.asp Page That Location Will be Deleted Here'
'Print One Message in location.asp Page '
'==================================================='

 rqLocationDelete = Request.Querystring("deleteLocation")

 strQuery3 = "DELETE FROM ITIL_location WHERE locationid = '" & rqLocationDelete & "'"

 Rs1.Open strQuery3,Conn

 Session("message") = "You Have Successfully Deleted Location"
 Response.Redirect("location.asp")

End If
%>
<%
   Rs.Close
   Set Rs = Nothing
   Rs1.Close
   Set Rs1 = Nothing
   Rs3.Close
   Set Rs3 = Nothing
   Conn.Close
   Set Conn = Nothing
   Else
   Response.Redirect("../login.asp")
   End If
%>