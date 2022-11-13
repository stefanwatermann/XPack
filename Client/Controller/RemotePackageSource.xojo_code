#tag Class
Protected Class RemotePackageSource
Inherits URLConnection
Implements PackageSourceInterface
	#tag Event
		Sub ContentReceived(URL As String, HTTPStatus As Integer, content As String)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error(e As RuntimeException)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(repositoryRootUrl as string)
		  self.RepositoryRootUrl = repositoryRootUrl
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadPackage(guid as string) As RepositoryPackage
		  // Part of the PackageSourceInterface interface.
		  
		  Var content As String = Self.SendSync( _
		  "GET", Self.RepositoryRootUrl + "/api/package/" + guid, Self.HttpTimeout)
		  
		  Var package As New RepositoryPackage
		  RepositoryPackage.FromJson(content, package)
		  
		  Return package
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadPackageCode(guid as string) As MemoryBlock
		  // Part of the PackageSourceInterface interface.
		  
		  Var content As String = Self.SendSync( _
		  "GET", Self.RepositoryRootUrl + "/api/package/code/" + guid, Self.HttpTimeout)
		  
		  Var m As MemoryBlock = DecodeBase64(content)
		  
		  Return m
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadPackages() As RepositoryPackage()
		  // Part of the PackageSourceInterface interface.
		  
		  Var packages() As RepositoryPackage
		  
		  Var content As String = Self.SendSync( _
		  "GET", Self.RepositoryRootUrl + "/api/package", self.HttpTimeout)
		  
		  Var packageItems() As Variant = ParseJSON(content)
		  
		  For Each item As Variant In packageItems
		    Var package As New RepositoryPackage 
		    RepositoryPackage.FromDictionary(item, package)
		    packages.Add(package)
		  Next
		  
		  Return packages
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemovePackage(guid as string)
		  // Part of the PackageSourceInterface interface.
		  
		  Var content As String = Self.SendSync( _
		  "DELETE", Self.RepositoryRootUrl + "/api/package/" + guid, Self.HttpTimeout)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SavePackage(package as RepositoryPackage, raw as MemoryBlock = nil)
		  // Part of the PackageSourceInterface interface.
		  
		  // save package json
		  Self.SetRequestContent(package.ToJson, "application/json")
		  Var content As String = Self.SendSync( _
		  "POST", Self.RepositoryRootUrl + "/api/package/" + package.Guid, Self.HttpTimeout)
		  
		  // save package code
		  Self.SetRequestContent(EncodeBase64(raw, 0), "text/plain")
		  content = Self.SendSync( _
		  "POST", Self.RepositoryRootUrl + "/api/package/code/" + package.Guid, Self.HttpTimeout)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private HttpTimeout As Integer = 5
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RepositoryRootUrl As String
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
			Name="AllowCertificateValidation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HTTPStatusCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
