//globals
 var first = "country"; //id of first SELECT
 var second = "location"; //id of second SELECT

//
 function sendRequest1(url,params,HttpMethod) {
 if(!HttpMethod) { //check if http method is defined, if not, set it to GET
    HttpMethod="GET";
 }
 
 //
 // initialize request object
 req1=null;

if(window.XMLHttpRequest){
    req1=new XMLHttpRequest; //mozilla/safari
 } else if(window.ActiveXObject){
    req1=new ActiveXObject("Microsoft.XMLHTTP"); //internet explorer
 }
 //
 //define callback handler
 if(req1) {
 //
    req1.onreadystatechange=onReadyState1;
    req1.open(HttpMethod,url,true);
    req1.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req1.send(params);
 }
}


//
 function sendRequest2(url,params,HttpMethod) {
 if(!HttpMethod) { //check if http method is defined, if not, set it to GET
    HttpMethod="GET";
 }
 
 //
 // initialize request object
 req2=null;

if(window.XMLHttpRequest){
    req2=new XMLHttpRequest; //mozilla/safari
 } else if(window.ActiveXObject){
    req2=new ActiveXObject("Microsoft.XMLHTTP"); //internet explorer
 }
 //
 //define callback handler
 if(req2) {
 //
    req2.onreadystatechange=onReadyState2;
    req2.open(HttpMethod,url,true);
    req2.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req2.send(params);
 }
}



 //
 function onReadyState1() {
 //
 var ready1=req1.readyState;
 var data=null;
 if(ready1==4){ //check ready state

    data=req1.responseText; //read response data
  // document.write(data)
    var items = data.split('<br>');
    var length = items.length;

       var childE3 = document.createElement('option'); //create option
       var E3 = document.getElementById(second);
       E3.appendChild(childE3); //then append it to the second dropdown list
       childE3.value = '';
       childE3.innerHTML = '-- Select State --';

  
    for(var i = 0; i < length-1; i++) {
       var childEl = document.createElement('option'); //create option
       var El = document.getElementById(second);
       El.appendChild(childEl); //then append it to the second dropdown list
	   
	   myString = items[i];
	   
	   //Split the value
	   var mySplit = myString.split(",");

	   childEl.value = mySplit[0];
       childEl.innerHTML = items[i];
    }

       var childE4 = document.createElement('option'); //create option
       var E4 = document.getElementById(third);
       E4.appendChild(childE4); //then append it to the second dropdown list
       childE4.value = 'All';
       childE4.innerHTML = '-- Select City First --';	   
	   
}
 }

  
 //
 function clicked1() {
 //
 var el = document.getElementById(first);
 var ob2=document.getElementById(second);

 var selected = el.selectedIndex;

 //
 while(ob2.hasChildNodes()) { //removes items from dropdown if some already exist
    ob2.removeChild(ob2.firstChild);
 }


if(selected!= 0) { //if they choose something other than the first select-->"Select topic first"
    sendRequest1('getStates.asp?country='+el.options[selected].value);
    ob2.disabled=0;
	//ob3.disabled=0;
 } else { //otherwise add the Select Topic First option and disable it
    var childEl = document.createElement('option');
    ob2.appendChild(childEl);
    childEl.innerHTML = '-- Select Country --';
    ob2.disabled=1;
	

 }

}

