<%
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'Copyright (c) CCAvenue . 2003 - 2005 -- All Rights Reserved
'PROJECT					:	   CCAvenue World
'MODULE					:	   CC-World Transaction Page
'FILE							:	   libFunctions.asp
'DATE CREATED		:      September 25, 2003, 6:55:25 PM
'DESCRIPTION		:	   It is a function file which is used to generate or verify checksum.
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%>

<%
function verifyCheckSumAll(MerchantId,OrderId,Amount,WorkingKey,currencyType,Auth_Status,checksum) 
		str = MerchantId&"|"&OrderId&"|"&Amount&"|"&WorkingKey&"|"&currencyType&"|"&Auth_Status
		'response.write "<br>str:"&str
		adler = 1
		adler = adler32(adler,str)
		'response.write "<br>adler:"&adler
		if strcomp (adler , checksum ,1) = 0 then
		retval = "true"
		else
		retval = "false"
		end if
		verifyCheckSumAll = retval
end function 


function getChecksum(MerchantId, OrderId, Amount, WorkingKey, currencyType,redirectURL) 
		str = MerchantId&"|"&OrderId&"|"&Amount&"|"&WorkingKey&"|"&currencyType&"|"&redirectURL
		adler = 1
		adler = adler32(adler,str)
		getchecksum = adler
end function


'function used by getchecksum function for updating checksum value
function adler32(adler,buf)
		BASE = 65521 
		s1 = andop(adler,65535)
		s2 = andop(cdec(rightshift(cbin(adler) , 16)),65535)

		for  n = 1 to len(buf)
		s1 = (s1 + asc(mid(buf, n , 1))) MOD BASE
		s2 = (s2 + s1) MOD BASE
		next
		adler32 =  cdec(leftshift(cbin(s2) , 16)) + s1
end function


'function used for bitwise left shifting
function leftshift(str , num)
		for i = 1 to 32 - len(str)
		str = "0"&str
		next

		for i = 1 to num 
		str = str&"0"
		str = right(str , len(str)-1 )
		next
		leftshift=str
end function


'function used for bitwise right shifting
function rightshift(str , num)
		for i = 1 to num 
		str = "0"&str
		str = left(str , len(str)-1 )
		next
		rightshift=str 
end function

'function used for decimal to binary conversion
function cbin(num)
		do
		bin = cstr((num mod 2))&bin
		num = fix(num / 2)
		loop while not ((num = 0) )	 

		for i = 1 to 32 - len(bin)
		bin = "0"&bin
		next
		cbin = bin
end function

'function used for  binary to decimal conversion
function cdec(num)
		for n = 1 to len(num) 
		dec =  dec + cint(mid(num , n ,1))*power(len(num) - n)
		next
		cdec = dec
end function


'function used for calculate value of 2^n
function power(num)
		result = 1 	
		for i = 1 to num
		result = result * 2
		next			
		power = result 
end function

function andop(op1 , op2)
		op3 = cbin(op1)	
		op4 = cbin(op2)
		for i = 1 to 32
		op = op&""&(cint(mid(op3 , i ,1)) and cint(mid(op4 ,i ,1)))
		next
		andop = cdec(op)
end function
%>

