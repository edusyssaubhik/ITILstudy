<!--#include virtual="/metatags/index_metatag.html"-->
<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innermethodologybanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<% If Session("FirstName") = "" Then 
response.Redirect("/memberlogin.asp")
Else
%>
<!-- Body Starts -->
<% 
'======================================================='
'Written By : Vinaya'
'Last UpDated : 19/08/2011'
'Description :'
'This Page is ITIL Course syllabus Page'
'======================================================='

%>

<script language="JavaScript" type="text/javascript" src="/js/tableH.js"></script>
<style type="text/css">
#myTable0{
	border:#CCC solid 1px;
}

#myTable0 td{
	padding:5px;
	border-top:#CCC solid 1px;
	border-left:#CCC solid 1px;
}

#myTable0 #header td{
	border-top:solid 1px #ccc;
	font:Verdana, Geneva, sans-serif;
	font-size:12px;
	font-weight:bold;
    background-color:#EAEAEA;  
    text-align: center;
    vertical-align: middle;	
	padding:5 0 5 10;
	color:#09C;
}

</style>
<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
    
    <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
    
    <table width="100%" border="0" cellspacing="0" cellpadding="8">
      <tr>
        <td width="2%" class="Header">&nbsp;</td>
        <td width="25%" class="PageTitle">&nbsp;</td>
        <td width="73%" class="PageTitle">minimum time required to complete the ITIL Foundation course </td>
      </tr>
      <tr>
      
      <!--#include virtual="/includes/innerLeftMenu.asp"-->
      <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
      
      <div style="margin-top:-12px;">
        <!-- Content Start From Here-->
         <table border="0" id="myTable0" cellspacing="0" align="center"cellpadding="0" width="80%" class="TableGeneral">
          <tr id="header" >
           <td colspan="2"></td>
          </tr>
          <tr id="header" >
           <td> Course section</td>
           <td> Minimum time required</td>
          </tr>
          <tr id="header">
           <td colspan="2">Chapter 1: Introduction (2 hours)</td>
          </tr>
          <tr>
           <td>Study guide</td>
           <td>60 minutes</td>
          </tr>
          <tr>
           <td>Fill in the blanks</td>
           <td>20 minutes</td>
          </tr>
          <tr>
           <td>Chapter test</td>
           <td>20 minutes</td>
          </tr>
          <tr>
           <td>Evaluation test</td>
           <td>20 minutes</td>
          </tr>           
          <tr id="header">
           <td colspan="2">Chapter 2: Service Strategy (2 hours and 30 minutes)</td>
          </tr>
          <tr>
           <td>Study guide</td>
           <td>90 minutes</td>
          </tr>
          <tr>
           <td>Fill in the blanks</td>
           <td>20 minutes</td>
          </tr>
          <tr>
           <td>Chapter test</td>
           <td>20 minutes</td>
          </tr>
          <tr>
           <td>Evaluation test</td>
           <td>20 minutes</td>
          </tr>           
          <tr id="header">
           <td colspan="2">Chapter 3: Service Design (3 hours)</td>
          </tr>
          <tr>
           <td>Study guide</td>
           <td>2 hours</td>
          </tr>
          <tr>
           <td>Fill in the blanks</td>
           <td>20 minutes</td>
          </tr>
          <tr>
           <td>Chapter test</td>
           <td>20 minutes</td>
          </tr>
          <tr>
           <td>Evaluation test</td>
           <td>20 minutes</td>
          </tr>           
          <tr id="header">
           <td colspan="2">Chapter 4: Service Transistion (3 hours)</td>
          </tr>
          <tr>
           <td>Study guide</td>
           <td>2 hours</td>
          </tr>
          <tr>
           <td>Fill in the blanks</td>
           <td>20 minutes</td>
          </tr>
          <tr>
           <td>Chapter test</td>
           <td>20 minutes</td>
          </tr>
          <tr>
           <td>Evaluation test</td>
           <td>20 minutes</td>
          </tr>           
          <tr id="header">
           <td colspan="2">Chapter 5: Service Operation (3 hours)</td>
          </tr>
          <tr>
           <td>Study guide</td>
           <td>2 hours</td>
          </tr>
          <tr>
           <td>Fill in the blanks</td>
           <td>20 minutes</td>
          </tr>
          <tr>
           <td>Chapter test</td>
           <td>20 minutes</td>
          </tr>
          <tr>
           <td>Evaluation test</td>
           <td>20 minutes</td>
          </tr>           
          <tr id="header">
           <td colspan="2">Chapter 6: Continual Service Improvement (2 hours and 30 minutes)</td>
          </tr>
          <tr>
           <td>Study guide</td>
           <td>90 minutes</td>
          </tr>
          <tr>
           <td>Fill in the blanks</td>
           <td>20 minutes</td>
          </tr>
          <tr>
           <td>Chapter test</td>
           <td>20 minutes</td>
          </tr>
          <tr>
           <td>Evaluation test</td>
           <td>20 minutes</td>
          </tr>           
          <tr id="header">
           <td colspan="2">APMG Sample Papers and Mock Test (3 hours) </td>
          </tr>
		  <tr>
           <td>APMG Sample Papers </td>
           <td>2 hours</td>
          </tr>
          <tr>
           <td>Mock Test</td>
           <td>1 hours</td>
          </tr>
          
          </table> 
          <p>Total hours required to complete the course is <b>19hrs</b>.</p>     
        </td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
  <!-- Content End From Here-->
 <% End If %>
<!--#include virtual="/includes/connectionClose.asp"-->
</div>

<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->