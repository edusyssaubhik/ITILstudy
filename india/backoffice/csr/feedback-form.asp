<%@ LANGUAGE="VBScript"%>
<% 'OPTION EXPLICIT %>
<% 
   If Session("UserId")  = "" Then
     Response.Redirect("../login.asp")
   Else
%>

<%
'======================================================='
 'Written By : Mahima'
 'Last UpaDated: 22/11/2011'
 'Description :'
 'Purpose : Feedback  from the students'
'======================================================='
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title>Feed Back Form</title>
 <link href="/India/css/pagestyle.css" rel="stylesheet" type="text/css"> 
 </head>
<!--#include virtual="/india/connection.asp"-->

<script language="JavaScript" type="text/javascript">
//Calculating The grand total for rating 
var total=0;
var totalCount=0;
function calcTotal(ide, obj) {
var len=document.getElementsByTagName('select').length;
for(var i=0; i<len; i++){

var getID=document.getElementsByTagName('select').item(i).getAttribute('id');
if(getID==ide){
			var selectedValue=parseFloat(document.getElementsByTagName('select').item(i).value); 
			if(selectedValue==0){
			totalCount+=1;
			}
			else{
				totalCount+=0;
				}
				total+=parseFloat(document.getElementsByTagName('select').item(i).value);   
	   }	}
updateTotal(ide, total, totalCount);

total=0
totalCount=0;
}
function updateTotal(a, b, c){
    var len=document.getElementsByTagName('input').length;
for(var i=0; i<len; i++){
var getID=document.getElementsByTagName('input').item(i).getAttribute('id');
if(getID==a){
            b = b/(4-c);
            document.getElementsByTagName('input').item(i).value=b;   
       }
       }
       
    }


  // Javascipt To Dispaly name,emailid,phoneno if your recommending to pmstudy to others 
function update(a){
    if(a.value=='Yes') {
    a.parentNode.getElementsByTagName('div').item('0').style.display="block"
    }
    else
    {
    a.parentNode.getElementsByTagName('div').item('0').style.display="none"
    }
    
}
</script>

<style type="text/css">

.main {
	width: 6256px;
	height: 600px;
	border:solid 1px #ccc;
	
}
#tBody td {
	border: 1px solid #ccc;
}
#tHeader th {
	border: 1px solid #ccc;
}
</style>
 <%
'Declare Variables 
Dim message,courseId,rqCourseId 
Dim strQuery,strQuery1,strQuery2,strQuery4,Rs1,Rs2,Rs3,Rs4
Dim arrAllRecords,firstRow,lastRow,numRows,rowcounter,allNumRows,cnt
Dim arrAllQueries,rqType,rqPage,rqRow,enrollrowcounter
Dim firstName,lastName
Dim enrollfirstRow,enrolllastRow,enrollnumRows
Dim strQuery3,Feedback_Recieved,Course_ID, rqSubmit
Dim arrQueries,feedfirstRow,feedlastRow,feedbackcourseid,lenOfInvoice,Country
Dim rqCity, SrNo,Id,rqEdit
Dim Teacher_Meth,Instructor,OverallProgram,Avg_Rating,Course_Material,TotalCount,Rating
Dim avgCourseMaterial,avgTeacherMeth,AvgInstructor,avgOverallProgram,AverageRating
Dim arrAllproviders,providersNumRows,providersLastRow,providersRowCounter,providersFirstRow 
Dim ArrayRecords,ArrayRecords1,ArrayRecords2,MyArray,strArray,l,k
Dim strCompitetors,strCompitetors1,strCompitetors2
Dim strQuery5,Rs5,rscity,rsstartDate,rsendDate,rsInstructor,MailSent,body,avgeRating,strQuery6,Rs6
Dim Count1,Count2,Count3,Count4,Count5,Count6,Count7,Count8,Count9,Count10,count11
Count1 = 0
Count2 = 0
Count3 = 0
Count4 = 0
Count5 = 0
Count6 = 0
Count7 = 0
Count8 = 0
Count9 = 0
Count10 = 0
count11 = 0





'Serial number'
SrNo = 1


'Session("country") = "India"
Country = Session("country")

'To dispaly the meesage
message = Session("message")
Session("message") = ""
 

 'retive the values 
 
rqSubmit = Request.Form("submit")

 'retrive course id 
If Request.Form("courseId") <> "" then
rqCourseId = Request.Form("courseId")
Else 
rqCourseId = Request.Querystring("courseId")
End If

rqCity = Request.Querystring("City")

'creating record set 
 Set Rs = Server.CreateObject("ADODB.Recordset") 
 Set Rs1 = Server.CreateObject("ADODB.Recordset") 
 Set Rs2 = Server.CreateObject("ADODB.Recordset") 
 Set Rs3 = Server.CreateObject("ADODB.Recordset")
 Set Rs4 = Server.CreateObject("ADODB.Recordset")
 Set Rs5 = Server.CreateObject("ADODB.Recordset")
 Set Rs6 = Server.CreateObject("ADODB.Recordset")
 'query to retrive course details depending on CourseId and today's Date
	strQuery = "SELECT courseId, city, startdate, enddate, coursetype, coursedates,instructor from ITIL_course WHERE country = '"&Country&"' AND  startdate < '"& Now() &"' AND status <> 'Cancelled' order by startdate desc"


  Rs.Open strQuery,Conn	 	
	
	  If Not Rs.EOF Then
		arrAllRecords = Rs.getrows
		Session("arrAllRecords") = arrAllRecords
		firstRow = 0
		lastRow = 9
		numRows = Ubound(arrAllRecords,2)
		If lastRow > numRows Then
		   lastRow = numRows
		End If		
		allNumRows = numRows
	  End If
	  Rs.Close
	  
	  
	 
'Sql Query to Retrive The enrolledusers For particular courseId '
If rqCourseId <> "" Then
   strQuery2 = "SELECT id,firstname,lastname,courseid FROM ITIL_enrolledusers WHERE (checkreceived = 'Yes' OR us_status = 'Active' OR us_status = 'P.O Received' OR us_status = 'Under Process') AND courseid = '"& rqCourseId &"'"
   
      Rs2.Open strQuery2,Conn
   If Not Rs2.EOF Then
      arrAllQueries = Rs2.getRows
      Session("arrAllQueries") = arrAllQueries
      enrollfirstRow = 0
      enrolllastRow = 49
      enrollnumRows = Ubound(arrAllQueries,2)
	  
	  
      If enrolllastRow > enrollnumRows Then
         enrolllastRow = enrollnumRows
      End IF
	 
    End IF
	
strQuery5 ="SELECT courseid,city,startdate,enddate,instructor from ITIL_course where courseid = '"& rqCourseId &"' "

Rs5.Open strQuery5,Conn

 If Not Rs5.EOF Then 

Session("rscity")= Rs5("city")
Session("rsstartDate") = Rs5("startdate")
Session("rsendDate") = Rs5("enddate")
Session("rsInstructor") = Rs5("instructor") 

 End If
Rs5.close
End If
'REsponse.write(rsInstructor)


Dim Other_Training_Providers
'query to retrive competitor
strQuery4 = "select * from ITIL_competitors  WHERE country = '"&Country&"'"

Rs4.Open strQuery4,Conn
  
 If Not Rs4.EOF THen
   arrAllproviders = Rs4.getrows
   providersNumRows = Ubound(arrAllproviders,2)  
  providersFirstRow = 0
  providersLastRow  = providersNumRows
 End If
Rs4.close



%>
 <body><div id="htMap">
 <table  width="100%" border="0" cellpadding="8" cellspacing="0"  class="dbborder" >
 <tr>
   <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% =Session("country") %></span> ITILstudy Back Office</font></div></td>
 </tr>
<p class="Error"><%=message%></p>

<% If rqCity ="" Then %>
  <tr><td valign="top">
  	
  <table>
          
         
        <tr><form name="course" action="feedback-form.asp" method="post"><td><b>Courses:</b></td>
 			<td colspan="5"><select name="CourseId" id="courses" style="width:350px">
             <option value="">-- Select --</option>
             <% If IsArray(arrAllRecords) Then
          		 For rowcounter = firstRow to allNumRows 
				courseId = arrAllRecords(0,rowcounter) 				
			  %>
 				<option <% If Int(rqCourseId) = Int(arrAllRecords(0,rowcounter)) Then %> selected="selected" <% End If %> value="<% = arrAllRecords(0,rowcounter) %>"><% = arrAllRecords(1,rowcounter) %> - <% = FormatDateTime(arrAllRecords(2,rowcounter),1) %>&nbsp;to&nbsp;<% = FormatDateTime(arrAllRecords(3,rowcounter),1) %></option>
         <% Next %>
		
          		<% End If %>
                    
 				</select>
    
      <input type="submit" name="submit" id="submit" value="Submit" /></td>
           </form>  
             
        </tr>
       
      </table>
       
        </td></tr> 
         <% End If %>  
         <% If enrollnumRows <> "" Then %> 
         <tr>
        <td>  
        <!--Table for the feed back -->
		<div id="htMap1" class="main">
<div style="overflow-y:scroll; overflow-x:hidden ">
     <table width="100%" border="0" cellspacing="0" cellpadding="0" id="tHeader" style="display:block; border-collapse:collapse;">
               <tr class="title" height="37px">
              <th rowspan="2" style="width:100px" scope="col">Sr No</th>
			  <th rowspan="2" style="width:200px" scope="col">Name of student</th>
              <th rowspan="2" style="width:150px" scope="col">Feedback Recieved </th>
              <th colspan="5" style="width:650px" scope="col">How did you hear about ITILstudy</th>
			  <th colspan="6" style="width:1250px" scope="col">The following did you do before enrolling for the classroom training?</th>
              <th rowspan="2" style="width:250px" scope="col">Other PMP training course providers considered</th>
              <th colspan ="8" style="width:950px" scope="col">3 most important factors for considering ITILstudy? </th>
              <th rowspan="2" style="width:150px" scope="col">Company reimbursement available for the course</th>
              <th rowspan="2" style="width:100px" scope="col">Rating for course material</th>
              <th rowspan="2" style="width:100px" scope="col">Rating for teaching methodology</th>
              <th rowspan="2" style="width:100px" scope="col">Rating for the instructor</th>
              <th rowspan="2" style="width:100px" scope="col">Rating for the overall programme</th>
              <th rowspan="2" style="width:100px" scope="col">Average Rating</th>
              <th rowspan="2" style="width:250px" scope="col">Enjoyed about class</th>
              <th rowspan="2" style="width:250px" scope="col">Improvement suggestions</th>
              <th rowspan="2" style="width:250px" scope="col">Recommend ITILstudy to others?</th>
			  <th rowspan="2" style="width:250px" scope="col">Name any other certification(s) that you have completed</th>
			  <th rowspan="2" style="width:250px" scope="col">Which other certification(s) you plan to pursue in the near future</th>			  
              <th rowspan="2" style="width:250px" scope="col">Contact person at Organization for corporate class</th>
              <th rowspan="2" style="width:250px" scope="col">Comments</th>
              <th rowspan="2" style="width:100px" scope="col">Submit</th>
              <th rowspan="2" style="width:100px;"  scope="col">Edit</th>
			 <!-- <th rowspan="2" style="width:16px; border-left:none"></th>-->
           </tr> 
                <tr class="title" height="37px">          
             <th style="width:100px" scope="col">From a friend/colleague</th>
          	 <th style="width:100px" scope="col">APMG website </th>
         	 <th style="width:100px" scope="col">Internet Search</th>
         	 <th style="width:100px" scope="col">Magazines</th>
          	 <th style="width:250px" scope="col">Others</th>
			 
		     <th style="width:200px" scope="col">Took ITILstudy Free Test</th>
			 <th style="width:200px" scope="col">Viewed ITILstudy YouTube Videos</th>
			 <th style="width:200px" scope="col">Viewed previous student’s feedback</th>
			 <th style="width:200px" scope="col">Visited ITILstudy on Facebook</th>
			 <th style="width:200px" scope="col">Viewed ITILstudy Twitter updates</th>
			<th style="width:250px" scope="col">Others</th>
			 
          	 <th style="width:100px" scope="col">Course quality</th>
           	 <th style="width:100px" scope="col">Faculty quality</th>
             <th style="width:100px" scope="col">Price</th>
             <th style="width:100px" scope="col">Money-back guarantee</th>
             <th style="width:100px" scope="col">Pass rate </th>
             <th style="width:100px" scope="col">Location proximity</th>
			 <th style="width:100px" scope="col">Free Six Sigma</th>
		     <th style="width:250px" scope="col"> Others</th>
          </tr>
	</table>
			  </div>
		 <div style="overflow-y:scroll; height:300px ; width:100%">
		  <table border="0" cellspacing="0" cellpadding="0"  id="tBody" style="display:block; border-collapse:collapse;">
           <%
            If IsArray(arrAllQueries) Then
            For enrollrowcounter = enrollfirstRow TO enrolllastRow
		   'Sql Query To Retrive values from the table if Enroll_ID and Course_ID eixts 
		    strQuery3 = "SELECT * FROM ITIL_feedbacks WHERE Course_ID = '"&arrAllQueries(3,enrollrowcounter)&"' and Enroll_ID = '"&arrAllQueries(0,enrollrowcounter)&"' "
		  'Response.write(strQuery3)
            Rs3.Open strQuery3,Conn
             If Not Rs3.BOF and Not Rs3.EOF Then
			 Id = Rs3("ID")
		
             %> 
	<tr align="center">     
			           		     
            <td  style="width:100px"><% = SrNo %></td>
            <td style="width:200px"> <% =Rs3("Student_Name")%></td>
            <td style="width:150px"> <% =Rs3("Feedback_Recieved")%><br/><% If  Rs3("Feedback_Recieved") = "Yes" Then%> <% = Rs3("Feedback_RecDate")%><%End If%></td>
             <%
			If Rs3("From_Friend") = "Y" then 
			Count7 = Count7 + 1
			End If			
			%>
            <td style="width:100px"> <% =Rs3("From_Friend")%></td>
             <%
			If Rs3("PMI_Website") = "Y" then 
			Count8 = Count8 + 1
			End If			
			%>
            <td style="width:100px"> <% =Rs3("PMI_Website")%></td>
             <%
			If Rs3("From_Internet") = "Y" then 
			Count9 = Count9 + 1
			End If			
			%>
            <td style="width:100px"> <% =Rs3("From_Internet")%></td>
             <%
			If Rs3("From_Magzines") = "Y" then 
			Count10 = Count10 + 1
			End If			
			%>
            <td style="width:100px"> <% =Rs3("From_Magzines")%></td>
           
            <td style="width:250px"><Textarea name="others" rows="4" cols="25" readonly="readonly"> <% =Rs3("From_Others")%></Textarea></td>
			
			
			<td style="width:200px"> <% =Rs3("Free_Test")%></td>
			<td style="width:200px"> <% =Rs3("YouTube_Videos")%></td>
			<td style="width:200px"> <% =Rs3("prevstud_feedback")%></td>
			<td style="width:200px"> <% =Rs3("Facebook")%></td>
			<td style="width:200px"> <% =Rs3("Twitter_updates")%></td>
			<td style="width:250px"><Textarea name="Othersfeed" rows="4" cols="25" readonly="readonly"> <% =Rs3("Others")%></Textarea></td>
	
            <td style="width:250px"> <% =Rs3("Other_Training_Providers")%></td>
            <%
			If Rs3("Course_Quality") = "Y" then 
			Count1 = Count1 + 1
			End If			
			%>
            <td style="width:100px"> <% =Rs3("Course_Quality")%></td>            
             <% 
			If Rs3("Faculty_Quality") = "Y" then 
			Count2 = Count2 + 1
			End If
			%>
            <td style="width:100px"> <% =Rs3("Faculty_Quality")%></td>            
             <%
			If Rs3("Price") = "Y" then 
			Count3 = Count3 + 1
			End If
			%>
            <td style="width:100px"> <% =Rs3("Price")%></td>            
             <%
			If Rs3("Moneyback_Guarantee") = "Y" then 
			Count4 = Count4 + 1
			End If
			%>
            <td style="width:100px"> <% =Rs3("Moneyback_Guarantee")%></td>            
             <%
			If Rs3("Pass_Rate") = "Y" then 
			Count5 = Count5 + 1
			End If			
			%>
            <td style="width:100px"> <% =Rs3("Pass_Rate")%></td>            
             <% 
			If Rs3("Location_Proximity") = "Y" then 
			Count6 = Count6 + 1
			End If			
			%>
            <td style="width:100px"> <% =Rs3("Location_Proximity")%></td>
			 <% 
			If Rs3("Free_SixSigma") = "Y" then 
			count11 = count11 + 1
			
			End If			
			%>
			<td style="width:100px"> <% =Rs3("Free_SixSigma")%></td>
			<td style="width:250px"> <Textarea name="impFactors_Others" rows="4" cols="25" readonly="readonly"><% =Rs3("impFactors_Others")%></Textarea></td>	
		  
            <td style="width:150px"> <% =Rs3("Company_Reimbursement")%>
            <br/><% If  Rs3("Company_Reimbursement") = "Yes" Then%> <% = Rs3("companyName")%><%End If%>
            </td>
			
            <% If Rs3("Rating_Course_Material") = 0 Then %>
             <td style="width:100px">&nbsp;</td>
            <% Else %>			
            <td style="width:100px"> <% = Rs3("Rating_Course_Material")%></td>
            <% End If%>
			
            <% If Rs3("Rating_Teacher_Meth") = 0 Then %>
             <td style="width:100px">&nbsp;</td>
            <% Else %>
            <td style="width:100px"> <% =Rs3("Rating_Teacher_Meth")%></td>
            <% End If%>
			
             <% If Rs3("Rating_Instructor") = 0 Then %>
             <td style="width:100px">&nbsp;</td>
            <% Else %>           
            <td style="width:100px"> <% =Rs3("Rating_Instructor")%></td>
            <% End If %>
			
            <% If Rs3("Rating_OverallProgram") = 0 Then %>
             <td style="width:100px">&nbsp;</td>
            <% Else %> 
			<td style="width:100px"> <% =Rs3("Rating_OverallProgram")%></td>
            <% End If %>
			
            <% If Rs3("Avg_Rating") = 0 Then %>
             <td style="width:100px">&nbsp;</td>
            <% Else %>
            <td style="width:100px"> <% =Rs3("Avg_Rating")%></td>
            <% End If %>
			
            <td style="width:250px"> <% =Rs3("About_Class")%></td>
            <td style="width:250px"> <% =Rs3("Improvement")%></td>
            <td style="width:250px"> <% =Rs3("Recommended_to_Others")%><br/><% If  Rs3("Recommended_to_Others") = "Yes" Then%> <Textarea name="RO_Comments" rows="4" cols="25" readonly="readonly"><% =Rs3("RO_Comments")%></Textarea><%End If%></td>
			<td style="width:250px"> <Textarea name="Completed_Cert" rows="4" cols="25" readonly="readonly"><% =Rs3("Completed_Cert")%></Textarea></td>
			<td style="width:250px"> <Textarea name="Pursue_Cert" rows="4" cols="25" readonly="readonly"><% =Rs3("Pursue_Cert")%></Textarea></td>			
			
            <td style="width:250px"> <% = Rs3("Coporate_Contact_Person")%><br/><% If  Rs3("Coporate_Contact_Person") = "Yes" Then%> <Textarea name="enjoyedClass" rows="4" cols="25" readonly="readonly"><% =Rs3("CP_Comments")%></Textarea><%End If%></td>
            <td style="width:250px"> <% =Rs3("Comment")%></td>
            <td style="width:100px">&nbsp; </td>
            <td style="width:100px"><a href="feedback-Edit.asp?type=Edit&Id=<% =Id %>">Edit</a></td>
          </tr>
         <%
           'Calculating average for Rating   
		  TotalCount = TotalCount + 1
		 
		  Course_Material = Course_Material + Rs3("Rating_Course_Material")
		  avgCourseMaterial = Round(Course_Material / TotalCount,2)
		  
		  Teacher_Meth = Teacher_Meth + Rs3("Rating_Teacher_Meth")
		  avgTeacherMeth = Round(Teacher_Meth / TotalCount,2)
		   
		  Instructor = Instructor + Rs3("Rating_Instructor")
		  AvgInstructor = Round(Instructor / TotalCount,2)
		  
	      OverallProgram = OverallProgram + Rs3("Rating_OverallProgram")
		  avgOverallProgram = Round(OverallProgram / TotalCount,2)
		  
		  Rating = Rating + Rs3("Avg_Rating")	
	      AverageRating = Round(Rating / TotalCount,2) 
		  Session("AverageRating")	=  AverageRating
		

		  strCompitetors = Rs3("Other_Training_Providers")		
	
		  strCompitetors1 = strCompitetors & ","
		  strCompitetors2 = strCompitetors2 + strCompitetors1
		  'Response.write(strCompitetors2)

       
		  
		 %>
         <% SrNo = Srno + 1 %>
         <% Else 	
		   'if EnrollID doesnot exits in ps_feedback table diplay the form' 
		 %> 
	    <tr align="center">
               <form name="feedback" action="feedback-Recieved.asp" method="post">
               <input type="hidden" name="enrollId"  value="<% = arrAllQueries(0,enrollrowcounter) %>">
               <input type="hidden" name="CourseId"  value="<% = arrAllQueries(3,enrollrowcounter) %>">
              <input type="hidden" name="lastName" value="<% = arrAllQueries(2,enrollrowcounter) %>">
               <input type="hidden" name="firstName" value="<% = arrAllQueries(1,enrollrowcounter) %>">
              <% firstName = arrAllQueries(1,enrollrowcounter) %>
              <% lastName = arrAllQueries(2,enrollrowcounter) %>
            <td style="width:100px"><% = SrNo %></td>
            <td style="width:200px"><% = firstName%>&nbsp;<% = lastName %></td>
            <td style="width:150px"><span id="fdBkdate" style="display:table-row;"> <input type ="radio" name="fback" value="Yes" onclick="update(this)"/>Yes <BR/><input type ="radio" name="fback" value="No" onclick="update(this)"/>No<%' End If %>
        <div style="display:none" id="temp1"> 
       <span id="name">
       Date:<input  name="Feedback_RecDate"  type="text" size="10" style="display:table-row"><br />(YYYY-MM-DD)
       </div></span><br/></td>
			
			<td style="width:100px"><input type ="checkbox" name="friend" value="Y" /></td>
            <td style="width:100px"><input type ="checkbox" name="webSite" value="Y" /></td>
            <td style="width:100px"><input type ="checkbox" name="internet" value="Y" /></td>
            <td style="width:100px"><input type ="checkbox" name="magazines" value="Y" /></td>
            <td style="width:250px"><Textarea name="others" rows="5" cols="25" ></Textarea></td>
			
			 <td style="width:200px"><input type ="checkbox" name="Free_Test" value="Y" /></td>
            <td style="width:200px"><input type ="checkbox" name="YouTube_Videos" value="Y" /></td>
            <td style="width:200px"><input type ="checkbox" name="prevstud_feedback" value="Y" /></td>
            <td style="width:200px"><input type ="checkbox" name="Facebook" value="Y" /></td>
			<td style="width:200px"><input type ="checkbox" name="Twitter_updates" value="Y" /></td>
            <td style="width:250px"><Textarea name="Othersfeed" rows="5" cols="25" ></Textarea></td>
			
			
             <td style="width:250px">
             <select name="other_training"  style="width:143px; height:100px" multiple="multiple"> 

	        <option value="">--Select--</option>
           <% If IsArray(arrAllproviders) Then
	        For providersRowCounter = providersFirstRow to providersLastRow %>
          <option value="<% = arrAllproviders(1,providersRowCounter) %>"><% = arrAllproviders(1,providersRowCounter) %></option>
   	     <% Next
	     End If %>
	  </select>
         </td>
            <td style="width:100px"><input type ="checkbox" name="courseQua" value="Y" /></td>
            <td style="width:100px"><input type ="checkbox" name="facultyQua" value="Y" /></td>
            <td style="width:100px"><input type ="checkbox" name="price" value="Y" /></td>
            <td style="width:100px"><input type ="checkbox" name="moneyBack" value="Y" /></td>
            <td style="width:100px"><input type ="checkbox" name="passRate" value="Y" /></td>
            <td style="width:100px"><input type ="checkbox" name="locproximity" value="Y" /></td>
			<td style="width:100px"><input type ="checkbox" name="Free_SixSigma" value="Y" /></td>
			<td style="width:250px"><Textarea name="impFactors_Others" rows="5" cols="25" ></Textarea></td>
            
              <td style="width:150px"><span id="fdBkdate" style="display:table-row;"><input type ="radio" name="reimbursement" value="Yes" onclick="update(this)"/>Yes <br/><input type ="radio" name="reimbursement" value="No" onclick="update(this)"/> No<br/><input type ="radio" name="reimbursement" value="NA" onclick="update(this)"/> N/A            
               <div style="display:none" id="temp1">  <br/> 
               <span id="name" >
               Company Name:<input  name="companyName"  type="text" size="10" style="display:table-row">


               </span></div>
              </td>
              <td style="width:100px"><select name="ratingCourse"  id="<% = arrAllQueries(0,enrollrowcounter) %>" onchange="calcTotal(this.id, this)">
                <option value="0">Select</option>
                <option value="10">10</option>
                <option value="9">9</option>
                <option value="8">8</option>
                <option value="7">7</option>
                <option value="6">6</option>
                <option value="5">5</option>
                <option value="4">4</option>
                <option value="3">3</option>
                <option value="2">2</option>
                <option value="1">1</option>
              </select></td>
             <td style="width:100px"> <select name="ratingTeaching" id="<% = arrAllQueries(0,enrollrowcounter) %>"  onchange="calcTotal(this.id, this)">
             <option value="0">Select</option>
              <option value="10">10</option>
             <option value="9">9</option>
             <option value="8">8</option>
             <option value="7">7</option>
             <option value="6">6</option>
             <option value="5">5</option>
             <option value="4">4</option>
             <option value="3">3</option>
             <option value="2">2</option>
             <option value="1">1</option>            
             </select></td>
             <td style="width:100px"> <select name="instructor" id="<% = arrAllQueries(0,enrollrowcounter) %>"  onchange="calcTotal(this.id, this)">
             <option value="0">Select</option>
              <option value="10">10</option>
             <option value="9">9</option>
             <option value="8">8</option>
             <option value="7">7</option>
             <option value="6">6</option>
             <option value="5">5</option>
             <option value="4">4</option>
             <option value="3">3</option>
             <option value="2">2</option>
             <option value="1">1</option>            
             </select></td>
             <td style="width:100px"> <select name="overallprgm" id="<% = arrAllQueries(0,enrollrowcounter) %>"  onchange="calcTotal(this.id, this)">
             <option value="0">Select</option>
              <option value="10">10</option>
             <option value="9">9</option>
             <option value="8">8</option>
             <option value="7">7</option>
             <option value="6">6</option>
             <option value="5">5</option>
             <option value="4">4</option>
             <option value="3">3</option>
             <option value="2">2</option>
             <option value="1">1</option>            
             </select></td>
               <td style="width:100px"><input  name="avgRating" id ="<% = arrAllQueries(0,enrollrowcounter) %>" onchange="calculate()" size="5" /></td>
             <td style="width:250px"> <Textarea name="enjoyedClass" rows="5" cols="25" ></Textarea></td>
             <td style="width:250px"> <Textarea name="suggestion" rows="5" cols="25" ></Textarea></td>
  <td style="width:250px"> <span id="feed" style="display:table-row;"> <input type ="radio" name="recommend"  value="Yes" onclick="update(this)"/>Yes <br/><input type ="radio" name="recommend" value="No" onclick="update(this)"/> No
 <!--Div is Enabled  when the ITILstudy course is recommend to others -->
 <div style="display:none" id="temp"> 
<span  id="name" >
   <textarea name="RO_Comments"  rows="5" cols="25" ></Textarea>
    </span>
    </div></span><br/>
 </td>
<td style="width:250px"> <Textarea name="Completed_Cert" rows="5" cols="25" ></Textarea></td>
<td style="width:250px"> <Textarea name="Pursue_Cert" rows="5" cols="25" ></Textarea></td>
  <td style="width:250px"> <span id="feed" style="display:table-row;"> <input type ="radio" name="corporateClass"  value="Yes" onclick="update(this)"/>Yes <br/><input type ="radio" name="corporateClass" value="No" onclick="update(this)"/> No  
 <!--Div is Enabled  when the ITILstudy course is recommend to others -->
 <div style="display:none" id="temp"> 
<span id="name">
   <textarea name="CP_Comments"  rows="5" cols="25" ></Textarea>
    </span>
    </div></span><br/>
 </td>
 
 
 
<td style="width:250px"> <Textarea name="comment" rows="5" cols="25" ></Textarea></td>
<td style="width:100px"><input type= "submit" name="Submit"  value="Submit" /></td>
<td style="width:100px">&nbsp;</td>

 </tr>
 <% SrNo = SrNo + 1 %>
 </form>

 <% End If %>
  
 <% Rs3.close%>
<% Next %>
<% End If %>


<tr align="center" style="height:27px">

<!--Dispalyaing the ratings -->
<td colspan="18" align="right"><b>Average:</b></td>
<td><% = avgCourseMaterial %></td>
<td><% = avgTeacherMeth %></td>
<td><% = AvgInstructor%></td>
<td><% = avgOverallProgram%></td>
<% If AverageRating < 8.5 Then %>
<td align="center"><% = AverageRating %><br/><a href="feedback-Mail.asp?courseid=<% =rqCourseId %>"><span class="Error">Need to be Reported</span></a></td>
<% Else %>
<td align="center"><% = AverageRating %></td>
<% End If %>
</tr></table></div></div>

<table >
<tr><td>
<table cellpadding="8" cellspacing="0" border="1">
<tr><td colspan="2"><b>Count of each Other PMP training course providers</b></td></tr>
<%


If IsArray(arrAllproviders) Then
For providersRowCounter = providersFirstRow to providersLastRow 
ArrayRecords = arrAllproviders(1,providersRowCounter) 
ArrayRecords1 = ArrayRecords&","
ArrayRecords2 = ArrayRecords2 + ArrayRecords1
Next
End If
MyArray = Split(ArrayRecords2,",")

'getting array values from ps_feedback table
strArray = Split(strCompitetors2,",")
Dim No()
ReDim No(providersRowCounter)
For l = 0 To Ubound(MyArray)-1

For k = 0 To Ubound(strArray)-1 
 	
 Select Case MyArray(l)

	Case MyArray(l)
	
	    'comparing two array values
		If MyArray(l) = Trim(strArray(k)) Then
			
		    'if word from array are equal add the count to the variable
			No(l) = No(l) + 1

		End If

End Select

Next %><tr>

<td> <% =MyArray(l) %></td><td><% =Int(No(l)) %></td></tr>

	
<% Next 
%>
</table>
</td><td>&nbsp;</td>
<td>
<table cellpadding="8" cellspacing="0" border="1" >
<tr><td colspan="2"><b>Count of each How did you here about ITILstudy</b></td></tr>
<tr><td>From a friend/colleague</td><td><% =Count7%></td></tr>
<tr><td>PMI website</td><td><% =Count8%></td></tr>
<tr><td>Internet Search</td><td><% =Count9%></td></tr>
<tr><td>Magazines</td><td><% =Count10%></td></tr>
</table></td>
<td>&nbsp;</td>
<td>
<table cellpadding="8" cellspacing="0" border="1" >
<tr><td colspan="2"><b>Count of each important factors for considering ITILstudy</b></td></tr>

<tr><td>Course quality</td><td><% =Count1%></td></tr>
<tr><td>Faculty quality</td><td><% =Count2%></td></tr>
<tr><td>Price</td><td><% =Count3%></td></tr>
<tr><td>Money-back guarantee</td><td><% =Count4%></td></tr>
<tr><td>Pass rate</td><td><% =Count5%></td></tr>
<tr><td>Location proximity</td><td><% =Count6%></td></tr>
<tr><td>Free Six Sigma</td><td><% =count11 %></td></tr>

</table></td></tr>
</table>
     
        <%End If%>
        
 </table>
 </body>
 <% End If%>

