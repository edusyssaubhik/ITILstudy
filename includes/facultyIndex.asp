
<script src="http://code.jquery.com/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="/js/jquery.divslideshow-1.2-min.js" type="text/javascript"></script>
<style type="text/css">
.makeblank {
    display: none;
}
.best-faculty-scroll{
    width:200px;
}
.best-faculty-scroll img.faculty-pic{
    vertical-align:text-top;
    float:right;
    margin:10px 5px 5px 5px;
    }
.best-faculty-scroll span.name{
    color: #3399cc;
    font-family: Arial,Helvetica,sans-serif;
    font-size: 13px;
    font-weight: bold;
    display:block;
    border-bottom:solid 1px #3399cc;
    padding-bottom:4px;
    padding-top:5px;
    }
.best-faculty-scroll span.details{
    margin:5px;
    display:block;
    width:185px;
    margin-top:10px;
    }
.best-faculty-scroll span.comment-by{
    margin:5px;
    display:block;
    margin-left:20px;
    }

.best-faculty-scroll div.slide{
    font-family: Arial,Helvetica,sans-serif;
    font-size: 9pt;
    margin:5px;
    color:#333;
    }
</style>





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
    <span class="name"><% = Rs6("facultyName") %></span>
     <span class="details">
   <img src="../images/faculty/<% = Rs6("image") %>" align="right" /> <% = Rs6("Description") %>
   </span>
  
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


 
<script>
    $('.best-faculty-scroll').divSlideShow( {width:205, height:250, loop:10, delay:5000, controlClass:'makeblank'} );
</script>


