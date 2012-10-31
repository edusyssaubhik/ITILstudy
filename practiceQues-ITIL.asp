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
      <td width="73%" class="PageTitle">Sample Papers<a href="/ITIL/help.asp#APMG-sample-paper" style="float:right; margin-right:20px;"><img src="/images/buttons/Help.png" height="20px" style="border-color:#FFFFFF" onmouseover="this.src='/images/buttons/help_h.png'" onmouseout="this.src='/images/buttons/Help.png'"></a></td>
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
                    <li>The question paper contains 40 questions covering different syllabus topics. Each of the 40 questions is worth 1 mark. The pass mark is 65% i.e. 26 correct answers. Candidates are expected to answer all questions.</li>
                    <li>There is No Negative Marking. All are Multiple Choice Questions, i.e. you must choose one from the available four alternatives.</li>
                   <li>The exam is of 60 minutes duration.</li>
                      <li><b>No support material</b> is permitted. This is a closed book exam.</li>
                      </ul>
<br /><br />
        <table width = "60%" border="0" cellpadding="0" cellspacing="0" class="TableGeneral">
           <tr>
                    <td class="TableRowOdd"><b>Sample Paper1</b></td>
                    <td class="TableRowOdd"><b>Sample Paper2</b></td>
                    
                  </tr>
                    <tr>
                    <td class="TableRowEven" ><a href="/ITILdocs/ITIL/sample papers/ITILv3FoundationSampleA_Questions_v3.1.pdf" target="_blank">Question</a></td>
                    
                    <td class="TableRowEven" ><a href="/ITILdocs/ITIL/sample papers/ITILv3FoundationSampleB_QUESTIONS_v3.1.pdf" target="_blank">Question</a></td>
                   
                  </tr>
                    <tr>
                    <td class="TableRowEven" ><a href="/ITILdocs/ITIL/sample papers/ITILv3FoundationSampleA_ANSWERS_v3.1.pdf" target="_blank">Answer</a></td>
                   
                    <td class="TableRowEven" ><a href="/ITILdocs/ITIL/sample papers/ITILv3FoundationSampleB_ANSWERS_v3.1.pdf" target="_blank">Answer</a></td>
                  </tr>
                  <tr>
                    <td class="TableRowEven" ><a href="/ITILdocs/ITIL/sample papers/ITILv3FoundationSampleA_Rationale_v3.2.pdf" target="_blank">Rationale</a></td>
                    
                    <td class="TableRowEven" ><a href="/ITILdocs/ITIL/sample papers/ITILv3FoundationSampleB_Rationale_v3.2.pdf" target="_blank">Rationale</a></td>
                   
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
