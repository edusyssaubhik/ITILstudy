<div id="sidebar">
	<ul class="sideNav">
	<%' If Session("TypeOfUser") <> "AEXP" Then %>
		<li><a href="overview.asp">Overview</a></li>
		<li><a href="marketingB2C.asp?action=noFollowUp">Marketing</a></li>
		<li><a href="marketingB2B.asp">Past Students DB</a></li>
		<li><a href="scheClasses.asp">Classes Scheduled</a></li>
		<% If Session("TypeOfUser") = "Admin" Then %>
		<li><a href="fin.asp">Finance</a></li>
		<% Else %>
		<li><a href="fin_faculty.asp">Finance</a></li>
		<% End If %>
        <li><a href="callReport.asp" target="_blank">Call Report</a></li>
        <% If Session("TypeOfUser") = "Admin" Then %>
        <li><a href="Gen_Conversion_Report.asp" target="_blank">Call Conversion Report</a></li>
        <% End If %>
		<% If Session("USBUserId") = "edusyssavita@gmail.com" OR Session("USBUserId") = "edusysanusuya@gmail.com" OR Session("USBUserId") = "edusyspuja@gmail.com" OR Session("USBUserId") = "edusysdiptangshu@gmail.com" OR Session("USBUserId") = "edusysankits@gmail.com" OR Session("USBUserId") = "edusysankit@gmail.com" OR Session("USBUserId") = "edusysnikhil@gmail.com" OR Session("USBUserId") = "edusysajay@gmail.com" OR Session("USBUserId") = "edusysgregory@gmail.com" OR Session("USBUserId") = "edusysrajeev@gmail.com" OR Session("USBUserId") = "edusysbharath@gmail.com" OR Session("USBUserId") = "edusysrashmi@gmail.com"  Then %> 
		<li><a href="instructors.asp" target="_blank">Add Instructor</a></li>
		<li><a href="/USBackoffice/states.asp" target="_blank">Add States</a></li>
		<% End If %>
		<% If Session("TypeOfUser") = "Admin" Then %>
		<%' If Session("USBUserId") = "edusyssavita@gmail.com" Then %>
		<li><a href="hotelDetails.asp">Hotel Details</a></li>
        <li><a href="/USBackoffice/licensing.asp">Licensing Agreement</a></li>
		<% End If %>
		<li><a href="ExamExp.asp">Exam Experience</a></li>
		<li><a href="support.asp">Support Center</a></li>
		<%' If Session("TypeOfUser") = "Admin" Then %>
		<li><a href="changePwd.asp">Change Password</a></li>
	<%' End If %>
	<li><a href="logoff.asp">Logout</a></li>

	</ul>
	<!-- // .sideNav -->
</div> 