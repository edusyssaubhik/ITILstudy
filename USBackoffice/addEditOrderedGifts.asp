<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
	If Session("USBUserId") = "" Then 
		Response.Redirect("login.asp")
	Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'Written By : Bharath'
'Created Date: 17/02/2010'
'Last Updated Date: 04/03/2010'
'Description :'
'Purpose : Adding the Ordered Gifts into the Database in this page'

'Declare The Variables'
Dim rqPens, rqNeon_yellow, rqNeon_green, rqPencil, rqPen_holder, rqCalculator, rqBackpack, rqCap, rqBall, rqNotes
Dim rqPens_expdate, rqNeon_yellow_expdate, rqNeon_green_expdate, rqPencil_expdate, rqPen_holder_expdate, rqCalculator_expdate, rqBackpack_expdate, rqCap_expdate, rqBall_expdate, rqNotes_expdate
Dim rqPen_price, rqNeon_yellow_price, rqNeon_green_price, rqPencil_price, rqPen_holder_price, rqCalculator_price, rqBackpack_price, rqCap_price, rqBall_price, rqNotes_price
Dim rqComment
Dim strOrderNumber, strShippingDetails
Dim objRs
Dim Max_Order_No
Dim strOrderDetails
Dim rqType, rqComments, rqFaculty

'Creating Recordset'
Set objRs = Server.CreateObject("ADODB.Recordset")

'Retrive the type of action'
rqType = Request.Form("type")

'Replace single code with double code function'
Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function

'Retrive the number of gifts ordered from upsOrderedGifts.asp page'
rqPens        = Request.Form("pens")
rqNeon_yellow = Request.Form("neon_yellow")
rqNeon_green  = Request.Form("neon_green")
rqPencil      = Request.Form("pencil")
rqPen_holder  = Request.Form("pen_holder")
rqCalculator  = Request.Form("calculator")
rqBackpack    = Request.Form("backpack")
rqCap         = Request.Form("cap")
rqBall        = Request.Form("ball")
rqNotes       = Request.Form("notes")

'Retrive the prices for gift from upsOrderedGifts.asp page'
rqPen_price          = Request.Form("pen_price")
rqNeon_yellow_price  = Request.Form("neon_yellow_price")
rqNeon_green_price   = Request.Form("neon_green_price")
rqPencil_price       = Request.Form("pencil_price")
rqPen_holder_price   = Request.Form("pen_holder_price")
rqCalculator_price   = Request.Form("calculator_price")
rqBackpack_price     = Request.Form("backpack_price")
rqCap_price          = Request.Form("cap_price")
rqBall_price         = Request.Form("ball_price")
rqNotes_price        = Request.Form("notes_price")

'Retrive the receing gifts expected date ordered  from upsOrderedGifts.asp page'
rqPens_expdate         = Request.Form("pens_expdate")
rqNeon_yellow_expdate  = Request.Form("neon_yellow_expdate")
rqNeon_green_expdate   = Request.Form("neon_green_expdate") 
rqPencil_expdate       = Request.Form("pencil_expdate")
rqPen_holder_expdate   = Request.Form("pen_holder_expdate")
rqCalculator_expdate   = Request.Form("calculator_expdate")
rqBackpack_expdate     = Request.Form("backpack_expdate")
rqCap_expdate          = Request.Form("cap_expdate")
rqBall_expdate         = Request.Form("ball_expdate")
rqNotes_expdate        = Request.Form("notes_expdate")

'Retrive the comments'
rqComment = Request.Form("comments")

'If User add the order gifts in the upsOrderedGifts page that details will come here'
If rqType = "Order Gifts" Then

'Retrive the maximum OREDER NUMBER'
'If order number is 1, i am incrementing (+1) order number and inserting the values'

strOrderNumber = "SELECT Max(order_no) As max_order_no FROM ps_ordered_gifts"

objRs.Open strOrderNumber, ConnObj

'If Max_Order_No = 1 or morethan 1, increment 1 and insert the values'
'Else Max_Order_No = 1'

If (Not objRs.BOF) And (Not objRs.EOF) Then 
				
	Max_Order_No = objRs("max_order_no")
	
	If IsNull(Max_Order_No) Then
		Max_Order_No = 1
	Else
		Max_Order_No =  Max_Order_No  + 1
	End If

End If

'Inserting the values into the ps_ordered_gifts table'
strOrderDetails = "INSERT INTO ps_ordered_gifts (order_no, gift_name, number_of_ordered, price_per_unit, expected_date, added_by, added_date) "
strOrderDetails = strOrderDetails & "SELECT '"& Max_Order_No &"', '4 in 1 Pens', '"& rqPens &"', '"& rqPen_price &"', '"& rqPens_expdate &"', '"& Session("USBUserId") &"', '"& Now() &"'"
strOrderDetails = strOrderDetails & " UNION ALL "
strOrderDetails = strOrderDetails & "SELECT '"& Max_Order_No &"', 'Highlighter Neon Yellow', '"& rqNeon_yellow &"', '"& rqNeon_yellow_price &"', '"& rqNeon_yellow_expdate &"', '"& Session("USBUserId") &"', '"& Now() &"'"
strOrderDetails = strOrderDetails & " UNION ALL "
strOrderDetails = strOrderDetails & "SELECT '"& Max_Order_No &"', 'Highlighter Neon Green', '"& rqNeon_green &"', '"& rqNeon_green_price &"', '"& rqNeon_green_expdate &"', '"& Session("USBUserId") &"', '"& Now() &"'"
strOrderDetails = strOrderDetails & " UNION ALL "
strOrderDetails = strOrderDetails & "SELECT '"& Max_Order_No &"', 'Pencil - Z- Grip', '"& rqPencil &"', '"& rqPencil_price &"', '"& rqPencil_expdate &"', '"& Session("USBUserId") &"', '"& Now() &"'"
strOrderDetails = strOrderDetails & " UNION ALL "
strOrderDetails = strOrderDetails & "SELECT '"& Max_Order_No &"', 'Quick Point Pen Holder', '"& rqPen_holder &"', '"& rqPen_holder_price &"', '"& rqPen_holder_expdate &"', '"& Session("USBUserId") &"', '"& Now() &"'"
strOrderDetails = strOrderDetails & " UNION ALL "
strOrderDetails = strOrderDetails & "SELECT '"& Max_Order_No &"', 'Robot Series Calculator', '"& rqCalculator &"', '"& rqCalculator_price &"', '"& rqCalculator_expdate &"', '"& Session("USBUserId") &"', '"& Now() &"'"
strOrderDetails = strOrderDetails & " UNION ALL "
strOrderDetails = strOrderDetails & "SELECT '"& Max_Order_No &"', 'Backpack Travel', '"& rqBackpack &"', '"& rqBackpack_price &"', '"& rqBackpack_expdate &"', '"& Session("USBUserId") &"', '"& Now() &"'"
strOrderDetails = strOrderDetails & " UNION ALL "
strOrderDetails = strOrderDetails & "SELECT '"& Max_Order_No &"', 'Cap', '"& rqCap &"', '"& rqCap_price &"', '"& rqCap_expdate &"', '"& Session("USBUserId") &"', '"& Now() &"'"
strOrderDetails = strOrderDetails & " UNION ALL "
strOrderDetails = strOrderDetails & "SELECT '"& Max_Order_No &"', 'Stress Ball', '"& rqBall &"', '"& rqBall_price &"', '"& rqBall_expdate &"', '"& Session("USBUserId") &"', '"& Now() &"'"
strOrderDetails = strOrderDetails & " UNION ALL "
strOrderDetails = strOrderDetails & "SELECT '"& Max_Order_No &"', 'Post It Notes', '"& rqNotes &"', '"& rqNotes_price &"', '"& rqNotes_expdate &"', '"& Session("USBUserId") &"', '"& Now() &"'"

'Insert ordered gift comments'
If rqComment <> "" Then

ConnObj.EXECUTE("INSERT INTO ps_ordered_gifts_comments (comment, comm_addedby, comm_addeddate, order_no) VALUES ('"& StrQuoteReplace(rqComment) &"', '"& Session("USBUserId") &"', '"& Now() &"', '"& Max_Order_No &"')")

End If

'Response.Write(strOrderDetails)
ConnObj.Execute(strOrderDetails)

'After inserting the values into the database redirect to upsOrderedGifts.asp page'
Response.Redirect("upsOrderedGifts.asp")

'User updating the existing records'
'Updating Ordered Gifts'
ElseIf rqType = "Edit Ordered Gifts" Then


ConnObj.Execute("UPDATE ps_ordered_gifts SET number_of_ordered = '"& rqPens &"', price_per_unit = '" & rqPen_price &"', expected_date = '"& rqPens_expdate &"' WHERE ordered_id = '"& Request.Form("order_id1") &"'")

ConnObj.Execute("UPDATE ps_ordered_gifts SET number_of_ordered = '"& rqNeon_yellow &"', price_per_unit = '" & rqNeon_yellow_price &"', expected_date = '"& rqNeon_yellow_expdate &"' WHERE ordered_id = '"& Request.Form("order_id2") &"'")

ConnObj.Execute("UPDATE ps_ordered_gifts SET number_of_ordered = '"& rqNeon_green &"', price_per_unit = '" & rqNeon_green_price &"', expected_date = '"& rqNeon_green_expdate &"' WHERE ordered_id = '"& Request.Form("order_id3") &"'")

ConnObj.Execute("UPDATE ps_ordered_gifts SET number_of_ordered = '"& rqPencil &"', price_per_unit = '" & rqPencil_price &"', expected_date = '"& rqPencil_expdate &"' WHERE ordered_id = '"& Request.Form("order_id4") &"'")

ConnObj.Execute("UPDATE ps_ordered_gifts SET number_of_ordered = '"& rqPen_holder &"', price_per_unit = '" & rqPen_holder_price &"', expected_date = '"& rqPen_holder_expdate &"' WHERE ordered_id = '"& Request.Form("order_id5") &"'")

ConnObj.Execute("UPDATE ps_ordered_gifts SET number_of_ordered = '"& rqCalculator &"', price_per_unit = '" & rqCalculator_price &"', expected_date = '"& rqCalculator_expdate &"' WHERE ordered_id = '"& Request.Form("order_id6") &"'")

ConnObj.Execute("UPDATE ps_ordered_gifts SET number_of_ordered = '"& rqBackpack &"', price_per_unit = '" & rqBackpack_price &"', expected_date = '"& rqBackpack_expdate &"' WHERE ordered_id = '"& Request.Form("order_id7") &"'")

ConnObj.Execute("UPDATE ps_ordered_gifts SET number_of_ordered = '"& rqCap &"', price_per_unit = '" & rqCap_price &"', expected_date = '"& rqCap_expdate &"' WHERE ordered_id = '"&Request.Form("order_id8") &"'")

ConnObj.Execute("UPDATE ps_ordered_gifts SET number_of_ordered = '"& rqBall &"', price_per_unit = '" & rqBall_price &"', expected_date = '"& rqNotes_expdate &"' WHERE ordered_id = '"& Request.Form("order_id9") &"'")

ConnObj.Execute("UPDATE ps_ordered_gifts SET number_of_ordered = '"& rqNotes &"', price_per_unit = '" & rqNotes_price &"', expected_date = '"& rqNotes_expdate &"' WHERE ordered_id = '"& Request.Form("order_id10") &"'")

'Adding the comment'
If rqComment <> "" Then

ConnObj.EXECUTE("INSERT INTO ps_ordered_gifts_comments (comment, comm_addedby, comm_addeddate, order_no) VALUES ('"& StrQuoteReplace(rqComment) &"', '"& Session("USBUserId") &"', '"& Now() &"', '"& Request.Form("order_no") &"')")

End If

'After updating the values into the database redirect to upsOrderedGifts.asp page'
Response.Redirect("upsOrderedGifts.asp")

'User is adding shippment details in the upsOrderedGifts.asp page that details are inserting here'
ElseIf rqType = "Shipment" Then

'Retrive the number of gifts shipped to faculty from upsOrderedGifts.asp page'
rqFaculty     = Request.Form("faculty")
rqPens        = Request.Form("pens")
rqNeon_yellow = Request.Form("neon_yellow")
rqNeon_green  = Request.Form("neon_green")
rqPencil      = Request.Form("pencil")
rqPen_holder  = Request.Form("pen_holder")
rqCalculator  = Request.Form("calculator")
rqBackpack    = Request.Form("backpack")
rqCap         = Request.Form("cap")
rqBall        = Request.Form("ball")
rqNotes       = Request.Form("notes")
rqComments    = Request.Form("comments")


strShippingDetails = "INSERT INTO faculty_shipping_gifts (fac_emailid, pens, highlighter_yellow, highlighter_green, pencil, pen_holder, calculator, backpack, cap, stressball, postit_notes, comment, added_by, added_date) VALUES ('"& rqFaculty &"', '"& rqPens &"', '"& rqNeon_yellow &"', '"& rqNeon_green &"', '"& rqPencil &"', '"& rqPen_holder &"', '"& rqCalculator &"', '"& rqBackpack &"', '"& rqCap &"', '"& rqBall &"', '"& rqNotes &"', '"& StrQuoteReplace(rqComments) &"', '"& Session("USBUserId") &"', '"& Now() &"')"

ConnObj.Execute(strShippingDetails)

'After inserting the values into the database redirect to upsOrderedGifts.asp page'
Response.Redirect("upsOrderedGifts.asp")

ElseIf rqType = "Edit Shipment" Then

'Retrive the number of edited gifts shipped to faculty from upsOrderedGifts.asp page'
rqShipping_Id = Request.Form("shipping_id")
rqFaculty     = Request.Form("faculty")
rqPens        = Request.Form("pens")
rqNeon_yellow = Request.Form("neon_yellow")
rqNeon_green  = Request.Form("neon_green")
rqPencil      = Request.Form("pencil")
rqPen_holder  = Request.Form("pen_holder")
rqCalculator  = Request.Form("calculator")
rqBackpack    = Request.Form("backpack")
rqCap         = Request.Form("cap")
rqBall        = Request.Form("ball")
rqNotes       = Request.Form("notes")
rqComments    = Request.Form("comment")
rqNewComments = Request.Form("addcomments")

'Adding previos comments and two breaks and present comment'
'If existing comment is not there then enter without breaks'
If rqComments = "" Then
	Comments = rqNewComments
Else
	Comments = rqComments & "<br><br>" & rqNewComments
End If

'upadating the records'
ConnObj.Execute("UPDATE faculty_shipping_gifts SET pens = '"& rqPens &"', highlighter_yellow = '"& rqNeon_yellow &"', highlighter_green = '"& rqNeon_green &"', pencil = '"&rqPencil  &"' ,pen_holder = '"& rqPen_holder &"' , calculator = '"& rqCalculator &"', backpack = '"& rqBackpack &"', cap = '"& rqCap &"', stressball = '"& rqBall &"', postit_notes = '"& rqNotes &"', comment = '"& Comments &"' WHERE shipping_id = '"& rqShipping_Id &"'")

'After updating the values into the database redirect to upsOrderedGifts.asp page'
Response.Redirect("upsOrderedGifts.asp?action=allshippingDet")

End If

End If

%>