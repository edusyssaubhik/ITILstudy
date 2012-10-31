<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 'OPTION EXPLICIT %>
<% 
If Session("USBUserId") = "" Then 
	Response.Redirect("login.asp")
Else
%>
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/connection_global.asp"-->
<%
'======================================================='
'Written By : Bharath'
'Last UpDated : 28/04/2011'
'Description :'
'This page is adding calls to the database'
'US BackOffice'
'======================================================='

'Declare the local variables'
Dim strState, objRs, objRs2,strQuery1,arrAllcountries,rqAction
Dim countriesNumRows,countriesFirstRow,countriesLastRow,rqRow,rqPage,strCountry

'Creatting the record set'
Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs2 = Server.CreateObject("ADODB.Recordset")
Set objRsState = Server.CreateObject("ADODB.Recordset")
Set objRsCountry = Server.CreateObject("ADODB.Recordset")

rqAction = Request.QueryString("action")
rqRow  = Request.QueryString("row")
rqPage = Request.QueryString("page")

'Retrive the states'
If (Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada") Then

	strState = "SELECT state, state_code FROM ITIL_city WHERE (country = 'US' OR country = 'Canada') ORDER BY state"

Else

	strState = "SELECT state, state_code FROM ITIL_city WHERE country = '"& Session("CRM_Country") &"' ORDER BY state"

End If

objRs.Open strState,ConnObj


strCountry = "SELECT * FROM CRM_Countries"
	
objRsCountry.Open strCountry, ConnObj


strQuery1 = "SELECT * FROM ITIL_city"

'response.write (strQuery1)

objRs2.Open strQuery1,ConnObj

If Not objRs2.EOF THen
   arrAllcountries = objRs2.getrows
   countriesNumRows = Ubound(arrAllcountries,2)
   countriesFirstRow = 0
  countriesLastRow  = countriesNumRows
End If

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>New Call</title>
<script language="javascript">
 function echeck(str) {

 		var str1 = str.value
 		var at="@"
 		var dot="."
 		var lat=str1.indexOf(at)
 		var lstr=str1.length
 		var ldot=str1.indexOf(dot)
 		if (str1.indexOf(at)==-1){
 		   alert("Invalid E-mail ID")
 		   return false
 		}

 		if (str1.indexOf(at)==-1 || str1.indexOf(at)==0 || str1.indexOf(at)==lstr){
 		   alert("Invalid E-mail ID")
 		   return false
 		}

 		if (str1.indexOf(dot)==-1 || str1.indexOf(dot)==0 || str1.indexOf(dot)==lstr){
 		    alert("Invalid E-mail ID")
 		    return false
 		}


 		 if (str1.indexOf(at,(lat+1))!=-1){
 		    alert("Invalid E-mail ID")
 		    return false
 		 }

 		 if (str1.substring(lat-1,lat)==dot || str1.substring(lat+1,lat+2)==dot){
 		    alert("Invalid E-mail ID")
 		    return false
 		 }

 		 if (str1.indexOf(dot,(lat+2))==-1){
 		    alert("Invalid E-mail ID")
 		    return false
 		 }

 		 if (str1.indexOf(" ")!=-1){
 		    alert("Invalid E-mail ID")
 		    return false
 		 }

		  if (str1.indexOf(",")!=-1){
            alert("Invalid E-mail ID")
            return false
        }      
		
  		 return true
 	} 

/*Phone number validation*/
function validate_number(field,alerttxt)
  {
  	var iChars = "0123456789-()";

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


function Form_Validator(theform)
{




  if (theform.phoneno.value == "")
  {
     alert("Please enter the phone number.");
     theform.phoneno.focus();
     return (false);
  }
  
   if (theform.country.value == "")
  {
     alert("Please select Country.");
     theform.country.focus();
     return (false);
  }
  if (theform.emailid.value == "")
  {
     alert("Please enter the email id.");
     theform.emailid.focus();
     return (false);
  }
  
    with (theform)
  {
 	    if(echeck(emailid)==false)
					 {emailid.focus();return false}
  
  }
  
 

  if (theform.question.value == "")
  {
     alert("Please enter the question.");
     theform.question.focus();
     return (false);
  }



  
}
</script>
<!-- CSS -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<!--[if IE 6]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie6.css" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie7.css" /><![endif]-->
<!-- JavaScripts-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jNice.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/tableH.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/courses.js"></script>
<script type="text/javascript" src="js/combo1.js"></script>
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
      <h2><a href="home.asp">Home</a> &raquo; <a href="MarketingB2C.asp?action=noFollowUp" class="active">Marketing B2C</a> &raquo; New Call</h2>
      <div id="main">
        <p>
        <h3>Add New Call</h3>
        </p>
        <fieldset>
        <table border="1" cellpadding="5" cellspacing="0" align="left" width="45%" class="table2">
          <tr>
            <td><form name="addcalls" action="addNewCall.asp" method="post" onsubmit="return Form_Validator(this)">
                <table border="0" cellpadding="5" cellspacing="0" width="100%">
                  <tr>
                    <td width="20%"><b>For :</b></td>
                    <td width="60%"><input type="radio" name="callfor" value="Classroom" checked="checked" />
                      Classroom&nbsp;
                      <input type="radio" name="callfor" value="Online" />
                      Online &nbsp;
                     </td>
                  </tr>
                  <tr>
                    <td><b>Name :</b></td>
                    <td><input type="text" name="callername" /></td>
                  </tr>
                  <tr>
                    <td><b>Phone Number :</b></td>
                    <td><input type="text" name="phoneno" /></td>
                  </tr>
				
                  <tr>
                    <% If Session("TypeOfUser")="Admin" Then %>
				
                    <td><b>Country </b></td>
                    <td><select name="country" id="country" onChange="clicked1();" style="width:143px;">
                       <option value="">--Select--</option>
                      <% Do Until objRsCountry.EOF %>
                      <% If objRsCountry("Country") <> "Global" Then %>
                      <option value="<% = objRsCountry("Country") %>">
                      <% = objRsCountry("Country") %>
                      </option>
                      <% End If %>
                      <% objRsCountry.Movenext
                       Loop
                       objRsCountry.Close %></select>
                    </td>
                  </tr>
                <tr>
                    <td><b>State</b></td>
					
                  <td><select name="state" id="state" onChange="clicked2();" style="width:143px;">
                        <option value="">--Select--</option>
                      </select></td>
                  </tr>
				  
                  <% ElseIf Session("TypeOfUser")="Faculty" Then
				  	
				   %>
                  <tr>
				   
                   <td><b>State:</b></td>
                    <td><select name="state">
                        <option value="">--Select--</option>
						
                       <% If Session("CRM_Country") = "US" OR Session("CRM_Country") = "Canada" Then %>
				  <optgroup label="US">
                  
                  <%
				strStates = "SELECT states, statecode FROM ps_us_states WHERE country = 'US' ORDER BY states"
				Response.write("Test")
				Response.write(strStates)
				
				objRsState.Open strStates, ConnObj1
				
				Do Until objRsState.EOF %>
                  <option <% If rqState = objRsState("states") Then %> selected="selected" <% End If %> value="<% = objRsState("states") %>">
                  <% = objRsState("states") %>
                  </option>
                  <% objRsState.Movenext
				   Loop
				   objRsState.Close %>
				   </optgroup>
				   <optgroup label="Canada">
                  
                  <%
				strStates = "SELECT states, statecode FROM ps_us_states WHERE country = 'Canada' ORDER BY states"
				
				Response.write(strStates)
				
				objRsState.Open strStates, ConnObj1
				
				Do Until objRsState.EOF %>
                  <option <% If rqState = objRsState("states") Then %> selected="selected" <% End If %> value="<% = objRsState("states") %>">
                  <% = objRsState("states") %>,
                  <% = objRsState("statecode") %>
                  </option>
                  <% objRsState.Movenext
				   Loop
				   objRsState.Close %>
				   </optgroup>
				  
				  <% Else %>
                  
                  <%
				strStates = "SELECT state, state_code From ITIL_city WHERE country = '"& Session("CRM_Country") & "' ORDER BY state"

				Response.write(strStates)
				objRsState.Open strStates, ConnObj
				
				Do Until objRsState.EOF %>
                  <option <% If rqState = objRsState("state") Then %> selected="selected" <% End If %> value="<% = objRsState("state") %>">
                  <% = Trim(objRsState("state")) %>                  </option>
                  <% objRsState.Movenext
				   Loop
				   objRsState.Close %>


				   <% End If %>		   
                </select>
                    <% End If %>
                  <tr>
                     </tr>
                  <tr>
                    <td><b>City :</b></td>
                    <td><input type="text" name="city" />
                    </td>
                  </tr>
                  
                  
                  <tr>
                    <td><b>EmailId :</b></td>
                    <td><input type="text" name="emailid" /></td>
                  </tr>
                  <tr>
                    <td valign="top"><b>Question Asked :</b></td>
                    <td><textarea name="question" rows="7" cols="30"></textarea></td>
                  </tr>
                  <tr>
                    <td valign="top"><b>Comment :</b></td>
                    <td><textarea name="comment" rows="7" cols="30"></textarea></td>
                  </tr>
                  
                  <tr>
                    <td>&nbsp;</td>
                    <td><input type="submit" name="Submit" value="Submit" />
                      &nbsp;
                      <input type="reset" name="reset" value="Reset" /></td>
                  </tr>
                </table>
              </form></td>
          </tr>
        </table>
        </form>
        </td>
        </tr>
        </table>
        </fieldset>
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
<!--#include virtual="/includes/connectionClose.asp"-->
<% End If %>
