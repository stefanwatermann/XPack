#tag Class
Protected Class PackageApi
Inherits RestApi.Controller
	#tag Event
		Sub Startup()
		  Using RestApi
		  
		  // register request handler methods
		  Self.AddRequestHandler(HttpMethod.GET, "/", AddressOf GetPackages)
		  Self.AddRequestHandler(HttpMethod.GET, "/{guid}", AddressOf GetPackage)
		  Self.AddRequestHandler(HttpMethod.POST, "/{guid}", AddressOf SavePackage)
		  Self.AddRequestHandler(HttpMethod.Get, "/code/{guid}", AddressOf GetPackageCode)
		  Self.AddRequestHandler(HttpMethod.POST, "/code/{guid}", AddressOf SavePackageCode)
		  Self.AddRequestHandler(HttpMethod.DELETE, "/{guid}", AddressOf RemovePackage)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GetPackage(params as Dictionary) As WebResponse
		  // return a list of all packages from the repository
		  
		  Try
		    Var guid As String = params.Value("guid")
		    
		    Print("GetPackage: " + guid)
		    
		    For Each f As FolderItem In app.RepositoryRootFolder.Children
		      If f.Name.EndsWith(".json") Then
		        Var json As String = File.ReadAllText(f)
		        Var package As Dictionary = ParseJsonData(json)
		        If package.Value("Guid") = guid Then
		          Return OkResponse(json, "text/json")
		        End
		      End
		    Next
		    
		    Return NotFoundResponse("package not found")
		    
		  Catch err As RuntimeException
		    Return FailedResponse("error: " + err.Message)
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPackageCode(params as Dictionary) As WebResponse
		  // return XOJO Module code of a package
		  
		  Try
		    
		    Var guid As String = params.Value("guid")
		    
		    Print("GetPackageCode: " + guid)
		    
		    If guid.Length <> 36 Then
		      Raise New RuntimeException("parameter guid missing")
		    End
		    
		    Var f As FolderItem = app.RepositoryRootFolder.Child(guid + ".code")
		    
		    If f = Nil Or Not f.Exists Or f.IsFolder Then
		      Raise New RuntimeException("package code does not exist")
		    End
		    
		    Var raw As MemoryBlock = File.ReadAllBytes(f)
		    Var result As String = EncodeBase64(raw)
		    
		    Return OkResponse(result)
		    
		  Catch err As RuntimeException
		    Return FailedResponse("error: " + err.Message)
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPackages(params as Dictionary) As WebResponse
		  // return a list of all packages from the repository
		  
		  Print("GetPackages")
		  
		  Var result As String = "[ "
		  
		  For Each f As FolderItem In app.RepositoryRootFolder.Children
		    If f.Name.EndsWith(".json") Then
		      Var json As String = File.ReadAllText(f)
		      result = result + json + ","
		    End
		  Next
		  
		  If result.EndsWith(",") Then
		    result = result.Left(result.Length - 1)
		  End
		  
		  result = result + " ]"
		  
		  Return OkResponse(result, "text/json")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ParseJsonData(data as string) As Dictionary
		  Var packageJson As String = data.Trim
		  
		  If packageJson.Length = 0 Then
		    Raise New RuntimeException("empty data")
		  End
		  
		  If Not packageJson.BeginsWith("{") Or Not packageJson.EndsWith("}") Then
		    Raise New RuntimeException("invalid data")
		  End
		  
		  Var package As Dictionary 
		  package = ParseJSON(packageJson)
		  
		  Return package
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PersistPackage(body as string, overwrite as Boolean)
		  Var package As Dictionary = ParseJsonData(Self.Request.Body)
		  
		  Var guid As String = package.Value("Guid")
		  
		  Print("PersistPackage: " + guid)
		  
		  If guid.Length <> 36 Then
		    Raise New RuntimeException("guid missing")
		  End
		  
		  Var f As FolderItem = App.RepositoryRootFolder.Child(guid + ".json")
		  
		  If f.Exists and not overwrite Then
		    Raise New RuntimeException("package already exists")
		  End
		  
		  File.WriteAllText(f, Self.Request.Body)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PersistPackageCode(body as string, guid as string, overwrite as boolean = false)
		  Print("PersistPackageCode: " + guid)
		  
		  If body.Length = 0 Then
		    Raise New RuntimeException("empty body")
		  End
		  
		  If guid.Length <> 36 Then
		    Raise New RuntimeException("parameter guid missing or invalid")
		  End
		  
		  Var f As FolderItem = app.RepositoryRootFolder.Child(guid + ".code")
		  
		  If f <> Nil And f.Exists And Not overwrite Then
		    Raise New RuntimeException("package code already exist")
		  End
		  
		  Var raw As MemoryBlock = DecodeBase64(body)
		  
		  File.WriteAllBytes(f, raw)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemovePackage(params as Dictionary) As WebResponse
		  // removes a package from the repository
		  
		  Try
		    
		    Var guid As String = params.Value("guid")
		    
		    Print("RemovePackage: " + guid)
		    
		    Var found As Boolean = False
		    
		    For Each f As FolderItem In app.RepositoryRootFolder.Children
		      
		      If f.Name = guid + ".json" Then
		        If f <> Nil And f.Exists And Not f.IsFolder Then
		          Var jsonFileRemoved As FolderItem = f.Parent.Child(f.Name + "_removed")
		          f.MoveTo(jsonFileRemoved)
		          found = True
		        End
		      End
		      
		      If f.Name = guid + ".code" Then
		        If f <> Nil And f.Exists And Not f.IsFolder Then
		          Var codeFileRemoved As FolderItem = f.Parent.Child(f.Name + "_removed")
		          f.MoveTo(codeFileRemoved)
		        End
		      End
		      
		    Next
		    
		    If found Then
		      Return OkResponse()
		    Else
		      Return NotFoundResponse("package not found")
		    End
		    
		  Catch err As RuntimeException
		    Return FailedResponse("error: " + err.Message)
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SavePackage(params as Dictionary) As WebResponse
		  // save package to the repository
		  // overwrites an existing package file
		  
		  Try
		    PersistPackage(Request.Body, True)
		    Return OkResponse("ok")
		  Catch err As RuntimeException
		    Return FailedResponse("error: " + err.Message)
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SavePackageCode(params as Dictionary) As WebResponse
		  // save package code (raw XOJO Module)
		  // overwrites an existing package code file
		  
		  Try
		    Var guid As String = params.Value("guid")
		    PersistPackageCode(Request.Body, guid, True)
		    Return OkResponse("ok")
		  Catch err As RuntimeException
		    Return FailedResponse("error: " + err.Message)
		  End
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
