<%
 'Written By : Praveen Kumar'
 'Last UpaDated: 01/03/2011'
 'Description :'
 'Purpose : For Executing Pagination '
%>

<html>
<head>
<style type="text/css">

div.pagination a {
     padding: 7px;
     border: 0px;
     text-decoration: underline;
	 
}
</style>
</head>
<body>

<%
	
	function getPaginationString(page, totalitems, limit, adjacents, targetpage)	
		'other vars
		prev = page - 1								
		nextPage = page + 1								
		lastpage = Ceil(totalitems , limit)			
		lpm1 = lastpage - 1								
		
		pagination = ""
		if lastpage > 1 then
        
        pagination = pagination & "<div class=""pagination"""
			
			pagination = pagination &  ">"
	
	
			'previous button
			if page > 1 then
				pagination = pagination &  "<a href="""&targetpage&"&page="&prev&""">&lt;&lt; Prev</a>"
			end if
			
			'pages	
			if lastpage < 7 + (adjacents * 2) then	

				for counter = 1 to lastpage
				
					if counter = page then
						pagination = pagination &  "<span class=""current"">"&counter&"</span>"
					else
						pagination = pagination &  "<a href="""&targetpage&""&"&page="&counter&""">"&counter&"</a>"
					end if
				next	
			elseif lastpage >= 7 + (adjacents * 2) then	
				'close to beginning only hide later pages
				if page < 1 + (adjacents * 3) then	
					for counter = 1 to (4 + (adjacents * 2))-1
						if counter = page then
							pagination = pagination &  "<span class=""current"">"&counter&"</span>"
						else
							pagination = pagination &  "<a href="""&targetpage&"&page="&counter&""">"&counter&"</a>"
						end if			
					next 
					pagination = pagination &  "......"
					pagination = pagination &  "<a href="""&targetpage&""&"&page="&lpm1&""">"&lpm1&"</a>"
					pagination = pagination &  "<a href="""&targetpage&""&"&page="&lastpage&""">"&lastpage&"</a>"		
				'in middle hide some front and some back
				elseif lastpage - (adjacents * 2) > page AND page > (adjacents * 2) then
					pagination = pagination &  "<a href="""&targetpage&"&page=1"">1</a>"
					pagination = pagination &  "<a href="""&targetpage&"&page=2"">2</a>"
					pagination = pagination &  "......"
				
					for counter = (page - adjacents) to (page + adjacents)
						if counter = page then
							pagination = pagination &  "<span class=""current"">"&counter&"</span>"
						else
							pagination = pagination &  "<a href="""&targetpage&"&page="&counter&""">"&counter&"</a>"
						end if
					next
					pagination = pagination &  "......"
					pagination = pagination &  "<a href="""&targetpage&"&page="&lpm1&""">"&lpm1&"</a>"
					pagination = pagination &  "<a href="""&targetpage&"page="&lastpage&""">"&lastpage&"</a>"		
				'close to end only hide early pages 
				else
					pagination = pagination &  "<a href="""&targetpage&"&page=1"">1</a>"
					pagination = pagination &  "<a href="""&targetpage&"&page=2"">2</a>"
					pagination = pagination &  "......"
					for counter = (lastpage - (1 + (adjacents * 3))) To lastpage
						if counter = page then
							pagination = pagination &  "<span class=""current"">"&counter&"</span>"
						else
							pagination = pagination &  "<a href="""&targetpage&"&page="&counter&""">"&counter&"</a>"
						end if
					next
				end if
			end if
			'nextPage button
			if page < counter - 1 then
				pagination = pagination &  "<a href="""&targetpage&"&page="&nextPage&"""> &gt;&gt;Next</a>"
			end if
			pagination = pagination &  "</div>" & vbnewline
		end if
		getPaginationString = pagination
	end function
	function Ceil( dividend, divider)
		if (dividend mod divider) = 0 Then
			Ceil = dividend / divider
		ELSE
			Ceil = Int(dividend / divider) + 1
		End if
    End function
	'test script code 
	page = 1
	if request("page") <> "" then 
		page=cint(request("page")) 
	end if
	
%>
</body>
</html>
