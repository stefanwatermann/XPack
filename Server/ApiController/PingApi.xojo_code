#tag Class
Protected Class PingApi
Inherits RestApi.Controller
	#tag Event
		Sub Startup()
		  Using RestApi
		  
		  // register request handler methods
		  Self.AddRequestHandler(HttpMethod.GET, "/", AddressOf Get)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function Get(params as Dictionary) As WebResponse
		  Return OkResponse(DateTime.Now.ToString)
		End Function
	#tag EndMethod


End Class
#tag EndClass
