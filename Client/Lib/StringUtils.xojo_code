#tag Module
 Attributes ( "@Version" = "1.0.1", "@Copyright" = "(c) 2022 - watermann-it.de", "@Guid" = "9A196C78-B85B-4A82-AB07-DF96995CCFFF" ) Protected Module StringUtils
	#tag Method, Flags = &h0
		Function Contains(extends s as String, find as String) As Boolean
		  Dim i As Integer = s.InStr(find)
		  If i > 0 Then
		    Return True
		  Else
		    Return False
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContainsB(extends s as String, find as String) As Boolean
		  Dim i As Integer = s.InStrB(find)
		  return i > 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateSafeFilename(extends filename as string, replaceCharacter as string = "_") As String
		  If Left(filename, 1) = "." Then 
		    filename = filename.Replace(".", replaceCharacter)
		  End
		  
		  Return Left(filename. _
		  ReplaceAll(":", replaceCharacter). _
		  ReplaceAll("?", replaceCharacter). _
		  ReplaceAll("/", replaceCharacter). _
		  ReplaceAll("\", replaceCharacter). _
		  ReplaceAll("$", replaceCharacter). _
		  ReplaceAll("""", replaceCharacter). _
		  ReplaceAll("<", replaceCharacter). _
		  ReplaceAll(">", replaceCharacter). _
		  ReplaceAll("*", replaceCharacter). _
		  ReplaceAll("|", replaceCharacter), 255)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Format2(extends s as String, ParamArray args as variant) As String
		  return FormatString(s, args)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Format2(s as String, ParamArray args as variant) As string
		  return FormatString(s, args)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FormatDate(d as variant, ident as string) As String
		  Dim fmt As String = GetFormat(ident)
		  
		  Dim dayw As Integer
		  Dim day As Integer
		  Dim month As Integer
		  Dim year As Integer
		  Dim hour As Integer
		  Dim minute As Integer
		  Dim second As Integer
		  
		  If d.Type = TypeXojoDate Then
		    // xojo framework date()
		    Dim dt As xojo.core.date = d
		    dayw = dt.DayOfWeek
		    day = dt.Day
		    month = dt.Month
		    year = dt.Year
		    hour = dt.Hour 
		    minute = dt.Minute
		    second = dt.Second
		  Else
		    // classic framework date()
		    dayw = d.DateValue.DayOfWeek
		    day = d.DateValue.Day
		    month = d.DateValue.Month
		    year = d.DateValue.Year
		    hour = d.DateValue.Hour 
		    minute = d.DateValue.Minute
		    second = d.DateValue.Second
		  End
		  
		  // map hour
		  If fmt.ContainsB("hh") Then
		    fmt = fmt.ReplaceAllB("hh", Str(hour, "00"))
		  Elseif fmt.Contains("h") Then
		    fmt = fmt.ReplaceAllB("h", Str(hour))
		  End
		  
		  // map minute
		  If fmt.ContainsB("mm") Then
		    fmt = fmt.ReplaceAllB("mm", Str(minute, "00"))
		  Elseif fmt.Contains("m") Then
		    fmt = fmt.ReplaceAllB("m", Str(minute))
		  End
		  
		  // map second
		  If fmt.ContainsB("ss") Then
		    fmt = fmt.ReplaceAllB("ss", Str(second, "00"))
		  Elseif fmt.ContainsB("s") Then
		    fmt = fmt.ReplaceAllB("s", Str(second))
		  End
		  
		  // map year
		  If fmt.ContainsB("yyyy") Then
		    fmt = fmt.ReplaceAllB("yyyy", Str(year))
		  Elseif fmt.ContainsB("yy") Then
		    fmt = fmt.ReplaceAllB("yy", Str(year).Right(2))
		  End
		  
		  // map month
		  If fmt.ContainsB("MMM") Then
		    fmt = fmt.ReplaceAllB("MMM", MonthNamesList.NthField(",", month))
		  End
		  If fmt.ContainsB("MM") Then
		    fmt = fmt.ReplaceAllB("MM", Str(month, "00"))
		  End
		  If fmt.ContainsB("M") Then
		    fmt = fmt.ReplaceEx("M", Str(month))
		  End
		  
		  // map day
		  If fmt.Contains("ddd") Then
		    fmt = fmt.ReplaceAllB("ddd", DayNamesList.NthField(",", dayw))
		  End
		  If fmt.Contains("dd") Then
		    fmt = fmt.ReplaceAllB("dd", Str(day, "00"))
		  End
		  If fmt.Contains("d") Then
		    fmt = fmt.ReplaceEx("d", Str(day))
		  End
		  
		  Return fmt
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FormatDouble(d as variant, ident as String) As string
		  Dim fmt As String = GetFormat(ident)
		  Return Format(d.DoubleValue, fmt)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FormatString(s as String, args() as variant) As string
		  If args <> Nil Then
		    
		    PrepareListOfIdents(s)
		    
		    If UBound(args) + 1 <> Idents.Count Then
		      Raise New Format2ArgumentCountException(args.Ubound, Idents.Count)
		    End
		    
		    For i As Integer = 0 To args.Ubound
		      
		      Dim ident As String = Idents.Value(i)
		      
		      Dim t As Integer = args(i).Type
		      
		      Select Case t
		        
		      Case Variant.TypeString
		        s = s.Replace(ident, args(i).StringValue.ConvertEncoding(Encodings.UTF8))
		        
		      Case Variant.TypeInteger
		        s = s.Replace(ident, Str(args(i).IntegerValue))
		        
		      Case Variant.TypeBoolean
		        s = s.Replace(ident, Str(args(i).BooleanValue))
		        
		      Case Variant.TypeDouble
		        s = s.Replace(ident, FormatDouble(args(i), ident))
		        
		      Case Variant.TypeDate
		        s = s.Replace(ident, FormatDate(args(i), ident))
		        
		      Case TypeXojoDate
		        s = s.Replace(ident, FormatDate(args(i), ident))
		        
		      Case Variant.TypeSingle
		        s = s.Replace(ident, Str(args(i).SingleValue))
		        
		      Case Variant.TypeText
		        s = s.Replace(ident, args(i).TextValue)
		        
		      Case Variant.TypeColor
		        s = s.Replace(ident, Str(args(i).ColorValue))
		        
		      Else
		        s = s.Replace(ident, args(i).StringValue)
		        
		      End
		      
		    Next
		    
		    Return s
		  Else
		    Return s
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetFormat(ident as String) As String
		  If ident.Contains(":") Then
		    Dim s As String = ident.Right(ident.Len - ident.InStr(":")).Replace("}", "")
		    Return s
		  Else
		    Return ""
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewGuid() As String
		  // From http://www.cryptosys.net/pki/uuid-rfc4122.html
		  //
		  // Generate 16 random bytes (=128 bits)
		  // Adjust certain bits according to RFC 4122 section 4.4 as follows:
		  // set the four most significant bits of the 7th byte to 0100'B, so the high nibble is '4'
		  // set the two most significant bits of the 9th byte to 10'B, so the high nibble will be one of '8', '9', 'A', or 'B'.
		  // Convert the adjusted bytes to 32 hexadecimal digits
		  // Add four hyphen '-' characters to obtain blocks of 8, 4, 4, 4 and 12 hex digits
		  // Output the resulting 36-character string "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
		  
		  Dim randomBytes As MemoryBlock = Crypto.GenerateRandomBytes(16)
		  randomBytes.LittleEndian = False
		  
		  //
		  // Adjust seventh byte
		  //
		  Dim value As Byte = randomBytes.Byte(6)
		  value = value And &b00001111 // Turn off the first four bits
		  value = value Or &b01000000 // Turn on the second bit
		  randomBytes.Byte(6) = value
		  
		  //
		  // Adjust ninth byte
		  //
		  value = randomBytes.Byte(8)
		  value = value And &b00111111 // Turn off the first two bits
		  value = value Or &b10000000 // Turn on the first bit
		  randomBytes.Byte(8) = value
		  
		  
		  Dim result As String = EncodeHex(randomBytes)
		  result = result.LeftB(8) + "-" + result.MidB(9, 4) + "-" + result.MidB(13, 4) + "-" + result.MidB(17, 4) + _
		  "-" + result.RightB(12)
		  
		  Return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PadRight(Extends s as string, length as integer, character as string = " ") As string
		  If length - s.Length < 0 Then
		    Return s
		  Else
		    Var c() As String
		    Redim c(length - s.Length)
		    Return s + Join(c, " ")
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrepareListOfIdents(s as string)
		  Idents = New Dictionary
		  
		  Dim rgx As New RegEx
		  rgx.SearchPattern = "{.*?}"
		  
		  Dim rgm As regexmatch = rgx.Search(s)
		  Do
		    If rgm <> Nil Then
		      Dim ident As String = rgm.SubExpressionString(0)
		      Dim index As Integer = Val(ident.Replace("{", ""))
		      Idents.Value(index) = ident
		    End 
		    rgm = rgx.Search
		  Loop Until rgm Is Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReplaceEx(Extends t as string, find as string, replace as string) As string
		  Dim re As New RegEx
		  re.SearchPattern = "\b([" + find + "])\b"
		  re.ReplacementPattern = Replace
		  return re.Replace(t)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Idents As Dictionary
	#tag EndProperty


	#tag Constant, Name = DayNamesList, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Sunday\x2CMonday\x2CTuesday\x2CWednesday\x2CThursday\x2CFriday\x2CSaturday"
	#tag EndConstant

	#tag Constant, Name = MonthNamesList, Type = String, Dynamic = False, Default = \"", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"January\x2CFebruary\x2CMarch\x2CApril\x2CMay\x2CJune\x2CJuly\x2CAugust\x2CSeptember\x2COctober\x2CNovember\x2CDecember"
	#tag EndConstant

	#tag Constant, Name = TypeXojoDate, Type = Double, Dynamic = False, Default = \"9", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
