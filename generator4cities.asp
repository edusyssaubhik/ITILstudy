<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<script language="javascript" type="text/javascript">
<!--

function popitup(url) {
	newwindow=window.open(url,'name','toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=0,minimizable=0,resizable=0,height=300,width=300,top=250,left=400');
	if (window.focus) {newwindow.focus()}
	return false;
}

// -->
<!--  PROJstudy -->
</script>
<html>

<title>Generator</title>
<%
Dim countries

countries = Request.form("Country")
Session("CountryOrigin") = countries
%>
<body>
<% if countries = ""Then %>
<table>
<form method="post" action="generator4cities.asp" onSubmit="return validate_form(this))">
<tr>
<td colspan="2"><h2>Generator</h2></td>
</tr>
<tr>
<td>Select Country : </td>
<td><select name="Country" >
<option id="">----Select-----</option>
<option id="UK">United Kingdom</option>
<option id="India">India</option>
<option id="US">US</option>
<option id="Canada">Canada</option>
</select>
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="submit" name="Submit" value="Generate"></td>
</tr>
</form>
</table>
<% Else %>

<%

'Varaible declaration

Dim rsQues
Dim Ques
Dim strQuery,strQuery1
Dim fsoObject
Dim tsObject
Dim SrNo,strEnding,s_date,Queses,iCount,e_date,s_hour,s_min,s_sess,e_hour,e_min,e_sess, ptax,C_id


'Initialising counts
SrNo = 1

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "/", "_")
End Function
Function StrQuoteReplace1(strValue)
   StrQuoteReplace1 = Replace(strValue, " ", "-")
End Function

'initialising record set
Set rsQues = Server.CreateObject("ADODB.Recordset")

'query for retriving values from database
strQuery ="select city,cityid,state_code from ITIL_city where country = '"&countries&"'  order by cityid asc"
rsQues.Open strQuery,ConnObj

'loop starts from here
Do until  rsQues.EOF 

  City = Trim(rsQues("city"))
   Statecode = Trim(rsQues("state_code"))

   

'Constructing Page and keeping in  string.
'==================================================Page==================================================================== 

strEnding  = "<head><meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"" /><link rel=""shortcut icon"" href=""/images/buttons/icontitle.jpg""><title>ITIL Training "&City&" | ITIL Certification Training in "&City&" - ITILstudy</title><META content=""ITIL  "&City&", ITIL training  "&City&",  ITIL certification "&City&", ITIL  certiffication training "&City&",ITIL  boot camp "&City&",  ITIL  training in "&City&" ,  ITIL  certification in "&City&" , ITIL classes "&City&"."" name=keywords><META content=""ITIL Training in "&City&" | ITILstudy - The Global Leader for ITIL Certification Training Provides High Quality Courses for ITIL. We have Highest Pass Rates and trusted by 3500+ Companies and 160+ Countries across Globe and we Conduct Corporate ITIL Classes in "&City&"."" name=description></meta><!--#include virtual=""/metatags/dates_location_metetag.html""--><!--#include virtual=""/includes/headermeta.asp""--><!--#include virtual=""/includes/innermethodologybanner.html""--><script language=""javascript"" type=""text/javascript"">function popitup(url) { newwindow=window.open(url,'name','toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=0,minimizable=0,resizable=0,height=300,width=300,top=250,left=400');if (window.focus) {newwindow.focus()}return false;}</script><% countries = """& countries &""" %"& "" &"><br><% City = """& City &""" %"& "" &"><div><table width=""930"" border=""0"" align=""center"" cellpadding=""0"" cellspacing=""0""><tr><td height=""235"" align=""left"" valign=""top"" bgcolor=""#FFFFFF""><table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""8""><tr><td width=""2%"" class=""Header"">&nbsp;</td><td width=""25%"" class=""PageTitle"">&nbsp;</td><td width=""73%"" class=""breadcrumb""><a href=""/index.asp"" title=""Home"">Home</a> &raquo; COURSES / ENROL &raquo; Classroom Courses In "&City&" </tr><tr><!--#include virtual=""./includes/innerLeftMenu.asp""--><td width=""73%"" rowspan=""4"" background=""/images/back/left_line.jpg"" class=""general-body""><div style=""margin-top:-12px; width:95%;""><span class=""PageTitle"">ITIL<Sup>&reg;</sup> Foundation CLASSES - DATES, LOCATIONS AND PRICES In "&City
If Statecode <> "" Then 
strEnding  = strEnding  &", "& Statecode
End If
strEnding  = strEnding  &"</span><br /><br />"
strEnding  = strEnding  &"<span class=""Header"">ITILstudy ITIL Foundation classroom program includes:</span>"

strEnding  = strEnding  &"<!--#include virtual=""includes/getCoursetextforSEO.asp""-->"  

strEnding  = strEnding  &"</div><div><br><table width=""97%"" border=""0"" onMouseOut=""javascript:highlightTableRowVersionA(0);"" id=""myTable0"" cellpadding=""3"" cellspacing=""0"" class=""TableGeneral""><tr id=""courses"" style=""display:block;""><td colspan=""8""><table border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td class=""TableRowOdd"" width=""100px""><span class=""HeaderLarge"">Location</span></td><td class=""TableRowOdd"" width=""100px""><span class=""HeaderLarge"">Dates</span></td><td class=""TableRowOdd"" width=""150px""><span class=""HeaderLarge"">Timing</span></td><td class=""TableRowOdd"" width=""140px""><span class=""HeaderLarge"">Price</span></td><td class=""TableRowOdd"" width=""100px"">&nbsp;</td></tr>"

'Table retriving from database.
strEnding  = strEnding  &"<!--#include virtual=""/includes/getITILClassesforSEO.asp""-->"

'ending footer
strEnding= strEnding &"</tr><tr><td colspan=""6"" class=""TableRowEven"">&nbsp;</td></tr></table></td></tr><tr><td colspan=""8"" id=""txtHint"" width=""100%""></td></tr></table></div><br /><div><span class=""Required"">*</span> : Price after early bird discount (if you enroll more than "& CourseApplicableDays &" days before the course start date, and if seats are available)</div><br>"
If Session("CountryOrigin") = "US" Then
strEnding= strEnding &"<div><span class=""Required"">**</span> : All Texas residents should be sponsored by an employer, and should provide the employer details while enrolling to ITILstudy course.</div>"
End If
strEnding= strEnding &"<p><a href=""/enrollClass.asp"" class=""Header"">Enroll in ITILstudy "& Country &" classroom training </a> </p><div></td></tr></table></div><!--#include virtual=""/includes/footer.html""-->"

'Initialing filesystem object 	
Set fsoObject=Server.CreateObject ("Scripting.FileSystemObject")

'Creating a text file using file systm object.
'Set tsObject = fsoObject.CreateTextFile("c:\inetpub\wwwroot\Cities\"&StrQuoteReplace(City)&"_"&Trim(countries)&".asp")
Set tsObject = fsoObject.CreateTextFile("E:\vhosts\ITILstudy.com\httpdocs\Cities\ITILstudy-Training-"&StrQuoteReplace(StrQuoteReplace1(City))&"-"&StrQuoteReplace1(Trim(countries))&".asp")


'Witing the string containing question format into an asp file using file system object.
tsObject.Write strEnding

strEnding  =  ""
 

%>


<br/><% = SrNo %> : ITILstudy-Training-<% = StrQuoteReplace1(City) %>-<% = StrQuoteReplace1(countries) %>.asp created<BR>


<%
'Increment countofsim which is used as a questionno while creating text files.

SrNo = SrNo + 1
rsQues.movenext
Loop

%>

<% End if %>
</body>
</html>
