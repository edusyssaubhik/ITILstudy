<%  Session("CountryOrigin") = countries

svrUrl = request.servervariables("URL")
RqRetriveURLCount = Split(svrUrl,"-",3)
RqRetriveURLCount1 = Split(RqRetriveURLCount(2),".")
'Response.write(RqRetriveURLCount1(0)) 

Response.Redirect("http://www.myitstudy.com/ITIL/ITIL-Training-"&RqRetriveURLCount1(0)&".asp")
%>

<ol id="new" type="1"> 
<li>Everything required for ITIL Foundation exam would be provided, you don’t need to bring anything else to the class</li>

<% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" OR Session("CountryOrigin") = "UAE" OR Session("CountryOrigin") = "Singapore" Then  %>

<li>Money Back Guarantee  <a href="/ITIL-Training/moneyBack.asp">More</a></li>

<% End If %>

<li>The cost of ITIL Foundation exam</li>
<li>2-day classroom training by experienced trainers</li>
<li>Free online prep course </li>
<li>High quality, comprehensive classroom study materials in line with the ITIL Foundation exam</li>
<li>Refreshments during classroom sessions</li>
<li>Valuable tips to pass the  ITIL Foundation exam</li>
<li>Free 18 PMI approved PDUs with our courses <a href="http://itilstudy.com/ITIL-Training/PMI_PDU.asp">More</a></li>
</ol>

