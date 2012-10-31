

function findEmail()

{

var cityname=document.getElementById('Disountvoucher').value;
var ClassType = document.getElementById('ClassType').value;
document.getElementById('txtHint1').style.display="inline";
xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url="getDiscount.asp";
url = url + "?HRID=" + cityname + "&ClassType=" + ClassType;
xmlHttp.onreadystatechange=stateChanged;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
return false;

}

function stateChanged() 
{ 
if (xmlHttp.readyState==4)
{ 

document.getElementById("facebookValidate").style.display = "none";

document.getElementById("txtHint1").innerHTML=xmlHttp.responseText;
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

