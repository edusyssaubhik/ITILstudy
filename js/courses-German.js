var xmlHttp
function Timer(){
	document.getElementById('loader').style.display='none';
	}


function findCity(cityname,CourseName)
{

    //alert("hi");
//alert(CourseName);
var date="";
var fulladdress="";
var RqCourseName = CourseName;

if ((document.getElementById('location').value == ''))
{
    alert("Please Select the City");
	document.getElementById('location').focus();
	return(false);
}

if ((document.getElementById('location').style.display == 'none'))
{
document.getElementById('courses').style.display = 'inline';
} else {
document.getElementById('courses').style.display = 'none';
}

if (cityname != "")
{
	
}
	
xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
  document.getElementById('loader').style.display='block'; 
  var url = "/getCourses-German.asp";
url=url+"?city="+cityname;
url=url+"&Course="+RqCourseName;


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

//   End Of City Function  //

function findDate(date)
{ 

var cityname="";
var fulladdress="";


if ((document.getElementById('dates').value == ''))
{
    alert("Please Select the Dates");
	document.getElementById('dates').focus();
	return(false);
}

if ((document.getElementById('dates').style.display == 'none'))
{
document.getElementById('courses').style.display = 'inline';
} else {
document.getElementById('courses').style.display = 'none';
}


	
xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
  document.getElementById('loader').style.display='block'; 
  var url = "/getCourses-German.asp";
url=url+"?date="+date;
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




