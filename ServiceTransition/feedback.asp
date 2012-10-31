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
'Written By : savita'
'Last UpDated : 21/09/2010'
'Description :'
'This Page is Complaint log Page'
'======================================================='

Dim rqAction,objRs1,strRollNo,rqPage ,rqRow, rollNo, rqquery
Dim Country ,City 

   
'Creating the Recordset objects'
SET objRs1 = Server.CreateObject("ADODB.Recordset")

'Retrive the values from this page'
rqAction = Request.QueryString("action")
rqPage = Request.QueryString("page")
rqRow  = Request.QueryString("row")
rollNo = request.form("rollNo")
enrollId = request.form("enrollId")
 rollNo = Session("rollNo")
 enrollId = Session("ID")
rqquery = Request.Form("queryType")
response.Write(rqquery)
'selecting a rollno to enter into the database based on this roll.no
strRollNo = "SELECT rollno FROM PaypalDB where rollno= '"& rollNo &"' "
objRs1.Open strRollNo, ConnObj
'response.Write(strRollNo)
Do Until objRs1.EOF 
		   
   rollNo = objRs1("rollno")
   
objRs1.Movenext
Loop
objRs1.Close
%>

<script type="text/javascript">

				function validate_required(field,alerttxt)
					{
						with (field)
						{
							if (field.value=="")
							  {alert(alerttxt);return false}
							else {return true}
						}
					}
					
					function validate_form(thisform)
					
					{
					   with (thisform)
						 {

						// Check The subject Field Empty Or Not

						if (validate_required(studyguides,"Please Rate Study Guides")=="")
							  {studyguides.focus();return false}
							  
						// Check The complaint Field Empty Or Not

						if (validate_required(studyMethodology,"Please Rate Study Methodology")=="")
							  {studyMethodology.focus();return false}
                     
					 if (validate_required(webInterface,"Please Rate Web Interface")=="")
							  {webInterface.focus();return false}
							  
							 
					if (validate_required(chapterTests,"Please Rate Chapter Tests")=="")
							  {chapterTests.focus();return false}
							  
					if (validate_required(MockTest,"Please Rate Mock Test")=="")
							  {MockTest.focus();return false}
					     }
					 
  						
					
					}
					
		function getoptions(a)
{
	if (a.value !="Course related")
	{
		document.getElementById('op2').style.display="none";

	}
	else
	{
		document.getElementById('op2').style.display="table-row";

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
        <td width="73%" class="PageTitle">Feedback</td>
      </tr>
      <tr>
      
      <!--#include virtual="/includes/innerLeftMenu.asp"-->
      <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
      
      <div style="margin-top:-12px;">
        <!-- Content Start From Here-->
        

    <%  
	
	'Retriving email, name from PaypalDB based on rollno 
	strQuery = "select payer_email, first_name, last_name , address_country,address_city from PaypalDB where rollno= '"& rollNo  &"' "
	objRs1.Open strQuery, ConnObj
	'response.Write(strQuery)
       Do Until objRs1.EOF
	            Email      =  objRs1("payer_email")
		   		FirstName  =  objRs1("first_name")
				LastName   =  objRs1("last_name")
				Country    =  objRs1("address_country")
				City       =  objRs1("address_city")
		   objRs1.Movenext
		   Loop
		   objRs1.Close
	
	 %>
        
      <form name="complaint" action="insertFeedback.asp" method="post" onSubmit="return validate_form(this)">
		<input type="hidden" name="Email" value="<% = Email %>" />
        <input type="hidden" name="FirstName" value="<% = FirstName %>" />
        <input type="hidden" name="LastName" value="<% = LastName %>" />
         <input type="hidden" name="StartDate" value="<% = Session("DateEntered") %>" />
        
 
     <table border="0" cellspacing="10" cellpadding="0" width="100%" >
		 <tr>
        <td><span class="general-bodyBold">Type of course:  </span></td>
        <td>Service Transition online course</td>
        </tr>
        <tr>
        <td><span class="general-bodyBold">Participant Name:  </span></td>
        <td><% = FirstName&"  "& LastName%></td>
        </tr>
		<tr>
        <td><span class="general-bodyBold">Course Medium: </span></td>
        <td>ITILstudy Online CBT Training Course</td>
        </tr>
        
         <tr>
		<td width="30%"><span class="general-bodyBold">Course Dates</span></td>
        </tr>
        <tr>
        <td >Start Date :</td>
         <td ><%=Session("DateEntered")%></td>
  </tr>
  <tr>
         <td >End Date :</td>
         <td><%=date()%></td>
       
        </tr>
        
        <tr>
        <td><span class="general-bodyBold" id="courseType">Location</span></td>
        </tr>
       <tr>
        <td>City:</td>
        <td><input type="text" name="city" id="city" size="20" /></td>
        </tr>
        <tr>
        <td>Country: </td>
        <td><input type="text" name="country" id="country" size="20" /></td>
        </tr>
        

      
        <tr>
        <td><span class="general-bodyBold">Rate the following</span></td>
        </tr>
       <tr>
        <td>Study Guides:</td>
         <td>
         <select name="studyguides">
          <option value="">--Select--</option>
         <option value="1">1</option>
         <option value="2">2</option>
         <option value="3">3</option>
         <option value="4">4</option>
         <option value="5">5</option>
         <option value="6">6</option>
         <option value="7">7</option>
         <option value="8">8</option>
         <option value="9">9</option>
         <option value="10">10</option>
         </select>
    
         (Scale 1 to 10; 10 = Best, 1 = Worst)</td>
        </tr>
        <tr>
         <td >Study Methodology:</td>
         <td><select name="studyMethodology">
          <option value="">--Select--</option>
         <option value="1">1</option>
         <option value="2">2</option>
         <option value="3">3</option>
         <option value="4">4</option>
         <option value="5">5</option>
         <option value="6">6</option>
         <option value="7">7</option>
         <option value="8">8</option>
         <option value="9">9</option>
         <option value="10">10</option>
         </select></td>
        </tr>
         <tr>
         <td >Web Interface:</td>
         <td><select name="webInterface">
          <option value="">--Select--</option>
         <option value="1">1</option>
         <option value="2">2</option>
         <option value="3">3</option>
         <option value="4">4</option>
         <option value="5">5</option>
         <option value="6">6</option>
         <option value="7">7</option>
         <option value="8">8</option>
         <option value="9">9</option>
         <option value="10">10</option>
         </select></td>
        </tr>
         <tr>
         <td >Chapter Tests:</td>
         <td><select name="chapterTests">
          <option value="">--Select--</option>
         <option value="1">1</option>
         <option value="2">2</option>
         <option value="3">3</option>
         <option value="4">4</option>
         <option value="5">5</option>
         <option value="6">6</option>
         <option value="7">7</option>
         <option value="8">8</option>
         <option value="9">9</option>
         <option value="10">10</option>
         </select></td>
        </tr>
       
        <tr>
        <td><span class="general-bodyBold">What did you like about the Course:</span></td>
        <td><textarea name="course" rows="5" cols="20"></textarea></td>
        </tr>
        <tr>
        <td><span class="general-bodyBold">Improvement Opportunities:</span></td>
        <td><textarea name="Improvement" rows="5" cols="20"></textarea></td>
        </tr>
        <tr>
        <td><span class="general-bodyBold">Any other comments:</span></td>
        <td><textarea name="comments" rows="5" cols="20"></textarea></td>
        </tr>
        <tr>
        <td></td>
        <td><input type="Submit" name="type" value="Submit" />
        <input type="reset"  value="Reset" /></td>
        </tr>
        </table>
        </form>
        </td>
        </tr>
        </table>
        </td></tr>
        </table>
<!-- Content End From Here-->
<% End If %>
		<!--#include virtual="/includes/connectionClose.asp"-->
      </div>

<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->