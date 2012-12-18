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
      <td width="73%" class="PageTitle">Sample Paper<a href="/ITIL/help.asp#APMG-sample-paper" style="float:right; margin-right:20px;"><img src="/images/buttons/Help.png" height="20px" style="border-color:#FFFFFF" onmouseover="this.src='/images/buttons/help_h.png'" onmouseout="this.src='/images/buttons/Help.png'"></a></td>
    </tr>
    <tr>
      <!--#include virtual="/includes/innerLeftMenu.asp"-->
     
      <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><!-- Content Start From Here-->
        <%

Session("QuesNo")=""
Session("TestNo")=""
State = Session("State")
Session("TimeTaken") = ""
Session("MaxQuesNo") = ""

				
						
						
						

%>
                                        
        <table width = "75%" border="0" cellpadding="0" cellspacing="0" class="TableGeneral">
           <tr>
                    <td class="TableRowOdd"><b>Sample paper based on Chapter</b></td>
                    
                  </tr>
				  
				   <tr>
                    <td class="TableRowEven" ><a href="/ServiceOperationDocs/samplepaper/Scenarios.pdf" target="_blank">Scenario</a></td>
                  </tr>
                    <tr>
                    <td class="TableRowEven" ><a href="/ServiceOperationDocs/samplepaper/Sample-Paper-Questions.pdf" target="_blank">Question</a></td>
                    
                  </tr>
                   
                  <tr>
                    <td class="TableRowEven" ><a href="/ServiceOperationDocs/samplepaper/Answer-Rationales.pdf" target="_blank">Answer and Rationale</a></td>
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
