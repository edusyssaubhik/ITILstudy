<!-- h1 tag stays for the logo, you can use the a tag for linking the index page -->
<% Session.Timeout = 60 %>
<h1><span>ITILstudy</span></h1>
<ul id="mainNav">
	<li class="logout"><a href="logoff.asp">LOGOUT</a></li>
	<li class="text">Time (ITILstudy US Server): <% = Now() %> &nbsp;&nbsp;|&nbsp;&nbsp; Welcome <% = Session("FirstName") %>&nbsp;<% = Session("LastName") %></li>
</ul>