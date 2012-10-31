<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<% If Session("payerEmail") = "" Then
		Response.Redirect("/memberlogin.asp")
   Else	%>

<script language="JavaScript" type="text/javascript" src="/js/tableH.js"></script>
<script language='javascript' type='text/javascript'>
	/*function submitcontinue()
		{
		  alert("ok");
			 if( document.continue.TestNo.value == "Select" )
				{
					alert('Please Select Any Test Number' );
					return false;
				}
			
		 }
	function submitfinish()
		{
			 if( document.finish.TestNo.value == "Select" )
				{	
					alert('Please Select Any Test Number' );
					return false;
				}
			
		 }*/
		 
		 
 function validate_form(theform)
 {
 if (theform.TestNo.value == "")
  {
     alert("Please Select The Test Number.");
     theform.TestNo.focus();
     return (false);
  }
 }	
</script>
  <!-- Body Starts -->
 
<div>
<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  
  <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
  
  <table width="100%" border="0" cellspacing="0" cellpadding="8">
    <tr>
      <td width="2%" class="Header">&nbsp;</td>
      <td width="25%" class="PageTitle">&nbsp;</td>
      <td width="73%" class="PageTitle">ITILstudy Simulated Practice Test </td>
    </tr>
    <tr>
      <!--#include virtual="/includes/innerLeftMenu.asp"-->
      <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><div style="width:95%;">
        <!-- Content Start From Here-->
        <table width="100%" border="0">
          <% 'if (Session("State")="verified10") Then%>
        <!--  <tr>
            <td colspan="2"> You will have access to this section after your Classroom Program begins. Click here for the <a href="./prepcourse1.asp" target=_blank>Preparatory Program which is a pre-requisite for the PMstudy PMP-Prep Classroom Course.</A> 
          </tr> -->
          <%'Else%>
          <tr>
          
          <%

Session("QuesNo")=""
Session("TestNo")=""
State = Session("State")
'PMPCAPM=Session("PMPCAPM")
Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
Set objRss = Server.CreateObject("ADODB.Recordset")



	Session("TimeTaken") = ""
	Session("MaxQuesNo") = ""

				Select Case State
				
					Case "verified8" %>
       
               <span class="Header">Welcome, <%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></span><br>
          <br>
         <!-- <a href="/freeresources/practicetest1.asp">Understanding ITILstudy Simulated Practice Tests</A> - Please read before
          taking the test.<br>
          <br>-->
          All questions answered by you are stored in ITILstudy.com database. So, to <span class="general-bodyBold">continue a test which you have not completed</span>,
          <ul>
            <li>Enter the Test Number you were working on, then click on "Continue with Test".</li>
            <li>In the next screen, please click on <span class="general-bodyBold">"View All Answers" </span>. </li>
            <li>In the next screen, please click the <span class="general-bodyBold">question number you would like
              to continue working on.</span></li>
            <li>Please note : All your answers for the simulated practice tests are saved for "MAXIMUM OF 1 WEEK".
              </span></li>
          </ul>
          <br>  
                 <span class="Header">ITILstudy Simulated Practice Test For 15 Question</span><br>
          <form method="post" action="./ITILsim/Sim15Ques/TestRules.asp">
            <input type="hidden" Name="Test" value="test">
            <p>
              <input type="submit" class="ButtonGeneral" value="Begin Test For 15 Question" style="width:175px;">
            </p>
          </form>
		 <% Case "verified12" %>
       
               <span class="Header">Welcome, <%=Session("FirstName")%>&nbsp; <%=Session("LastName")%></span><br>
          <br>
        
          All questions answered by you are stored in ITILstudy.com database. So, to <span class="general-bodyBold">continue a test which you have not completed</span>,
          <ul>
            <li>Enter the Test Number you were working on, then click on "Continue with Test".</li>
            <li>In the next screen, please click on <span class="general-bodyBold">"View All Answers" </span>. </li>
            <li>In the next screen, please click the <span class="general-bodyBold">question number you would like
              to continue working on.</span></li>
            <li>Please note : All your answers for the simulated practice tests are saved for "MAXIMUM OF 1 WEEK".
              </span></li>
          </ul>
          <br>  
                 <span class="Header">ITILstudy Simulated Practice Test For 40 Question</span><br>
          <form method="post" action="./ITILsim/Sim40Ques/TestRules.asp">
            <input type="hidden" Name="Test" value="test">
            <p>
              <input type="submit" class="ButtonGeneral" value="Begin Test For 40 Question" style="width:175px;">
            </p>
          </form>
               <%End Select %>    
                </td>
            </tr>
           
          </table>
		  
          
          
          </table></td>
    </tr>
    <!-- Content End From Here-->
    </div>
    
    </td>
    
    </tr>
    
  </table>
  </td>
  
  </tr>
  
</table>
</div>
<!-- Body Ends -->
 <% End If %>
<!--#include virtual="/includes/footer.html"-->
