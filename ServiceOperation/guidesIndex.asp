<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerqualitymaterialbanner1.html"-->
<!--#include virtual="/includes/connection.asp"-->

<% If Session("FirstName") = "" Then 
response.Redirect("/memberlogin.asp")
Else
%>

<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="PageTitle">ITILstudy.com Study Material <a href="/ServiceOperation/help.asp#Select-Chapter" style="float:right; margin-right:20px;"><img src="/images/buttons/Help.png" height="20px" style="border-color:#FFFFFF" onmouseover="this.src='/images/buttons/help_h.png'" onmouseout="this.src='/images/buttons/Help.png'"></a></td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
             
			  <%
				If Session("State") = "verified17" Then %>
              
			  <span class="Header">Welcome <%=Session("FirstName")%>&nbsp;<%=Session("LastName")%>, </span>
			  <p><span class="SubHeader">Please select the Chapter to view the Guides:</span> </p>
			  
              <%
				Dim kno_passed
				Dim rsQues
				
				kno_passed=int(Session("KnoPassed"))+1
				
				'Instantiate an ADO Recordset object.
				Set rsQues = Server.CreateObject("ADODB.Recordset")
				
				rsQues.ActiveConnection = ConnObj
				
				rsQues.Open "SELECT KNo, AreaTitle from KArea_Operation"%>
                
              <form method="post" action="/ServiceOperation/guides1.asp">
                <%Dim KNumber, count
				KNumber=kno_passed
				count=0
				%>
				<br />
                <table width = "80%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="25%"> Chapter : &nbsp;&nbsp;&nbsp;</td>
                  <td><SELECT NAME="KNo" class="TeXtFielddropdown">
                      <%Do While Not rsQues.EOF %>
                      <Option <% If Session("KNO") =  rsQues("KNo") Then %> selected="selected" <% End If %> VALUE="<%=rsQues("KNo")%>"> <%= "Chapter"&" "& rsQues("KNo")&" : "&rsQues("AreaTitle")%></Option>
                    
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
                  <td><input type="submit" class="ButtonGeneral" value="Submit">
                    <input type="reset" value="Reset" class="ButtonGeneral" style="width:60px;">
                  </td>
                </tr>
              </form>
        </table>
       
        <% else%>
        <p class="Header">User name, please take the evaluation exam for this chapter</p>
         <form name="login" action="/memberlogin.asp" method="post">
		<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr>
            <td width="25%"><strong>Please select the chapter:</strong> </td>
            <td><select name="" class="TeXtFielddropdown">
                <option>Chapter 1: Introduction</option>
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
        <%end if%>
      </td>
    </tr>
  </table>
 </td>
 </tr>
</table>
</div>
<!-- Body Ends -->
<% End If %>
<!--#include virtual="/includes/connectionClose.asp"-->
<!--#include virtual="/includes/footer.html"-->
