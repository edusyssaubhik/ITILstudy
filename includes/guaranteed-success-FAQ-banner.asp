<!-- Banner Starts -->

<div>
  <%If (Session("CountryOrigin") = "United Kingdom") Then %>
  <img src="/images/banners/guaranteed-success.jpg"  width="930" height="56">
  <% Else %>
  	<img src="/images/banners/value.jpg"  width="930" height="56">
  <% End if %>
</div>
<!-- Banner Ends -->
