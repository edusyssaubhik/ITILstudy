 //globals
 var first = "country"; //id of first SELECT
 var second = "city"; //id of second SELECT
//
 function sendRequest(url,params,HttpMethod) {
 if(!HttpMethod) { //check if http method is defined, if not, set it to GET
    HttpMethod="GET";
 }
 //
 // initialize request object
 req=null;
 if(window.XMLHttpRequest){
    req=new XMLHttpRequest; //mozilla/safari
 } else if(window.ActiveXObject){
    req=new ActiveXObject("Microsoft.XMLHTTP"); //internet explorer
 }
 //
 //define callback handler
 if(req) {
 //
    req.onreadystatechange=onReadyState;
    req.open(HttpMethod,url,true);
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.send(params);
 }
 }
 //
 function onReadyState() {
 //
 var ready=req.readyState;
 var data=null;
 if(ready==4){ //check ready state

    data=req.responseText; //read response data
 //document.write(data)
    var items = data.split('<br>');
    var length = items.length;
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
 function clicked() {

 //
 var el = document.getElementById(first);
 var ob2=document.getElementById(second);
 var selected = el.selectedIndex;
//
 while(ob2.hasChildNodes()) { //removes items from dropdown if some already exist
    ob2.removeChild(ob2.firstChild);
 }
 if(selected!= 0) { //if they choose something other than the first select-->"Select topic first"
    sendRequest('getCities.asp?country='+el.options[selected].value);
    ob2.disabled=0;
 } else { //otherwise add the Select Topic First option and disable it
    var childEl = document.createElement('option');
    ob2.appendChild(childEl);
    childEl.innerHTML = 'Select Country First';
    ob2.disabled=1;
 }
}
