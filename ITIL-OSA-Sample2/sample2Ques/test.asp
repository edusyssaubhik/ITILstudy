<html>
<% If Session("payerEmail") = "" Then
		Response.Redirect("/memberlogin.asp")
 Else	
 			
	TestNo = Request.Form("TestNo")
%>  

	<frameset rows="8%,85%" border="0" frameborder="0" framespacing=0>
		
	<frame src="counttimer.asp" style="overflow:hidden" scrolling="no">
		
		<frame src="index.asp" scrolling="no" style="overflow:hidden">
	
	</frameset><noframes></noframes>
<% 

'Response.write("UPDATE CSIsample8QuesResponse SET SelectedChoice = '"&SelectedChoice&"', Marked = '"&Marked&"', Duration = '"&TotalDuration&"' WHERE TestNo='"&TestNo&"' AND QuesNo='"&QuesNo&"'")


End If %>
 </html>