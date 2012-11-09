
<script language="javascript" runat="server" src="json2.asp"></script>
<!-- #INCLUDE FILE="fb_app.asp" -->
<!--#include virtual="/includes/connection.asp"-->
<%
'' JSON 2 Library from: 
''

main

function main
	dim app_id
	dim app_secret
	dim my_url
	dim dialog_url
	dim token_url
	dim resp
	dim token
	dim expires
	dim graph_url
	dim json_str
	dim user
	dim code
	dim strLocation 
	dim strEducation
	dim strEmail
	dim strFirstName
	dim strLastName
	dim strID
    dim gender
	dim username
	dim userlink
	token = cookie("token")

	if token = "" then 
		response.write "Facebook login error"	
		exit function
	end if

	graph_url = "https://graph.facebook.com/me?access_token=" & token

	json_str = get_page_contents( graph_url )


	set user = JSON.parse( json_str )

	'' These properties should always be there provided
	'' we ask the right questions user.id & user.name
	strFirstName = user.first_name
	strLastName = user.last_name
	strID = user.id
	
	'' Handling properties that might not be there
	on error resume next
	strLocation = user.location.name	
	If UBound(user.location.name)>0 Then
Else  
    strLocation = user.location.get(0).name
End If
	
	strEducation = user.education.get(0).school.name
	strEMail = user.email
	strEmail = replace( strEmail, "\u0040", "@")
	userlink = user.link
	userlink = replace( userlink, "\u0040", "@")
    gender= user.gender
	username=user.username
	on error goto 0

	'code start for save data to db
	
 
						'Declare The Local Variables'
						Session.Contents.Remove("errormsg")
						dim finalurl
						' session("fbuser")=true
						' session("loggedinEmail")=	strEMail
						'session("fbuserlocation")=strLocation			
					If not trim(session("current_user_id")) = "" then 'means user is logged in
                                'response.write("enter :") 
								 '1. get the values from CA and check whether email id is alredy from fb or not 
								 Set objRs = Server.CreateObject("ADODB.Recordset")		
						        strQuery = "SELECT TOP 1 Id,email,account_type_id FROM Customer_Accounts WHERE email='"&strEMail&"' ORDER BY Id DESC"
						        objRs.open strQuery,ConnObj							
							
						if objRs.eof = false then 'user is already registere with this email id (if no 2)
						'show already registered msg.
						'response.write("already registered") 
						session("errormsg")="This account is already registered with us please sync with other account"
						else 'user is not registere with this email id plz sync
                     'response.write("sync check") 
						'2. check in customer linking table whether this account is already linked with some account or not.
							 Set objCm1 = Server.CreateObject("ADODB.Recordset")		
							strQuery = "SELECT TOP 1 Id,account_type_id FROM related_customer_accounts WHERE other_site_email='"&strEMail&"' and account_type_id=2" '2 for facebook
							objCm1.open strQuery,ConnObj							
							
						if objCm1.eof = false then 'this account is already linked with other id.
						'response.write("sync already")
							session("errormsg")="this account is already Synced with other account"
						else
						'response.write("sync started")
						account_typeid=2  'two for those user who will login using facebook 	
					ConnObj.Execute "INSERT INTO related_customer_accounts(account_type_id,other_site_email,gender,date_of_birth,other_site_user_id,other_site_user_name,other_site_link,customer_id,creation_date)VALUES('"&account_typeid&"','"&strEMail&"','"&gender&"','"&user.birthday&"','"&strId&"','"&user.username&"','"&userlink&"','"&session("current_user_id")&"','"&Date&"')"
					session("fbuserlocation")=strLocation
					session("fbthanks")="Thank you for synchronising your facebook account now you can access your account through facebook login"
					
						'3. if not then check all the rows in paypaldb using fb emailid and having no cid then update all rows.
									Set objRs3 = Server.CreateObject("ADODB.Recordset")
									
									strEmailID = "SELECT ID, payer_email FROM PaypalDb WHERE payer_email = '"&strEMail&"' ORDER BY id desc"
									objRs3.open strEmailID,ConnObj           'get all paypal value using email
									if objRs3.eof = false then
									Do While NOT objRs3.Eof	
									ConnObj.Execute "UPDATE PaypalDB SET  customer_id = '"&session("current_user_id")&"' WHERE ID ='"&objRs3("ID")&"'"
										  objRs3.MoveNext
								   Loop
								   end if
					'4. now insert customer linking row acc to id.
					end if 'end of if no 2
					
						end if
								 
                                 								 
else
'response.write("return") 
Response.Redirect("/memberlogin.asp") 
end if
					%>
						<%
					Response.Cookies("access_token").Expires = now() 'needed for clearing the cookies for this case
                    Response.Cookies("token_expires").Expires = now()
				'Response.Redirect("/test.asp") 		
if session("errormsg")<>"" then
	%>
<script langauge="text/javascript">    
//var item=window.name;  
var url='/ChooseEmail.asp';
self.close();
opener.location.href=url;

</script>
	<%
	else
	%>
<script langauge="text/javascript">    
self.close();
opener.location.href='/ITIL-Online-Courses.asp';

</script>
<%
	end if
	%>
<%

objRs.Close  
						
	'end of code
end function    


%>
