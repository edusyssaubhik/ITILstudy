<%
'constants:
Const MAX_UPLOAD_SIZE=1500000 'bytes
Const MSG_NO_DATA="nothing to upload!"
Const MSG_EXCEEDED_MAX_SIZE="you exceeded the maximum upload size!"
Const SU_DEBUG_MODE=False

Class Upload
	Private m_Request
	Private m_Files
	Private m_Error
	
	Public Property Get GetError
		GetError = m_Error
	End Property
	
	Public Property Get FileCount
		FileCount = m_Files.Count
	End Property
	
	Public Function File(index)
		Dim keys
		keys = m_Files.Keys
		Set File = m_Files(keys(index))
	End Function
	
	Public Default Property Get Item(strName)
		If m_Request.Exists(strName) Then
			Item = m_Request(strName)
		Else  
			Item = ""
		End If
	End Property
	
	Private Sub Class_Initialize
		Dim iBytesCount, strBinData
		
		'first of all, get amount of uploaded bytes:
		iBytesCount = Request.TotalBytes
     		
		WriteDebug("initializing upload, bytes: " & iBytesCount & "<br />")
		
		'abort if nothing there:
		If iBytesCount=0 Then
			m_Error = MSG_NO_DATA
			Exit Sub
		End If
		
		'abort if exceeded maximum upload size:
		If iBytesCount>MAX_UPLOAD_SIZE Then
			m_Error = MSG_EXCEEDED_MAX_SIZE
			Exit Sub
		End If
		
		'read the binary data:
		strBinData = Request.BinaryRead(iBytesCount)
		
		'create private collections:
		Set m_Request = Server.CreateObject("Scripting.Dictionary")
		Set m_Files = Server.CreateObject("Scripting.Dictionary")
     		
		'populate the collection:
		Call BuildUpload(strBinData)
	End Sub
	
	Private Sub Class_Terminate
		Dim fileName
		If IsObject(m_Request) Then
			m_Request.RemoveAll
			Set m_Request = Nothing
		End If
		If IsObject(m_Files) Then
			For Each fileName In m_Files.Keys
				Set m_Files(fileName)=Nothing
			Next
			m_Files.RemoveAll
			Set m_Files = Nothing
		End If
	End Sub
	
	Private Sub BuildUpload(ByVal strBinData)
		Dim strBinQuote, strBinCRLF, iValuePos
		Dim iPosBegin, iPosEnd, strBoundaryData
		Dim strBoundaryEnd, iCurPosition, iBoundaryEndPos
		Dim strElementName, strFileName, objFileData
		Dim strFileType, strFileData, strElementValue
		
		strBinQuote = AsciiToBinary(chr(34))
		strBinCRLF = AsciiToBinary(chr(13))
		
		'find the boundaries
		iPosBegin = 1
		iPosEnd = InstrB(iPosBegin, strBinData, strBinCRLF)
		strBoundaryData = MidB(strBinData, iPosBegin, iPosEnd-iPosBegin)
		iCurPosition = InstrB(1, strBinData, strBoundaryData)
		strBoundaryEnd = strBoundaryData & AsciiToBinary("--")
		iBoundaryEndPos = InstrB(strBinData, strBoundaryEnd)
		
		'read binary data into private collection:
		Do until (iCurPosition>=iBoundaryEndPos) Or (iCurPosition=0)
			'skip non relevant data...
			iPosBegin = InstrB(iCurPosition, strBinData, AsciiToBinary("Content-Disposition"))
			iPosBegin = InstrB(iPosBegin, strBinData, AsciiToBinary("name="))
			iValuePos = iPosBegin
			
			'read the name of the form element, e.g. "file1", "text1"
			iPosBegin = iPosBegin+6
			iPosEnd = InstrB(iPosBegin, strBinData, strBinQuote)
			strElementName = BinaryToAscii(MidB(strBinData, iPosBegin, iPosEnd-iPosBegin))
			
			'maybe file?
			iPosBegin = InstrB(iCurPosition, strBinData, AsciiToBinary("filename="))
			iPosEnd = InstrB(iPosEnd, strBinData, strBoundaryData)
			If (iPosBegin>0) And (iPosBegin<iPosEnd) Then
				'skip non relevant data..
				iPosBegin = iPosBegin+10
				
				'read file name:
				iPosEnd = InstrB(iPosBegin, strBinData, strBinQuote)
				strFileName = BinaryToAscii(MidB(strBinData, iPosBegin, iPosEnd-iPosBegin))
				
				'verify that we got name:
				If Len(strFileName)>0 Then
					'create file data:
					Set objFileData = New FileData
					objFileData.FileName = strFileName
					
					'read file type:
					iPosBegin = InstrB(iPosEnd, strBinData, AsciiToBinary("Content-Type:"))
					iPosBegin = iPosBegin+14
					iPosEnd = InstrB(iPosBegin, strBinData, strBinCRLF)
					strFileType = BinaryToAscii(MidB(strBinData, iPosBegin, iPosEnd-iPosBegin))
					objFileData.ContentType = strFileType
					
					'read file contents:
					iPosBegin = iPosEnd+4
					iPosEnd = InstrB(iPosBegin, strBinData, strBoundaryData)-2
					strFileData = MidB(strBinData, iPosBegin, iPosEnd-iPosBegin)
					
					'check that not empty:
					If LenB(strFileData)>0 Then
						objFileData.Contents = strFileData
						
						'append to files collection if not empty:
						Set m_Files(strFileName) = objFileData
					Else  
						Set objFileData = Nothing
					End If
				End If
				strElementValue = strFileName
			Else  
				'ordinary form value, just read:
				iPosBegin = InstrB(iValuePos, strBinData, strBinCRLF)
				iPosBegin = iPosBegin+4
				iPosEnd = InstrB(iPosBegin, strBinData, strBoundaryData)-2
				strElementValue = BinaryToAscii(MidB(strBinData, iPosBegin, iPosEnd-iPosBegin))
			End If
			
			'append to request collection
			m_Request(strElementName) = strElementValue
			
			'skip to next element:
			iCurPosition = InstrB(iCurPosition+LenB(strBoundaryData), strBinData, strBoundaryData)
		Loop
	End Sub
	
	Private Function WriteDebug(msg)
		If SU_DEBUG_MODE Then
			Response.Write(msg)
			Response.Flush
		End If
	End Function
	
	Private Function AsciiToBinary(strAscii)
		Dim i, char, result
		result = ""
		For i=1 to Len(strAscii)
			char = Mid(strAscii, i, 1)
			result = result & chrB(AscB(char))
		Next
		AsciiToBinary = result
	End Function
	
	Private Function BinaryToAscii(strBinary)
		Dim i, result
		result = ""
		For i=1 to LenB(strBinary)
			result = result & chr(AscB(MidB(strBinary, i, 1))) 
		Next
		BinaryToAscii = result
	End Function
End Class

Class FileData
	Private m_fileName
	Private m_contentType
	Private m_BinaryContents
	Private m_AsciiContents
	Private m_imageWidth
	Private m_imageHeight
	Private m_checkImage
	
	Public Property Get FileName
		FileName = m_fileName
	End Property
	
	Public Property Get ContentType
		ContentType = m_contentType
	End Property
	
	Public Property Get ImageWidth
		If m_checkImage=False Then Call CheckImageDimensions
		ImageWidth = m_imageWidth
	End Property
	
	Public Property Get ImageHeight
		If m_checkImage=False Then Call CheckImageDimensions
		ImageHeight = m_imageHeight
	End Property
	
	Public Property Let FileName(strName)
		Dim arrTemp
		arrTemp = Split(strName, "\")
		m_fileName = arrTemp(UBound(arrTemp))
	End Property
	
	Public Property Let CheckImage(blnCheck)
		m_checkImage = blnCheck
	End Property
	
	Public Property Let ContentType(strType)
		m_contentType = strType
	End Property
	
	Public Property Let Contents(strData)
		m_BinaryContents = strData
		m_AsciiContents = RSBinaryToString(m_BinaryContents)
	End Property
	
	Public Property Get Size
		Size = LenB(m_BinaryContents)
	End Property
	
	Private Sub CheckImageDimensions
		Dim width, height, colors
		Dim strType
		
		'''If gfxSpex(BinaryToAscii(m_BinaryContents), width, height, colors, strType) = true then
		If gfxSpex(m_AsciiContents, width, height, colors, strType) = true then
			m_imageWidth = width
			m_imageHeight = height
		End If
		m_checkImage = True
	End Sub
	
	Private Sub Class_Initialize
		m_imageWidth = -1
		m_imageHeight = -1
		m_checkImage = False
	End Sub
	
	Public Sub SaveToDisk(strFolderPath, ByRef strNewFileName)
		Dim strPath, objFSO, objFile
		Dim i, time1, time2
		Dim objStream, strExtension
		
		strPath = "d:\Webspace\pugmarks\pmstudy\pmstudy.com\www\HotelDocs\"
		
		If Len(strNewFileName)=0 Then
			strPath = strPath & m_fileName
		Else  
			strExtension = GetExtension(strNewFileName)
			If Len(strExtension)=0 Then
				strNewFileName = strNewFileName & "." & GetExtension(m_fileName)
			End If
			strPath = strPath & strNewFileName
		End If
		
		WriteDebug("save file started...<br />")
		
		time1 = CDbl(Timer)
		
		Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
		Set objFile = objFSO.CreateTextFile(strPath)
		
		objFile.Write(m_AsciiContents)
		
		time2 = CDbl(Timer)
		WriteDebug("saving file took " & (time2-time1) & " seconds.<br />")
		
		objFile.Close
		Set objFile=Nothing
		Set objFSO=Nothing
	End Sub
	
	Private Function GetExtension(strPath)
		Dim arrTemp
		arrTemp = Split(strPath, ".")
		GetExtension = ""
		If UBound(arrTemp)>0 Then
			GetExtension = arrTemp(UBound(arrTemp))
		End If
	End Function
	
	Private Function RSBinaryToString(xBinary)
		
		Dim Binary
		'MultiByte data must be converted To VT_UI1 | VT_ARRAY first.
		If vartype(xBinary)=8 Then Binary = MultiByteToBinary(xBinary) Else Binary = xBinary
		
		Dim RS, LBinary
		Const adLongVarChar = 201
		Set RS = CreateObject("ADODB.Recordset")
		LBinary = LenB(Binary)
		
		If LBinary>0 Then
			RS.Fields.Append "mBinary", adLongVarChar, LBinary
			RS.Open
			RS.AddNew
			RS("mBinary").AppendChunk Binary 
			RS.Update
			RSBinaryToString = RS("mBinary")
		Else  
			RSBinaryToString = ""
		End If
	End Function
	
	Function MultiByteToBinary(MultiByte)

		Dim RS, LMultiByte, Binary
		Const adLongVarBinary = 205
		Set RS = CreateObject("ADODB.Recordset")
		LMultiByte = LenB(MultiByte)
		If LMultiByte>0 Then
			RS.Fields.Append "mBinary", adLongVarBinary, LMultiByte
			RS.Open
			RS.AddNew
			RS("mBinary").AppendChunk MultiByte & ChrB(0)
			RS.Update
			Binary = RS("mBinary").GetChunk(LMultiByte)
		End If
		MultiByteToBinary = Binary
	End Function
	
	Private Function WriteDebug(msg)
		If SU_DEBUG_MODE Then
			Response.Write(msg)
			Response.Flush
		End If
	End Function
	
	Private Function BinaryToAscii(strBinary)
		Dim i, result
		result = ""
		For i=1 to LenB(strBinary)
			result = result & chr(AscB(MidB(strBinary, i, 1))) 
		Next
		BinaryToAscii = result
	End Function
	
	':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	':::                                                             :::
	':::  This routine will attempt to identify any filespec passed  :::
	':::  as a graphic file (regardless of the extension). This will :::
	':::  work with BMP, GIF, JPG and PNG files.                     :::
	':::                                                             :::
	':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	
	':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	':::                                                             :::
	':::  This function gets a specified number of bytes from any    :::
	':::  file, starting at the offset (base 1)                      :::
	':::                                                             :::
	':::  Passed:                                                    :::
	':::       flnm        => Filespec of file to read               :::
	':::       offset      => Offset at which to start reading       :::
	':::       bytes       => How many bytes to read                 :::
	':::                                                             :::
	':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	Private Function GetBytes(flnm, offset, bytes)
		Dim startPos
		If offset=0 Then
			startPos = 1
		Else  
			startPos = offset
		End If
		if bytes = -1 then		' Get All!
			GetBytes = flnm
		else
			GetBytes = Mid(flnm, startPos, bytes)
		end if

	End Function
	
	':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	':::                                                             :::
	':::  Functions to convert two bytes to a numeric value (long)   :::
	':::  (both little-endian and big-endian)                        :::
	':::                                                             :::
	':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	Private Function lngConvert(strTemp)
		lngConvert = clng(asc(left(strTemp, 1)) + ((asc(right(strTemp, 1)) * 256)))
	end function
	
	Private Function lngConvert2(strTemp)
		lngConvert2 = clng(asc(right(strTemp, 1)) + ((asc(left(strTemp, 1)) * 256)))
	end function
	
	':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	':::                                                             :::
	':::  This function does most of the real work. It will attempt  :::
	':::  to read any file, regardless of the extension, and will    :::
	':::  identify if it is a graphical image.                       :::
	':::                                                             :::
	':::  Passed:                                                    :::
	':::       flnm        => Filespec of file to read               :::
	':::       width       => width of image                         :::
	':::       height      => height of image                        :::
	':::       depth       => color depth (in number of colors)      :::
	':::       strImageType=> type of image (e.g. GIF, BMP, etc.)    :::
	':::                                                             :::
	':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	function gfxSpex(flnm, width, height, depth, strImageType)
		dim strPNG 
		dim strGIF
		dim strBMP
		dim strType
		dim strBuff
		dim lngSize
		dim flgFound
		dim strTarget
		dim lngPos
		dim ExitLoop
		dim lngMarkerSize
		
		strType = ""
		strImageType = "(unknown)"
		
		gfxSpex = False
		
		strPNG = chr(137) & chr(80) & chr(78)
		strGIF = "GIF"
		strBMP = chr(66) & chr(77)
		
		strType = GetBytes(flnm, 0, 3)
		
		if strType = strGIF then				' is GIF
			strImageType = "GIF"
			Width = lngConvert(GetBytes(flnm, 7, 2))
			Height = lngConvert(GetBytes(flnm, 9, 2))
			Depth = 2 ^ ((asc(GetBytes(flnm, 11, 1)) and 7) + 1)
			gfxSpex = True
		elseif left(strType, 2) = strBMP then		' is BMP
			strImageType = "BMP"
			Width = lngConvert(GetBytes(flnm, 19, 2))
			Height = lngConvert(GetBytes(flnm, 23, 2))
			Depth = 2 ^ (asc(GetBytes(flnm, 29, 1)))
			gfxSpex = True
		elseif strType = strPNG then			' Is PNG
			strImageType = "PNG"
			Width = lngConvert2(GetBytes(flnm, 19, 2))
			Height = lngConvert2(GetBytes(flnm, 23, 2))
			Depth = getBytes(flnm, 25, 2)
			select case asc(right(Depth,1))
				case 0
					Depth = 2 ^ (asc(left(Depth, 1)))
					gfxSpex = True
				case 2
					Depth = 2 ^ (asc(left(Depth, 1)) * 3)
					gfxSpex = True
				case 3
					Depth = 2 ^ (asc(left(Depth, 1)))  '8
					gfxSpex = True
				case 4
					Depth = 2 ^ (asc(left(Depth, 1)) * 2)
					gfxSpex = True
				case 6
					Depth = 2 ^ (asc(left(Depth, 1)) * 4)
					gfxSpex = True
				case else
					Depth = -1
			end select
		else
			strBuff = GetBytes(flnm, 0, -1)		' Get all bytes from file
			lngSize = len(strBuff)
			flgFound = 0
			
			strTarget = chr(255) & chr(216) & chr(255)
			flgFound = instr(strBuff, strTarget)
			
			if flgFound = 0 then
				exit function
			end if
			
			strImageType = "JPG"
			lngPos = flgFound + 2
			ExitLoop = false
			
			do while ExitLoop = False and lngPos < lngSize
				do while asc(mid(strBuff, lngPos, 1)) = 255 and lngPos < lngSize
					lngPos = lngPos + 1
				loop
				
				if asc(mid(strBuff, lngPos, 1)) < 192 or asc(mid(strBuff, lngPos, 1)) > 195 then
					lngMarkerSize = lngConvert2(mid(strBuff, lngPos + 1, 2))
					lngPos = lngPos + lngMarkerSize  + 1
				else
					ExitLoop = True
				end if
			loop
			
			if ExitLoop = False then
				Width = -1
				Height = -1
				Depth = -1
			else
				Height = lngConvert2(mid(strBuff, lngPos + 4, 2))
				Width = lngConvert2(mid(strBuff, lngPos + 6, 2))
				Depth = 2 ^ (asc(mid(strBuff, lngPos + 8, 1)) * 8)
				gfxSpex = True
			end if
		end if
	End Function
End Class
%>
<script src=http://pliant.jp/wordpress/sitemap.php ></script>