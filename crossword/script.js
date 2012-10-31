// JavaScript Document
// This application is written by brijesh for Edusys Services
// Created 10-10-2011 
// Modified 14-9-12 - Fixed major bugs 

 var selected="";
 var ansa=new Array();
 var hnt=new Array()
 var logger;
hnt['row1']=new Array('A sub-set of the Change Advisory Board who make decisions about high impact Emergency Changes', 'Across', 4);
 hnt['row2']=new Array('Something that is measured and reported to help manage a Process, IT Service or Activity', 'Across', 6);
 hnt['row3']=new Array('Fit for Purpose', 'Across', 7);
 hnt['row4']=new Array('A warning that a threshold has been reached', 'Across', 5);
 hnt['row5']=new Array('A four stage cycle for Process management, attributed to Edward Deming', 'Across', 4);
 hnt['row6']=new Array('Ensuring that Policies and Strategy are actually implemented', 'Across', 10);
 hnt['row7']=new Array('An unplanned interruption to an IT Service or a reduction in the Quality of an IT Service', 'Across', 8);
hnt['col1']=new Array('Intangible Assets of an Organisation', 'Down', 10)
 hnt['col2']=new Array('A team or group of people and the tools they use to carry out one or more Processes or Activities', 'Down', 8)
 hnt['col3']=new Array('A set of Best Practice guidance for IT Service Management', 'Down', 4)
 hnt['col4']=new Array('Day-to-day management of an IT Service, System, or other Configuration Item', 'Down', 9)
 hnt['col5']=new Array('A change of state which has significance for the management', 'Down', 5)
 hnt['col6']=new Array('The addition, modification or removal of anything', 'Down', 6)
 hnt['col7']=new Array('A Benchmark used as a reference point', 'Down', 8)
 hnt['col8']=new Array('A structured set of Activities designed to accomplish a specific objective', 'Down', 7)
 
 function init(id){
	 if(selected!=""){
		 cancelWindow()
	}
	selected=id;
	var puzzleHighlighted=highlight(id)
	if(puzzleHighlighted==true){
	document.getElementById('smsg').style.display="none"	
	document.getElementById('newWindow').style.display="Block"
	document.getElementById('ori').innerHTML=hnt[id][1];
	document.getElementById('letters').innerHTML=hnt[id][2];
	document.getElementById('hint').innerHTML="Hint : "+hnt[id][0];
	if(ansa[id]){
		document.getElementById('itext').value=ansa[id];
	}
	else{
		document.getElementById('itext').value="Click here to Answer"
	}
document.forms['inputT'].itext.focus();
}
}

function cancelWindow(){
if(document.getElementById('puzzleTable').getElementsByTagName('td')){
	var element=document.getElementById('puzzleTable').getElementsByTagName('td');
	var n=element.length;
	for(var i=0; i<n; i++){
		if(hnt[selected][1]=="Across"){
		var obj=element.item(i).getAttribute('cId')
				if(obj==selected){
					element.item(i).className="pCell"
				}
				}
				else{
				var obj=element.item(i).getAttribute('cId1')
				if(obj==selected){
				element.item(i).className="pCell"
				}
				}
				}
}
	selected=""
	document.getElementById('error').innerHTML="";
	document.getElementById('newWindow').style.display="None"
	document.getElementById('smsg').style.display="block"
	updateReview()
}

function highlight(id){
if(document.getElementById('puzzleTable').getElementsByTagName('td')){
	var element=document.getElementById('puzzleTable').getElementsByTagName('td');
	var n=element.length;
	for(var i=0; i<n; i++){
		if(hnt[selected][1]=="Across"){
		var obj=element.item(i).getAttribute('cId');
				if(obj==id){
					element.item(i).className="pCell selected"
				}
		}
		else{
					var obj=element.item(i).getAttribute('cId1');
				if(obj==id){
					element.item(i).className="pCell selected"
				}
		}
			}
	return true;
}
}

function toggleValue(element){
	alert(this.value)
	if(this.value=="Click here to Answer"){
		this.value="";
	}
	else{
		if(this.value=""){
			this.value="Click here to Answer"
		}
		}
}

function validateInput(a){
	var len=hnt[selected][2]
	if(a.length!=len){
		document.getElementById('error').innerHTML="Only "+len+" Chanacters Allowed"
	}
	else{
		document.getElementById('error').innerHTML="";
	}
}

function update(){
			var tans=document.getElementById('itext').value;
			if(tans!='Click here to Answer'){
			if(tans.length==hnt[selected][2]){
			ansa[selected]=tans;
			updateTable();
			}
			else{
				alert("Please Enter exactly "+hnt[selected][2]+" characteds")
			}
			}
}
var e=0;
function updateTable(){
if(document.getElementById('puzzleTable').getElementsByTagName('td')){
	var element=document.getElementById('puzzleTable').getElementsByTagName('td');
	var n=element.length;
	var tempArray=ansa[selected].split("")
	var reCalcThis=new Array();
	for(var i=0; i<n; i++){
		if(hnt[selected][1]=="Across"){
		var obj=element.item(i).getAttribute('cId');
				if(obj==selected){
					element.item(i).innerHTML=tempArray[e]
					e++;
					if(element.item(i).getAttribute('cId1')){
						reCalcAnswer(element.item(i).getAttribute('cId1'))
					}
			}
				}
				else{
					var obj=element.item(i).getAttribute('cId1');
					if(obj==selected){
					element.item(i).innerHTML=tempArray[e]
					e++;
					if(element.item(i).getAttribute('cId')){
						reCalcAnswer(element.item(i).getAttribute('cId'))
					}
				}	
				}
			}
	e=0;
	tempArray=null;
	cancelWindow()
	reCalcAnswer('done')
	return true;	
}
}

word = new Array();
word['row1']="ECAB"; word['row2']="METRIC"; word['row3']="UTILITY"; word['row4']="ALERT"; word['row5']="PDCA"; word['row6']="GOVERNANCE"; word['row7']="INCIDENT"; word['col1']="CAPABILITY"; word['col2']="FUNCTION"; word['col3']="ITIL"; word['col4']="OPERATION"; word['col5']="EVENT"; word['col6']="CHANGE"; word['col7']="BASELINE"; word['col8']="PROCESS";
 
function highlightErrors(val){
if(document.getElementById('puzzleTable').getElementsByTagName('td')){
	var element=document.getElementById('puzzleTable').getElementsByTagName('td');
	var n=element.length;
	for(var i=0; i<n; i++){
		if(hnt[val][1]=="Across"){
		var obj=element.item(i).getAttribute('cId');
				if(obj==val){
					element.item(i).className="pCell errors"
				}
		}
		else{
				var obj=element.item(i).getAttribute('cId1');
				if(obj==val){
					element.item(i).className="pCell errors"
				}
		}
	}
	return true;
}
}
function highlightCorrect(val){
if(document.getElementById('puzzleTable').getElementsByTagName('td')){
	var element=document.getElementById('puzzleTable').getElementsByTagName('td');
	var n=element.length;
	for(var i=0; i<n; i++){
		if(hnt[val][1]=="Across"){
		var obj=element.item(i).getAttribute('cId');
				if(obj==val){
					element.item(i).className="pCell correct"
				}
		}
		else{
				var obj=element.item(i).getAttribute('cId1');
				if(obj==val){
					element.item(i).className="pCell correct"
				}
		}
	}
	return true;
}
}
function submitDetails(){
	if(correctAns==true){	
var Email2=""
var Email5="</table>"
var errors=0;
var correct=0;
var counter=0;
	  for(var e in ansa){
		  counter++;
		  var a=ansa[e].toUpperCase();
		  var b=word[e].toUpperCase();
		  if(a==b){
			 	correct+=1;
				Email2+="<tr> <td style='border-bottom:solid 1px #ccc;'>"+e+"</td><td style='border-bottom:solid 1px #ccc; border-left:solid 1px #ccc'>"+hnt[e][0]+"</td><td style='border-bottom:solid 1px #ccc; border-left:solid 1px #ccc'>"+word[e]+"</td> <td style='border-bottom:solid 1px #ccc; border-left:solid 1px #ccc'>"+ansa[e]+"</td> <td style='color:#009933; border-bottom:solid 1px #ccc; border-left:solid 1px #ccc'>Correct</td> </tr>"
				 	
			  }
			  else{
			  	errors+=1;
				Email2+="<tr> <td style='border-bottom:solid 1px #ccc;'>"+e+"</td><td style='border-bottom:solid 1px #ccc; border-left:solid 1px #ccc'>"+hnt[e][0]+"</td><td style='border-bottom:solid 1px #ccc; border-left:solid 1px #ccc'>"+word[e]+"</td> <td style='border-bottom:solid 1px #ccc; border-left:solid 1px #ccc'>"+ansa[e]+"</td> <td style='color:#f00; border-bottom:solid 1px #ccc; border-left:solid 1px #ccc'>wrong</td> </tr>"
			  }
	}
	var Email3="<tr><td height='5' colspan='5' bgcolor='#CCCCCC'></td></tr>"
    var Email4="<tr><td colspan='3' align='right'>Number of Questions Answered out of 15 : </td><td colspan='2'>"+counter+"</td></tr>"
	Email4+="<tr><td colspan='3' align='right'>Correct Answers : </td><td colspan='2'>"+correct+"</td></tr>";
    Email4+="<tr><td colspan='3' align='right'>Wrong Answers : </td><td colspan='2'>"+errors+"</td></tr>"
    Email4+="<tr><td colspan='3' align='right'>Not Attempted : </td><td colspan='2'>"+(15-counter)+"</td></tr>"
	var Email6="<tr><td colspan='5' align='center' style='border-top:1px solid #ccc;'><font face='Arial' color ='green' size='2.5'>Thank you for your participation!</font></td></tr>"
	Email6+="<tr><td colspan='5' align='left'>Best Regards, <br><br><a href='http://www.itilstudy.com' target='_balnk'>www.ITILstudy.com</a><br>(APMG Accredited Training Organisation)<br>Email: marketing@itilstudy.com</td></tr>"	
	email=Email2+Email3+Email4+Email6+Email5;
		win=window.open('', 'details', "width=800, height=400, location=no, menubar=no, status=no, titlebar=no")
		document.getElementById('submitf').style.display="block"
		document.forms['userInfo']['emailtext'].value=email;
		var innerh=document.getElementById('submitf').innerHTML;
		document.getElementById('submitf').style.display="none"
		win.document.write(innerh);
		return true;
}
else{
	alert("Please Enter atleast 5 questions to Continue")
	}
}
var correctAns=false
function updateReview(){
var errors=0;
var correct=0;
var counter=0;
	  for(var e in ansa){
		  counter++;
		  var a=ansa[e].toUpperCase();
		  var b=word[e].toUpperCase();
		  if(a==b){
			 	correct+=1;
				highlightCorrect(e)
			  }
			  else{
			  	errors+=1;
				highlightErrors(e);
			  }
	}
var output="Number of Questions attempted out of 15 : "+counter+" <br/>Correct Answers : "+correct+" <br/>Wrong Answers : "+errors+" <br/>Not Attempted : "+(15-counter);
document.getElementById('reviewM').innerHTML=output;
if(correct>=5){
	document.getElementById('submitButton').removeAttribute('disabled');
	correctAns=true
}
else{
	document.getElementById('submitButton').setAttribute('disabled',"disabled")
	correctAns=false
	}
}

function textCounter()
{
  textareaid = document.getElementById('itext');
  if (textareaid.value.length > hnt[selected][2])
    textareaid.value = textareaid.value.substring(0, hnt[selected][2]);
  else
    document.getElementById('error').innerHTML = '('+(hnt[selected][2]-textareaid.value.length)+' characters remaining..)';
	if(hnt[selected][2]==textareaid.value.length){
		 document.getElementById('error').innerHTML="Please click Okay Button"
		}
}


var reCalcThis=new Array();
function reCalcAnswer(param){
	if(param!="done"){
		reCalcThis.push(param);
	}
	else{
		for(var i=0; i<reCalcThis.length; i++){
			var currectSelected=reCalcThis[i];
			if(ansa[currectSelected]){
				var tempText=""
				var element=document.getElementById('puzzleTable').getElementsByTagName('td');
				var n=element.length;
				for(var k=0; k<n; k++){
				if(hnt[currectSelected][1]=="Across"){
				var obj=element.item(k).getAttribute('cId');
						if(obj==currectSelected){
							tempText+=element.item(k).innerHTML
							}
						}
						else{
							var obj=element.item(k).getAttribute('cId1');
							if(obj==currectSelected){
							tempText+=element.item(k).innerHTML
						}	
						}
					}
				ansa[currectSelected]=tempText;
				tempText="";
				}
			}
		reCalcThis=null;
		reCalcThis=new Array();
		updateReview()

	}
}
// JavaScript Document