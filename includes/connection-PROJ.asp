<%
Dim ConnObjPROJ
'Dim Rs

Set ConnObjPROJ = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")




ConnObjPROJ.Open "Provider=SQLOLEDB;Data Source=PRIYANKA-1545\SQLEXPRESS1; Initial Catalog=apmgstudy; User Id=sa; Password=edusys123"


%>
