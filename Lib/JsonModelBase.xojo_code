#tag Class
 Attributes ( "@Version" = "1.1", "@Copyright" = "(c) 2022 watermann-it.de", "@Guid" = "7391BC4F-5E17-4EED-A7FC-7D000EF67BA5", "@Author" = "Stefan Watermann", "@Description" = "Base-class used for model-classes to convert to and from JSON.", "@Depends" = "-" ) Protected Class JsonModelBase
	#tag Method, Flags = &h0
		Shared Sub FromJson(json as String, o as Object)
		  Using Introspection
		  
		  Var data As Dictionary = ParseJSON(json)
		  
		  Var t As Introspection.TypeInfo = Introspection.GetType(o)
		  
		  For Each p As PropertyInfo In t.GetProperties
		    If p.IsPublic And p.CanWrite And Not p.IsComputed Then
		      
		      If data.HasKey(p.Name) Then
		        
		        If p.PropertyType.FullName = "String" Then
		          p.Value(o) = data.Value(p.Name).StringValue
		        End
		        
		        If p.PropertyType.FullName = "DateTime" Then
		          p.Value(o) = data.Value(p.Name).DateTimeValue
		        End
		        
		        If p.PropertyType.FullName = "Integer" Then
		          p.Value(o) = data.Value(p.Name).IntegerValue
		        End
		        
		        If p.PropertyType.FullName = "Int32" Then
		          p.Value(o) = data.Value(p.Name).Int32Value
		        End
		        
		        If p.PropertyType.FullName = "Int64" Then
		          p.Value(o) = data.Value(p.Name).Int64Value
		        End
		        
		        If p.PropertyType.FullName = "Double" Then
		          p.Value(o) = data.Value(p.Name).DoubleValue
		        End
		        
		        If p.PropertyType.FullName = "Boolean" Then
		          p.Value(o) = data.Value(p.Name).BooleanValue
		        End
		        
		      End
		      
		    End
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToJson() As string
		  Using Introspection
		  
		  Var json As New JSONItem
		  
		  Var t As Introspection.TypeInfo = Introspection.GetType(Self)
		  
		  For Each p As PropertyInfo In t.GetProperties
		    
		    If p.IsPublic And p.CanRead And Not p.IsComputed Then
		      
		      If p.PropertyType.FullName = "Integer" Then
		        json.Value(p.Name) = p.Value(Self).IntegerValue
		        
		      ElseIf p.PropertyType.FullName = "Int32" Then
		        json.Value(p.Name) = p.Value(Self).Int32Value
		        
		      ElseIf p.PropertyType.FullName = "Int64" Then
		        json.Value(p.Name) = p.Value(Self).Int64Value
		        
		      ElseIf p.PropertyType.FullName = "Double" Then
		        json.Value(p.Name) = p.Value(Self).DoubleValue
		        
		      Else
		        json.Value(p.Name) = p.Value(Self).StringValue
		      End
		      
		    End
		    
		  Next
		  
		  Return json.ToString 
		End Function
	#tag EndMethod


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
