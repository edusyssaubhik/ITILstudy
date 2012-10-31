
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<style type="text/css">
#offer-main {
	height: 170px;
	width: 630px;

}
#feature-row {
	height: 88px;
	width: 100%;
}
.feature {
	width: 126px;
	height: 88px;
	display: block;
	float:left;
	cursor:pointer;
}
#f1 {
	background-image: url(/images/buttons/itil.png);
	background-position: 0px 0px;
}
#f2 {
	background-image: url(/images/buttons/itil.png);
	background-position: 504px 0px;
}
#f3 {
	background-image: url(/images/buttons/itil.png);
	background-position: 378px 0px;
}
#f4 {
	background-image: url(/images/buttons/itil.png);
	background-position: 252px 0px;
}
#f5 {
	background-image: url(/images/buttons/itil.png);
	background-position: 126px 0px;
}

#f1:hover, .selected#f1 {
	background-image: url(/images/buttons/itil-hover.png);
	background-position: 0px 0px;
}
#f2:hover, .selected#f2{
	background-image: url(/images/buttons/itil-hover.png);
	background-position: 504px 0px;
}
#f3:hover, .selected#f3{
	background-image: url(/images/buttons/itil-hover.png);
	background-position: 378px 0px;
}
#f4:hover, .selected#f4{
	background-image: url(/images/buttons/itil-hover.png);
	background-position: 252px 0px;
}
#f5:hover, .selected#f5{
	background-image: url(/images/buttons/itil-hover.png);
	background-position: 126px 0px;
}

#feature-explaned-main {
	position: absolute;
	height: 66px;
	width: 598px;
	border:solid #ccc;
	border-width:0 1px 1px 1px;
	padding:4px 10px 4px 20px;
}
#feature-explaned {
	height: 66px;
	width: 598px;
	
	font-family:Arial,Helvetica,sans-serif;
	font-size: 12px;
	color: #333;
	line-height: 18px;
}
</style>
</head>

<body>
<div id="offer-main">
  <div id="feature-row">
 <span class="feature selected" id="f1" txt="With a very high success rate of 99.2%** in the first attempt, ITILstudy classroom course is the preferred high quality partner for delegates in the ITIL Foundation exam." onMouseOver="toggleAuto(1, 'm')" onMouseOut="toggleAuto(1, 'o')" morelink="/ITIL-Training/Success-Rate.asp"></span>
  <span class="feature" id="f2"  txt="ITILstudy classroom programme is scientifically designed using Accelerated Learning Techniques and ITIL Simulations to ensure that a 2 day program is enough for you to pass the ITIL exam." onMouseOver="toggleAuto(2, 'm')" onMouseOut="toggleAuto(2, 'o')" morelink="/2-Day-ITIL-Training.asp"></span>
   <span class="feature" id="f3"  txt="All our instructors are ITIL and PMP certified with an average project management work experience of 15+ years across industries and an average professional teaching experience of over 1500 hours. View our faculty profiles." onMouseOver="toggleAuto(3, 'm')" onMouseOut="toggleAuto(3, 'o')" morelink="/ITIL-Training/instructors.asp"></span>
  <span class="feature" id="f4"  txt="Our confidence in our quality is reflected by the fact that we are the only ITIL Foundation Training provider in the industry to offer a transparent 100% Money Back Guarantee." onMouseOver="toggleAuto(4, 'm')" onMouseOut="toggleAuto(4, 'o')" morelink="/ITIL-Training/moneyBack.asp"></span>
   <span class="feature" id="f5" txt="ITILstudy conducts several programmes at almost all major cities in the US. Several luxurious and convenient locations where we conduct these 2 Day ITIL Foundation Programmes are listed below." onMouseOver="toggleAuto(5, 'm')" onMouseOut="toggleAuto(5, 'o')" morelink="/locations.asp"></span>

  </div>
  <div id="feature-explaned-main">
  <span id="feature-explaned" onMouseOver="toggleAuto(0, 's')" onMouseOut="toggleAuto(1, 'o')">Please wait<br />Text is loading</span>
    <a id="feature-more-link" href="#"  txt="More" target="_blank">More</a>
  </div>
  </span>
</div>

<script type="text/javascript">
var t;
var lastfN=1;
var autorun=0;
function updatetxt(a){
			var newFeature='f'+a;
			var oldFeature='f'+lastfN;
			 var morelink=document.getElementById(newFeature).getAttribute('morelink')
            if(morelink=='none'){
                document.getElementById('feature-more-link').innerHTML="";                
            }
            else{
			document.getElementById('feature-more-link').innerHTML=document.getElementById('feature-more-link').getAttribute('txt');
            document.getElementById('feature-more-link').setAttribute('href', morelink);            
            }
			document.getElementById(oldFeature).className="feature";
			document.getElementById('feature-explaned').innerHTML=document.getElementById(newFeature).getAttribute('txt');
			document.getElementById(newFeature).className="feature selected"
			lastfN=a;

}

function toggleAuto(a, b){
		if(b=="a"){
			t=setInterval("featureAutoIni(lastfN)", 6000);
		}
		else{
		if(b=='m'){
		clearInterval(t);
		updatetxt(a);
		}
		else{
			if(b=="o"){
			t=setInterval("featureAutoIni(lastfN)", 6000);
				}
				else{
						if(b=="s"){
							clearInterval(t);
							updatetxt(lastfN)
							}
					}
			}
		}
	if(autorun==0){
		}
	}

function featureAutoIni(){
	var tempfN=lastfN
	if(tempfN==5){
	tempfN=0;
	}
	updatetxt(tempfN+1);
	}
updatetxt(lastfN)
toggleAuto(2, 'a')
</script>
</body>
</html>
