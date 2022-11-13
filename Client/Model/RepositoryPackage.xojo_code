#tag Class
Protected Class RepositoryPackage
Inherits JsonModelBase
	#tag Property, Flags = &h0
		Category As string
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Self.Version.Contains(".") Then
			    
			    // split version string into version-parts
			    Var s() As String = Self.Version.Split(".")
			    
			    // get max length of version-parts
			    Var m As Integer = 1
			    For i As Integer = 0 To s.Count - 1
			      If s(i).Length > m Then
			        m = s(i).Length
			      End
			    Next
			    
			    // create format template based on largest version-part
			    Var f As String
			    For i As Integer = 1 To m 
			      f = f + "0"
			    Next
			    
			    Var r As String
			    For i As Integer = 0 To s.Count - 1
			      r = r + Format(Val(s(i)), f)
			    Next
			    
			    Return Val("1" + r)
			  Else
			    Return Val(Self.Version)
			  End
			End Get
		#tag EndGetter
		ComparableVersion As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Copyright As String
	#tag EndProperty

	#tag Property, Flags = &h0
		CreatedAt As DateTime
	#tag EndProperty

	#tag Property, Flags = &h0
		CreatedBy As string
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		Dependencies As Dictionary
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Description As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Guid As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		PackageUrl As string
	#tag EndProperty

	#tag Property, Flags = &h0
		RawDependencies As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Version As String
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
			Name="Guid"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Version"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Copyright"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CreatedBy"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RawDependencies"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Category"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PackageUrl"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
