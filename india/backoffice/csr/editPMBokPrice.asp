<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 'Written By : BbojaRaju'
 'Last UpaDated: 29/04/2008'
 'Description :'
 'Purpose : PMBOK Price Editing'
%>
<%
   If Session("UserId")  = "" Then
     Response.Redirect("../login.asp")
   Else
%>

<!--#include virtual="/india/connection.asp"-->

<%
  Dim rqid,rqname,rqcourse,rqamount,rqpmbok,rqpmbokPrice,rqcourseId,Sql,difference,rqpmbokPriceOld
  
  rqId = request.form("id")
  rqcourseId = request.form("courseId")
  rqamount = request.form("amount")
  rqpmbok = request.form("pmbok")
  rqpmbokPrice = request.form("pmbokPrice")
  rqpmbokPriceOld = request.form("pmbokPriceOld")
  
  if rqpmbokPriceOld <> "" then
  	rqamount = cint(rqamount) -cint( rqpmbokPriceOld )
  else
  	rqamount = rqamount
  end if
  
  difference = cint(rqamount) + cint(rqpmbokPrice)
  
   'response.Write(difference)
   
  Sql = "update ps_enrolledusers set amount = '"& formatnumber(difference)  &"', pmbokprice = '"& rqpmbokPrice  &"' where id = '"& rqId &"'"
   'response.Write(sql)
   'response.Flush()
  Rs.open Sql,conn
 
 	'response.Redirect("editPMBok.asp?id="&rqId&"&courseid="&rqcourseId)
	response.Redirect("courses.asp?courseid="&rqcourseId)
				
 
 end if %>