 <%@ Language = "VBScript" %>
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
  <script type="text/javascript">
  // Javascipt To Dispaly name,emailid,phoneno if your recommending to pmstudy to others 
function update1(a){
    if(a.value=='Yes') {
    a.parentNode.getElementsByTagName('div').item('0').style.display="block"
    }
    else
    {
    a.parentNode.getElementsByTagName('div').item('0').style.display="none"
    }
    
}
</script>
 <script language ="JavaScript" type="text/javascript">
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

  </script>
<%

Dim Id,rqEdit,Rs4,strQuery4,rqType, Recommend
Dim arrText,intCount,ROName,ROEmailId,ROPhone
Dim arrAllproviders,providersNumRows,providersLastRow,providersRowCounter,providersFirstRow 
Dim Rs5,strQuery5
Dim otherTraining
Dim TrainingProviders,Taining,itm,Array1,Array2,strQuery
Country = Session("country")


Set Rs4 = Server.CreateObject("ADODB.Recordset")
Set Rs5 = Server.CreateObject("ADODB.Recordset")
 
rqType = Request.Querystring("type")
rqEdit = Request.Querystring("Id")

'query To Retrive the value based on Feedback id
strQuery4  = "SELECT * FROM ITIL_feedbacks WHERE Id = '" &rqEdit& "'"
Rs4.Open strQuery4,Conn


'Query To retrive competitor for dropdown to edit
strQuery = "select * from ITIL_competitors WHERE country = '"&Country&"'"
  Rs5.Open strQuery,Conn	 	
	
if (not Rs5.BOF) and (not Rs5.EOF) Then
		Array1 = Rs5.getrows			
 	End If
	  Rs5.Close

Dim firstRow,lastRow,numRows,allNumRows

'split the column Other_Training_Providers to compare with Competitor 
TrainingProviders = Rs4("Other_Training_Providers")
'If TrainingProviders <>"" Then
Array2 = Split(TrainingProviders,",")

firstRow = 0
lastRow = 9
numRows = Ubound(Array2,1)
If lastRow > numRows Then
   lastRow = numRows
End If		
allNumRows = numRows
'End If

%>
 <% If rqType = "Edit"  Then %>      
<body><div id="htMap">
 <table border="1" cellspacing="0" cellpadding="8" class="dbborder" Width="600px" align="center" >
   <form name="course" action="feedback-Recieved.asp" method="post">
        <tr><td colspan="2" class="HeaderLarge">  Edit FeedBack Form</td></tr>
        <input type="hidden" name="ID" value="<% = Rs4("ID") %>" />
        <input type="hidden" name="CourseId" value="<% = Rs4("Course_ID") %>" />
        <input type="hidden" name="enrollId" value="<% = Rs4("Enroll_ID") %>" />   
        <tr><td>Name of student</td><td><input type="text" name="Student_Name" size="30" value="<% = Rs4("Student_Name") %>"></td></tr>
        <tr><td>Feedback Recieved</td>        
        <td>        
        <span id="fdBkdate" style="display:table-row;"><input type ="radio" name="fback" value="Yes" onclick="update1(this)" <% If Rs4("Feedback_Recieved") = "Yes" Then %> checked="checked" <%End If%> value="Yes"/>Yes <BR/><input type ="radio" name="fback" value="No" onclick="update1(this)" <% If Rs4("Feedback_Recieved") = "No" Then %> checked="checked" <%End If%>value="Yes"/>No<br/>
        
        <% If Rs4("Feedback_Recieved") = "Yes" Then %>
        <div style="display:block" id="temp1"> 
       <span id="name" >
       Date:<input  name="Feedback_RecDate"  type="text" size="10" style="display:table-row"  value="<% = Rs4("Feedback_RecDate") %>"><br />(YYYY-MM-DD)
       <% Else%>
       <div style="display:none" id="temp1"> 
       <span id="name" >
        Date:<input  name="Feedback_RecDate"  type="text" size="10" style="display:table-row"  value="<% = Rs4("Feedback_RecDate") %>"><br />(YYYY-MM-DD)
        <%End If%>
       </div></span><br/>      
       </td>
       </tr>
        <tr><td>How did you here about PMstudy</td>
             <td> <input Type="checkbox" name="friend"  <% If Rs4("From_Friend") = "Y" Then %>  checked="checked"<%End If%> value="Y"> From a friend/colleague<br>
                  <input type ="checkbox" name="webSite" <% If Rs4("PMI_Website") = "Y" Then %>  checked="checked"<%End If%> value="Y"> PMI website<br>
                  <input type ="checkbox" name="internet" <% If Rs4("From_Internet") = "Y" Then %>  checked="checked"<%End If%> value="Y">  Internet Search<br>
                  <input type ="checkbox" name="magazines" <% If Rs4("From_Magzines") = "Y" Then %>  checked="checked"<%End If%> value="Y"> Magazines<br>
             
				  Others<br/><Textarea name="others" rows="5" cols="25"><% = Rs4("From_Others") %></Textarea>
             </td>
         </tr>
		   <tr><td>Which of the following did you do before enrolling for the classroom training?</td>
             <td> <input Type="checkbox" name="Free_Test"  <% If Rs4("Free_Test") = "Y" Then %>  checked="checked"<%End If%> value="Y">Took ITILstudy Free Test<br>
                  <input type ="checkbox" name="YouTube_Videos" <% If Rs4("YouTube_Videos") = "Y" Then %>  checked="checked"<%End If%> value="Y">Viewed ITILstudy YouTube Videos<br>
                  <input type ="checkbox" name="prevstud_feedback" <% If Rs4("prevstud_feedback") = "Y" Then %>  checked="checked"<%End If%> value="Y">Viewed previous student’s feedback<br>
                  <input type ="checkbox" name="Facebook" <% If Rs4("Facebook") = "Y" Then %>  checked="checked"<%End If%> value="Y">Visited ITILstudy on Facebook<br>
				   <input type ="checkbox" name="Twitter_updates" <% If Rs4("Twitter_updates") = "Y" Then %>  checked="checked"<%End If%> value="Y">Viewed ITILstudy Twitter updates<br>
				  Others<br/><Textarea name="othersfeed" rows="5" cols="25"><% = Rs4("Others") %></Textarea>
             </td>
         </tr>
<tr><td>Other PMP training course providers considered</td>

<td>
<select name="other_training" multiple="multiple" style="width:143px">
 <option value="">--Select--</option>
 <% If IsArray(Array1) Then %>  
 <% for i = 0 to Ubound(Array1,2) %> 
  <option <% for j = 0 To allNumRows %><% If Array1(1,i) = Trim(Array2(j)) Then %> selected="selected" <% End If %><% Next %> value="<% = Array1(1,i) %>"><% = Array1(1,i) %> </option>    
 <% Next %>
 <% End If%>
</select>
</td>

</tr>
        <tr><td>3 most important factors for considering PMstudy?</td><td>
        <input Type="checkbox" name="courseQua"  <% If Rs4("Course_Quality") = "Y" Then %>  checked="checked"<%End If%> value="Y"> Course quality<br>
        <input Type="checkbox" name="facultyQua"  <% If Rs4("Faculty_Quality") = "Y" Then %>  checked="checked"<%End If%> value="Y"> Faculty quality<br>
        <input Type="checkbox" name="price"  <% If Rs4("Price") = "Y" Then %>  checked="checked"<%End If%> value="Y"> Price<br>
        <input Type="checkbox" name="moneyBack" <% If Rs4("Moneyback_Guarantee") = "Y" Then %>  checked="checked"<%End If%> value="Y"> Money-back guarantee<br>
        <input Type="checkbox" name="passRate" <% If Rs4("Pass_Rate") = "Y" Then %>  checked="checked"<%End If%> value="Y"> Pass rate<br>
        <input Type="checkbox" name="locproximity" <% If Rs4("Location_Proximity") = "Y" Then %>  checked="checked"<%End If%> value="Y"> Location proximity<br/>
		<input Type="checkbox" name="Free_SixSigma" <% If Rs4("Free_SixSigma") = "Y" Then %>  checked="checked"<%End If%> value="Y"> Free Six Sigma<br/>
		Others<br/><Textarea name="impFactors_Others" rows="5" cols="25"><% = Rs4("impFactors_Others") %></Textarea>
		</td></tr>
        
              
       
        <tr><td>Company reimbursement available for the course</td>
            <td><span id="fdBkdate" style="display:table-row;"><input type="radio" name="reimbursement" onclick="update1(this)" <% If Rs4("Company_Reimbursement") = "Yes" Then %> checked="checked" <%End If%> value="Yes"/>Yes<br/>
               <input type="radio" name="reimbursement"  onclick="update1(this)"<% If Rs4("Company_Reimbursement") = "No" Then %> checked="checked"<%End If%> value="No"/>NO<br/>
              <input type="radio" name="reimbursement" onclick="update1(this)" <% If Rs4("Company_Reimbursement") = "NA" Then %> checked="checked"<%End If%> value="NA"/>NA<br/>
               <% If Rs4("Company_Reimbursement") = "Yes" Then %>
        <div style="display:block" id="temp1"><br/> 
       <span id="name" >
      Company Name:<input  name="companyName"  type="text" size="23" style="display:table-row"  value="<% = Rs4("companyName") %>"><br />
       <% Else%>
       <div style="display:none" id="temp1"> 
       <span id="name" >
        Company Name:<input  name="companyName"  type="text" size="23" style="display:table-row"  value="<% = Rs4("companyName") %>"><br />
        <%End If%>
       </div></span><br/>   
          </td>
        </tr>
        <tr><td>Rating for course material</td>
         <td> <select name="ratingCourse" id="<% = Rs4("ID") %>" onchange="calcTotal(this.id, this)">      
            <option value="<% = Rs4("Rating_Course_Material") %>">
                <% = Rs4("Rating_Course_Material") %>
                </option>
             <option value="0">Select </option>
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
             </select>
            </td></tr>
            <tr><td>Rating for teaching methodology</td>
            <td><select name="ratingTeaching" id="<% = Rs4("ID") %>"  onchange="calcTotal(this.id, this)">
                   <option value="<% = Rs4("Rating_Teacher_Meth") %>">
                <% = Rs4("Rating_Teacher_Meth") %>
                </option>
             <option value="0">Select </option>
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
             </select></td></tr>
             
             <tr><td>Rating for the instructor</td>
             <td>
              <select name="instructor" id="<% = Rs4("ID") %>"  onchange="calcTotal(this.id, this)">
                   <option value="<% = Rs4("Rating_Instructor") %>">
                <% = Rs4("Rating_Instructor") %>
                </option>
             <option value="0">Select </option>
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
             </select></td></tr>
             <tr><td>Rating for the overall programme</td>
             <td>
              <select name="overallprgm" id="<% = Rs4("ID") %>"  onchange="calcTotal(this.id, this)">
              
              
                   <option value="<% = Rs4("Rating_OverallProgram") %>">
                <% = Rs4("Rating_OverallProgram") %>
                </option>
             <option value="0">Select </option>
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
             </select></td></tr>
             <tr><td>Average Rating</td>
             <td>
              <input  name="avgRating" id ="<% = Rs4("ID") %>" onchange="calculate()"  readonly="readonly" size="5" value="<% = Rs4("Avg_Rating") %>"/></td></tr>
        <tr><td>Enjoyed about class</td><td><Textarea name="enjoyedClass" rows="5" cols="25"><% = Rs4("About_Class") %></Textarea></td></tr>
        <tr><td>Improvement suggestions</td><td><Textarea name="suggestion" rows="5" cols="25"><% = Rs4("Improvement") %></Textarea></td></tr>
         <tr><td>Recommend ITILStudy to others?</td><td> <span id="feed" style="display:table-row;"> <input type ="radio" name="recommend" onclick="update1(this)"
        <% If Rs4("Recommended_to_Others") = "Yes" Then %> checked="checked" <%End If%> value="Yes"/>Yes <br/><input type ="radio" name="recommend" value="No" onclick="update1(this)"   <% If Rs4("Recommended_to_Others") = "No" Then %> checked="checked" <%End If%> /> No
         <!--Div is Enabled  when the pmstudy course is recommend to others -->
<% If Rs4("Recommended_to_Others") = "Yes" Then %>       
     <div style="display:block" id="temp"> 
     <span  id="name" >
       <textarea name="RO_Comments"  rows="5" cols="25" ><% =Rs4("RO_Comments")%></Textarea>
<% Else %>   
     <div style="display:none" id="temp"> 
     <span  id="name" >
       <textarea name="RO_Comments"  rows="5" cols="25" ><% =Rs4("RO_Comments")%></Textarea>
     
    <% End If%> 
    </span>
        </div></span><br/>
 
 </td></tr>
 <tr><td>	Name any other certification(s) that you have completed</td><td><Textarea name="Completed_Cert" rows="5" cols="25"><% = Rs4("Completed_Cert") %></Textarea></td></tr>
 <tr><td>Which other certification(s) you plan to pursue in the near future</td><td><Textarea name="Pursue_Cert" rows="5" cols="25"><% = Rs4("Pursue_Cert") %></Textarea></td></tr>
 
        <tr><td>Contact person at Organization for corporate class</td>
        <td>
         <span id="feed" style="display:table-row;"> <input type ="radio" name="corporateClass" onclick="update1(this)"
        <% If Rs4("Coporate_Contact_Person") = "Yes" Then %> checked="checked" <%End If%> value="Yes"/>Yes <br/><input type ="radio" name="corporateClass" value="No" onclick="update1(this)"   <% If Rs4("Coporate_Contact_Person") = "No" Then %> checked="checked" <%End If%> /> No
         <!--Div is Enabled  when the pmstudy course is recommend to others -->
<% If Rs4("Coporate_Contact_Person") = "Yes" Then %>       
     <div style="display:block" id="temp"> 
     <span  id="name" >
       <textarea name="Cp_Comments"  rows="5" cols="25" ><% =Rs4("CP_Comments")%></Textarea>
<% Else %>   
     <div style="display:none" id="temp"> 
     <span  id="name" >
       <textarea name="Cp_Comments"  rows="5" cols="25" ><% =Rs4("Cp_Comments")%></Textarea>
     `<%End If%>
        </td></tr>
        <tr><td>Needs to be reported</td>
        <td><Textarea name="comment" rows="5" cols="25"><% = Rs4("Comment") %></Textarea></td></td></tr>
        <tr><td Colspan="2" align="center"><input type= "submit" name="Updatevalue"  value="Update" /></td></tr>
     <% End If %> 
        
             <% End If %> 
        </table> </div>