#tag Class
Protected Class Application
Inherits WebApplication
	#tag Event
		Function HandleURL(Request As WebRequest, Response As WebResponse) As Boolean
		  // handle api requests
		  If Request.Path.BeginsWith(ApiRootPath + "/") Then
		    
		    // return error 500 if no api-handler has been configured
		    If Self.Controllers.Count = 0 Then
		      Response.Write("No ApiHandler configured at all.")
		      Response.Status = 500
		      Return True
		    End
		    
		    // find api-handler and hand-over request
		    For Each cntrlReg As RestApi.ControllerDef In Self.Controllers
		      If Request.Path.BeginsWith(cntrlReg.ApiRootPath) Then
		        InvokeApiController(cntrlReg, request, response)
		        Return True
		      End
		    Next
		    
		    // no api-handler found
		    Response.Status = 404
		    Response.Write("No ApiHandler found for resource path.")
		    Return True
		    
		  End
		  
		  // handle swagger request
		  If Request.Path.BeginsWith("swagger/") Then
		    GenerateSwaggerPage(Request, Response)
		  End 
		  
		  Return False
		End Function
	#tag EndEvent

	#tag Event
		Sub Opening(args() as String)
		  MakeDemon(args)
		  
		  RaiseEvent Startup
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function Authenticate(request as WebRequest) As RestApi.AuthResult
		  return RaiseEvent Authenticate(request)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GenerateSwaggerPage(request as WebRequest, response as WebResponse)
		  Using RestApi
		  
		  For Each cntrlDef As ControllerDef In Controllers
		    
		    Var cntrl As Controller = GetControllerInstance(cntrlDef)
		    
		    For Each handlerDef As RequestHandlerDef In cntrl.RequestHandler
		      
		      
		    Next
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetControllerInstance(cntrlDef as RestApi.ControllerDef) As RestApi.Controller
		  Using RestApi
		  
		  Var constructors() As Introspection.ConstructorInfo = cntrlDef.ControllerType.GetConstructors()
		  Var instance As Variant = constructors(0).Invoke()
		  Var cntrl As Controller = instance
		  
		  Return cntrl
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetParameter(controllerSections() as String, requestSections() as string, querySections() as string) As Dictionary
		  Using RestApi
		  
		  Var d As New Dictionary
		  
		  Var i As Integer = 0
		  For Each section As String In requestSections
		    If i < controllerSections.Count And _
		      controllerSections(i).BeginsWith("{") And _
		      controllerSections(i).EndsWith("}") Then
		      d.Value(controllerSections(i).Replace("{", "").Replace("}", "")) = section
		    Else
		      d.Value(i) = section
		    End
		    i = i + 1
		  Next
		  
		  For Each query As String In querySections
		    Var item() As String = query.Split("=")
		    d.Value(item(0)) = item(1)
		  Next
		  
		  Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InvokeApiController(cntrlDef as RestApi.ControllerDef, request as WebRequest, response as WebResponse)
		  Using RestApi
		  
		  Try
		    
		    // check authentication
		    If Self.Authenticate(request) = AuthResult.denied Then
		      response.Reset
		      response.Status = 401
		      response.Write("unauthorized")
		      response.MIMEType = ContentType.text_plain.StringValue
		      Return
		    End
		    
		    // initialize Api-Controller
		    Var cntrl As Controller = GetControllerInstance(cntrlDef)
		    
		    cntrl.ApiRootPath = cntrlDef.ApiRootPath
		    cntrl.Request = request
		    cntrl.Response = response
		    cntrl.Startup
		    
		    // return status 405 if no handler implements http method or current request
		    If Not RequestedMethodImplemented(cntrl) Then
		      response.Reset
		      response.Status = 405
		      response.Write("method not allowed")
		      response.MIMEType = ContentType.text_plain.StringValue
		      Return
		    End
		    
		    // has controller authorized current request?
		    If cntrl.Authorize = AuthResult.denied Then
		      response.Reset
		      response.Status = 403
		      response.Write("unauthorized request")
		      response.MIMEType = ContentType.text_plain.StringValue
		      Return
		    End
		    
		    // now invoke request handler
		    For Each handlerDef As RequestHandlerDef In cntrl.RequestHandler
		      cntrl.CurrentRequestHandler = handlerDef
		      
		      Var controllerSections() As String = cntrl.CurrentRequestHandler.RequestPath.Split("/")
		      Var requestSections() As String = cntrl.Request.Path.Split("/")
		      Var querySections() As String = cntrl.Request.QueryString.Split("&")
		      
		      If request.Path.BeginsWith(cntrl.ApiRootPath) And controllerSections.Count = requestSections.Count Then
		        
		        If Request.Method = handlerDef.Method.StringValue Then
		          
		          System.Log(System.LogLevelInformation, "Path '" + handlerDef.RequestPath + "' called by Agent '" + request.Header("User-Agent") + "'")
		          
		          Call handlerDef.RequestHandlerMethod.invoke(GetParameter(controllerSections, requestSections, querySections))
		          
		        End
		        
		      End
		    Next
		    
		  Catch err As RuntimeException
		    response.Reset
		    response.Status = 500
		    response.Write("server error (" + err.Message + ")")
		    response.MIMEType = ContentType.text_plain.StringValue
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MakeDemon(args() as string)
		  #If Not DebugBuild Then // Do not try to daemonize a debug build
		    If (args(1) = "start" Or args(1) = "-d") Then // Check for command-line parameter to daemonize
		      If Not App.Daemonize Then
		        System.Log( System.LogLevelCritical, "Could not daemonize the app.")
		        Quit (-1)
		      End If
		    End If
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RegisterApi(controllerType as Introspection.TypeInfo)
		  Var path As String = ApiRootPath + "/" + controllerType.Name.Replace("api", "")
		  Self.RegisterApi(path, controllerType)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RegisterApi(apiRootPath as string, controllerType as Introspection.TypeInfo)
		  Var crtlReg As New RestApi.ControllerDef 
		  crtlReg.ApiRootPath = apiRootPath
		  crtlReg.ControllerType = controllerType
		  
		  Self.Controllers.Add(crtlReg)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RequestedMethodImplemented(cntrl as RestApi.Controller) As Boolean
		  Using RestApi
		  
		  For Each handlerDef As RequestHandlerDef In cntrl.RequestHandler
		    If handlerDef.Method.StringValue = cntrl.Request.Method Then
		      Return True
		    End
		  Next
		  
		  Return False
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Authenticate(request as WebRequest) As RestApi.AuthResult
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Startup()
	#tag EndHook


	#tag Property, Flags = &h0, Description = 526F6F7420656C656D656E74206F66207468652041504920706174682C2064656661756C742069732022617069222E
		ApiRootPath As String = "api"
	#tag EndProperty

	#tag Property, Flags = &h0
		Controllers() As ControllerDef
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ApiRootPath"
			Visible=false
			Group="Behavior"
			InitialValue="api"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
