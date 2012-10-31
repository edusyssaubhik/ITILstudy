<%@ Language = "VBScript" %>
<%
'======================================================='
'Written By : Mahima'
'Last UpDated : 4/07/2012'
'Description :'
' Add/Edit/Delete Course Page and Enrolledusers Page'

'======================================================='
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
 Dim rqeditid
 Dim strQuery2
 Dim rqDelete
 Dim strQuery3
 Dim strQuery4
 Dim strQuery5
 Dim Rs1
 Dim Rs2
 Dim City
 Dim rqimagename,rqlocationaddress,rqlocation
 Dim rqType, rqHotelName
 
rqType = Request.Form("type")
 Set Rs = Server.CreateObject("ADODB.Recordset")
 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs2 = Server.CreateObject("ADODB.Recordset")

'==================================================='
'Retrive From city.asp Page User Clicks Add City Or Edit City'
'==================================================='

 addLocation = Request.Form("addlocation")

  
'==================================================='
'If User Clicks Add Location and Add One Location That Location We Insert Here'
'strQuery1 For Searching User Entered Location Already Existing Or Not'
'If Location already Existed Then Display One Message in Location.asp Page "You Already Added This Location"'
'If you haven't That Location it Will Insert Into DataBase
'==================================================='

If addLocation= "Add Location" Then

  rqLocation      =  Request.Form("Location")
  'rqCountry       =  "United Kingdom"
  'rqhotelName      =  Session("hotelName") 
  rqHotelName      =   Request.Form("hotelName") 
  rqImageName     =  Request.Form("imgName")
  rqLocAdd        =  Request.Form("locationAddress")
 

    strQuery = "INSERT INTO ITIL_Courselocations values ('"& rqLocation & "','"& rqImageName &"','"&rqLocAdd&"','"&Session("country")&"', '"&rqHotelName&"')"
    Rs.Open strQuery,Conn

    Session("message") = "You Have Successfully Added Location "  & rqLocation
    Response.Redirect("courselocations.asp?")

End If

'==================================================='
'If You Click Edit In city.asp Page In That Page You can Edit That City and Insert Here'
'At The Same Time in Location Table also We Can Edit That particular City'
'Retrive The cityId and Edited City From city.asp Page'
'==================================================='
 
If rqType = "Edit City" Then


 rqeditid                = Request.Form("editid") 
 rqimagename         = Request.Form("imgName")
 rqlocationaddress   =  Request.Form("locationaddress")
 rqlocation          = Request.Form("location")
   rqHotelName      =   Request.Form("hotelName") 

  
 strQuery2 = "UPDATE ITIL_Courselocations SET location = '" & rqlocation & "', imagename = '" & rqimagename & "', locationaddress = '" & rqlocationaddress & "' , hotelName = '" & rqHotelName & "' Where id = '" & rqeditid & "'"
 Rs2.Open strQuery2,Conn


 Session("message") = "You Have Successfully Edited Location "
 Response.Redirect("courselocations.asp")

End If

'==================================================='
'If You Click The Delete Button That Particular Delete Here'
'And Display The Message in city.asp Page'
'==================================================='

 rqDelete = Request.Querystring("delete")

If rqDelete <> "" Then

 strQuery3 = "DELETE FROM ITIL_Courselocations WHERE id = '" & rqDelete & "'"
 Rs.Open strQuery3,Conn
 Session("message") = "You Have Successfully Deleted Location"
 Response.Redirect("courselocations.asp")

End If

 'Rs.Close
' Set Rs = Nothing
' ConnObj.Close
' Set ConnObj = Nothing
 Else
  Response.Redirect("/India/backOffice/login.asp")
 End If
%>