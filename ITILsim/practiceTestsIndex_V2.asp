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
      <td width="73%" class="PageTitle">Mock Test</td>
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
				
				
					Case "verified1" ,"verified2"  ,"verified3" , "verified5" ,"verified6" ,"verified7","verified13"

						'If(Session("item_number")<>"151") Then'
						
						
						

%>
          <span class="Header">Dear <%=Session("FirstName")%>&nbsp;<%=Session("LastName")%></span><br>
          <br>
          <a href="/ITILsim/practicetest1.asp">Understanding ITIL  Foundation Mock Test </A> - Please read the instructions below before taking up the test.<br>
          <br>
         All questions answered by you are stored in ITILstudy database. So, to <span class="general-bodyBold">continue a test which you have not completed</span>,
          <ul>
            <li>Enter the Test Number you were working on, then click on "Continue with Test".</li>
            <li>In the next screen, please click on <span class="general-bodyBold">"View All Answers" </span>. </li>
            <li>In the next screen, please click <span class="general-bodyBold">the question number you would like to continue from.</span></li>
            <li>Please note : All your answers for the mock test are saved for "MAXIMUM OF 1 WEEK".
              </span></li>
          </ul>
          <% 
			
			'Retrive Test Numbers Based on EMail Ids'
						
				
				
				strQuery = "SELECT TestNo FROM FoundV2_Sim1Users WHERE EMail = '"& Session("PayerEmail")&"' AND Kno1 Is Null Order By TestNo Desc"
				'response.Write(strQuery)
				
				objRs.Open strQuery,ConnObj
				
				 
				
				strQuery = "SELECT TestNo FROM FoundV2_Sim1Users WHERE EMail = '"& Session("PayerEmail")&"' AND Kno1 Is Not Null Order By TestNo Desc"
				
				objRss.Open strQuery,ConnObj
			%>
          <table border="0" cellpadding="3" width="100%" style="border:1px #CCCCCC solid;" cellspacing="0" onMouseOut="javascript:highlightTableRowVersionA(0);" id="myTable0" >
            <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
              <td colspan="2" class="TableRowOdd"><span class="Header">Mock Test
                </span></td>
            </tr>
            <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
              <td colspan="2" class="TableRowEven"><form method="post" action="/ITILsim/sim1-V2/TestRules.asp">
                  <input type="hidden" Name="Test" value="test">
                  <input type="submit" class="ButtonGeneral" value="Begin Test">
                </form></td>
            </tr>
            <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
              <td class="TableRowOdd" style="border-right:1px #CCCCCC solid;"><span class="SubHeader">Continue with a test</span> </td>
              <td class="TableRowOdd"><span class="SubHeader">Finished tests</span> </td>
            </tr>
            <tr onMouseOver="javascript:highlightTableRowVersionA(this, '#FFFFCC');">
              <td class="TableRowEven" style="border-right:1px #CCCCCC solid;"><form method="post" action="/ITILsim/sim1-V2/TestRules.asp" onsubmit="returnvalidate_form(this)">
                  Test Number:
                  <select name="TestNo" class="TeXtFielddropdown" style="width:70px;">
                    <option value="">Select</option>
                    <% Do Until objRs.Eof %>
                    <option value="<% = objRs("TestNo") %>">
                    <% = objRs("TestNo") %>
                    </option>
                    <% objRs.Movenext
				   Loop 
				   objRs.Close %>
                  </select>
                  <!--<input type="text" name="TestNo" size="4" class="TeXtField" style="width:45px;">-->
                  <input type="submit" class="ButtonGeneral" value="Continue Test" style="width:130px;" >
                </form></td>
              <td class="TableRowEven"><form method="post" action="/ITILsim/sim1-V2/evaluate.asp" onsubmit="return validate_form(this)">
                  Test Number:
                  <select name="TestNo" class="TeXtFielddropdown" style="width:70px;">
                    <option value="">Select</option>
                    <% Do Until objRss.Eof %>
                    <option value="<% = objRss("TestNo") %>">
                    <% = objRss("TestNo") %>
                    </option>
                    <% objRss.Movenext
				   Loop 
				   objRss.Close %>
                  </select>
                  <!--<input type="text" name="TestNo" size="4" class="TeXtField" style="width:45px;">-->
                  <input type="submit" class="ButtonGeneral" value="View Results" style="width:130px;" >
                </form>
                </td>
            </tr>
           
          </table>
		    <br /><br />
          
        
          
         
          
        
         
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
