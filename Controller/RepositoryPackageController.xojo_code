#tag Class
Protected Class RepositoryPackageController
	#tag Method, Flags = &h0
		Sub Constructor(repositoryFolderPath as string)
		  self.RepositoryFolderPath = repositoryFolderPath
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreatePackage(raw as MemoryBlock) As RepositoryPackage
		  // add a new package to the repository based from raw XOJO clipboard data
		  
		  Var data As String = raw
		  
		  // ensure data is a XOJO code
		  If Not data.BeginsWith("RbBF") Then
		    Raise New RuntimeException("No valid XOJO Module", 9001)
		  End
		  
		  Var package As RepositoryPackage = zCreatePackage(raw)
		  
		  Return package
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPackage(guid as string) As RepositoryPackage
		  For Each package As RepositoryPackage In Self.Packages
		    If package.Guid = guid Then
		      Return package
		    End
		  Next
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPackageCode(guid as string) As MemoryBlock
		  // read XOJO component from repository file
		  
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
		Sub ReadPackages()
		  Self.Packages.RemoveAll
		  
		  If Self.RepositoryFolder.Exists Then
		    
		    For Each f As FolderItem In Self.RepositoryFolder.Children
		      If f.Name.EndsWith(kPackageJsonFileExt) Then
		        
		        Var rawJson As String = File.ReadAllText(f)
		        
		        Var package As New RepositoryPackage 
		        RepositoryPackage.FromJson(rawJson, package)
		        
		        If package.CreatedAt = Nil Then package.CreatedAt = f.ModificationDateTime
		        
		        Self.Packages.Add(package)
		        
		      End
		    Next
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReadProjectPackages(projectFolder as Folderitem, projectPackages() as RepositoryPackage)
		  // get packages used by a given XOJO (text-file) project
		  
		  For Each item As FolderItem In projectFolder.Children
		    
		    If item.IsFolder Then
		      ReadProjectPackages(item, projectPackages)
		    End
		    
		    If item.Name.EndsWith(".xojo_code") Then
		      Var content As String = File.ReadAllText(item)
		      
		      If content.IndexOf("""@Guid"" = ") > 0 Then
		        Var projektPackage As RepositoryPackage = zCreatePackage(content)
		        
		        // found packages with a guid < 30 or > 36 might not be a valid package
		        If projektPackage.Guid.Length > 30 And projektPackage.Guid.Length < 37 Then
		          // package name was taken from (clipboard) module header and therefore here empty
		          projektPackage.Name = item.Name
		          projectPackages.Add(projektPackage)
		        End
		      End
		    End
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemovePackage(guid as string)
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
		Sub Save(package as RepositoryPackage, raw as MemoryBlock = nil)
		  
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

	#tag Method, Flags = &h21
		Private Function zCreatePackage(raw as MemoryBlock) As RepositoryPackage
		  // create a new RepositoryPackage from XOJO data
		  
		  Var parser As New XojoModuleParser(raw)
		  
		  Var package As New RepositoryPackage
		  
		  package.Name = parser.ModuleName
		  package.Guid = parser.AttribGuid
		  package.CreatedBy = parser.AttribAuthor
		  package.CreatedAt = DateTime.Now
		  package.Copyright = parser.AttribCopyright
		  package.RawDependencies = parser.AttribDepends
		  package.Version = parser.AttribVersion
		  package.Description = parser.AttribDescription
		  package.Category = parser.AttribCategory
		  
		  Return package
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Packages() As RepositoryPackage
	#tag EndProperty

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


	#tag Constant, Name = ClipXojoClass, Type = String, Dynamic = False, Default = \"CbCl", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ClipXojoModule, Type = String, Dynamic = False, Default = \"CbMt", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPackageCodeFileExt, Type = String, Dynamic = False, Default = \".code", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kPackageJsonFileExt, Type = String, Dynamic = False, Default = \".json", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kRepositoryPath, Type = String, Dynamic = False, Default = \"/Users/stefan/Projekte/Repository", Scope = Private
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
