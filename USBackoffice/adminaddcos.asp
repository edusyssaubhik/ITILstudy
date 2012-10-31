<html>
<head>
<TITLE>6sigmastudy.com PMP Coaching, Economical, Effective</TITLE>
<META http-equiv=Content-type content="text/html; charset=ISO-8859-1">
<META
content="6sigmastudy.com offers Online Economical, Effective, PMP Coaching, PMP Training, FREE Simulated Practice Tests, Contact Hour Certificates, Guides on Different Knowledge Areas, the best guidance to clear PMP Certification Exams, About PMP, About Project Management,About PMI, PMP Exam Cram, PMP, Project Management, PMI"
name=description>
<META
content="6sigmastudy.com offers Online Economical, Effective, PMP Coaching, PMP Training, FREE Simulated Practice Tests, Contact Hour Certificates, Guides on Different Knowledge Areas, the best guidance to clear PMP Certification Exams, About PMP, About Project Management,About PMI, PMP Exam Cram, PMP, Project Management, PMI"
name=keywords>
</head>
<body>
<!--#include virtual="/includes/connection.asp"-->

<%


CompanyName=Request.Form("CompanyName")


			ConnObj.Execute "INSERT INTO corpmarketing (CompanyName) VALUES('"&CompanyName&"')"

			Set ConnObj=Nothing
			Response.Write "Added Company to list : ("&CompanyName&")"
%>
</body>
</html>