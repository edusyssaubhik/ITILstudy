<%

dim country
  country=Session("CountryOrigin")
  Session.Contents.RemoveAll()
  Session("CountryOrigin")=country
Response.Cookies("access_token").Expires = now()
Response.Cookies("token_expires").Expires = now()
'response.write(Session("CountryOrigin"))
Response.Redirect("/memberlogin.asp")

%>