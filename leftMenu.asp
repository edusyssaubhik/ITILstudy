<div id="sidebar">
	<ul class="sideNav">
	<%' If Session("TypeOfUser") <> "AEXP" Then %>
		<li><a href="overview.asp">Overview</a></li>
		<li><a href="marketingB2C.asp?action=noFollowUp">Marketing</a></li>
		<!--<li><a href="scheClasses.asp">Classes Scheduled</a></li>
		<li><a href="marketingB2B.asp">Past Students DB</a></li>
		
		<li><a href="logistics.asp">Logistics</a></li>
		<%' If Session("TypeOfUser") = "Admin" Then %>
		<li><a href="fin.asp">Finance</a></li>
		<%' Else %>
		<li><a href="fin_faculty.asp">Finance</a></li>
		<%' End If %>
		<% 'If Session("CRM_Country") <> "United Kingdom" Then %>
		<li><a href="faqs.asp">FAQs</a></li>
		<%' End If %>
        <%' If Session("CRM_Country") <> "UAE" Then %>
		<li><a href="facPresentation.asp">Faculty Presentations</a></li>
        <%' End If %>
		<%' If Session("TypeOfUser") = "Admin" Then %>
		<li><a href="hotelDetails.asp">Hotel Details</a></li>
		<li><a href="upsOrderedGifts.asp">UPS</a></li>
		<%' End If %>
		<li><a href="support.asp">Support Center</a></li>
		<li><a href="changePwd.asp">Change Password</a></li>
        <%' If (Session("6sigma") = "verified" OR Session("TypeOfUser") = "Admin") Then %>
        <li><a href="6sigmaMarketingB2C.asp?action=noFollowUp">6sigma Marketing - B2C</a></li>
		<li><a href="6sigmaFaqs.asp">6sigma FAQs</a></li>
		<%' End If %>
		<% 'If Session("TypeOfUser") = "Admin" Then %>
		<li><a href="/usinstructor.asp" target="_blank">Add Instructor</a></li>
		<li><a href="/USBackoffice/6sigma_us_inst.asp" target="_blank">Add 6sigma Instructor</a></li>
		<li><a href="/USBackoffice/6sigma_states.asp" target="_blank">Add 6sigma States</a></li>
		<li><a href="/USBackoffice/licensing.asp">Licensing Agreement</a></li>
		<li><a href="/USBackoffice/states.asp" target="_blank">Add States</a></li>
        <%' End If %>
	<%' Else %>
		<li><a href="logistics.asp">Logistics</a></li>-->
		<li><a href="support.asp">Support Center</a></li>
		<li><a href="changePwd.asp">Change Password</a></li>
	<%' End If %>
	</ul>
	<!-- // .sideNav -->
</div> 