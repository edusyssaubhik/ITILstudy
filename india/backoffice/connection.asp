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


'Conn.Open "Provider = SQLOLEDB; Data Source=PSATPATHY-PC\SQLEXPRESS; Initial Catalog=ITILstudy; User Id=raju; Password=raju123#"

'Conn.Open "Provider = SQLOLEDB; Data Source=db.winwinhosting.com; Initial Catalog=itilstudy; User Id=itilstudy; Password=nQ7R9lzDzLCMuh"

Conn.Open "Provider=SQLOLEDB;Data Source=Madhava-vaio; Initial Catalog=ITILstudy_DB; User Id=sa; Password=madhava"


%>
