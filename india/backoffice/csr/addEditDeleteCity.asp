<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'==================================================='
 'Written By : Bharath'
 'Last UpaDated: 01/11/2007'
 'Description :'
 'Purpose : Add/Edit/Delete Course Into DataBase'
'==================================================='
%>
<% If not  Session("UserId") = "" Then %>
<!--#include virtual="/india/connection.asp"-->
<%
 'Declare The Variables'

 Dim strQuery
 Dim strQuery1
 Dim rqCountry
 Dim addCity
 Dim rqEditCountry
 Dim rqCity
 Dim rqState
 Dim rqStateCode
 Dim editCity
 Dim rqEditCity
 Dim rqEditCityId
 Dim rqEditState
 Dim rqEditStateCode 
 Dim strQuery2
 Dim rqDelete
 Dim strQuery3
 Dim strQuery4
 Dim strQuery5
 Dim Rs1
 Dim Rs2
 Dim City

 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs2 = Server.CreateObject("ADODB.Recordset")

'==================================================='
'Retrive From city.asp Page User Clicks Add City Or Edit City'
'==================================================='

 addCity = Request.Form("addcity")
 editCity = Request.Form("editcity")
  
'==================================================='
'If User Clicks Add City and Add One City That City We Insert Here'
'strQuery1 For Searching User Entered City Already Existing Or Not'
'If City already Existed Then Display One Message in city.asp Page "You Already Added This City"'
'If you haven't That City it Will Insert Into DataBase
'==================================================='

If addCity= "Add City" Then

  rqCity      =  Request.Form("city")
  rqCountry   =  Request.Form("country")
  rqState     =  Request.Form("state")
  rqStateCode =  Request.Form("state_code")
 
  strQuery1 = "SELECT city FROM ITIL_city WHERE city = '" & rqCity &"' and country = '"& session("country") &"'"

  Rs1.Open strQuery1,Conn

  If (not Rs1.BOF) and (not Rs1.EOF) Then

     City = Rs1("city")

   If rqCity = City Then

     Session("message") = "This City Is Already Added"
     Response.Redirect("city.asp")

  End if
  Else

    strQuery = "INSERT INTO ITIL_city (city,country,state,state_code) values ('"& rqCity & "','"& rqCountry &"','"&rqState&"','"&rqStateCode&"')"

    Rs.Open strQuery,Conn

    Session("message") = "You Have Successfully Added City "  & rqCity
    Response.Redirect("city.asp")

 End If

End If

'==================================================='
'If You Click Edit In city.asp Page In That Page You can Edit That City and Insert Here'
'At The Same Time in Location Table also We Can Edit That particular City'
'Retrive The cityId and Edited City From city.asp Page'
'==================================================='

If editCity = "Edit City" Then

 rqEditCountry   = Request.Form("editedCountry")
 rqEditCity      = Request.Form("editedCity")
 rqEditCityId    = Request.Form("editCityId")
 rqEditState     =  Request.Form("editstate")
 rqEditStateCode =  Request.Form("editstate_code")
  
 strQuery2 = "UPDATE ITIL_city SET country = '"& rqEditCountry &"', city = '" & rqEditCity & "', state = '" & rqEditState & "', state_code = '" & rqEditStateCode & "' Where cityid = '" & rqEditCityId & "'"

 Rs.Open strQuery2,Conn

 strQuery5 = "UPDATE ITIL_location SET country = '"& rqEditCountry &"', city = '" & rqEditCity & "' Where cityid = '" & rqEditCityId & "'"

 Rs1.Open strQuery5,Conn

 Session("message") = "You Have Successfully Edited City "  & rqEditCity
 Response.Redirect("city.asp")

End If

'==================================================='
'If You Click The Delete Button That Particular Delete Here'
'And Display The Message in city.asp Page'
'==================================================='

 rqDelete = Request.Querystring("delete")

If rqDelete <> "" Then

 strQuery3 = "DELETE FROM ITIL_city WHERE cityid = '" & rqDelete & "'"

 Rs.Open strQuery3,Conn

 strQuery4 = "DELETE FROM ITIL_location WHERE cityid = '" & rqDelete & "'"

 Rs2.Open strQuery4,Conn

 Session("message") = "You Have Successfully Deleted City"
 Response.Redirect("city.asp")

End If

 Rs.Close
 Set Rs = Nothing
 Conn.Close
 Set Conn = Nothing
 Else
  Response.Redirect("../login.asp")
 End If
%>