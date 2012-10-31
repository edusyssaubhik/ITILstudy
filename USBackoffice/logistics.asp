<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<% 
	If Session("USBUserId") = "" Then 
		Response.Redirect("login.asp")
	Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'Written By : Bharath'
'Created Date: 26/08/2009'
'Last Updated Date: 26/08/2009'
'Description :'
'Purpose : Show the logistic details'

'Declare The Variables'
Dim rqAction
Dim strStudyMat, strGifts, strMis
Dim objRs, objRs1, objRs2, objRs3, strOrderedGifts

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
Set objRs2 = Server.CreateObject("ADODB.Recordset")
Set objRs3 = Server.CreateObject("ADODB.Recordset")

rqAction = Request.QueryString("action")

strStudyMat = "SELECT top 1 *  FROM ps_studymaterial WHERE added_by = '"& Session("USBUserId") &"' ORDER BY id desc"

objRs.Open strStudyMat, ConnObj

strGifts = "SELECT top 1 *  FROM ps_gifts WHERE added_by = '"& Session("USBUserId") &"' ORDER BY id desc"

objRs1.Open strGifts, ConnObj

strMis = "SELECT top 1 *  FROM ps_miscellaneous WHERE added_by = '"& Session("USBUserId") &"' ORDER BY id desc"

objRs2.Open strMis, ConnObj	

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Logistics</title>

<!-- CSS -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<!--[if IE 6]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie6.css" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie7.css" /><![endif]-->

<!-- JavaScripts-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jNice.js"></script>
<script language="javascript">

/*Phone number validation*/
function validate_number(field,alerttxt)
{
var iChars = "0123456789()";

	with (field)
	{
		for (var i = 0; i < value.length; i++) {
			if (!(iChars.indexOf(value.charAt(i)) != -1)) {
			alert (alerttxt);
			return false;
			}
		}
	}
}

function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}
}  

function Form_Validator(theform)
{

	with (theform)
    {
  
		if (validate_required(workbook,"Please enter the number of Workbooks")==false)
			  {workbook.focus();return false}
			  
 	    if (validate_number(workbook,"Workbook is not a numeral")==false)
 	         {workbook.focus();return false}
			 
		if (validate_required(processChart,"Please enter the number of Process Charts")==false)
			  {processChart.focus();return false}
			  
 	    if (validate_number(processChart,"Process Chart is not a numeral")==false)
 	         {processChart.focus();return false}			 

		if (validate_required(certfolder,"Please enter the number of Certificate Folders")==false)
			  {certfolder.focus();return false}
			  
 	    if (validate_number(certfolder,"Certificate Folder is not a numeral")==false)
 	         {certfolder.focus();return false}				 

		if (validate_required(blankProcessSheet,"Please enter the number of Blank Process Sheets")==false)
			  {blankProcessSheet.focus();return false}
			  
 	    if (validate_number(blankProcessSheet,"Blank Process Sheet is not a numeral")==false)
 	         {blankProcessSheet.focus();return false}
			 
		if (validate_required(pmpChapTest,"Please enter the number of PMP Chapter Tests")==false)
			  {pmpChapTest.focus();return false}
			  
 	    if (validate_number(pmpChapTest,"PMP Chapter Test is not a numeral")==false)
 	         {pmpChapTest.focus();return false}			 

		if (validate_required(pmpFinalTest,"Please enter the number of PMP Final Tests")==false)
			  {pmpFinalTest.focus();return false}
			  
 	    if (validate_number(pmpFinalTest,"PMP Final Test is not a numeral")==false)
 	         {pmpFinalTest.focus();return false}
			 
		if (validate_required(pmpCert,"Please enter the number of PMP Certificates")==false)
			  {pmpCert.focus();return false}
			  
 	    if (validate_number(pmpCert,"PMP Certificate is not a numeral")==false)
 	         {pmpCert.focus();return false}	
			 
		if (validate_required(capmChapTest,"Please enter the number of CAPM Chapter Tests")==false)
			  {capmChapTest.focus();return false}
			  
 	    if (validate_number(capmChapTest,"CAPM Chapter Test is not a numeral")==false)
 	         {capmChapTest.focus();return false}	
			 
		if (validate_required(capmFinalTest,"Please enter the number of CAPM Final Tests")==false)
			  {capmFinalTest.focus();return false}
			  
 	    if (validate_number(capmFinalTest,"CAPM Final Test is not a numeral")==false)
 	         {capmFinalTest.focus();return false}	
			 
		if (validate_required(capmCert,"Please enter the number of CAPM Certificates")==false)
			  {capmCert.focus();return false}
			  
 	    if (validate_number(capmCert,"CAPM Certificate is not a numeral")==false)
 	         {capmCert.focus();return false}	
			 		 		
	if (validate_required(day3Test,"Please enter the number of day 3 testbooks")==false)
			  {day3Test.focus();return false}
			  
 	    if (validate_number(day3Test,"Testbook feild is not a numeral")==false)
 	         {day3Test.focus();return false}
			 
	if (validate_required(day4Eval,"Please enter the number of day 4 evaluation test")==false)
			  {day4Eval.focus();return false}
			  
 	    if (validate_number(day4Eval,"Evaluation test feild is not a numeral")==false)
 	         {v.focus();return false}
			 
	if (validate_required(guidelinePMP,"Please enter the number of guidelines for PMP exam")==false)
			  {guidelinePMP.focus();return false}
			  
 	    if (validate_number(guidelinePMP,"PMP guideline is not a numeral")==false)
 	         {guidelinePMP.focus();return false}
			 
	if (validate_required(feedbackForm,"Please enter the number of Feedback forms")==false)
			  {feedbackForm.focus();return false}
			  
 	    if (validate_number(feedbackForm,"Feedback form is not a numeral")==false)
 	         {feedbackForm.focus();return false} 			 		 		
	}
}		

function Form_Validator1(theform)
{

	with (theform)
    {

		if (validate_required(pens,"Please enter the number of Pens")==false)
			  {pens.focus();return false}
			  
 	    if (validate_number(pens,"Pens is not a numeral")==false)
 	         {pens.focus();return false}	

		if (validate_required(yellow,"Please enter the number of Highlighter Neon Yellow")==false)
			  {yellow.focus();return false}
			  
 	    if (validate_number(yellow,"Highlighter Neon Yellow is not a numeral")==false)
 	         {yellow.focus();return false}		
			 
		if (validate_required(green,"Please enter the number of Highlighter Neon Green")==false)
			  {green.focus();return false}
			  
 	    if (validate_number(green,"Highlighter Neon Green is not a numeral")==false)
 	         {green.focus();return false}	
			 
		if (validate_required(pink,"Please enter the number of Highlighter Neon Pink")==false)
			  {pink.focus();return false}
			  
 	    if (validate_number(pink,"Highlighter Neon Pink is not a numeral")==false)
 	         {pink.focus();return false}	
			 
		if (validate_required(pencil,"Please enter the number of Pencil - Z- Grip")==false)
			  {pencil.focus();return false}
			  
 	    if (validate_number(pencil,"Pencil - Z- Grip is not a numeral")==false)
 	         {pencil.focus();return false}	
			 
		if (validate_required(penHolder,"Please enter the number of Pen Holder")==false)
			  {penHolder.focus();return false}
			  
 	    if (validate_number(penHolder,"Pen Holder is not a numeral")==false)
 	         {penHolder.focus();return false}	
			 
		if (validate_required(calculator,"Please enter the number of Calculator")==false)
			  {calculator.focus();return false}
			  
 	    if (validate_number(calculator,"Calculator is not a numeral")==false)
 	         {calculator.focus();return false}	
			 
		if (validate_required(backpack,"Please enter the number of Backpack Travel")==false)
			  {backpack.focus();return false}
			  
 	    if (validate_number(backpack,"Backpack Travel is not a numeral")==false)
 	         {backpack.focus();return false}	
			 
		if (validate_required(cap,"Please enter the number of Cap")==false)
			  {cap.focus();return false}
			  
 	    if (validate_number(cap,"Cap is not a numeral")==false)
 	         {cap.focus();return false}			
			 
		if (validate_required(sressball,"Please enter the number of Stress Ball")==false)
			  {sressball.focus();return false}
			  
 	    if (validate_number(sressball,"Stress Ball is not a numeral")==false)
 	         {sressball.focus();return false}					  			 		 			 			 			 			 		 
	}
	
}		

function Form_Validator2(theform)
{

	with (theform)
    {

		if (validate_required(visCards,"Please enter the number of Visiting Cards")==false)
			  {visCards.focus();return false}
			  
 	    if (validate_number(visCards,"Visiting Cards is not a numeral")==false)
 	         {visCards.focus();return false}	

		if (validate_required(triFold,"Please enter the number of TriFold Brochers")==false)
			  {triFold.focus();return false}
			  
 	    if (validate_number(triFold,"TriFold Brochers is not a numeral")==false)
 	         {triFold.focus();return false}	

		if (validate_required(onePageFlyer,"Please enter the number of OnePage Flyer")==false)
			  {onePageFlyer.focus();return false}
			  
 	    if (validate_number(onePageFlyer,"OnePage Flyer is not a numeral")==false)
 	         {onePageFlyer.focus();return false}	

 
	}			  
}			  			  
</script>  

</head>

<body>
	<div id="wrapper">
        <!--#include file="includes/topMenu.asp"-->
        <!-- // #end mainNav -->
        
        <div id="containerHolder">
			<div id="container">
        		<div id="sidebar">
                	<!--#include file="includes/leftMenu.asp"-->
                    <!-- // .sideNav -->
                </div>    
                <!-- // #sidebar -->
                
                <!-- h2 stays for breadcrumbs -->
                <h2><a href="home.asp">Home</a> &raquo; <a href="logistics.asp" class="active">Logistics</a> &raquo; <% If rqAction = "studymaterial" Then %>Study material<% ElseIf rqAction = "gifts" Then %>Gifts<% ElseIf rqAction = "miscellaneous" Then %>Miscellaneous<% End If %></h2>
				
                <div id="topbar" style="margin-left:31px;"><ul class="topNav"><li><a href="logistics.asp?action=studymaterial">Study Material</a></li></ul></div>
				<% If Session("CRM_Country") <> "United Kingdom" Then %> 
				<div id="topbar" style="margin-left:-25px;"><ul class="topNav"><li><a href="logistics.asp?action=gifts">Gifts</a></li></ul></div>
				<% End If %>
				<% If Session("TypeOfUser") <> "AEXP" Then %>
                <div id="topbar" style="margin-left: -50px;"><ul class="topNav"><li><a href="logistics.asp?action=miscellaneous">Miscellaneous</a></li></ul></div>
				<% End If %>
				<% If Session("CRM_Country") <> "United Kingdom" Then %> 
				<div id="topbar" style="margin-left: -40px;"><ul class="topNav"><li><a href="logistics.asp?action=recGifts">Gifts Expected</a></li></ul></div>
				<% End If %>
                
                <div id="main">
				<% If rqAction = "studymaterial" Then %>
				<h3>Study Material</h3>
				<% ElseIf rqAction = "gifts" Then %>
				<h3>Gifts</h3>
				<% ElseIf rqAction = "miscellaneous" Then %>
				<h3>Miscellaneous</h3>
				<% Else %>
				<h3>Logistics</h3>
				<% End If %>
				
				<fieldset>    
					 <% If rqAction = "recGifts" Then 
					 
					 	strOrderedGifts = "SELECT top 1 * FROM faculty_shipping_gifts WHERE fac_emailid = '"& Session("USBUserId") &"' ORDER BY shipping_id desc" 
				
					 	objRs3.Open strOrderedGifts, ConnObj

						Do Until objRs3.EOF
					 %>
						<form action="addLogistics.asp" method="post">
						<input type="hidden" name="shipping_id" value="<% = objRs3("shipping_id") %>" />
						<input type="hidden" name="pens" value="<% = objRs3("pens") %>" />
						<input type="hidden" name="high_yellow" value="<% = objRs3("highlighter_yellow") %>" />
						<input type="hidden" name="high_green" value="<% = objRs3("highlighter_green") %>" />
						<input type="hidden" name="pencil" value="<% = objRs3("pencil") %>" />
						<input type="hidden" name="penholder" value="<% = objRs3("pen_holder") %>" />
						<input type="hidden" name="calculator" value="<% = objRs3("calculator") %>" />
						<input type="hidden" name="backpack" value="<% = objRs3("backpack") %>" />
						<input type="hidden" name="cap" value="<% = objRs3("cap") %>" />
						<input type="hidden" name="stressball" value="<% = objRs3("stressball") %>" />
						<input type="hidden" name="postit" value="<% = objRs3("postit_notes") %>" />
						<table border="0" cellpadding="15" cellspacing="10" width="70%">
						  <tr>
							<td width="25%"><b>4 in 1 Pens :</b></td>
							<td width="15%"><% = objRs3("pens") %></td>
							<td width="25%"><b>Highlighter Neon Yellow :</b></td>
							<td width="15%"><% = objRs3("highlighter_yellow") %></td>
						  </tr>
						  <tr>
							<td><b>Highlighter Neon Green :</b></td>
							<td><% = objRs3("highlighter_green") %></td>
							<td><b>Pencil - Z- Grip :</b></td>
							<td><% = objRs3("pencil") %></td>
						  </tr>
						  <tr>
							<td><b>Quick point Pen Holder :</b></td>
							<td><% = objRs3("pen_holder") %></td>
							<td><b>Robot Series Calculator :</b></td>
							<td><% = objRs3("calculator") %></td>
						  </tr>
						  <tr>
						  	<td><b>Backpack Travel :</b></td>
							<td><% = objRs3("backpack") %></td>
							<td><b>Cap :</b></td>
							<td><% = objRs3("cap") %></td>
						  </tr>
						  <tr>
							<td><b>Stress Ball :</b></td>
							<td><% = objRs3("stressball") %></td>
						  	<td><b>Post It Notes :</b></td>
							<td><% = objRs3("postit_notes") %></td>
						  </tr>			
						  <tr>
						  	<td><b>Tracking Number :</b></td><td colspan="3"><% = objRs3("tracking_no") %></td>
						  </tr>
						  <% If IsNull(objRs3("Gifts_Status")) Then %>
						  <tr>
							<td colspan="2">&nbsp;</td>
							<td colspan="2"><input type="submit" name="type" value="Confirm/Update" /></td>
						  </tr>
						  
						  <% End If %>
						  <% objRs3.Movenext
						  	 Loop
							 objRs3.Close %> 
						</table>
						</form>					 
					 <% ElseIf rqAction = "studymaterial" Then %>
					    <% If (Not objRs.BOF) And (Not objRs.EOF) Then 
						   Do Until objRs.EOF %>
						<form name="Logistics" action="addLogistics.asp" method="post" onsubmit="return Form_Validator(this)">
						<table border="0" cellpadding="15" cellspacing="10" width="70%">
						  <tr>
							<td width="25%"><b>Workbook :</b></td>
							<td width="15%"><input type="text" name="workbook" value="<% = objRs("workbook") %>" size="2" /></td>
							<td width="25%"><b>Process Chart :</b></td>
							<td width="15%"><input type="text" name="processChart" value="<% = objRs("processchart") %>" size="2" /></td>
						  </tr>
						  <tr>
							<td><b>Certificate Folder :</b></td>
							<td><input type="text" name="certfolder" value="<% = objRs("certfolder") %>" size="2" /></td>
							<td><b>Blank Process Sheet :</b></td>
							<td><input type="text" name="blankProcessSheet" value="<% = objRs("blankprocesssheet") %>" size="2" /></td>
						  </tr>
						  <tr>
							<td><b>PMP Chapter Test :</b></td>
							<td><input type="text" name="pmpChapTest" value="<% = objRs("pmp_chaptertest") %>" size="2" /></td>
							<td><b>PMP Final Test :</b></td>
							<td><input type="text" name="pmpFinalTest" value="<% = objRs("pmp_finaltest") %>" size="2" /></td>
						  </tr>
						  <tr>
							<td><b>PMP Certificate :</b></td>
							<td><input type="text" name="pmpCert" value="<% = objRs("pmp_certificate") %>" size="2" /></td>
							<td><b>CAPM Chapter Test :</b></td>
							<td><input type="text" name="capmChapTest" value="<% = objRs("capm_chaptertest") %>" size="2" /></td>
						  </tr>
						  <tr>							
							<td><b>CAPM Final Test :</b></td>
							<td><input type="text" name="capmFinalTest" value="<% = objRs("capm_finaltest") %>" size="2" /></td>
							<td><b>CAPM Certificate :</b></td>
							<td><input type="text" name="capmCert" value="<% = objRs("capm_certificate") %>" size="2" /></td>
						  </tr>		
						  <tr>							
							<td><b>Day 3 Testbook :</b></td>
							<td><input type="text" name="day3Test" value="<% = objRs("day3_test") %>" size="2" /></td>
							<td><b>Day 4 Evaluation Test :</b></td>
							<td><input type="text" name="day4Eval" value="<% = objRs("day4_eval") %>" size="2" /></td>
						  </tr>
						  <tr>							
							<td><b>Guidelines for PMP exam :</b></td>
							<td><input type="text" name="guidelinePMP" value="<% = objRs("guidelinePMP") %>" size="2" /></td>
							<td><b>Feedback forms :</b></td>
							<td><input type="text" name="feedbackForm" value="<% = objRs("feedbackForm") %>" size="2" /></td>
						  </tr>		 					  
						  <tr>
							<td colspan="1">&nbsp;</td>
							<td colspan="2"><input type="submit" name="type" value="Add/Edit Study Material" />
							  &nbsp;
							  <input type="reset" name="reset" value="Reset" /></td>
						  </tr>
						</table>
						</form>
						<% objRs.Movenext
						   Loop
						   objRs.Close
						   Else %>
						<form name="Logistics" action="addLogistics.asp" method="post" onsubmit="return Form_Validator(this)">
						<table border="0" cellpadding="15" cellspacing="10" width="45%">
						  <tr>
							<td width="20%"><b>Workbook :</b></td>
							<td width="15%"><input type="text" name="workbook" size="2" /></td>
							<td width="20%"><b>Process Chart :</b></td>
							<td width="5%"><input type="text" name="processChart" size="2" /></td>
						  </tr>
						  <tr>
							<td><b>Certificate Folder :</b></td>
							<td><input type="text" name="certfolder" size="2" /></td>
							<td><b>Blank Process Sheet :</b></td>
							<td><input type="text" name="blankProcessSheet" size="2" /></td>
						  </tr>
						  <tr>
							<td><b>PMP Chapter Test :</b></td>
							<td><input type="text" name="pmpChapTest" size="2" /></td>
							<td><b>PMP Final Test :</b></td>
							<td><input type="text" name="pmpFinalTest" size="2" /></td>
						  </tr>
						  <tr>
							<td><b>PMP Certificate :</b></td>
							<td><input type="text" name="pmpCert" size="2" /></td>
							<td><b>CAPM Chapter Test :</b></td>
							<td><input type="text" name="capmChapTest" size="2" /></td>
						  </tr>
						  <tr>							
							<td><b>CAPM Final Test :</b></td>
							<td><input type="text" name="capmFinalTest" size="2" /></td>
							<td><b>CAPM Certificate :</b></td>
							<td><input type="text" name="capmCert" size="2" /></td>
						  </tr>	
						  <tr>							
							<td><b>Day 3 Testbook :</b></td>
							<td><input type="text" name="day3Test" size="2" /></td>
							<td><b>Day 4 Evaluation Test :</b></td>
							<td><input type="text" name="day4Eval" size="2" /></td>
						  </tr>
						  <tr>							
							<td><b>Guidelines for PMP exam :</b></td>
						<td><input type="text" name="guidelinePMP" size="2" /></td>
							<td><b>Feedback forms :</b></td>
							<td><input type="text" name="feedbackForm" size="2" /></td>
						  </tr>		 							  
						  <tr>
							<td colspan="1">&nbsp;</td>
								<td colspan="2"><input type="submit" name="type" value="Add/Edit Study Material" />
							  &nbsp;
							  <input type="reset" name="reset" value="Reset" /></td>
						  </tr>
						</table>
						</form>						   
						 <%  End If %>
					<% ElseIf rqAction = "gifts" Then %>
					    <% If (Not objRs1.BOF) And (Not objRs1.EOF) Then 
						   Do Until objRs1.EOF %>					
						<form name="Logistics" action="addLogistics.asp" method="post" onsubmit="return Form_Validator1(this)">
						<table border="0" cellpadding="15" cellspacing="10" width="70%">
						  <tr>
							<td width="25%"><b>4 in 1 Pens :</b></td>
							<td width="15%"><input type="text" name="pens" value="<% = objRs1("pen") %>" size="2" /></td>
							<td width="25%"><b>Highlighter Neon Yellow :</b></td>
							<td width="15%"><input type="text" name="yellow" value="<% = objRs1("highlighter_yellow") %>" size="2" /></td>
						  </tr>
						  <tr>
							<td><b>Highlighter Neon Green :</b></td>
							<td><input type="text" name="green" value="<% = objRs1("highlighter_green") %>" size="2" /></td>
							<td><b>Highlighter  Neon Pink :</b></td>
							<td><input type="text" name="pink" value="<% = objRs1("highlighter_pink") %>" size="2" /></td>
						  </tr>
						  <tr>
							<td><b>Pencil - Z- Grip :</b></td>
							<td><input type="text" name="pencil" value="<% = objRs1("pencil") %>" size="2" /></td>
							<td><b>Quick point Pen Holder :</b></td>
							<td><input type="text" name="penHolder" value="<% = objRs1("pen_holder") %>" size="2" /></td>
						  </tr>
						  <tr>
							<td><b>Robot Series Calculator :</b></td>
							<td><input type="text" name="calculator" value="<% = objRs1("calculator") %>" size="2" /></td>
							<td><b>Backpack Travel :</b></td>
							<td><input type="text" name="backpack" value="<% = objRs1("backpack") %>" size="2" /></td>
						  </tr>
						  <tr>							
							<td><b>Cap :</b></td>
							<td><input type="text" name="cap" value="<% = objRs1("cap") %>" size="2" /></td>
							<td><b>Stress Ball :</b></td>
							<td><input type="text" name="sressball" value="<% = objRs1("stressball") %>" size="2" /></td>
						  </tr>			
						  <tr>
						  	<td><b>Post It Notes :</b></td>
							<td><input type="text" name="postit" value="<% = objRs1("postit_notes") %>" size="2" /></td>
						  </tr>			  
						  <tr>
							<td colspan="2">&nbsp;</td>
							<td colspan="2"><input type="submit" name="type" value="Add/Edit Gifts" />
							  &nbsp;
							  <input type="reset" name="reset" value="Reset" /></td>
						  </tr>
						</table>
						</form>
						<% objRs1.Movenext
						   Loop
						   objRs1.Close
						   Else %>	
						<form name="Logistics" action="addLogistics.asp" method="post" onsubmit="return Form_Validator1(this)">
						<table border="0" cellpadding="15" cellspacing="10" width="45%">
						  <tr>
							<td width="30%"><b>4 in 1 Pens :</b></td>
							<td width="15%"><input type="text" name="pens" size="2" /></td>
							<td width="30%"><b>Highlighter Neon Yellow :</b></td>
							<td width="5%"><input type="text" name="yellow" size="2" /></td>
						  </tr>
						  <tr>
							<td><b>Highlighter Neon Green :</b></td>
							<td><input type="text" name="green" size="2" /></td>
							<td><b>Highlighter  Neon Pink :</b></td>
							<td><input type="text" name="pink" size="2" /></td>
						  </tr>
						  <tr>
							<td><b>Pencil - Z- Grip :</b></td>
							<td><input type="text" name="pencil" size="2" /></td>
							<td><b>Quick point Pen Holder :</b></td>
							<td><input type="text" name="penHolder" size="2" /></td>
						  </tr>
						  <tr>
							<td><b>Robot Series Calculator :</b></td>
							<td><input type="text" name="calculator" size="2" /></td>
							<td><b>Backpack Travel :</b></td>
							<td><input type="text" name="backpack" size="2" /></td>
						  </tr>
						  <tr>							
							<td><b>Cap :</b></td>
							<td><input type="text" name="cap" size="2" /></td>
							<td><b>Stress Ball :</b></td>
							<td><input type="text" name="sressball" size="2" /></td>
						  </tr>		
						  <tr>
						  	<td><b>Post It Notes :</b></td>
							<td><input type="text" name="postit" size="2" /></td>
						  </tr>							  				  
						  <tr>
							<td colspan="2">&nbsp;</td>
							<td colspan="2"><input type="submit" name="type" value="Add/Edit Gifts" />
							  &nbsp;
							  <input type="reset" name="reset" value="Reset" /></td>
						  </tr>
						</table>
						</form>
						<% End If %>
					 <% ElseIf rqAction = "miscellaneous" Then %>
					    <% If (Not objRs2.BOF) And (Not objRs2.EOF) Then 
						  Do Until objRs2.EOF %>
						<form name="Logistics" action="addLogistics.asp" method="post" onsubmit="return Form_Validator2(this)">
						<table border="0" cellpadding="15" cellspacing="10" width="70%">
						  <tr>
							<td width="25%"><b>Visiting Cards :</b></td>
							<td width="15%"><input type="text" name="visCards" value="<% = objRs2("visiting_cards") %>" size="2" /></td>
							<td width="25%"><b>Trifold Brochure :</b></td>
							<td width="15%"><input type="text" name="triFold" value="<% = objRs2("trifold") %>" size="2" /></td>
						  </tr>
						  <tr>
							<td><b>Onepage Flyer :</b></td>
							<td><input type="text" name="onePageFlyer" value="<% = objRs2("onepage_flyer") %>" size="2" /></td>
						  </tr>
						  <tr>
							<td colspan="2">&nbsp;</td>
							<td colspan="2"><input type="submit" name="type" value="Add/Edit Miscellaneous" />
							  &nbsp;
							  <input type="reset" name="reset" value="Reset" /></td>
						  </tr>
						</table>
						</form>
						<% objRs2.Movenext
						   Loop
						   objRs2.Close
						   Else
						%>
								
						<form name="Logistics" action="addLogistics.asp" method="post" onsubmit="return Form_Validator2(this)">
						<table border="0" cellpadding="15" cellspacing="10" width="70%">
						  <tr>
							<td width="25%"><b>Visiting Cards :</b></td>
							<td width="15%"><input type="text" name="visCards" size="2" /></td>
							<td width="25%"><b>Trifold Brochure :</b></td>
							<td width="15%"><input type="text" name="triFold" size="2" /></td>
						  </tr>
						  <tr>
							<td><b>Onepage Flyer :</b></td>
							<td><input type="text" name="onePageFlyer" size="2" /></td>
						  </tr>
						  <tr>
							<td colspan="2">&nbsp;</td>
							<td colspan="2"><input type="submit" name="type" value="Add/Edit Miscellaneous" />
							  &nbsp;
							  <input type="reset" name="reset" value="Reset" /></td>
						  </tr>
						</table>
						</form>
						<% End If %>												   					
					<% Else %>
					    <% If (Not objRs.BOF) And (Not objRs.EOF) Then 
						   Do Until objRs.EOF %>
						<table border="0" cellpadding="15" cellspacing="10" width="45%">
						  <tr>
							<td width="20%"><b>Workbook :</b></td>
							<td width="15%"><% = objRs("workbook") %></td>
							<td width="20%"><b>Process Chart :</b></td>
							<td width="5%"><% = objRs("processchart") %></td>
						  </tr>
						  <tr>
							<td><b>Certificate Folder :</b></td>
							<td><% = objRs("certfolder") %></td>
							<td><b>Blank Process sheet :</b></td>
							<td><% = objRs("blankprocesssheet") %></td>
						  </tr>
						  <tr>
							<td><b>PMP Chapter Test :</b></td>
							<td><% = objRs("pmp_chaptertest") %></td>
							<td><b>PMP Final Test :</b></td>
							<td><% = objRs("pmp_finaltest") %></td>
						  </tr>
						  <tr>
							<td><b>PMP Certificate :</b></td>
							<td><% = objRs("pmp_certificate") %></td>
							<td><b>CAPM Chapter Test :</b></td>
							<td><% = objRs("capm_chaptertest") %></td>
						  </tr>
						  <tr>							
							<td><b>CAPM Final Test :</b></td>
							<td><% = objRs("capm_finaltest") %></td>
							<td><b>CAPM Certificate :</b></td>
							<td><% = objRs("capm_certificate") %></td>
						  </tr>	
						   <tr>							
							<td><b>Day 3 Testbook :</b></td>
							<td><% = Int(objRs("day3_test")) %></td>
							<td><b>Day 4 Evaluation Test :</b></td>
							<td><% = Int(objRs("day4_eval")) %></td>
						  </tr>
						  <tr>							
							<td><b>Guidelines for PMP exam :</b></td>
							<td><% = objRs("guidelinePMP") %></td>
							<td><b>Feedback forms :</b></td>
							<td><% = objRs("feedbackForm") %></td>
						  </tr>		 	
						  <tr>
						    <td colspan="4"><a href="logistics.asp?action=studymaterial">Edit Study Materail</a></td>
						  </tr>						  					  
						</table>
						<% objRs.Movenext
						   Loop
						   objRs.Close 
						   
						   Else %>
						   
						   <a href="logistics.asp?action=studymaterial">Add Study Material</a>
						   
						   <% End If %>						   
						   
						   
						   
						 <% If (Not objRs1.BOF) And (Not objRs1.EOF) Then
						    Do Until objRs1.EOF %>
						   
						<table border="0" cellpadding="15" cellspacing="10" width="45%">
						  <tr>
							<td width="30%"><b>4 in 1 Pens :</b></td>
							<td width="15%"><% = objRs1("pen") %></td>
							<td width="30%"><b>Highlighter  Neon Yellow :</b></td>
							<td width="5%"><% = objRs1("highlighter_yellow") %></td>
						  </tr>
						  <tr>
							<td><b>Highlighter  Neon Green :</b></td>
							<td><% = objRs1("highlighter_green") %></td>
							<td><b>Highlighter  Neon Pink :</b></td>
							<td><% = objRs1("highlighter_pink") %></td>
						  </tr>
						  <tr>
							<td><b>Pencil - Z- Grip :</b></td>
							<td><% = objRs1("pencil") %></td>
							<td><b>Quick point Pen Holder :</b></td>
							<td><% = objRs1("pen_holder") %></td>
						  </tr>
						  <tr>
							<td><b>Robot Series Calculator :</b></td>
							<td><% = objRs1("calculator") %></td>
							<td><b>Backpack Travel :</b></td>
							<td><% = objRs1("backpack") %></td>
						  </tr>
						  <tr>							
							<td><b>Cap :</b></td>
							<td><% = objRs1("cap") %></td>
							<td><b>Stress Ball :</b></td>
							<td><% = objRs1("stressball") %></td>
						  </tr>	
						  <tr>
						  	<td><b>Post It Notes :</b></td>
							<td><% = objRs1("postit_notes") %></td>
						  </tr>	
						  <tr>
						    <td colspan="4"><a href="logistics.asp?action=gifts">Edit Gifts Material</td>
						  </tr>				  
						</table>	
						<% objRs1.Movenext
						   Loop
						   objRs1.Close %> 	
						   
						<% Else %>	
						<% If Session("CRM_Country") <> "United Kingdom" Then %> 
						   <br /><br /><a href="logistics.asp?action=gifts">Add Gifts Material</a>
						   <% End If %>
						<% End If %>
						
					    <% If (Not objRs2.BOF) And (Not objRs2.EOF) Then 
						  Do Until objRs2.EOF %>
						<table border="0" cellpadding="15" cellspacing="10" width="45%">
						  <tr>
							<td width="30%"><b>Visiting Cards :</b></td>
							<td width="15%"><% = objRs2("visiting_cards") %></td>
							<td width="30%"><b>Trifold Brochure :</b></td>
							<td width="5%"><% = objRs2("trifold") %></td>
						  </tr>
						  <tr>
							<td><b>Onepage Flyer :</b></td>
							<td><% = objRs2("onepage_flyer") %></td>
						  </tr>
						  <tr>
						    <td colspan="4"><a href="logistics.asp?action=miscellaneous">Edit Miscellaneous</td>
						  </tr>							  
						</table>
						<% objRs2.Movenext
						   Loop
						   objRs2.Close
						%>
						<% Else %>	
						   <br /><br /><a href="logistics.asp?action=miscellaneous">Add Miscellaneous</a>
						<% End If %>
												
					<% End If %> 
                </div>
                <!-- // #main -->
                
                <div class="clear"></div>
            </div>
            <!-- // #container -->
        </div>	
        <!-- // #containerHolder -->
        
        <p id="footer">&nbsp;</p>
    </div>
    <!-- // #wrapper -->
</body>
</html>
<% End If %>