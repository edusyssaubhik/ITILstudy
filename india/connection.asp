<%
'======================================================='
 'Written By : Bharath'
 'Last UpaDated: 01/11/2007'
 'Description :'
 'Purpose : Connection String Page'
'======================================================='
%>

<%
Dim Conn,Rs

Set Conn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")




Conn.Open "Provider =SQLOLEDB; Data Source=db.winwinhosting.com; Initial Catalog=itilstudy; User Id=itilstudy; Password=FASDwews84WSJ"

'Conn.Open "Provider=SQLOLEDB;Data Source=madhava-vaio; Initial Catalog=ITILstudy_db; User Id=sa; Password=madhava"


%>
