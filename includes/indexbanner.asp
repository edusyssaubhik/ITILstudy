<div class="banner-main">
  <div id="banner-navigation">
    <div class="banner-navi-button banner-selected" onmouseover="toggleAuto(1, 'm')" onmouseout="toggleAuto(1, 'o')" id="b1">Best Quality</div>
    <div class="banner-navi-button" onmouseover="toggleAuto(2, 'm')" onmouseout="toggleAuto(2, 'o')" id="b2">Leading Provider</div>
    <div class="banner-navi-button" onmouseover="toggleAuto(3, 'm')" onmouseout="toggleAuto(3, 'o')" id="b3">Best Delivery Model</div>
    <div class="banner-navi-button" onmouseover="toggleAuto(4, 'm')" onmouseout="toggleAuto(4, 'o')" id="b4">Best Price</div>
  </div>
  <div id="banner-contents">
    <div class="slide" style="background-image:url(/images/banners/2.jpg)" id="i1" onmouseover="toggleAuto(0, 's')" onmouseout="toggleAuto(1, 'o')">
<div id="banner-body">
            <ul id="banner-list">
              <li>Pass ITIL Exam on last day of the classroom - <a href="http://www.itilstudy.com/classroomTraining.asp" target="_blank">More</a></li>
              <li>Best Pass Rate (99.2%) - <a href="http://www.itilstudy.com/ITIL-Training/Success-Rate.asp" target="_blank">Read more</a></li>
              	<ul>
                	<li>Better than the industry rate. </li>
                    <li>Backed by our 100% Moneyback Guarantee</li>
                </ul>
              <li>94% Customer satisfaction rating  by D&B - <a href="http://www.itilstudy.com/DunandBradstreet-Report.pdf" target="_blank">More</a></li>
              <li>25+ experienced  faculty working exclusively for us - <a href="http://www.itilstudy.com/ITIL-Training/instructors.asp" target="_blank">More</a></li>
			  <li>Specialized in ITIL trainings - <a href="http://www.itilstudy.com/ITIL-Training/better-than-competitors.asp" target="_blank">Find out here</a></li>
              <li>Great feedback from successful students - <a href="http://www.itilstudy.com/feedback_class.asp" target="_blank">Testimonials</a></li>             
          </ul>
        </div>
  </div>
      
   <div class="slide" style="background-image:url(/images/banners/1.jpg)" id="i2"  onmouseover="toggleAuto(0, 's')" onmouseout="toggleAuto(1, 'o')">
     <div id="banner-body">
            <ul id="banner-list">
              <li>Leading  ATO with students from:</li>
              	<ul>
                	<li>150+ countries </li>
                	<li>2000+ companies </li>
                	<li>25,000+ students <a href="http://www.itilstudy.com/feedback_class.asp" target="_blank">Read testimonials</a></li>
                </ul>
              <li>35+ exclusive Global Faculty for ITIL - <a href="http://www.itilstudy.com/ITIL-Training/instructors.asp" target="_blank">Know more</a></li>
              <% If Session("CountryOrigin") <> "Netherlands" And 	Session("CountryOrigin") <> "Germany" Then %> 
              <li>Part of VMEdu Inc.</li>
              <% End If %>         
           	  <ul>
                	<li>Leading global training platform company with offices in 6 countries. <a href="http://www.itilstudy.com/GlobalOffice.asp" target="_blank">More </a></li>
                	<li>Funded by Sequoia Capital, PE firm that funded Google, Apple, Cisco, Linkedin etc. - <a href="http://www.itilstudy.com/investors.asp" target="_blank">Read more</a></li>
                </ul>     
          </ul>
        </div> 	
  </div>

  <div class="slide" style="background-image:url(/images/banners/3.jpg)"  id="i3" onmouseover="toggleAuto(0, 's')" onmouseout="toggleAuto(1, 'o')">
    <div id="banner-body">
                <ul id="banner-list">
                  <li>Flexibility to learn through:</li>
                    <ul>
                        <li>Classrooms </li>
                        <li>Online only </li>
                        <li>Faculty-led online  (Live Classes) </li>
                        <li>Blended/Hybrid </li>
                      
                    </ul>
                  <li>Customized corporate  trainings - <a href="http://www.itilstudy.com/Corporate/Corporate-Overview.asp" target="_blank">More</a></li>             
              </ul>
    </div>
  </div>
  <div class="slide" style="background-image:url(/images/banners/4.jpg)"  id="i4" onmouseover="toggleAuto(0, 's')" onmouseout="toggleAuto(1, 'o')">
    <div id="banner-body">
                <ul id="banner-list">
                  <li>We offer best Value  for Money for all our courses </li>
                    <ul>
                      <li>Free online simulated  practice test - <a href="http://www.itilstudy.com/freeresources/freeSimulatedTest.asp" target="_blank">More</a></li>
                      <li>Online courses  starting from $ 300 - <a href="http://www.itilstudy.com/ITIL-Online-Courses.asp" target="_blank"> More</a></li>

                       <% If Session("CountryOrigin") = "Netherlands" Then%> 
                       <li>2 day ITIL Classes starting at &euro; 950 - <a href="http://www.itilstudy.com/ITIL-Courses.asp" target="_blank">More</a></li>
                       
                       <% ElseIf Session("CountryOrigin") = "Germany" Then %> 
                       <li>2 day ITIL Classes starting at &euro; 890 - <a href="http://www.itilstudy.com/ITIL-Courses.asp" target="_blank">More</a></li>
                       
                        <%Else %>
                        <li>2 or 3 Day ITIL Classes starting at $1,049 - <a href="http://www.itilstudy.com/ITIL-Courses.asp" target="_blank">More</a></li>
                        
                        <%End If %>
                     
                      <li>Additional corporate  discounts also available - <a href="http://www.itilstudy.com/contactus.asp" target="_blank">Contact us</a></li>
                    </ul>             
              </ul>
    </div> 
  </div>
  </div>
  <div id="banner-free">
    <div id="banner-free-header">Free Resources</div>
    <div id="banner-free-body">
    	<ul id="banner-free-list">
          <li>Free  simulated ITIL practice test. <a href="http://www.itilstudy.com/freeresources/freeSimulatedTest.asp" target="_blank">Take test</a></li>
          <li>Free chapter tests - <a href="http://www.itilstudy.com/freeresources/freeOnlineTest.asp" target="_blank">Take test </a></li>
          <li>Free guides & podcast - <a href="http://www.itilstudy.com/freeresources/freeGuidePodcast.asp" target="_blank">Download</a></li>
          <li>ITIL Crossword.  <a href="http://www.itilstudy.com/crossword/index.html" target="_blank">Play now</a></li>
		  <li>Free case studies and white papers. <a href="http://www.itilstudy.com/freeresources/caseStudies&whitePapers.asp" target="_blank">Download</a></li>

      </ul>
    </div>
      <div id="PM-Enrolmentbutton-Container">
        <div class="PM-Enrolmentbutton-Button-Background">
          <div class="PM-Enrolmentbutton"> <a href="http://www.itilstudy.com/ITIL-Courses.asp" target="_blank" class="PM-Enroll-text"><b>Enroll For</b><br />
            <span class="EM-Classroom"><b>Classroom</b></span></a> </div>
        </div>
        <div class="PM-Enrolmentbutton-Button-Background">
          <div class="PM-Enrolmentbutton"> <a href="http://www.itilstudy.com/ITIL-Online-Courses.asp " target="_blank" class="PM-Enroll-text"><b>Enroll For</b><br />
            <span class="EM-Classroom"><b>Online</b></span></a> </div>
        </div>
      </div>
  </div>
</div>
<script type="text/javascript">
var lastfN=1;
var autorun=0;
var inTransition=0
function updateBanner(a){
		if(lastfN!=a){
			var newFeature='b'+a;
			var oldFeature='b'+lastfN;
/*			if(inTransition==0){
			inTransition=1;*/
			$('#i'+lastfN).fadeOut(200)
			$('#i'+a).fadeIn(200)
/*			}
			else{
				
			}*/
			document.getElementById(oldFeature).className="banner-navi-button";
			document.getElementById(newFeature).className="banner-navi-button banner-selected"
			lastfN=a;
		}
}

function toggleAuto(a, b){
		if(b=="a"){
			t=setInterval("featureAutoIni(lastfN)", 8000);
		}
		else{
		if(b=='m'){
		clearInterval(t);
		updateBanner(a);
		}
		else{
			if(b=="o"){
			t=setInterval("featureAutoIni(lastfN)", 8000);
				}
				else{
						if(b=="s"){
							clearInterval(t);
							}
					}
			}
		}
	if(autorun==0){
		}
	}

function featureAutoIni(){
	var tempfN=lastfN
	if(tempfN==4){
	tempfN=0;
	}
	updateBanner(tempfN+1);
	}
updateBanner(lastfN)
toggleAuto(2, 'a')
/*function done(){
	inTransition=0;
}
var checkedSlides=new Array();
function delay(a){
	
}*/

</script>
</body>
</html>
