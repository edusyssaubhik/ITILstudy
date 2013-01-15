<!--#include virtual="/includes/connection.asp"-->
<%	

'ConnObj.Execute "INSERT INTO starratings (vendorID, certID, website, rating	, No_rates, ratingDate) VALUES ('1','1','PMstudy','"& x_RATING &"','"& x_NO_RATES &"','"& Now() &"')"

'If
Dim amt
amt = request.querystring("amt")
x_NO_RATES = request.querystring("rate")
'x_NO_RATES = request.Form("x_NO_RATES")

'Response.Write( "Test"&amnt)

ConnObj.Execute "INSERT INTO starratings (vendorID, certID, website, rating	, No_rates, ratingDate) VALUES ('1','1','ITILstudy','"&amt&"','"&x_NO_RATES&"','"& Now() &"')"

'Response.write("Test")

%>
