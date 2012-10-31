<HTML>
<HEAD></HEAD>
<BODY>
<!--#include virtual="/includes/connection.asp"-->
<font="arial" size="3">
<%
Dim payer_email, first_name, address_country, payment_gross, color1, colorred, colorblue, colorgreen, colorcyan, colorblack

colorred="Red"
colorblue="Blue"
colorcyan="Cyan"
colorgreen="Green"
colorblack="Black"

 
Set rsQues = Server.CreateObject("ADODB.Recordset")

' Color = RED
rsQues.ActiveConnection = ConnObj

rsQues.Open "SELECT payer_email, first_name, last_name,custom, ebay_address_id, kno_passed, address_street, address_city, address_state, address_country, address_zip, date_entered, date_valid, item_number, color, dategranted, onlinecertissued, onlinecertdate, phycertissued, phycertdate, phycertdet from PaypalDB Where color='"&colorred&"' and paypal_address_id <> 'BB' and item_number <> '105' order by ID DESC"

%>
<table border="0">
  <tr>
    <td width="20px" bgcolor="green">&nbsp;&nbsp;&nbsp;</td>
    <td><div style="background-color:green; height:15px; width:100%"></div>
      <table>
        <tr>
          <td><B> Course 311 or 103 (Online Certificates only) - Not yet issued</B><BR>
            <BR>
            <table border="1" padding="4" spacing="4" align="left" width="75%">
              <%
If not rsQues.BOF then

%>
              <tr>
                <td>Status of certificate</td>
                <td>payer_email</td>
                <td>color</td>
                <td><B>Name</B></td>
                <td>dategranted</td>
                <td><B>Company Name</B></td>
                <td><B>Phone Number</B></td>
                <td>Address</td>
                <td>kno_passed</td>
                <td>date_entered</td>
                <td>date_valid</td>
                <td>item_number</td>
                <td>onlinecertissued</td>
                <td>onlinecertdate</td>
                <td>phycertissued</td>
                <td>phycertdate</td>
                <td>phycertdet</td>
              </tr>
              <%
Do While Not rsQues.EOF %>
              <tr>
                <td>Online only Cert Not Issued<BR>
                  # 311 or 103 <BR>
                  <form name="temp1" action="./temp1.asp" method="post">
                    <%=payer_email%>
                    <input type="hidden" name="payer_email" value="<%=rsQues("payer_email")%>">
                    <input type="hidden" size="20" name="date1" value="<%=rsQues("dategranted")%>">
                    <input type="text" size="20" name="item" value="<%=rsQues("item_number")%>">
                    <input type="hidden" size="20" name="color" value="Green">
                    onlinecertissued=
                    <input type="text" size="20" name="onlinecertissued" value="Yes">
                    <BR>
                    onlinecertdate=
                    <input type="text" size="20" name="onlinecertdate" value="<%=date()%>">
                    <BR>
                    <input type="submit">
                  </form></td>
                <td><font color="Red"><B><%=rsQues("payer_email")%></B></font></td>
                <td><font color="Red"><B><%=rsQues("color")%></B></font></td>
                <td><font color="Red"><%=rsQues("first_name")%> &nbsp;<%=rsQues("last_name")%></font></td>
                <td><%=rsQues("dategranted")%></td>
                <td><%=rsQues("custom")%></td>
                <td><B><%=rsQues("ebay_address_id")%></B></td>
                <td><%=rsQues("address_street")%><BR>
                  <%=rsQues("address_city")%><BR>
                  <%=rsQues("address_state")%><BR>
                  <%=rsQues("address_country")%> - <%=rsQues("address_zip")%></td>
                <td><%=rsQues("kno_passed")%></td>
                <td><%=rsQues("date_entered")%></td>
                <td><%=rsQues("date_valid")%></td>
                <td><%=rsQues("item_number")%></td>
                <td><%=rsQues("onlinecertissued")%></td>
                <td><%=rsQues("onlinecertdate")%></td>
                <td><%=rsQues("phycertissued")%></td>
                <td><%=rsQues("phycertdate")%></td>
                <td><%=rsQues("phycertdet")%></td>
              </tr>
              <%rsQues.MoveNext
		Loop%>
            </table></td>
        </tr>
        <%
else
end if
Set rsQues=Nothing %>
        <%
' Color = BLUE
Set rsQues1 = Server.CreateObject("ADODB.Recordset")

rsQues1.ActiveConnection = ConnObj

rsQues1.Open "SELECT payer_email, first_name, last_name,custom, ebay_address_id, kno_passed, address_street, address_city, address_state, address_country, address_zip, date_entered, date_valid, item_number, color, dategranted, onlinecertissued, onlinecertdate, phycertissued, phycertdate, phycertdet from PaypalDB Where color='"&colorblue&"' and paypal_address_id <> 'BB' and item_number <> '105' order by ID DESC"

%>
        <tr>
          <td><BR>
            <BR>
            <B>Course 312 or 104 (Online and Physical Certificates) - Online Certificates not yet issued</b><BR>
            <BR>
            <table border="1" padding="4" spacing="4" align="left" width="75%">
              <%
If not rsQues1.BOF then

%>
              <tr>
                <td>Status of certificate</td>
                <td>payer_email</td>
                <td>color</td>
                <td><B>Name</B></td>
                <td>dategranted</td>
                <td><B>Company Name</B></td>
                <td><B>Phone Number</B></td>
                <td>Address</td>
                <td>kno_passed</td>
                <td>date_entered</td>
                <td>date_valid</td>
                <td>item_number</td>
                <td>onlinecertissued</td>
                <td>onlinecertdate</td>
                <td>phycertissued</td>
                <td>phycertdate</td>
                <td>phycertdet</td>
              </tr>
              <%
Do While Not rsQues1.EOF %>
              <tr>
                <td>Online Cert Not Issued, physical cert not issued<BR>
                  # 312 or 104 <BR>
                  <form name="temp1" action="./temp1.asp" method="post">
                    <%=payer_email%>
                    <input type="hidden" name="payer_email" value="<%=rsQues1("payer_email")%>">
                    <input type="hidden" size="20" name="item" value="<%=rsQues1("item_number")%>">
                    <input type="hidden" size="20" name="date1" value="<%=rsQues1("dategranted")%>">
                    <input type="hidden" size="20" name="color" value="Cyan">
                    onlinecertissued=
                    <input type="text" size="20" name="onlinecertissued" value="Yes">
                    <BR>
                    onlinecertdate=
                    <input type="text" size="20" name="onlinecertdate" value="<%=date()%>">
                    <BR>
                    phycertissued=
                    <input type="text" size="20" name="phycertissued" value="No">
                    <BR>
                    <input type="submit">
                  </form></td>
                <td><font color="Blue"><B><%=rsQues1("payer_email")%></B></font></td>
                <td><font color="Blue"><B><%=rsQues1("color")%></B></font></td>
                <td><font color="Blue"><%=rsQues1("first_name")%>&nbsp; <%=rsQues1("last_name")%></font></td>
                <td><%=rsQues1("dategranted")%></td>
                <td><%=rsQues1("custom")%></td>
                <td><B><%=rsQues1("ebay_address_id")%></B></td>
                <td><%=rsQues1("address_street")%><BR>
                  <%=rsQues1("address_city")%><BR>
                  <%=rsQues1("address_state")%><BR>
                  <%=rsQues1("address_country")%> - <%=rsQues1("address_zip")%></td>
                <td><%=rsQues1("kno_passed")%></td>
                <td><%=rsQues1("date_entered")%></td>
                <td><%=rsQues1("date_valid")%></td>
                <td><%=rsQues1("item_number")%></td>
                <td><%=rsQues1("onlinecertissued")%></td>
                <td><%=rsQues1("onlinecertdate")%></td>
                <td><%=rsQues1("phycertissued")%></td>
                <td><%=rsQues1("phycertdate")%></td>
                <td><%=rsQues1("phycertdet")%></td>
              </tr>
              <%rsQues1.MoveNext
		Loop%>
            </table></td>
        </tr>
      </table>
      <%
else
end if
Set rsQues1=Nothing%>
      <%
' Color = CYAN
Set rsQues2 = Server.CreateObject("ADODB.Recordset")

rsQues2.ActiveConnection = ConnObj

rsQues2.Open "SELECT payer_email, first_name, last_name,custom, ebay_address_id, kno_passed, address_street, address_city, address_state, address_country, address_zip, date_entered, date_valid, item_number, color, dategranted, onlinecertissued, onlinecertdate, phycertissued, phycertdate, phycertdet from PaypalDB Where color='"&colorcyan&"' and paypal_address_id <> 'BB' and item_number <> '105' order by ID DESC"

%>
      <table>
        <tr>
          <td><BR>
            <BR>
            <B>Course 312 or 104 (Online and Physical Certificates) - Online Certificates Issued, Physical certificate not yet issued</b><BR>
            <BR>
            <table border="1" padding="4" spacing="4" align="left" width="75%">
              <%
If not rsQues2.BOF then

%>
              <tr>
                <td>Status of certificate</td>
                <td>payer_email</td>
                <td>color</td>
                <td><B>Name</B></td>
                <td>dategranted</td>
                <td><B>Company Name</B></td>
                <td><B>Phone Number</B></td>
                <td>Address</td>
                <td>kno_passed</td>
                <td>date_entered</td>
                <td>date_valid</td>
                <td>item_number</td>
                <td>onlinecertissued</td>
                <td>onlinecertdate</td>
                <td>phycertissued</td>
                <td>phycertdate</td>
                <td>phycertdet</td>
              </tr>
              <%
Do While Not rsQues2.EOF %>
              <tr>
                <td>Online Cert Not Issued, physical cert not issued<BR>
                  # 312 or 104 <BR>
                  <form name="temp1" action="./temp1.asp" method="post">
                    <%=payer_email%>
                    <input type="hidden" name="payer_email" value="<%=rsQues2("payer_email")%>">
                    <input type="hidden" size="20" name="item" value="<%=rsQues2("item_number")%>">
                    <input type="hidden" size="20" name="date1" value="<%=rsQues2("dategranted")%>">
                    <input type="hidden" size="20" name="color" value="Green">
                    <input type="hidden" size="20" name="onlinecertissued" value="Yes">
                    <BR>
                    <input type="hidden" size="20" name="onlinecertdate" value="<%=date()%>">
                    <BR>
                    phycertissued=
                    <input type="text" size="20" name="phycertissued" value="Yes">
                    <BR>
                    phycertdate=
                    <input type="text" size="20" name="phycertdate">
                    <BR>
                    phycertdet=
                    <input type="text" size="20" name="phycertdet">
                    <BR>
                    <input type="submit">
                  </form></td>
                <td><font color="Cyan"><B><%=rsQues2("payer_email")%></B></font></td>
                <td><font color="Cyan"><B><%=rsQues2("color")%></B></font></td>
                <td><font color="Cyan"><%=rsQues2("first_name")%>&nbsp; <%=rsQues2("last_name")%></font></td>
                <td><%=rsQues2("dategranted")%></td>
                <td><%=rsQues2("custom")%></td>
                <td><B><%=rsQues2("ebay_address_id")%></B></td>
                <td><%=rsQues2("address_street")%><BR>
                  <%=rsQues2("address_city")%><BR>
                  <%=rsQues2("address_state")%><BR>
                  <%=rsQues2("address_country")%> - <%=rsQues2("address_zip")%></td>
                <td><%=rsQues2("kno_passed")%></td>
                <td><%=rsQues2("date_entered")%></td>
                <td><%=rsQues2("date_valid")%></td>
                <td><%=rsQues2("item_number")%></td>
                <td><%=rsQues2("onlinecertissued")%></td>
                <td><%=rsQues2("onlinecertdate")%></td>
                <td><%=rsQues2("phycertissued")%></td>
                <td><%=rsQues2("phycertdate")%></td>
                <td><%=rsQues2("phycertdet")%></td>
              </tr>
              <%rsQues2.MoveNext
		Loop%>
            </table></td>
        </tr>
      </table>
      <%
else
end if %>
    </td>
  </tr>
  <tr>
    <td width="20px" bgcolor="black">&nbsp;&nbsp;&nbsp;</td>
    <td><!---------------------------------------------------------------------------------------------->
      <%



Set rsQues = Server.CreateObject("ADODB.Recordset")

' Color = RED
rsQues.ActiveConnection = ConnObj

rsQues.Open "SELECT payer_email, first_name, last_name,custom, ebay_address_id, kno_passed, address_street, address_city, address_state, address_country, address_zip, date_entered, date_valid, item_number, color, dategranted, onlinecertissued, onlinecertdate, phycertissued, phycertdate, phycertdet from PaypalDB Where color='"&colorred&"' and paypal_address_id = 'BB' and item_number <> '105' order by ID DESC"

%>
      <BR>
      <BR>
      <div style="background-color:black; height:15px; width:100%"></div>
      <BR>
      <BR>
      <table>
        <tr>
          <td><B> Course 101 (Online Certificates only) - Not yet issued</B><BR>
            <BR>
            <table border="1" padding="4" spacing="4" align="left" width="75%">
              <%
If not rsQues.BOF then

%>
              <tr>
                <td>Status of certificate</td>
                <td>payer_email</td>
                <td>color</td>
                <td><B>Name</B></td>
                <td>dategranted</td>
                <td><B>Company Name</B></td>
                <td><B>Phone Number</B></td>
                <td>Address</td>
                <td>kno_passed</td>
                <td>date_entered</td>
                <td>date_valid</td>
                <td>item_number</td>
                <td>onlinecertissued</td>
                <td>onlinecertdate</td>
                <td>phycertissued</td>
                <td>phycertdate</td>
                <td>phycertdet</td>
              </tr>
              <%
Do While Not rsQues.EOF %>
              <tr>
                <td>Online only Cert Not Issued<BR>
                  # 101 <BR>
                  <form name="temp1" action="./temp1.asp" method="post">
                    <%=payer_email%>
                    <input type="hidden" name="payer_email" value="<%=rsQues("payer_email")%>">
                    <input type="hidden" size="20" name="date1" value="<%=rsQues("dategranted")%>">
                    <input type="hidden" size="20" name="item" value="<%=rsQues("item_number")%>">
                    <input type="hidden" size="20" name="color" value="Green">
                    onlinecertissued=
                    <input type="text" size="20" name="onlinecertissued" value="Yes">
                    <BR>
                    onlinecertdate=
                    <input type="text" size="20" name="onlinecertdate" value="<%=date()%>">
                    <BR>
                    <input type="submit">
                  </form></td>
                <td><font color="Red"><B><%=rsQues("payer_email")%></B></font></td>
                <td><font color="Red"><B><%=rsQues("color")%></B></font></td>
                <td><font color="Red"><%=rsQues("first_name")%> &nbsp;<%=rsQues("last_name")%></font></td>
                <td><%=rsQues("dategranted")%></td>
                <td><%=rsQues("custom")%></td>
                <td><B><%=rsQues("ebay_address_id")%></B></td>
                <td><%=rsQues("address_street")%><BR>
                  <%=rsQues("address_city")%><BR>
                  <%=rsQues("address_state")%><BR>
                  <%=rsQues("address_country")%> - <%=rsQues("address_zip")%></td>
                <td><%=rsQues("kno_passed")%></td>
                <td><%=rsQues("date_entered")%></td>
                <td><%=rsQues("date_valid")%></td>
                <td><%=rsQues("item_number")%></td>
                <td><%=rsQues("onlinecertissued")%></td>
                <td><%=rsQues("onlinecertdate")%></td>
                <td><%=rsQues("phycertissued")%></td>
                <td><%=rsQues("phycertdate")%></td>
                <td><%=rsQues("phycertdet")%></td>
              </tr>
              <%rsQues.MoveNext
		Loop%>
            </table></td>
        </tr>
        <%
else
end if
Set rsQues=Nothing %>
        <%
' Color = BLUE
Set rsQues1 = Server.CreateObject("ADODB.Recordset")

rsQues1.ActiveConnection = ConnObj

rsQues1.Open "SELECT payer_email, first_name, last_name,custom, ebay_address_id, kno_passed, address_street, address_city, address_state, address_country, address_zip, date_entered, date_valid, item_number, color, dategranted, onlinecertissued, onlinecertdate, phycertissued, phycertdate, phycertdet from PaypalDB Where color='"&colorblue&"' and paypal_address_id = 'BB' and item_number <> '105' order by ID DESC"

%>
        <tr>
          <td><BR>
            <BR>
            <B>Course 102 (Online and Physical Certificates) - Online Certificates not yet issued</b><BR>
            <BR>
            <table border="1" padding="4" spacing="4" align="left" width="75%">
              <%
If not rsQues1.BOF then

%>
              <tr>
                <td>Status of certificate</td>
                <td>payer_email</td>
                <td>color</td>
                <td><B>Name</B></td>
                <td>dategranted</td>
                <td><B>Company Name</B></td>
                <td><B>Phone Number</B></td>
                <td>Address</td>
                <td>kno_passed</td>
                <td>date_entered</td>
                <td>date_valid</td>
                <td>item_number</td>
                <td>onlinecertissued</td>
                <td>onlinecertdate</td>
                <td>phycertissued</td>
                <td>phycertdate</td>
                <td>phycertdet</td>
              </tr>
              <%
Do While Not rsQues1.EOF %>
              <tr>
                <td>Online Cert Not Issued, physical cert not issued<BR>
                  # 102 <BR>
                  <form name="temp1" action="./temp1.asp" method="post">
                    <%=payer_email%>
                    <input type="hidden" name="payer_email" value="<%=rsQues1("payer_email")%>">
                    <input type="hidden" size="20" name="item" value="<%=rsQues1("item_number")%>">
                    <input type="hidden" size="20" name="date1" value="<%=rsQues1("dategranted")%>">
                    <input type="hidden" size="20" name="color" value="Cyan">
                    onlinecertissued=
                    <input type="text" size="20" name="onlinecertissued" value="Yes">
                    <BR>
                    onlinecertdate=
                    <input type="text" size="20" name="onlinecertdate" value="<%=date()%>">
                    <BR>
                    phycertissued=
                    <input type="text" size="20" name="phycertissued" value="No">
                    <BR>
                    <input type="submit">
                  </form></td>
                <td><font color="Blue"><B><%=rsQues1("payer_email")%></B></font></td>
                <td><font color="Blue"><B><%=rsQues1("color")%></B></font></td>
                <td><font color="Blue"><%=rsQues1("first_name")%>&nbsp; <%=rsQues1("last_name")%></font></td>
                <td><%=rsQues1("dategranted")%></td>
                <td><%=rsQues1("custom")%></td>
                <td><B><%=rsQues1("ebay_address_id")%></B></td>
                <td><%=rsQues1("address_street")%><BR>
                  <%=rsQues1("address_city")%><BR>
                  <%=rsQues1("address_state")%><BR>
                  <%=rsQues1("address_country")%> - <%=rsQues1("address_zip")%></td>
                <td><%=rsQues1("kno_passed")%></td>
                <td><%=rsQues1("date_entered")%></td>
                <td><%=rsQues1("date_valid")%></td>
                <td><%=rsQues1("item_number")%></td>
                <td><%=rsQues1("onlinecertissued")%></td>
                <td><%=rsQues1("onlinecertdate")%></td>
                <td><%=rsQues1("phycertissued")%></td>
                <td><%=rsQues1("phycertdate")%></td>
                <td><%=rsQues1("phycertdet")%></td>
              </tr>
              <%rsQues1.MoveNext
		Loop%>
            </table></td>
        </tr>
       
      <%
else
end if
Set rsQues1=Nothing%>
      <%
' Color = CYAN
Set rsQues2 = Server.CreateObject("ADODB.Recordset")

rsQues2.ActiveConnection = ConnObj

rsQues2.Open "SELECT payer_email, first_name, last_name,custom, ebay_address_id, kno_passed, address_street, address_city, address_state, address_country, address_zip, date_entered, date_valid, item_number, color, dategranted, onlinecertissued, onlinecertdate, phycertissued, phycertdate, phycertdet from PaypalDB Where color='"&colorcyan&"' and paypal_address_id = 'BB' and item_number <> '105' order by ID DESC"

%>
  <tr>
    <td><BR>
      <BR>
      <B>Course 102 (Online and Physical Certificates) - Online Certificates Issued, Physical certificate not yet issued</b><BR>
      <BR>
      <table border="1" padding="4" spacing="4" align="left" width="75%">
        <%
If not rsQues2.BOF then

%>
        <tr>
          <td>Status of certificate</td>
          <td>payer_email</td>
          <td>color</td>
          <td><B>Name</B></td>
          <td>dategranted</td>
          <td><B>Company Name</B></td>
          <td><B>Phone Number</B></td>
          <td>Address</td>
          <td>kno_passed</td>
          <td>date_entered</td>
          <td>date_valid</td>
          <td>item_number</td>
          <td>onlinecertissued</td>
          <td>onlinecertdate</td>
          <td>phycertissued</td>
          <td>phycertdate</td>
          <td>phycertdet</td>
        </tr>
        <%
Do While Not rsQues2.EOF %>
        <tr>
          <td>Online Cert Not Issued, physical cert not issued<BR>
            # 102 <BR>
            <form name="temp1" action="./temp1.asp" method="post">
              <%=payer_email%>
              <input type="hidden" name="payer_email" value="<%=rsQues2("payer_email")%>">
              <input type="hidden" size="20" name="item" value="<%=rsQues2("item_number")%>">
              <input type="hidden" size="20" name="date1" value="<%=rsQues2("dategranted")%>">
              <input type="hidden" size="20" name="color" value="Green">
              <input type="hidden" size="20" name="onlinecertissued" value="Yes">
              <BR>
              <input type="hidden" size="20" name="onlinecertdate" value="<%=date()%>">
              <BR>
              phycertissued=
              <input type="text" size="20" name="phycertissued" value="Yes">
              <BR>
              phycertdate=
              <input type="text" size="20" name="phycertdate">
              <BR>
              phycertdet=
              <input type="text" size="20" name="phycertdet">
              <BR>
              <input type="submit">
            </form></td>
          <td><font color="Cyan"><B><%=rsQues2("payer_email")%></B></font></td>
          <td><font color="Cyan"><B><%=rsQues2("color")%></B></font></td>
          <td><font color="Cyan"><%=rsQues2("first_name")%>&nbsp; <%=rsQues2("last_name")%></font></td>
          <td><%=rsQues2("dategranted")%></td>
          <td><%=rsQues2("custom")%></td>
          <td><B><%=rsQues2("ebay_address_id")%></B></td>
          <td><%=rsQues2("address_street")%><BR>
            <%=rsQues2("address_city")%><BR>
            <%=rsQues2("address_state")%><BR>
            <%=rsQues2("address_country")%> - <%=rsQues2("address_zip")%></td>
          <td><%=rsQues2("kno_passed")%></td>
          <td><%=rsQues2("date_entered")%></td>
          <td><%=rsQues2("date_valid")%></td>
          <td><%=rsQues2("item_number")%></td>
          <td><%=rsQues2("onlinecertissued")%></td>
          <td><%=rsQues2("onlinecertdate")%></td>
          <td><%=rsQues2("phycertissued")%></td>
          <td><%=rsQues2("phycertdate")%></td>
          <td><%=rsQues2("phycertdet")%></td>
        </tr>
        <%rsQues2.MoveNext
		Loop%>
      </table></td>
  </tr>
</table>
<%
else
end if %>
</td>
</tr>
</table>
<%
Set rsQues2=Nothing%>
<!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>
