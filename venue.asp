<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'========================================================='
'Written By : savita'
'Written Date : 07-11-2011'
'Updated Date " 12-01-2012'
'Description :'
'In This Page We Are Diplaying Venue Details of Particular Course'
'========================================================='
%>
<!--#include virtual="/includes/connection.asp"-->


<%
'Declare The Variables'
Dim strQueryVenue
Dim rqCourseID 
Dim rsVenueDetails

Set rsVenueDetails = Server.CreateObject("ADODB.Recordset")

'Retrive The CourseID Using QueryString From ITIL-Courses.asp Page'
rqCourseID = Request.QueryString("courseID")

If rqCourseID = "" Then
Response.Redirect("/ITIL-Courses.asp")
End If


strQueryVenue = "SELECT course.city, course.startdate, course.enddate, course.starthour, course.startminute, course.startsession, course.endhour, course.endminute, course.endsession, course.hotelname, course.hotelphonenumber, course.hotelurl,course.hoteladdress, course.coursedates, city.state_code,city.country,course.coursetype FROM ITIL_course course, ITIL_city city WHERE course.city = city.city And courseid = '" & rqCourseID & "'"
    'response.write strQueryVenue
'rqcity = strQueryVenue(city)

rsVenueDetails.Open strQueryVenue,ConnObj

%>


<%

					Dim sIPAddress, objHtp, strQuery11


						sIPAddress = Request.ServerVariables("HTTP_X_FORWARDED_FOR")

						If sIPAddress="" Then sIPAddress = Request.ServerVariables("REMOTE_ADDR")


						strQuery11 = "http://geoip1.maxmind.com/b?l=4tAUhyTgUD6d" & _
							"&i=" & sipaddress
						set objHtp = Server.CreateObject("Msxml2.ServerXMLHTTP")
						objHtp.open "GET", strQuery11, false
						objHtp.send
						sipAddress = sipAddress + ";" + objHtp.ResponseText
						
						

					ConnObj.Execute "INSERT INTO Venue_Reviewed (city,country,IPaddress,TimeOfEntry) values('"& rsVenueDetails("city") &"', '"& rsVenueDetails("country") &"','"&sIPAddress&"','"&now()&"')"
					
					'response.write("INSERT INTO Venue_Reviewed (city,country,IPaddress,TimeOfEntry) values('"& rsVenueDetails("city")&"', '"& Session("CountryOrigin") &"','"&sIPAddress&"','"&now()&"')")


If InStr(sipAddress,"IN") Then
	Session("CountryOrigin")="India"
	End If
	
If InStr(sipAddress,";US,") Then
		Session("CountryOrigin") = "US"
	End If
	
If InStr(sipAddress,";CA,") Then
		Session("CountryOrigin") = "Canada"
	End If
	
If InStr(sipAddress,";SG,") Then
		Session("CountryOrigin") = "Singapore"
	End If
	
If (InStr(sipAddress,";AU,")) Then
		Session("CountryOrigin") = "Australia"
	End If
	
If InStr(sipAddress,";AE,") Then
		Session("CountryOrigin") = "UAE"
	End If
	

If (InStr(sipAddress,";GB,") OR InStr(sipAddress,";UK,")) Then
		Session("CountryOrigin") = "United Kingdom"
	End If
	
If InStr(sipAddress,";DE,") Then
		Session("CountryOrigin") = "Germany"
	End If	
	
If InStr(sipAddress,";NL,") Then
		Session("CountryOrigin") = "Netherlands"
	End If	
	
If Session("CountryOrigin")="" Then
		Session("CountryOrigin")="Other"
	End If	

'Set objHtp = Nothing
'Set ConnObj = Nothing

'End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Venue Details</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body class="popupbody">
<div style="margin-top:30px;">
   <table border="0" width="100%" class="btext">
    <tr>
      <td><table border="0" align="center" cellpadding="2" cellspacing="0">
          <% Do Until rsVenueDetails.EOF  %>
		  <tr>
          	<td>City: 
                  <%If Trim(rsVenueDetails("CourseType")) <> "Live" Then %>
		                    <% If rsVenueDetails("state_code") <> "" Then %>
			                    <% = Trim(rsVenueDetails("city")) %>, <% = rsVenueDetails("state_code") %>
                               <%  else%>
                                <% = Trim(rsVenueDetails("city")) %>
                                <% End If%>
                  <%Else %>
                  Live Online Class
                  <%end If %>
          	</td>
          </tr>
		  <tr>
          	<td>Date: <% If (IsNull(rsVenueDetails("coursedates")) OR rsVenueDetails("coursedates")="")Then %><% = rsVenueDetails("startdate") %> to <% = rsVenueDetails("enddate") %> <% Else %><% = rsVenueDetails("coursedates") %><% End If %></td>
          </tr>
		  <tr>
          	<td>Timings: <% = rsVenueDetails("starthour") %>:<% = rsVenueDetails("startminute") %>&nbsp;<% = rsVenueDetails("startsession") %> to <% = rsVenueDetails("endhour") %>:<% = rsVenueDetails("endminute") %>&nbsp;<% = rsVenueDetails("endsession") %>
           <!-- <%'If rsVenueDetails("Coursetype") ="Live" Then %> PST<%'End If %>-->
          	</td>
          </tr>
		  <tr>
          	<td><br />Venue:</td>
          </tr>                              		  
		  <% If rsVenueDetails("hoteladdress") <> "" Then %>
          <tr>
            <td><% = rsVenueDetails("hotelname") %></td>
          </tr>
          <tr>
            <td><% = rsVenueDetails("hoteladdress") %></td>
          </tr>
          <tr>
            <td><% = rsVenueDetails("city") %></td>
          </tr> 
          <% If rsVenueDetails("hotelphonenumber") <> "" Then %>    
          <tr>
            <td>Ph: <% = rsVenueDetails("hotelphonenumber") %>.</td>
          </tr>
          <% End If %>
          <tr>
            <td><a href="<% = rsVenueDetails("hotelurl") %>" target="_blank">
              <% = rsVenueDetails("hotelurl") %>
              </a></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td><br />
        <table border="0" width="100%">
          <tr>
            <td><b>Please Note : </b> Venue details may change. If changed, you would be notified through an email.</td>
          </tr>
        </table></td>
    </tr>
    <% Else %>
    <tr>
	 <td>
	  <table border="0" width="100%">
	    <tr>
          <td align="center" class="btext"><%If rsVenueDetails("CourseType") ="Live" Then %>Can be taken from home<%Else %>Yet to be finalized.<%End If %></td>
		</tr>
	  </table>
	 </td>
    </tr>
    <tr>
      <td><br />
        <table border="0" width="100%">
          <tr>
            <td><b><%If rsVenueDetails("CourseType") <> "Live" Then %>Please Note : </b> Venue details may change. If changed, you would be notified through an email.<%end If %></td>
          </tr>
        </table></td>
    </tr>
    <% End If %>
    <% rsVenueDetails.Movenext
     Loop
	 rsVenueDetails.Close
	 Set rsVenueDetails = Nothing
	 ConnObj.Close
	 Set ConnObj = Nothing  %>
  </table>
</div>
</body>
</html>
