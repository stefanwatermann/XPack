#tag Module
 Attributes ( "@Version" = "1.0", "@Copyright" = "(c) 2022 - watermann-it.de", "@Guid" = "44F4F2FA-2A86-4640-B3C6-C24914E2F933" ) Protected Module RestApi
	#tag DelegateDeclaration, Flags = &h1, Description = 5573656420666F72206D6574686F647320746861742077696C6C2068616E646C652052455354207265717565737473
		Protected Delegate Function RequestHandlerDelegate(params as Dictionary) As WebResponse
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function StringValue(extends e as RestApi.ContentType) As string
		  // return readable string from HttpMethod enum value
		  
		  Select Case e
		    
		  Case RestApi.ContentType.text_plain
		    Return "text/plain"
		    
		  Case RestApi.ContentType.text_json
		    Return "text/json"
		    
		  Case RestApi.ContentType.text_xml
		    Return "text/xml"
		    
		  Case RestApi.ContentType.application_xml
		    Return "application/xml"
		    
		  Case RestApi.ContentType.application_json
		    Return "application/json"
		    
		  Case RestApi.ContentType.application_base64
		    Return "application/base64"
		    
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue(extends e as RestApi.HttpMethod) As string
		  // return readable string from HttpMethod enum value
		  
		  Select Case e
		    
		  Case RestApi.HttpMethod.GET
		    Return "GET"
		    
		  Case RestApi.HttpMethod.POST
		    Return "POST"
		    
		  Case RestApi.HttpMethod.PUT
		    Return "PUT"
		    
		  Case RestApi.HttpMethod.DELETE
		    Return "DELETE"
		    
		  Case RestApi.HttpMethod.HEAD
		    Return "HEAD"
		    
		  Case RestApi.HttpMethod.PATCH
		    Return "PATCH"
		    
		  Case RestApi.HttpMethod.TRACE
		    Return "TRACE"
		    
		  End
		End Function
	#tag EndMethod


	#tag Enum, Name = AuthResult, Type = Integer, Flags = &h0
		undefined
		  permitted
		denied
	#tag EndEnum

	#tag Enum, Name = ContentType, Type = Integer, Flags = &h0
		text_plain
		  text_json
		  text_xml
		  application_xml
		  application_json
		application_base64
	#tag EndEnum

	#tag Enum, Name = HttpMethod, Type = Integer, Flags = &h0
		GET
		  PUT
		  POST
		  DELETE
		  HEAD
		  PATCH
		TRACE
	#tag EndEnum


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
