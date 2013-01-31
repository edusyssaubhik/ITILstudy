<%
'Declare The local Variables'
Dim ConnObj

Set ConnObj=Server.CreateObject("ADODB.Connection")

'PROJ
ConnObj.Open "Provider =SQLOLEDB; Data Source=db.winwinhosting.com; Initial Catalog=itilstudy; User Id=itilstudy; Password=FASDwews84WSJ"

'ConnObj.Open "Provider=SQLOLEDB;Data Source=PRIYANKA-1545; Initial Catalog=ITILstudy; User Id=sa; Password=edusys"
'Conn.Open "Provider = SQLOLEDB; Data Source=PSATPATHY-PC\SQLEXPRESS; Initial Catalog=ITILstudy; User Id=raju; Password=raju123#"
'ConnObj.Open "Provider=SQLOLEDB;Data Source=SUPREETHA-VAIO; Initial Catalog=itilstudy; User Id=sa; Password=supreetha"
%>
