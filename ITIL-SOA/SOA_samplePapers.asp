<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innermethodologybanner.html"-->

<% If Session("FirstName") = "" Then 
response.Redirect("/memberlogin.asp")
Else
%>
<!-- Body Starts -->
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

<div>
<table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  
  <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
  
  <table width="100%" border="0" cellspacing="0" cellpadding="8">
    <tr>
      <td width="2%" class="Header">&nbsp;</td>
      <td width="25%" class="PageTitle">&nbsp;</td>
      <td width="73%" class="PageTitle">SOA Sample Papers<a href="/ITIL/help.asp#APMG-sample-paper" style="float:right; margin-right:20px;"><img src="/images/buttons/Help.png" height="20px" style="border-color:#FFFFFF" onmouseover="this.src='/images/buttons/help_h.png'" onmouseout="this.src='/images/buttons/Help.png'"></a></td>
    </tr>
    <tr>
      <!--#include virtual="/includes/innerLeftMenu.asp"-->
     
      <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><!-- Content Start From Here-->
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

				
						
						
						

%>
                    <span class="Header">Dear <%=Session("FirstName")%>&nbsp;<%=Session("LastName")%></span><br>
                    <br>
                    <ul>
                   <li>Eight (8) multiple choice, scenario-based, gradient scored questions.</li>
                    <li>Each question will have 4 possible answer options, one of which is worth 5
marks, one which is worth 3 marks, one which is worth 1 mark, and one which is a distracter and achieves no marks.
</li>
                   <li>The pass mark is 28/40 or 70%. Candidates are expected to answer all questions</li>
                      <li>There is No Negative Marking. All Questions are Multiple Select Questions, i.e. you must choose one from the available four alternatives.</li>
                      <li>The exam is of 90 minutes duration.</li>
                      <li><b>No support material</b> is permitted. This is a closed book exam.</li>
                      </ul>
<br /><br />
        <table width = "75%" border="0" cellpadding="0" cellspacing="0" class="TableGeneral">
           <tr>
                    <td class="TableRowOdd"><b>SOA Sample Paper1</b></td>
                    <td class="TableRowOdd"><b>SOA Sample Paper2</b></td>
                    
                  </tr>
				  
				   <tr>
                    <td class="TableRowEven" ><a href="/ITIL-SOADocs/SOApapers/SOApaper1-scenarios.pdf" target="_blank">Scenario</a></td>
                   
                    <td class="TableRowEven" ><a href="/ITIL-SOADocs/SOApapers/SOApaper2-scenarios.pdf" target="_blank">Scenario</a></td>
                  </tr>
                    <tr>
                    <td class="TableRowEven" ><a href="/ITIL-SOADocs/SOApapers/SOApaper1-questions.pdf" target="_blank">Question</a></td>
                    
                    <td class="TableRowEven" ><a href="/ITIL-SOADocs/SOApapers/SOApaper2-questions.pdf	" target="_blank">Question</a></td>
                   
                  </tr>
                   
                  <tr>
                    <td class="TableRowEven" ><a href="/ITIL-SOADocs/SOApapers/SOApaper1-answers.pdf" target="_blank">Answer and Rationale</a></td>
                    
                    <td class="TableRowEven" ><a href="/ITIL-SOADocs/SOApapers/SOApaper2-answers.pdf" target="_blank">Answer and Rationale</a></td>
                   
                  </tr>
                  <tr>
                  <td class="TableRowEven" ></td>
                    <td class="TableRowEven" ></td>
                    <td class="TableRowEven" ></td>
                  </tr>
        </table>
        <br />
        
    </div>
    
    <br /><br />
	
    <!-- Content End From Here-->

    
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
