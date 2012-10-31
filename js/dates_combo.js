//globals
 var third = "country"; //id of first SELECT
 var fourth = "dates"; //id of second SELECT
 alert(third);
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
 function onReadyState1() {
 //
 var ready=req1.readyState1;
 var data1=null;
 if(ready==4){ //check ready state

    data1=req1.responseText; //read response data
    document.write(data1)
    var items1 = data1.split('<br>');
    var length = items1.length;

       var childE5 = document.createElement('option'); //create option
       var E5 = document.getElementById(fourth);
       E5.appendChild(childE5); //then append it to the fourth dropdown list
       childE5.value = '-- Select Dates --';
       childE5.innerHTML = '-- Select Dates --';
	   
    for(var i = 0; i < length-1; i++) {
       var childE4 = document.createElement('option'); //create option
       var E4 = document.getElementById(fourth);
       E4.appendChild(childE4); //then append it to the fourth dropdown list
       childE4.value = items1[i];
       childE4.innerHTML = items1[i];
    }

       var childE6 = document.createElement('option'); //create option
       var E6 = document.getElementById(fourth);
       E6.appendChild(childE6); //then append it to the fourth dropdown list
       childE6.value = 'All';
       childE6.innerHTML = 'All';
	   
}
 }
 
 //
 function clicked() {
 //
 var e2 = document.getElementById(third);
 var ob3=document.getElementById(fourth);

 var selected1 = e2.selectedIndex;
 //
 while(ob3.hasChildNodes()) { //removes items1 from dropdown if some already exist
    ob3.removeChild(ob3.firstChild);
 }

if(selected1!= 0) { //if they choose something other than the third select-->"Select topic third"
    sendRequest1('../getDates.asp?country='+e2.options[selected1].value);
    ob3.disabled=0;
 } else { //otherwise add the Select Topic third option and disable it
    var childE4 = document.createElement('option');
    ob3.appendChild(childE4);
    childE4.innerHTML = 'Select Country third';
    ob3.disabled=1;
 }
}