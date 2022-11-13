#tag Class
Protected Class FileBasedPackageSource
Implements PackageSourceInterface
	#tag Method, Flags = &h0
		Sub Constructor(repositoryFolderPath as string)
		  self.RepositoryFolderPath = repositoryFolderPath
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadPackage(guid as string) As RepositoryPackage
		  // Part of the PackageSourceInterface interface.
		  
		  Raise New UnsupportedOperationException("Method is not implemented.")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadPackageCode(guid as string) As MemoryBlock
		  // Part of the PackageSourceInterface interface.
		  
		  Var f As FolderItem = Self.RepositoryFolder.Child(guid + kPackageCodeFileExt)
		  
		  If f <> Nil Then
		    
		    Var t As BinaryStream = BinaryStream.Open(f, False)
		    Var a As MemoryBlock = t.Read(f.Length)
		    t.Close
		    
		    Return a
		    
		  End If
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadPackages() As RepositoryPackage()
		  // Part of the PackageSourceInterface interface.
		  
		  Var packages() As RepositoryPackage
		  
		  If Self.RepositoryFolder.Exists Then
		    
		    For Each f As FolderItem In Self.RepositoryFolder.Children
		      If f.Name.EndsWith(kPackageJsonFileExt) Then
		        
		        Var rawJson As String = File.ReadAllText(f)
		        
		        Var package As New RepositoryPackage 
		        RepositoryPackage.FromJson(rawJson, package)
		        
		        If package.CreatedAt = Nil Then package.CreatedAt = f.ModificationDateTime
		        
		        packages.Add(package)
		        
		      End
		    Next
		    
		  End
		  
		  Return packages
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemovePackage(guid as string)
		  // Part of the PackageSourceInterface interface.
		  
		  Var codeFile As FolderItem = Self.RepositoryFolder.Child(guid + kPackageCodeFileExt)
		  If codeFile <> Nil And codeFile.Exists And Not codeFile.IsFolder Then
		    Var codeFileRemoved As FolderItem = Self.RepositoryFolder.Child(guid + kPackageCodeFileExt + "_removed")
		    codeFile.MoveTo(codeFileRemoved)
		  End
		  
		  Var jsonFile As FolderItem = Self.RepositoryFolder.Child(guid + kPackageJsonFileExt)
		  If jsonFile <> Nil And jsonFile.Exists And Not jsonFile.IsFolder Then
		    Var jsonFileRemoved As FolderItem = Self.RepositoryFolder.Child(guid + kPackageJsonFileExt + "_removed")
		    jsonFile.MoveTo(jsonFileRemoved)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SavePackage(package as RepositoryPackage, raw as MemoryBlock = nil)
		  // Part of the PackageSourceInterface interface.
		  
		  // save XOJO code to file
		  If raw <> Nil Then
		    Var f1 As FolderItem = Self.RepositoryFolder.Child(package.Guid + kPackageCodeFileExt)
		    Var t As BinaryStream = BinaryStream.Create(f1, True)
		    t.Write(raw)
		    t.Close
		  End
		  
		  // save package json to file 
		  Var f2 As FolderItem = Self.RepositoryFolder.Child(package.Guid + kPackageJsonFileExt)
		  Var data As String = package.ToJson
		  File.WriteAllText(f2, data)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  // FoldrItem pointing to the repository Directory
			  Var f As New FolderItem(RepositoryFolderPath, FolderItem.PathModes.Native)
			  
			  If Not f.Exists Then
			    f.CreateFolder()
			  End
			  
			  Return f
			End Get
		#tag EndGetter
		Private RepositoryFolder As FolderItem
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private RepositoryFolderPath As string
	#tag EndProperty


	#tag Constant, Name = kPackageCodeFileExt, Type = String, Dynamic = False, Default = \".code", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPackageJsonFileExt, Type = String, Dynamic = False, Default = \".json", Scope = Private
	#tag EndConstant


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
