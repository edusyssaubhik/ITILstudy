<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerwhyusbanner.html"-->
<% If Session("FirstName") = "" Then 
response.Redirect("/memberlogin.asp")
Else
%>
<!-- Body Starts -->

<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
           <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; Help </td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
			<div style="margin-top:-12px; width:97%;">
                <!-- Content Start From Here-->
                <p class="Header">Please <a href="/systemRequirement.asp" target="_blank">click here</a> to know the system requirement for assessing ITILstudy online courses.</p>
				
			 <p class="Header">For more information on the features and content on different sections of ITILstudy Online
Courses, please have a look at the screenshots and related explanation given below:</p>
			 
			 <span class="SubHeader"><strong>Login Page</strong></span>

                  <p><a href="/images/img_ITILhelp/login.png" target="_blank"><img src="/images/img_ITILhelp/login-s.png" width="288px" height="148px" border="0" style="border:1px #CCCCCC solid;"/></a></p>
				    <ul>
                  <li>The page allows any student to login through his/her E-Mail ID used to enrol with ITILstudy online course and the password which are sent as soon as the course is activated.</li>
				   <li>The image above shows the different buttons on the Login page</li>
				  </ul>
				  
				   <span class="SubHeader"><strong>Welcome Page</strong></span>
                  <p><a href="/images/img_ITILhelp/Welcome-OSA.png" target="_blank"><img src="/images/img_ITILhelp/WelcomeOSA-s.png" width="288px" height="148px" border="0" style="border:1px #CCCCCC solid;"/></a></p>
				    <ul>
                  <li>The welcome page allows a student to either proceed with accessing the course or go back to the home page.</li>
				   <li>It also displays the information on the date when the course was activated and till when it is valid.</li>
				  </ul>
				  
			   	<span class="SubHeader"><strong>Course Overview Page</strong></span>
                  <p><a href="/images/img_ITILhelp/overview-OSA.png" target="_blank"><img src="/images/img_ITILhelp/overviewOSA-s.png" width="288px" height="148px" border="0" style="border:1px #CCCCCC solid;"/></a></p>
				  <p>The course overview page gives information on the different sections of the website and gives an overview of the overall course structure.</p>
				    <ul>
                  <li>The left menu shows up the various options which are numbered in the image shown above. The different features are explained as follows:<br /><br />
				  <ol>
				  <li><span class="SubHeader">Overview of the course:</span> Gives information on the different sections of the website and provides relevant links to each of these sections.</li>
				  <li><span class="SubHeader">Syllabus and Requirements:</span> Summarizes the ITIL  syllabus to be covered and the relevant eligibility requirements for the ITIL  Foundation course.</li>
				  <li><span class="SubHeader">Select Chapter:</span> Allows a delegate to change the selected chapter and view the sections (study guide, chapter test and evaluation test) of any of the covered chapters.</li>
				  <li><span class="SubHeader">Study Methodology:</span> Gives a brief on the methodology to be followed while taking a ITILstudy online course.</li>
				    <li><span class="SubHeader">APMG Sample Q & A:</span> Provides the APMG sample Q & A to the delegate to download and practice.</li>
                   
					 <li><span class="SubHeader">Query/Suggestion:</span> Allows a delegate to provide feedback/suggestion or make a complaint.</li>
					  <li><span class="SubHeader">Signout:</span> Signs out the session.</li></ol></li>
					 </ul>
					 
					  <span class="SubHeader"><a name="Select-Chapter"></a><strong>Select Chapter Page</strong></span>

                  <p><a href="/images/img_ITILhelp/select-chapter.png" target="_blank"><img src="/images/img_ITILhelp/select-chapter-s.png" width="288px" height="148px" border="0" style="border:1px #CCCCCC solid;"/></a></p>
				    <ul>
                  <li><span class="SubHeader">Chapter Box: </span> Allows a user to select a chapter to get access to its various sections (Study Guide, Chapter Test and Evaluation Test).</li>
				   <li><span class="SubHeader">Submit: </span> Confirms the selection made in the above box and selects the chapter allowing access to the relevant sections of the chapter.</li>
				   <li><span class="SubHeader">Reset: </span> Allows a user to reset the selected chapter and re-select again.</li>
				  </ul>
				  
				   <span class="SubHeader"><strong>Study Methodology Page</strong></span>

                  <p><a href="/images/img_ITILhelp/online-foundation-training-model.png" target="_blank"><img src="/images/img_ITILhelp/online-foundation-training-model-s.png" width="288px" height="148px" border="0" style="border:1px #CCCCCC solid;"/></a></p>
				    <ul>
                  <li>Gives a brief on the methodology to be followed while taking a ITILstudy online course.</li>
				   <li>Provides a link to the syllabus for ITIL Foundation course.</li>
				  </ul>
				  
				  
				  <span class="SubHeader"><a name="studyguides"></a><strong>Study Guides page</strong></span>

                  <p><a href="/images/img_ITILhelp/Download-studyguides.png" target="_blank"><img src="/images/img_ITILhelp/Download-studyguides-s.png" width="288px" height="148px" border="0" style="border:1px #CCCCCC solid;"/></a></p>
				    <ul>
                  <li>Study Guides section, allows delegates to download the study guides in different modes as per their convenience. The formats supported are Portable Document Format (PDF), Flash (SWF) andPodcasts (mp4).</li>
                  <li>The multiple formats allow the delegate to not only view the content through an engaging environment (through flash) but also assess the guides while on the go over any Podcast supporting device (iPod, iPhone and most of the smartphones).</li>
				  </ul>
				  
                   <span class="SubHeader"><strong>Study Guides (Flash Features)</strong></span>
                   
				  <p>Please feel free to enjoy the newly introduced flash version of our Study Guides equipped with Audio. The different buttons on the Flash Study guides are highlighted and numbered, their functions are given below:<p>
                  
                  <a href="/images/img_ITILhelp/flash.png" target="_blank"><img src="/images/img_ITILhelp/flash-s.png" width="288px" height="148px" border="0" style="border:1px #CCCCCC solid;"/></a></p>
				    <ul>
                  <li><span class="SubHeader">1:</span> Play/Pause button, to play/pause the flash video.</li>
				  <li><span class="SubHeader">2:</span> Previous & Next buttons, allow a delegate to go to the previous/next slide of the chapter.</li>
				   <li><span class="SubHeader">3:</span> Progress Bar, allows to navigate through the video and jump from one part of the chapter to another with just a click. Also gives information on the time elapsed and the total length of the video.</li>
				   <li><span class="SubHeader">4:</span> Audio button, allows to mute or increase/decrease volume of the audio.</li>
                    <li><span class="SubHeader">5:</span> Pointer button, allows a delegate to highlight or mark certain part of the slide.</li>
                     <li><span class="SubHeader">6:</span> View Switch Button, allows a delegate to switch to 3 different video views for the study guides.</li>
                      <li><span class="SubHeader">7:</span> Attachments Button, allows a delegate to view and download the attachment(s) with the study guides, if any.</li>
                       <li><span class="SubHeader">8:</span> Notes Button, allows a delegate to view the related notes, if any.</li>
                        <li><span class="SubHeader">9:</span> Print Button, provides the functionality to print the viewable screenshot and keep for later reading.</li>
                         <li><span class="SubHeader">10:</span> Outline Tab, allows a user to have a look the slide headings in a particular chapter and gives the feature to jump from one slide to another with one click.</li>
                      <li><span class="SubHeader">11:</span> Thumbnails Tab, provide a thumbnail view to all slides in the selected chapter video.</li>
				  </ul>
                  
                  
				  <span class="SubHeader"><a name="chapter-test"></a><strong>Chapter Test Page</strong></span>

                  <p><a href="/images/img_ITILhelp/chapter-test.png" target="_blank"><img src="/images/img_ITILhelp/chapter-test-s.png" width="288px" height="148px" border="0" style="border:1px #CCCCCC solid;"/></a></p>
				    <ul>
                  <li>The Chapter Tests assess the delegate's degree of understanding of the respective chapter content.</li>
				  <li>It allows a delegate to attempt and practice from different questions available for each chapter.</li>
				  <li>In case a delegate has completed the test upto a certain number, he/she can continue from the next question by entering the same in the "Question number to begin with" box and clicking on enter selection</li>
				  </ul>
				  
				   <span class="SubHeader"><strong>Chapter Test Features</strong></span>

                  <p><a href="/images/img_ITILhelp/chapter-test-1.png" target="_blank"><img src="/images/img_ITILhelp/chapter-test-1-s.png" width="288px" height="148px" border="0" style="border:1px #CCCCCC solid;"/></a></p>
				    <ul>
                  <li>Each question in the chapter test comes with 4 options out of which one is correct. A delegate has to understand and make the choice by selecting the button on the left of appropriate option.</li>
				  <li><span class="SubHeader">Enter Selection: </span> Would confirm the option selected and move on to the next question.</li>
				  <li><span class="SubHeader">Reset: </span> Would clear the selected option.</li>
				   <li><span class="SubHeader">Exit: </span> Exits the test.</li>
				  </ul>
				  
				   <span class="SubHeader"><a name="Evolution"></a><strong>Evaluation Test Selection</strong></span>

                  <p><a href="/images/img_ITILhelp/evaluation-n.png" target="_blank"><img src="/images/img_ITILhelp/evaluation-n-s.png" width="288px" height="148px" border="0" style="border:1px #CCCCCC solid;"/></a></p>
				    <ul>
                  <li>Allows a delegate to appear in the evaluation test by selecting it from the drop-down box and clicking on Enter as shown in the screenshot above.</li>
				   <li>Please note that only after passing the Evaluation test, the access to the next chapter would be provided.</li>
				  </ul>
				  
				    <span class="SubHeader"><strong>Evaluation Instructions Page</strong></span>

                  <p><a href="/images/img_ITILhelp/Evolution.png" target="_blank"><img src="/images/img_ITILhelp/Evolution-s.png" width="288px" height="148px" border="0" style="border:1px #CCCCCC solid;"/></a></p>
				    <ul>
                  <li>Provides more information on the evaluation test.</li>
				   <li>	Allows the user to proceed to take the test by clicking on the "Please Click here to continue" button.</li>
				  </ul>
				  
				   <span class="SubHeader"><strong>Evaluation Test</strong></span>

                  <p><a href="/images/img_ITILhelp/Evolution-1.png" target="_blank"><img src="/images/img_ITILhelp/Evolution-1-s.png" width="288px" height="148px" border="0" style="border:1px #CCCCCC solid;"/></a></p>
				    <ul>
                  <li>Each question in the Evaluation test comes with 4 options out of which one is correct.A delegate has to understand and make the choice by selecting the button on the left of appropriate option.</li>
				  <li><span class="SubHeader">Next Question: </span> Confirms the selected option and allows a delegate to proceed to the next question.</li>
				  <li><span class="SubHeader">View all answers: </span> Allows a delegate to review all answers and select the appropriate questions make changes to the selected option.</li>
				   <li><span class="SubHeader">Exit: </span> Exits the test, the delegate would then have to retake the test to gain access to the next chapter.</li>
				  </ul>
				  
				  <span class="SubHeader"><a name="APMG-sample-paper"></a><strong>APMG Sample Papers Page</strong></span>

                  <p><a href="/images/img_ITILhelp/APMG-sample-paper.png" target="_blank"><img src="/images/img_ITILhelp/APMG-sample-paper-s.png" width="288px" height="148px" border="0" style="border:1px #CCCCCC solid;"/></a></p>
				    <ul>
                  <li>Provides the information on the Q&A section provided by APMG</li>
				   <li>Allows a delegate to download two sample papers and the related answers to practice and assess his/her preparation on the same.</li>
				  </ul>
				  
				 
                  
                   <span class="SubHeader"><a name="Query"></a><strong>Query/Suggestion Page</strong></span>
				  <p>Allows a delegate to provide feedback/suggestion or make a complaint.</p>

                  <p><a href="/images/img_ITILhelp/Query.png" target="_blank"><img src="/images/img_ITILhelp/Query-s.png" width="288px" height="148px" border="0" style="border:1px #CCCCCC solid;"/></a></p>
				    <ul>
                  <li><span class="SubHeader">Query Type: </span>Allows a delegate to select the category of the query or the suggestion to be put in.</li>
				  <li><span class="SubHeader">Subject: </span> Allows a user to enter the subject for the query/suggestion</li>
				   <li><span class="SubHeader">Feedback: </span> Allows a user to enter the text of the feedback/complaint to be put in</li>
				   <li><span class="SubHeader">Submit: </span> Sends an Email to the Support department at ITILstudy.</li>
				  </ul>
                  
                  
				  
				  <span class="SubHeader"><strong>Sign Out</strong></span>
				    <ul>
                  <li>Ends the session and logs out of the course.</li>
				 
				  </ul>
				  <!-- Content End From Here-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<% End If %>
<!--#include virtual="/includes/footer.html"-->
