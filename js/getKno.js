var xmlHttp

function findChapter(ChapterValue)
{ 

var NoOfQues="";

if ((document.getElementById('KNo').value == ''))
{
    alert("Please Select the Chapter");
	document.getElementById('KNo').focus();
	return(false);
}

if ((document.getElementById('KNo').style.display == 'none'))
{
document.getElementById('Chapter').style.display = 'inline';
} else {
document.getElementById('Chapter').style.display = 'none';
}

if (ChapterValue != "")
{
	
}
	
xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url="/getKNo.asp";
url=url+"?KNo="+ChapterValue;
xmlHttp.onreadystatechange=stateChanged;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}


function stateChanged() 
{ 
if (xmlHttp.readyState==4)
{ 
document.getElementById("txtHint").innerHTML=xmlHttp.responseText;
}
}

function GetXmlHttpObject()
{
var xmlHttp=null;
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
  }
return xmlHttp;
}


function findNoOfQues(Ques)
{ 



if ((document.getElementById('NoofQues').value != '') && (document.getElementById('KNo').value == ''))
{
    alert("Please Select the Chapter and then No. Of question");
	document.getElementById('NoofQues').focus();
	return(false);
}

if ((document.getElementById('NoofQues').style.display == 'none'))
{
document.getElementById('Chapter').style.display = 'inline';
} else {
document.getElementById('Chapter').style.display = 'none';
}

if (Ques != "")
{
	
}
	
xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url="/getKNo.asp";
url=url+"?NoofQues="+Ques;
xmlHttp.onreadystatechange=stateChanged;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}


function stateChanged() 
{ 
if (xmlHttp.readyState==4)
{ 
document.getElementById("txtHint").innerHTML=xmlHttp.responseText;
}
}

function GetXmlHttpObject()
{
var xmlHttp=null;
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
  }
return xmlHttp;
}



