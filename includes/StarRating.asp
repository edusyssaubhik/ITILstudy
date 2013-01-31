<%
  'Declare The local Variables'
  Dim x_NO_RATES,x_RATING,strNum,rsRate,rsstarRate,rsRate1,rsAVGRate1
  
  Set connObj=Server.CreateObject("ADODB.Connection")
  Set rsAVGRate  = Server.CreateObject("ADODB.Recordset")
  Set rsRate  = Server.CreateObject("ADODB.Recordset")
  
  
  ConnObj.Open "Provider =SQLOLEDB; Data Source=db.winwinhosting.com; Initial Catalog=itilstudy; User Id=itilstudy; Password=FASDwews84WSJ"
  
  'To get the top ID from the DB
  'rsRate1 = "SELECT top 1 ID,No_rates,rating FROM starRatings where website ='PMstudy' order by ID desc" 
  
  rsRate1 = "SELECT count(*) as No_rates FROM starRatings where website ='ITILstudy'" 
  
  'Response.Write(rsRate1)
  
  rsRate.Open rsRate1,ConnObj
  
  Do Until rsRate.EOF
  
  x_NO_RATES=rsRate("No_rates")
   x_NO_RATES=x_NO_RATES + 1
  
  rsRate.Movenext	
  Loop
  rsRate.Close
  
  'To get the average of all the records
  rsAVGRate1 = "SELECT Sum(rating) AS sum_rate FROM starRatings where website ='ITILstudy'"
  
  'Response.Write(rsAVGRate1)
  
  rsAVGRate.Open rsAVGRate1,ConnObj
  
  Do Until rsAVGRate.EOF
  
  x_RATING=rsAVGRate("sum_rate")
  
  x_RATING = cdbl(formatnumber(x_RATING/ x_NO_RATES,1))
  
      'Response.Write(x_RATING)
  
  rsAVGRate.Movenext	
  Loop
  rsAVGRate.Close
  
  
  
  %>
  <head>
  <style type="text/css">
  .star-rating {
      list-style:none;
      padding:0px;
      width: 100px;
      height: 20px;
      position: relative;
      background: url(/images/alt_star.png) top left repeat-x;
      display:inline-block;
      float:left;
      margin:-3px 0 0 0;
  }
  .star-rating li {
      padding:0px;
      margin:0px;
      /*\*/
          float: left;/* */
      }
  .star-rating li a {
      display:block;
      width:20px;
      height: 20px;
      text-decoration: none;
      text-indent: -9000px;
      z-index: 20;
      position: absolute;
      padding: 0px;
  }
  .star-rating li a:hover {
      background: url(/images/alt_star.png) left bottom;
      z-index: 2;
      left: 0px;
  }
  .star-rating a:focus,  .star-rating a:active {
      border:0;
      -moz-outline-style: none;
      outline: none;
  }
  .star-rating a.one-star {
      left: 0px;
  }
  .star-rating a.one-star:hover {
      width:20px;
  }
  .star-rating a.two-stars {
      left:20px;
  }
  .star-rating a.two-stars:hover {
      width: 40px;
  }
  .star-rating a.three-stars {
      left: 40px;
  }
  .star-rating a.three-stars:hover {
      width: 60px;
  }
  .star-rating a.four-stars {
      left: 60px;
  }
  .star-rating a.four-stars:hover {
      width: 80px;
  }
  .star-rating a.five-stars {
      left: 80px;
  }
  .star-rating a.five-stars:hover {
      width: 100px;
  }
  .star-rating li.current-rating {
      background: url(/images/alt_star.png) left center;
      position: absolute;
      height: 20px;
      display: block;
      text-indent: -9000px;
      z-index: 1;
	  left:0;
  }
  div.rating-result {
      float:left;
      margin-left:10px;
  }
  #starcontainer {
      width: 905px;
      height: 20px;
      margin-left: 480px;
      margin-top:10px;
  }
  </style>
  <script type="text/javascript">

      function vote(amnt) {
          //check for cookie
          var cookieChecked = checkCookie();
          if (cookieChecked) {
              alert('You have already rated!')
              return;
          }
          else {
              //make ajax call
              makeAjaxCall(amnt)
              // alert('jj')
              //calculate the starwidth
              var avg, voted, starWidth;
              voted = parseInt(document.getElementById('current-rating-result').getAttribute('totalVoted')) + 1;
              avg = document.getElementById('current-rating-result').getAttribute('totalVoted') * document.getElementById('current-rating-result').getAttribute('totalRate');
              avg = avg + amnt;
              avg = avg / voted;
              starWidth = Math.round(avg * 20)
              document.getElementById('current-rating').style.width = starWidth + "px";
              document.getElementById('current-rating-result').innerHTML = 'Rating: ' + avg.toFixed(1) + ' out of 5 (' + voted + ' votes).'
          }
      }
      function makeAjaxCall(amnt) {
          var xmlhttp;
          if (window.XMLHttpRequest) {
              xmlhttp = new XMLHttpRequest();
          }
          else {
              xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
          }
          xmlhttp.onreadystatechange = function () {
              /*   if (xmlhttp.readyState==4 && xmlhttp.status==200){
                }*/
          }
          xmlhttp.open("GET", "ratingprocess.asp?amt=" + amnt + "&rate=<% = x_NO_RATES %>", true);
          xmlhttp.send();
      }

      function getCookie(c_name) {
          var i, x, y, ARRcookies = document.cookie.split(";");
          for (i = 0; i < ARRcookies.length; i++) {
              x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
              y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
              x = x.replace(/^\s+|\s+$/g, "");
              if (x == c_name) {
                  return unescape(y);
              }
          }
      }

      function setCookie(c_name, value, exdays) {
          var exdate = new Date();
          exdate.setDate(exdate.getDate() + exdays);
          var c_value = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
          document.cookie = c_name + "=" + c_value;
      }

      function checkCookie() {
          var rating = getCookie("rating");
          if (rating != null && rating != "") {
              return true;
          }
          else {
              rating = 'rated';
              if (rating != null && rating != "") {
                  setCookie("rating", rating, 365);
                  return false;
              }
          }
      }
  </script>
  </head>
      <body>
  <div id="starcontainer" align="center" class="hReview-aggregate">
    <div class='rating-result'  ><SPAN class=item><SPAN class=fn><% If Session("CountryOrigin") = "Germany" OR Session("CountryOrigin") = "Netherlands" Then %>ITILstudy<% Else %>ITILstudy<% End If %></SPAN></div>
    <div class='rating-result' >
      <ul class='star-rating'">
        <li class='current-rating' id='current-rating' style="width: <% = x_RATING * 20 %>px"></li>
        <li><a href="#" onClick="vote(1); return false;" 
             title='1 star out of 5' class='one-star'>1</a></li>
        <li><a href="#" onClick="vote(2); return false;" 
             title='2 star out of 5' class='two-stars'>2</a></li>
        <li><a href="#" onClick="vote(3); return false;" 
             title='3 star out of 5' class='three-stars'>3</a></li>
        <li><a href="#" onClick="vote(4); return false;" 
             title='4 star out of 5' class='four-stars'>4</a></li>
        <li><a href="#" onClick="vote(5); return false;" 
             title='5 star out of 5' class='five-stars'>5</a></li>
      </ul>
    </div>
    </SPAN>
    <div id='current-rating-result' totalRate=<% = x_RATING %> totalVoted=<% = x_NO_RATES %>  class='rating-result'> Rating: <SPAN class=rating> <SPAN class=average>
      <% = x_RATING %>
      </SPAN></SPAN> out of <SPAN class=best> 5</SPAN> <SPAN class=votes> (
      <% = x_NO_RATES %>
      votes)</SPAN>. </div>
  </div>
  
  <!--End of code for star rating -->