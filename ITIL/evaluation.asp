<!--#include virtual="/metatags/index_metatag.html"-->
<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerpdusbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!-- Body Starts -->
<div>
<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
  <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
      <tr>
        <td width="2%" class="Header">&nbsp;</td>
        <td width="25%" class="PageTitle">&nbsp;</td>
        <td width="73%" class="PageTitle">Evaluation Test</td>
      </tr>
      <tr>
        <!--#include virtual="/includes/innerLeftMenu.asp"-->
        <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
            <%
				If Session("State") = "verified1" OR Session("State") = "verified2" OR Session("State") = "verified3" OR Session("State") = "verified5" OR Session("State") = "verified6" OR Session("State") = "verified7"  OR Session("State") = "verified13"  Then %>
           			<div><span class="Header">Welcome  <%=Session("FirstName")%>&nbsp;<%=Session("LastName")%>, </span></div> 
					<p class="SubHeader">Please select the chapter to take the evaluation test on it.  </p>
            <%
				Dim kno_passed
				Dim rsQues
				
				kno_passed=int(Session("KnoPassed"))+1
				
				'Instantiate an ADO Recordset object.
				Set rsQues = Server.CreateObject("ADODB.Recordset")
				
				rsQues.ActiveConnection = ConnObj
				
				rsQues.Open "SELECT KNo, AreaTitle from KArea"%>
            <form method="post" action="/ITIL/pduquesget.asp">
              <%
			    Dim KNumber, count
				KNumber=kno_passed
				count=0
			  %>
              <table width="80%" border="0" cellpadding="0" cellspacing="0" class="TableGeneral">
                <tr>
                  <td width="25%">Chapter :</td>
                  <td><SELECT NAME="KNo" class="TeXtFielddropdown">
                      <%Do While Not rsQues.EOF and count < KNumber %>
                      <Option VALUE="<%=rsQues("KNo")%>"> <%=rsQues("AreaTitle")%></Option>
                      <%rsQues.MoveNext
				       count=count+1
				       Loop
				       Set rsQues = Nothing%>
                    </SELECT>
                  </td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td><input type="submit" class="ButtonGeneral" value="Enter Selection">
                    <input type="reset" value="Reset" class="ButtonGeneral" style="width:60px;">
                  </td>
                </tr>
              </table>
            </form>
            <br /><br />
            <p><strong>Important:</strong> Please note that you must complete one chapter before proceeding to the next one.</p>
            <% else%>
           <div><span class="Header">Welcome User, </span></div> 
			<p class="SubHeader">Please select the chapter to take the evaluation test on it.  </p>
           <form name="login" action="/memberlogin.asp" method="post">
		    <table width="80%" border="0" cellspacing="0" cellpadding="4">
              <tr>
                <td width="25%"><strong>Chapter : </strong> </td>
                <td><select name="" class="TeXtFielddropdown">
                    <option>Chapter 1: Introduction </option>
                  </select></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td><input type="submit" class="ButtonGeneral" value="Enter Selection">
                  <input type="reset" value="Reset" class="ButtonGeneral" style="width:60px;">
                </td>
              </tr>
            </table>
			</form>
            <br /><br />
            <p><strong>Important:</strong> Please note that you must complete one chapter before proceeding to the next one.</p>
            <%end if%>
          </td>
      </tr>
    </table>
   </td>
  </tr>
 </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/connectionClose.asp"-->
<!--#include virtual="/includes/footer.html"-->
