<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerqualitymaterialbanner.html"-->
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
      <td width="73%" class="PageTitle">Practitioner Sample Questions</td>
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
                    
                     <p>The Practitioner sample questions provide the delegates a glimpse of the Practitioner exam questions patterns. And they test not only the delegate’s degree of understanding of the syllabus area but also their ability to apply the concepts to real life examples. <br /><br />
                    The questions can be in the five different formats, they are:<br /><br />
                    <ul type="disc">
                   <li>Classic Multiple Choice Questions – 'choose one from a list of possible options'. </li>
<li>Multiple Response – 'choose two correct options from a list of 5 options'</li> 
<li>Matching – 'link items in one list to items in a second list'</li> 
<li>Sequencing – 'position events in a sequence'</li>
<li>Assertion/Reason – 'evaluate two statements (an assertion and a reason), to determine if either, both or neither is true and, if both are true, whether the reason explains why the 	assertion is true’.. The correct option is provided along with justification and reference.</li>
</ul>


Each answer is given a 'Justification' which enhances the delegate’s understanding of the concept. The delegate can understand why the correct option is correct and why the rest of the options are incorrect.<br /><br />
The 'Reference' directs the delegate to where the concept embodied in the justification can be found in the PRINCE2<sup>&reg;</sup> manual Managing Successful Projects with PRINCE2<sup>&reg;</sup>.<br /><br />

<a href="/projdocs/Practitionerdocs/Practitioner sample questions.doc" target="_blank">Click Here</a> to download practitioner sample questions.
                     </p>

        
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
<!--#include virtual="/includes/footer.html"-->
