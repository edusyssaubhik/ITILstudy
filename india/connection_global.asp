<%
'Declare The local Variables'
Dim ConnObj

Set ConnObj = Server.CreateObject("ADODB.Connection")

ConnObj.Open "PROVIDER=SQLOLEDB;DATA SOURCE=db.winwinhosting.com;UID=PMstudy;PWD=BOzgmqMrz7kglbSb; DATABASE=PMstudy"
%>
