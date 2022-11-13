#tag Class
Protected Class XojoModuleParser
	#tag Method, Flags = &h0
		Sub Constructor(raw as MemoryBlock)
		  self.RawModuleData = raw
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function zGetAttributeValue(a as string) As string
		  Var token As String = """@" + a + """ = """
		  
		  Var start As Integer = Self.RawModuleData.IndexOf(0, token)
		  
		  If start < 0 Then
		    Return ""
		  End
		  
		  start = start + token.Length
		  Var length As Integer = Self.RawModuleData.IndexOf(start, """") - start
		  
		  Var r As String = Self.RawModuleData.Middle(start, length).Trim
		  
		  Return r.DefineEncoding(Encodings.UTF8)
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return zGetAttributeValue("Author")
			End Get
		#tag EndGetter
		AttribAuthor As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return zGetAttributeValue("Category")
			End Get
		#tag EndGetter
		AttribCategory As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return zGetAttributeValue("Copyright")
			End Get
		#tag EndGetter
		AttribCopyright As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return zGetAttributeValue("Depends")
			End Get
		#tag EndGetter
		AttribDepends As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return zGetAttributeValue("Description")
			End Get
		#tag EndGetter
		AttribDescription As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return zGetAttributeValue("Guid")
			End Get
		#tag EndGetter
		AttribGuid As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return zGetAttributeValue("PackageUrl")
			End Get
		#tag EndGetter
		AttribPackageUrl As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return zGetAttributeValue("Version")
			End Get
		#tag EndGetter
		AttribVersion As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Var start As Integer = Self.RawModuleData.IndexOf("NameStrn") + 12
			  Var length As Integer = self.RawModuleData.IndexOf("ContInt") - start
			  Var r As String = Self.RawModuleData.Middle(start, length)
			  Return r.Trim.DefineEncoding(Encodings.UTF8)
			End Get
		#tag EndGetter
		ModuleName As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private RawModuleData As String
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
		#tag ViewProperty
			Name="ModuleName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AttribGuid"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AttribAuthor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AttribCopyright"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AttribDepends"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AttribDescription"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AttribVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AttribCategory"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AttribPackageUrl"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
