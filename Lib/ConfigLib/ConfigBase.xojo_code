#tag Class
Class ConfigBase
	#tag Method, Flags = &h0, Description = 4E616D652077696C6C206265207573656420617320666F6C6465726E616D6520756E646572204170706C69636174696F6E44617461
		Sub Constructor(name as string)
		  Self.FolderName = name
		  Self.InternalData = New Dictionary
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DecodeValue(value as string) As variant
		  Var type As String = value.Left(value.IndexOf(":"))
		  Var data As String = value.Right(value.Length - value.IndexOf(":") - 1)
		  Var result As Variant
		  
		  // if HEX encoding was used, data starts with &x
		  If data.BeginsWith("&x") Then
		    data = DecodeHex(data.Replace("&x", ""))
		  End
		  
		  Select Case type
		  Case "Int64"
		    result = data.ToInt64
		    
		  Case "Int32"
		    result = data.ToInteger
		    
		  Case "Integer"
		    result = data.ToInteger
		    
		  Case "DateTime"
		    result = DateTime.FromString(data)
		    
		  Case "Boolean"
		    result = Boolean.FromString(data)
		    
		  Case "Double"
		    result = data.ToDouble
		    
		  Case "String"
		    result = data
		    
		  Case "Text"
		    result = data.ToText
		    
		  Case "Color"
		    Var i As Int32 = data.Val
		    Var c As Color = Color(i)
		    result = c
		    
		  Else
		    Raise New RuntimeException("Unsupported property-type '" + type + "'.", 103)
		    
		  End
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function EncodeProperty(prop as Introspection.PropertyInfo, asHex as Boolean = false) As string
		  Var type As String = prop.PropertyType.FullName
		  Var value As Variant = prop.Value(Self)
		  Var data As String
		  
		  Select Case type
		  Case "Int64"
		    data = value.Int64Value.ToString
		    
		  Case "Int32"
		    data = value.Int32Value.ToString
		    
		  Case "Integer"
		    data = value.IntegerValue.ToString
		    
		  Case "DateTime"
		    data = value.DateTimeValue.SQLDateTime
		    
		  Case "Boolean"
		    data = value.BooleanValue.ToString
		    
		  Case "Double"
		    data = value.DoubleValue.ToString
		    
		  Case "String"
		    data = value.StringValue
		    
		  Case "Text"
		    data = value.TextValue
		    asHex = True
		    
		  Case "Color"
		    data = value.StringValue
		    
		  Else
		    Raise New RuntimeException("Unsupported property-type '" + type + "'.", 103)
		    
		  End
		  
		  If asHex Then
		    data = "&x" + EncodeHex(data)
		  End
		  
		  Return type + ":" + data
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetConfigFile() As FolderItem
		  Return self.ConfigFile
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InternalDataToProps()
		  Var myProperties() As Introspection.PropertyInfo = Introspection.GetType(Self).GetProperties
		  
		  For Each prop As Introspection.PropertyInfo In myProperties
		    If prop.IsPublic Then
		      For Each entry As DictionaryEntry In Self.InternalData
		        If entry.key.StringValue.Lowercase = prop.Name.Lowercase Then
		          //Var type As String = entry.Value.StringValue.NthField(":", 1)
		          //Var value As String = entry.Value.StringValue.NthField(":", 2)
		          //prop.Value(Self) = DecodeHex(value)
		          prop.Value(Self) = DecodeValue(entry.Value.StringValue)
		        End
		      Next
		    End
		  Next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load()
		  ReadConfigFile
		  InternalDataToProps
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PropsToInternalData()
		  InternalData.RemoveAll
		  
		  Var myProperties() As Introspection.PropertyInfo = Introspection.GetType(Self).GetProperties
		  
		  For Each prop As Introspection.PropertyInfo In myProperties
		    If prop.IsPublic Then
		      InternalData.Value(prop.Name) = EncodeProperty(prop)
		    End
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReadConfigFile()
		  If Self.ConfigFile = Nil Or Not Self.ConfigFile.Exists Then
		    Raise New RuntimeException("Config file not available", 101)
		  End
		  
		  Self.InternalData = New Dictionary
		  
		  Var t As TextInputStream = TextInputStream.Open(Self.ConfigFile)
		  t.Encoding = Encodings.UTF8
		  
		  While Not t.EndOfFile
		    Var line As String = t.ReadLine
		    Var key As String = line.NthField("=", 1)
		    Var value As String = line.NthField("=", 2)
		    Self.InternalData.Value(key) = value
		  Wend
		  
		  t.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save()
		  PropsToInternalData
		  WriteConfigFile
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WriteConfigFile()
		  Var file As FolderItem = Self.ConfigFile
		  
		  Var output As TextOutputStream = TextOutputStream.Create(file)
		  output.Encoding = Encodings.UTF8
		  
		  For Each entry As DictionaryEntry In Self.InternalData
		    output.WriteLine(entry.Key + "=" + entry.Value)
		  Next
		  
		  output.Close
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Var folder As FolderItem = SpecialFolder.ApplicationData.Child(Self.FolderName)
			  If Not folder.Exists Or Not folder.IsFolder Then
			    folder.CreateFolder
			  End
			  
			  Return folder.Child("config.cfg")
			End Get
		#tag EndGetter
		Private ConfigFile As FolderItem
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private FolderName As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private InternalData As Dictionary
	#tag EndProperty


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
End Class
#tag EndClass
