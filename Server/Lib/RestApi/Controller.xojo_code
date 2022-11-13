#tag Class
Protected Class Controller
	#tag Method, Flags = &h1
		Protected Sub AddRequestHandler(method as RestApi.HttpMethod, relativePath as string, handlerDelegate as RestApi.RequestHandlerDelegate)
		  Using RestApi
		  
		  if relativePath.EndsWith("/") then relativePath = relativePath.Left(relativePath.Length - 2)
		  
		  Var handlerDef As New RequestHandlerDef
		  handlerDef.Method = method
		  handlerDef.RequestPath = ApiRootPath + relativePath
		  handlerDef.RequestHandlerMethod = handlerDelegate
		  
		  Self.RequestHandler.Add(handlerDef)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Authorize() As RestApi.AuthResult
		  Return RaiseEvent Authorize
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FailedResponse(data as string) As WebResponse
		  Using RestApi
		  
		  self.Response.Reset
		  Self.Response.Status = 500
		  Self.Response.Write(data)
		  Self.Response.MIMEType = ContentType.text_plain.StringValue
		  
		  return self.Response
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NotFoundResponse(data as string) As WebResponse
		  Using RestApi
		  
		  self.Response.Reset
		  Self.Response.Status = 404
		  Self.Response.Write(data)
		  Self.Response.MIMEType = ContentType.text_plain.StringValue
		  
		  return self.Response
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OkResponse() As WebResponse
		  Return OkResponse("")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OkResponse(data as JSONItem) As WebResponse
		  Using RestApi
		  Return OkResponse(data.ToString, ContentType.text_json.StringValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OkResponse(data as string) As WebResponse
		  Using RestApi
		  return OkResponse(data, ContentType.text_plain.StringValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OkResponse(data as string, contentType as RestApi.ContentType) As WebResponse
		  Using RestApi
		  Return OkResponse(data, contentType.StringValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OkResponse(data as string, contentType as String) As WebResponse
		  Using RestApi
		  
		  self.Response.Reset
		  Self.Response.Status = 200
		  Self.Response.Write(data)
		  Self.Response.MIMEType = contentType
		  
		  Return Self.Response
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OkResponse(data as Variant) As WebResponse
		  Using RestApi
		  
		  Var s As String = GenerateJSON(data, True)
		  
		  Return OkResponse(s, ContentType.text_json.StringValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Startup()
		  RaiseEvent Startup
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Authorize() As RestApi.AuthResult
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Startup()
	#tag EndHook


	#tag Property, Flags = &h0
		ApiRootPath As string
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentRequestHandler As RestApi.RequestHandlerDef
	#tag EndProperty

	#tag Property, Flags = &h0
		Request As WebRequest
	#tag EndProperty

	#tag Property, Flags = &h0
		RequestHandler() As RestApi.RequestHandlerDef
	#tag EndProperty

	#tag Property, Flags = &h0
		Response As WebResponse
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
			Name="ApiRootPath"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
