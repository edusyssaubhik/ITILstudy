 //globals
 var first = "country"; //id of first SELECT 
 var second = "state"; //id of second SELECT

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
 function sendRequest3(url,params,HttpMethod) {
 if(!HttpMethod) { //check if http method is defined, if not, set it to GET
    HttpMethod="GET";
 }
 //
 // initialize request object
 req3=null;
 if(window.XMLHttpRequest){
    req3=new XMLHttpRequest; //mozilla/safari
 } else if(window.ActiveXObject){
    req3=new ActiveXObject("Microsoft.XMLHTTP"); //internet explorer
 }
 //
 //define callback handler
 if(req3) {
 //
    req3.onreadystatechange=onReadyState3;
    req3.open(HttpMethod,url,true);
    req3.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req3.send(params);
 }
 }
 //
 
 //

 function onReadyState1() {
 //
 var ready1=req1.readyState;
 var data=null;
 if(ready1==4){ //check ready state

    data=req1.responseText; //read response data

    var items = data.split('<br>');
    var length = items.length;

    var childE2 = document.createElement('option'); //create option	
    var E2 = document.getElementById(second);

	E2.appendChild(childE2); //then append it to the second dropdown list
    childE2.value = "";
    childE2.innerHTML = "--Select--";
	   	
    for(var i = 0; i < length-1; i++) {

       var childEl = document.createElement('option'); //create option
       var El = document.getElementById(second);

       El.appendChild(childEl); //then append it to the second dropdown list
       childEl.value = items[i];
       childEl.innerHTML = items[i];
    }
 }
 }
 //
 
function onReadyState2() {
 //
 var ready2=req2.readyState;
 var data=null;
 if(ready2==4){ //check ready state

    data=req2.responseText; //read response data
    var items = data.split('<br>');
    var length = items.length;

    var childE4 = document.createElement('option'); //create option	
    var E4 = document.getElementById(third);

	E4.appendChild(childE4); //then append it to the second dropdown list
    childE4.value = "";
    childE4.innerHTML = "--Select--";
		
    for(var i = 0; i < length-1; i++) {
       var childEl = document.createElement('option'); //create option
       var El = document.getElementById(third);
       El.appendChild(childEl); //then append it to the third dropdown list
       childEl.value = items[i];
       childEl.innerHTML = items[i];
    }
 }
 }
 //
 
 function onReadyState3() {
 //
 var ready3=req3.readyState;
 var data=null;
 if(ready3==4){ //check ready state

    data=req3.responseText; //read response data
    var items = data.split('<br>');
    var length = items.length;

    var childE6 = document.createElement('option'); //create option	
    var E6 = document.getElementById(forth);

	E6.appendChild(childE6); //then append it to the second dropdown list
    childE6.value = "";
    childE6.innerHTML = "--Select--";
		
    for(var i = 0; i < length-1; i++) {
       var childEl = document.createElement('option'); //create option
       var El = document.getElementById(forth);
       El.appendChild(childEl); //then append it to the third dropdown list
       childEl.value = items[i];
       childEl.innerHTML = items[i];
    }
 }
 }
 //
 
 //
 
  
 function clicked1() {
 //
 
 var el = document.getElementById(first);
 var ob2=document.getElementById(second);
 var selected = el.selectedIndex;
//document.write(selected);

//
 while(ob2.hasChildNodes()) { //removes items from dropdown if some already exist
    ob2.removeChild(ob2.firstChild);
 }
 if(selected!= 0) { //if they choose something other than the first select-->"Select topic first"
    sendRequest1('/USBackoffice/getstates.asp?country='+el.options[selected].value);
    ob2.disabled=0;
 } else { //otherwise add the Select Topic First option and disable it
    var childEl = document.createElement('option');
    ob2.appendChild(childEl);
    childEl.innerHTML = 'Select country First';
    ob2.disabled=1; 
 }
}

//
 /*function clicked2() {
 //

 var el = document.getElementById(second);
 var ob2=document.getElementById(third);
 var selected = el.selectedIndex;
//document.write(selected);
//
 while(ob2.hasChildNodes()) { //removes items from dropdown if some already exist
    ob2.removeChild(ob2.firstChild);
 }
 if(selected!= 0) { //if they choose something other than the first select-->"Select topic first"
    sendRequest2('../getstates.asp?states='+el.options[selected].value);
    ob2.disabled=0;
	//document.write('/hotelbooking/getstates.asp?zone='+el.options[selected].value)
 } else { //otherwise add the Select Topic First option and disable it
    var childEl = document.createElement('option');
    ob2.appendChild(childEl);
    childEl.innerHTML = 'Select state First';
    ob2.disabled=1;
 }
}
*/
