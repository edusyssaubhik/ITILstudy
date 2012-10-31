<%
'Declare The local Variables'
Dim ConnObj1

Set ConnObj1 = Server.CreateObject("ADODB.Connection")

'ITIL

ConnObj1.Open "Provider =SQLOLEDB; Data Source=db.winwinhosting.com; Initial Catalog=itilstudy; User Id=itilstudy; Password=FASDwews84WSJ"


'ConnObj1.Open "Provider = SQLOLEDB; Data Source=PSATPATHY-PC\SQLEXPRESS; Initial Catalog=ITILstudy; User Id=raju; Password=raju123#"

%>
