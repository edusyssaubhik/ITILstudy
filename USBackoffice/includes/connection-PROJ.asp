<%
'======================================================='
 'Written By : Bharath'
 'Last UpaDated: 01/11/2007'
 'Description :'
 'Purpose : Connection String Page'
'======================================================='
%>

<%
Dim Conn1

Set Conn1 = Server.CreateObject("ADODB.Connection")



Conn1.Open "Provider =SQLOLEDB; Data Source=db.winwinhosting.com; Initial Catalog=APMGstudy; User Id=APMGstudy; Password=UpIwnfBKPP2aNv9a"

'Conn1.Open "Provider=SQLOLEDB;Data Source=SAVITA-PC; Initial Catalog=APMG; User Id=sa; Password=savita123"


%>
