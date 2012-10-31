<!--#include virtual="/includes/connection.asp"-->
<%
	 'Validating session.  	
	 If Session("payerEmail") <> "" Then
	 
	 	'If the TimeTaken is empty then the TimeLeft will be 4 hours else consumed time will be fetched from DB and detucted form 4 hours and the remaining time is assigned to TimeLeft variable.
		
 		If Session("TimeTaken") = "" Then
		
			timeLeft = 900  
			Session("TimeTaken") = timeLeft
			
		Else
			'Fetching time consumed by the user for answering question.
			Set objRs = connObj.Execute("SELECT SUM(Duration) AS TimeTaken FROM Sim15QuesResponse WHERE TestNo = '"& Session("TestNo") & "'")
	 
			If (Not objRs.BOF) And (Not objRs.EOF) Then
			
				TimeTaken = objRs("TimeTaken")
				
			End If
			
			objRs.Close
			Set objRs = Nothing
			
			'Assingning the remaining time to a variable.
			If IsNull(TimeTaken) Then
				timeLeft = 900 
			Else
				timeLeft = 900 - TimeTaken 
				
				'If Time is Negative timeLeft = 0'
				If timeLeft <= 0 Then
					timeLeft = 0 
				End If
								
			End If
			
		End If

	' If then session is not valid then redirected to memberLogin page.
	Else
	
		response.Redirect("/memberLogin.asp")
		
	End If

    
  
%>
<html>
<head>

<script type="text/javascript">
function display_c(start){
   window.start = parseFloat(start);
   var end = 0 // change this to stop the counter at a higher value
   var refresh=1000; // Refresh rate in milli seconds
   if(window.start >= end ){
     mytime=setTimeout('display_ct()',refresh)
   }
}

function display_ct() {
   // Calculate the number of days left
   var days=Math.floor(window.start / 86400);
   // After deducting the days calculate the number of hours left
   var hours = Math.floor((window.start - (days * 86400 ))/3600)
   // After days and hours , how many minutes are left
   var minutes = Math.floor((window.start - (days * 86400 ) - (hours * 3600 ))/60)
   // Finally how many seconds left after removing days, hours and minutes.
   var secs = Math.floor((window.start - (days * 86400 ) - (hours * 3600) - (minutes * 60)))

	
   if(window.start == 0) {
   	var x =  "    " + "Time Out"
   }
   else {
   	var x =  "    " + "Time left : " + hours + ":" + minutes + ":" + secs;
   }
	 
   document.getElementById('ct').innerHTML = x;
   window.start= window.start- 1;

   tt=display_c(window.start);

}

</script>


</head>
<body onload=display_c(<% = timeLeft %>);>
<div style="width:95%; height:27px;">
  <div>
    <table width="955" border="0" cellspacing="0" cellpadding="3" height="40px">
      <tr>
        <td width="183" bgcolor="#000066"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif" size="3">
            <strong><% =Session("FirstName") %>&nbsp;<% =Session("LastName") %></strong>
          </font></td>
        <td colspan="2" bgcolor="#000066"><div align="center" class="">
            <font color="#FFFFFF" face="Arial, Helvetica, sans-serif" size="3"><strong>ITIL</strong></font></div></td>
        <td width="218" bgcolor="#000066" style="font-weight:bold"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif" size="3"><span class="style3" id='ct'></span></font></td>
      </tr>
    </table>
  </div>
<!--#include virtual="/includes/connectionClose.asp"-->
</div>
</body>
</html>