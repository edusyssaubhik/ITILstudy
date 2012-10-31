//globals
 var first = "country"; //id of first SELECT
 var second = "location"; //id of second SELECT
 var third = "dates";
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
       childE3.innerHTML = '-- Select City --';

  
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

       //var childE2 = document.createElement('option'); //create option
       //var E2 = document.getElementById(second);
      // E2.appendChild(childE2); //then append it to the second dropdown list
       //childE2.value = 'All';
      // childE2.innerHTML = 'Show All';
	   
       var childE4 = document.createElement('option'); //create option
       var E4 = document.getElementById(third);
       E4.appendChild(childE4); //then append it to the second dropdown list
       childE4.value = 'All';
       childE4.innerHTML = '-- Select City First --';	   
	   
}
 }

 //
 
 /*
 function onReadyState2() {
 //
 var ready2=req2.readyState;
 var data=null;
 if(ready2==4){ //check ready state

    data=req2.responseText; //read response data
   // document.write(data)
    var items = data.split('<br>');
    var length = items.length;

       var childE3 = document.createElement('option'); //create option
       var E3 = document.getElementById(third);
       E3.appendChild(childE3); //then append it to the second dropdown list
       childE3.value = '';
       childE3.innerHTML = '-- Select Dates --';
	   

    for(var i = 0; i < length-1; i++) {
       var childEl = document.createElement('option'); //create option
       var El = document.getElementById(third);
       El.appendChild(childEl); //then append it to the second dropdown list
       childEl.value = items[i];
       childEl.innerHTML = items[i];
    }

       //var childE2 = document.createElement('option'); //create option
       //var E2 = document.getElementById(third);
      // E2.appendChild(childE2); //then append it to the second dropdown list
      // childE2.value = 'All';
      // childE2.innerHTML = 'Show All';
	   
}
 }
*/

 
 //
 function clicked1() {
 //
 var el = document.getElementById(first);
 var ob2=document.getElementById(second);
 var ob3=document.getElementById(third);

 var selected = el.selectedIndex;

 //
 while(ob2.hasChildNodes()) { //removes items from dropdown if some already exist
    ob2.removeChild(ob2.firstChild);
 }

 //
 /*
 while(ob3.hasChildNodes()) { //removes items from dropdown if some already exist
    ob3.removeChild(ob3.firstChild);
 }*/

if(selected!= 0) { //if they choose something other than the first select-->"Select topic first"
    sendRequest1('../getCities.asp?country='+el.options[selected].value);
    ob2.disabled=0;
	//ob3.disabled=0;
 } else { //otherwise add the Select Topic First option and disable it
    var childEl = document.createElement('option');
    ob2.appendChild(childEl);
    childEl.innerHTML = '-- Select City --';
    ob2.disabled=1;
	
	/*
    var childE4 = document.createElement('option');
    ob3.appendChild(childE4);
    childE4.innerHTML = '-- Select Country First --';
    ob3.disabled=1;
	
	*/
	
 }

}

//

/*
 function clicked2() {
 //
 var el = document.getElementById(second);
 var ob2=document.getElementById(third);

 var selected = el.selectedIndex;
 //
 while(ob2.hasChildNodes()) { //removes items from dropdown if some already exist
    ob2.removeChild(ob2.firstChild);
 }

if(selected!= 0) { //if they choose something other than the first select-->"Select topic first"
    sendRequest2('../getDates.asp?city='+el.options[selected].value);
    ob2.disabled=0;
 } else { //otherwise add the Select Topic First option and disable it
    var childEl = document.createElement('option');
    ob2.appendChild(childEl);
    childEl.innerHTML = '-- Select Country First --';
    ob2.disabled=1;
 }

}*/