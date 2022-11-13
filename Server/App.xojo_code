#tag Class
Protected Class App
Inherits RestApi.Application
	#tag Event
		Function Authenticate(request as WebRequest) As RestApi.AuthResult
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Startup()
		  Using RestApi
		  
		  Self.RegisterApi(GetTypeInfo(PingApi))
		  Self.RegisterApi(GetTypeInfo(PackageApi))
		End Sub
	#tag EndEvent


	#tag Note, Name = copyright
		XPackApi - A package manager solution for XOJO modules
		======================================================
		
		Copyright (c) 2022 Stefan Watermann, Germany - All Rights Reserved.
		
		You may use, distribute and modify this code under the terms of the MIT license.
	#tag EndNote

	#tag Note, Name = install
		
		sc create XPackApi type= own start= auto binpath= E:\\Software\\xpackapi\xpackapi.exe
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Var configFile As new FolderItem("./" + kAppConfigFileName)
			  
			  If configFile = Nil Or Not configFile.Exists Then
			    Print("Error: config file not found.")
			    Return Nil
			  Else
			    
			    Var json As String = File.ReadAllText(configFile)
			    
			    Var config As Dictionary = ParseJSON(json)
			    
			    Var folderName As String = config.Value("RepositoryFolderPath")
			    
			    Var repoFolder As New FolderItem(folderName)
			    
			    If Not repoFolder.Exists Or Not repoFolder.IsFolder Then
			      Print("Error: Repository folder '" + folderName + "' not found.")
			      Return Nil
			    End
			    
			    return repoFolder
			  End
			End Get
		#tag EndGetter
		RepositoryRootFolder As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return str(app.MajorVersion) + "." + str(app.MinorVersion) + "." + str(app.BugVersion) + "." + str(app.NonReleaseVersion)
			End Get
		#tag EndGetter
		VersionString As String
	#tag EndComputedProperty


	#tag Constant, Name = kAppConfigFileName, Type = String, Dynamic = False, Default = \"xpackapi.config", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="ApiRootPath"
			Visible=false
			Group="Behavior"
			InitialValue="api"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VersionString"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
