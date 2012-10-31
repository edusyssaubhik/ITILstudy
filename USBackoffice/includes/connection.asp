<%
'======================================================='
 'Written By : Bharath'
 'Last UpaDated: 12/08/2009'
 'Description :'
 'Purpose : Connection String Page'
'======================================================='
%>
<%
'Declare The Variables'
Dim ConnObj

Set ConnObj = Server.CreateObject("ADODB.Connection")

'Connection String'

'ConnObj.Open "Provider=SQLOLEDB;Data Source=PRIYANKA-1545; Initial Catalog=ITILstudy; User Id=sa; Password=edusys"

ConnObj.Open "Provider =SQLOLEDB; Data Source=db.winwinhosting.com; Initial Catalog=itilstudy; User Id=itilstudy; Password=FASDwews84WSJ"
%>