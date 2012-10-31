<HTML>
<HEAD>
<TITLE>ITILstudy.com</TITLE>
<META http-equiv=Content-type content="text/html; charset=ISO-8859-1">
</HEAD>
<BODY><font="arial" size="3">
<%
Dim KNo,nCur,nCurNo ,quesAsked, kno_passed,payer_email


If(Request.Form("Date")="") Then
Else

If(Request.Form("FirstName")<>"") Then
Session("FirstName")=Request.Form("FirstName")
Session("LastName")=Request.Form("LastName")
Else
End If
Session("State")="verified"
End If%>


<table width="60%" border="1">
<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>
<%If (Session("item_number")<>"151") Then%>
This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 3 hours of
Contact Hours Training for Project Framework and Context<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>

<tr><td colspan="2">&nbsp;</td></tr>
<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>

This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 4 hours of
Contact Hours Training for Project Integration Management<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>


<tr><td colspan="2">&nbsp;</td></tr>

<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>

This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 4 hours of
Contact Hours Training for Project Scope Management<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>


<tr><td colspan="2">&nbsp;</td></tr>

<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>

This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 4 hours of
Contact Hours Training for Project Time Management<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>


<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>

This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 4 hours of
Contact Hours Training for Project Cost Management<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>


<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>

This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 4 hours of
Contact Hours Training for Project Quality Management<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>


<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>

This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 4 hours of
Contact Hours Training for Project Human Resource Management<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>


<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>

This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 3 hours of
Contact Hours Training for Project Communication Management<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>


<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>

This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 4 hours of
Contact Hours Training for Project Risk Management<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>


<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>

This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 4 hours of
Contact Hours Training for Project Procurement Management<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>


<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>

This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 2 hours of
Contact Hours Training for Professional Responsibility - Understanding PMBOK 3rd Edition<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>


<%Else%>
This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 3
PMI PDUs (Category 3 PDUs for Continuing Education Requirement of certified PMPs/CAPMs) for Project Framework and Context - Understanding PMBOK 3rd Edition<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>


<tr><td colspan="2">&nbsp;</td></tr>
<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>

This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 4
PMI PDUs (Category 3 PDUs for Continuing Education Requirement of certified PMPs/CAPMs) for Project Integration Management - Understanding PMBOK 3rd Edition<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>


<tr><td colspan="2">&nbsp;</td></tr>

<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>

This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 4
PMI PDUs (Category 3 PDUs for Continuing Education Requirement of certified PMPs/CAPMs) for Project Scope Management - Understanding PMBOK 3rd Edition<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>

<tr><td colspan="2">&nbsp;</td></tr>

<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>

This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 4
PMI PDUs (Category 3 PDUs for Continuing Education Requirement of certified PMPs/CAPMs) for Project Time Management - Understanding PMBOK 3rd Edition<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>


<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>

This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 4
PMI PDUs (Category 3 PDUs for Continuing Education Requirement of certified PMPs/CAPMs) for Project Cost Management - Understanding PMBOK 3rd Edition<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>


<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>

This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 4
PMI PDUs (Category 3 PDUs for Continuing Education Requirement of certified PMPs/CAPMs) for Project Quality Management - Understanding PMBOK 3rd Edition<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>


<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>

This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 4
PMI PDUs (Category 3 PDUs for Continuing Education Requirement of certified PMPs/CAPMs) for Project Human Resource Management - Understanding PMBOK 3rd Edition<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>


<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>

This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 3
PMI PDUs (Category 3 PDUs for Continuing Education Requirement of certified PMPs/CAPMs) for Project Communication Management - Understanding PMBOK 3rd Edition<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>


<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>

This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 4
PMI PDUs (Category 3 PDUs for Continuing Education Requirement of certified PMPs/CAPMs) for Project Risk Management - Understanding PMBOK 3rd Edition<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>

<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>

This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 4
PMI PDUs (Category 3 PDUs for Continuing Education Requirement of certified PMPs/CAPMs) for Project Procurement Management - Understanding PMBOK 3rd Edition<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>


<tr><td colspan="2"><BR><BR>
<IMG alt="" align="left"
                  src="PMP, PMI, PDU, Project Management, Free, PMP, Free, PMI, Training_files/6sigmastudylogo.jpg">
<BR>
<p align="right"><B>Date Completed :
<%If(Request.Form("Date")="") Then%>
<%=date()%>
<%Else%>
<%=Request.Form("Date")%>
<%End If%>
</B></P> </td></tr>
<tr><td colspan="2"><BR><BR>

This is to certify that <B><%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></B> has been awarded 2
PMI PDUs (Category 3 PDUs for Continuing Education Requirement of certified PMPs/CAPMs) for Professional Responsibility - Understanding PMBOK 3rd Edition<BR><BR>
<B><I>www.ITILstudy.com</I> (Edusys Services Pvt. Limited) </B><BR>
Email: adminsupport@itilstudy.com<BR>
<BR></td></tr>

<%End If%>
</table>

<BR><BR>Please take a print out of this page or keep a softcopy for PMI and for your reference.<BR>
<%Session("State")=""%>
<A href="./memberlogin.asp">Log in again to continue working in other sections</A>
</body>
</html>

