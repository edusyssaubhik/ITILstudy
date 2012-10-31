

/*Function for displaying no of  for open class*/

function findClass(payment){ 
if(payment != 'Paymentforopenclass' || payment != 'Paymentforcorporateclass'){
	document.getElementById('txtHint1').style.display="none";
	document.getElementById('txtHint2').style.display="none";
	}
	else
	{
	document.getElementById('txtHint1').style.display="table-row";
	document.getElementById('txtHint2').style.display="table-row";
	}
	if(payment=='Paymentforcorporateclass' || payment=='Paymentforopenclass') {
	document.getElementById('op3').style.display="none";
	document.getElementById('op4').style.display="none";
	}
	else
	{
	document.getElementById('op3').style.display="table-row";
	document.getElementById('op4').style.display="table-row";
	}
	
if ((document.getElementById('paymentCategory').value == ''))
{
    alert("Please Select the paymentCategory");
	document.getElementById('paymentCategory').focus();
	return(false);
}

xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url="getpaymentCategory.asp";
url=url+"?paymentCategory="+payment;
xmlHttp.onreadystatechange=stateclassChanged;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}


function stateclassChanged() 
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

/*Function for displaying no of  for open class*/

function findPaymentType(CourseID)
{


if ((document.getElementById('first').value == ''))
{
    alert("Please Select the Course");
	document.getElementById('first').focus();
	return(false);
}
document.getElementById('txtHint1').style.display="table-row";
xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
  
var url="getclasses.asp";
url=url+"?CourseID="+CourseID;
xmlHttp.onreadystatechange=stateClass;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}


function stateClass() 
{ 

if (xmlHttp.readyState==4)
{ 
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

/* Function for displaying distance,students and payment for open class */

function getpayment()
{ 
var students=document.getElementById('Students').value;
var distance=document.getElementById('distance').value;

if ((document.getElementById('Students').value == ''))
{
    alert("Please Select the Students");
	document.getElementById('Students').focus();
	return(false);
}

document.getElementById('txtHint1').style.display="table-row";
document.getElementById('txtHint2').style.display="table-row";

if ((document.getElementById('distance').value == ''))
{
    alert("Please Select the payment");
	document.getElementById('distance').focus();
	return(false);
}


if (distance != "")
{
}
	
xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url="getpayment.asp";
url=url+"?students="+students;
url=url+"&distance="+distance;
xmlHttp.onreadystatechange=statepayment;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}


function statepayment() 
{ 
if (xmlHttp.readyState==4)
{ 
document.getElementById("txtHint2").innerHTML=xmlHttp.responseText;
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

 
