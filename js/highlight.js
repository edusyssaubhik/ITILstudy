// JavaScript Document


pageURL = window.location.pathname;
pathArray = window.location.pathname.split( '/' );
i=pathArray.length-1;
pageName=pathArray[i];
totalPage= new Array();
window.onload=function(){

assignA();	
assignArea();
assignInput();
assignImg();
isClosed=0;
//alert('l')
	}
function highlight(idno){
document.getElementById('lk'+idno).style.color="#11cb3d";
document.getElementById('lk'+idno).setAttribute('class', 'selected')
document.getElementById('lk'+idno).style.backgroundRepeat="no-repeat"
document.getElementById('lk'+idno).style.backgroundPosition="right center"
}
