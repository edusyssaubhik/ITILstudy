
<script src="http://code.jquery.com/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="/js/jquery.divslideshow-1.2-min.js" type="text/javascript"></script>
<style type="text/css">
body
{
	background:#FFF;
}

.best-faculty-scroll
{
	background:url(/images/buttons/test-body-bg.jpg) no-repeat;
	width:225px;
	height:220px;
}

.slide
{
	width:215px;
	height:auto;
	padding-left:5px;
	padding-top:5px;
	font-family: Arial,Helvetica,sans-serif;
    font-size: 9pt;
    color:#333;
	display:block;
}

.title
{
	font-size: 13px;
    font-weight: bold;
	border-bottom:solid 1px #000
	padding-bottom:3px;
	margin-bottom:5px;

	
}

.heading
{
	color: #3399cc;
	font-size: 13px;
    font-weight: bold;
	border-bottom:solid 1px #3399cc;
	padding-bottom:3px;
	margin-bottom:5px;

	
}

.test-text
{
	
}

.sign
{
	
/*	padding-left:120px;*/
	padding-top:6px;
}


</style>

</head>

<body>
<%

Set Rs7 = Server.CreateObject("ADODB.Recordset")
Set Rs6 = Server.CreateObject("ADODB.Recordset")

strQuery7 = "SELECT MAX(Id) as randno FROM ITIL_faculty"

Rs7.Open strQuery7,ConnObj
randno = Rs7("randno")


If randno <>"" Then
Function RandomNumber(LowNumber, HighNumber)
RANDOMIZE
RandomNumber = Round((HighNumber - LowNumber + 1) * Rnd + LowNumber)
End Function
Rno = RandomNumber(1,randno-1)
End If


%>

<% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada"  Then %>
<div class='best-faculty-scroll'>

<%

For id = 1 to randno
%>


<%
strQuery6 = "SELECT id,facultyName,Description,image,feedbackName,company FROM ITIL_faculty where id ='"&Rno&"' And (country = 'US' OR country = 'Canada')"
Rs6.Open strQuery6,ConnObj
If Not Rs6.EOF Then
%>
  <div class="slide">
    <div class="heading"><% = Rs6("facultyName") %></div>
    <div class="test-text">
   <img src="../images/faculty/<% = Rs6("image") %>" align="right" /> <% = Rs6("Description") %>
    </div>
    <div class="sign">
      <b><% = Rs6("feedbackName") %></b><br /><% = Rs6("company") %>
    </div>
    </div>


<%
 End IF
 Rs6.close 
 If Rno = Int(randno) Then
 Rno = 1  
 Else
 Rno = Rno +1 
 End If 
 Next
 

%>

</div>

<% ElseIf (Session("CountryOrigin") = "United Kingdom") Then %>
 <div class="PageTitle"><b>Our Expert Trainers</b></div>
<div class='best-faculty-scroll'>

<%

For id = 1 to randno
%>


<%
strQuery6 = "SELECT id,facultyName,Description,image,feedbackName,company FROM ITIL_faculty where id ='"&Rno&"' And (country = 'United Kingdom')"
Rs6.Open strQuery6,ConnObj
If Not Rs6.EOF Then
%>
  <div class="slide">

    <div class="heading"><% = Rs6("facultyName") %></div>
    <div class="test-text">
   <img src="../images/faculty/<% = Rs6("image") %>" align="right" /> <% = Rs6("Description") %>
    </div>
    <div class="sign">
      <b><% = Rs6("feedbackName") %></b><br /><% = Rs6("company") %>
    </div>
    </div>


<%
 End IF
 Rs6.close 
 If Rno = Int(randno) Then
 Rno = 1  
 Else
 Rno = Rno +1 
 End If 
 Next
 

%>

</div>

<% End If %>

 
<script>
    /* call divSlideShow without parameters */
    //$('.best-faculty-scroll').divSlideShow();

    /* call divSlideShow with parameters */
    $('.best-faculty-scroll').divSlideShow( {width:225, height:230, loop:10, delay:5000, controlClass:'makeblank'} );
</script>


</body>
</html>
