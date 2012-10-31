
var windowWidth;
 var windowHeight; 
 
 getDimension();
 
 function getDimension(){
  
 if (typeof window.innerWidth != 'undefined')
 {
      windowWidth = window.innerWidth,
      windowHeight = window.innerHeight
 }


 else if (typeof document.documentElement != 'undefined'
     && typeof document.documentElement.clientWidth !=
     'undefined' && document.documentElement.clientWidth != 0)
 {
       windowWidth = document.documentElement.clientWidth,
       windowHeight = document.documentElement.clientHeight
 }
 
 else
 {
       windowWidth = document.getElementsByTagName('body')[0].clientWidth,
       windowHeight = document.getElementsByTagName('body')[0].clientHeight
 }
 }


var isClosed=1;
function cancelPopup(){
isClosed=1;
	}
	

//alert(PageName);


	   
// This function runs the below code..
function assignA(){
	var aLength=document.getElementsByTagName('a').length;
	for(var i=0; i<aLength; i++){
		if (document.getElementsByTagName('a').item(i).addEventListener) {
		document.getElementsByTagName('a').item(i).addEventListener("click", cancelPopup, false);
		} 
		else if(document.getElementsByTagName('a').item(i).attachEvent){
			document.getElementsByTagName('a').item(i).attachEvent("onclick", cancelPopup);
		}

	}
	}
	
function assignArea(){
	
	var areaLength=document.getElementsByTagName('area').length;
	for(var i=0; i<areaLength; i++){
		if (document.getElementsByTagName('area').item(i).addEventListener) {
		document.getElementsByTagName('area').item(i).addEventListener("click", cancelPopup, false);
		} 
		else if(document.getElementsByTagName('area').item(i).attachEvent){
			document.getElementsByTagName('area').item(i).attachEvent("onclick", cancelPopup);
		}

	}
	}
function assignInput(){
	
	var InputLength=document.getElementsByTagName('input').length;
	for(var i=0; i<InputLength; i++){
		if (document.getElementsByTagName('input').item(i).addEventListener) {
		document.getElementsByTagName('input').item(i).addEventListener("click", cancelPopup, false);
		} 
		else if(document.getElementsByTagName('input').item(i).attachEvent){
			document.getElementsByTagName('input').item(i).attachEvent("onclick", cancelPopup);
		}

	}
	}
	
	function assignImg(){
	
	var ImgLength=document.getElementsByTagName('img').length;
	for(var i=0; i<ImgLength; i++){
		if (document.getElementsByTagName('img').item(i).addEventListener) {
		document.getElementsByTagName('img').item(i).addEventListener("click", cancelPopup, false);
		} 
		else if(document.getElementsByTagName('img').item(i).attachEvent){
			document.getElementsByTagName('img').item(i).attachEvent("onclick", cancelPopup);
		}

	}
	}
	
var PageName

PageName = location.pathname
if (PageName != "/projstudy-searchresults.asp") {

	window.onbeforeunload = function() { 
	if(isClosed==0){
		document.getElementById('popup').style.height=windowHeight+'px';
	    document.getElementById('popup').style.width=windowWidth+'px';
		document.getElementById('popup').style.visibility="visible"
		return "Check out the new Features"	;
	}
	}
}